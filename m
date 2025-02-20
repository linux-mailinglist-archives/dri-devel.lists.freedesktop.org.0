Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D605A3D50F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 10:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DA410E4B4;
	Thu, 20 Feb 2025 09:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CUsJk253";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E5C10E4B1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 09:45:23 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30a2dfcfd83so7600521fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 01:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740044722; x=1740649522; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uP54MxAad7BaXbPMxMjCizUh7J0Y3WSL+99INsIzw/Y=;
 b=CUsJk253SHJxzNqgT7HUaBW3yta7eu//+1BvQ+ZIpAegxMBvnFHChKy0OmM+WDdQjh
 9KAzdJ6K6APu6xKRx8zTGUgEJXYLBJ3avjRZRkiZRSJc9ANwswiv/UtwmOfn0dks24Cq
 biAckfqoYZJMmazQ9M4a7YEhN3RAqT5Uo6H/adKzgjtHM3Jw40fBWNiwA9cZ1iZ4q8fb
 LWs9yGSiqIFVozTLH20bdJr+eYNs4tAxAM1dfBcKe9IahthVDQrvcwa81oM1YPTtM0Yp
 iliLZLDsbPJCc1yEuyV4VAHJgkmJGX7klJkgvDM7EgILVkzzMeyCAFVHXZQpIdKX6uik
 gcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740044722; x=1740649522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uP54MxAad7BaXbPMxMjCizUh7J0Y3WSL+99INsIzw/Y=;
 b=lwWwBYwUuofbyYEsYQf9u7w9UIwIrg6tg0MBL1pHa6Tv5arxmd7xiaNJ3u+DHl/EAe
 Kne0gidNtVudZwW+mbNryU0uM6ahrcsm9j+rojQrdu1/Q6kPF6Jfgqy2Cs5XFmEBUvCC
 RDseyiffQV/7BKc4S7w+IMA8Sm60t3SIURXxqylmjDE/O+NJqSPt7gJkjarwaxBTh615
 LpSF3jqTHTbi9D2fRD3jfM9cJEaAfitG7LfATApNY7gWqc2bREWCUlnyK/DnUlMhL5/M
 UrJQL66B6idrcIa+2jArsQ6S+g2uZcz1Nl6OORSIQxcKRZcRBAWrVfbdHaTLimkdZ+sF
 gmIg==
X-Gm-Message-State: AOJu0YwY01qnnQyvjlUuRnM1nEho3v/DhdDhSKDQmcgu7FJQ3b5t8Lar
 0L9b2247MIzAAzlZMv3cBXgBuiDhwoRJUqEDIJ5K+GMDr8gr9knK
X-Gm-Gg: ASbGnctfW7K5LjUYvZ67rOy2Zos2pl+rQ5eFeafQBB5qd3woWF3BiiZT2b2BwfHACZn
 7JyUubK57AemaFXDv7AyvJp6oe5q16ONRrUBwfT7Rpcrt/KT5PJmGK983oBDwN3uRVGVkwg4m0D
 9u8X0nQXVkSPQmUhSd1R7pT+6idsMvfykfQUfKUqNXoBp5xifcZ+wM0gFoMX2jObX16GCbaetaB
 kPoxNoHFrUlPnk8QKubPo8xuCKvjiN4raoUSNxnJHEwjqmsWnzFZ44J30uLO/lW3g/lXZkN3s/Z
 pHXCCU4=
X-Google-Smtp-Source: AGHT+IGynhUbFTfyxxBWfbXmMmCDaqF1917tHAA6gMYameAn0opOanGEOqnUwdwMb4P3bXUnPGGPqg==
X-Received: by 2002:a2e:90ca:0:b0:309:2627:8adc with SMTP id
 38308e7fff4ca-30a51fee6fbmr4684441fa.8.1740044721730; 
 Thu, 20 Feb 2025 01:45:21 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a3a0d1c2bsm9574311fa.11.2025.02.20.01.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 01:45:21 -0800 (PST)
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
Subject: [PATCH v1 2/3] dt-bindigs: display: extend the simple bridge with
 MStar TSUMU88ADT3-LF-1
Date: Thu, 20 Feb 2025 11:44:55 +0200
Message-ID: <20250220094456.32818-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250220094456.32818-1-clamor95@gmail.com>
References: <20250220094456.32818-1-clamor95@gmail.com>
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
---
 .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 43cf4df9811a..8308e833938d 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -31,6 +31,7 @@ properties:
           - ti,opa362
           - ti,ths8134
           - ti,ths8135
+          - mstar,tsumu88adt3-lf-1
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-- 
2.43.0

