Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 342A3A38FA7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 00:33:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8F210E07F;
	Mon, 17 Feb 2025 23:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JEO/bCNB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BC410E07F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 23:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739835218;
 bh=LdoZzq7qtMiglzhu00kRaJtsesikQFQgmqj4oShgtzQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JEO/bCNBZRdX7mbbM65vYVr4iQyWDeUcojAo9kKT3nJWtW9bZsprxtF2kpXRSeUpO
 /v4uzzlJeo1l68SC389qUGWLSL8D6a8q76DWWoSw/OMbq4l+yvrPP+AreJPqV5eW2b
 V1ISv89z9tPP8yI8Ggb/BYCgu98EnxTtmOrDhmAobhI5omeOMTJiO/4OOmEajWUCpH
 JY7KP94rvSz5hip/8oAZ//z4w1Ef1MPWauAagzgqzWqB+Ojmk0NTJZpQq71/SC7N4I
 hsZ76kKXobhqrhEza/hNUdtDeue+AWq3nAGeOhWg7gpZMDpA1OtoDkdjYn13cX5lbw
 lCGnQBTCaDC2A==
Received: from [192.168.1.143] (144.232.221.87.dynamic.jazztel.es
 [87.221.232.144])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D17617E1553;
 Tue, 18 Feb 2025 00:33:36 +0100 (CET)
Message-ID: <1b3234ce-4526-4735-b9c0-c242e6cc3cf0@collabora.com>
Date: Tue, 18 Feb 2025 01:33:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HDMI1 PHY PLL clock source
 to VOP2 on RK3588
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: airlied@gmail.com, andy.yan@rock-chips.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, kernel@collabora.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robh@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
References: <20250215-vop2-hdmi1-disp-modes-v1-3-81962a7151d6@collabora.com>
 <20250217024437.35155-1-liujianfeng1994@gmail.com> <5190979.MSiuQNM8U4@diego>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <5190979.MSiuQNM8U4@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 2/17/25 4:33 PM, Heiko Stübner wrote:
> Am Montag, 17. Februar 2025, 03:44:37 MEZ schrieb Jianfeng Liu:
>> Hi Cristian,
>>
>> On Sat, 15 Feb 2025 02:55:39 +0200, Cristian Ciocaltea wrote:
>>> The HDMI1 PHY PLL clock source cannot be added directly to vop node in
>>> rk3588-base.dtsi, along with the HDMI0 related one, because HDMI1 is an
>>> optional feature and its PHY node belongs to a separate (extra) DT file.
>>>
>>> Therefore, add the HDMI1 PHY PLL clock source to VOP2 by overwriting its
>>> clocks & clock-names properties in the extra DT file.
>>
>> There are boards that only use hdmi1 such as ROCK 5 ITX. So there are two
>> choices for this board:
>>
>> 1, Enable hdptxphy0 as dependency of vop although it is not really used.
>>
>> 2, Overwrite vop node at board dts to make it only use hdptxphy1 like:
>>
>> &vop {
>> 	clocks = <&cru ACLK_VOP>,
>> 		 <&cru HCLK_VOP>,
>> 		 <&cru DCLK_VOP0>,
>> 		 <&cru DCLK_VOP1>,
>> 		 <&cru DCLK_VOP2>,
>> 		 <&cru DCLK_VOP3>,
>> 		 <&cru PCLK_VOP_ROOT>,
>> 		 <&hdptxphy1>;
>> 	clock-names = "aclk",
>> 		      "hclk",
>> 		      "dclk_vp0",
>> 		      "dclk_vp1",
>> 		      "dclk_vp2",
>> 		      "dclk_vp3",
>> 		      "pclk_vop",
>> 		      "pll_hdmiphy1";
>> };
>>
>> What do you think of these two method?
> 
> Going by the code in patch1 (+drm-misc) we have:
>   vop2->pll_hdmiphy0 = devm_clk_get_optional(vop2->dev, "pll_hdmiphy0");
> +
>   vop2->pll_hdmiphy1 = devm_clk_get_optional(vop2->dev, "pll_hdmiphy1");
> 
> So the clock-reference to hdptxphy0 should just result in vop2->pll_hdmiphy0
> being NULL and thus ignored further on?

Yep, that is the intended behavior.

@Jianfeng: Did you encounter any particular issue with the current approach?

