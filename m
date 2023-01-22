Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 892D86770D0
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 17:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D6A10E11A;
	Sun, 22 Jan 2023 16:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C8D10E11A
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 16:53:34 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id j1so4674778iob.6
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 08:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eOOpS877RbdMk9+2ubqEo2V/9WGV2dh88ER6QWnCNlg=;
 b=cnc5Qs0w/DIvnCz8gTNZxM6X57omamoi955rvAG3CtFtJeX2cT+dnvqkN+7Xus2Q4c
 s2qxzQO46fr1gA+uRdQSA13CzzgxLJ0a7YEQ3r7wvURAVb2KoHmW3IFupl+9fvSCirlI
 Jq8HMZHvBq4lvD+1LNhXqcyZvcvn3+rHfDy12EoXfsijMtND/rVR0UEeVBxICFWeareC
 UWDzRwYbSOP9VV6Y/bCmFXUv8izM3d6/Coxh9S4RzOgHkhvyfdGerdXkdDYkTh0WKxYF
 q6XRrslKWZ1mHkUYFtl4b140S23dcsGcg9ytcn1uVUBP4GMlnWhCTs+K0mUbdAU10BM4
 k6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eOOpS877RbdMk9+2ubqEo2V/9WGV2dh88ER6QWnCNlg=;
 b=RxyV01Swo4BfFYr+ySUtLluMgb5aRExNvZMVoI7GfsgD0dM01qIpw2WrT0o4yf3T4z
 BVRQNLzdU6n78IriYvQ6ux6+aoXLkdhqAm3v8QlXwip3NZWJXPuyF7tjA8oi82xTkk3h
 4GqMdoEjpGB267gF2C3Raz0e5GPxDVpVTnsJUnAqIi5rW3TMBhIc0lr/O0tkQOlj//r2
 Wh/TvB7/4YvUiAHRXfGRR4b/6zqJqonK/03KOGVK6Of175/sz8uO3O+JJtS3ruMAJ8mU
 rbX1qZt6xgffwtZAA4XFRGUR229f9bf6sO1xXMomoTNtDe8UXH4KiAw/3zTFBEiGxZGY
 Ru0w==
X-Gm-Message-State: AFqh2kpS13HI+BfLZR6DHxxUD2S+kCZQR6cDfSudToXZxXKvqsD8C/ym
 OT36bWmdVDI9UI4XGKFQlrM=
X-Google-Smtp-Source: AMrXdXvjVsBryuY5uffw2HQNjOTKrgAe5dY1Ufl78re2BxE1nBEkaqrToGy6dA7Qx+mrhm/aXVP46w==
X-Received: by 2002:a6b:f012:0:b0:704:5d40:dfbf with SMTP id
 w18-20020a6bf012000000b007045d40dfbfmr15589897ioc.1.1674406413503; 
 Sun, 22 Jan 2023 08:53:33 -0800 (PST)
Received: from [192.168.75.211] ([173.23.87.62])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a056638228d00b003a0565a5750sm9829265jas.119.2023.01.22.08.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jan 2023 08:53:33 -0800 (PST)
Message-ID: <3b323793-2e98-216c-d84f-97187feb4b72@gmail.com>
Date: Sun, 22 Jan 2023 10:53:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirks for One XPlayer
 handheld variants
Content-Language: en-US
To: maarten.lankhorst@linux.intel.com
References: <20221213171044.14869-1-ruinairas1992@gmail.com>
From: Matthew Anderson <ruinairas1992@gmail.com>
In-Reply-To: <20221213171044.14869-1-ruinairas1992@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'm just following up to see where things are standing for this patch. 
I've seen other orientation patches make it's way to the kernel and am 
wondering if there is something I need to do on my end.

On 12/13/22 11:10 AM, Matthew Anderson wrote:
> We have more handhelds in the One XPLAYER lineup now that needs support added to the orientation-quirks.
> By adding more native resolution checks and the one unique BIOS variant available we add support to most devices.
>
> Signed-off-by: Matthew Anderson <ruinairas1992@gmail.com>
> ---
>   .../gpu/drm/drm_panel_orientation_quirks.c    | 30 +++++++++++++++++++
>   1 file changed, 30 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 52d8800a8ab8..335d636e6696 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -103,6 +103,12 @@ static const struct drm_dmi_panel_orientation_data lcd800x1280_rightside_up = {
>   	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
>   };
>   
> +static const struct drm_dmi_panel_orientation_data lcd800x1280_leftside_up = {
> +	.width = 800,
> +	.height = 1280,
> +	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
> +};
> +
>   static const struct drm_dmi_panel_orientation_data lcd1080x1920_leftside_up = {
>   	.width = 1080,
>   	.height = 1920,
> @@ -115,6 +121,12 @@ static const struct drm_dmi_panel_orientation_data lcd1200x1920_rightside_up = {
>   	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
>   };
>   
> +static const struct drm_dmi_panel_orientation_data lcd1200x1920_leftside_up = {
> +	.width = 1200,
> +	.height = 1920,
> +	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
> +};
> +
>   static const struct drm_dmi_panel_orientation_data lcd1280x1920_rightside_up = {
>   	.width = 1280,
>   	.height = 1920,
> @@ -344,6 +356,24 @@ static const struct dmi_system_id orientation_data[] = {
>   		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
>   		},
>   		.driver_data = (void *)&lcd1600x2560_leftside_up,
> +	}, {	/* OneXPlayer Mini 800p */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK TECHNOLOGY CO., LTD."),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
> +		},
> +		.driver_data = (void *)&lcd800x1280_leftside_up,
> +	}, {	/* OneXPlayer Mini 1200p */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK TECHNOLOGY CO., LTD."),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
> +		},
> +		.driver_data = (void *)&lcd1200x1920_leftside_up,
> +	}, {	/* OneXPlayer Mini A07 Bios Variant */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER mini A07"),
> +		},
> +		.driver_data = (void *)&lcd800x1280_leftside_up,
>   	}, {	/* Samsung GalaxyBook 10.6 */
>   		.matches = {
>   		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
