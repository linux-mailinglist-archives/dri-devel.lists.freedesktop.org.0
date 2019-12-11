Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0368911BA78
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 18:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0796EB97;
	Wed, 11 Dec 2019 17:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362BE6EB97
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 17:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576085894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CP0uyXQR34Vb7zdAkjsLxCVpBy52Rys6qtneNIbUTnk=;
 b=AFuj2O+EiSNoVboGptriGojUNUYbjrnqCvNTPTW5v9tLz7mLOJFidM7jdoHLfo6wQKgozB
 yd/il547RC6y7lMuhtVwliAyGARtBHPlzV33Vct/5L80Zr9VaKi9Xprz2pa9yCfLWYuFAG
 8grDqjPYSXDrWG2jq9XpBRBjdTJFC2g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-E9bqCj-dPgej1VBUpXS-iw-1; Wed, 11 Dec 2019 12:38:09 -0500
Received: by mail-wm1-f69.google.com with SMTP id p5so1947082wmc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 09:38:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CP0uyXQR34Vb7zdAkjsLxCVpBy52Rys6qtneNIbUTnk=;
 b=msrPPxhH0/R93R4KLpLFK7rawcAzGEjpgVOfuhViLxxxPM61ueIkltJAKeB130VO2W
 ACeWqyVOSOQNiMH1ua9mrMGI/0UzxfPkZqcmJ8pAxjCDBNlkGPiKqZnsGU0Bz5ytBykE
 z5T7gMZrrdP1O4cgCMIr8erVLSY4NpkilthCaZD0ISkWn4DsAVI7Q16qp2xy6dqokYCp
 DFekHHRidQkN3TdNCAnssSZqmpfbBLMJM/eGAKix6fvmHhi4gRzhcwTJOaBtlSEWtJpK
 4TwiTdwEvXECyfAPYCoAYHSbzBhopWFvd5b4+rINhMc40uBW++b142rJ8pNySq5ORdXD
 +chA==
X-Gm-Message-State: APjAAAWdT4yJu2AwAE+9YR5g06S+TiReXhLIPaR3v/CGOrpTuwqWsXHG
 6gTcKp/kf7tHmmuPLbfnH/gKa6bpIxjLZGOxDvGyx+C2AMc8sguHHDDrMurH3Tx4NtRouW0VDHu
 Ws2wLGgjY36vjR8bAPjrrbKfn4iEz
X-Received: by 2002:a1c:ed09:: with SMTP id l9mr1131805wmh.101.1576085888493; 
 Wed, 11 Dec 2019 09:38:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqxYPWq1vwpmzhCxOTxSdcCG69xJz8Q4RG7NSB1uwhcS+fYLIpJk0TP2xOm5FJNSZ5Iyz7FE/g==
X-Received: by 2002:a1c:ed09:: with SMTP id l9mr1131790wmh.101.1576085888304; 
 Wed, 11 Dec 2019 09:38:08 -0800 (PST)
Received: from shalem.localdomain
 (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
 by smtp.gmail.com with ESMTPSA id y139sm3258927wmd.24.2019.12.11.09.38.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2019 09:38:07 -0800 (PST)
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for Teclast X89
 tablet
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20191202105055.13201-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <66b14589-aba8-1cf2-21e5-7fd1c205e8da@redhat.com>
Date: Wed, 11 Dec 2019 18:38:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191202105055.13201-1-hdegoede@redhat.com>
Content-Language: en-US
X-MC-Unique: E9bqCj-dPgej1VBUpXS-iw-1
X-Mimecast-Spam-Score: 0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I know these kinda patches are sorta trivial, still I prefer to get an
Acked-by before pushing this to drm-misc-next. Can someone review this please?

Alternative I guess we could agree that pushing patches which just add a dmi
quirk to drm_panel_orientation_quirks.c is ok when the patch has sat on the
list without any response for a week ?

Regards,

Hans



On 02-12-2019 11:50, Hans de Goede wrote:
> The Teclast X89 uses an upside-down mounted eDP panel, add a
> panel-orientation quirk for this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/gpu/drm/drm_panel_orientation_quirks.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index ffd95bfeaa94..9f2d12f28a73 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -108,6 +108,13 @@ static const struct drm_dmi_panel_orientation_data lcd1200x1920_rightside_up = {
>   	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
>   };
>   
> +static const struct drm_dmi_panel_orientation_data teclast_x89 = {
> +	.width = 1536,
> +	.height = 2048,
> +	.bios_dates = (const char * const []){ "12/19/2014", NULL },
> +	.orientation = DRM_MODE_PANEL_ORIENTATION_BOTTOM_UP,
> +};
> +
>   static const struct dmi_system_id orientation_data[] = {
>   	{	/* Acer One 10 (S1003) */
>   		.matches = {
> @@ -205,6 +212,12 @@ static const struct dmi_system_id orientation_data[] = {
>   		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGM"),
>   		},
>   		.driver_data = (void *)&lcd1200x1920_rightside_up,
> +	}, {	/* Teclast X89 (tPAD is too generic, also match on bios date) */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "TECLAST"),
> +		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "tPAD"),
> +		},
> +		.driver_data = (void *)&teclast_x89,
>   	}, {	/* VIOS LTH17 */
>   		.matches = {
>   		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "VIOS"),
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
