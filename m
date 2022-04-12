Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD294FCCC2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 04:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC8910FBEB;
	Tue, 12 Apr 2022 02:56:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DC710FBF9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 02:56:37 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 876B83201134;
 Mon, 11 Apr 2022 22:56:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 11 Apr 2022 22:56:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1649732194; x=
 1649818594; bh=GEVsmM8mHkm2qG9DTDJgBu3H8Y9rP3KCaLB0pTjkV5s=; b=G
 vqYuC1RwjHaEKN20jPrg/yicidZ2nqNoJ2CRITPHmY8knRo/a5PW1Vy4vqkM3pwT
 5VDLFmJe3UFS9YexgXgpQh86JUP4Z/0Yny4uZS2sES2N369XBtiqju2ferrZeM1B
 EVgxPioUk3DEYHXigkKmoNWDs6DEFsD4KH+73n7O1jZrDuHPb44lynRpfeSXAHax
 PUixnA2yP1Fx0xqY3HsudNMdKJhlKYw2QWAf4XltHPgOwX7Xw1X3eFKeEyDfEySO
 VCztEDKxjBxg4jwkfQnlcQG0zgmkLKyJD5f6/hz6318UMmHSjxUTvnnw2hEd69SX
 /ImufdQIXHcxh3QwzPF3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1649732194; x=1649818594; bh=GEVsmM8mHkm2q
 G9DTDJgBu3H8Y9rP3KCaLB0pTjkV5s=; b=RHbmbrRjpYdes/hY+qNpyMtTGA7Vt
 v2o9jaYz/ghQV6r/b4JabiNX+DQvyNWpIplpm9DsWnG1rL0YacZ/FII8Im4+9TQ5
 BkZFmDys9Z6d5gtgEumkx68/TZm6SNXJv/LaJ39wrbgE91AVMJeP06ruZzgce1jh
 Bh2EnPTB2mGhwOqWnaDOgo1STWlEB3YQZ4lZ8AK7A8srL8rQ8OdceAbdN5f/zcSK
 qc7z6vrhpxvsEf+WBn6Rw4mHcHzo0FQ+Vs/qWEcUGhVYysGYe7EhAehi9TbWaMP6
 FhmBO0cGcpg1TMr8dom4wAPI6hnA4Wmb79ZHcAvjmKRTOAQndkFTuCNIg==
X-ME-Sender: <xms:YepUYg6C6oiPRMxmgjjI9LV9IbU33EiZ1mglFefbQN4WmAhMKqy8Cg>
 <xme:YepUYh4QkE1fWKFstK5Ua-ye-x2udMZOn9KRNzoNmsiPMSmb24DnCyoAET15gBE9J
 tIJ86wWpx7Ivv6emg>
X-ME-Received: <xmr:YepUYvco2kvij6BP1YI2gzxmwuw4qePQhGGUawxvLTRjl-WKn-P1AAw4GsfrR1k2DZHOZeutCH4N0TZJB5aIyT3FApUy2Feft4T_CirlkG7lFA0iphTQGeeUHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekjedgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepgfelkeduveejtdejhfeiledvhfeggeeiieeklefhfeefffffffeg
 udetteelieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:YepUYlLHSIcWA_HfEcGpcgURZgVRR5Jquw3pvxmwwBAK81VncHqRKg>
 <xmx:YepUYkJO7BQTpjaeGpZlDZDnr6zO9VMyHr9RtT_k3tlGfqwkIovYHA>
 <xmx:YepUYmw6qxhWvT_NAC1uJnjAZ-_Y7zefUor75-DkmBLEaBlXWjxyzA>
 <xmx:YupUYhD16u6z1peFxWat0RxNgFZVyHG8fe8B4pjvTgWzoB_gN1q2kA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Apr 2022 22:56:32 -0400 (EDT)
Subject: Re: [PATCH 03/10] drm/sun4i: Remove obsolete references to PHYS_OFFSET
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>
References: <20220411043423.37333-1-samuel@sholland.org>
 <20220411043423.37333-4-samuel@sholland.org> <3167527.44csPzL39Z@kista>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <04d64c79-8379-7fad-2554-c8b88d733ec0@sholland.org>
Date: Mon, 11 Apr 2022 21:56:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <3167527.44csPzL39Z@kista>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/11/22 10:37 AM, Jernej Škrabec wrote:
> Dne ponedeljek, 11. april 2022 ob 06:34:15 CEST je Samuel Holland napisal(a):
>> commit b4bdc4fbf8d0 ("soc: sunxi: Deal with the MBUS DMA offsets in a
>> central place") added a platform device notifier that sets the DMA
>> offset for all of the display engine frontend and backend devices.
>>
>> The code applying the offset to DMA buffer physical addresses was then
>> removed from the backend driver in commit 756668ba682e ("drm/sun4i:
>> backend: Remove the MBUS quirks"), but the code subtracting PHYS_OFFSET
>> was left in the frontend driver.
>>
>> As a result, the offset was applied twice in the frontend driver. This
>> likely went unnoticed because it only affects specific configurations
>> (scaling or certain pixel formats) where the frontend is used, on boards
>> with both one of these older SoCs and more than 1 GB of DRAM.
>>
>> In addition, the references to PHYS_OFFSET prevent compiling the driver
>> on architectures where PHYS_OFFSET is not defined.
>>
>> Fixes: b4bdc4fbf8d0 ("soc: sunxi: Deal with the MBUS DMA offsets in a central 
> place")
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
> 
> Good catch! Actually, people complained about non-working display on 
> Cubietruck IIRC, which has 2 GB of RAM.
> 
> Did you test this on HW?

The only DE1 board I have is an A33 tablet with 512 MB of DRAM. So while I
boot-tested the patch, I am not able to verify if it has any real effect.

The reason for sending this is that folks ran in to compilation errors on
RISC-V. And I was surprised to still see references to PHYS_OFFSET, since
sunxi_mbus.c includes the frontend compatibles.

Regards,
Samuel

> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Best regards,
> Jernej
