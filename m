Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3724A1A286
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 12:05:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F6310E7CD;
	Thu, 23 Jan 2025 11:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IixSMNUE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3607610E7CD
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 11:05:51 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5401ab97206so830019e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 03:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737630349; x=1738235149; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CFYMIx7gA2x2BXWR8sEBjoZP5q8qiqn+m17lbzTPceE=;
 b=IixSMNUE8aB6cTj7cyM6pfsgMoIMmCsx5t6daq0CAYEWDJEw3dNNa2f5Trxv/L7nZN
 l2YVI7aoev/urM0jmSWgVTBX/RIPFV9HBEIrGTOVLsfZmS0IYPhAzWiPKidx6bXHG4Ga
 m795nvxw+LAmEHCa2ZcBD2k74hWmdgjVvSccC7O5R0d/x9oZF11Elwdjrg4hJeAiAVjP
 th6N/qbWzbqGpggwtoaOmUDbugMgt/4veKUHQXNXFozcsyTRpXI8GbjF93+3vNM2aPiP
 RhNPXkr4akL7a1MWIKplbtOqWEHZYirTA2UPt9zOXCxtcDXKsLR0bYCEg38hJ/pjZkQQ
 gbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737630349; x=1738235149;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CFYMIx7gA2x2BXWR8sEBjoZP5q8qiqn+m17lbzTPceE=;
 b=p4sgSjte8kG9MlKPBGg86wu9XR9O+C0O4yA64LDLY5tDFFGDLHrfjhXn9LkZ3A7XLy
 BNacuJIES8zrIJOUp1Xdkl/aRZ/wsLFG+nfWZKqqGb5th3YXaF1G6LH+jrbZve3kTFfo
 tDZUFNdttepKiKpzfbwjd/jo8pH0awtZcx5Ohck687cg7WwRLfkpCENu2UB2dPgQ0yaF
 X6yk9nDU/83cG8fJI5nhwxlRVvuXq/dfgmDZP3zh7gaa519rhnzWQGl5QeNps5hp0tuX
 d98VvUxlaKzD3PlKE2hNTdPAvKdT6IMrxvdzFz3tK1yTmF0u82PfPVY4iniq/xGJ6UWm
 +bQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr34Qr36Lo2MDRr/ztS5G22F0psF1koKSoesETD8wN/I38ojrw1gvU46lGdm2mSGRXtcZsvETe+aA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzirEjY/N8fRsg1e9tuuGEo4U08FfWyd8OM/sdEk0/gOx/HxJjd
 uOgesnRNvHsl1RNZcX7BpSMeJq52y4gghKxFpRoG2ZHcVirCarj9lbVhtCIXYH0=
X-Gm-Gg: ASbGncusC5Qa3VpyQmHcVL3JfiAEH3Tl62qLwp70RMPy0h14bdnEJt76TDo5+APvnlg
 HyhFHG6RKerp6PWcjQd/zGCl2aONByYLShrDzqUzdHgslgqgjGMVo0LOu0cMicuMmGEsLX45yIY
 ZROCUP6OBFXWhRXVaGXeMlTPPQkfDZ9k8ZyAS8bwMQQURONwdNd52WyEj7NH9y93WWJnp6o3l44
 WtVKZZCSg9HBOL8CueYxoTAN+hdN0jf++cHiBqFOiTbxC8/GahD0A5rhb6ouTDOFtvQp6VX/AQ9
 ZeVzCCAeb5wSqP6LDjt84Qwsz+EMV7rQgqdJ3o9U/eIdT+QrAgtnDWa8ZKFx
X-Google-Smtp-Source: AGHT+IHOaMZIgrl/i9fQhU0VenZdqikom/uRDq5+HNRf0/hpwi1H0EDReWzRh+78eKvL8X05QKwEBA==
X-Received: by 2002:a05:6512:3e03:b0:540:1b53:d412 with SMTP id
 2adb3069b0e04-5439c28ac2dmr11408048e87.43.1737630349503; 
 Thu, 23 Jan 2025 03:05:49 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af66c36sm2609048e87.160.2025.01.23.03.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 03:05:49 -0800 (PST)
Date: Thu, 23 Jan 2025 13:05:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 4/7] drm/display: dp-aux-dev: use new DCPD access
 helpers
Message-ID: <7unkxysvdn57fp6t7sjmgqsiacg5grbrk4lp3fbfdvaht3hq4o@gqshn45sa5ww>
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
 <20250117-drm-rework-dpcd-access-v1-4-7fc020e04dbc@linaro.org>
 <87tt9pn8uu.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tt9pn8uu.fsf@intel.com>
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

On Thu, Jan 23, 2025 at 12:05:29PM +0200, Jani Nikula wrote:
> On Fri, 17 Jan 2025, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > Switch drm_dp_aux_dev.c to use new set of DPCD read / write helpers.
> 
> This might be one of the few places where the old functions and the old
> return value was used in a sensible manner.

Well... Yes and no. What does it mean if we return less bytes? Is that
still a protocol error?

> 
> BR,
> Jani.
> 
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_dp_aux_dev.c | 12 +++++-------
> >  1 file changed, 5 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_aux_dev.c b/drivers/gpu/drm/display/drm_dp_aux_dev.c
> > index 29555b9f03c8c42681c17c4a01e74a966cf8611f..a31ab3f41efb71fd5f936c24ba5c3b8ebea68a5e 100644
> > --- a/drivers/gpu/drm/display/drm_dp_aux_dev.c
> > +++ b/drivers/gpu/drm/display/drm_dp_aux_dev.c
> > @@ -163,17 +163,16 @@ static ssize_t auxdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
> >  			break;
> >  		}
> >  
> > -		res = drm_dp_dpcd_read(aux_dev->aux, pos, buf, todo);
> > -
> > +		res = drm_dp_dpcd_read_data(aux_dev->aux, pos, buf, todo);
> >  		if (res <= 0)
> >  			break;
> >  
> > -		if (copy_to_iter(buf, res, to) != res) {
> > +		if (copy_to_iter(buf, todo, to) != todo) {
> >  			res = -EFAULT;
> >  			break;
> >  		}
> >  
> > -		pos += res;
> > +		pos += todo;
> >  	}
> >  
> >  	if (pos != iocb->ki_pos)
> > @@ -211,12 +210,11 @@ static ssize_t auxdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
> >  			break;
> >  		}
> >  
> > -		res = drm_dp_dpcd_write(aux_dev->aux, pos, buf, todo);
> > -
> > +		res = drm_dp_dpcd_write_data(aux_dev->aux, pos, buf, todo);
> >  		if (res <= 0)
> >  			break;
> >  
> > -		pos += res;
> > +		pos += todo;
> >  	}
> >  
> >  	if (pos != iocb->ki_pos)
> 
> -- 
> Jani Nikula, Intel

-- 
With best wishes
Dmitry
