Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 422722A2BD7
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 14:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2856EB88;
	Mon,  2 Nov 2020 13:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83316E4AF
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 11:11:36 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 7044AFDB;
 Mon,  2 Nov 2020 06:08:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 02 Nov 2020 06:08:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=V0Uz7vlzKIvnIlOQtX+J4fapG0
 LP/f9Q0ZgeLirlhg0=; b=sqoxb9MuH+NE0i/RGh7XJhC6VtqLH7ps7YBTFKbdjP
 qIjOd0yIhGkngQ6cs+KxNmZ3lE8mUy1V5meI+TsAO35pfTgCCh+DGuDTnn7GQL+x
 RydFoWOIX3LUBjpZsp67S42qsCDU8X9nOllHobs8zvnne5792OmSH/C6ugmCudci
 b91zvUz4LsZkmzplDTy+ysYu5pwOzzaoeSh3kAl4aMr6tMuBCOVdlZehs6S0hRur
 lsv4UY8OLQmL5rNz6VgLW4cmPpzNwyEuVbYtGzmSaFAboR4wVrId7AOPXPiWNiyT
 oB1JU2r2DjMendsQF3JFLXFNiTnSwXgT2nA3ILIrnlgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=V0Uz7vlzKIvnIlOQt
 X+J4fapG0LP/f9Q0ZgeLirlhg0=; b=l59bbQxn3psO8qSm6V/SL/Py5HGzcvhdn
 jV4w5hJWD6naxzwpEugo5T5MyxqXLN5lTH1XkpEHz60jCacxW82WmcKzT/lPXTkX
 lzTrY930t5HpNFvCnltwL36E2RsmjIhjSMnhmg2EUqS2pOPSQxMMfjNOk3tqghJp
 sMP8NiI3+3NTLqkLT3mrofZ0iZXFWPQBKRSCKu05cRbLlXQLx8GaZ74fht+6kgmO
 1/M4SKaXctDNRECVZ37KgREc/k8Ma4IJBxy9a3Od+6FBpTOruFIpBo64vW8NtahE
 Nh19vDfGqmQQz2vnFyTuTkygZdzvFtr5OeQSQlEr7stWnfotFFQdg==
X-ME-Sender: <xms:meifX2jh1pCpMcGBRrEJByS1JJgXgv1-x7kjrB75kGVBRr6I1e8SrA>
 <xme:meifX3CF1_3GLBkexLxZWemVtb1na2ySau2dMznGQ7Gwi32cqa9lu10WX9iBtntO7
 t_DTR1r9teNqz8-9Ug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtuddgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhephfefhfehkeejueehhffhvdfgiedukedutdegveeifefhieeuvdduuddvgfeffedu
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:meifX-HIRtGNBrgSGL98V2tw1Iqp0_HWKGhUf6iBfdEXDzdtbXICzg>
 <xmx:meifX_QZ7UXP3-1Eik5Z0FdGg3QDZZTAjusERVtPOCB1dECzfbLSRg>
 <xmx:meifXzwJeYzDl0i6IWk4Th4rJyTPvDZEEVVwrpu_mDEF2tbp9I_U5w>
 <xmx:m-ifX-qobw5HWgJTkF0IMvZu5cIZjOZyfJijqEwJ7_fxParhJoMPvw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id BBD5B328005A;
 Mon,  2 Nov 2020 06:08:08 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH] drm/nouveau/ttm: Add limits.h
Date: Mon,  2 Nov 2020 12:08:06 +0100
Message-Id: <20201102110806.429002-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Nov 2020 13:43:21 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It seems that a recent commit broke the nouveau compilation when swiotlb is
disabled (which is the case on our ARM defconfig for example).

Daniel says

"""
Since the proper fix is maybe stuck in the usual "drm abuses swiotlb
internals" bikeshed, maybe best if we push a fix to including limits.h
in nouveau and call it done?
"""

So let's go down the simplest path to fix our build, and goes back to it
later if needed.

Link: https://patchwork.freedesktop.org/patch/397835/
Fixes: 4dbafbd30aef ("drm/nouveu: fix swiotlb include")
Acked-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/nouveau/nouveau_ttm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 2bf36229dd57..a37bc3d7b38b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -23,6 +23,7 @@
  * USE OR OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/limits.h>
 #include <linux/swiotlb.h>
 
 #include "nouveau_drv.h"
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
