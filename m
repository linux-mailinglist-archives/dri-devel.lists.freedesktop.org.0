Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B13118D7FA4
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 12:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEFC10E354;
	Mon,  3 Jun 2024 10:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="T5Ei/x68";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A456610E0BB
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 10:04:49 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52b912198f1so2590641e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2024 03:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717409087; x=1718013887; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Wigpiq3UYcvYdqkrQhN7qI4WVcDObAutfXNLBLWz1Qs=;
 b=T5Ei/x68foLuk3OST+CXcdRdLiFFW2JG5elO35gyf21X57pPsS7ZAHopCMgETYKy3a
 c9WVT0cg7Jhzmct6mGLxE41DG+Ou5TI5mkgXT9yuvY+VDEER5G9SSUGyxOrjLTiGjH16
 zBrkIfQSjyFIYVNlzs3DqqOqJPg9qbLWqsNuEtxGWHYBQe6ch1Zti34BFJDzjdYC3uCG
 h81HzpXhOH5sJArZCMo2tXV95iwj5SxDnZoby4zHl1LGHgb7iuU1An36+76gb8tXHxr5
 4FCLwnK5CkirC9AsCNoqxZa7l6C2xKvbCApzz7tGFkRevo2ChmWc+2BdOWOUXT/W0n4T
 BBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717409087; x=1718013887;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wigpiq3UYcvYdqkrQhN7qI4WVcDObAutfXNLBLWz1Qs=;
 b=SbDVCivEJ2Sgts0i+e/3xTu9k0CaPWieDtNJcnJD+Uys+ASdyTQSLLSNmZSM68pI72
 gB+fqnzJQR99PHKh271m94mZUXQbGM8PqIkGYALOJlG3BXukGwWbxbxaRTo1Dxv3pq/A
 Xosol5Acxst5Cjy3rHwyGJVnLxS5XoaArDNW9coDKI8gYF3Ev5J2D4HGaezdJRpjAOMB
 tRMVJPPUMTCA0/RcW/FJPdzGpLjGFxLznmcMn0jHPxY2FI0zS4oRp8jqoNAX6AMk9Yef
 1CWyVjkBxt1WzQW3UEZYSMQ90UzVgLqvbGKnEsJJXw0IVmFT93B6xzDavV2wbhkwDQy2
 2F1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlY2OFtH2pQRknVmSr+Xse/GLAERT90RLDnBBxfkV8ZhSsczlflpHEexQDRIF5xDhlMAj7I3oBsSSSQT1rwzT1vb9cOUQGL6o4RtmG2cTC
X-Gm-Message-State: AOJu0YySzByrmpmoe4ICG8+rELJJE49B+Jv8wf3PWiGUBAS9Yr+YbYr7
 jWSZCE8fFEkY5LDJ78mDi+frd2w+DF4Qq1kv7SDu+KLyIyBUIj+gOAhAlueEBYs=
X-Google-Smtp-Source: AGHT+IF5KnG1FbQl2ZMSS1dblXe8W7iYWQvh17DRwDMEgS5aDyUVIouCkrUQXkbLDkWxPZaBVQnv9g==
X-Received: by 2002:a05:6512:239f:b0:52b:9037:996d with SMTP id
 2adb3069b0e04-52b90379aafmr4283607e87.46.1717409087167; 
 Mon, 03 Jun 2024 03:04:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b92e66010sm666446e87.102.2024.06.03.03.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 03:04:46 -0700 (PDT)
Date: Mon, 3 Jun 2024 13:04:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/9] drm/connector: hdmi: accept NULL for Audio
 Infoframe
Message-ID: <th7i4ugpnbifmthtam7p5nmtclygx6asvzzyibzl2oxdsxxnmj@rd7dujgjxzuv>
References: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
 <20240531-bridge-hdmi-connector-v4-1-5110f7943622@linaro.org>
 <20240603-therapeutic-warm-fox-890bee@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603-therapeutic-warm-fox-890bee@houat>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 03, 2024 at 11:09:40AM +0200, Maxime Ripard wrote:
> Hi,
> 
> Sorry for not answering your mail on the previous version sooner.
> 
> On Fri, May 31, 2024 at 11:07:24PM GMT, Dmitry Baryshkov wrote:
> > Allow passing NULL as audio infoframe as a way to disable Audio
> > Infoframe generation.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > index ce96837eea65..5356723d21f5 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > @@ -681,7 +681,7 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update_infoframes);
> >  /**
> >   * drm_atomic_helper_connector_hdmi_update_audio_infoframe - Update the Audio Infoframe
> >   * @connector: A pointer to the HDMI connector
> > - * @frame: A pointer to the audio infoframe to write
> > + * @frame: A pointer to the audio infoframe to write or NULL to disable sending the frame
> 
> I'm still two-minded about this. I think I would like a separate helper
> better, to also make things consistent with the HDMI helpers.
> 
> Most importantly, it looks like you're not using it at all in your series?

It should have been a part of msm_hdmi_audio_disable(), but it seems
with all the refactorings I forgot to use it. I'll check again the
behaviour and either drop this patch or add a separate helper and fix
other comments below.

> 
> >   * This function is meant for HDMI connector drivers to update their
> >   * audio infoframe. It will typically be used in one of the ALSA hooks
> > @@ -704,10 +704,16 @@ drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *co
> >  
> >  	mutex_lock(&connector->hdmi.infoframes.lock);
> >  
> > -	memcpy(&infoframe->data, frame, sizeof(infoframe->data));
> > -	infoframe->set = true;
> > +	if (frame) {
> > +		memcpy(&infoframe->data, frame, sizeof(infoframe->data));
> > +		infoframe->set = true;
> > +
> > +		ret = write_infoframe(connector, infoframe);
> > +	} else {
> > +		infoframe->set = false;
> >  
> > -	ret = write_infoframe(connector, infoframe);
> > +		ret = clear_infoframe(connector, infoframe);
> > +	}
> 
> We should probably clear infoframe->data here too


-- 
With best wishes
Dmitry
