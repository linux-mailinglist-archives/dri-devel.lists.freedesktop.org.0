Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EDF4ECCFA
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 21:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FF610EEF3;
	Wed, 30 Mar 2022 19:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C9310EE87
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 19:09:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 043FE61488;
 Wed, 30 Mar 2022 19:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21167C34114;
 Wed, 30 Mar 2022 19:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648667345;
 bh=IMGRYL4762RuYiDXn6s/1D+8F+g1tetqqyWpwo+gfbk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O9twGcLsm9cZmNGNFmP/AU/sES2pORGckjk0YHsHiSkLME17uayzqMKrWDdg6OmvP
 xCQ6C91sh+i7/W5hp8PwCSAW3yttC3mPYEQI+Il0ho+SXTnLEeY26jPF7ICctp8Pkv
 LRP0Y9B/ixzv4yYPtwA8pfStwRS2nmVe2x8tKCH9KuVHt7HX4zMMsnFbHkHA0qjeMb
 V5Wu0URZfqtTWEBPFKQtanAf3tUl1EFTt9AzTYJrBg5q8t3OrYSUKYCEANYeYo0qk1
 NHhSUiLVcfdfrRjaSIzQnP44ikUoJD1wRWWjAdPIefSOvZ6PfTSr6SHLdF5mdhAwxv
 bZfxApeaRBcfw==
Received: by wens.tw (Postfix, from userid 1000)
 id 187C95F899; Thu, 31 Mar 2022 03:09:02 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: Add prefix for SINO WEALTH
 Eletronics Ltd.
Date: Thu, 31 Mar 2022 03:08:43 +0800
Message-Id: <20220330190846.13997-2-wens@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330190846.13997-1-wens@kernel.org>
References: <20220330190846.13997-1-wens@kernel.org>
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
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chen-Yu Tsai <wens@csie.org>

Add a vendor prefix entry for SINO WEALTH Eletronics Ltd.
(http://www.sinowealth.com).

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 01430973ecec..bb4ae59a3c89 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1128,6 +1128,8 @@ patternProperties:
     description: Cypress Semiconductor Corporation (Simtek Corporation)
   "^sinlinx,.*":
     description: Sinlinx Electronics Technology Co., LTD
+  "^sinowealth,.*":
+    description: SINO WEALTH Electronic Ltd.
   "^sinovoip,.*":
     description: SinoVoip Co., Ltd
   "^sipeed,.*":
-- 
2.34.1

