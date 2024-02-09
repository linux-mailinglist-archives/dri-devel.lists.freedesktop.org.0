Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A05C884EE42
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 01:17:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F5A10EA9A;
	Fri,  9 Feb 2024 00:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kifYy9TH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32F210EA8D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 00:17:33 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-68ca3ab3358so2301946d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Feb 2024 16:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707437853; x=1708042653; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2+MsuxuH9sRLhHUmM6mao4rxTSjWbefmEBS5HyjKTp4=;
 b=kifYy9THR2Y5U9u624SK0pitFjQKuhhLN+bskh9Li1ToMV0f6wIbDD/atc6TvWpSXy
 FgDUPpOw4zY4/fQtfxuAvK8VBA+gKYSc8ZNxjQvN6kTBIFknayhvT017sPWvUqGxkbaq
 bBC3/B/uEjdKUmw8G4g9+tpKVPwBQ8txsDjqR5b940Quc1GfdI/LEds5PuzGdL7uSjU9
 6B6DjhKHIAR1OXw+n49BhgCHCqj9NCMEpcMmF/ZEReDuF5xZerFtht0Q1BqyqgwfCinL
 oegpbL6N3lIByLwEVMKFdJOMRA6p9pLZA08WTfqCpSsQIVvFGAu2nViV7Ba2ndD8o+Mr
 n8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707437853; x=1708042653;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2+MsuxuH9sRLhHUmM6mao4rxTSjWbefmEBS5HyjKTp4=;
 b=EgkOWE5DZmRu/GnRU2l2uSUtw052QpOuq22vdye3Ycw7g6BM1Qiq4WtgVw+of5XDjB
 vnK9kIyg3637vRm8qm1K/m6SM99lk4IbjsrK/skEmDMPiEGoTwo/DJzQR7tCTJZHZEMr
 NP1vJaPmPKYv8+Yi7wSBFvgfaMMddtd5LmqCkxz1hjsXXyimOK/bAfmJkQqx0w+RtAmQ
 /5yhPPdPTaIagrLGk2+7MpuemCByokp1zUnxpyO8YgTlTZFUUpZOzU0KSIAqS+zr9LMv
 L4mAulVqMmGx+x5o5a0kAqitERSpwnUbT84XA9cAJp9jnjHLJO4xobD/tSLQSq0EsU5Q
 LVNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxD0qwYYxrXQcgCJl7F6SrXGni6Lr/ZDwD3+GQ3dPbvIUqYRmScyzOtqyrgZpptkZqF1BM6VvJbEy5a95BfalrdRgJTNmo77BZ/vumkKbE
X-Gm-Message-State: AOJu0YzYccZkf1iKcdKTu4nq92w2hcKMHmg+WgWAyI5vAIMdDQl4qj6T
 R572yjEPnUXyzkBoOuBTxSKm9bHkPkfkKdU/YbvQllXdbl+B56sk
X-Google-Smtp-Source: AGHT+IGYjRw4HaXNToLSM5TrKo19pvEgzTUhm6rYD5tVnSEZOiLTLkmaO21eP4rpOdrIWvFllWA5lg==
X-Received: by 2002:a0c:dd14:0:b0:68c:c843:8ac5 with SMTP id
 u20-20020a0cdd14000000b0068cc8438ac5mr10516qvk.42.1707437852717; 
 Thu, 08 Feb 2024 16:17:32 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXjP79Q18y/qU+R7IvuKde5fUJMjwHE/1dDiQNhllyAKW0p+6i7TvPPkrjkzgYMBBbFsFdz8hzVeTN96Bzs8oieW5OaGfGm5l/snpfjO0jgGV4xWa0t2TplBs5Vy0FWxHShlNVCF7plVVd4qrCMitowUJ0TjDUsleOoCtRvhZW96OXHMjz3ExtQEW3lMbXeSZMMflcybMon3CO4p8FVx5mGjuP486L6n4Qck35lh1YP+m1HJM/Jfq09n0iPXjvxJt5DMJS/ixIUnzEzut9YzOe9VosZnpUFJphh+34qjABZ/BMmXaKDM9apmlIZOgk61N5mgUaS++PaD6RsbtVGWtILxg8nszwh6RpKz2ZqItXJaG/S3QwjYK5xDDfHH6wKDpgA2v+eICRirqiYpT4qz65Obw+lI0Jd7CF5ADno2wTGNlzkt4KXrSiuqMcuwhmx7L7ZrFuZhXoeYz8hB5dwnJpEMOfRMYm9t+uiwpCut4iYhBWuCOIF6wHeDxHmsTr4Z+21JkdOYhJlSqw0a939LJRdJowaWNy5TILO79eyR92Cq4ke4Sh4m4Yx63/6vwNRTrGoQHkAODSX8oDd
Received: from localhost ([2607:fea8:52a3:d200::42b6])
 by smtp.gmail.com with ESMTPSA id
 pc8-20020a056214488800b0068c6d56d4f7sm282560qvb.92.2024.02.08.16.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 16:17:32 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 0/3] drm/panel: Pixel 3a Panel
Date: Thu,  8 Feb 2024 19:16:41 -0500
Message-ID: <20240209001639.387374-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This adds support for the AMS559NK06 panel with the S6E3FA7 display
controller and enables the display subsystem on the Pixel 3a.

Richard Acayan (3):
  dt-bindings: display: panel-simple-dsi: add s6e3fa7 ams559nk06 compat
  drm/panel: add samsung s6e3fa7 panel driver
  arm64: dts: qcom: sdm670-google-sargo: add panel

 .../display/panel/panel-simple-dsi.yaml       |   2 +
 .../boot/dts/qcom/sdm670-google-sargo.dts     |  64 ++++
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c | 285 ++++++++++++++++++
 5 files changed, 361 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c

-- 
2.43.0

