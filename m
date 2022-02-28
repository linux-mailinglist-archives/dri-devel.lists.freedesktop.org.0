Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA84F4C64CC
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 09:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C49410E4E6;
	Mon, 28 Feb 2022 08:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA5710E4E6
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 08:22:44 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 394A632007BE;
 Mon, 28 Feb 2022 03:22:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 28 Feb 2022 03:22:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=y/TZSuzspLrAiv
 fW6m7k56AnoUM8DgQdsPGEtPlGQ/U=; b=aIDCf3Gbw8uN1CbyWiUdHODHuoagg8
 xyDCkLdg4/C0BMvf5o25/DlllPOB0efNXCtzYi8G/lLT1SSI0E4Ihsh7JgB3Ok3r
 XHfO0CLQcMi/sj+9qDgxb2L+ZzbUMFPShXkUcdubZBq2QNjWG7S6mXH2eJGoofzC
 uiIu9GRyB2jP2JFg3f9KICPfmeMm2sUNLVXbrDIH1lsBjVFRLpIAx/24nTKmbkEX
 6UNpOLHAp7AdTNyxGNLtc8htOGibcrfetdKkuPbwo+tCX49sWzSBzF0QVfpdxNnW
 pLqlZWC88Fx1cyocXnB1PUGPmLrk8uW6r16WME5R+mE1v15L+VbONuzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=y/TZSuzspLrAivfW6m7k56AnoUM8DgQdsPGEtPlGQ
 /U=; b=m0xCVTcULG9OtjQfxdI3cPxrKiz9wJl8mjdUEsu5ZKm2gT2d55VATsXwj
 gVObDcDj6uNQY21/4JFiYZEwEeOUcCqGOxjKRLCQ7qZFZ76nMgq6JW0UlOmaiL0C
 GTwUpj9hk7oErqJp49uO/BojxCMMjyAbY0UXcp92/ycwnFQl1vman+r5QS+DCMSC
 60H9swY8yowlqi9ZOM1DRTP0anPEtopoKxWypSxD42+sdnqgKXASzPcsZ7W8jbqy
 LfC9E9lC3zryuFhU3+YQlnkDJiO0VPmSrj2NGUiWJuDSOqRGTjgHr9iuWji/HyM7
 MFPkr3zFY36gw0d5+ytiBlPNRbuiQ==
X-ME-Sender: <xms:UoYcYrgATwu3sdH_mZV-gxkU1qMZst6ylIWbUx3cZSJsB9pv92wR-w>
 <xme:UoYcYoC63kwhTHX6s08lv9V4yOtFoux9W-lm0pHh45V1jk3W5qx2Bn4W8RtcrNA2N
 jitB5ceSQhQPB3HOQA>
X-ME-Received: <xmr:UoYcYrHAxLs1kaA7IOkrhcZB3CQrIgoSizB6bWXYzrbMOG1cvfxKv8exqooypD64wsNFDE7LKyTic90GLrvMYjCXBmguUPZm9SsL_Gs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleelgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UoYcYoR99B129mCbEgW2YyIX0eJqyg5X-wnjNrlG1dVYCxHPcslAlw>
 <xmx:UoYcYozN0dOubKj_IOrnqaiDVhQ2X_XCz-VDuk3tziaoxL8UVJLnsQ>
 <xmx:UoYcYu7o9hSbu-ijhZSfmh0Bcyoqw_yVvTp2OhXnatHsJGWQ5Ur7Rw>
 <xmx:UoYcYrzka7aPfwYbZReOYFEug6Gx7f5oOBwYpvMM0kOMXW9jSAsjqw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Feb 2022 03:22:42 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH v6 2/5] drm/modes: Remove trailing whitespace
Date: Mon, 28 Feb 2022 09:22:32 +0100
Message-Id: <164603650749.9024.636793535394204506.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220227124713.39766-3-noralf@tronnes.org>
References: <20220227124713.39766-1-noralf@tronnes.org>
 <20220227124713.39766-3-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, thierry.reding@gmail.com,
 Maxime Ripard <maxime@cerno.tech>, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 27 Feb 2022 13:47:10 +0100, Noralf Trønnes wrote:
> Remove trailing whitespace from a comment.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
