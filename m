Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 536B131FA2B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 14:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88F96EB30;
	Fri, 19 Feb 2021 13:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497E36EB33
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 13:59:45 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 966813A7;
 Fri, 19 Feb 2021 08:59:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 19 Feb 2021 08:59:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=4QPfigMqCU4fz
 9Zie/xe+5hJ99N0FBZ2RwrwyJ69Q3I=; b=QkkGNjR/dxHDBbYuxrwSLx008kPcD
 md/3y7TU33zFxAA6OmFhAEM5KB2irL0HILI3zeXo6YKfl1J/0AUKyJ17OL2bFpPQ
 yz+7DZEyTtvSa7bpQ9/9rf2mtqDs92595t1I7C1zAo9nVSwbwV3sAj8NfVT82jB7
 bHAguliOwRpb+rEmog9cGkTPTuKHQi+7zrPRS9/LtGz8A5nWM23vli28OjmTFLjV
 nEHz2jVfwZPACPNWjt2TBUwOFU6gOOp7lj2mss/UN07c2ORAVn7yYtnv1wL8/vR1
 /s09nnrUCtftWUFimKen3h8JIIf2iR6U2+qNk030H91qt0u1qFDg1a9Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=4QPfigMqCU4fz9Zie/xe+5hJ99N0FBZ2RwrwyJ69Q3I=; b=YoVk8D+H
 chYVhelkU8Xulk9d8rf96d6ijl4nvQOTBjZTjo2I89+uhg28U6IG2ZyiUXDISE8C
 spihUtJqVFZ4RbgtWzOapXUa1HMBv5uq2JJNsdzSKanc88kEzu02puLuZU8++IU1
 K77se2s0fJjJLfPeW5Zzrw4VNgAEY3aLZLj6wvj5NFQpsofBjOv+f2S5lvExrFr7
 RCgjI7DQfYyd5MTqUqD6MYWuHoVxZCxPYXxeRsqjuEoLfeUwU/yKnR9HGWMZCAAJ
 9G379MMJqWHN5qwPfZUxAc6i41NaMC7lI5l+FRrUsqSxgJ3Gy1iyvafQP6RbSp0u
 Cin2jcaaLh+HGw==
X-ME-Sender: <xms:TMQvYNdBRKEBZ0B3YqKSpmszn6rQ2fvV-zTwMgJpDTaUIl1qD2bdjQ>
 <xme:TMQvYPcnkML_Ew2X9KcVEiM4ntiITt9xoWqxWvJbppc6qY5_6C2WcFlrZYduNpEpz
 tLUqcVVue5VGe96ARc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:TMQvYBjbpyaME3ugUdujZWmx4-ShqMl-1S9-coC70XQpl58Ev1I7ow>
 <xmx:TMQvYLTibh3ZUmmeVyqySK1d2um8DQcXjxL4tBrYobBKTgLr6vgpdw>
 <xmx:TMQvYCzeZxYEAFFosH-hPjaZnZQirTEQddJas8z9bzF7rsp-kMAv1A>
 <xmx:TsQvYKY4ARWkwxfkSZGA4vFw4Xy_tRNjfpyFjKjyREcLIVXgtnBEKw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D48DF24005E;
 Fri, 19 Feb 2021 08:59:39 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 1/7] of: Make of_graph_get_port_by_id take a const
 device_node
Date: Fri, 19 Feb 2021 14:59:28 +0100
Message-Id: <20210219135934.618684-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210219135934.618684-1-maxime@cerno.tech>
References: <20210219135934.618684-1-maxime@cerno.tech>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
index 5f9eed79a8aa..ff48271c5944 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -584,7 +584,7 @@ EXPORT_SYMBOL(of_graph_parse_endpoint);
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
