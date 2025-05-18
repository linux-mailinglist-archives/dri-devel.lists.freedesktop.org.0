Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D366ABB25A
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 01:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8B710E308;
	Sun, 18 May 2025 23:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="O9jFl4B4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1AFF10E2EA
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 23:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1747609518; bh=VnllxYvJ8y+xBCgppgUdhper3bPIjDGyHOTBW41WvLw=;
 b=O9jFl4B4ZHa4TuUNJ3/wHKSQFwYzT9PlzOuiB9XDBWyUdXoUwmlKBeCCUr09e0P3dn6zhbATn
 h3tvG3CEcxSnQZcpOIKkkY3pq9uf7PqwVgULd7Jq5/VhKFSCxIeAJqlHwy+vj/t0m6QdXnoXcB4
 49TUYWt2ji5SpYCl6yeDaQ9Jh1o6fujXuz02+0HvpCdbZP7EQ0UtjKENdaB95aFgk4aq83smOVN
 IahXl2iE7wz0aeFRdBLIhW5bM87MZQXO4JKI33jziXk194m8H3ifFyY6ZtX4Tpsm0MrYxMZG+AQ
 YS8rm/QQHVncatTj/LNjEoR04ZTpTP6SQdcO4hW4ubQQ==
X-Forward-Email-ID: 682a652edb63046e3392f2ae
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: gpu: mali-utgard: Add Rockchip RK3528
 compatible
Date: Sun, 18 May 2025 22:54:11 +0000
Message-ID: <20250518225418.682182-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518225418.682182-1-jonas@kwiboo.se>
References: <20250518225418.682182-1-jonas@kwiboo.se>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rockchip RK3528 SoC has a Mali-450 MP2. Add a compatible for it.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
index 9318817ea135..c8d0d9192d92 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
@@ -47,6 +47,7 @@ properties:
               - hisilicon,hi6220-mali
               - mediatek,mt7623-mali
               - rockchip,rk3328-mali
+              - rockchip,rk3528-mali
           - const: arm,mali-450
 
       # "arm,mali-300"
@@ -148,6 +149,7 @@ allOf:
               - rockchip,rk3188-mali
               - rockchip,rk3228-mali
               - rockchip,rk3328-mali
+              - rockchip,rk3528-mali
     then:
       required:
         - resets
-- 
2.49.0

