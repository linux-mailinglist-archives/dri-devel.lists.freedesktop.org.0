Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FCC5485C2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F292A10E809;
	Mon, 13 Jun 2022 14:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F8D10E809
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:48:15 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id C94083200923;
 Mon, 13 Jun 2022 10:48:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 13 Jun 2022 10:48:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131693; x=1655218093; bh=20
 ZZer0BGS4nj7x/1ZpdaBAiyNOK5pEWn+Mn9iHqYZQ=; b=oin0H5utuRzp7CWw29
 QBuQCgITW8rIF9gHIijSnupSdBuKNoyWK4X7dM/wRX+z5+av9wAsWEj6j5+fpWzu
 6/D1P0zE3zHSgTp4pAVSjrgT4lJTsXw3AzQ/dm8SZ0v6afCzhf0DB/l7qgJJ4Q7K
 VAi3dVP7CMFWj37QTuL9p8ZBAbbCeRa4eZj6CmSTsK89UZU3Gg4Izu91mnVMicgZ
 nPoEE4V5izszHDRrm8yF2gBaW9FFKB1JUgwxwFGdQ/mzicNqes0SOSCDMCMn86TG
 HiuBg9hdpbOul1eUpD7RSLnbUxgGgoU1L9GSbxs6Ili5koovsESdjSp6pDU16IKq
 7xbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131693; x=1655218093; bh=20ZZer0BGS4nj
 7x/1ZpdaBAiyNOK5pEWn+Mn9iHqYZQ=; b=poN3RFoUGE7nzIjzLk1TaiZ/8NDhl
 bauCVgndJe+WkbWN/2Ur9+OKPtK2huKwLF1HesRdXPmWm5ZMNecPDty955tZddqP
 JdouxeGjPVodsd0bd1R3IF/MA58KW2H+Fc6jmN1YOJnTAtnkiQUbDGGqHdb6ERgW
 hetUprkg/8hbvI5GHQ8NNs1usjFY7No0/g3FNcNAdfA5DQer75UMFobwJb7IWltR
 S3XkJNTpRsQGGi9s0h7z6munacrHETwOlc0HzjVhSIxeOWy7gTkferXmgObsp9hM
 rC36e7yZ6yBp81ybpEwY0mL3jBIeiptzvb9VnB9P2NftabsHpJbKm7yDA==
X-ME-Sender: <xms:LU6nYnQGYB55qrmgNq7T1bZmQTIM8wqAhL0Qv-h2kfN8KDX24PHWeA>
 <xme:LU6nYowTlQeTSetX_HKsdtKra43AQWdd2omYEvhH3ky-Gv56z4vTBx8zZZlJEsW4y
 YTkAKerYtZf7F1RGKw>
X-ME-Received: <xmr:LU6nYs1yeY4yWTR9V4U-bPcbSRqVMvxSY1TZpMyLP-UUaoBm4mkea3HzbWTin4jeZ2kccRCmTnCQbRu3EYgCHQPtDk8sODT4CA0bpvs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LU6nYnB7uaaptS7tjZGssSdTJrq2wVE5jyz1LOTarsk6-gIzbSw-bw>
 <xmx:LU6nYgjzY8kQxXMDq94XbDbsuAiamBKdLhc-HJF2MXh3MmUY4M92dw>
 <xmx:LU6nYrpGLgitABikRvbCHDRRToWXIsBlK-GCAme3KOs4Mg_tsH7ZIA>
 <xmx:LU6nYof4X7_qfdPOLqjR-zwqsYoBxUKbupCtDucZTEyAaIxA7ZuYzw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:48:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 03/33] drm/vc4: kms: Use maximum FIFO load for the HVS clock
 rate
Date: Mon, 13 Jun 2022 16:47:30 +0200
Message-Id: <20220613144800.326124-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613144800.326124-1-maxime@cerno.tech>
References: <20220613144800.326124-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The core clock computation takes into account both the load due to the
input (ie, planes) and its output (ie, encoders).

However, while the input load needs to consider all the planes, and thus
sum all of their associated loads, the output happens mostly in
parallel.

Therefore, we need to consider only the maximum of all the output loads,
and not the sum like we were doing. This resulted in a clock rate way
too high which could be discarded for being too high by the clock
framework.

Since recent changes, the clock framework will even downright reject it,
leading to a core clock being too low for its current needs.

Fixes: 16e101051f32 ("drm/vc4: Increase the core clock based on HVS load")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 7a7c90d8520b..69eae37e82f6 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -946,7 +946,9 @@ vc4_core_clock_atomic_check(struct drm_atomic_state *state)
 			continue;
 
 		num_outputs++;
-		cob_rate += hvs_new_state->fifo_state[i].fifo_load;
+		cob_rate = max_t(unsigned long,
+				 hvs_new_state->fifo_state[i].fifo_load,
+				 cob_rate);
 	}
 
 	pixel_rate = load_state->hvs_load;
-- 
2.36.1

