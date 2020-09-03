Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 595E225D1D1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018366EA84;
	Fri,  4 Sep 2020 07:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D264D6E199
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:01 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id A6F85B19;
 Thu,  3 Sep 2020 04:02:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=YXxuxU9ZHEh8p
 R9CgSs5iTltTrXj9Y+atvdh2HoAYHQ=; b=WvkH7UnVZm96cA0Lg4Fe6WtSbYjza
 cUEM8GIzFXWhh2KPzVrVwWDV1CDUnGjo5TyG9YVSuOcnJrp93HZnhYN799uCgY0M
 DiaTsoBKvCdBMz0/WaYYKreuShomBnsL4gOvXYsmrzw44i3MnLCb0OH1HpLLcIiQ
 /XCVnsm/++avukKSV46Jv48fDJb9d9dim8daU98QcmJpjfPJwJAhHDRXqWrBY+z9
 jo3PIIHbTIqrv7OEvr2nSTMi7kuy03z2vXZ9OmQ2za6WgNfwcH+L5p/Auz72A0uY
 XcqOTg+oRasU8MRKrBWX9b9tcTKjHh7Blq1kDLlfxEvP+xXuLLSsmbIqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=YXxuxU9ZHEh8pR9CgSs5iTltTrXj9Y+atvdh2HoAYHQ=; b=KoXs2PLf
 0udoKdgDiBtmFFeRdAWYuirpht06oBvnE7hHFf6NmEh1DrGC5pi07GYBP60VlYt1
 BZ85/zYi9mLHdwYAbKt2On9KjtQGFgKh4EU/XeRHdUfvtZ5wC0MlhpqgBZwsqamK
 0s66uf1l2EdBJQYHSHdBRgziFZpPZkxGyvZ1kAsVp815/4lVICFtn/6emXLVQan3
 R+t2Vn7g7BGmsE+Pl7v6e5GxcLwJEG/Zav65jTOv7DZ36m5pIOACqYfl7SO7/uVy
 BUARhrnGYdUTTctIa/v1obWTVMXHHjE87GMe5lDBMlHcgDiOdslP4GcEowB/aiNR
 0OrH/7z8+69bwA==
X-ME-Sender: <xms:-KJQXzUgeMiNsyaMaxPV-V0VJrOuxC5rFrrJZYJPaql07b_rBZe3YA>
 <xme:-KJQX7lw5zYLR1Kk2kFNU2L-ZsEMlljiuH6O7wgFGo0fhhERLb_qGAOULh18afGW5
 qrTNkorOEzThxDropU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:-KJQX_aMvZ-Br77jd6mauLOWuyXaOzfVQqcI9uhUB-ZGJJDv_YTVlQ>
 <xmx:-KJQX-V0BdzIHEIUFrhpXxwTC7CzqVXSizgHUOwdROZTEs4j3Yw0Ww>
 <xmx:-KJQX9lHuCqCGGvDfwjdmfzQQbUHSO7eVNnfA5SeHBSt_mMTJ_xJMQ>
 <xmx:-KJQXzcYVlvU-2yqENoYvtDVMUd2o_ppmfaRC1tAUX9rXhXVCRZnGNBuopo>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E1D0D328005E;
 Thu,  3 Sep 2020 04:01:59 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 04/80] drm/vc4: plane: Change LBM alignment constraint on
 LBM
Date: Thu,  3 Sep 2020 10:00:36 +0200
Message-Id: <6f9c4fe1eb9258a3f1d0f21af6a99c42472ac531.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The HVS5 needs an alignment of 64bytes for its LBM memory, so let's reflect
it.

Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 20c949b57827..d0771ebd5f75 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -578,7 +578,9 @@ static int vc4_plane_allocate_lbm(struct drm_plane_state *state)
 		spin_lock_irqsave(&vc4->hvs->mm_lock, irqflags);
 		ret = drm_mm_insert_node_generic(&vc4->hvs->lbm_mm,
 						 &vc4_state->lbm,
-						 lbm_size, 32, 0, 0);
+						 lbm_size,
+						 vc4->hvs->hvs5 ? 64 : 32,
+						 0, 0);
 		spin_unlock_irqrestore(&vc4->hvs->mm_lock, irqflags);
 
 		if (ret)
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
