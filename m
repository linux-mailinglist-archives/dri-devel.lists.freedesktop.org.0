Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEC08D4A59
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 13:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3731810E2DC;
	Thu, 30 May 2024 11:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hYytxYCu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE44210E14C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 11:20:37 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2e72b8931caso7625101fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 04:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717068036; x=1717672836; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rulONiQoav/noPYiRK55pYebl0MVPgGh8k52ODEZHNw=;
 b=hYytxYCuYNBR4WIA67Rac6pBpW74R+YgZWAc9L4YbaBHWRJwR3x3CxaHTj3kdUaKrM
 qOq4aa/CxbXQujFTIdlpgb0xCu/wPqUZWXtuZWvl550B4LgZG6w7u6bPwZ2M156irMjL
 ePhi8vWgE0f4A3NO7aO1g8mEwZ2w6bUIKPLiIflBr+lTUbdZess8TSqprN0erV1yXHqY
 LKJ3hvk2fpJOk3+DnVqXUyQdh/UY58A5kct4i5XeRHOw1jZIrIs8ohVjTs/mUMnOYxj+
 NhX/vo3G5fE+gbeDm99sj5Q3LaKPbQMrz8WYcFV0ZWVqhPKZYFJljjQ8lVOZpkVtDda8
 P7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717068036; x=1717672836;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rulONiQoav/noPYiRK55pYebl0MVPgGh8k52ODEZHNw=;
 b=P+9Vo3lhXbpnN+fLXStTEakZsJzX2VemEaU80SJVXKX2UcvEnSgihzqI3Lre0dRFSY
 myphrD2VHuvCuZ5/f+E3oWs3kijixQh5uZYSRTaxWTXPwUH4bkPWnOuX9JhNnBWkK4A6
 SdtZJB1AMP16+iYa6N87sbwjPqOs6XzNu7ZxlLOO3AJOu6uY46nlOiY8zMtNmqZ3Qvw9
 vBIctI22yF6XcN8Xs7yoODM4rQ+JAo8VkkH0zPokGP5DUC8TrjQ9vd1MOm6NBYpNlrP4
 3sbh9nszl7KZ9waNXHBIIbx4H2N5SjDB5az5Ybo7QspuxcJ6j6LLrcQyS2mT+wNgKtfy
 Pisw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUVlMyI9qYseh+ZDdms945OKiq1ZQ4MJglpYdrUdEFNcIf7qCe0mxxVSyBzw5uQTqaG5j7OLQ4KU5+HK+Ij+XJOW7JCQRUCFmUuoQCfzBj
X-Gm-Message-State: AOJu0YwGJPcu9A1ryM0LVLjZDgdB2PYppcC1I7f2Gude7u2UzC5f1Mo4
 jf5Zx2nxGg679ikWIhy9lg+i77NqkbfjsVz6y66EenGEwgq/B5sjjgoLgeYFdU4=
X-Google-Smtp-Source: AGHT+IFKZF4N8Gaqyd1NA4+/cjvYzmxlJlkCP6xgeWDgb3mfAWPu5ONVzcWK5zonfx7QezemOPbnMg==
X-Received: by 2002:a2e:97d5:0:b0:2e9:8497:46ce with SMTP id
 38308e7fff4ca-2ea84838dcdmr9311271fa.46.1717068035552; 
 Thu, 30 May 2024 04:20:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95bce9d5dsm28208901fa.48.2024.05.30.04.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 04:20:35 -0700 (PDT)
Date: Thu, 30 May 2024 14:20:33 +0300
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
Subject: Re: [PATCH v3 1/7] drm/connector: hdmi: accept NULL for Audio
 Infoframe
Message-ID: <p4vkqqvfh4kdeq3lqfvyokdflaxodj4xv6ozawettewpaedfvg@6dcktfprvazy>
References: <20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org>
 <20240530-bridge-hdmi-connector-v3-1-a1d184d68fe3@linaro.org>
 <20240530-daffy-satisfied-sheep-5b9e16@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530-daffy-satisfied-sheep-5b9e16@houat>
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

On Thu, May 30, 2024 at 10:49:26AM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Thu, May 30, 2024 at 02:12:24AM GMT, Dmitry Baryshkov wrote:
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
> >   *
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
> I'm not entirely sure your commit matches your commit log? It looks like
> you follow the same pattern than the other infoframes and call
> write_infoframe if there's one, or clear_infoframe if there isn't.
> 
> So we're never passing NULL to disable? clear_infoframe is called.

This function is being called from the driver, so I want to be able to
call drm_atomic_helper_connector_hdmi_update_audio_infoframe(connector,
NULL) in order to disable sending of the Audio InfoFrame.

-- 
With best wishes
Dmitry
