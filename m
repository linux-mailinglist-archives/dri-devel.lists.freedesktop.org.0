Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBE85BB9CF
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 20:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C396610E0C1;
	Sat, 17 Sep 2022 18:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CD310E0C1
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 18:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663437635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JgKYNIVGHgBOnvrxN4mdypOW9y4btqV8BpaMbCRfOfQ=;
 b=RGLS/fCyFgEy42n9pWopShVLU1oYxgyixVHGwYVd9k2/8pvAMdlSco5hn0dpasPugRHOQZ
 OT5PRvNrvx+6W0Fso1e/SBS41N5T1A3ui0FN5o8Qvgpk/fKzUCm04B0tXAJXT4M+9GbSM6
 G+7++TjfaH6Kt7ujDd0LHcQalMcDphM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-631-BjlUsXe8NHqmse9Hnb6SFg-1; Sat, 17 Sep 2022 14:00:32 -0400
X-MC-Unique: BjlUsXe8NHqmse9Hnb6SFg-1
Received: by mail-ed1-f72.google.com with SMTP id
 z9-20020a05640235c900b0044f0575e9ddso17239750edc.1
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 11:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=JgKYNIVGHgBOnvrxN4mdypOW9y4btqV8BpaMbCRfOfQ=;
 b=dxlDqzprlJqYesrx2Gq1ph2dz7dWQl6EkAdmce+taG8/Qr/AagIAMvtrbrDQiBTCaF
 ZJ05A3PauWdK+Dem9ghg1grB/kb7ZPz80CHosnGbkS5PCGBKOXK0ckwFRsknXBFGokbD
 rc7AH37jJfgFlm1bng73MA8ccwcJRs+yX8tHEWV/vypRnIdbg/tKoLCWyqdyyZcY7kmS
 e0p9P1qMGTC04M41L3Ro89UDpoC9/Slajwtnop2b/Et3dLYlA2/ulcrd10wvvtqxPc8s
 HYQGRIs9NB6bhwEfEMqQj25QPdaH0M5Sx9vwVlksxnZW2GnksqUa7vbnu6z8trc/rYco
 sHLg==
X-Gm-Message-State: ACrzQf2tOQhIOEqXJ+FCYuG+a3cIldF0YIsXEnj4aWOocSZJAwCzi++f
 /27StESB2u3g9fycEa9ym/ND5isYIs/0KH9gjSwzh76NurSb9GA7zi/PJt5gfUNjj0lkCjJFMgb
 XAKomUvsWDyx148F8kufvJNSC00LS
X-Received: by 2002:a17:907:6093:b0:780:7671:2c97 with SMTP id
 ht19-20020a170907609300b0078076712c97mr7395614ejc.8.1663437630808; 
 Sat, 17 Sep 2022 11:00:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5h86bQDJL4fYqYdDnP4hpCMXC7RFEqgLZ2bqYMWLCyEFoUeiqC+9aCPZXcQITcOoPsX3cV3A==
X-Received: by 2002:a17:907:6093:b0:780:7671:2c97 with SMTP id
 ht19-20020a170907609300b0078076712c97mr7395605ejc.8.1663437630619; 
 Sat, 17 Sep 2022 11:00:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a17090609d100b0077ce503bd77sm9933293eje.129.2022.09.17.11.00.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 11:00:29 -0700 (PDT)
Message-ID: <b245787a-38fa-4202-cc7a-8fe18bc2308d@redhat.com>
Date: Sat, 17 Sep 2022 20:00:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: drm: panel-orientation-quirks: Add quirk for Aya Neo Air
To: Maccraft123 <maccraft123mc@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220825191946.1678798-1-maccraft123mc@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220825191946.1678798-1-maccraft123mc@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 8/25/22 21:19, Maccraft123 wrote:
> From: Maya Matuszczyk <maccraft123mc@gmail.com>
> 
> Yet another x86 gaming handheld.
> 
> This one has many SKUs with quite a few of DMI strings,
> so let's just use a catchall, just as with Aya Neo Next.
> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>

Thanks, I have pushed this out to drm-misc-next now.

Note for future drm_panel_orientation_quirks.c patches please Cc me,
I am not subscribed to dri-devel.

Regards,

Hans


> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index fc1728d46ac2..0b011b615495 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -103,6 +103,12 @@ static const struct drm_dmi_panel_orientation_data lcd800x1280_rightside_up = {
>  	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
>  };
>  
> +static const struct drm_dmi_panel_orientation_data lcd1080x1920_leftside_up = {
> +	.width = 1080,
> +	.height = 1920,
> +	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
> +};
> +
>  static const struct drm_dmi_panel_orientation_data lcd1200x1920_rightside_up = {
>  	.width = 1200,
>  	.height = 1920,
> @@ -152,6 +158,12 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AYA NEO 2021"),
>  		},
>  		.driver_data = (void *)&lcd800x1280_rightside_up,
> +	}, {	/* AYA NEO AIR */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
> +		  DMI_MATCH(DMI_BOARD_NAME, "AIR"),
> +		},
> +		.driver_data = (void *)&lcd1080x1920_leftside_up,
>  	}, {	/* AYA NEO NEXT */
>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),

