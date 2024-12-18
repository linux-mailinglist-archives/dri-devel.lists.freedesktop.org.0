Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C989F652B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 12:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B0910E02A;
	Wed, 18 Dec 2024 11:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="Gtt4oKTC";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="vRJXlDfe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b1-smtp.messagingengine.com
 (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6059D10E02A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 11:44:55 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfhigh.stl.internal (Postfix) with ESMTP id E1B8525401B9;
 Wed, 18 Dec 2024 06:44:53 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-10.internal (MEProxy); Wed, 18 Dec 2024 06:44:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1734522293;
 x=1734608693; bh=ci7wnLIzNqmNz75nivDXvWBXrlhn2mUTEZWoKXtryRc=; b=
 Gtt4oKTCAz7iXjLBdaJ4fk339JtG6NYSxELsvVQO3k5YvfRM4056SFYMV132AXo+
 gJ9VPV81TwbOU/2+2QIs0CS0impr1wL1ej5OycK14fVy2c8VlKB2xegX/EAlF2QD
 a+3o7S+WGrOvk1ndnDBX2ogjOZuSpGJ3MIIoEdFAfUQ4xcAzl2O5Oqm2M2AbBZYy
 0ePFobymW08vdnAxkJjbVOkaSM1berjAU5/EpWz0NU19fDU113dgHF3FHAxhbw1t
 pZMJFJma0l2lroPBTrg1/GssZ3QYPjch1JZKOWP9DjKWKeMYTCFp2XVaxCNSjw4I
 ftgmhuxxDdB+nLQKgOKYHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734522293; x=
 1734608693; bh=ci7wnLIzNqmNz75nivDXvWBXrlhn2mUTEZWoKXtryRc=; b=v
 RJXlDfeQ8IUknWvagwmoM7Y222DsLiSmJY9Tc88UfLEtRpc1Oiw4fziWVWc7mtRP
 d1TGaeCLMp5KlgDe0Ibu5AkDstLXdEm56HtjUfFuDKeu6JASW0Wo0lDXnOjLTVCE
 XdlAZ1FKoPGrNETptTsqUXCp/3N5cA3DY9CF8On75Z0AiTgkfjDQ4xmEQ664cLc4
 vDXI6uK6jfElAYfT79gh1WXFRyPhuT4jwWDnGvHlaqqXGD9n+MXATgNWBlkQ8Gnt
 Zc0BCpP60DejNWN0GvPXOXsMfkOl6sjwqEVKZ8he/6kfsyk4ripFUcIPNoJrlIxI
 fS74XsYUgkWfxAsOy2a+g==
X-ME-Sender: <xms:s7ViZw_WczuLTGcK5AsmEHe_qCWtQrv9QNJXd1djQ9v_soZwcPGt_Q>
 <xme:s7ViZ4u6bQKtQd9pjfrw1s2oOLJKMXhQmZWPgcKd86-v90xvakU-7EoKLWfO4GEuJ
 2mMujT7WmevCchQFHU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleekgdeftdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
 tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
 hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
 ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
 gvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffg
 vedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduledp
 mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfigvnhhsthestghhrhhomhhiuhhmrd
 horhhgpdhrtghpthhtoheprghnghgvlhhoghhiohgrtggthhhinhhordguvghlrhgvghhn
 ohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllh
 drtghhpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdp
 rhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrth
 hthhhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgrnhhirdhnihhk
 uhhlrgesihhnthgvlhdrtghomhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorh
 hgpdhrtghpthhtoheptghhuhhnkhhurghnghdrhhhusehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:s7ViZ2Cn1RcrBCDROIhRmqeOw2PRvn1kDatQL5l6jneBYFz6OVLnvw>
 <xmx:s7ViZwfwu-sth1xTDkADc8f6UwbsV4pG8Y2C6bAv8U8EzDSQ5o3l9g>
 <xmx:s7ViZ1NBY82dAMyphK71CoxVaOJyTnYiVqFUP-I9NPemy_OCXZDgog>
 <xmx:s7ViZ6n-XVPhlRtDT4PWaOECGCYBRAzgoK0rNqshK3gCOIssX7jvSg>
 <xmx:tbViZwHLykl3Y92jepGrVWSYFaN8pXEfza8ZswrzRsdrTl9L52Dn2M7Z>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id A6BB02220072; Wed, 18 Dec 2024 06:44:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 18 Dec 2024 12:44:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, 
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Dave Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "CK Hu" <ck.hu@mediatek.com>
Cc: "Maxime Ripard" <mripard@kernel.org>,
 "Jani Nikula" <jani.nikula@intel.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Chen-Yu Tsai" <wenst@chromium.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 =?UTF-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Message-Id: <1d8c6f65-5baa-459e-ba34-4e45ca20baf6@app.fastmail.com>
In-Reply-To: <46f871e3-bb1e-4bee-95f3-2121c6a6eef7@collabora.com>
References: <20241218085837.2670434-1-arnd@kernel.org>
 <46f871e3-bb1e-4bee-95f3-2121c6a6eef7@collabora.com>
Subject: Re: [PATCH] drm/mediatek: stop selecting foreign drivers
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 18, 2024, at 11:50, AngeloGioacchino Del Regno wrote:
> Il 18/12/24 09:58, Arnd Bergmann ha scritto:
>> From: Arnd Bergmann <arnd@arndb.de>
>
> The problem is - no PHY no party, it's not going to work without... but 
> I get the
> reasons behind this change.
>
> Are we sure that we can't just add a `depends on PHY_MTK_xxxx` (or extend
> depends on DRM_MEDIATEK && PHY_MTK_xxx)?

Doing this wouldn't cause any problems, but it also doesn't
really help much, you just have to know which devices are
present and enable all their drivers anyway.

We used to just select all drivers from arch/arm/mach-*/Kconfig
on some older platforms, but this was too much of a hassle.

      Arnd
