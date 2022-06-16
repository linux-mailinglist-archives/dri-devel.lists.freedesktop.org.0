Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F1A54DDEB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 11:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B0F113C05;
	Thu, 16 Jun 2022 09:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00097113C05
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 09:10:24 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id DD6295C08C8;
 Thu, 16 Jun 2022 05:10:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 16 Jun 2022 05:10:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1655370621; x=
 1655457021; bh=tH3yyz/R/w6SwWyP5Smkizx4AvpiJ6qYKxqJAFQa5KM=; b=t
 GA2USc8Vt0fl0kOm9WINZfZ8uvM1AbjIzhtkQ66/2haiLNMQ+lhdur+Q0suXLHAD
 Y/89VNUV04D0lw39u0Gh6lw2uFfYphOq/6GdRb3s6VBgUHJ6SYCt0U5JYW6Onp0V
 J+SIEy/cHt3MOgHaok72s+axG4833Y2ZUdRpkNywynFz83ps+FvpP37uGYvUSBf5
 OxDtEmNO75HiCTDo9p4Y0ji6asNwuA9ooiuG86LuK9OesZYINcXhyQnauA2JknDn
 F0tQpI58HGYdjrW7nlxAYOVnCLopH1lrzjQ9OgqHhzlGuH09ywNzRQmoTyOk4U0o
 VLJAMcOETVedJqDlviykA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655370621; x=
 1655457021; bh=tH3yyz/R/w6SwWyP5Smkizx4AvpiJ6qYKxqJAFQa5KM=; b=h
 VOlXfHKbzOpZZo4OvukflfEBz6kHd30orIiMMXe4wBppXARLRXaGKpI/obSOmMS9
 qBFR9KbHAjr8JWizlab4TAFJjrD0Jbu+eTj1kn+S3Zt2nQoyKXlvoGYb+cUe69et
 cq7fg+9lP2ft0aE+p/ubi429wcEO74hiXgw7DwzXg7yRhg9uT/zzWhu245JFwDrV
 uwE+cVfPhWBWD83650Fdzz/LrcJRehTzR0N2l2Kj8/fx9C0DzbYv0hGmWBg1Qm64
 jyipNwlwiBNfeb+MiJlzByQA7oUkxDH5oZxq648kB9MJOKYChZYOAL1S4USpi1XP
 Ck7TPznv8UeZq2AnAcieQ==
X-ME-Sender: <xms:ffOqYus-9CrAJQYW56BGA7pvGBSnANKYZolabvTWGxgcovUt6yqxhw>
 <xme:ffOqYjcIIM1_iRqXS5CINLYYXKfvH0nOkw58IISexQ_QWU1Y7ytDddto5pRHdzipB
 1zlmC-L771Jq1pbIvA>
X-ME-Received: <xmr:ffOqYpxBGVq4ObqsVzWVVKcLkGlKhpmh-t6gZ2G0ViljNBnv-n1Vl7IBCZHU_K_H6nRkW6Vn9k7g4MPkBgyiNBWgI0KbHlQei97yyR8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvfedgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ffOqYpODZhYYQihLYU_ActMjXcQ_oQCdC1J8-v8muXGMju388yt3Jw>
 <xmx:ffOqYu_bo6WSyBE8m2Z_hUXpBoB0VRoz7eQrsfvI3Hxnd0NuVBPFjQ>
 <xmx:ffOqYhX7l0Efczres5pQY-a1YWsd7f1AkclhpWawnQ96SM-26_bAyQ>
 <xmx:ffOqYlkQRn4Fv1OSwCmwl3qUZghejNlRM1QkpN6e8MCmBKKISn6KpA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 05:10:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 00/14] drm/vc4: Properly separate v3d on BCM2711,
 and fix frame ordering
Date: Thu, 16 Jun 2022 11:10:18 +0200
Message-Id: <165537061401.1383579.6623847203556697274.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610115149.964394-1-maxime@cerno.tech>
References: <20220610115149.964394-1-maxime@cerno.tech>
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
Cc: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Jun 2022 13:51:35 +0200, Maxime Ripard wrote:
> Here's a series that fixes a significant issue we missed when adding support
> for the BCM2711 / RaspberryPi4 in the vc4 driver.
> 
> Indeed, before the introduction of the BCM2711 support, the GPU was fairly
> intertwined with the display hardware, and was thus supported by the vc4
> driver. Among other things, the driver needed to accomodate for a bunch of
> hardware limitations (such as a lack of IOMMU) by implementing a custom memory
> management backend, tied with the v3d hardware.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
