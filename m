Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E5E547A51
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jun 2022 15:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E4A10E36C;
	Sun, 12 Jun 2022 13:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B566A10E371
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 13:22:14 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4CF56841D6;
 Sun, 12 Jun 2022 15:22:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1655040132;
 bh=+xKiwQAc3M/tzMg5PzVhJtSVC9/b8cS977o1kmCO1c4=;
 h=From:To:Cc:Subject:Date:From;
 b=SWcXVXTaJ0Toq21ExwsE0yrQpj/fcP/AKrJwuQYi66QmGLdCOFLPsEX9Z6SYC4SLj
 lPEcbPKireBVHrIdK4BTmj4BHJQ9xvk7lcnlvQdOv8hgD4X/iSUqngBkiuq98x8Ild
 1URyKQPqer1duh62Kj5ABJPjzuM1dIxzRguhdQ9fZW68HcTnrlU5DRFI9wnHoahyna
 OXXYvny5ykCG+cfzqi//lv5d+OM9xHYhScv+KWTDxLjSGblUdeF6/azfAoNhe4TWuH
 BAkvUazn/r4LIXC0JmgIR4B3y/yzqFqnfs5e1bCqJxSPFPTUA4Punf/1rEkZiRd97k
 ATjpW/kTGlxhg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm: of: Mark empty drm_of_get_data_lanes_count and
 drm_of_get_data_lanes_ep static
Date: Sun, 12 Jun 2022 15:21:50 +0200
Message-Id: <20220612132152.91052-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, kernel test robot <lkp@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, robert.foss@linaro.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mark empty implementations of drm_of_get_data_lanes_count and
drm_of_get_data_lanes_ep as static inline, just like the rest
of empty implementations of various functions in drm_of.h .
Add missing comma to drm_of_get_data_lanes_count_ep() .

Fixes: fc801750b197 ("drm: of: Add drm_of_get_data_lanes_count and drm_of_get_data_lanes_ep")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
---
 include/drm/drm_of.h | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 92387eabcb6f0..10ab58c407467 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -112,16 +112,18 @@ drm_of_lvds_get_data_mapping(const struct device_node *port)
 	return -EINVAL;
 }
 
-int drm_of_get_data_lanes_count(const struct device_node *endpoint,
-				const unsigned int min, const unsigned int max)
+static inline int
+drm_of_get_data_lanes_count(const struct device_node *endpoint,
+			    const unsigned int min, const unsigned int max)
 {
 	return -EINVAL;
 }
 
-int drm_of_get_data_lanes_count_ep(const struct device_node *port,
-				   int port_reg, int reg
-				   const unsigned int min,
-				   const unsigned int max)
+static inline int
+drm_of_get_data_lanes_count_ep(const struct device_node *port,
+			       int port_reg, int reg,
+			       const unsigned int min,
+			       const unsigned int max)
 {
 	return -EINVAL;
 }
-- 
2.35.1

