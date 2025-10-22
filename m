Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D33BFC72E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 16:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B9210E7C0;
	Wed, 22 Oct 2025 14:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bEfPwJec";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27A410E7BD
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 14:21:42 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-4270a3464bcso3803035f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 07:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761142901; x=1761747701; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bgdj41tpB2VgIRDJrZCciZQ/xBBL1EcMgPyAyntTnpo=;
 b=bEfPwJecqC7C65LBiREKlMSpJHemV19VMQP9P4rHXwatk/R7ueC979GF1+jT8kpDOJ
 0PRVz7b9wv4gYLPxKo5SQC/cBMzA2Y1XH+aAI8GfcQrgj6sKBwTEpBWG+YXXZ1JJNtlm
 oxEFL4ofiJVDHu9TVFsHyRcZrKU30K59m83hifGCIUo2ahuHLsqtmdXd54PEZoleKpFm
 TrRE1t2jPP/62ydW5QYyXPJ7y5MP8c3jVnmLDWDfOHTWicbr8K2aR1kmhS8iHTvDlNA8
 wauuudNel3IPlkmIVDOPD7gf7vJO2hDn48KUrl1LX+VsjdqzNogCKlvTm0KoPevAK71+
 FayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761142901; x=1761747701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bgdj41tpB2VgIRDJrZCciZQ/xBBL1EcMgPyAyntTnpo=;
 b=vMmFBtRQnwbMyiazI2mCoCXdcDzm4vnP6LQ+SZO2T15vacjmLdXaYy+FAWV1kKvqoe
 btJz8SBqyy+4DOxKhZ+5i1aCVjxS5oCzvU4TOckVbijkvq1SZHV0REygxFMhI12O1Vi1
 zCpok+wLJ8PjlT7FYru4eqqkbxII6+W+zeKcA2D/wkO1X4Ewr21aVqZZ68q7fsXlEJOx
 ozHR4m10vwqHeR4O7uZbZ8onSbnrdXzpMPczlCtbscl11xkKOUI8KikCTT9xqN1de79J
 GJfWd4TH2bjUkgwQufapHiNQ47Mv8e81psr0kkXYgo3s1y5BVZ8Bo8DUQQFCPftET3Mt
 HL1Q==
X-Gm-Message-State: AOJu0YwAbjBM1C7TfCAkeVfAqKz4+OgdJ3qyjJdaFIPyrH+umYHM1fzM
 ewDJZY119912rHVa+EeJpTz/4dW9eyGBIRQ5yfcyZCHnDZpMW0lgwCnA
X-Gm-Gg: ASbGncuhRAQF27z5pLPC7OAHuM322/6lPCrUTe0PE2JTTejV1LXHGoduWvKxbC+m3yV
 2wsG+Y4uibI4w1VWY28Gpnd31N3In4csRhjtNNcQAllXayPGOZrbtLlQkfuozEhyDMOFYE1h9rP
 lss7KaeupUx3VpNdzbKHG1gY79IbPLgLsfQ9bNnkeqQoFwiQSt8QjeCUSOroSpwLq4qYVrT4RRf
 6Wfg+7Tehtz9qJBnbvhTnJ/8m34N8vd5riu/nhnLR9LGWuN278kpuxYdS68MxStSkr45GdI+VL0
 3B36rTaTviOqoGot59I6TUIbdK6McuTWuDQFXywcUMT4q+dFz228nEaVaytF5QtkCVpVrAiCzYq
 McA8HcelXLWIoK63HkxEeKoRO45ODh+KJ+cshlzTVDpmkwcST2MktpWU6xuk2t9r97dhg4ykk+5
 qFsg==
X-Google-Smtp-Source: AGHT+IHM03V7eJFt3Eu6ja1MYetjG461AcLXE4YT5HRjXzs799spnfwnfQrFSdx7t2nEB8DurbecfQ==
X-Received: by 2002:a05:6000:24c6:b0:427:928:787f with SMTP id
 ffacd0b85a97d-427092879c8mr10794030f8f.21.1761142901362; 
 Wed, 22 Oct 2025 07:21:41 -0700 (PDT)
Received: from xeon.. ([188.163.112.61]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 07:21:40 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v5 10/23] dt-bindings: display: tegra: document Tegra132 MIPI
 calibration device
Date: Wed, 22 Oct 2025 17:20:38 +0300
Message-ID: <20251022142051.70400-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
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

Document MIPI calibration device found in Tegra132. This compatible
already exists in the Linux kernel, I have just documented it to satisfy
warnings.

Each Tegra SoC generation has unique set of registers which should be
configured. They all differ, hence fallback is not suitable here.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
index 193ddb105283..9a500f52f01d 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - nvidia,tegra114-mipi
       - nvidia,tegra124-mipi
+      - nvidia,tegra132-mipi
       - nvidia,tegra210-mipi
       - nvidia,tegra186-mipi
 
-- 
2.48.1

