Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A71634C64CA
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 09:22:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4398910E4D3;
	Mon, 28 Feb 2022 08:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A9F10E4D3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 08:22:47 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 746903200A2F;
 Mon, 28 Feb 2022 03:22:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 28 Feb 2022 03:22:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=yAx5tzc+tjGpKN
 QgZMmCqGWP6FIzUwdpC9XL1nAPJCI=; b=v6wo5EAXm4MeAe9sXjUUUh9TjUZcqh
 XLryhxTbDIaBhIGOL0+eeL96hNQUSw+m9/TXkCOryP5k+gPHaUPeDyrM2r5XGAb1
 uHhBrnVdHQ6Zmqi2TJF/eiwEsauGW1+U1Rr2Qb27PUqUiVUi/ghIw12CMu/Yh5EA
 9sRk2j2U49NJue7fZcZj3Cb66tFHaTRTdhaQ0JC5cHiD5dFi0Lm+K0xC6vf0xRAf
 KEISXT4lGBFiqenqxmo1E37wcJKYO1VeV0u8pvQPZ5y2KMoSVkKB2S2RlvVSrLYq
 xIRTamvS0M06LfxxyhMrRQ08TfmMiuH6k00yEb1o9rip5bb4UUO6nu6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=yAx5tzc+tjGpKNQgZMmCqGWP6FIzUwdpC9XL1nAPJ
 CI=; b=ZqSvePjw9O4wqMsCf8NdHUzZ+eDimAszH4ymPYebmzixv66BlMnpOiqB0
 SMfsheUPXmAzks8DJgwORHyEcoicz7mjcHmveRDxKp7KpIGTrP4C6w2naYiZ2MVs
 9vN/S5NBTcZEoD0OO7YwsvxO03c9mWsqeLX2C8fnyhnpCtc9MYmjlERNShOPl652
 syRyOznl3daIUtfQ8NiLzuWnT03gBVRYrSII6yCLQs47hCg9fpMACf+x+iOZBQ6q
 njZrNYeATBT12TWV3uBis13SBq3OH/+mJlLckC6XeqDdxrIDezwaM7enH2bb7RHQ
 r8fo3umKlyS0znxTpCkKLlZGOvvug==
X-ME-Sender: <xms:VYYcYu74R6UBs2VyShTqwPYZoAWWSntnyzgOc9aBfjM2tlT7es0RaA>
 <xme:VYYcYn7tqDArO135l3Tpv5gJ6yKyv86v-rZ4J580CZdvspcoalHzfBg1TmkFtZfud
 b5hzzIDY2h_Y8J9ZHU>
X-ME-Received: <xmr:VYYcYteq1KgWgodh7_Ivry73KYhcnNiZH0iSiAyHCMWi4_sEQLCJ8rHwberQcjzBrVhddmaB6nZ6m3McjZZMhdIc_960jKXQdBUkxcM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleelgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:VYYcYrJTISkoV3_rdnzFyTYKh1QAlRpGJPynOkRgteGvKLNu_WEaeA>
 <xmx:VYYcYiJTvjS_gr1GU1YR3bXY5dK6JnhzEnZAcMdcxjdt7UCd8JKRSw>
 <xmx:VYYcYsyN-BOLusDu90uTWZHrcKbxuP6PWCiUU6p5pydCXwpFkS8pNA>
 <xmx:VoYcYjrTQHyL7gRwrzhCGCPpZdy2yfZdLsJ9kcIc0_udEnI1o0gF4Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Feb 2022 03:22:45 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH v6 3/5] drm/modes: Add
 of_get_drm_panel_display_mode()
Date: Mon, 28 Feb 2022 09:22:33 +0100
Message-Id: <164603650749.9024.17189490257748263930.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220227124713.39766-4-noralf@tronnes.org>
References: <20220227124713.39766-1-noralf@tronnes.org>
 <20220227124713.39766-4-noralf@tronnes.org>
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

On Sun, 27 Feb 2022 13:47:11 +0100, Noralf Trønnes wrote:
> Add a function to get a drm_display_mode from a panel-timing
> device tree subnode.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
