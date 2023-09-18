Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED007A5A60
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 09:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C876810E379;
	Tue, 19 Sep 2023 07:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-221.mta1.migadu.com (out-221.mta1.migadu.com
 [95.215.58.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E96210E276
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 13:00:14 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1695042012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SeWaoEJqAF8ZYVajGx7WfucGGz9hM5xHxg939rbNK9c=;
 b=PHK4m9K32Yp3nyzxO6Cg6RphTVBzWi6rWgpf5Wecs5F6H/ZqdcLf9/gPoeLTh1qRs1P+OJ
 aVMcdEaW87kqG8Zu0wfvYHQcc5N5g032dKjrJwzaTHAOOsl7j0+fRCdQIVDZc3MJbLNXC5
 v6jMObQ/y1gX59jq/o2SWqFx2bXNOB5HesHY7ExF8zDjR9Wi38+G8X+KwMk2rqF3+n6DNG
 io2+oTHbXXP7QUCGaVoaePl186/xZkDdN/+wIOjeqjJWQUaDG8ogACg2gK+CfekkI9O5Sf
 MeJ5AHsmvEqzKUGULqME2NDLtEqut1UlvTIys7rnKnwC1XrPLbf0kZUeA2rzAg==
From: John Watts <contact@jookia.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v2 7/9] dt-bindings: display: panel: Clean up leadtek,
 ltk035c5444t properties
Date: Mon, 18 Sep 2023 22:58:51 +1000
Message-ID: <20230918125853.2249187-8-contact@jookia.org>
In-Reply-To: <20230918125853.2249187-1-contact@jookia.org>
References: <20230918125853.2249187-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 19 Sep 2023 06:59:32 +0000
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
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Chris Morgan <macromorgan@hotmail.com>, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 John Watts <contact@jookia.org>, Rob Herring <robh+dt@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove common properties listed in common yaml files.
Add required properties needed to describe the panel.

Signed-off-by: John Watts <contact@jookia.org>
---
 .../bindings/display/panel/leadtek,ltk035c5444t.yaml      | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
index ebdca5f5a001..7a55961e1a3d 100644
--- a/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
+++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
@@ -18,16 +18,12 @@ properties:
   compatible:
     const: leadtek,ltk035c5444t
 
-  backlight: true
-  port: true
-  power-supply: true
-  reg: true
-  reset-gpios: true
-
   spi-3wire: true
 
 required:
   - compatible
+  - reg
+  - port
   - power-supply
   - reset-gpios
 
-- 
2.42.0

