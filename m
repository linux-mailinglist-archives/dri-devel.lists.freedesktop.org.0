Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 074903A9D4F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 16:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA116E197;
	Wed, 16 Jun 2021 14:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867486E197
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 14:15:40 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id CE21B5C01D1;
 Wed, 16 Jun 2021 10:15:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 16 Jun 2021 10:15:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=qe8udD8dh4+GY
 5et0QsfCVsgNvlYPmafxafuP66nELw=; b=pj+oxm+1RqwW/FLWM586YJ6BVfkI2
 QS9xIELcDlWBF8ZZQ5dX3nJ2EVEPiZ6T4ncQv45mBnvwlzF6G2XoA6jQMSQzwrjV
 EvR9vbFgLHTBp+BtIiXzjfyHrzBSDMcsAw6DNSPSMoRGnCnFhMWo2OnHXjYkEfIj
 QakQOiBX44okq2HblkoBiFdYpZ8OdGvd7Iffo6dEEcs+5B8drYyvvST2F7/9evFg
 zyDjTzNhQdORnH62oKynaobQoKRp/BErtOmU6yLu5cvwx4FN+XiNsVlP6paOj3wN
 4QANMSiYoJw6clk27WVJNoQOQtng/l/PtoFhqex8o0cEurNc00AGkvdoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=qe8udD8dh4+GY5et0QsfCVsgNvlYPmafxafuP66nELw=; b=MNO0gcY4
 uMieqw42XUga0l93QphYSUX+nGaOt2ZTVfPRX/Kw/KqxUT5NYkYypuS7Q5nq5pdI
 wLzF+wvHFYLFK8OCxv9/JunlV7vGNLgtT2ahRQcJ6+578Lix/jXArYyPbSa1uagJ
 CtG8ZjXk0msEjAN76F8VTyy6Zv0LlrYaDpR9j7wlKnfuJEkRPww87NTRqfJ9Emu3
 jpeGPXQdE/NDIc5GpFcxdbrBZBMI1vYBRBXTFKhzvWYDm/B+/DlegPJsDpHn3xTS
 GgqNBGEb65pgklAHHce7jce2vSmQQthi5aI9WR4To1lf9gWNgkyikxJlLTYNxXbc
 qg+fAzwdJ/bS7A==
X-ME-Sender: <xms:iAfKYJeVhfTyEVhspP5qIm6Ic-l_uXl2KFzgb2-FRQkiA-LqqE0WBQ>
 <xme:iAfKYHN3cEJV-eZEQUC7N9pt9oXVtOIj9leeRInkVPWUV2Wnj5qtrNmJdJAoQ8s75
 pjdwMdCOCJsiCX0DTU>
X-ME-Received: <xmr:iAfKYCiGmCRknrbB6WH9ZGS7v83PgtsP3wo8rkh61k0cnPBwdZnSvzoR58iiR8Akxjfg_jWhuvZ43eVd3jw24N0jAVuP3HZG9LUu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvledgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:iAfKYC97PD9gsQHVtCA01UZlHoEtssKmQk03ybHxexnOleFt5GedUw>
 <xmx:iAfKYFtxBNFlWlbVsxNef6kDYcypA8MwOAM0y5RqxNEfc6-QJruL3Q>
 <xmx:iAfKYBGihudbXYivFSUoPoRZVs4A4MBIDxonMrfrSDX1foWUUMw_MQ>
 <xmx:iwfKYDU1iXIwqAu3j2kx4-wQIIVY8ikUBAHvVRZKSOAmP4XZSSybmg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Jun 2021 10:15:36 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 2/3] drm/dp_helper: Mention the concurrency requirement
 hw_mutex
Date: Wed, 16 Jun 2021 16:15:28 +0200
Message-Id: <20210616141529.630719-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616141529.630719-1-maxime@cerno.tech>
References: <20210616141529.630719-1-maxime@cerno.tech>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers that allow concurrent access over multiple DP channels need to
provide additional locking, even though the hw_mutex field might
indicate otherwise. Clarify it in the documentation.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - New patch
---
 include/drm/drm_dp_helper.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 1c5ae07ff0c7..0cc6062ff3ad 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1878,6 +1878,10 @@ struct drm_dp_aux {
 
 	/**
 	 * @hw_mutex: internal mutex used for locking transfers.
+	 *
+	 * Note that if the underlying hardware is shared among multiple
+	 * channels, the driver needs to do additional locking to
+	 * prevent concurrent access.
 	 */
 	struct mutex hw_mutex;
 
-- 
2.31.1

