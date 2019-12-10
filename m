Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 656791185B8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 12:01:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D066E8B9;
	Tue, 10 Dec 2019 11:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3419D6E8B9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 11:01:34 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z3so19543520wru.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 03:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Rv8ejHYsaFZybwVO6uUzP4+XwTEENn6Dnpdro3k/0Uo=;
 b=smK6rGXm+/6XlBrT7/oxE8mPSBlz41ByYXFTmwzMx/YtC8mg4X2W4szoX+ymqpdxBg
 abTRD/GfQ/7cOz6OCm3iFJvsFiKOwoHAKJ55idYxaH63SW0CRnarbjdvftoEu5k066wr
 8iGR+jC34nCjj5m39o8KzvqH4G7qiw92ZBhRYDPPJmqZg6J4iwCal2+MevPhkpesohIy
 45s1y2oxo2IfhthzrwRWcJH1kZCfQ5kDKOt66b0Ox0plq4g0k55oTmeMmz8zb+MfjOOE
 DRjx5aINff4Tyl/aE+VT4JgJGfGBie3WGFzShie4pm2a44k0JQwWfB3hQhCFUD6oolTm
 dqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Rv8ejHYsaFZybwVO6uUzP4+XwTEENn6Dnpdro3k/0Uo=;
 b=iwE2EBSN/LVhbXvcz+TD+wBRUL7Ru1OhHQ/rXmjk4zhvWIJJ43DKfge41pveYKglEl
 THdJa9Xt6VrljFZ6EkZ78plb092s20KsXyIvLZRofrbaSY39f0DLXdsxMQqOHNE3F1RC
 OgxKumpkLXG3qdHJW+V/F71yDM8rXO3B/PFrtAfqB/7CHAmhguG7y0v0PbIUezUkRupq
 hA+h5mUudvUoCgpCxpyJ4K4/3N4VKXE+f/XURffaUG2e7ddYeyyHpHFScup+mHzy4FDn
 Qa0HELyZrX1L1LETJVtNmcko0KGL3ijDCt6oWoiaD+dmtiFMSNbGe7AO0vSF+fOZQleN
 FHTQ==
X-Gm-Message-State: APjAAAUHiVdmc3qICpIXp9nl3/NLdhuuNTnNa0uFxaQhDVmOYKwlSqf9
 uEM5w7Hu4s1dx9CIq0y9FMJ0EQ==
X-Google-Smtp-Source: APXvYqzi+gI1mR/IeFhp54XAhudd0MHCrMGtaxkswp7FXhXGNzT4x1o80CwNeDOhqVcP/qXL15Ki2Q==
X-Received: by 2002:adf:ffc7:: with SMTP id x7mr2495768wrs.159.1575975692590; 
 Tue, 10 Dec 2019 03:01:32 -0800 (PST)
Received: from [10.2.4.229] (lfbn-1-7161-157.w90-116.abo.wanadoo.fr.
 [90.116.92.157])
 by smtp.gmail.com with ESMTPSA id l4sm2601132wml.33.2019.12.10.03.01.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Dec 2019 03:01:32 -0800 (PST)
Subject: Re: [PATCH v3 0/9] drm/meson: add AFBC support
To: Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org
References: <20191021091509.3864-1-narmstrong@baylibre.com>
 <7hk175rw11.fsf@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <c9e7a62f-0571-4e98-1a80-952d4e1c554b@baylibre.com>
Date: Tue, 10 Dec 2019 12:01:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7hk175rw11.fsf@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, ayan.halder@arm.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/12/2019 23:09, Kevin Hilman wrote:
> Neil Armstrong <narmstrong@baylibre.com> writes:
> 
>> This adds support for the ARM Framebuffer Compression decoders found
>> in the Amlogic GXM and G12A SoCs.
>>
>> This patchset is a merge of v2 "drm/meson: add AFBC support" at [3] and v2
>> "drm/meson: implement RDMA for AFBC reset on vsync" at [4].
> 
> Oops, replied to the wrong series earlier...
> 
>> The VPU embeds a "Register DMA" that can write a sequence of registers
>> on the VPU AHB bus, either manually or triggered by an internal IRQ
>> event like VSYNC or a line input counter.
>>
>> The Amlogic GXM and G12A AFBC decoder are totally different, the GXM only
>> handling only the AFBC v1.0 modes and the G12A decoder handling the
>> AFBC v1.2 modes.
>>
>> The G12A AFBC decoder is an external IP integrated in the video pipeline,
>> and the GXM AFBC decoder seems to the an Amlogic custom decoder more
>> tighly integrated in the video pipeline.
>>
>> The GXM AFBC decoder can handle only one AFBC plane for 2 available
>> OSD planes available in HW, and the G12A AFBC decoder can handle up
>> to 4 AFBC planes for up to 3 OSD planes available in HW.
>>
>> The Amlogic GXM supports 16x16 SPARSE and 16x16 SPLIT AFBC buffers up
>> to 4k.
>>
>> On the other side, for G12A SPLIT is mandatory in 16x16 block mode, but
>> for 4k modes 32x8+SPLIT AFBC buffers is manadatory for performances reasons.
>>
>> The Amlogic GXM and G12A AFBC decoders are integrated very differently.
>>
>> The Amlogic GXM has a direct output path to the OSD1 VIU pixel input,
>> because the GXM AFBC decoder seem to be a custom IP developed by Amlogic.
>>
>> On the other side, the Amlogic G12A AFBC decoder seems to be an external
>> IP that emit pixels on an AXI master hooked to a "Mali Unpack" block
>> feeding the OSD1 VIU pixel input.
>> This uses a weird "0x1000000" internal HW physical address on both
>> sides to transfer the pixels.
>>
>> For Amlogic GXM, the supported pixel formats are the same as the normal
>> linear OSD1 mode.
>>
>> On the other side, Amlogic added support for all AFBC v1.2 formats for
>> the G12A AFBC integration.
>>
>> The initial RDMA implementation handles a single channel (over 8), triggered
>> by the VSYNC irq and does not handle the RDMA irq.
>>
>> The RDMA will be usefull to reset and program the AFBC decoder unit
>> on each vsync without involving the interrupt handler that can
>> be masked for a long period of time, producing display glitches.
>>
>> For this we use the meson_rdma_writel_sync() which adds the register
>> write tuple (VPU register offset and register value) to the RDMA buffer
>> and write the value to the HW.
>>
>> When enabled, the RDMA is enabled to rewritte the same sequence at the
>> next VSYNC event, until a new buffer is committed to the OSD plane.
>>
>> For testing, the only available AFBC buffer generation is the Android
>> Yukawa Dvalin Android Mali blobs found at [1].
>>
>> Both SoCs has been tested using buffers generated under AOSP, but only
>> G12A was tested using a runtime stream of AFBC buffers, GXM was only
>> tested using static buffers loaded from files.
> 
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> 
> Kevin
> 

Thanks,
Applied to drm-misc-next with typo fixup in patches 8 & 9 and review tags

Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
