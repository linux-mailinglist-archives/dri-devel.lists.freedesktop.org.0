Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB13649CB41
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 14:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A669310E59E;
	Wed, 26 Jan 2022 13:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2161610E67D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 13:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643204848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AOuHAS2KZDNxBEGucf0g1XwANeun6eXjr1QhmgpheTs=;
 b=NRr4V7Vbkf3hpiPQlaTieGhzxscQfMzMykemKOXX5mx6LNcWYMFediw52Vm/v7nNiiZb5i
 Vvffv4Rp/XKz/Y6Pwc8ePOQqgQ5hCnbckDZQj7LNik3qO+5dbYrc2vgqKy7xFHfmQ0SCui
 FHeAW5ArAZHSJ8jVm61Hck1Vn7bbwnc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-t5b92Re3MfSDJJ8Y-VoiUQ-1; Wed, 26 Jan 2022 08:47:26 -0500
X-MC-Unique: t5b92Re3MfSDJJ8Y-VoiUQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 k5-20020a508ac5000000b00408dec8390aso3992198edk.13
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 05:47:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AOuHAS2KZDNxBEGucf0g1XwANeun6eXjr1QhmgpheTs=;
 b=0h5JJlePDp7BJCpxAjIBMLX9AFIyPumJu6wr5rCfHS0RF9acDNern6CPn72IN3C33m
 e0xy/xloTc/23/bjm5wolk8Rh3vPDsxJX3Gna0gE2vuJGIWKcrsKlArXVBedgss/dbnn
 Q0uizNqdgCXa+uKG+qXwfR57FSA2e43wT02hJ08+696vCTnY+sBbOkRp2PRvWaWFC9iT
 mnptAPacbF6XZbnav2Dos+gltVtNMyxgfoo9vLvFH164Et5tHStrxC++Y+t/rgrR5tQ1
 tvHcCReykZup8k2P9A3kDIaVXzSYvCZJl4esalkYxTj/sCMbsojlKMsCbU52bzwrVKCo
 B8lw==
X-Gm-Message-State: AOAM531Ghs0IMZJ2n7W1fG69S8GRFUaFs/24PBVgK+IX+fNB+ouVb/2h
 AwbQIicEytX1frctfxvdBYWvf5OmYldIpSLSU1aefzhZ+txGBRgQcWWZ8gsLFWUMupWEPyFGvGf
 Uw7yfbImPdNqfQ2f7I+gXlBLMmtur
X-Received: by 2002:a05:6402:3547:: with SMTP id
 f7mr837175edd.403.1643204845460; 
 Wed, 26 Jan 2022 05:47:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwiC+8nYkmxkRX7YvOpqEsKxrQ+HcLdg6EBEkSZhdjfTXFWMgS245DlLrrqIfPrj0acVqH+Q==
X-Received: by 2002:a05:6402:3547:: with SMTP id
 f7mr837151edd.403.1643204845256; 
 Wed, 26 Jan 2022 05:47:25 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id oz3sm7428569ejb.219.2022.01.26.05.47.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 05:47:24 -0800 (PST)
Message-ID: <6a0233cd-d931-8a36-3b9e-08b774cec7b0@redhat.com>
Date: Wed, 26 Jan 2022 14:47:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: acpi_get_devices() crash when acpi_disabled==true (was [PATCH v2]
 drm/privacy-screen: honor acpi=off in detect_thinkpad_privacy_screen)
To: Tong Zhang <ztong0001@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-acpi <linux-acpi@vger.kernel.org>
References: <20220123091004.763775-1-ztong0001@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220123091004.763775-1-ztong0001@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

On 1/23/22 10:10, Tong Zhang wrote:
> when acpi=off is provided in bootarg, kernel crash with
> 
> [    1.252739] BUG: kernel NULL pointer dereference, address: 0000000000000018
> [    1.258308] Call Trace:
> [    1.258490]  ? acpi_walk_namespace+0x147/0x147
> [    1.258770]  acpi_get_devices+0xe4/0x137
> [    1.258921]  ? drm_core_init+0xc0/0xc0 [drm]
> [    1.259108]  detect_thinkpad_privacy_screen+0x5e/0xa8 [drm]
> [    1.259337]  drm_privacy_screen_lookup_init+0xe/0xe85 [drm]
> 
> The reason is that acpi_walk_namespace expects acpi related stuff
> initialized but in fact it wouldn't when acpi is set to off. In this case
> we should honor acpi=off in detect_thinkpad_privacy_screen().
> 
> Signed-off-by: Tong Zhang <ztong0001@gmail.com>

Thank you for catching this and thank you for your patch. I was about to merge
this, but then I realized that this might not be the best way to fix this.

A quick grep shows 10 acpi_get_devices() calls outside of drivers/acpi,
and at a first glance about half of those are missing an acpi_disabled
check. IMHO it would be better to simply add an acpi_disabled check to
acpi_get_devices() itself.

Rafael, do you agree ?


Note the just added chrome privacy-screen check uses
acpi_dev_present(), this is also used in about 10 places outside
of drivers/acpi and AFAIK none of those do an acpi_disabled check.

acpi_dev_present() uses bus_find_device(&acpi_bus_type, ...)
but the acpi_bus_type does not get registered when acpi_disabled
is set. In the end this is fine though since bus_find_device
checks for the bus not being registered and then just returns
NULL.

Regards,

Hans




> ---
> v2: fix typo in previous commit -- my keyboard is eating letters 
> 
>  drivers/gpu/drm/drm_privacy_screen_x86.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_privacy_screen_x86.c b/drivers/gpu/drm/drm_privacy_screen_x86.c
> index a2cafb294ca6..e7aa74ad0b24 100644
> --- a/drivers/gpu/drm/drm_privacy_screen_x86.c
> +++ b/drivers/gpu/drm/drm_privacy_screen_x86.c
> @@ -33,6 +33,9 @@ static bool __init detect_thinkpad_privacy_screen(void)
>  	unsigned long long output;
>  	acpi_status status;
>  
> +	if (acpi_disabled)
> +		return false;
> +
>  	/* Get embedded-controller handle */
>  	status = acpi_get_devices("PNP0C09", acpi_set_handle, NULL, &ec_handle);
>  	if (ACPI_FAILURE(status) || !ec_handle)

