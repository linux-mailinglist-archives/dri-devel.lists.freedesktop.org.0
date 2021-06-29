Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF993B72C3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 14:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E1F6E891;
	Tue, 29 Jun 2021 12:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8298C6E88E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 12:57:47 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id E794358042F;
 Tue, 29 Jun 2021 08:57:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 29 Jun 2021 08:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=g8a8wNRpa934Y
 MC6Pz3HoGGBUBjy+4EBkepvXyN4UFE=; b=SFYLC9TtlrYeYG/3DK1qewrtzglnR
 We2HrpXtLIdjoI1VNv2e8x9YpeJlGjCWxu0iaYJEczrdjdeh/PhvEt8MgfvNWDNw
 8S4riPLiBEbq1mxSNmrUUpyGw/TpKEhq5aVzkbE9NEsn+E1PNFOxdeusncckQojM
 H69pMbUkS5ONvIogmjb6L+CsRHaZSKgQrYWV7wct2rQHaALEFi13y6rOCKa6SOmp
 b0rxDWhusfNSL/pCioR3WstSGBrWhRfImB80s7zshBIDBCj2nzpCzXlB0FQBo+Zi
 27WNkQcFmpx4aigXl6etK2k02IwKd4ZU5jc2fV03LIeizAZLtOfciDRvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=g8a8wNRpa934YMC6Pz3HoGGBUBjy+4EBkepvXyN4UFE=; b=Zr3YkCfg
 8WZ1d4Cg88HDaPCsy5SjB3x6jdWI0ij4ahYYPhXAo9/2/g8P5aWEXon4+62zEQzK
 7CICJk0KFM9nRKMomJRe0xWwY7oUGDNvTl7NVO/gH/7NjNbAuN3tudD3uvdqzB40
 Dg/5vnOzREuDvWfA4DfjXSkZpAd2maerlQw2tA/hqk75Ku8N+zhpUhxlGNot1y5L
 PGM9WQLxmYZ6orLFwZutr2DOe4VmnyzDcheOhzaBb85xjD+w6hjJHHbDBRnIZ+n3
 3Jx1joVDG2ZgbjfC6V36yLXjr5+Bhs4fyCINp3Jif1SzZaj4GNS8SH7dGmW9ore5
 nB3jBZnkwVXWaA==
X-ME-Sender: <xms:yhjbYCO1gv_nlaPG2behqHp0ffwukC4YbZr0O-MH6SyDexPOyVWtbQ>
 <xme:yhjbYA-untfwvR49LWmwbxoGBuknrPWHxg9hSu_j_iuWT3HXRmDnfIR7TbZO9FFU-
 irhj9h_r31VAzO04Dw>
X-ME-Received: <xmr:yhjbYJTuJc7NnAOYGXPq1xmwARUqI07sX8ZP6OBJk_NyeMcIkuZk6LsK6u3fGNiBfSGbQojhX8t3Q6blPE7V2-yGi5oENY59cFE5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:yhjbYCv50me4nl4dTf_Q8EScv98r3UwisdmTEKX7-RERxhdz0nbesg>
 <xmx:yhjbYKd9mPqU-Eiih5AUyykAgVqFBkZ8yoG1lTOSA-KBrkSjNNZTgQ>
 <xmx:yhjbYG0mrNzYus4pnyGkrgx1tcFwQ-kyeR5dxS6xC92UMipiRW3RkQ>
 <xmx:yhjbYNv1kQTrXamKXQyed3W7J2UEIuLjpM_yKv6vgrXqAG5W_Mgj2g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 08:57:45 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 2/4] drm/vc4: hdmi: Put the device on error in
 pre_crtc_configure
Date: Tue, 29 Jun 2021 14:57:34 +0200
Message-Id: <20210629125736.414467-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210629125736.414467-1-maxime@cerno.tech>
References: <20210629125736.414467-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Tim Gover <tim.gover@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the vc4_hdmi_encoder_pre_crtc_configure() function error path we
never actually call pm_runtime_put() even though
pm_runtime_resume_and_get() is our very first call.

Fixes: 4f6e3d66ac52 ("drm/vc4: Add runtime PM support to the HDMI encoder driver")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 707fe43ffeea..b3db38d37550 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -958,6 +958,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	if (ret) {
 		DRM_ERROR("Failed to set pixel bvb clock rate: %d\n", ret);
 		clk_disable_unprepare(vc4_hdmi->pixel_clock);
+		pm_runtime_put(&vc4_hdmi->pdev->dev);
 		return;
 	}
 
@@ -965,6 +966,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	if (ret) {
 		DRM_ERROR("Failed to turn on pixel bvb clock: %d\n", ret);
 		clk_disable_unprepare(vc4_hdmi->pixel_clock);
+		pm_runtime_put(&vc4_hdmi->pdev->dev);
 		return;
 	}
 
-- 
2.31.1

