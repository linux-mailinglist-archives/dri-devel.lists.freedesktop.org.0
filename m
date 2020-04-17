Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D931AE1C5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 18:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2FB6E3EE;
	Fri, 17 Apr 2020 16:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2194B6E3EE
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 16:05:55 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t14so3617033wrw.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 09:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OrsbW1cwgo9ceeNF1CWvn3jQrpfjDBd8Kk2yxJXwnfs=;
 b=VFLfdDp+VczGBZ6BQFptM+VUIgpNFTXDCHbdNwWkYh+f/yeL9OpHA0if60q+s/ZfVK
 K3z5awg35CaSA16BBpqV3fg3VVOhwfv2jiV/YuvZlzqnMb2taoZyy9Xlt4Rw7trLPpti
 mUkdy8X9J4TL/6Q36iIAqNCNQvQLRsW389kDDYJ0FnY3+gV2M9kwz0Upu2zAJCq6xfFG
 sWQ7Oke3cs+g+J3b0rqGd6506lX0CEje5rOoG1VN97Pa4s72RmWHF+3oduh0AG3Vxqp9
 Z68CMf9COHlvN/oct6reSHfBQ7pFF/tjkmmBuL+xYnKiSN8MrMDroU6djSX2xnEu1vF/
 /tEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=OrsbW1cwgo9ceeNF1CWvn3jQrpfjDBd8Kk2yxJXwnfs=;
 b=W356+pEur+qCm0qoj/AR8gDAqjWgLI5blneO5LP0w3IQ0OfHqozX4nmVr+yc+s2QT+
 iXmiC4ASxUjepJ0v7VgsAM1esIIATSsiZ4V7s4Ynmpf9aVWqpojD9U7qRRap2F9tPms2
 7G40XVz9SppQqoBXHGoK9ocMNKHLq4pi+uRcRqAOGc+FAwPIM0TxVIv2GEZu2+hoXzux
 9J6yOg31R3d6cTDDXaOVFk3m4hF6kKsUD5RNlDBSGlUDmmunIebuc0hhgi87szFXmwU4
 8tRVFF/+LAWN2Nybd+mpRY7DaRnD7SOvaXATH0KyBdCK0RNiXkcQ3BVqfLTuhmB3s+AQ
 jrQQ==
X-Gm-Message-State: AGi0PuZ9UYmihlGNTTCFJe3oLClD+e+vSu/MhQR95W+Nmg9EF2XfG6f7
 MJsiFe/wjA0XzWe1HdpKA0B/fw==
X-Google-Smtp-Source: APiQypJRLB7pu1QH6lVRik4FyloP1QJhfGAUuafpZGXHvj4ir8V3OxUfgIlcPnkknHFK8OixQd4EhA==
X-Received: by 2002:adf:e487:: with SMTP id i7mr4539668wrm.393.1587139553524; 
 Fri, 17 Apr 2020 09:05:53 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56?
 ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id k3sm23665824wru.90.2020.04.17.09.05.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2020 09:05:52 -0700 (PDT)
Subject: Re: [PATCH v5 1/8] drm/fourcc: Add modifier definitions for
 describing Amlogic Video Framebuffer Compression
To: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>
References: <20200416152500.29429-1-narmstrong@baylibre.com>
 <20200416152500.29429-2-narmstrong@baylibre.com>
 <20200417150729.GP3456981@phenom.ffwll.local>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <65879a34-2e31-2908-3cc4-183f62c70ca0@baylibre.com>
Date: Fri, 17 Apr 2020 18:05:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200417150729.GP3456981@phenom.ffwll.local>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/04/2020 17:07, Daniel Vetter wrote:
> On Thu, Apr 16, 2020 at 05:24:53PM +0200, Neil Armstrong wrote:
>> Amlogic uses a proprietary lossless image compression protocol and format
>> for their hardware video codec accelerators, either video decoders or
>> video input encoders.
>>
>> It considerably reduces memory bandwidth while writing and reading
>> frames in memory.
>>
>> The underlying storage is considered to be 3 components, 8bit or 10-bit
>> per component, YCbCr 420, single plane :
>> - DRM_FORMAT_YUV420_8BIT
>> - DRM_FORMAT_YUV420_10BIT
>>
>> This modifier will be notably added to DMA-BUF frames imported from the V4L2
>> Amlogic VDEC decoder.
>>
>> This introduces the basic layout composed of:
>> - a body content organized in 64x32 superblocks with 4096 bytes per
>>   superblock in default mode.
>> - a 32 bytes per 128x64 header block
>>
>> This layout is tranferrable between Amlogic SoCs supporting this modifier.
>>
>> Tested-by: Kevin Hilman <khilman@baylibre.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  include/uapi/drm/drm_fourcc.h | 39 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 39 insertions(+)
>>
>> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
>> index 8bc0b31597d8..a1b163a5641f 100644
>> --- a/include/uapi/drm/drm_fourcc.h
>> +++ b/include/uapi/drm/drm_fourcc.h
>> @@ -309,6 +309,7 @@ extern "C" {
>>  #define DRM_FORMAT_MOD_VENDOR_BROADCOM 0x07
>>  #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>>  #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
>> +#define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
>>  
>>  /* add more to the end as needed */
>>  
>> @@ -804,6 +805,44 @@ extern "C" {
>>   */
>>  #define DRM_FORMAT_MOD_ALLWINNER_TILED fourcc_mod_code(ALLWINNER, 1)
>>  
>> +/*
>> + * Amlogic Video Framebuffer Compression modifiers
>> + *
>> + * Amlogic uses a proprietary lossless image compression protocol and format
>> + * for their hardware video codec accelerators, either video decoders or
>> + * video input encoders.
>> + *
>> + * It considerably reduces memory bandwidth while writing and reading
>> + * frames in memory.
>> + *
>> + * The underlying storage is considered to be 3 components, 8bit or 10-bit
>> + * per component YCbCr 420, single plane :
>> + * - DRM_FORMAT_YUV420_8BIT
>> + * - DRM_FORMAT_YUV420_10BIT
>> + *
>> + * The first 8 bits of the mode defines the layout, then the following 8 bits
>> + * defines the options changing the layout.
> 
> None of the modifiers you're doing seem to have these other 8 bits
> defined anywhere. And it's not encoded in your modifiers. Can't we just
> enumerate the ones we have/need and done?

It's introduced in patch 5

> 
>> + *
>> + * Not all combinations are valid, and different SoCs may support different
>> + * combinations of layout and options.
>> + */
>> +#define DRM_FORMAT_MOD_AMLOGIC_FBC(__modes) fourcc_mod_code(AMLOGIC, __modes)
>> +
>> +/* Amlogic FBC Layouts */
>> +#define DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_MASK		(0xf << 0)
>> +
>> +/*
>> + * Amlogic FBC Basic Layout
>> + *
>> + * The basic layout is composed of:
>> + * - a body content organized in 64x32 superblocks with 4096 bytes per
>> + *   superblock in default mode.
>> + * - a 32 bytes per 128x64 header block
>> + *
>> + * This layout is transferrable between Amlogic SoCs supporting this modifier.
>> + */
>> +#define DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC		(1ULL << 0)
> 
> This is kinda confusing, since this isn't actually the modifier, but the
> mode of the modifer. Generally what we do is only define the former, with
> maybe some macros to extract stuff.
> 
> To make this more mistake-proof I'd only define the full modifier code.
> Definitely don't add a #define with the DRM_FORMAT_MOD_ prefix which isn't
> actually a full modifier code.

Exact, I'll use the same scheme as AFBC: AMLOGIC_FBC_FORMAT_ ...

Neil

> -Daniel
> 
>> +
>>  #if defined(__cplusplus)
>>  }
>>  #endif
>> -- 
>> 2.22.0
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
