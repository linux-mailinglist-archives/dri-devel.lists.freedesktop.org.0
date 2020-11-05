Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F26CB2A9173
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:35:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E126EE12;
	Fri,  6 Nov 2020 08:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1906ED74
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 13:57:05 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 13E6E580351;
 Thu,  5 Nov 2020 08:57:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 05 Nov 2020 08:57:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=9dns/4cU1GosP
 TIVFO95SkN0s7hR99dB8G4XXnW/Y0w=; b=i1e6etSy3awpJufJrPTCLdsq7ZzNE
 lrrUObvbYlK+wrn9qbLVMe+sVyVHRH/2A7yMqiqBEU/kLOgY5QMW9ZH1mUZ/nKNk
 yNOMbCK2iCXsBJXnX4UK3x1vNXwJFMQmD2WU+PlK4JSEOrDF0VyO1Xq5jHsPHRjK
 5UEmvwgKxFz72LbiAv3zOn0f1Mj04DWPEKxNs6MIVLRldl7vLO/yiP99H+F9Jrnb
 WEs6XH7PQyFyG3zNBhbkBZ9uIYcDejsQfFEOdY3pQV9pHJCgV9QFq855Cm7D0jx1
 WLu+7Vi2j3tO0ZFAtjpHH/NnVe00KK70KqvqeJw6uuBZhobYUTB015YSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=9dns/4cU1GosPTIVFO95SkN0s7hR99dB8G4XXnW/Y0w=; b=FwUIuYVP
 auV0qn2VS486rGtox/HuhqC55KoRM3SnLlGfmgqXYhY4Lskp+4dSWDNqguHYaYzd
 hbY3QXrl8vuU1oTG4iXSwR9g/KEAeKk28aJwZpaF5U4timInbAvB8sp0X1rMk5Fr
 vh5q5tHo3I/pvQlDKEgbUx7sMnZVg66ZC2d8j60IM6It9dgKCKrNF2HJv9Gt/96s
 gJlxBPaNiWc56dJ9T3UdBWVcMvYiH8j3vilh1oxbz8JLmfHhC4x6q66WmI1XXG5m
 6Zurtwlh6Opp7sSDDym93pR3XVM8hxk5sw6u+hDL2P0kqpsQq5ek+lmkLDc+zS/y
 He9NQzan7EZpPQ==
X-ME-Sender: <xms:sASkX3mCp5LyAnUjCyq4uN-IGSzQZNQtQ3fjoHdTbZFk_sLMBEPK1w>
 <xme:sASkX61fDW72KdHrcmBQWWOWz4ns1Rt_QlB6NxsVpRmG5qUU9MszrFcujzxHbxD7t
 T2e786ZEnFVMA3MC0Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtjedgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:sASkX9qCgxBgUw-uGg1UA44CWVXv7r99V2OcPmmysDzGfUxSWkVAlw>
 <xmx:sASkX_n-aSEtQPgZ1pWbjSQbOIpVVTfK_b63TqmkEkp6uMVADUJINA>
 <xmx:sASkX10KBa1hJ--TG2-Utx2Txnem3uhumWBcrqciW3MS9sp9Ex3sUw>
 <xmx:sQSkX02XTRIs_8UNX8i5bBM6vfb1I9rQf94WKqZELpS5z7JygDhw-w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 85988306005C;
 Thu,  5 Nov 2020 08:57:04 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v3 4/7] drm/vc4: kms: Split the HVS muxing check in a separate
 function
Date: Thu,  5 Nov 2020 14:56:53 +0100
Message-Id: <20201105135656.383350-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201105135656.383350-1-maxime@cerno.tech>
References: <20201105135656.383350-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The code that assigns HVS channels during atomic_check is starting to grow
a bit big, let's move it into a separate function.

Reviewed-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index ad69c70f66a2..bb2efc5d2d01 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -662,13 +662,13 @@ static int vc4_load_tracker_obj_init(struct vc4_dev *vc4)
 	return drmm_add_action_or_reset(&vc4->base, vc4_load_tracker_obj_fini, NULL);
 }
 
-static int
-vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
+static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
+				      struct drm_atomic_state *state)
 {
 	unsigned long unassigned_channels = GENMASK(HVS_NUM_CHANNELS - 1, 0);
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	struct drm_crtc *crtc;
-	int i, ret;
+	unsigned int i;
 
 	/*
 	 * Since the HVS FIFOs are shared across all the pixelvalves and
@@ -741,6 +741,18 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 		}
 	}
 
+	return 0;
+}
+
+static int
+vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
+{
+	int ret;
+
+	ret = vc4_pv_muxing_atomic_check(dev, state);
+	if (ret)
+		return ret;
+
 	ret = vc4_ctm_atomic_check(dev, state);
 	if (ret < 0)
 		return ret;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
