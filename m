Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B29D02FDB4D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 22:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACD56E14D;
	Wed, 20 Jan 2021 21:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61826E14D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 21:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611177511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9kjJlp6FdVA9uxAySlO3UPh/uVbynND8DNbuJI+VRNY=;
 b=a9L4T2khPPoawXHnNyF3yD8VUXPEeqOoMvkNqVtYojMQA0OsdGAV0R2m/k1xgMGADf2ZDH
 LlyVHw6Zh8M5pnJYumvF0HQxkOx4lCMkkz3fa6hvK8rFhhcy5d7TF5SJbpnRgneZoP61yE
 6h6oqT5rdfOelPBp/wPkGcwwhJozdlc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-CdlrkDxXOy-AHhqxg2DcTg-1; Wed, 20 Jan 2021 16:18:27 -0500
X-MC-Unique: CdlrkDxXOy-AHhqxg2DcTg-1
Received: by mail-ej1-f70.google.com with SMTP id z2so3585948ejf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 13:18:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9kjJlp6FdVA9uxAySlO3UPh/uVbynND8DNbuJI+VRNY=;
 b=WlAI4BZA1aEiFs5TyGSbn1lah9BxaHp/O4dl5uqM1b7MTEwQI/emItHFWmipa1mFIx
 QV4yN2WRZmXSBBEdhqy4d8/mgwwOLOEyFFVj+qthlkYW0ZOhnKX5SkT7qAPCsyVKF1Fm
 kM7WLPNtQB8+AHH36ABwt20nrMJ++TSig1sgqpf1ztQaHKhJTb4/xe06dLoJskKmmDz3
 XB8146CvpMIdIkPezEnHS0C6IhkF99XWy6yPHQVObMzyRp6oZSF839kk2BxXaQ2zQ9Hq
 8etdOlSkwxlCjkuB7FxbUXZRJ9nWo81Fa0kByJH891FmHSdEzyU2Ch7avnzhow8U5+30
 G3Yg==
X-Gm-Message-State: AOAM530hZnCQGz9nibYosL2gk/FkqotC6XaF4eEGfT3fEVzbxIZLpdfv
 e4DwiNxLdfKtk4PFejLcxilKSiVcfj3H57O7WODZ50A3xV7GHA06zoRDmK0MradvEU3jFc0w9S4
 pHwtgB7iGdwfETYRW4oXyLx52TYCS6ledzwqvckWdQNbLWGNZ6002u43Dpp89NkYm89lL0ct4LI
 CHMr3d
X-Received: by 2002:a50:fe86:: with SMTP id d6mr8768151edt.80.1611177506410;
 Wed, 20 Jan 2021 13:18:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6HVFKfWlbDM8Gljn38zmsL6LdxfrwprLpPGtAFfdwyIkw5E06rHjWywKMI4IcPNHPG+Ju4w==
X-Received: by 2002:a50:fe86:: with SMTP id d6mr8768137edt.80.1611177506197;
 Wed, 20 Jan 2021 13:18:26 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id re19sm1331223ejb.111.2021.01.20.13.18.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 13:18:25 -0800 (PST)
Subject: Re: [PATCH] drm: Added orientation quirk for OneGX1 Pro
To: Jared Baldridge <jrb@expunge.us>, linux-kernel@vger.kernel.org
References: <41288ccb-1012-486b-81c1-a24c31850c91@www.fastmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <4810e001-9239-5798-c48d-cb59a6802d92@redhat.com>
Date: Wed, 20 Jan 2021 22:18:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <41288ccb-1012-486b-81c1-a24c31850c91@www.fastmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 1/20/21 9:56 PM, Jared Baldridge wrote:
> The OneGX1 Pro has a fairly unique combination of generic strings,
> but we additionally match on the BIOS date just to be safe.
> 
> Signed-off-by: Jared Baldridge <jrb@expunge.us>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I will push this to drm-misc-next right away.

Regards,

Hans

> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 58f5dc2f6dd5..f6bdec7fa925 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -84,6 +84,13 @@ static const struct drm_dmi_panel_orientation_data itworks_tw891 = {
>         .orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
>  };
>  
> +static const struct drm_dmi_panel_orientation_data onegx1_pro = {
> +       .width = 1200,
> +       .height = 1920,
> +       .bios_dates = (const char * const []){ "12/17/2020", NULL },
> +       .orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
> +};
> +
>  static const struct drm_dmi_panel_orientation_data lcd720x1280_rightside_up = {
>         .width = 720,
>         .height = 1280,
> @@ -211,6 +218,13 @@ static const struct dmi_system_id orientation_data[] = {
>                   DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGM"),
>                 },
>                 .driver_data = (void *)&lcd1200x1920_rightside_up,
> +       }, {    /* OneGX1 Pro */
> +               .matches = {
> +                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SYSTEM_MANUFACTURER"),
> +                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "SYSTEM_PRODUCT_NAME"),
> +                 DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Default string"),
> +               },
> +               .driver_data = (void *)&onegx1_pro,
>         }, {    /* VIOS LTH17 */
>                 .matches = {
>                   DMI_EXACT_MATCH(DMI_SYS_VENDOR, "VIOS"),
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
