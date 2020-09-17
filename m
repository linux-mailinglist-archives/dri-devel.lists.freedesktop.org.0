Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9452226DD7F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 16:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAE46EA78;
	Thu, 17 Sep 2020 14:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222796E073
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 12:16:31 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 477ED9C2;
 Thu, 17 Sep 2020 08:16:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 17 Sep 2020 08:16:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=A3z+Nrk/yqKWEBPZ/sOK9Hn/BV
 h5Mhww/f/Scl+4Gts=; b=AosdZroopcWZK3EINVOoP3zmm7xXLkpIahEcHHd8R6
 vg7+biTDe+B8k0JsuGCnSbVFY0AxzuH9wk/cbTUAnL8Rks3j9P/l009BT/oIJ5CS
 sJ47BCO+h+t0H8RBKLG7tXo8xxEGD+xfCGigAj8quWR10167IZrDB8oesXdEtVsJ
 2MPlkQ/jcqjb1qkj8rT+7KBtjJzp4RbVxJHhteF2FvgvDKbLqUkAL7d49s8mj8IK
 P2+vTAhojX1Dau+mgDBnP0YN6yO/OK8VuJeQ3BCNRNY9+N2ZXxEU78Qjb4iZPtiL
 EK8X4Rt1HMVjKk9c+PFAmAHvrp/DunsYoS/qWv9CtHPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=A3z+Nrk/yqKWEBPZ/
 sOK9Hn/BVh5Mhww/f/Scl+4Gts=; b=modBebajn6WYpznrGA5ccX3hOy7YZtfLr
 RYacCAkTRoVw4cS57sWXGILYFKYd8xnFeGcPWUyHJspOmFLJ/EcXAbn0XpqnimQI
 MmPxldqhZ1dOq2XQpfwKziQbCsBY1dq+V0vlWmSYER672sD2Xb+KAzbseHDSf6Ij
 TKHqN09xeTsg9T1hVIPh77nnzmJRSr2yKmFNU4QKYqcBK9/YjUDVNH8TOiB8G12Q
 IGNWUNhCVmjVHCjTFQu64jOPEQGXYdoKLyB57wqF0OnTRp1W3xDqD3mcDaHqfzJj
 36xWEpAndsLIPL2s3xooZsL6eKYZsykus1l+bXAPy2FSQcTCQLljw==
X-ME-Sender: <xms:mlNjX_5ldi17csmNvU_1PNo6iILDrH11jML86tOxWcUad8BpZx11CQ>
 <xme:mlNjX069KU38IOcz9OQhY6feIzNnJxLob5TI_v2kcgNGgx3g29TjQL9yXgSfoVAXp
 3GG6E1uCCH-Bq0-Yw8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdeggdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:mlNjX2cGInox7_U_BQMT-iJs_LxgLmT6qjsQCfnjJHYQ9Q7HYcdJ7Q>
 <xmx:mlNjXwKwFBBLOrHF9Bo2BHH5WsO0cx-lydkPvzy2C_PnkQnC7TTT1w>
 <xmx:mlNjXzKBDKloRDqFEtaopt_j062uAM0yAQ3vSJBe1AGz6Aazfi2ERA>
 <xmx:m1NjXwo31eREzLUBjpVFl-i6aOL8Tzyd0zyUkFcYzknWsEzJwadNaQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0CD853280065;
 Thu, 17 Sep 2020 08:16:25 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>
Subject: [PATCH] drm/vc4: hvs: Pull the state of all the CRTCs prior to PV
 muxing
Date: Thu, 17 Sep 2020 14:16:23 +0200
Message-Id: <20200917121623.42023-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 17 Sep 2020 14:07:28 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vc4 display engine has a first controller called the HVS that will
perform the composition of the planes. That HVS has 3 FIFOs and can
therefore compose planes for up to three outputs. The timings part is
generated through a component called the Pixel Valve, and the BCM2711 has 6
of them.

Thus, the HVS has some bits to control which FIFO gets output to which
Pixel Valve. The current code supports that muxing by looking at all the
CRTCs in a new DRM atomic state in atomic_check, and given the set of
contraints that we have, assigns FIFOs to CRTCs or reject the mode
entirely. The actual muxing will occur during atomic_commit.

However, that doesn't work if only a fraction of the CRTCs' state is
updated in that state, since it will ignore the CRTCs that are kept running
unmodified, and will thus unassign its associated FIFO, and later disable
it.

In order to make the code work as expected, let's pull the CRTC state of
all the enabled CRTC in our atomic_check so that we can operate on all the
running CRTCs, no matter whether they are affected by the new state or not.

Cc: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatically")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 16e233e1406e..af3ee3dcdab6 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -620,6 +620,23 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 	struct drm_crtc *crtc;
 	int i, ret;
 
+	/*
+	 * Since the HVS FIFOs are shared across all the pixelvalves and
+	 * the TXP (and thus all the CRTCs), we need to pull the current
+	 * state of all the enabled CRTCs so that an update to a single
+	 * CRTC still keeps the previous FIFOs enabled and assigned to
+	 * the same CRTCs, instead of evaluating only the CRTC being
+	 * modified.
+	 */
+	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
+		if (!crtc->state->enable)
+			continue;
+
+		crtc_state = drm_atomic_get_crtc_state(state, crtc);
+		if (IS_ERR(crtc_state))
+			return PTR_ERR(crtc_state);
+	}
+
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
 		struct vc4_crtc_state *vc4_crtc_state =
 			to_vc4_crtc_state(crtc_state);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
