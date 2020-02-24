Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B08D816A2B6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80C86E348;
	Mon, 24 Feb 2020 09:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD5A6E20E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:10:46 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 156F764C;
 Mon, 24 Feb 2020 04:10:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:10:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=TZklbGGeK2hTN
 XOoqhD10H1/cStRanvaulcZu3jl1j0=; b=AXQjbmoLUAAEuNDwzkcD4rFFSflK0
 8RWEZB4ydCZyU1RLOMHPzWmj3lhfLpeIdqyacGVPA+8iLiS3VRkQraQ5KJlQSAZH
 zdMDwnL/xpebs/jQuQlMi6+BVwW69Finh9TqbRMwbZzfuZZrB6kg9a1o+ARCCQqn
 SItvnIr89CuKdFpPCHjDOTHeC5GNxVUWkwHdXvSzm0pXj4pZpttB5+rsF8DAjxGb
 fy6mVSXQmbE581czkvZbIQMDKBM4SKKw5aQWz9CUwqsJ6YTRAHUyVySd2r1OlqQb
 sg5qnLDJlSBaApx/gJiSkVOilrK+YOXx+n0aAa5ZpZH4of7yzYnBlqe1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=TZklbGGeK2hTNXOoqhD10H1/cStRanvaulcZu3jl1j0=; b=Ds3Cz93y
 +hDt2r+1GA1QXUwmYWxqUZtT5VpMzk//VHJfijGhB9COt3tpAaCz+OqNer6J2+x2
 VzrPHh5wMb+W2acv2F1XzhfklKkin6/3fSBIV+F2NnHuYeG5I49g8M9xkMLZbdY3
 vUNcJ/UMg3KCFKA416EFgXWw5Yini3UTLwi0PD+0+TOrQaQUp6hRVS+Qf5KYaVFY
 kVnhQVLeZsbS0jndVo+AuAPWdh6dtw+0FwL7TBqYgjzDBlWuqZmKjahn6mqeSZmF
 4NlhYk1qFQokWSvgwPAyj93+PNL5T6HWAY342YYxJekDNG8bkMl01KYxghl+5ze9
 vgSvZuwfDFPt1A==
X-ME-Sender: <xms:FJNTXm74FIfx11qNwGsxc1nw3JfSwYZu397qvbcEtMH-yk_UdmK43A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepudeknecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:FJNTXmCFvVDbCLMOqzGvz59XhNkkBG-oJjcVOekeBS4JMB2_Xj9bVA>
 <xmx:FJNTXoJaYdXzIuH17qItKvD3dw460fhbqywrkeRFzXj-cWWAdG9q6g>
 <xmx:FJNTXg9k982Z6EbIR3b5ViuzrC1ieiD6TmJJRDYacCiL9D8khCtSRA>
 <xmx:FJNTXiMFrDSQecpFBjXAzb7R3EvNoM_OP1M8gwGuOPUJ6GvR09F5VKPqR4g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5BA153280063;
 Mon, 24 Feb 2020 04:10:44 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 80/89] drm/vc4: hdmi: Deal with multiple debugfs files
Date: Mon, 24 Feb 2020 10:07:22 +0100
Message-Id: <2f8c4a2b3c3ddb109036489d20ccc1f7f743a44c.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:39:03 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HDMI driver was registering a single debugfs file so far with the name
hdmi_regs.

Obviously, this is not going to work anymore when will have multiple HDMI
controllers since we will end up trying to register two files with the same
name.

Let's use the ID to avoid that name conflict.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index fffd1ce7cf90..25fbe2fb72fb 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1365,7 +1365,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		goto err_destroy_encoder;
 
-	vc4_debugfs_add_file(drm, "hdmi_regs", vc4_hdmi_debugfs_regs, vc4_hdmi);
+	vc4_debugfs_add_file(drm,
+			     variant->id ? "hdmi1_regs" : "hdmi_regs",
+			     vc4_hdmi_debugfs_regs,
+			     vc4_hdmi);
 
 	return 0;
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
