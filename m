Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB6F9D6A20
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 17:28:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5558510E47C;
	Sat, 23 Nov 2024 16:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QxYZQjuk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1211D10E47C
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 16:28:36 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53a007743e7so3503419e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 08:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732379314; x=1732984114; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=h/Pl08QUPuKL5fWRHLnSBBIgiCofcCWFTEDw/7LzjT8=;
 b=QxYZQjukR2fS1we+owDC9WuinupIzfeS6vf2PrVk6PpGVjlL44tZ9vmXy6z8JXPwlf
 bZ30h0YWIJd+rzbW8KxDJy8lblexsq2aWYXDqSE2WgN+B7SPLnZ5Cag2YzlgTgwZ2cFx
 PDjvO/zgiBXa8GRPB/WsXmqZXH3z4P8vi5MV+yYRTcvDTHy6evYhsE2HWzVA80Ph8njE
 975ZOadWG3ceUxCrhcVyqnz+ZfSpY1mqHocQX684LddzQTYtc1ek+dO7XKCdy+ZMf9IN
 BJ5j13voY0XyqMLhBxbaX+fR5qgm1N4DvZo/UeBbKJ2YyL9HSmcvDRjttCL5GQNCg2DM
 rlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732379314; x=1732984114;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h/Pl08QUPuKL5fWRHLnSBBIgiCofcCWFTEDw/7LzjT8=;
 b=qPmzf0Hv5SQ9LvMxO6JkVky2xueA2gnxY7zreS+fOmt6nUeSSpF/uVYvCYqx71HIsW
 szTl89Wnc+Ne41YBBwHcaI7z+srW8MhQpoj//VHK3V7m3EydwGevCfZGfN2l/lGjN4vt
 38+Xa9CkPaTq9pUFQb4NAeBvOsF3eChwZkvLLZ3UTGzwhJZd6mqp2BuXnAd4I82wh7AA
 q+kcWIRRYJw1H11YWEjfQro5WtulQgUD1Y758PZybjKHkmfEQW3E3ZvIq2AI7n3Ow4Bs
 KNr77ewBLP266V3DQFyRbIMLv8X2AFeevqXGSvzlMkkNrffVrnn7XAixvXGB/Ns+yk4X
 CJgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjrqXPvBB9JIx2ETRVdwovh7XWjR5O0cJchakx0+uyewz4WdInlOsXCJAEQYXU0NSO6kYE4r/4X6w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMjoI12RElzErcZXaz7szbiuxBhZ7MZtO7ld+gHqt4yKDz+/2+
 D6gO0Kh5qT5JfPpeGUWyQ7orUMPaZnPdASV9veB69r0TLB3A4N5qPxp/qnEiU10=
X-Gm-Gg: ASbGncvG8LoWxwSV27tYByu+zaDgmrmhu0ERh13XVxBMYU5F225etyGk/lY2fqKzvak
 wU/pynfksy9/cD0KQh6ZuWEEsW9EiU+tTVSxQ+yRzQuUwkheVwvnbSwX/6nJs+/WMG/IQDx3mqr
 Ncw3SeRwgx2u8h7ldQ0AOxxgZA2217AB6+Dw5mMZCS8te29faKIthH+DNuzDYpcFATFsk76pUhH
 +VxwM9774ChS7nYD/fGpBlWjVycO29jqRkmIuemO4DebpzU3D0BeSlMNGW0YB5MvfBizithE2es
 IJ2z4x+KaQtsbYmdReDHM/YFIvLFoQ==
X-Google-Smtp-Source: AGHT+IFvAsLUXPoRNkWhRpJryldr2ECx/WRa6OPlTabGGwJsNBFlz2rBkajwmVrME7jHv4HZvi5yzA==
X-Received: by 2002:a05:6512:a90:b0:539:f8c7:4211 with SMTP id
 2adb3069b0e04-53dd37a5c34mr3004585e87.26.1732379314192; 
 Sat, 23 Nov 2024 08:28:34 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2497f04sm963206e87.254.2024.11.23.08.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Nov 2024 08:28:32 -0800 (PST)
Date: Sat, 23 Nov 2024 18:28:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, kraxel@redhat.com, dri-devel@lists.freedesktop.org, 
 virtualization@lists.linux.dev
Subject: Re: [PATCH 1/2] drm/cirrus: Use virtual encoder and connector types
Message-ID: <y74662j6zqvocvpa3zbig5owhqu2o43xdrwkeswgwd5mak2cx7@esgliauvzkh5>
References: <20241029143928.208349-1-tzimmermann@suse.de>
 <20241029143928.208349-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029143928.208349-2-tzimmermann@suse.de>
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

On Tue, Oct 29, 2024 at 03:34:23PM +0100, Thomas Zimmermann wrote:
> The cirrus driver only works on emulated Cirrus hardware. Use the
> correct types for encoder and connector.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tiny/cirrus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
> index f06a2be71f60..0231bdf94b8a 100644
> --- a/drivers/gpu/drm/tiny/cirrus.c
> +++ b/drivers/gpu/drm/tiny/cirrus.c
> @@ -587,14 +587,14 @@ static int cirrus_pipe_init(struct cirrus_device *cirrus)
>  
>  	encoder = &cirrus->encoder;
>  	ret = drm_encoder_init(dev, encoder, &cirrus_encoder_funcs,
> -			       DRM_MODE_ENCODER_DAC, NULL);
> +			       DRM_MODE_ENCODER_VIRTUAL, NULL);
>  	if (ret)
>  		return ret;
>  	encoder->possible_crtcs = drm_crtc_mask(crtc);
>  
>  	connector = &cirrus->connector;
>  	ret = drm_connector_init(dev, connector, &cirrus_connector_funcs,
> -				 DRM_MODE_CONNECTOR_VGA);
> +				 DRM_MODE_CONNECTOR_VIRTUAL);

This will also remove the EDID property from this connector. I'm not
sore if that is an expected behaviour or not.

>  	if (ret)
>  		return ret;
>  	drm_connector_helper_add(connector, &cirrus_connector_helper_funcs);
> -- 
> 2.46.0
> 

-- 
With best wishes
Dmitry
