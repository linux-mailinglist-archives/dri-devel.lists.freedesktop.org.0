Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAAB79C806
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 09:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A744A10E370;
	Tue, 12 Sep 2023 07:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-229.mta1.migadu.com (out-229.mta1.migadu.com
 [95.215.58.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405F110E1A4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:09:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1694423000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gjbKgFOz59nnUk71iTtHr1/2T5zg9+ijv4cv5B921ro=;
 b=OdFPW17OCefsBXB8LZh2xRN8zTCx0ZFoCi6B82sw4yoRkj3g8z4TAqtEVYtyrcRXZDGlg1
 WdOgloklI96tfYjBmSYofmu1yOBSy8sMgYNCx0UnLKPyH3zRUltfPYkltjaTF+5ZKkcP09
 3VRSQ9c2EV+3T4rpNpKMSrrN27r47dNMckFdYloyzJve+sisunJwMClNbsmbxzgZyKEhv3
 5jaUcs3LMrHTQBmLXFNBwKYpO54Xw0iDkAcjAza9gCtY07Y9JCCpWQzpHQxE9JadMKAkE2
 5AN4LlCTwOoM2zboHKhbiiB00cxipZO29G9a6hGC6DV3neZieRH+woY7JKTnZw==
From: John Watts <contact@jookia.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 7/8] dt-bindings: vendor-prefixes: Add fascontek
Date: Mon, 11 Sep 2023 19:02:05 +1000
Message-ID: <20230911090206.3121440-8-contact@jookia.org>
In-Reply-To: <20230911090206.3121440-1-contact@jookia.org>
References: <20230911090206.3121440-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 12 Sep 2023 07:19:12 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Chris Morgan <macromorgan@hotmail.com>,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@edgeble.ai>,
 John Watts <contact@jookia.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fascontek manufactures LCD panels such as the FS035VG158.

Signed-off-by: John Watts <contact@jookia.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 573578db9509..69befb76b6ce 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -468,6 +468,8 @@ patternProperties:
     description: Fairphone B.V.
   "^faraday,.*":
     description: Faraday Technology Corporation
+  "^fascontek,.*":
+    description: Fascontek
   "^fastrax,.*":
     description: Fastrax Oy
   "^fcs,.*":
-- 
2.42.0

