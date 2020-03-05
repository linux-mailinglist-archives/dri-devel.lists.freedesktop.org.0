Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DAC17A3CC
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 12:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A776E1ED;
	Thu,  5 Mar 2020 11:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1452 seconds by postgrey-1.36 at gabe;
 Thu, 05 Mar 2020 11:14:16 UTC
Received: from gateway24.websitewelcome.com (gateway24.websitewelcome.com
 [192.185.51.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726546E1ED
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 11:14:16 +0000 (UTC)
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway24.websitewelcome.com (Postfix) with ESMTP id CD3A0D8570
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 04:50:03 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id 9o4pjL91vEfyq9o4pjOy97; Thu, 05 Mar 2020 04:50:03 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jugb5LVg8mFca90YkJDM5+QeWSDDP8jv8ZoLZGi2tQk=; b=fyQCDPNsuCw6k+WxIMaPPP4leb
 7l1Nz0bH4kub4AkCs87UpqzkevQYEMH+f2hnlm2AVjrLtRJ+XAz0RMZEtn2rExj9zSH2UBM+Ec+w0
 0KMNhgH25n7RtAOoEpe3zuLaCYf8j5f8c5eOUnhAmCjcxKn1y/gwju/lGlo7e622Lrwz3a199ZH8p
 4BK5XJDxm596Mow3aIXsleBpy3FAU+bMdebDWiz5evyLoomLlWRVFsftjPfs0+ETHR8eWwYG4vOKc
 3E6E/9x904yADz4B2a0nSbUustpehD9zc1mMFQgU2tHDCZp1EG9gR5KOZJmsA75MgoQFTI7SfTWJ9
 OxpMQrbg==;
Received: from [201.166.169.220] (port=15208 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1j9o4m-003e9d-GQ; Thu, 05 Mar 2020 04:50:01 -0600
Date: Thu, 5 Mar 2020 04:53:06 -0600
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH][next] drm/gma500/intel_bios.h: Replace zero-length array
 with flexible-array member
Message-ID: <20200305105306.GA18788@embeddedor>
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
X-Exim-ID: 1j9o4m-003e9d-GQ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [201.166.169.220]:15208
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 12
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
 drivers/gpu/drm/gma500/intel_bios.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/intel_bios.h b/drivers/gpu/drm/gma500/intel_bios.h
index a1f9ce9465a5..0e6facf21e33 100644
--- a/drivers/gpu/drm/gma500/intel_bios.h
+++ b/drivers/gpu/drm/gma500/intel_bios.h
@@ -227,7 +227,7 @@ struct bdb_general_definitions {
 	 * number = (block_size - sizeof(bdb_general_definitions))/
 	 *	     sizeof(child_device_config);
 	 */
-	struct child_device_config devices[0];
+	struct child_device_config devices[];
 };
 
 struct bdb_lvds_options {
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
