Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDE15925DD
	for <lists+dri-devel@lfdr.de>; Sun, 14 Aug 2022 19:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8EE59668D;
	Sun, 14 Aug 2022 17:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0D4965E5
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Aug 2022 17:54:45 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id D11373200413;
 Sun, 14 Aug 2022 13:54:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 14 Aug 2022 13:54:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1660499681; x=
 1660586081; bh=rg5A4PneXluGDG51+pizXl8CwAXEzj0HygpUz3KfuU0=; b=k
 t/a6rRNBrJpta/FUoyDpMq5odlszXC2rivLR5tqgVAkWn8GMr9kzvwstfIa6W7Mm
 cxS1+vJJfngCm2EH8Ix1PFB6Mo1zXujAuPct0zC+MesFucxkrZRZLh0bEACeUJWx
 5XJxtjN+VlJDOTTcNcngmjA/ofeznMkJ3RI9at58AdeuUy46zNq8ngp9Z2wkWAa1
 V9xcANB6kD9kKd1Uv8rIiQnrqR+N9D3KsjBnYzAxoIYegQ2EFowP+hnT/5/2YCsq
 9BiOxFUpMYlzeEHHO9SyMIQPvXrGHU54gDKWYy8gUsjFjK0d+/QKT8MNmW3DmJ8U
 EGcLlzzRQ5CpcB9dwkA0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660499681; x=
 1660586081; bh=rg5A4PneXluGDG51+pizXl8CwAXEzj0HygpUz3KfuU0=; b=F
 KQVJnQl9ap/WznUnkz5+LpehylIOQNrL7uMR5T6Edte+JHQZcrV4Y1PU4UoARazQ
 VyPI0oythbIDrBv4L+QHOEj6sV6Gr4wYTapdiUVdhLjq/+EGApreyhHBGVcX98c5
 IPtYkdrfWW8sIt/mExNB/vTgDocCrEqpRsJQotSz3GA4cCZ3Kb4wun2ZdgkqjMbX
 XBY1uikGfAzsIutcA+ESbxmBbgBYPdNaIWI69pZ+KTjPcxpsmynjk40g/b3cmlQF
 D3mpDIq53R/xSH3J/JP3W+sHJwDbI362AGVmGHiwr6OB2Jyve06Psg3KpE6vIyT2
 LbJLXI5K7cOcHp0DyQgbA==
X-ME-Sender: <xms:4Tb5YrTEs2KOEwa4hE8qQyp6l5A2BE-k6tjE5LfDpOP9WTT3a9uDRg>
 <xme:4Tb5YsyUKj-f9N52JZbmbB-aiP1D4jkkNDVOuYazrsuQUUE5PhMNMJdhfnrtM-gXR
 e6xSHjlG783yctZ3w>
X-ME-Received: <xmr:4Tb5Yg37QDLjpXLjvA0mA39-KYA6GGZXwKc3K1kK3SyFtD0LAFBnenl8qMZcbHrYg0H6K5H_PdDmyTcEDQbxyI4H9i3dEzgB2meJRGQpqVvXS9-oeWQrKT3EIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehtddguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefuvfevfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgr
 mhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqne
 cuggftrfgrthhtvghrnheptdevhfehhefgvdekteffleduueduheduuedvtdevleelkeev
 vdeuvdeihfekueehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:4Tb5YrD-F8LK1lI1jECLiaAEoEl_lKIT2zEY_HTLg2H4jReNIIpdQA>
 <xmx:4Tb5YkhVjdmuSQvPTgZ2cx1lxbJfE2jBoWrjAwYlDku1_wiybtvtIA>
 <xmx:4Tb5YvqbEitNLqYJ9NR_bCQZ7n-C003raaAu3KUD2xwSYZ_hxU2jiA>
 <xmx:4Tb5Ygjq0j3-SeolZmylSueGRY3XVGcLWpvcCSNL0WAYs1HkXqcnpw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 14 Aug 2022 13:54:40 -0400 (EDT)
Subject: Re: [PATCH] drm/sun4i: dsi: Prevent underflow when computing packet
 sizes
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>
References: <20220812031623.34057-1-samuel@sholland.org>
 <8100632.T7Z3S40VBb@jernej-laptop>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <093fee4d-d0b9-c6f2-8dde-d50b514fbc69@sholland.org>
Date: Sun, 14 Aug 2022 12:54:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <8100632.T7Z3S40VBb@jernej-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/14/22 2:55 AM, Jernej Škrabec wrote:
> Dne petek, 12. avgust 2022 ob 05:16:23 CEST je Samuel Holland napisal(a):
>> Currently, the packet overhead is subtracted using unsigned arithmetic.
>> With a short sync pulse, this could underflow and wrap around to near
>> the maximal u16 value. Fix this by using signed subtraction. The call to
>> max() will correctly handle any negative numbers that are produced.
>>
>> Apply the same fix to the other timings, even though those subtractions
>> are less likely to underflow.
>>
>> Fixes: 133add5b5ad4 ("drm/sun4i: Add Allwinner A31 MIPI-DSI controller
>> support") Signed-off-by: Samuel Holland <samuel@sholland.org>
>> ---
>>
>>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
>> b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c index b4dfa166eccd..34234a144e87
>> 100644
>> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
>> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
>> @@ -522,77 +522,77 @@ static void sun6i_dsi_setup_format(struct sun6i_dsi
>> *dsi, SUN6I_DSI_PIXEL_PF1_CRC_INIT_LINE0(0xffff) |
>>  		     SUN6I_DSI_PIXEL_PF1_CRC_INIT_LINEN(0xffff));
>>
>>  	regmap_write(dsi->regs, SUN6I_DSI_PIXEL_CTL0_REG,
>>  		     SUN6I_DSI_PIXEL_CTL0_PD_PLUG_DISABLE |
>>  		     SUN6I_DSI_PIXEL_CTL0_FORMAT(fmt));
>>  }
>>
>>  static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
>>  				    struct drm_display_mode *mode)
>>  {
>>  	struct mipi_dsi_device *device = dsi->device;
>> -	unsigned int Bpp = mipi_dsi_pixel_format_to_bpp(device->format) / 8;
>> +	int Bpp = mipi_dsi_pixel_format_to_bpp(device->format) / 8;
> 
> Nit: mipi_dsi_pixel_format_to_bpp() can return -EINVAL in case of unsupported 
> format. Would it make sense to check it?

The switch statement in mipi_dsi_pixel_format_to_bpp() handles every value in
the enumeration, so I think the -EINVAL is just there to keep GCC from
complaining. If we do want to handle this case, it would need to be in
sun6i_dsi_attach(), since the other places we use mipi_dsi_pixel_format_to_bpp()
are way too late to handle any errors.

Regards,
Samuel
