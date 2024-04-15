Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB018A4B11
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 11:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BE11123B8;
	Mon, 15 Apr 2024 09:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CB9T8Q4N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E1A1123B8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 09:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713171811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AYKa4KTPniO6R7CGdMFUdNW1Z1y9QZTKRFmp+ZRDLRU=;
 b=CB9T8Q4NKPqQgHRGIYDDDTIyodrzAw7dSHZLMcYMBIEyypBF8I6nxhyMr1nGpPa4cJv5eJ
 gEySOcqKxW9xYy9n9jAM4Q06FsPnZY/Dv91NNQdeJswwwzV5Vkt4E7Ueb1ltYHpWbI8mZH
 7YV0f+mLHOV3S3IUKdmAhd920FQCZwA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-iT6yQIrLMUybLWZkh8Monw-1; Mon, 15 Apr 2024 05:03:29 -0400
X-MC-Unique: iT6yQIrLMUybLWZkh8Monw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-343e775c794so1892115f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 02:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713171808; x=1713776608;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AYKa4KTPniO6R7CGdMFUdNW1Z1y9QZTKRFmp+ZRDLRU=;
 b=TqYFZXtXshkoYa9d+bbLmhv9vcxXVPhBMDttbTGR78BXNO4HPcZGL36QBA5pjGm1nP
 yQGAgohTuiDjfd3sY1Xc43qSGbrY6llqQoaneO7YvEEiGjg70/y9nwIeAyCqbnqd6kuU
 q7g9pxRRKBJyiMZDJLzE75SB2RVQ0Lh8DEpKyD+VzS8UHt7q4Kah33dqe/aMPaMiSXpm
 D1k8rqOC0PIA6eThl307RlL5QqQttBkZf6lIcqbm/0/Yky9e3V/YjOxTG9gkIKXWYipy
 y9YLZ8if4eTdD9WU3p9rXUnnSGf/L9VOc94aDNMrjY3G990w25PnJ26DR99SgNDdBjPt
 NNlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkkVUuiUzZ2zxGU5NsB+8RCJ1FI0sngBHqQ669N+7nfoXq7VkkZQm56xM1rfYTzzVLPvJSG8jmjLb187hp3G2kvk8Xu/fKUggj1p0nAPzQ
X-Gm-Message-State: AOJu0YwBK+w/n57mzPY17yXFy7edHm7w3KIIiqWQ+lIOY0QYeEhNEEMm
 zqOUrLfNjwJ3Q6lBeEjyx1m20WgphUNqfun6KYZRm4A36X3R7rIoaofwezxSEdpirhu8NNZ8xEv
 JRGDvBapRm/gVXWfavbfNrPiQZ58BnRFN+9gKykjciXAsXcOroFlUO4yk50qK9KXTZA==
X-Received: by 2002:adf:e591:0:b0:341:e358:7bee with SMTP id
 l17-20020adfe591000000b00341e3587beemr6359816wrm.39.1713171807854; 
 Mon, 15 Apr 2024 02:03:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpwdZY2D2UwysYuZQw3OrScHwpqCJhWnmaPIklA/3flPX0PP7YVvECg4t0EjHiFSoANE2vtw==
X-Received: by 2002:adf:e591:0:b0:341:e358:7bee with SMTP id
 l17-20020adfe591000000b00341e3587beemr6359799wrm.39.1713171807476; 
 Mon, 15 Apr 2024 02:03:27 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 u7-20020adfeb47000000b0033ec9ddc638sm11497808wrn.31.2024.04.15.02.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Apr 2024 02:03:26 -0700 (PDT)
Message-ID: <ad01f30e-4944-44f6-9efa-8e04726d1486@redhat.com>
Date: Mon, 15 Apr 2024 11:03:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm: nv04: Fix out of bounds access
To: Mikhail Kobuk <m.kobuk@ispras.ru>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 Francisco Jerez <currojerez@riseup.net>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, Fedor Pchelkin <pchelkin@ispras.ru>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>, Karol Herbst <kherbst@redhat.com>
References: <20240411110854.16701-1-m.kobuk@ispras.ru>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240411110854.16701-1-m.kobuk@ispras.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/11/24 13:08, Mikhail Kobuk wrote:
> When Output Resource (dcb->or) value is assigned in
> fabricate_dcb_output(), there may be out of bounds access to
> dac_users array in case dcb->or is zero because ffs(dcb->or) is
> used as index there.
> The 'or' argument of fabricate_dcb_output() must be interpreted as a
> number of bit to set, not value.
> 
> Utilize macros from 'enum nouveau_or' in calls instead of hardcoding.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 2e5702aff395 ("drm/nouveau: fabricate DCB encoder table for iMac G4")
> Fixes: 670820c0e6a9 ("drm/nouveau: Workaround incorrect DCB entry on a GeForce3 Ti 200.")
> Signed-off-by: Mikhail Kobuk <m.kobuk@ispras.ru>

Applied to drm-misc-fixes, thanks!

> ---
> Changes in v2:
> - Instead of checking ffs(dcb->or), adjust function calls to match
>    argument semantics
> - Link to v1: https://lore.kernel.org/all/20240331064552.6112-1-m.kobuk@ispras.ru/
> 
>   drivers/gpu/drm/nouveau/nouveau_bios.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
> index 479effcf607e..79cfab53f80e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bios.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
> @@ -23,6 +23,7 @@
>    */
>   
>   #include "nouveau_drv.h"
> +#include "nouveau_bios.h"
>   #include "nouveau_reg.h"
>   #include "dispnv04/hw.h"
>   #include "nouveau_encoder.h"
> @@ -1677,7 +1678,7 @@ apply_dcb_encoder_quirks(struct drm_device *dev, int idx, u32 *conn, u32 *conf)
>   	 */
>   	if (nv_match_device(dev, 0x0201, 0x1462, 0x8851)) {
>   		if (*conn == 0xf2005014 && *conf == 0xffffffff) {
> -			fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 1, 1, 1);
> +			fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 1, 1, DCB_OUTPUT_B);
>   			return false;
>   		}
>   	}
> @@ -1763,26 +1764,26 @@ fabricate_dcb_encoder_table(struct drm_device *dev, struct nvbios *bios)
>   #ifdef __powerpc__
>   	/* Apple iMac G4 NV17 */
>   	if (of_machine_is_compatible("PowerMac4,5")) {
> -		fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 0, all_heads, 1);
> -		fabricate_dcb_output(dcb, DCB_OUTPUT_ANALOG, 1, all_heads, 2);
> +		fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 0, all_heads, DCB_OUTPUT_B);
> +		fabricate_dcb_output(dcb, DCB_OUTPUT_ANALOG, 1, all_heads, DCB_OUTPUT_C);
>   		return;
>   	}
>   #endif
>   
>   	/* Make up some sane defaults */
>   	fabricate_dcb_output(dcb, DCB_OUTPUT_ANALOG,
> -			     bios->legacy.i2c_indices.crt, 1, 1);
> +			     bios->legacy.i2c_indices.crt, 1, DCB_OUTPUT_B);
>   
>   	if (nv04_tv_identify(dev, bios->legacy.i2c_indices.tv) >= 0)
>   		fabricate_dcb_output(dcb, DCB_OUTPUT_TV,
>   				     bios->legacy.i2c_indices.tv,
> -				     all_heads, 0);
> +				     all_heads, DCB_OUTPUT_A);
>   
>   	else if (bios->tmds.output0_script_ptr ||
>   		 bios->tmds.output1_script_ptr)
>   		fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS,
>   				     bios->legacy.i2c_indices.panel,
> -				     all_heads, 1);
> +				     all_heads, DCB_OUTPUT_B);
>   }
>   
>   static int

