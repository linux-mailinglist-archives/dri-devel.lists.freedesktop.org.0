Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AB6C618D2
	for <lists+dri-devel@lfdr.de>; Sun, 16 Nov 2025 17:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E190E10E008;
	Sun, 16 Nov 2025 16:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=szczodrzynski.pl header.i=@szczodrzynski.pl header.b="dChcKejM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s2.avantea.pl (s2.avantea.pl [46.242.128.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B992810E008
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 16:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To
 :From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3AI6JmJhcwuhEb8w2rCn481ZaFZecrvEQW0hTE6A4PI=; b=dChcKejMcVLikLUeYy13kwBPB5
 PTrr66YW7PrOXmQ3wOMUVTv+sSTDqHxJBud6u9p8pVaZcFAjvCn3bEykUrCHl8RcQurn3r/zrCJli
 i1i7Kmlu+amQrGvFva303/WBsmtDacT9Ze/Df4VTtHeYeHRzoPm2PaRcNyJECYbDTpZxmOWcY6uml
 hoFZ+y17qOrCzuyGGfW8LaJF/j4k/I6j2yvDxWyCObtIM0mXdqnDGpg+GWOfVD4bKjuZr26EBrMgc
 vW8b3iv/mDwpg9Yf7Hyh4FoLpAbS4iiOlmJdSA7+wg0rrUSWeKResozvUNnbmJnehsHhCIMhIKrXu
 KXdM61mQ==;
Received: from d100-116.icpnet.pl ([77.65.100.116] helo=[192.168.0.120])
 by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <kuba@szczodrzynski.pl>)
 id 1vKfvv-0000000FgWV-3qyn; Sun, 16 Nov 2025 17:48:59 +0100
Message-ID: <cc1562aa-97de-409f-b50f-0d6a22c6946c@szczodrzynski.pl>
Date: Sun, 16 Nov 2025 17:48:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] drm/sun4i: Support LVDS on D1s/T113 combo D-PHY
To: wens@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 parthiban@linumiz.com, paulk@sys-base.io
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20251116134609.447043-1-kuba@szczodrzynski.pl>
 <CAGb2v67V01k8zj2r+Dd+JDEsH2LX2Jtx+CP=i8aQfX_JyFtLfg@mail.gmail.com>
 <7ff30ae9-e4c0-47ae-80ad-726eaa557fd0@szczodrzynski.pl>
 <CAGb2v67iovqfErt20Oz0SrHC558zBDDFq1ZqRau83NOQ2w8AoQ@mail.gmail.com>
Content-Language: pl
From: =?UTF-8?Q?Kuba_Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
Autocrypt: addr=kuba@szczodrzynski.pl; keydata=
 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
In-Reply-To: <CAGb2v67iovqfErt20Oz0SrHC558zBDDFq1ZqRau83NOQ2w8AoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: kuba@szczodrzynski.pl
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

W dniu 2025-11-16 o 15:37:15, Chen-Yu Tsai pisze:

> On Sun, Nov 16, 2025 at 10:31 PM Kuba Szczodrzyński
> <kuba@szczodrzynski.pl> wrote:
>> W dniu 2025-11-16 o 15:03:18, Chen-Yu Tsai pisze:
>>
>>> On Sun, Nov 16, 2025 at 9:46 PM Kuba Szczodrzyński
>>> <kuba@szczodrzynski.pl> wrote:
>>>> [replying to v1 to keep the same series on Patchwork]
>>> That is not the right way to do it.
>>>
>>> If you reply to an old series, the tooling does not pickup the new version
>>> as a separate series.
>>>
>>> ChenYu
>> Hi,
>>
>> I noticed that it indeed didn't work. However, Patchwork didn't pick up the v2 cover letter at all, so I thought replying to v2 would mess up the thread even more.
>>
>> That being said, the v3 cover letter is not visible there either.
>>
>> Should I resend this as v4 [which message to reply to?] or send a completely new series perhaps?
> Each new version should be a completely new series.
>
> If patchwork still didn't pick it up, then it's possible either your
> patches didn't reach the mailing lists or the patchwork instances.
> Please check lore to see if your patches are there.

The patches are on lore, but patchwork didn't pick them up because some were sent with the wrong In-Reply-To header, and that created threading issues.

Assuming I understood your reply correctly, I'll send the entire series as v4 *without* the In-Reply-To header, which will create a new series on patchwork.

Regards
Kuba

>
> ChenYu
>
>> I apologize for the confusion, this is my first time doing that.
>>
>> Regards
>> Kuba
>>
>>>> Some Allwinner chips (notably the D1s/T113 and the A100) have a "combo
>>>> MIPI DSI D-PHY" which is required when using single-link LVDS0. The same
>>>> PD0..PD9 pins are used for either DSI or LVDS.
>>>>
>>>> Other than having to use the combo D-PHY, LVDS output is configured in
>>>> the same way as on older chips.
>>>>
>>>> This series enables the sun6i MIPI D-PHY to also work in LVDS mode. It
>>>> is then configured by the LCD TCON, which allows connecting a
>>>> single-link LVDS display panel.
>>>>
>>>> Changes in v2/v3:
>>>> - Applied code formatting changes from review comments
>>>> - Changed "dphy" to "combo-phy"
>>>> - Made the LVDS setup/teardown functions abort early in case of error
>>>>     (adding a proper return value would require changes in several levels
>>>>      of caller functions; perhaps could be done in a separate patch)
>>>> - Added the PHY properties to DT bindings
>>>> - Renamed lvds0_pins to lcd_lvds0_pins
>>>> - Rebased on top of drm/misc/kernel/for-linux-next
>>>> - Hopefully corrected the incomplete patch list of v2, which happened
>>>>     due to an SMTP error
>>>>
>>>> Kuba Szczodrzyński (6):
>>>>     phy: allwinner: phy-sun6i-mipi-dphy: Support LVDS in combo D-PHY
>>>>     drm/sun4i: Support LVDS using MIPI DSI combo D-PHY
>>>>     drm/sun4i: Enable LVDS output on sun20i D1s/T113
>>>>     dt-bindings: display: sun4i: Add D1s/T113 combo D-PHY bindings
>>>>     riscv: dts: allwinner: d1s-t113: Add D-PHY to TCON LCD0
>>>>     riscv: dts: allwinner: d1s-t113: Add LVDS0 pins
>>>>
>>>>    .../display/allwinner,sun4i-a10-tcon.yaml     |  6 ++
>>>>    .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 11 +++
>>>>    drivers/gpu/drm/sun4i/sun4i_tcon.c            | 50 +++++++++++++
>>>>    drivers/gpu/drm/sun4i/sun4i_tcon.h            |  6 ++
>>>>    drivers/phy/allwinner/phy-sun6i-mipi-dphy.c   | 70 ++++++++++++++++++-
>>>>    5 files changed, 141 insertions(+), 2 deletions(-)
>>>>
>>>> --
>>>> 2.25.1
>>>>
