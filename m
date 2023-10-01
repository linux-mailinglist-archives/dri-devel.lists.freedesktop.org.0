Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 165617B4750
	for <lists+dri-devel@lfdr.de>; Sun,  1 Oct 2023 14:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD3C10E1E9;
	Sun,  1 Oct 2023 12:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7DB10E1E9
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Oct 2023 12:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696162909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FMGIU5POL9SiIEmaULx1wsxg5CFJY+OhYIdZTwEiDKI=;
 b=S4tvRu8xVNVM3fEfFs+4FOZaVHp0Vt2zz7DzhQGygEbVlUXYi8IZu3+yF0H8ey0KBxhhlT
 +fgAFbvzTFYWLAYa/qt0jGetW0NJ+JsKYrrEjIVk6naSkjWVvEbwNH+T01603YYjcdEwMm
 adqN3rY6IP7yo93efFrnQJohsnTYUmE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-bKkHNHi-N6CLs4ON9ZQ2DQ-1; Sun, 01 Oct 2023 08:21:48 -0400
X-MC-Unique: bKkHNHi-N6CLs4ON9ZQ2DQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9ae7663e604so1189998166b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Oct 2023 05:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696162907; x=1696767707;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FMGIU5POL9SiIEmaULx1wsxg5CFJY+OhYIdZTwEiDKI=;
 b=PC904FGJtKYkECqnbrfO2LD5l6v1cCLjCMV1PctIpa7IGbKs88ZgKutF9ANBowYGAj
 nZJN5BoKcFp1ODWX+K/77ToE16L6sEfakGaqZ+uNXUlYm1l6UWpuqMTJWVPz4RXLNkho
 kl/6PUaEobDA25xu5dM5vOwakb7sMJyb0qwFokaMyh4t226PWv/vIulIRZlzNT+8Otlo
 6Ei6Z/oyIOfWXWr4DZ0OY1kHEUNouzdcTEGLolLKTLfqGct9y3zCqWTHkpOakzPsOtO4
 4lml+uRFIkFcebSxDBf9pxFHRUA7P3RVzAtxJqrK+iwsSH9ytInDyKVU3Wd1aFxnVNQh
 mIbQ==
X-Gm-Message-State: AOJu0Yy/ECvRWoxKZRx4Xd1YsIxFezfd0fkIGesjzQMuW5pORZrJtKLl
 b7zRI+c7LiOB17UUgDCCH7YpVna7kWIGaHdD26O530S9ID9RuZ2onyQ/OcMz7uYLaWfVj0Y57dH
 smiCAUMPD7ZYKrYmAofetLALCtPjPB9JwElZO
X-Received: by 2002:a17:906:73d4:b0:9ae:5643:6493 with SMTP id
 n20-20020a17090673d400b009ae56436493mr6330468ejl.74.1696162906954; 
 Sun, 01 Oct 2023 05:21:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqk5FvPhXMKuwUIH3oorHan+zY0M1hjcx4uYv3u22n+nlM2d//AN1UZsjIYxvE8lc2RM8HMw==
X-Received: by 2002:a17:906:73d4:b0:9ae:5643:6493 with SMTP id
 n20-20020a17090673d400b009ae56436493mr6330460ejl.74.1696162906621; 
 Sun, 01 Oct 2023 05:21:46 -0700 (PDT)
Received: from [10.101.1.23] (ip-185-104-137-32.ptr.icomera.net.
 [185.104.137.32]) by smtp.gmail.com with ESMTPSA id
 k17-20020a170906681100b00992b50fbbe9sm15468711ejr.90.2023.10.01.05.21.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Oct 2023 05:21:46 -0700 (PDT)
Message-ID: <4a86bbd4-4798-b81b-8f08-b2c8c125999d@redhat.com>
Date: Sun, 1 Oct 2023 14:21:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm: panel-orientation-quirks: Add quirk for One Mix 2S
To: Kai Uwe Broulik <foss-linux@broulik.de>, linux-kernel@vger.kernel.org
References: <20231001114710.336172-1-foss-linux@broulik.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231001114710.336172-1-foss-linux@broulik.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/1/23 13:47, Kai Uwe Broulik wrote:
> The One Mix 2S is a mini laptop with a 1200x1920 portrait screen
> mounted in a landscape oriented clamshell case. Because of the too
> generic DMI strings this entry is also doing bios-date matching.
> 
> Signed-off-by: Kai Uwe Broulik <foss-linux@broulik.de>
> ---
> Changes since v1:
> * Got two more BIOS dates reported

Thanks, patch still looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

drm-misc maintainers, I'm currently traveling can
one of you push this to drm-misc-fixes please?

Regards,

Hans




> 
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 0cb646cb04ee..d5c15292ae93 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -38,6 +38,14 @@ static const struct drm_dmi_panel_orientation_data gpd_micropc = {
>  	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
>  };
>  
> +static const struct drm_dmi_panel_orientation_data gpd_onemix2s = {
> +	.width = 1200,
> +	.height = 1920,
> +	.bios_dates = (const char * const []){ "05/21/2018", "10/26/2018",
> +		"03/04/2019", NULL },
> +	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
> +};
> +
>  static const struct drm_dmi_panel_orientation_data gpd_pocket = {
>  	.width = 1200,
>  	.height = 1920,
> @@ -401,6 +409,14 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LTH17"),
>  		},
>  		.driver_data = (void *)&lcd800x1280_rightside_up,
> +	}, {	/* One Mix 2S (generic strings, also match on bios date) */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Default string"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Default string"),
> +		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Default string"),
> +		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "Default string"),
> +		},
> +		.driver_data = (void *)&gpd_onemix2s,
>  	},
>  	{}
>  };

