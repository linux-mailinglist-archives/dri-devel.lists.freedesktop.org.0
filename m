Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF8725D1F7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855DB6EAB8;
	Fri,  4 Sep 2020 07:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502836E5A2
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:14 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 2B1C295D;
 Thu,  3 Sep 2020 04:02:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=HP2Umc0xayx3I
 eEsu6ucfKoQyCoydkeUKb+6o6lgPuA=; b=P4fGsJzsslLqTPbmbbJGep0U2lR1t
 fEOxqpF5Xeur17AIK/edcWAohSs6XXu59noedq+C6T5tJjnhsHEMqmY57DpFA4EF
 gOdF6fbrAXzWydJpX7yKAQxuqPgo3NW4CZzNE45GDbS9bFw6X8BLLRYp/Wv41fzW
 Up5WtK2Eltpo0K0NHx6xBXZ615UPKhOOcsMZsq1oevbvuRI12B4CBOc0W46kFk9G
 LQqThTT65wvR9QHdSOOPehT3j1RdTDWc17WAZMz890lYXM1l3IfYCcu1H74CAAY2
 il4G662zIVFCoj/dHDlHUuwBgK0gOGuKtQFtllHcQ3thXGfuC4OZ3rgYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=HP2Umc0xayx3IeEsu6ucfKoQyCoydkeUKb+6o6lgPuA=; b=i9H0TRGI
 V8lUlwxTGyT6ncP0p9M5Pj9/2idKIsK9z8fma2T4Ehh/uHTtcN3g3OcnYgT8YhIB
 QSQ79SfUtSGrSmGViLa/86I/pgNmL4grR03S5U5o87wDnlVTDTrx3DN+LdRJ5nKg
 e/gSGHx2+q0/Vfrm3+yMrIafpIxCbFMDOYdXYyT0mUekU7uynUeA3vIMAmHENQML
 pWDZ7c5BQhZlaVxjmPwGMmdZORGHxUylT2QOyaQJ30VCMSD+nXv8T3mMUlTeVd6O
 +yKnKM+VWo+L8l9ADD6//2Jv4uWty/SGOIilXabMckIYb58Cdll81cyEPwLvScOf
 v5PlZw4r7QLK/w==
X-ME-Sender: <xms:BKNQXxIelnp3OPAU4ZiQoHSA5X4UIfJkUClNa8ynDU8u6CjXB-Oj0Q>
 <xme:BKNQX9IVfa0u-ZFNYN1acAqa16_-uEHxROjmnol-ARk3vN7cJAGQkRfGhSPa7aV17
 SLcbNzMrQDHVJFlh6U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedutd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:BKNQX5tO1XBkbL46PxX9HK1z8WSQfSd905Yhfmmw6jnVVc_GhlBQSA>
 <xmx:BKNQXyYmOdUJvdmtR5NK_MJHbZAlh6IvxZy8xKWG7ZrRjmnta1-0aA>
 <xmx:BKNQX4Ym53waRpRFPE6RMy9ADTczA7Pt-m-q9pnd34gb_ZGgOMBpxg>
 <xmx:BKNQXyAS9fPten9k5mk3ufKAKBKRJKuOBpP2ernML55osEZggLPu213mGR8>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 685FE306005F;
 Thu,  3 Sep 2020 04:02:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 13/80] drm/vc4: kms: Convert to for_each_new_crtc_state
Date: Thu,  3 Sep 2020 10:00:45 +0200
Message-Id: <a712d2b70aaee20379cfc52c2141aa2f6e2a9d5b.1599120059.git-series.maxime@cerno.tech>
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

The vc4 atomic commit loop has an handrolled loop that is basically
identical to for_each_new_crtc_state, let's convert it to that helper.

Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 210cc2408087..a41d105d4e3c 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -152,14 +152,16 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
 	struct drm_device *dev = state->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hvs *hvs = vc4->hvs;
-	struct vc4_crtc *vc4_crtc;
+	struct drm_crtc_state *new_crtc_state;
+	struct drm_crtc *crtc;
 	int i;
 
-	for (i = 0; i < dev->mode_config.num_crtc; i++) {
-		if (!state->crtcs[i].ptr || !state->crtcs[i].commit)
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
+		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+
+		if (!new_crtc_state->commit)
 			continue;
 
-		vc4_crtc = to_vc4_crtc(state->crtcs[i].ptr);
 		vc4_hvs_mask_underrun(dev, vc4_crtc->channel);
 	}
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
