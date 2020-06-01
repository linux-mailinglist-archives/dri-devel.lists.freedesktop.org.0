Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3CA1EA53B
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 15:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5198E89DA6;
	Mon,  1 Jun 2020 13:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D7189DA6
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 13:43:55 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id r15so11396197wmh.5
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 06:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fKaKXt1rVsaTRWoPIaJcXCwRkx09K+guPUVHbLfGK+w=;
 b=xOnqyzArdWVJFiihen+Khv60disLzpzhh1F06NTFqXEJKqvJ1VLDYW728SnP2KAp5K
 iZlMAb4h3caicReSKb/8igsyKRUVczPOzjcp3l5hJUWdvTf3EpPcDb1ts3KBnVu6MA2q
 4xfSbtFjx+kOXu0MSagsinK/Ft7/uImVGnPyRd02IxcU9Gi0Oiua1g5P5G97W/f8xH86
 SiRDhhPRYg6bGkYmazimPThlrturM0Vc5Sm1f8KMo/rdj6ZfIe71JjyHtsXrPWouaptZ
 tLEDHd6IyOr6nNmUwdXD3Zwmmo/YyPRTZiKFPmhXmdh0HFMh7v5fOfGlxjDvlthqn5It
 GAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fKaKXt1rVsaTRWoPIaJcXCwRkx09K+guPUVHbLfGK+w=;
 b=N2mPGBiIhjxHdMoUidAj2rOuN9O+JIcpRdpFLFSmFK+KZVucrl4hPG2Ia4b+O3MKrw
 Wu2kflxySuIBK+JaHP64coPFgL407a52N1KNGSRHb7xXaK8PHATGgayTrChx0/2cG8CD
 zwJYBBI4iFNk0kL2YjukJRJRCn8ReUe4zLxHSjIOTUTh6yDINJnIT0z1LRUkXFnLF8Ga
 c3wrhIHu280dbTVetuaI6UOV/Cb6734hVAoBIZB6/OkRrp60KvSYSBuJnx0Ck6S/Bhew
 nyxa4AXlbzRmLpx7toxha5KxbwXB2RZOI1Ex5WcV0L/fClSMhLkPBwpobZGq9jpLJrDb
 zboQ==
X-Gm-Message-State: AOAM532vN2Oa2HwM3Wn6D0KQQoA376WJHRGYNVtT+l4NMnL7Z0JJg0kH
 N8PIwYJS9XCDUQdJ4dTqUICva/r4gfyx3A==
X-Google-Smtp-Source: ABdhPJxI2MsPFx9P3DXUSCMdrhE6zuGahGRBCrLIVnVCEVXj6GzLK11ARnnrTru1NE0u+x7AZa9hmg==
X-Received: by 2002:a7b:c0d9:: with SMTP id s25mr22938509wmh.175.1591019033388; 
 Mon, 01 Jun 2020 06:43:53 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b?
 ([2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b])
 by smtp.gmail.com with ESMTPSA id u14sm12705298wmd.0.2020.06.01.06.43.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 06:43:52 -0700 (PDT)
Subject: Re: [PATCH v3] drm/fourcc: document modifier uniqueness requirements
To: dri-devel@lists.freedesktop.org
References: <WOsdNGp0dhyp8Modsrt7DYpd0fVk7Yk264FISQ1Yls30bhlSXbxzgKTpmOCJ9H2WV1XHyUjCXu7nwBOWQ6n1NCbIcVl1-1IZ4rMMGN1dN-U=@emersion.fr>
 <CAAxE2A4NCo_KMkemUOHKbZ7P=GR4p-zwhpmP7Get18x4Ydb-Gg@mail.gmail.com>
 <bbZABMxDckHUj5JW5DW0pSewqQ-rAIW0gvNnTlI4np7o1A2bDrpPGIeyk5tXGMDr_cAI1l_R9qw6ykJ8OEhQlbKruJ8IG579jqADaPAnUbA=@emersion.fr>
 <CADnq5_MEFM_2k_uboU6E9d3_j18K+tz=Axtie-80PSSwJ2vkYw@mail.gmail.com>
 <CAPj87rMrJLNNbFJVvf081=eRqPqAe1H7=+PM21N22Jdsg7FzVQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <958996c3-2322-8a39-4eb6-1fdce3859fca@baylibre.com>
Date: Mon, 1 Jun 2020 15:43:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAPj87rMrJLNNbFJVvf081=eRqPqAe1H7=+PM21N22Jdsg7FzVQ@mail.gmail.com>
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

On 29/05/2020 15:56, Daniel Stone wrote:
> Hi Alex,
> 
> On Fri, 29 May 2020 at 14:29, Alex Deucher <alexdeucher@gmail.com> wrote:
>> On Fri, May 29, 2020 at 4:59 AM Simon Ser <contact@emersion.fr> wrote:
>>> OK. In this case I think it's fine to make the DMA-BUF import fail, as
>>> we've suggested on IRC. The more-or-less planned fix for these buffer
>>> sharing issues is to revive the buffer constraints proposal from the
>>> allocator project. It's a lot of work though.
>>
>> I get that, but why explicitly limit modifiers then?  Shouldn't we try
>> and do the best we can with what we have now?  If not the situation is
>> not much better than what we have now.  Why go through the effort or
>> adding modifer support in the first place if they are mostly useless?
> 
> Well sure, we could add pitch alignment in there. And height
> alignment. And starting byte offset. And acceptable byte distance
> between planes. And physical contiguity / number of backing pages. And
> placement (system vs. GTT vs. local), which also implies adding a
> device-unique identifier whilst we're at it. And acceptable
> width/height bounds. All of those are perfectly valid constraints
> which could cause imports to fail, and not even an exhaustive list.
> 
> How does Navi ensure that every single linear dmabuf source it can
> ever receive is aligned to 256 bytes today? How does adding support
> for modifiers - something which does solve other problems, like 'every
> three months I wearily review a patch forcing all winsys buffers to be
> allocated for scanout usage for a new random reason, regressing
> performance for a lot of other vendors' - make Navi's situation worse?
> 
>> I don't quite get what we are trying to do with them.  What does this
>> mean "Modifiers must uniquely encode buffer layout"?  We have a number
>> of buffer layouts that are the same from a functional standpoint, but
>> they have different alignment requirements depending on the chip and
>> the number of memory channels, etc.  Would those be considered the
>> same modifer?  If not, then we are sort of implicitly encoding
>> alignment requirements into the modifier.
> 
> Yes, of course some requirements are implicit. Given that tiles are
> indivisible, it makes no sense to have a 64x64 tiled buffer with a
> 32-pixel stride. But that isn't the same thing as encoding an
> arbitrary constraint, it's just a requirement of the encoding.
> 
> The reason why modifiers have been successful and adopted by every
> other vendor apart from IMG, is exactly because they _don't_ attempt
> to boil the ocean, but are the most practical realisation of improving
> performance within a complex ecosystem. The allocator is the complete
> and exhaustive solution to all our problems, but it's not exactly
> going to be done tomorrow.
> 
> Playing a single video today could easily involve a V4L2 codec source
> into a V4L2 postprocessor into Chromium's Wayland host compositor
> through Chromium itself into the host Wayland compositor and finally
> into EGL and/or Vulkan and/or KMS. If you want to figure out what the
> V4L2/DRM/KMS, GStreamer/VA-API/Kodi, EGL/Vulkan, and Wayland/X11 APIs
> look for negotiating a totally optimal layout across at least three
> different hardware classes from at least three different vendors, then
> I'm all for it. I'll be cheering you on from the sidelines and doing
> what I can to help. But the only reason we've got to this point today
> is because Allwinner, AmLogic, Arm, Broadcom, Intel, NVIDIA, NXP,
> Qualcomm, Rockchip, Samsung, and VeriSilicon, have all spent the last
> few years trying to avoid perfection being the enemy of good. (And
> those are just the hardware vendors - obviously Collabora and others
> like us have also put not-inconsiderable effort into getting at least
> this far.)

I have an hard time understanding how this affects the Amlogic Framebuffer
Compression patchset I sent at [1].

[1] http://lore.kernel.org/r/20200529151935.13418-2-narmstrong@baylibre.com

Neil

> 
> Cheers,
> Daniel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
