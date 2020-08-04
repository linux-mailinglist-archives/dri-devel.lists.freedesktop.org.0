Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 230EF23B805
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 11:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE8989FED;
	Tue,  4 Aug 2020 09:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BF889FED
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 09:45:25 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f7so36790177wrw.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 02:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Aa7VVdyEni9wAFzcQCj6JNuzLNgvf7VU+8VoyxNCeQ4=;
 b=Tsvfnioc4NnsCiVvcAG8U5QMwBgBMd6TRipg2Q8rXLUOB+z+WcCYc3E4IEshRhqVde
 O3+otomwZfcsIfr1RZ4tlk8Rzj/V3RBC0pwwRMNhBQuQI3W2mrsQy+pYLI6D8Dx8F4D1
 GQL4Ek0yEd2XJ/U82EDcWHH6DfUu3sSEiYccU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Aa7VVdyEni9wAFzcQCj6JNuzLNgvf7VU+8VoyxNCeQ4=;
 b=IgOORczMRSdjPZSvUeBVBc4kH2Y25wfjV7jUiNFHflLOUJBaW2nosKP/QT0TXNHy1q
 UE+tC+TNdBLOInZuIesNsUpcwQDfZynR+x6EvukqkGZaWJZVhNYWqEGJVRjunnTAtvW9
 CU7jLUgbYea+pJ+fe637hEnku2jCbl53DDQZGXO7lwUcdmexmjXCAeRoFpJ7y4x+ltdm
 3HE4td8FFh+Zei5FYrlSTmA2GYQbbr+ih7pnXt9Xya5df917s9NLoa8+DpQi0yK+wj2M
 L2usgbZYT/y1WZjRRgDPiq/cqiFhrVm/xTAc59lBmrQcaq+TEIZnq/vMm6c7IBeT/7ml
 4uEQ==
X-Gm-Message-State: AOAM532KKB865f4ygipSKzBAPoIGY65n1RVG+uUn1ea5swphvsyY8jfR
 wfVhx8LT6MCsdgFvmryY6EPVQg==
X-Google-Smtp-Source: ABdhPJwYwHyBQ7mf38rtXTdJ1gIQi5IAivYQvdugHIExNMVDF3cOA4jjIPSGbThfkZJx70btbKKDhg==
X-Received: by 2002:adf:ea85:: with SMTP id s5mr20213577wrm.55.1596534324227; 
 Tue, 04 Aug 2020 02:45:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j4sm3738777wmi.48.2020.08.04.02.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 02:45:22 -0700 (PDT)
Date: Tue, 4 Aug 2020 11:45:21 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH] drm: Added orientation quirk for ASUS tablet model T103HAF
Message-ID: <20200804094521.GJ6419@phenom.ffwll.local>
References: <20200801123445.1514567-1-themariusus@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200801123445.1514567-1-themariusus@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 01, 2020 at 03:34:46PM +0300, Marius Iacob wrote:
> Signed-off-by: Marius Iacob <themariusus@gmail.com>

Queued up for the 5.9 merge window. I also added cc: stable.
-Daniel

> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index d00ea384dcbf..58f5dc2f6dd5 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -121,6 +121,12 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T101HA"),
>  		},
>  		.driver_data = (void *)&lcd800x1280_rightside_up,
> +	}, {	/* Asus T103HAF */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T103HAF"),
> +		},
> +		.driver_data = (void *)&lcd800x1280_rightside_up,
>  	}, {	/* GPD MicroPC (generic strings, also match on bios date) */
>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Default string"),
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
