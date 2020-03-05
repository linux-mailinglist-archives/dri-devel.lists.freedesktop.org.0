Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD6617A409
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 12:18:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADF36E249;
	Thu,  5 Mar 2020 11:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gateway21.websitewelcome.com (gateway21.websitewelcome.com
 [192.185.45.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F9E6E23F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 11:18:04 +0000 (UTC)
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
 by gateway21.websitewelcome.com (Postfix) with ESMTP id 98D13400D9BFD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 04:58:00 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id 9oCWjPx6uSl8q9oCWj2Pzh; Thu, 05 Mar 2020 04:58:00 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ihHfTDP+fLnk+hUJ+Lmh+Yz+nZ+OXknD+WOz4D6Ifwo=; b=BIvEOWNVJfHZFGbrFw3h5RGybd
 c3DdP/V4pPLx5zfr9XqVZRWzs6qdQuWhav4GW4D7sP10ljAUk0xYeS5DUg1bmoqSszY8M6m4oMCHJ
 SOKdl4ZwTuJFR+LpnGunyXalWyqYQ47Cf+ahYpauG0q1LwPdjWpameij/qi7SdHePe+hBSA+pQo+m
 doEc0CAaHBvuXOFkN4T9HTOL/xgiK3KUlR+B7IWMvpiShGRuk9Ghe+lgwhE9j/3zFKljqf6gl4d35
 EbqbKxvKT9brc9Y1abz1s83Y285LX/C3ZxOMIVatEYVEDX0KwIgWkjUhQYxHV2SKfJii5PB/u8V4a
 ZsQneBdw==;
Received: from [201.166.169.220] (port=15028 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1j9oCU-003ibo-KO; Thu, 05 Mar 2020 04:57:59 -0600
Date: Thu, 5 Mar 2020 05:01:05 -0600
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH][next] drm/drm_displayid.h: Replace zero-length array with
 flexible-array member
Message-ID: <20200305110105.GA21188@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.166.169.220
X-Source-L: No
X-Exim-ID: 1j9oCU-003ibo-KO
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [201.166.169.220]:15028
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 47
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 include/drm/drm_displayid.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
index 9d3b745c3107..94b4390bf990 100644
--- a/include/drm/drm_displayid.h
+++ b/include/drm/drm_displayid.h
@@ -89,7 +89,7 @@ struct displayid_detailed_timings_1 {
 
 struct displayid_detailed_timing_block {
 	struct displayid_block base;
-	struct displayid_detailed_timings_1 timings[0];
+	struct displayid_detailed_timings_1 timings[];
 };
 
 #define for_each_displayid_db(displayid, block, idx, length) \
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
