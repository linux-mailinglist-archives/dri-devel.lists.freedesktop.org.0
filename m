Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC13393160C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 15:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9528410E264;
	Mon, 15 Jul 2024 13:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="csaGFB5J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9478B10E264
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 13:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721051208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQQM2Vgmnkg0Q/ZG925IrQsyn3iBSHAJuJ8Uk6m4Psg=;
 b=csaGFB5JCO8Zj5s+ZmiDe0c957VNd0o5EOgTj0NnpXmxZiyyByjzCiSpQS2qdGcgEGySgE
 7TBArZTitrnQ/oBnRVPVAXdWHmfdNGaS0Qu+PyziPXKePKE54oT1Wj/YCHSxJPCS93E2C6
 ZsIU5r6mCFnXuR+2YzasjTedo5OvsDQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-c5Z9hQ5dMS24is8UR4UZRA-1; Mon, 15 Jul 2024 09:46:47 -0400
X-MC-Unique: c5Z9hQ5dMS24is8UR4UZRA-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-58c98ce7d00so3592028a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 06:46:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721051206; x=1721656006;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iQQM2Vgmnkg0Q/ZG925IrQsyn3iBSHAJuJ8Uk6m4Psg=;
 b=pBFee5Xd3rFRnEaRUjUdfm6rlIPmYONITSmJ+2RwoxhCg/1EVPUusBFE+Z5JTifj9Q
 bMzO1L/er3Do9TEWNyX0ceYM08CuFtQVGhOihz7ofIe6vi1VuQ1AKWsiW38HOZ61zfEW
 tpJJ0w4nci+1lufP9Ugmp9nwZpQs4TE8QMFQnedwdy7RT/28U4F6c8sW+OkCyc9IoZSQ
 tEgnXqrPcsHZ7crwVuHDocds3R+BJW1rigvfei6JOH1CA7Cm1E6WXwdIDWdKm2e9O5YG
 syJ5mgo9qo/aKHp32aB/3e5aeci782dxwBSWAp+YoQTPBTLxyqlPIT4Ngr9UuNKZh6tv
 VH0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2RZWXuOV3PIpHJB2cstW33IQ9UtmWWSk52+se3QnM+k3F2uIVMs1P260GPP2M8Y2Wgt3GP4AdlzduVLXGNFjnyItUOgBWnOTyF/qEOvAW
X-Gm-Message-State: AOJu0YwxmteYPoCFVssuVSqP3Tfpx5zrSKa9BRfPPC7QgtTqphvJSFu1
 IZeG39fylkWY25rgr3IumtgQFpq7iHdG2Sq6XKJ8D9ZN6de4+zGmRBQz3vmKPriZNIVVt7AM/5f
 igHiS0f6fOR2B7z2UR5vrPwD4ZzhNNdNIIL/U0D2bi4/8qet9vWCLnktgYD4EVxbBIQ==
X-Received: by 2002:a05:6402:40d2:b0:58a:d4f4:e866 with SMTP id
 4fb4d7f45d1cf-594b9b06ceemr15731996a12.6.1721051205941; 
 Mon, 15 Jul 2024 06:46:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSHFUvMvX6VcA8ROFee0QQTz/GhPiB3M+stkDjPDyUX2+yHI+VQz5H5iEVM8mnZ1l5PRL0wQ==
X-Received: by 2002:a05:6402:40d2:b0:58a:d4f4:e866 with SMTP id
 4fb4d7f45d1cf-594b9b06ceemr15731968a12.6.1721051205496; 
 Mon, 15 Jul 2024 06:46:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59cfa5dd20esm1640184a12.40.2024.07.15.06.46.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 06:46:45 -0700 (PDT)
Message-ID: <afc7f155-9442-4603-b276-78f3df1f2b8f@redhat.com>
Date: Mon, 15 Jul 2024 15:46:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for OrangePi Neo
To: Philip Mueller <philm@manjaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240715045818.1019979-1-philm@manjaro.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240715045818.1019979-1-philm@manjaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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

Hi,

On 7/15/24 6:57 AM, Philip Mueller wrote:
> This adds a DMI orientation quirk for the OrangePi Neo Linux Gaming Handheld.
> 
> Signed-off-by: Philip Mueller <philm@manjaro.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I have pushed this to drm-misc-fixes now.

Regards,

Hans



> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 3860a8ce1e2d..903f4bfea7e8 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -414,6 +414,12 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
>  		},
>  		.driver_data = (void *)&lcd1600x2560_leftside_up,
> +	}, {	/* OrangePi Neo */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "NEO-01"),
> +		},
> +		.driver_data = (void *)&lcd1200x1920_rightside_up,
>  	}, {	/* Samsung GalaxyBook 10.6 */
>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),

