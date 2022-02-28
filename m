Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 426314C64CF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 09:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16C210E500;
	Mon, 28 Feb 2022 08:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36B310E4F0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 08:22:55 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 5D0A9320046F;
 Mon, 28 Feb 2022 03:22:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 28 Feb 2022 03:22:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=oWWzwBEMp2oR8q
 lim2q+INm+//ADY2+am6NUMPQ6hE0=; b=nVQMofvCwv6nlsDoqoDeRNFyviG/hZ
 awZXunsX6BWXNQPB3mBg7a6kQ5pA0cb5YagOO1AHNY+7RhOFsURZ+UQ+0raZtrHT
 HpFLxfVNv6LTT3XW1bnxieu8bQvdKztnBP/3UN/uIK7kUxd3GorJ08KpnrIHbav4
 otrLE1usWvDWNqTfjucaWyIXTjjIFWqNAeYEal1XGT7Y0/J8Rk7xQSchXDRxKLPX
 wboovNMDawM1a1DQ3hG6+XUxMAHuh3yWFo0Id/hubdqgBJ/FbDYgbDUjlaaOFtQD
 zQv8ThuDb2rdhUkyBEYDeLR3clZuvSqsfrL1CFC6zxISWiJmGJjJBYLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=oWWzwBEMp2oR8qlim2q+INm+//ADY2+am6NUMPQ6h
 E0=; b=QUVtw+Kb4+gJw7pZLH8jrNEloKRMel9GiGLa3/jIayDsEUk3PQ+rvHJWf
 DKQCU1aCmdG5o4GqlJtc9riLUe/z7dkPhAzl0Agshr5D90fmEFEXcX8AhtVchT2d
 SPMlzIeYXZNHhJ0Yw1b3sHvjoIQ4d93bePbomm8WG5GLf9lS0ZQ1W1oGtUsFkxEv
 r7Kmd8Mal06Iq200HknQG3uqgeua5X9UQqVAMWN9EnTwvaQdTRFuPfApRVFYxjIl
 jrcCSGE3JOjawvNu6F5IcAX2A1Vsfpt/DF/7tSaAztwec/RaxxfvPawQD48a8DfC
 49yHgUz5k4hMb6FnhhfWAeJk1MmvA==
X-ME-Sender: <xms:XYYcYoIgtJwd4s3bNQ1gTiMMIEhk9dtYRcm6F_cK_8zb63MMSHElwA>
 <xme:XYYcYoK_tInMeP56EsOPmrSQfeZLMQ_Qt4kWhzOboqu0j63ova96lnXOoFM00r0ou
 d1HUsLUlrjfIndkX8E>
X-ME-Received: <xmr:XYYcYouuPEXauLv20yu4xp-MPREe4qbdOmTlQcMhlp2o3mtAohBU13TLyzOskg6AKKxD8_cU11fwis5BQrY9kPJAFPlorDm-I5JkurA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleelgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XYYcYlafrraQ2SIb_u1NVzS9CI-qpUokT1ld5j61a3DFxFj-n4whTg>
 <xmx:XYYcYvbfDF9aIUemx3Fqe_--PCOpNS3CvUOaBb192mbCo312uqSoZw>
 <xmx:XYYcYhD8YFVxhpMqWB-yaMRmlC6Jx4BmlTeUzZd41A9M4Aw5XuOyuw>
 <xmx:XYYcYj4utdn4qrJ6U43yaa8xbun2RPzZHNyuw0V2PpHYjcK2Knd6tA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Feb 2022 03:22:53 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH v6 5/5] drm/tiny: Add MIPI DBI compatible SPI
 driver
Date: Mon, 28 Feb 2022 09:22:35 +0100
Message-Id: <164603650749.9024.13469000708169367461.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220227124713.39766-6-noralf@tronnes.org>
References: <20220227124713.39766-1-noralf@tronnes.org>
 <20220227124713.39766-6-noralf@tronnes.org>
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

On Sun, 27 Feb 2022 13:47:13 +0100, Noralf Trønnes wrote:
> Add a driver that will work with most MIPI DBI compatible SPI panels.
> This avoids adding a driver for every new MIPI DBI compatible controller
> that is to be used by Linux. The 'compatible' Device Tree property with
> a '.bin' suffix will be used to load a firmware file that contains the
> controller configuration.
> 
> Example (driver will load sainsmart18.bin):
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
