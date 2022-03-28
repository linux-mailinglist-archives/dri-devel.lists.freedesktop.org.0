Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A99AC4E9B34
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 17:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5837110ED50;
	Mon, 28 Mar 2022 15:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A419910ED51
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 15:37:02 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B23F232009E8;
 Mon, 28 Mar 2022 11:37:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 28 Mar 2022 11:37:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=I87grb7n1gAYRHW96Hmcz34wtyB3gSSxBet8SC
 6IssM=; b=mJArVUcfycw2G9QNtJQ1uzf40tLEJ8SG/YD66zYqACt8oaoSa8C/o9
 2gJuwMBir/OmSgBG2jIynK8Pgw+czvK2B6MD9I1pfQ1J372yCEdLoLQvolQckd60
 ZMWVPWvgXBShJKvg5hiITjj1GYtiCSgAPo+u6bqjqx2Wd9nQNbbRNYVWoMEJscqI
 ItLD6MSeZCLZ635zTeEHky/LWyNl1GwNrr9z7H4jWy+JIQw51frWW0S2MzhsZiRK
 VghKVbgaFeYwdw9vqlXBt+rjyI6+JL8y0pcle+ZZ9qlwUeOIb2UFQfL0Twba4FID
 CGjfM04bLBefCCbjZGNoG6mpnKRJXbWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=I87grb
 7n1gAYRHW96Hmcz34wtyB3gSSxBet8SC6IssM=; b=XvQg7iHb7G9DCBtV1L08xm
 nfRO6ngmisGrJzNV1FFkcSx0cmu6xhq5FpAAd7+mynGoqe1tmrZiBv2QlN4c7X+z
 zENovClXpuXD9iySOGdY1G/iXuDy3XKm6xMsyFswlAX6MFm6uE+sAQEHXgDCYp0l
 jF3cdto/t1Q2VST5EQ675YgDeYwRq2uKe0gs5KtAMZOwucJJ1XIHjqM1gEeP5/b+
 D1zDQJcJqHYPIECT/z/S+IbdJHvkQancIcIhpofZpJgMbkLBxA+Pou3pJ0Jxd8sq
 RImROMvlXLx5NVypHsnhy3q2rDxtIGbWBUwlHMDMwaE2tMfmgD+jESCx9+ATyfrQ
 ==
X-ME-Sender: <xms:HNZBYjF6g9pQbPwuqy0HOStgkjz7Zl7wc8_5UmgVPV3L4PqXIhpdHA>
 <xme:HNZBYgUp5ZRE1XDosQdjCHIp7mZH77nVP-lOBbkDupA1cu2y8rPUvhW4CrhaIMpuR
 kGIGo--n-G2O4AOkIk>
X-ME-Received: <xmr:HNZBYlJNaWZB14fO2vjRQE2ajvHMZqRIA-RLaYBDAMWxhGH8fejWWc1lXoZZIH5gnQRALGw4iatp5IqwKAl_eswounyM2qouFNG3r4s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehjedgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HNZBYhEEyd7xN2Fl_ns5iBae2pQ8dvpXtzHNNp30p5h9Iq9ZweXdkA>
 <xmx:HNZBYpXFLS8k1n-wzPEp_ITQqPJgf7tTUyxCkq2mxiBLgnGe1Iia8Q>
 <xmx:HNZBYsOaQxLXO5ZOw7-hgOJawoHUq98L4d-cSnihMYiwP8n75UAz_w>
 <xmx:HdZBYvzb7NpOqzefpD3E1BfXU7auk33aqG5N01zIyKWQYzWDg7ecFw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Mar 2022 11:37:00 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] drm/vc4: Fixes for the writeback
Date: Mon, 28 Mar 2022 17:36:53 +0200
Message-Id: <20220328153659.2382206-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
This series address multiple issues with the transposer support, and thus t=
he=0D
writeback support.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Maxime Ripard (6):=0D
  drm/vc4: hvs: Reset muxes at probe time=0D
  drm/vc4: txp: Don't set TXP_VSTART_AT_EOF=0D
  drm/vc4: txp: Force alpha to be 0xff if it's disabled=0D
  drm/vc4: kms: Store channel in local variable=0D
  drm/vc4: kms: Warn if we have an incompatible muxing setup=0D
  drm/vc4: kms: Improve logging=0D
=0D
 drivers/gpu/drm/vc4/vc4_hvs.c | 26 +++++++++++++++++++-----=0D
 drivers/gpu/drm/vc4/vc4_kms.c | 38 +++++++++++++++++++++++++++--------=0D
 drivers/gpu/drm/vc4/vc4_txp.c |  4 +++-=0D
 3 files changed, 54 insertions(+), 14 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D
