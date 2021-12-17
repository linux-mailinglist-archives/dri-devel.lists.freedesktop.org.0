Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D91478CBB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 14:51:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B3211232A;
	Fri, 17 Dec 2021 13:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A3111232A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 13:51:25 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D9A615C015A;
 Fri, 17 Dec 2021 08:51:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 17 Dec 2021 08:51:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Ub19/beu6g/nu
 OZYDQVInDRY/8vv3wWB4gmsItdHjYw=; b=QDlaSgJcUdL39sH/3PjryYzfkOsoM
 5k6aFJ0vDufUzrNedYz6/4nusnWdZFOD/KXvrG5Y8ttBKO0IaAGBLlRAkY6JHEwt
 Ftk/rH4rbYKGEGbfuIhAMrY969clbxKk6jyXDEt7w7p+gcjGBzKC8paMqqJwPCYm
 N6KJe71ra4FBJxSHMGHJwcqebypMc6JVbmnPcYc/6JQPv1dvr+0HTYWuNQtPQSEO
 vP2JU7ViVHn8S0zfm8zNWyHokYHo+e6giLqMYO2XFW5HmoY5GZ9/JZ7CS8G+HwPb
 IUEc8bDCFHO/+E1cBEhNVe1RpILl2s4xZsyJIwzzMh+meVv/Xtp+2n8Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Ub19/beu6g/nuOZYDQVInDRY/8vv3wWB4gmsItdHjYw=; b=OQLFc/MW
 YYU+cf0K5ur6ZzMu2h6vhKs6cQPYTZHLoHC69azCu4JLNFJlEryzUjvVSPvANpZM
 TnXgZj0w6WGQ6O/uTj4dEKk3hI8niidoWHl1BgNwnnlKjCNI6issWyPxL9LpnAtx
 VW43qN7hZv4prcksMaqSdk97auTGxyEWQOFvK7rUai5h5s1avQtWM3xfX94jbGAr
 vULQ7+c+e5ck/RBnxhufN8+i64hdyoZQs/TFjZPQ6B5Pam+DJpDTW5K8CqcapXPu
 xCjC/8l49+bsfLd1f7NpUG7I5DYjfh8EI6GYhB52qlKVtkznjQTdBV6UXI721f+Z
 hKqgkPwujA+7sg==
X-ME-Sender: <xms:3JW8YUTAIoRtpNsqboOjkgSwY1N3iC53aOoBE0RVYpc7Xsks94rI2w>
 <xme:3JW8YRwRL_pVuxugrUQExhwVmP8OtmADyV7etuU9CIZS1k4UIut2CSZmQruL1GCwe
 WVv3K38wKE625MHuwQ>
X-ME-Received: <xmr:3JW8YR3JmdToFejTRKKUzr60c28s3XJbDGJgDK8Gcv8Sc5sEsGD5OZtVDR5-go1TmeEshe3HWuD0hrmP7lH7U0t7oiDRte8VOHFfWZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrleeigdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:3JW8YYAbyoEls0t9RvhNHeHfb7vBadNN2-FzVoClgHHekgN5Ar4c9Q>
 <xmx:3JW8Ydh5Bm5K9GCFAvDjOxEBG8MkXiCKjBxSwIblV4yS9Zga-RKaIg>
 <xmx:3JW8YUqNQM6BdaGmUYWKyJPpzowYqWHauDXQJ9XsY2eS-L3a5fBEnA>
 <xmx:3JW8YeUycWdxHTp-one04ObNLsYk8jx6pu5afJ4rG4XSmwvym3nBzA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Dec 2021 08:51:24 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: [PATCH v6 1/7] of: Make of_graph_get_port_by_id take a const
 device_node
Date: Fri, 17 Dec 2021 14:51:13 +0100
Message-Id: <20211217135119.316781-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217135119.316781-1-maxime@cerno.tech>
References: <20211217135119.316781-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
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
index 8e90071de6ed..8ad0ce5c87f3 100644
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
2.33.1

