Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D5941C0D9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 10:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2F66E9F7;
	Wed, 29 Sep 2021 08:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5F46E9F7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 08:42:45 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 96C6A3201124;
 Wed, 29 Sep 2021 04:42:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 29 Sep 2021 04:42:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=YeZoYhoLBnI/P
 hLkXsYpsONnRE4tJxGHMKmgk564N80=; b=Pj3Si0HzKxT9XpRI8/sIgEQfu4dV3
 6Nvyyhjo4ryYETD8+M4zlLBNFlm3wY9cqcJ9a6Fr9XMYug9uMZ6zP2H4rkT+F2f8
 Nqgg2K4uI6wae1lOTuIQmzzrogkMm+sT6Zp6pW0W+IEa3ril31MV9yF2vpQH5SeV
 c7vdxCIFGFHkL80g1gytQhli9JoTGwA3de6FG1uzTXiXibtYuR0jnBRASMsV2a5u
 rCeYslbOaPu0F2358XFTTFbfhDzxHuhznlsbeTjfPZTQj0yxv+yrRMXiqMcAtPXC
 Jvtckd/umxlczvUrXv0nBZEztm8x6Z9iiT/TJiM2HkQ6f0xB8ENFh8D5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=YeZoYhoLBnI/PhLkXsYpsONnRE4tJxGHMKmgk564N80=; b=HrKXdRYs
 X6oeZUquuntYYL2iOCueHNCaVkIMCqlrNdOuwecudbfi/woHz8IYo4mCudOE3Hcv
 Zur7EDAI7nVDsDAJkiFcTuJ3Evn45eeG5bhZL1Cs7GvnWWDu6ZjHt8Iu/YUP5k3k
 YpcepeRL9z8QeF01JCSfbV2BUn4Ur0e3zWZBYvNN5m1sJcOkS2CqH9HZqN0QHN+w
 YzhdnGHiRpGbWm45UEKhaJw6xoOpgcguMWbA4Ckkne7LUxbWkh7zK0GRcDXP2ZDP
 nhr4jqWnQ2eiX1vSIEFPT1KvhC6v//VkzFr4y3J6RdydepWhHpVHdswtM8sXePe+
 yre3OeoHHMMWNg==
X-ME-Sender: <xms:AidUYcVKH7PhabSom7_62x3mKq66tieeTjm_6qG5Sb6xo8q-B8VQxA>
 <xme:AidUYQnwEW0CJA3S6mgR6BFMI7-DPev2YmDhkqtgUiRyU1gUeku4KnAHs7WdiwAjy
 FTSMwNE7kfCg5KL_eI>
X-ME-Received: <xmr:AidUYQai95toE-vegNFNHm5jlSjEpOUrKCtCMs1mjsQyLnIeAPhAeauRmq8ksmnNF26zn6Oo0gQ2lupFx-7qAfGIi5x2TfOjrPzWBzVI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekvddgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:AidUYbXMbLoOtKXmTLj2B3DcVdBsk46Np4b9gxs8bJVEKaREMaUMQw>
 <xmx:AidUYWmLXQlezRTWkkBscoKqkNy2PI1-_7Naw98J2Nh2UxG_ZBWeRA>
 <xmx:AidUYQdOxxuJxHHfCNnG3t4U34Ci4nRiDONBOt7yxObboGTzy_yQUA>
 <xmx:AydUYQ4Yi2uvASQW3nryjBUXIbbky2jxizCy-8UEEVMVNFvlxVBiJA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Sep 2021 04:42:41 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/7] of: Make of_graph_get_port_by_id take a const
 device_node
Date: Wed, 29 Sep 2021 10:42:28 +0200
Message-Id: <20210929084234.1271915-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929084234.1271915-1-maxime@cerno.tech>
References: <20210929084234.1271915-1-maxime@cerno.tech>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

of_graph_get_port_by_id doesn't modify the device_node pointer it takes
as argument, so we can make it const.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/of/property.c    | 2 +-
 include/linux/of_graph.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 3fd74bb34819..739d5d1c8c3a 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -603,7 +603,7 @@ EXPORT_SYMBOL(of_graph_parse_endpoint);
  * Return: A 'port' node pointer with refcount incremented. The caller
  * has to use of_node_put() on it when done.
  */
-struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
+struct device_node *of_graph_get_port_by_id(const struct device_node *parent, u32 id)
 {
 	struct device_node *node, *port;
 
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index 4d7756087b6b..87f3f4d0d0df 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -42,7 +42,7 @@ bool of_graph_is_present(const struct device_node *node);
 int of_graph_parse_endpoint(const struct device_node *node,
 				struct of_endpoint *endpoint);
 int of_graph_get_endpoint_count(const struct device_node *np);
-struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
+struct device_node *of_graph_get_port_by_id(const struct device_node *node, u32 id);
 struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 					struct device_node *previous);
 struct device_node *of_graph_get_endpoint_by_regs(
@@ -74,7 +74,7 @@ static inline int of_graph_get_endpoint_count(const struct device_node *np)
 }
 
 static inline struct device_node *of_graph_get_port_by_id(
-					struct device_node *node, u32 id)
+					const struct device_node *node, u32 id)
 {
 	return NULL;
 }
-- 
2.31.1

