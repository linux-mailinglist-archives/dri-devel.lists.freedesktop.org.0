Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 272F6B1F46C
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 13:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2156210E157;
	Sat,  9 Aug 2025 11:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QgsZwyc1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA0F10E157
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 11:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754740114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8EDDZnuKj0755GogAhCpvIsf+rm8EiRfLgn4JfYrMsU=;
 b=QgsZwyc1x7RjR1kDIQbGh0yKPNp7cjZpzW1Is3DN2T1Lh16qG2/dpbqdrTheFd719Lj6B0
 Lwnwlvgko9cqBqf+JaVQj6/T70Z2nqnCSruBlDx0HM9w9MTNuq/o2hYghK21vH6fwXwjxx
 TtcvfG9ZDB20XGI9UlMlmlfsxMilo1w=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-tXyGPWNHMkOLqouBEhD5iQ-1; Sat, 09 Aug 2025 07:48:33 -0400
X-MC-Unique: tXyGPWNHMkOLqouBEhD5iQ-1
X-Mimecast-MFC-AGG-ID: tXyGPWNHMkOLqouBEhD5iQ_1754740112
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-af954fb1c4fso207216366b.3
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 04:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754740112; x=1755344912;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8EDDZnuKj0755GogAhCpvIsf+rm8EiRfLgn4JfYrMsU=;
 b=e/2qLywff8UaddH2eOjqcXEZPHmc7p3gziu2Qf3gOKMZ+DNDzpAhkV3hK/c4EHE4U4
 X++KoljwgOJhcA7RpgvZxna/+ukxF2LlhFYPKKVuFlidgMxIGUpxaV+ldrsIJyAAeIgH
 ldqP/3xlE9aqgi4r+cb4EuEMjQEoRzdUL5ZRYP9Cmpc+FFYqib+fBEhuawcnxh1qvCau
 YGX/Op13JLMGR5QOpppyMdkhNG6QHWGGfMNcLYnJuZxQTlrrIgenS9UsvM/wmCT269FP
 tAZrd2bUUGj6ViQO1Sa1F4+Qj8VheXwuiLO6TnyZh+Xk47mpaMgyqHVrqd87zNZr+nwg
 JshA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGF/Bet6weESfvV+6vzURkdHJ45gaiUBC11RfjXlOfM/FzGIasFONoA+8iBRjV/bCZdUk8M5WpLM4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLx1v4KeI+JlBx0A4FehgwYfbh3O2v4f5+1LoREl6P6joPLYSN
 RaJXasFzqFk0I9aAjXhj53OaF/ehDfsg1XpmfDQtVMM4ZcotBHlQydEFgtauJmceinak4lTHYHf
 1x2237USC6KV/qA4KcRxqrLKIVcAmyTJy3E1xFEMHXVx17tf9l2X3bohZ9XlA1uXye140Aw==
X-Gm-Gg: ASbGnctgcnCyanXylUaZYmamPTf9f18RHMUmU/v02EUMs83rZzby4YPr7KeN+89oYM1
 wtVJPAhgU2dvQB9BMrgRpjMO7p8EBMuh7IjuC6uAo9u230RSuyhvZgdM4X2wE7nD+qJF6doJovS
 KF+xR7o/5pmC+gKJytpRi1D6oqtdmQ9zkZCjrN9GGv/0CzCZ914pYGMpKsBIssWU/09L4c0+stf
 Mc3AO/9uX4aqpQX2y7z87t7gSvSR16Z4+iZ0oicH4MvNw2dToJpnhEIAI/GMeaTr/ut9mqI9T9I
 QapkRhGxdk3sbqELaJiscQL2FeHKa3XLYGuuUR0BLG93NjjQ+xokruELBVPXEEbnayAoAfxUxhm
 xZ51l7ep9ZeYJOJu8u8/xSt9nMjy9Uet0rDh6zmYuyL8P/V7mu8gjpnqEWuuQ9OM5altXltV0ft
 8UUaR0V9fqf7EUclo=
X-Received: by 2002:a17:907:6d26:b0:ae3:60fb:1b3b with SMTP id
 a640c23a62f3a-af9c654451dmr618310066b.58.1754740111845; 
 Sat, 09 Aug 2025 04:48:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcHoDyu59LmIlTnUYKnF1WKU80auy3Frrs4e9ro0Ni0EFHEbUF/59qTRw5C4WvAJV2ELm1aw==
X-Received: by 2002:a17:907:6d26:b0:ae3:60fb:1b3b with SMTP id
 a640c23a62f3a-af9c654451dmr618308666b.58.1754740111408; 
 Sat, 09 Aug 2025 04:48:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a219ecfsm1646962966b.94.2025.08.09.04.48.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Aug 2025 04:48:30 -0700 (PDT)
Message-ID: <8da2d4b5-4e53-4c0c-84e2-16b5aee6d757@redhat.com>
Date: Sat, 9 Aug 2025 13:48:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm: panel-orientation-quirks: Add Chuwi MiniBook X
 quirk
To: Ibrahim Burak Yorulmaz <iburaky.dev@gmail.com>,
 maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250809111200.10086-1-iburaky.dev@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250809111200.10086-1-iburaky.dev@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cPLYhl-MaJRlnZgaJCvjoJiQbABTqtqpO-O4TFrK0rY_1754740112
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

Hi Ibrahim,

On 9-Aug-25 1:12 PM, Ibrahim Burak Yorulmaz wrote:
> v2:
> - Changed subject prefix to drm: panel-orientation-quirks
> 
> The Chuwi MiniBook X (CWI558) uses a tablet screen which is oriented
> incorrectly by default. This adds a DMI quirk to rotate the panel into
> the correct orientation.
> 
> Signed-off-by: Ibrahim Burak Yorulmaz <iburaky.dev@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans


> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index c554ad8f246b..c85f63c42bbe 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -282,6 +282,12 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Hi10 pro tablet"),
>  		},
>  		.driver_data = (void *)&lcd1200x1920_rightside_up,
> +	}, {	/* Chuwi MiniBook X (CWI558) */
> +		.matches = {
> +		  DMI_MATCH(DMI_SYS_VENDOR, "CHUWI"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MiniBook X"),
> +		},
> +		.driver_data = (void *)&lcd1200x1920_rightside_up,
>  	}, {	/* Dynabook K50 */
>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dynabook Inc."),

