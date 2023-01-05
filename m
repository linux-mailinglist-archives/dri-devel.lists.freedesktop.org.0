Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B111965EEE3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 15:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDFD10E73F;
	Thu,  5 Jan 2023 14:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCE210E73F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 14:38:42 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id co23so36357063wrb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 06:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wVtkjpd1m5CHpqjkgjmo86bTVFs9jvutUQ4eD41Hm9g=;
 b=NzuwNKy8Ow+MANdie+j+x4B9s960DR90E2MnehzGKe3PurQC2DCydzdAIfUDqpGSs8
 ghkY3BWq8N1OxbwBNA0l5jg0cEfOf2IlVy/KNJ8Ymdmcjm4uM5AvP8Gv3Ad+TXbu+f9n
 xBDs16qMuOMcjOle134JGGRL6rO19cf8k4xXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wVtkjpd1m5CHpqjkgjmo86bTVFs9jvutUQ4eD41Hm9g=;
 b=ChER/jUpIFdVNM1eb5xBCBoVJfucfatDBYrNEUyv9BczO1jNSJLs+WL8u7Dg5f27v7
 qitpm9V1B6WrOYh27Z/IxuFgnThG+e1EdbYpVmRLkZG293EQEud3yBt7VaxEOQRkPeR2
 T5X4DLc4WPTk7wDTbXVefQGQOQjFw3q7lgGpG/C5HUBLEJO8K+beuJpgrH8rz4UcZ+Aj
 Et6Q9sVia+IV/RGDAvZlxNRk/e6+o6g0FIeaevaWMClhUx3RyUQ2zXUjbUqd1a/vAz+y
 Rk1khFHoYSeeGsEeHirxrrxQNY2LG61YaeVl2hh6rLQMg28csmxvZ/JNit+f5D7Rabah
 Eq6w==
X-Gm-Message-State: AFqh2koJQXssGdCfmj8Ie2qUXH9KQS8TxM7D1FeaNsN6PDQdhvABplCI
 nmY5NkJ2nARhCCfnhzfonJwB8g==
X-Google-Smtp-Source: AMrXdXuSsMZhhd80+6OXhv75jCIyGLpgvyQQ+TVLgcPbSzqYqBhxo3s87MG+XFl/BzyUXYOexu5Z8Q==
X-Received: by 2002:a05:6000:5c9:b0:2b0:bc05:b463 with SMTP id
 bh9-20020a05600005c900b002b0bc05b463mr1943816wrb.7.1672929520678; 
 Thu, 05 Jan 2023 06:38:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c314f00b003d99469ece1sm2845649wmo.24.2023.01.05.06.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:38:39 -0800 (PST)
Date: Thu, 5 Jan 2023 15:38:37 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Patrick Thompson <ptf@google.com>
Subject: Re: [PATCH] drm: Add orientation quirk for Lenovo ideapad D330-10IGL
Message-ID: <Y7bg7WQs0OtMLmAW@phenom.ffwll.local>
Mail-Followup-To: Patrick Thompson <ptf@google.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221220205826.178008-1-ptf@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221220205826.178008-1-ptf@google.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 20, 2022 at 03:58:26PM -0500, Patrick Thompson wrote:
> Panel is 800x1280 but mounted on a detachable form factor sideways.
> 
> Signed-off-by: Patrick Thompson <ptf@google.com>

Applied to drm-misc-fixes, thanks for your patch.
-Daniel

> ---
> 
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 52d8800a8ab86..3659f0465a724 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -304,6 +304,12 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGM"),
>  		},
>  		.driver_data = (void *)&lcd1200x1920_rightside_up,
> +	}, {	/* Lenovo Ideapad D330-10IGL (HD) */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGL"),
> +		},
> +		.driver_data = (void *)&lcd800x1280_rightside_up,
>  	}, {	/* Lenovo Yoga Book X90F / X91F / X91L */
>  		.matches = {
>  		  /* Non exact match to match all versions */
> -- 
> 2.39.0.314.g84b9a713c41-goog
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
