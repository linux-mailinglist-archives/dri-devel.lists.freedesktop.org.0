Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D3F4C10CA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 11:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21ABE10E653;
	Wed, 23 Feb 2022 10:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B97810E658
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 10:56:16 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id DA3FF5C017C;
 Wed, 23 Feb 2022 05:56:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 23 Feb 2022 05:56:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=lFooUZ9eGKltFwdjrTN/E42veSyTtX
 LHbcvwgcQio9A=; b=FZSpXUS76KHsuJMWKMJIU1nuF2yM8inYYgnWUfhP9yX+GX
 BBDiq41tYxB+U/ZrA27Ocoy+Jju04HKHk70dHL66fJXP2+NmnTIXxnNPxnUpS+qG
 Z2n2kCqob7yHT0qUu9Ev0HwknxotP7FB923EcwvfnKRhqHqij26ANKoOJHAYHZoP
 eOKnQcqrDXeUChtLvsUjk32KdPceSDHBC5MgGawQh/5k7CAwVfkbQRhgOG5mbUk7
 Mei+sd+0MZ6wwAcF3nsst7aKsPyPo/U3RjGHgOab69RVJtlvk0+6tucQo2YdEg7q
 Q3rFcqaTZq2/EKrck0xBfQRqG5hbR5uOlA5YPs/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=lFooUZ
 9eGKltFwdjrTN/E42veSyTtXLHbcvwgcQio9A=; b=DiDHhdLjA2+XDDKPIMlPGz
 Gk6ZwAmKrPOqzNpQ9358j5UTAcKtCzLTUVUs5p88+aifzS9JBXkBFF7pqE7ijyQP
 GX1w598Oy3BlTlSDzb9DwH/hOLl3UkS++Smc1lRz10KlUswUTG8Yb9U2Eu/sJMNA
 xoLWCXx8uGJHuY1bH8Ps5mk1nV8G1vtyMGLAJbl0+iCSopNnoL8evyp0YkARPEsy
 Est96O9gjyiq1cfdFGwd9AQmaX4O8H2c91OmS/WECEz2FqWhileV1eOT7ELVwf0d
 rzkStHlUVisyd/3LGc+N6Z9/cRE2K4K6bwfM8wBmW8vx5X4nSw+y4oJ2ksCFrNjQ
 ==
X-ME-Sender: <xms:zxIWYknvmsgwM8zIbmyw9v9-O8TqaXMUNvlosJuaWpEdqYK1B3jnPA>
 <xme:zxIWYj2UNcpuCkWal6bq0gIShpk_8pxEt0iOTsgWz2JGWYacPHmXhCKozTccMFgST
 G8Z2Cl3XKZuWygisQI>
X-ME-Received: <xmr:zxIWYipEm8H2_lZzW5Uwfagg_DRHQfhu7zVnGGlVs0AYPgvE_5qsTJWYIvpYHhIvsKOfNTeM8KHS7Gr97xIjpu8qEz2qZi0otZlbWyI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:zxIWYgku9XUAp7WbSWdWmY1Ov8N-3NOF1TWNl3fz_Dsos5_kEpU1ZQ>
 <xmx:zxIWYi10UPsxoTh2CqtWAMiWxdWLyGHbvZn4FzaI0iURTYj5XDzgrw>
 <xmx:zxIWYnuBBOoFiXkgmqdWaBIAxcSlqAsUqDm2U_3kGZofUMYyum0EaA>
 <xmx:zxIWYrmn0MAna9YQ74URpmdmbaz3AOnsEL_7JK_XptPmYe_OX_1Hlg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 05:56:15 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v6 05/12] clk: Use clamp instead of open-coding our own
Date: Wed, 23 Feb 2022 11:55:53 +0100
Message-Id: <20220223105600.1132593-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223105600.1132593-1-maxime@cerno.tech>
References: <20220223105600.1132593-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Maxime Ripard <maxime@cerno.tech>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The code in clk_set_rate_range() will, if the current rate is outside of
the new range, will force it to the minimum or maximum.

Since it's running under the condition that the rate is either lower
than the minimum, or higher than the maximum, this is equivalent to
using clamp, while being less readable. Let's switch to using clamp
instead.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 6c4e10209568..c15ee5070f52 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2388,11 +2388,7 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
 		 *   this corner case when determining the rate
 		 */
 
-		if (rate < min)
-			rate = min;
-		else
-			rate = max;
-
+		rate = clamp(clk->core->req_rate, min, max);
 		ret = clk_core_set_rate_nolock(clk->core, rate);
 		if (ret) {
 			/* rollback the changes */
-- 
2.35.1

