Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA2A1785A2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 23:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120256E0A0;
	Tue,  3 Mar 2020 22:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gateway22.websitewelcome.com (gateway22.websitewelcome.com
 [192.185.47.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AD76E0A0
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 22:27:41 +0000 (UTC)
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
 by gateway22.websitewelcome.com (Postfix) with ESMTP id E897D20740
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 16:03:34 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id 9FdWjFYmiAGTX9FdWjNiJQ; Tue, 03 Mar 2020 16:03:34 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U0ggBFiTgW60TJFxrSK5WNiOfnjl5q1QkGFAU8aeXq0=; b=DINjrQe4CVKXar9Imfcv6H+xl9
 iCkuIAodqCseH0/fBj72n7USoWFlRXT9QjiM9RPhCWEewkg7XhVsS+st1ts5YdC3mJpuFLTc3hc2/
 3gHwLS6ZUQvqRHN/7Uc1PrbTKtmP4ZmWhF50+Rz5gzI10bNQouQQGRrzFcZH7BrjfBEPWAWT0+LD3
 CBHz9hXeBAC2STnns/+HJMjzTpFSUhziFOqAHCibVDMzOH6l+Xv7tpPuCx1VyUzXGsB4efFx9/Vtl
 c5tQo38ZvtMQ1wpNDYrTiOnHGzKq2kgI4OL0Vl7XjKZ2inxJa6pP5P3at8Av6yCAKLM/jooIrCXm5
 1r2wAMOQ==;
Received: from [201.162.240.151] (port=12128 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1j9FdU-00122M-Hd; Tue, 03 Mar 2020 16:03:33 -0600
Date: Tue, 3 Mar 2020 16:06:36 -0600
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH][next] drm: i915_drm.h: Replace zero-length array with
 flexible-array member
Message-ID: <20200303220636.GA2788@embeddedor>
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
X-Source-IP: 201.162.240.151
X-Source-L: No
X-Exim-ID: 1j9FdU-00122M-Hd
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [201.162.240.151]:12128
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 15
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
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
 include/uapi/drm/i915_drm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 2813e579b480..413d923b332a 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -1729,7 +1729,7 @@ struct i915_context_engines_load_balance {
 
 	__u64 mbz64; /* reserved for future use; must be zero */
 
-	struct i915_engine_class_instance engines[0];
+	struct i915_engine_class_instance engines[];
 } __attribute__((packed));
 
 #define I915_DEFINE_CONTEXT_ENGINES_LOAD_BALANCE(name__, N__) struct { \
@@ -1767,7 +1767,7 @@ struct i915_context_engines_bond {
 	__u64 flags; /* all undefined flags must be zero */
 	__u64 mbz64[4]; /* reserved for future use; must be zero */
 
-	struct i915_engine_class_instance engines[0];
+	struct i915_engine_class_instance engines[];
 } __attribute__((packed));
 
 #define I915_DEFINE_CONTEXT_ENGINES_BOND(name__, N__) struct { \
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
