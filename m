Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 221DEA4BFC5
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 13:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A995810E24A;
	Mon,  3 Mar 2025 12:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VE+3sEyp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CCD10E24A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 12:05:15 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5495c1e1b63so1945254e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 04:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741003513; x=1741608313; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q34w3RqR0dtKEGKyYXofcB2jlNCM2LrnhrF1NCKpgfo=;
 b=VE+3sEypTPhNNSuImHCD8a1ttLx5O77uxAhWEdAx4yDZ4ehAQMiNusz/bLemYpe/J4
 wHqrVUVDaNg1LXV1EqsQibagW0ys4N8/W/GxAqXbvfz6TCB0yxeoKbM/fj5wI7Tu0qix
 MqCSEvViTTDqlRn3AZ9uron4N5sxOdblWRKeIeHt0emSMkPYCq3t2LsF2ln3l99IUHBK
 JCMMnlf8NQ3+T1DEnyZ9xhP/ClbZ0d5cIvSRpzNxGxxftLlreBFg7Y30pvk4g17lk2Hr
 v2AxJuzdaFm+EoNOFdecVDbmuadryisDoA/0VqxPV5wUSL9/Pou6NK40quDGhBPBAnTr
 /DSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741003513; x=1741608313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q34w3RqR0dtKEGKyYXofcB2jlNCM2LrnhrF1NCKpgfo=;
 b=ue/JraHVYi9abztw0hxa1KYAIR0uwkRzF6MGesuO0eL8fHqxuqljt+bxTAunEoCfao
 xuv2duHSdMu2LCMQsOGyxtQPZ0s4W12Z5ZRX4Rr+1wlq0amY/rL8dV0Drq1uXu6RFl5a
 EwCMF90xmpxonJaRZL59ND9Hq1A8Sw5qkN/mtDVqjEdJtLDVM0EhsGR+/5vfnee0tUKn
 5IAXc1zWj1MH4Dn4jELpxAslCXY7D843yMTIzEzr3rrJX44ViWXkJe4IwvSLpUH551GH
 QteKu4pkIOkT+2yQODQ4i+vz/ajGdXzdiPVXc8v2/l+ttwNOKM3YyrBNozG6LxZ/gYyF
 InsA==
X-Gm-Message-State: AOJu0YyJ7S5hcFbVuLLTH1WZNFAwF5mBdu51XDNGpbPemtv7sfyDwriH
 4D2d4sGSY/jz6AgSfpm5fLDOplGkaqkszBEWZ0EtLSqHFko5qGPLG6Zq+g==
X-Gm-Gg: ASbGncs9XFDgtx+R9nKJArKS8SeeJliLNsSdb9jWLfiORb5LnyoclWD2HiDu2lgjQ/C
 If51DmqbXbWxQgWNxrk3xKbA7dFbbZ/rppS1bDbsE3jb2YLEQuPtcTRNOB4jsMBWm+X0DYW4uNv
 9+aPBOdmEv+5fhG2VvEmK3hIMM800gZT8tajt2H8w8eoQv6R6B9aVThhxTOQ2Y0TMK+ra76qaYG
 CU8sMnbeRJzqIaHoQJeztkBVdWDwlK7oz6E/ckeqwhmNldB2BQqIM+Kt42K5Ve2sXQpahWbsj1w
 m4K6iLh3XuZK61eMAnyktB8znCdrbWAS/epB
X-Google-Smtp-Source: AGHT+IEhfdZku8NOEKgVtX1J/L1drONSMhC8CpobtnAojuGdq2AZu/OuExshcU+3+lZ+0K5xE2WVow==
X-Received: by 2002:a05:6512:1292:b0:545:c5f:8551 with SMTP id
 2adb3069b0e04-5494c3517b6mr5624203e87.35.1741003512681; 
 Mon, 03 Mar 2025 04:05:12 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549576b88d9sm869095e87.12.2025.03.03.04.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 04:05:12 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: display: extend the simple bridge with
 MStar TSUMU88ADT3-LF-1
Date: Mon,  3 Mar 2025 14:04:54 +0200
Message-ID: <20250303120455.90156-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303120455.90156-1-clamor95@gmail.com>
References: <20250303120455.90156-1-clamor95@gmail.com>
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

A simple bridge used in ASUS Transformer AiO P1801-T.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Robert Foss <rfoss@kernel.org>
---
 .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 43cf4df9811a..441e5e5b27c8 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -28,6 +28,7 @@ properties:
       - enum:
           - adi,adv7123
           - dumb-vga-dac
+          - mstar,tsumu88adt3-lf-1
           - ti,opa362
           - ti,ths8134
           - ti,ths8135
-- 
2.43.0

