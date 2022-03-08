Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A224D1597
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 12:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25ED810E298;
	Tue,  8 Mar 2022 11:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD9110E260
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 11:05:02 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id D69B13200D60;
 Tue,  8 Mar 2022 06:05:00 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 08 Mar 2022 06:05:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=IZJXw3OylIMetL
 y3x2akI/CNvnobcGXdBeKGkdnjc3M=; b=kUvix9QsQtydDMOS8Idf0MpjGvYQC3
 LlxRAfIE1r0tuquR6yjMx8nncRcjDlZZBeBB2hQtRgk/zbs2kmikTk+8Rl/CRrTc
 hBIrdaoSY2Gmpzv021UeU0+YczLR5ERoSys1lag5q8fQ1UQppZn7Tf6vn6PsDYvG
 QBneIKfZQioMW6D+4b6DTDLof1js1EIU9ZwfPPPQ5D7QUt8DIBMOVyWHVMN6lYqz
 wNskWXSZu4LO9VjiRLuvH4w0FtfUllRzeSHahTcoNTZ/mBLDLrHhLU7RsklZFVN3
 1KymmcOCaOZWHtMa7NpN8OspoueMtAYsmKoh8BNvWxxigXri3vOrC5Jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=IZJXw3OylIMetLy3x2akI/CNvnobcGXdBeKGkdnjc
 3M=; b=lLMfZTqwWZwOgYky/fC/tCRYTjMacS5U8OD/AG+yKLFcAXh65jVg14BOa
 5HRYFgZvXWNa9bbo3MtnQ6PBVF1n124QPyIVis8q2YNRaxbyItqYcrX7dEBe4s3o
 bLDPYy0A44CQgN4m2WotGJs3EC74DtcVaYU6/Q58+KcuFSufncd9fSgP7IC89Sjl
 oWgPAw0RCjydayUI0o8f1y7/1NKE23KDfwOobefUa+Y98j9EplAFCXO43Z/46ZDd
 RAhxsD+6VxDPrXMFieP0nEeRGWUum31MD883izE6ejgqEiGOzHZomO9PMkjSO3E3
 y3ALA3uS5DLKo/8mdxFm5Srw43BEw==
X-ME-Sender: <xms:XDgnYkp8kg0SJPffR20cGVR0XjLL-QflbEJbdwamKNLUwejVy--8lw>
 <xme:XDgnYqqDN2vesNP4hZ_owValweqO0I7ibFV1JMBQ4jZoIHe3jJ5t5lxOsOSVnnj-v
 d4f86009v-9XIPKigQ>
X-ME-Received: <xmr:XDgnYpMjBkunBYRp-eGeRi-phjjrtt_oH1kZ7PUZ4neXUxM__AG42cBWVk2_GlFNqs0IqYQtJpGPkU16M9ano01LytwrRVz-sTlnmPc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduiedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XDgnYr6j-v-6p7fGwolq6zQzMRNCD6fw83gVX60RMCSp40dXIBipbg>
 <xmx:XDgnYj4wQCCBoVii6FeFWSUXKPZHGscHjA8IcVRxEaalqhdrmQ4P2Q>
 <xmx:XDgnYrjauiR7OofcUk0FSezgBh9bl_VHUNCFDYBi3mLR-iCmr1vMpQ>
 <xmx:XDgnYgxOK13fTQ9B1HNO1qAKarIdnTFYqic8nTdjig6PwYdkVUF3YA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Mar 2022 06:04:59 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: (subset) [PATCH v2 09/22] drm/komeda: plane: Remove redundant
 zpos initialisation
Date: Tue,  8 Mar 2022 12:04:51 +0100
Message-Id: <164673748849.2320194.2179196023214933808.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-10-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
 <20220221095918.18763-10-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Feb 2022 10:59:05 +0100, Maxime Ripard wrote:
> The komeda KMS driver will call drm_plane_create_zpos_property() with an
> init value of the plane index.
> 
> Since the initial value wasn't carried over in the state, the driver had
> to set it again in komeda_plane_reset(). However, the helpers have been
> adjusted to set it properly at reset, so this is not needed anymore.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
