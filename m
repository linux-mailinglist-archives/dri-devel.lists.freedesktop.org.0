Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D229B08E9C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 15:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F07B10E2E2;
	Thu, 17 Jul 2025 13:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bS5btI7J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EF110E2E2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 13:58:09 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-32f1df5b089so9661471fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 06:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752760688; x=1753365488; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mvLdJgfrCrg7KBtAJf/OmkIYvQvfWE8ejXVPhNns87s=;
 b=bS5btI7JHXGOgpNaIfR2Kh6gEbE+CYi2Ie6rcsjZtAlSA05q/nT+kBeT1CW6R7XUUH
 bwxwvt0NRyQnfnI6jY0giDdWW/+AHERRzwy1QRtiEePBV2MDT1lXvC/BcldcvKdu+rUI
 ASxdyL/8Sn/pDuDE+uAh74b/CV/OHjOWHlzkVhgY296bAhEfNXeMwgkg9188LFx7qH8M
 AP8dgiCa9TEaW+jdk/xjaEh6fG3OEMoMTDkap1cE2wnYhThRWbZAqXZln1PaWs4Hiu2N
 w08//9Bm1aEqVN2zVGio+8njyQW9e4ycs4i3iHdP+mfqKaivLY2WxZJf+KqCJfp7B3bn
 uKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752760688; x=1753365488;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mvLdJgfrCrg7KBtAJf/OmkIYvQvfWE8ejXVPhNns87s=;
 b=TsWL0o5mO/rlg26h2W+rees5VVxoRffVDFm3XgULynD2XJD7+np58xtOcCaZLwNn8J
 QAukVbO0qIYI+LMMu2rYCkmg4LYSAFEUnFKVs4tXBt4Z5X/ZC5MEmpwH6qZwV7g/ffQZ
 ye/5KpyZp6YwWx0/yLGMdyJ4/sUZKMgk6j1DPkQNJfzmdG5oUDAlEqgCBwuQf4tjIuO4
 17ZMe8qpMIxYqMhF1TvO580aQHcovrQdmmiSihvD5j99mxHoBtWuFcqczQaT3xueBD+U
 i47y0FGv8KlSkstKFiom8EKZtcqVZ0zIfGiORWmw8z/EFY0bRY6sWrCpXVVvzmAKTKdJ
 pytg==
X-Gm-Message-State: AOJu0YwbgWocFO2DZOsQ2U0OMrnfRnz7U/FAZ2Rw8zVNg+RLK86keMDE
 1e+6qkzgNHTtM2Pm+vxgvAAp5IbmiUbFF5nC4gERwWb+itXBSAqehmSp
X-Gm-Gg: ASbGncvFF6N+ne8lxM95A1mWY5I+wHeNXdkTKw0su+aKN3/LKopWBqxu1pVB4Jcgcxd
 n9gysK7auCA+HcK2vHW9kr6gmlGv1DlDpK8sNgDQOlBaUv5LUYmJeWSgSkBGxYqbieORzKw64Tp
 B7dqpAxUwDQryF+mWLuymsasIXxZfZ20T0cHFlN+Tv2bKs/gA57dCmEzGJxI2nr2WxVick7pW8X
 MDmAp1n9jckT6tUl1mOOT6UPs+ecJ1eVLaqZlFVHVekseuWuFuzkirGsR5qA2TWf8FVrMhO/Wg5
 Z9+nzJY1yXMpQis98o2GTtrh4pnPEknY4zZrvNGxjjXfgYh9THh/aULgchSCN2nCwpbR2ThkU1f
 jbJFkZqrtOW21+p4d+dHJNY+E
X-Google-Smtp-Source: AGHT+IGr09ky+5MckjMOGZ/G5pyFoGLBtwoGCcGyLgcGzkwgBSzXm4YHJTtl7KQTmKkHZ+P7Vc14Qg==
X-Received: by 2002:a05:651c:e12:b0:32b:755e:6cd4 with SMTP id
 38308e7fff4ca-3308e590ac5mr13654101fa.38.1752760687569; 
 Thu, 17 Jul 2025 06:58:07 -0700 (PDT)
Received: from xeon.. ([188.163.112.60]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32fa29134fcsm23794421fa.15.2025.07.17.06.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 06:58:07 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] drm: panel: add support for panel used in ASUS VivoTab
 RT TF600T
Date: Thu, 17 Jul 2025 16:57:50 +0300
Message-ID: <20250717135752.55958-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
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

Add support for Hydis HV101HD1 MIPI DSI panel used in ASUS VivoTab RT TF600T.

Svyatoslav Ryhel (2):
  dt-bindings: display: panel: Document Hydis HV101HD1 DSI panel
  drm: panel: Add support for Hydis HV101HD1 MIPI DSI panel

 .../display/panel/hydis,hv101hd1.yaml         |  60 ++++++
 drivers/gpu/drm/panel/Kconfig                 |  13 ++
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-hydis-hv101hd1.c  | 188 ++++++++++++++++++
 4 files changed, 262 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hydis,hv101hd1.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-hydis-hv101hd1.c

-- 
2.48.1

