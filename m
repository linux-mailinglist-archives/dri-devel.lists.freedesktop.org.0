Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6D763CE33
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 05:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7962210E287;
	Wed, 30 Nov 2022 04:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925E710E285
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 04:08:29 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 3DD063200958;
 Tue, 29 Nov 2022 23:08:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 29 Nov 2022 23:08:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669781305; x=
 1669867705; bh=Lmsmf4sJSUA0QJZ9UMg8yw1qEc3/5iR1aDuujhJHzeU=; b=Z
 mF3iPYugU6qKj/U0XOfqj7kTjWE//yP8mj2uuhgmN53KZS+CmHPjd/UnHIZgdPM6
 pCPXJF51r2Cm/r+hX+2vQL3VayLd7G31Pna7v+tH5eXYXror4FWzSJM1qmNkjz3B
 UTFPpPIAC+fgscdJsM1SI9SFiXnCfkmeKPOIE5LzwTeyUnWghBjf4i9eIRcnnaGD
 zGFk8L3rdIsQtLnz1qo8R4D4YZPMlrjGu/u3g4wiuPo1utm5xRSCBwHhx24b7Tk2
 Wqnn4G5YrprRDHpvCaz/uuYZQd7yQ984Raa7gBEcrilFHT9w5aPko32Vr0neprIe
 snUDOvzQrzs3OL08Wefjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669781305; x=
 1669867705; bh=Lmsmf4sJSUA0QJZ9UMg8yw1qEc3/5iR1aDuujhJHzeU=; b=l
 1HiEqJ5rq0Q7FruTDzWCbA4cYO/o+iQnCw0QxCWGasxIHL5Kwh+zmc6dAsifeSDr
 zlerQAgtvUBQ7p3xpWOWU1xkEEEs3PqZLEJHkornjr3k28fBeFIma3/SVGVOM5Et
 jZNOgv0Ue4SYlOF+qizHfXyz0KPixIfPLzqA105qSH6YdJ9Tl5qOb1cIqCILUT+k
 tLcLG8vATax3568bnorxDcyUf4ndmALY/QkbYuM51VZqS16fSCThzJ6I9n+dRH5N
 RyeFyVfUiW8vShMeSvmPNXQu9hvuCkU+OzrEe2IfizUhio7afmkheluZwu14vch6
 IEczGUMLBOfoJqgpM/2DA==
X-ME-Sender: <xms:OdeGY7LdPGCX4FZwIL4BZdl3mrgrDv0KnydrrhXA8oQDCA4MAEPg2Q>
 <xme:OdeGY_JsJq2ILucI9K7O9gKAthMBe5F7z_L6O73k2NwSYv4iX8GmUPzzCuySsId41
 W7fhfe-Yo8pcEPqCw>
X-ME-Received: <xmr:OdeGYzsntoFxxpGQwsNsXHxwTudAHx76cirSDqYpvRf5jAXOohaKTLmEUVHTa0gxdsrGlyHW4jLb2T0QUSXqu6H5zUoD6HtuM_vdYLQWWgUeMvHCIBj7eDQRjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtddvgdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepkeejleelfeeitdfhtdfgkeeghedufeduueegffdvhfdukeelleef
 tdetjeehuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:OdeGY0YiFXspL2KvJIvRJFZKaSAXfNnKpZfYHKgaFxcZGVwd2p7gjQ>
 <xmx:OdeGYyZAlu1Oh_LUC52p31kg7a0znjbUG5jM8DsJtFVh_A7bdZCwOg>
 <xmx:OdeGY4AQir6JVVLn54k_qlsSIblpb0hxAzx5i8xKHfGz0UHuz3PyCA>
 <xmx:OdeGY4NU-Xn33XbikNEUFOdFRfEcyl-CfMEelfqKDiKIE-M419jobg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Nov 2022 23:08:24 -0500 (EST)
Message-ID: <37362a34-0e97-9c31-08fc-6815790c26a8@sholland.org>
Date: Tue, 29 Nov 2022 22:08:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 06/26] drm: sun4i: Define and use generic PM ops
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20221129191733.137897-1-paul@crapouillou.net>
 <20221129191733.137897-7-paul@crapouillou.net>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20221129191733.137897-7-paul@crapouillou.net>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/29/22 13:17, Paul Cercueil wrote:
> Use the new DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS() macro to create a
> "struct dev_pm_ops" that can be used by this driver, instead of using
> custom PM callbacks with the same behaviour.
> 
> v2: Use the DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS() macro instead of an
>     exported dev_pm_ops.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Samuel: since the code changed I had to remove your reviewed-by, sorry
>         about that.
> 
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> ---
>  drivers/gpu/drm/sun4i/sun4i_drv.c | 26 ++++----------------------
>  1 file changed, 4 insertions(+), 22 deletions(-)

Reviewed-by: Samuel Holland <samuel@sholland.org>

