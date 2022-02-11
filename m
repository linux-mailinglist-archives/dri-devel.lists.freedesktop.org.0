Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1E94B2E65
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 21:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7E510EB82;
	Fri, 11 Feb 2022 20:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD1310EB82
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 20:27:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 43ACC1F46D9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644611260;
 bh=IwJ14LoYZzda+/Av+WGvVFb98hP/XjwCxic3ZWFVHXM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=awomBp1Gon1K02Digb0TkalfIEdRoNWHhUy1MRS/taKCG7Fc7XiLfQEcaBkkJrEOf
 v9Y6DrtelFsM31hIssZdFS3+9FIRyOe1Of30MNEoyuG9FKTyuLspov5gBi1N45SEsb
 VkezQiDFHoIOosRWOz/eD9ZlSHTx+EMwuaBOpNs/ejCC5DaDzKNtfo0FHYLauRyscS
 yGIWVHYJBmpj6Ttagb/d6ATvytlh6PJFM4nD9unjNtvnvtPF0TOyal6oI5IFITNDVr
 jb2BZ3JtrcLSioMQnACmSO8EBkPe/fGZzaa61Gnz3sTjFhjEpw7HZ+E98IQnUPsSKJ
 PZk8QMyYxypUA==
From: alyssa.rosenzweig@collabora.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/9] dt-bindings: Add arm,mali-valhall compatible
Date: Fri, 11 Feb 2022 15:27:20 -0500
Message-Id: <20220211202728.6146-2-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
References: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
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
Cc: tomeu.vizoso@collabora.com, devicetree@vger.kernel.org, airlied@linux.ie,
 steven.price@arm.com, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

From the kernel's perspective, pre-CSF Valhall is more or less
compatible with Bifrost, although they differ to userspace. Add a
compatible for Valhall to the existing Bifrost bindings documentation.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 63a08f3f321d..48aeabd2ed68 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -23,6 +23,7 @@ properties:
           - rockchip,px30-mali
           - rockchip,rk3568-mali
       - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
+      - const: arm,mali-valhall # Mali Valhall GPU model/revision is fully discoverable
 
   reg:
     maxItems: 1
-- 
2.34.1

