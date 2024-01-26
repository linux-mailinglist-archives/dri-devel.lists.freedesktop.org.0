Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898DF83D46F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 08:36:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C548A10E171;
	Fri, 26 Jan 2024 07:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0225110E171
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 07:36:19 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6ddd1fc67d2so30051b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 23:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1706254519; x=1706859319;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LLBtLu4wKX94/+P/QqcYo4A1h3dyVmhkosY/sUXTdjA=;
 b=MVo1tIBw96O5zWeeT7BmuBRMLzWaQWGKxPr8v5HAFxEPtgs2aL6EWMNgZwl8VWfDOr
 /eoVvvVjT4gLcgxLopaUHQrxFmnjRyXFHC3NhxS1brCiir0LXZkVo4a16ACnm+qot/2T
 Crve1aWfy4fUmjdj4vH/bAKWaStVayCrjeIU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706254519; x=1706859319;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LLBtLu4wKX94/+P/QqcYo4A1h3dyVmhkosY/sUXTdjA=;
 b=UpiMuLbvGbG1SrM9P1g0ypjBRVjXxh3bsrDBkNbpECbI0nebK42k1w0jjOakhwOad3
 Oe1IxEgzFPrMB+97/WJ7hwHzKNmHzA7VCD/GlUMoa4VBxcOXz2WeEyokbm+voXOzM44h
 59y2oez5zgdV8QFIIkFVGf9Oj1+dNWIY2fWU85mppwTsWcL+rQlrB5vw1dvAzU8s615R
 iiP2f2rUgpHrKTSDgBFNuja/NWwt91CIf/2+BBwPtkj0RFcVUeXvWROwDg1OL+H0a+6J
 RHGZUGwZbCqyzbNiwf4uUxMNFd2QHFYChOcnCCOTjehdqa1u4e5JIQOVKkXG71hjH72a
 6fIw==
X-Gm-Message-State: AOJu0YzO3ixTEy8rvabqAt/9G5Zu2hzjG7f3adt/buBxSzRnEF3MbA1K
 SLKY1/nLvnNnI3WnzRRk8/PzJ60XZryf9TdTwzMOqABNRP/xznzu1PWr8q+4bw==
X-Google-Smtp-Source: AGHT+IHCfZg7myP94HWqLShb7FnZKGeEWhG1lB4m6nfTYh97Z4qNJy4ySGIQ0mSBgidZ/Z3eT7G7RA==
X-Received: by 2002:a05:6a20:7b19:b0:199:f708:207a with SMTP id
 s25-20020a056a207b1900b00199f708207amr591065pzh.116.1706254519486; 
 Thu, 25 Jan 2024 23:35:19 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:2614:bbbd:8db2:1f54])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a170902eb0500b001d58ed4c591sm516983plb.105.2024.01.25.23.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 23:35:19 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Allen Chen <allen.chen@ite.com.tw>
Subject: [PATCH] dt-bindings: display: bridge: it6505: Add #sound-dai-cells
Date: Fri, 26 Jan 2024 15:35:10 +0800
Message-ID: <20240126073511.2708574-1-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Chen-Yu Tsai <wenst@chromium.org>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ITE IT6505 display bridge can take one I2S input and transmit it
over the DisplayPort link.

Add #sound-dai-cells (= 0) to the binding for it.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
The driver side changes [1] are still being worked on, but given the
hardware is very simple, it would be nice if we could land the binding
first and be able to introduct device trees that have this.

[1] https://lore.kernel.org/linux-arm-kernel/20230730180803.22570-4-jiaxin.yu@mediatek.com/

 .../devicetree/bindings/display/bridge/ite,it6505.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
index 348b02f26041..7ec4decc9c21 100644
--- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
@@ -52,6 +52,9 @@ properties:
     maxItems: 1
     description: extcon specifier for the Power Delivery
 
+  "#sound-dai-cells":
+    const: 0
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.43.0.429.g432eaa2c6b-goog

