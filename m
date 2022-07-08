Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A1056B5D0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E32112578;
	Fri,  8 Jul 2022 09:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2661E112EEB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:42:31 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id D81063200A51;
 Fri,  8 Jul 2022 05:42:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 08 Jul 2022 05:42:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1657273347; x=
 1657359747; bh=wzYmygYdY6CLBPHguQdIuVyTQl4Bx1QoZh2msyBSMak=; b=Y
 agH2CDgiUS9CZGFLUdo+GNCI5MIbkBllSAMMTXWIncuaHRzOk7vX6KT23/hF2u3m
 fiPtEaNte4wPQPN/L/v9elpzRf73RVzyKH+yRQD/RBhBCA1bisUp1NWFnXcoMC1R
 pAccgE6PRIPraFb0fuZVib41yRUleOg01ZJ/AHl/XXUTI5OpPovM5aR6i4aCU0Kl
 jsPeTQxNyXNwr6Il/Xplj0nBvK0rkMNeGRq+5p599hvtj2XmOlNKHPkEfISOARwV
 cKST3c8xfyLtsCBQjuf95rbhKymPanqUO8B1iMVQ1KsNNMnLn0XzVANKtf5EGBtz
 d9OGFD7uwMELC2FXSfvfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657273347; x=
 1657359747; bh=wzYmygYdY6CLBPHguQdIuVyTQl4Bx1QoZh2msyBSMak=; b=Z
 +CDYs7plJWkOh4aDYAyQVIIU7ojhHR8Es4WY7RYfYWGkxZXYFArcgnummTrw5vtJ
 YZ4w1p2lvUwL1r6dwAUXRcUyuUtN4Oh0vSvg2Z+fY9K4Ph21aQXMk0w9CUghTghN
 BREGwtb0D748EgnQmRHEsZEdNsrhd5FGa8wBf87bc5wnd1905y6tZls7lEXQWrTp
 6sRLi6q784cP/kLZvMTrOzx5uP5ZnpUc2ncAZni5hCpE42LaZ+uaXhqe0dVHm8/c
 JKJEtYtgWLL9PBE6NvO4cv+4XA68MEQiFAPX0rf4gI+BjYRn2Xs6DDlANPQFRI7B
 hsY6H32ZHRZWnC+tSJRlw==
X-ME-Sender: <xms:AvzHYhx18RKBZTruUBwNirA3L551jkR1t1Xhz5fe8OtEKCyBQJ9t-Q>
 <xme:AvzHYhQhzIWFJ1BUeT0HEeDebvlhLgqNeVQvUQZPP_iZQQSqHtwA-nUGPy6U4ruBN
 DQZXAHGykxyMvs9LhY>
X-ME-Received: <xmr:AvzHYrVlcisTVV07BqgBnfFHyHYFksneou6Aa_q2c5gxeEuKZF-gSJ7Ql4s1IEOkYG0dqXNXCSrNiOVxwe8lM2fx9kuEXjMyZixfWI8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesth
 ekredtredtjeenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvges
 tggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeeuieeggffhffffieefheduie
 euvdetgeeufeffvefgtedvffehheekffevudefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:AvzHYjhY1URKP4NKJVnKjS9IJQkY3VFBEx0du8UWKV0auwRtP3nctA>
 <xmx:AvzHYjCk_Bs7fhuYTWTbGJtDwbVULDP5hTT5QaZCAEW9ioHI4Wq22g>
 <xmx:AvzHYsKkO2OwUlqanv4bdhwBrYkgVtROp5Hz0pKoBB2nu5zWEp08Jg>
 <xmx:A_zHYu_2IvO_8Baihb0x2zBhxdKeashW51oNkYHSWID3xc-sCb9zDg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:42:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: maxime@cerno.tech, daniel.vetter@intel.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@linux.ie
Subject: Re: (subset) [PATCH v3 37/71] drm/vc4: hdmi: Depends on CONFIG_PM
Date: Fri,  8 Jul 2022 11:42:21 +0200
Message-Id: <165727332093.195632.3641386260025835889.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-38-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
 <20220629123510.1915022-38-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Jun 2022 14:34:36 +0200, Maxime Ripard wrote:
> We already depend on runtime PM to get the power domains and clocks for
> most of the devices supported by the vc4 driver, so let's just select it
> to make sure it's there.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
