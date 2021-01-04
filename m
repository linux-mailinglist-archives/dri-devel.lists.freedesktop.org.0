Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CD02E95F4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 14:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9905689F06;
	Mon,  4 Jan 2021 13:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C43689F06
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 13:29:12 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id w5so32131516wrm.11
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jan 2021 05:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CeT1gpZAsO0ZqFeo+qXRWjnihFBZp/Zvxstr2M1W2a4=;
 b=oEE8jU7gcio8gOy5LjnxQ6xWzkjlhrxcCm4c8u4CQ4YwD8wGQldewFZLoIx4WE+zJK
 am8IqWqYyZH+RtR/caotqBCv0QWrMbFe6ycwi3Z/F8DtWutbF4WKc+SWEtiCd8jvkfTF
 iqepCnDD/Qxo2CgI/kRvZf1J0scisOpYmhFHVU2/Hxdj3BobEPL1cii+WCi4CogBNcHX
 7oO6UEN+pKEkY8j0MurK+FEHEoHUm5JWXGe/tzW3Sf9YphZwQ0PA7AH5QdnUZoXMbaCm
 O8VS2S0runpdHO/uqbBQviRG9Ig8Vgc+bdmP05nbMO6INZgYL/km0WvXOHvDRcvLpLls
 0+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=CeT1gpZAsO0ZqFeo+qXRWjnihFBZp/Zvxstr2M1W2a4=;
 b=lFB38m70CQdbPv1FyJq7bTapMwMu0XEcZ0jXLK7AyESNLepIPgCBzYDTEC1c8UN788
 QFKBydyUiKIICkmJLXKMTJ8qSm87f74fknaiR0ir51nEefRzWDhD2ZE5StnUNWZKDeqN
 Dos7Psj7UhrPwCrtm83NMYGGY83JPetH4YVJXiQMYqkQNcuwHg4cj/1uNEXiWQFJT8NE
 vt9SLaQmpPRDNVphhmlh/hES74ml5xRbV1Kiq23HXL2KQzGxlQh0n5lbWOir/I2XAB2f
 b3zXmLz3L1AHGk3GbE3C1/T/BdCDeLs9Y/Bi84EIYML/vnWe1XZd1ChR1NZOg2PsjSr8
 UA7A==
X-Gm-Message-State: AOAM530NZHuajY5q6Y70K1JZ69n8zg1wOv5Oaauv9Vft6CpbIMWty0JC
 eDAM1J7j+3aYBpaEKB644rHjVA==
X-Google-Smtp-Source: ABdhPJwrOR+x0g02hObd9ySh3hZiz/yyh9pFuaUzGtXfgB8R8bMcCJj0xBPFnoqDUj8syvkdr+F1+Q==
X-Received: by 2002:a5d:498a:: with SMTP id r10mr79337606wrq.238.1609766950793; 
 Mon, 04 Jan 2021 05:29:10 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:17a:9662:5ead:50af?
 ([2a01:e35:2ec0:82b0:17a:9662:5ead:50af])
 by smtp.gmail.com with ESMTPSA id r15sm89538602wrq.1.2021.01.04.05.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 05:29:10 -0800 (PST)
Subject: Re: discussion: re-structuring of the Amlogic Meson VPU DRM driver
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <CAFBinCA4EnbJZ5HnWzqP-LdLJE0FD_nGqA6PxdQaR5KfETgvTQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <57a65a09-606a-8773-e1ff-4202e83779c8@baylibre.com>
Date: Mon, 4 Jan 2021 14:29:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCA4EnbJZ5HnWzqP-LdLJE0FD_nGqA6PxdQaR5KfETgvTQ@mail.gmail.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Sorry for the delay...

On 31/12/2020 00:24, Martin Blumenstingl wrote:
> Hi Neil and all interested people,
> 
> in the past there were concerns about how some of the components are
> coupled in our Meson DRM driver(s).
> With this discussion I would like to achieve four things:
> 1. understand the current issues that we have> 2. come up with a TODO list of things that need to be tackled as well
> as recommendations how to solve it (for example: "driver ABC function
> ABC uses the recommended way - take that as reference")
> 3. one by one work on the items on the TODO list
> 4. add support for the 32-bit SoCs to the Meson VPU DRM driver
> (without adding more "not recommended" code)
> 
> Disclaimer: I am not familiar with the DRM subsystem - so apologies if
> the terminology is not correct.
> 
> drivers/gpu/drm/meson/meson_dw_hdmi.c currently serves four purposes:
> 1. manage the TOP (glue) registers for the dw-hdmi IP
> This is Amlogic specific and consists of things like HPD filtering,
> some internal resets, etc.
> In my opinion this part is supposed to stay in this driver
Yep, it's tightly coupled to the DW-HDMI core

> 
> 2. load the driver for the dw-hdmi IP by calling dw_hdmi_probe()
> I read somewhere that this is not recommended anymore and should be replaced.
> Is my understanding correct and what is the recommended replacement?
Yeah in fact the dw-hdmi glue should be a pure bridge, not a component anymore.

This means it should probe by itself entirely, should not use the component stuff.

This also means all the VPU related part (mainly encoder and clock) should be moved
out of this file as a bridge and built with the meson_drm driver,
then find the "next bridge" like other drivers.

> 
> 3. it manages the HDMI PHY registers in the HHI register area
> For the 32-bit SoCs I will not follow this pattern and will create a
> separate PHY instead.
> As a long-term goal I think we should also move this into a dedicated
> PHY driver.

I looked at it, and ... it's complex. For the 32-bit socs it's easy because
you only have a single PHY setup, for the new gens you have to deal with the
4k modes and co. This could be handle by adding a new parameters set to the
phy_configure union, but what should we add in it to be super generic ?

> 
> 4. call back into VPU/VENC functions to set up these registers
> This is a blocker for 32-bit SoC support as I would have to duplicate
> this code if we don't make any changes. This includes things like
> calculating (and setting) clock frequencies, calling
> meson_venc_hdmi_mode_set for setting up the DVI pixel encoder, etc.
> My understanding is that this part should not be part of the
> meson_dw_hdmi driver, but "some other" driver. I don't understand
> which driver that's supposed to be though and how things would be
> wired up in the end.

Yep it should be a bridge. You can chain bridges, it's designed for such use case.

We will have internal bridges for encoders, ENCL+ENCP grouped for HDMI and ENCL.
CVBS can be handled separately without bridges.

I can have a try to move stuff if you can review/test on your side.
Would it be a good start ?

> 
> In addition to HDMI my understanding is that for adding MIPI DSI
> support you would
> a) either have to follow the pattern from the meson_dw_hdmi driver or
> b) also require some better way to achieve this

With the cut I described before, we'll need a add a simple ENCL bridge
in meson_drm and a standalone bridge for dw-mipi-dsi.

> 
> The biggest question marks for me are #2 and #4 from the list above.
> Also is there anything I have missed?
> Any input, feedback and questions are welcome!
> 
> PS: an additional topic on the TODO list will be "use the common clock
> framework" for clock setup. it's currently not clear to me if that's
> possible on the 64-bit SoCs in all cases.

It's the same issue for 4k & co, the high freqs needs special PLL settings,
not sure how this would be easily doable in the PLL driver.
We may need to add a gx/g12 HDMI specific pll driver.

> I will start a separate discussion for that topic after this one.
> 
> 
> Best regards,
> Martin
> 

Thanks for starting the thread !

Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
