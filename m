Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F2E4C64C6
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 09:22:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3E910E4E2;
	Mon, 28 Feb 2022 08:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46C710E4D3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 08:22:41 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id ABEF73200A2A;
 Mon, 28 Feb 2022 03:22:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 28 Feb 2022 03:22:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=l3WtzBvKJIKLtX
 76/reVcaasQQCdci7fUR5vXVMpsYw=; b=BgWHERd0DoA+69t4ea6INdIoxjCE6B
 JrZRu0bOMJyQ05PEeN3K7rKJ3dZJiw1+VER1tnNQB+Cxlk0kxv5OwBuv5LfwOEqG
 CKGaAsX6iCTsP6GH4PmWlYHuYMySrcF4+m5Hy/m9PCYmGd6yAAIdGZ3I7UZEaM6R
 GkmqbwFYsYLlB80AS+9oznv8zm2DYkAnBUVVBP26wv0n2URGZVhY33//1SrcxQuN
 hOpfnSR3NuxHR/0zg+tlMyEnErXqFhjMGao5yzn1ic1W+aRRZbIG8HxsuVDUDyq+
 ledrcwNP3nv+3W6TtP7mmojdBC8LiYfYr7E134uyUEILkfF3ixXIKJ5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=l3WtzBvKJIKLtX76/reVcaasQQCdci7fUR5vXVMps
 Yw=; b=Jal2iZYBQjoqMRvgCkGZQpkdCLIKssnztek0MdmsQZML2TwqefwIrvvj4
 kak1mLHAzirpRmkDtCydRJKmtfLWS082Y4odvNxPws0dek2d9xYlwE3kYDR2jSXK
 kU7QnXMyd4RYvOY6DEmShdBM6buyK/fd1HpCsB7rL9FDgNqLMKTMeW/br4jW6rRc
 MnquLvkjVii2cmC29qnAqhnAWOvhHDkCS8h+9SlXxEmy8JfcVV+qlaVdMhEXYQSi
 xZFxFlEUBKddDCnUdh/Kn8qa6pwX5vMC2gWPuyeQpDJo3xGDOLB5heIz2Y5vuD2I
 BTR15wR/u/nyITGpdjAA1FlYzy/Pg==
X-ME-Sender: <xms:ToYcYteh7si4ld4_wDbFyJ20dv3xG_XAeYx_K3OwiTBd-xFXoT9t8g>
 <xme:ToYcYrMuLN90xPduef5EWYc_hoQ0Z64s8-MlW-8AfyX3sBFLr1md6FGRlqX4N3dEf
 D5m0_E2H7OI2_Oud2k>
X-ME-Received: <xmr:ToYcYmgMKfbTA_S6wqy2hBHOLwltTYTp2bdUhFob823-O0-Mt76hOmLLUeUvu9_3FSvEDCpXyWtR9zvu_86DfZZK282EIpM6OUv6ZFk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleelgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ToYcYm8kY5Vvo6fQ0YsDVevBK1m6tVN8FZqqNTj2HGMPW5Kw3IvxNg>
 <xmx:ToYcYpsBisJd7WVP2gnSFhviUt_E9kTPo9rppK5KvzXXhegwov1IQw>
 <xmx:ToYcYlGN_jfd5skjxy-bvAJ1n10GqGFnQpfapTeW5aYuoJlRIt3O6w>
 <xmx:T4YcYvDeU6mLwqilPH5pmQZdgmd2lhMzFDnGi4qu3XY0GPBqcv70YA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Feb 2022 03:22:38 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH v6 1/5] dt-bindings: display: add bindings for
 MIPI DBI compatible SPI panels
Date: Mon, 28 Feb 2022 09:22:31 +0100
Message-Id: <164603650749.9024.1488147802498728817.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220227124713.39766-2-noralf@tronnes.org>
References: <20220227124713.39766-1-noralf@tronnes.org>
 <20220227124713.39766-2-noralf@tronnes.org>
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
Cc: david@lechnology.com, devicetree@vger.kernel.org,
 dave.stevenson@raspberrypi.com, thierry.reding@gmail.com,
 Maxime Ripard <maxime@cerno.tech>, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 27 Feb 2022 13:47:09 +0100, Noralf Trønnes wrote:
> Add binding for MIPI DBI compatible SPI panels.
> 
> v6:
> - Fix indentation (Rob)
> 
> v5:
> - Add sainsmart18 to compatible items (Rob)
> - Expand write-only description (Sam)
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
