Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64462518407
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 14:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0911710F937;
	Tue,  3 May 2022 12:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C68610F937
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 12:14:17 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C2CE4320097E;
 Tue,  3 May 2022 08:14:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 03 May 2022 08:14:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1651580055; x=1651666455; bh=l3
 dAtwMMi0l0RS8MXmeN3MVV0/itlWegu4Z/uhVrW3U=; b=J62PBqAp7s2YfZ5iNO
 XxsBM7eQURUm2QhvV77F634cehCiYytLuX8z2gL/Az6alRTcnczvwwdMO49t+c0O
 mzkfDcxWMwdKrdRD1VsQGYoAciSbEPjxf0KP4a+xCyksoiUsJd8FdpFJWBM/yW+Z
 TslVo5v5hctlXfr0SS6dMQTQC8jzbwV2IX3+uhQ6LT2zgAy9YDH0oattnRWg9tcj
 e7kWPJQrgNYLILWeff7YMXRDARj6FmhKXFR5F6Q4k/xWVZL53Jf3CA5xckNp77K+
 YxDKXiherS0L6LOHr/EDCNPGHRHv+YIrU2nHIgxg2AXfin/AajR7WVCUT13qlBcS
 FT3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651580055; x=1651666455; bh=l3dAtwMMi0l0RS8MXmeN3MVV0/itlWegu4Z
 /uhVrW3U=; b=XYjefwSvUHiC5rfkU0p4kWKcIU9hQUSZzNsRArZYK97e8Qp3qx5
 HV4SAvgBYuh912dRMpOrELdMpmDsrdBKCwwPBZLZXVjPDAIwTCempsZ7cAdVzg09
 lJdKCgsFSHVJORveTmF9JHZl+5C69AzBA5lJsszIYVez+PFzF27SyqLTsBSunLlV
 41gPRV6xDGSm6yGVamKHfxHPuBwxfEjwnBq1MjfMEsaPtHQX875KehSPtJo0sgz2
 ovAgGFl4Ewc2BHhGnQJsn8oOrI3yw3HBFAl8rmU2/n7ZqXHjbJMJcBhgnUPBjq6F
 2btIZDAqUsr2mvlDAjuLbaKnz+ZozRuSiqQ==
X-ME-Sender: <xms:lxxxYqfF-6kAo5fyoVwAz1cHUblTLauh3haYY4E_JbQcDkXrA08SWA>
 <xme:lxxxYkNOseNIdJL7r9wXhtFWhq3SUYyMoGbZmw0nHl6MKkwS7oRl4Sj5ao8DQYd1q
 2NDZcAGjxO30oGmhtg>
X-ME-Received: <xmr:lxxxYrjc8nVyxbtsxx3XGH-v0Zm5iNw0X5hPu9qn3iA-MuHpELuKxri0I_lcnoURHHIwwE-Q-065OL9GuPMrM-189zWoDQmVv4AxbW4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
 jefhnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:lxxxYn-2OLnVmFPv39DCKqTtRfzfAfU6esgAieu5zD-NuUykKPgwlw>
 <xmx:lxxxYmuSc2wE0W3hetxqvha7QXTt5htEtOhXOD0Wk8Bfp8indFfhpA>
 <xmx:lxxxYuEVTEg1RbsmcY4Nr7AYDU4e50oIB3Y3g15utslXnLmhW9Yebw>
 <xmx:lxxxYoWPgTWiOlYmifKUx3AN81wZGiRuKdIqfpkQ5UuRfCztLFH3BA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 May 2022 08:14:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 08/14] drm/vc4: drv: Skip BO Backend Initialization on BCM2711
Date: Tue,  3 May 2022 14:13:35 +0200
Message-Id: <20220503121341.983842-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503121341.983842-1-maxime@cerno.tech>
References: <20220503121341.983842-1-maxime@cerno.tech>
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
Cc: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On the BCM2711, we currently call the vc4_bo_cache_init() and
vc4_gem_init() functions. These functions initialize the BO and GEM
backends.

However, this code was initially created to accomodate the requirements
of the GPU on the older SoCs, while the BCM2711 has a separate driver
for it. So let's just skip these calls when we're on a newer hardware.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 4f9e2067dad0..64c7696aa9e4 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -285,19 +285,23 @@ static int vc4_drm_bind(struct device *dev)
 	platform_set_drvdata(pdev, drm);
 	INIT_LIST_HEAD(&vc4->debugfs_list);
 
-	mutex_init(&vc4->bin_bo_lock);
+	if (!is_vc5) {
+		mutex_init(&vc4->bin_bo_lock);
 
-	ret = vc4_bo_cache_init(drm);
-	if (ret)
-		return ret;
+		ret = vc4_bo_cache_init(drm);
+		if (ret)
+			return ret;
+	}
 
 	ret = drmm_mode_config_init(drm);
 	if (ret)
 		return ret;
 
-	ret = vc4_gem_init(drm);
-	if (ret)
-		return ret;
+	if (!is_vc5) {
+		ret = vc4_gem_init(drm);
+		if (ret)
+			return ret;
+	}
 
 	node = of_find_compatible_node(NULL, NULL, "raspberrypi,bcm2835-firmware");
 	if (node) {
-- 
2.35.1

