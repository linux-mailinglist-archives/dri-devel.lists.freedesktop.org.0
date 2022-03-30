Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BB04ECD5A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 21:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C10810E3B1;
	Wed, 30 Mar 2022 19:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF3610E3B1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 19:39:50 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 d15-20020a9d72cf000000b005cda54187c3so15635177otk.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 12:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dhY+u1GEl9dYRgtf3ZQaaSoFS6mPwemcEp+iTO6bO+E=;
 b=LVbYGGbcpT9g4kflVT+Jtzk1ItP+6DUXoVqo3xJBWBctISk1UMkrTmB/6+/eF+UYlT
 hAzoyrlStyB3M9ZUQAPCr7rb7hbtSBuQubAeLZkS7U0TL0f+yLZ5Fk8Vl7wVbFE3pyJ7
 qt9//KR8BXfIHng+VE5R0lJUUdIQYPMLta10aOUzl/AD8NxQWpoLbw0jhjRpB97/b6HK
 kjiaI2nu9Yqe0nnKh7DxMmNOz6snyPykegq4LFoJ0ReEw+i9CjFagQLK84N82Z9EXYwB
 /1SaMdFH9ss3GR36FZRWG+ogr9cwWddLuSwlkKLAA6/43MXy8abbVJwI1sa5EBalUQKr
 EQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dhY+u1GEl9dYRgtf3ZQaaSoFS6mPwemcEp+iTO6bO+E=;
 b=nMq2fZgpjKVTPGXilOoh/wiKUznsIMduID2N7QSgn274DfPybRjRisk9nYucHCzSpe
 qL5eueBJjAnksxgD7g8vlE+Xby/U0Smq34pFtVpNNko0TVbQFWP9237GN2A23yMSfzNm
 sDuG7IGxiJlH9ceZPb1a5mWQ37vCS3khANF5HaFlA3hXrlC4yNp37mmHvTnKXj6ejtSK
 jaStoG38+JTovFF55gwApfEhajMHYIychZHtT4jPwjtYxJQJNtGAeFiPhXgrRtS5mz1T
 xB/nnD3WfIou9BKuCsssn06nk87XDVNN9GkNHezbpDXL50avbhg1W93W5MSJlEZ+18Vs
 ++Dw==
X-Gm-Message-State: AOAM530NzBmsGs8AzImbfmelzAYBwW2nO8UfAT76oQmVuSJt3zuzVNPR
 mnxWQDOG/D1IcZo6r4QA5q8cko9aAz0=
X-Google-Smtp-Source: ABdhPJzf/LqSnN0zWPpS8TZWBxdxlRMkbwCCDIqzY9n1vvaYkWGn653b2JPXd/mJ+NazVT0jGS7x4A==
X-Received: by 2002:a9d:6e01:0:b0:5cd:8f04:472e with SMTP id
 e1-20020a9d6e01000000b005cd8f04472emr4074125otr.324.1648669189541; 
 Wed, 30 Mar 2022 12:39:49 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 bb35-20020a056820162300b00324b9a8121bsm11242223oob.27.2022.03.30.12.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 12:39:49 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] dt-bindings: Add byteswap order to chrontel ch7033
Date: Wed, 30 Mar 2022 14:39:40 -0500
Message-Id: <20220330193941.3720-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330193941.3720-1-macroalpha82@gmail.com>
References: <20220330193941.3720-1-macroalpha82@gmail.com>
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
Cc: jernej.skrabec@gmail.com, narmstrong@baylibre.com, airlied@linux.ie,
 jonas@kwiboo.se, Chris Morgan <macromorgan@hotmail.com>,
 robert.foss@linaro.org, lkundrak@v3.sk, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Update dt-binding documentation to add support for setting byteswap of
chrontel ch7033.

New property name of chrontel,byteswap added to set the byteswap order.
This property is optional.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../bindings/display/bridge/chrontel,ch7033.yaml          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
index bb6289c7d375..ecd3062c5215 100644
--- a/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
@@ -14,6 +14,14 @@ properties:
   compatible:
     const: chrontel,ch7033
 
+  chrontel,byteswap:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [0, 1, 2, 3, 4, 5]
+    description: |
+      Set the byteswap value of the bridge. Values 0-5 correspond to
+      BYTE_SWAP_RGB, BYTE_SWAP_RBG, BYTE_SWAP_GRB, BYTE_SWAP_GBR,
+      BYTE_SWAP_BRG, and BYTE_SWAP_BGR respectively.
+
   reg:
     maxItems: 1
     description: I2C address of the device
-- 
2.25.1

