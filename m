Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4F447BC92
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 10:10:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3C610EA11;
	Tue, 21 Dec 2021 09:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3CF10E29D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 19:50:29 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so195694pjj.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 11:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=omKEumi0/sMUkgfeE+wVUPVvzgif1Rbc6lYFVM9Ereo=;
 b=WFEPFl7giFl5WW+J8eGbuaecw13OosUZpEnVjwmAIv0f0GrUmpe2I4cMqiNhCX2y+M
 fnLJSYSVI/MpVdRy0OJ4ii5qC6GfsHDdH/9AM6HYK5INFmMOyN95FVzobzntgaYmPuf9
 Fvxavs+g7o+dGGUB4hea2bSr4T/CkFJK4PcUBouh9OgEIeUO7KkqoWOIHuB3WJiXxh3A
 S3+s3qZR7Q8DMwcKgxOXsEky6EmOFulwtljyHxt2r1Sy0cnI4/+Mpk2UPhb7onqN6C6L
 xpj+WeSEQihVEJBHsOjO4+EgyaGKrbh848bupGwUyyQi7g9fmVLkXjjWNLG6Ll/KhKkY
 8nqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=omKEumi0/sMUkgfeE+wVUPVvzgif1Rbc6lYFVM9Ereo=;
 b=vxtUDhfgIfhSMbuNjbP68w2eS1OLy8JrDh2CZwn3TEUnlq7pBpAc9R03RnuKwuxWSV
 DUUFv4Yed8AHPLrAxbbRf5eWH5dmyqbNLiVfB7vZUK5ABPX1B5DbeBXRS4OO5JzjI6oe
 yKzgCtfQY3ARGtAnYB22LlvmJXAAcFiMStLFJTb97r1IFll/FXIEs465T0kGDwZUY4HR
 ZoNRUXpzqrqwpuRM9e/O7hlkQdnZRp+0tU2+SWYdKPOE1VoJBnHPYuCTkuu8/BQxTcb6
 L+9Kxh04ujPtA3tRRTpdAggCjLZrMAcFCWBvWtpTYkLJRvZ3TMLMqFPLXoj6nmfc0EL0
 5mLA==
X-Gm-Message-State: AOAM5331RFK0P+tX+HgxvDCyCz4gYgf3HNFlO9818aN59zeXIvHdXVQh
 DupPxu7KvES6KTqRf4qTK88=
X-Google-Smtp-Source: ABdhPJy/mPgkfT3mRFUEuhymyrtCUZdWxuGjUuiyRrndhASUC0JLvGsa4Xa69qvSHb0zGdkwMZABsw==
X-Received: by 2002:a17:90a:e7c6:: with SMTP id
 kb6mr626149pjb.61.1640029829357; 
 Mon, 20 Dec 2021 11:50:29 -0800 (PST)
Received: from google.com ([2620:15c:202:201:9632:a1c4:968a:6f66])
 by smtp.gmail.com with ESMTPSA id kb1sm185294pjb.56.2021.12.20.11.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 11:50:28 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
X-Google-Original-From: Dmitry Torokhov <dtor@google.com>
Date: Mon, 20 Dec 2021 11:50:25 -0800
To: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH v2 2/2] drm/privacy_screen_x86: Add entry for ChromeOS
 privacy-screen
Message-ID: <YcDegV8wqljpU3J0@google.com>
References: <20211217202850.1967594-1-rajatja@google.com>
 <20211217202850.1967594-2-rajatja@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217202850.1967594-2-rajatja@google.com>
X-Mailman-Approved-At: Tue, 21 Dec 2021 09:09:51 +0000
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
Cc: gwendal@google.com, Thomas Zimmermann <tzimmermann@suse.de>,
 seanpaul@google.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 rajatxjain@gmail.com, dri-devel@lists.freedesktop.org, marcheau@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 17, 2021 at 12:28:50PM -0800, Rajat Jain wrote:
> Add a static entry in the x86 table, to detect and wait for
> privacy-screen on some ChromeOS platforms.
> 
> Please note that this means that if CONFIG_CHROMEOS_PRIVACY_SCREEN is
> enabled, and if "GOOG0010" device is found in ACPI, then the i915 probe
> shall return EPROBE_DEFER until a platform driver actually registers the
> privacy-screen: https://hansdegoede.livejournal.com/25948.html
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>
> ---
> v2: * Use #if instead of #elif
>     * Reorder the patches in the series.
>     * Rebased on drm-tip
> 
>  drivers/gpu/drm/drm_privacy_screen_x86.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_privacy_screen_x86.c b/drivers/gpu/drm/drm_privacy_screen_x86.c
> index a2cafb294ca6..0c5699ad70a3 100644
> --- a/drivers/gpu/drm/drm_privacy_screen_x86.c
> +++ b/drivers/gpu/drm/drm_privacy_screen_x86.c
> @@ -47,6 +47,18 @@ static bool __init detect_thinkpad_privacy_screen(void)
>  }
>  #endif
>  
> +#if IS_ENABLED(CONFIG_CHROMEOS_PRIVACY_SCREEN)
> +static bool __init detect_chromeos_privacy_screen(void)

Does marking this __init work in case there is a deferral? Can it happen
that privacy screen is a module and so will get loaded only after we
discarded __init sections.

> +{
> +	if (!acpi_dev_present("GOOG0010", NULL, -1))
> +		return false;
> +
> +	pr_info("%s: Need to wait for ChromeOS privacy-screen drvr", __func__);

I still do not see how this message is helpful. If it is really desired,
I'd put something into the code that calls into lookups.

> +	return true;
> +
> +}
> +#endif
> +
>  static const struct arch_init_data arch_init_data[] __initconst = {
>  #if IS_ENABLED(CONFIG_THINKPAD_ACPI)
>  	{
> @@ -58,6 +70,16 @@ static const struct arch_init_data arch_init_data[] __initconst = {
>  		.detect = detect_thinkpad_privacy_screen,
>  	},
>  #endif
> +#if IS_ENABLED(CONFIG_CHROMEOS_PRIVACY_SCREEN)
> +	{
> +		.lookup = {
> +			.dev_id = NULL,
> +			.con_id = NULL,
> +			.provider = "privacy_screen-GOOG0010:00",
> +		},
> +		.detect = detect_chromeos_privacy_screen,
> +	},
> +#endif
>  };
>  
>  void __init drm_privacy_screen_lookup_init(void)
> -- 
> 2.34.1.307.g9b7440fafd-goog
> 

Thanks.

-- 
Dmitry
