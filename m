Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6E7B32EC7
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 11:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43CD10E201;
	Sun, 24 Aug 2025 09:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ShOmo7lO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E03710E200
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 09:27:40 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-61c4f73cf20so946653a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 02:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756027659; x=1756632459; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q34w3RqR0dtKEGKyYXofcB2jlNCM2LrnhrF1NCKpgfo=;
 b=ShOmo7lOK9YOL0xNQVFgRnPPC510J/epis61IAyf+0zgQp3vqhcozdjLyRwiL91K/b
 w6dn2o2CDC9mPiQMrmFGc7hrH7T5Hg/ax2mTHAE8k1PaFsrqQx2eezIkgDXACvwLOExg
 OrJm2BuNM4UWc9wClOXuIvdkUMASiqMzfEQFxLM1qO+MauqcQLF1ctqXR7SFs1PNa4k8
 C1dpp++QAbU0OSfcEPxuFvGO+5frr4/s3kKZbABAHL653Wi0jtr2vDsQ48Ga1cHlNtyX
 rCqPtRHs+DEr210cHv+oOJcQQBV1WmoTggqkiHweYwCBExOEy5NTAfhoGB+p7kW+9Qma
 ZzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756027659; x=1756632459;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q34w3RqR0dtKEGKyYXofcB2jlNCM2LrnhrF1NCKpgfo=;
 b=ssjwgKE48fWTJF4r0g36CZX2ZP3T4zFYVeqbKBElEp4evlGNGGeu8iw5/0bsrTz4WN
 LbjWvy3m+5XAKScJWMFJUOqHX6AJI/43vIofCV1uxyZStbbs2kMBWyZuof7/UjudCBdo
 onP3Qqnu/u2cr61fQgpA0jYlGZLGx+zJ69RETAzzZhFCvmYNKT5Unrf3rteV9fHubcGo
 apfcChQA9+1OzWuWTkFSrKsmh4a1tQdfnvPjZs2Mgs2KhPptFY60TSdhye+7UeJMzvXA
 s1sXx8JVA/za3mJxJqob6qGidpLGfYFUH02Pw4CwXZE3jHqQc/C5vWMPHr7DPSLkjrAC
 eglQ==
X-Gm-Message-State: AOJu0YysJLdLYQqJ56x5vtcQPlitI4X1P5Z+rQQxz8ovve4WeqvMETbb
 GPq4kyFE72AccOfpPOSxRB7ikI9SObIrLf408d0rEtp3oPkKQtKNzBR2
X-Gm-Gg: ASbGncvHICrINjhfXwK5aSc0DUgyhsKTbd0HHpSCO6AAg5Ot1BDo5aLhTuidaW8sint
 Os4umab1pWuHcx4Ygeuc8dGqxT9pv2CutozhefXTjxCMlKeF4kbcfCcIPohJe118K9x/6vGxqKm
 nPJW0OZkucP2N9/B6Eq/tV+GyucQEoojgjUGB2k4/gVIrpwuWzO0ZBCykqVQ+VmkdoBz1TVSfHT
 ggRWeH2e2OmM1xmVqakdykWCrq6NXPg+vMAQP/WXHE95V20LMB6jm4TrGqkXZD2arQcjRR5qsDV
 Ic8/VJMemODCnPGtLrqnpd+kwCn6JNQFpjXaoJQfaa8gFQFJ9Z/T1TSp6YsOiF6QQbxEgPhcypD
 RfHmAlFZaWHjXVg==
X-Google-Smtp-Source: AGHT+IEtU39wyFdDkeRjcyNyLkECG54sATB6vqhBS2RcZn463KIIzRxKiLbn+3GO5grAttRSfyZoLw==
X-Received: by 2002:a05:6402:13d5:b0:617:b2aa:576a with SMTP id
 4fb4d7f45d1cf-61c1b3b66ecmr7576651a12.3.1756027658807; 
 Sun, 24 Aug 2025 02:27:38 -0700 (PDT)
Received: from xeon.. ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c316f503dsm3035391a12.31.2025.08.24.02.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 02:27:38 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3 RESEND] dt-bindings: display: extend the simple bridge
 with MStar TSUMU88ADT3-LF-1
Date: Sun, 24 Aug 2025 12:27:27 +0300
Message-ID: <20250824092728.105643-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250824092728.105643-1-clamor95@gmail.com>
References: <20250824092728.105643-1-clamor95@gmail.com>
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

