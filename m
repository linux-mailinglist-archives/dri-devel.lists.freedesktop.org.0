Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ED1A55521
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 19:35:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2400610EA6A;
	Thu,  6 Mar 2025 18:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=siemens.com header.i=alessandro.zini@siemens.com header.b="YNGZClJW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 602 seconds by postgrey-1.36 at gabe;
 Thu, 06 Mar 2025 09:21:45 UTC
Received: from mta-64-227.siemens.flowmailer.net
 (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BCD10E920
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 09:21:44 +0000 (UTC)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id
 202503060911371fb5f5d63be22173ab
 for <dri-devel@lists.freedesktop.org>;
 Thu, 06 Mar 2025 10:11:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=NMfsC4/yM01xpBetTGZUi8FhmxQx5NVH65WeTChQBQ0=;
 b=YNGZClJWueHEkQbRaHVtzgCso65t1U9Nej1WKRdKjXmrFNKF3PAA9YONyDkK0+C2y/mRI5
 506yKqvpbIUu7do3enUmJfVHjg+Wo38cyYGUwk/3J4IicPG6IKSeERW+c57uc8PT0YaW+cvu
 1zsMHtjkA6f1mCES4nutLF0Sxhm6ski0k3eYwFOL9nsoGJzJJ1ES/GbP1iQnp7HvWbWRJx9o
 dM2xiFSe7EfS/1RO7qOecfLj0vpSo1bGdi7lG7T1dIOMYwEHiua9Xnmen15tvrCDEzaPa1uK
 3bURbWppy9dwCXk+WuYz2OuDa95vVr5L62h19LrR3Z7D3ykchHJf1Oog==;
From: "A. Zini" <alessandro.zini@siemens.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: Andrej Picej <andrej.picej@norik.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Alessandro Zini <alessandro.zini@siemens.com>
Subject: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: add
 h/vsync-disable bindings
Date: Thu,  6 Mar 2025 10:11:32 +0100
Message-ID: <20250306091133.46888-2-alessandro.zini@siemens.com>
In-Reply-To: <20250306091133.46888-1-alessandro.zini@siemens.com>
References: <20250306091133.46888-1-alessandro.zini@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1327013:519-21489:flowmailer
X-Mailman-Approved-At: Thu, 06 Mar 2025 18:35:34 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alessandro Zini <alessandro.zini@siemens.com>

Add hsync- and vsync-disable bindings, used to disable the generation of
h/vsync signals.

Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>
---
 .../bindings/display/bridge/ti,sn65dsi83.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
index 9b5f3f3eab198..ff80876d504ad 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
@@ -94,6 +94,18 @@ properties:
       - port@0
       - port@2
 
+  hsync-disable:
+    type: boolean
+    description: |
+      Disable HSYNC generation on the LVDS output by setting the
+      width in pixel clocks of the hsync pulse width to 0.
+
+  vsync-disable:
+    type: boolean
+    description: |
+      Disable VSYNC generation on the LVDS output by setting the
+      length in lines of the vsync pulse width to 0.
+
 required:
   - compatible
   - reg
-- 
2.48.1

