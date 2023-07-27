Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F4E764357
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 03:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229B210E0A5;
	Thu, 27 Jul 2023 01:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE1F10E0A5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 01:20:25 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id EADD35C013C;
 Wed, 26 Jul 2023 21:20:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 26 Jul 2023 21:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=davidreaver.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1690420821; x=1690507221; bh=jf
 AHQLCIWpfDdvyeExTMEs7mz5YeHIAIHoJEn9iQiyI=; b=kaPvXonHsvEXHeualV
 aXbyE1LTE2tU3iF6Op7CArDD66B535AhaI/y+0JHrupjoip8EuB7kDjDNewsTG+u
 LpuyfEYsIGP9+AdTzbfhtpXlfiA9aJZbVsyGec9e2gAZiu5JXnxZXoelugxQmfm3
 MBxDimOr+bRBjxTGmGwT4LEKdttfbnlgDF99McN4pLiUqgSa1EmSwnQhEuz1oWqw
 cjxMPXTIcZ+ddhMVZas8iGrZ53M3O2dYzsUPwtE8bVcjIVfhrKjYcbSZPOwmQiAj
 zB9IUIwutJwmd86hEi7GBdz0ZXqkKjsKhKCGHX2ANkk+vCH04po+YY90PlY1d04H
 xu1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1690420821; x=1690507221; bh=jfAHQLCIWpfDd
 vyeExTMEs7mz5YeHIAIHoJEn9iQiyI=; b=uhLnwcJTrBx8a2qQNOBfgUtwIv+xT
 5cvWYadrh+YR+M3cR95qzoI5tU27aAKHDXnVC6ANDC6hFdeT1SQrkSC7ewNz8VF3
 pN1ICI3l9OjsqlOUMCOYQ+NfhoIW5uOJkoDIcVjX/DLc31byFSjv8aSHikmnAIxd
 tPSTO+rGezm4T5Tg7VhAC715U9kdDmnlm3ya6mCtp7XBuUrJBP/Hx1P+4+twSan2
 K7zt1cez8MSYhnhntNGlq9Osd5m0UHdn6pmPuzyZHvS3SxkcQUxfnX/Vk4pFhctt
 x7Pr9jWxNTnxPuamV4d+vI8MurCQ37bBafjcsUIzafpP0cuWr7UgWPDyw==
X-ME-Sender: <xms:VcbBZPg6QFSNVHCIgghD_-pzChq5zHMXbT6XXJlLim8WqDqefmUR_Q>
 <xme:VcbBZMAH6kgTBby6lJ4TjDEu-XdbcYy7fC4TPoB73kw4kyBgZ0hwlzkVO4rAOc5Rl
 2fN9qjfY93k4z1Icfk>
X-ME-Received: <xmr:VcbBZPEk_OpoVVPcB4xdRsuPmfAk3rU8zXVVyfEgqHyzAZyMpqRQ2_1Fr5g2i3EAy8gtlvNcLN-YoNGlOYpL4cZPCo8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrieefgdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeffrghvihguucft
 vggrvhgvrhcuoehmvgesuggrvhhiughrvggrvhgvrhdrtghomheqnecuggftrfgrthhtvg
 hrnhepheetveetgfdvffehfeffieeugeejhfevieejveeivdeuiefgvdduueffhfefveeh
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmvgesuggrvhhiughrvggrvhgvrhdrtghomh
X-ME-Proxy: <xmx:VcbBZMSsm-ctkM59SO09pKqnS8PpoYL18Mo8LDmQAdf75YRRKvM_Bw>
 <xmx:VcbBZMxrdPMFePFZB_yqIGKKhgfIDOaVQksdoXmBKvw0P4LPxz9vqw>
 <xmx:VcbBZC7KYQrP9H2Btu2gNLUUjM47prVbXyya3H6S3ikcMlYzbi-EmQ>
 <xmx:VcbBZDlOkkgoYhH-_mkoPh9YqQB3nN92ZONBwCNokjJAnX4VWO2hgg>
Feedback-ID: i67e946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Jul 2023 21:20:20 -0400 (EDT)
From: David Reaver <me@davidreaver.com>
To: Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] dma-buf/sync_file: Fix missing colon in kernel-doc for
 num_fences
Date: Wed, 26 Jul 2023 18:19:44 -0700
Message-ID: <20230727011944.327807-1-me@davidreaver.com>
X-Mailer: git-send-email 2.41.0
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
Cc: linux-doc@vger.kernel.org, Gustavo Padovan <gustavo@padovan.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Reaver <me@davidreaver.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The struct sync_fence_info member num_fences was missing a colon in the
kernel-doc, causing this warning when running make htmldocs:

./include/uapi/linux/sync_file.h:77: warning: Function parameter or member 'num_fences' not described in 'sync_file_info'

num_fences was also clearly missing from
https://docs.kernel.org/driver-api/dma-buf.html#c.sync_file_info before
this patch.

Signed-off-by: David Reaver <me@davidreaver.com>
---
 include/uapi/linux/sync_file.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_file.h
index 7e42a5b7558b..b389a5495181 100644
--- a/include/uapi/linux/sync_file.h
+++ b/include/uapi/linux/sync_file.h
@@ -56,7 +56,7 @@ struct sync_fence_info {
  * @name:	name of fence
  * @status:	status of fence. 1: signaled 0:active <0:error
  * @flags:	sync_file_info flags
- * @num_fences	number of fences in the sync_file
+ * @num_fences: number of fences in the sync_file
  * @pad:	padding for 64-bit alignment, should always be zero
  * @sync_fence_info: pointer to array of struct &sync_fence_info with all
  *		 fences in the sync_file
