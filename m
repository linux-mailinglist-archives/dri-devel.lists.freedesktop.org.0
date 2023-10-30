Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A24B87DC2A3
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 23:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9861110E3A1;
	Mon, 30 Oct 2023 22:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C54710E39E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 22:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698706291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6P4UoiErWNPLHNyco5VawfLkVvD7SWLKAqxTsw/cRyU=;
 b=Jz8cgq5TdfLt6RLPD+4GPUTrl9xkaNjJwTwpHJ1YRdAhxT4fpMLB4mZhs3MS1YlqKaxjen
 a36/64qNPSCjfLtGjwrC1Xi9UE26JJiFMitPojr68PFO64PB594FDpmir0HwMZJ7XHpskY
 uV8AqlDMI90hWvhFq7d/Moq/jcQqBSE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-ZBi6N80nNDSKFJS3NBS5GQ-1; Mon, 30 Oct 2023 18:51:09 -0400
X-MC-Unique: ZBi6N80nNDSKFJS3NBS5GQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-54045f31f49so3652074a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 15:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698706269; x=1699311069;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6P4UoiErWNPLHNyco5VawfLkVvD7SWLKAqxTsw/cRyU=;
 b=cyRtmPc7wMsykXatEDEBe0cYJ5LkDFHJwk4e505F7UiFPeB/MsVX6J3Bn2b3gP/JKm
 MxtJO7lyzmnPgN3srm9n2NzwAYx4Z5IqqETa7ykYFDetlmWI20o8RUVrMJ8Er3aMGpXG
 rZ1M752qpXKs+NhEXZvLr2GTcspYPAGBNg3HrlROsqinKOH3OQUDNThMZW4LOZqrasyr
 k5Vln0wGtjvYw9R8LWpztZnnWfmtrurabK7BKuu9OalWf26F4A2oZf6DVA9PN1KY63CN
 RR1AyOsTWZ1itKAFXa3/eidkg94I0NDJ/rIZQNh+vSRI7nkZ0qLR+AiFvTzGGXN2joyp
 J3DQ==
X-Gm-Message-State: AOJu0YyGrakt5zwbkFRur6wdLChCcDsjm0k4f7UYcTEtLda7YRB8DjN6
 79cs1HbFYDoa8RO9IFiHp3wQ/H7w43+MaijtScr5Qwm7yu3jbwx6HcX3AAfqGHwmcFYqPgV4ar6
 1FXDH3NSIvwDh2s3VKQBbGV1PiEV1
X-Received: by 2002:a50:d610:0:b0:543:6542:6627 with SMTP id
 x16-20020a50d610000000b0054365426627mr376829edi.32.1698706268344; 
 Mon, 30 Oct 2023 15:51:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLsW7uF3tuXKERXpeftJt/BN8R6xJmywBYCJRg8g5ktCvwYvWS8QJrH0eShU7WGgLVz/GBmA==
X-Received: by 2002:a50:d610:0:b0:543:6542:6627 with SMTP id
 x16-20020a50d610000000b0054365426627mr376823edi.32.1698706268157; 
 Mon, 30 Oct 2023 15:51:08 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a056402345200b0052febc781bfsm105445edc.36.2023.10.30.15.51.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 15:51:07 -0700 (PDT)
Message-ID: <53329862-1e7a-46de-9867-0cfaf9310ffb@redhat.com>
Date: Mon, 30 Oct 2023 23:51:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Nouveau] [PATCH 2/2] nouveau/disp: fix post-gsp build on 32-bit
 arm.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20231030012814.1208972-1-airlied@gmail.com>
 <20231030012814.1208972-2-airlied@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231030012814.1208972-2-airlied@gmail.com>
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
Cc: nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/30/23 02:28, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This converts a bunch of divides into the proper macros.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/nouveau/dispnv50/disp.c | 24 +++++++++++++-----------
>   1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index d2be40337b92..7840b6428afb 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1644,7 +1644,7 @@ nv50_sor_dp_watermark_sst(struct nouveau_encoder *outp,
>   	// 0 active symbols. This may cause HW hang. Bug 200379426
>   	//
>   	if ((bEnableDsc) &&
> -		((pixelClockHz * depth) < ((8 * minRate * outp->dp.link_nr * DSC_FACTOR) / 64)))
> +	    ((pixelClockHz * depth) < div_u64(8 * minRate * outp->dp.link_nr * DSC_FACTOR, 64)))
>   	{
>   		return false;
>   	}
> @@ -1654,20 +1654,20 @@ nv50_sor_dp_watermark_sst(struct nouveau_encoder *outp,
>   	//	For auto mode the watermark calculation does not need to track accumulated error the
>   	//	formulas for manual mode will not work.  So below calculation was extracted from the DTB.
>   	//
> -	ratioF = ((u64)pixelClockHz * depth * PrecisionFactor) / DSC_FACTOR;
> +	ratioF = div_u64((u64)pixelClockHz * depth * PrecisionFactor, DSC_FACTOR);
>   
> -	ratioF /= 8 * (u64) minRate * outp->dp.link_nr;
> +	ratioF = div_u64(ratioF, 8 * (u64) minRate * outp->dp.link_nr);
>   
>   	if (PrecisionFactor < ratioF) // Assert if we will end up with a negative number in below
>   		return false;
>   
> -	watermarkF = ratioF * tuSize * (PrecisionFactor - ratioF)  / PrecisionFactor;
> -	waterMark = (unsigned)(watermarkAdjust + ((2 * (depth * PrecisionFactor / (8 * numLanesPerLink * DSC_FACTOR)) + watermarkF) / PrecisionFactor));
> +	watermarkF = div_u64(ratioF * tuSize * (PrecisionFactor - ratioF), PrecisionFactor);
> +	waterMark = (unsigned)(watermarkAdjust + (div_u64(2 * div_u64(depth * PrecisionFactor, 8 * numLanesPerLink * DSC_FACTOR) + watermarkF, PrecisionFactor)));
>   
>   	//
>   	//  Bounds check the watermark
>   	//
> -	numSymbolsPerLine = (surfaceWidth * depth) / (8 * outp->dp.link_nr * DSC_FACTOR);
> +	numSymbolsPerLine = div_u64(surfaceWidth * depth, 8 * outp->dp.link_nr * DSC_FACTOR);
>   
>   	if (WARN_ON(waterMark > 39 || waterMark > numSymbolsPerLine))
>   		return false;
> @@ -1688,11 +1688,13 @@ nv50_sor_dp_watermark_sst(struct nouveau_encoder *outp,
>   	surfaceWidthPerLink = surfaceWidth;
>   
>   	//Extra bits sent due to pixel steering
> -	PixelSteeringBits = (surfaceWidthPerLink % numLanesPerLink) ? (((numLanesPerLink - surfaceWidthPerLink % numLanesPerLink) * depth) / DSC_FACTOR) : 0;
> +	u32 remain;
> +	div_u64_rem(surfaceWidthPerLink, numLanesPerLink, &remain);
> +	PixelSteeringBits = remain ? div_u64((numLanesPerLink - remain) * depth, DSC_FACTOR) : 0;
>   
>   	BlankingBits += PixelSteeringBits;
> -	NumBlankingLinkClocks = (u64)BlankingBits * PrecisionFactor / (8 * numLanesPerLink);
> -	MinHBlank = (u32)(NumBlankingLinkClocks * pixelClockHz/ minRate / PrecisionFactor);
> +	NumBlankingLinkClocks = div_u64((u64)BlankingBits * PrecisionFactor, (8 * numLanesPerLink));
> +	MinHBlank = (u32)(div_u64(div_u64(NumBlankingLinkClocks * pixelClockHz, minRate), PrecisionFactor));
>   	MinHBlank += 12;
>   
>   	if (WARN_ON(MinHBlank > rasterWidth - surfaceWidth))
> @@ -1703,7 +1705,7 @@ nv50_sor_dp_watermark_sst(struct nouveau_encoder *outp,
>   		return false;
>   
>   
> -	hblank_symbols = (s32)(((u64)(rasterWidth - surfaceWidth - MinHBlank) * minRate) / pixelClockHz);
> +	hblank_symbols = (s32)(div_u64((u64)(rasterWidth - surfaceWidth - MinHBlank) * minRate, pixelClockHz));
>   
>   	//reduce HBlank Symbols to account for secondary data packet
>   	hblank_symbols -= 1; //Stuffer latency to send BS
> @@ -1722,7 +1724,7 @@ nv50_sor_dp_watermark_sst(struct nouveau_encoder *outp,
>   	}
>   	else
>   	{
> -		vblank_symbols = (s32)(((u64)(surfaceWidth - 40) * minRate) /  pixelClockHz) - 1;
> +		vblank_symbols = (s32)((div_u64((u64)(surfaceWidth - 40) * minRate, pixelClockHz))) - 1;
>   
>   		vblank_symbols -= numLanesPerLink == 1 ? 39  : numLanesPerLink == 2 ? 21 : 12;
>   	}

