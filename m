Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D17F2B4A3D9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 09:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605C810E232;
	Tue,  9 Sep 2025 07:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WkLN6I6C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB8E10E232
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 07:38:43 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-55f6abcd26bso6871455e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 00:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757403522; x=1758008322; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MCB88+vbweUJHwwH3EqEE8pXooyU0sixwISDhtVREDg=;
 b=WkLN6I6CNtIGfpweD0hVpHbqwDblXOKxQbeiEuZoQ2enGurM5Wxo9Y5BdNK0LGWRIN
 pWCdfyQs4Jrhpg/yIGMnBRHg/GPldiOg5EOlNWzS/YDjW9ZaeudjxlFKRhAgdBlRqXSu
 VUv0vtf+1Sjp4x/ccizTUMWvigumkmEwhfy36kGjVTj8D2d2kSlWJ6XGKuZmJlV602FS
 kv5+OcZ+mPgS9/OfkjNA9ugm9t6gOQkydQJtROZA1C8BPLbDdFYVE+DaFqUfL5hmEMya
 ooxOLk69XFrcmBgCNnA/GZh8dzIJz0JhjWdWf5pJ4UHobTkNl1IiK0vBqrbzJ6cgZkm3
 yi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757403522; x=1758008322;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MCB88+vbweUJHwwH3EqEE8pXooyU0sixwISDhtVREDg=;
 b=MeSELVXtBN2TIz9gLuIohFVB3f+UKTvAgKMe2W//Vz6gRJJqjLhX2sLndI4MGoR0Rd
 bq/efknw+NTMvdEtoV0kN44Usjx+zLKe+glHOxFnZm55e5yEMvr/A7Bx1p/a52pNubAx
 WJyLuAhGrrkrxkGJKQHndHTy61XrQdSYuCVQEtlfN6kZQzyGWSoeLAsNzh0K9x1YCL9z
 F2PxoOM7vqYGiJNTsfHs96UrmrcNtzPLKO6V3AO0Uxjphfp1CFir0lFM2AcWeqF0JoJa
 dgDHgQTKXddM00BVUD5TQIHwLo6uby5Z4iaEwS4LCx67Somv3cMfyTfHsoAyRysdhA5x
 5N5Q==
X-Gm-Message-State: AOJu0YyJbjXoZhy6iLIHvPcocyvToH6k+y39zfaQlyd9gvBl5WMCXIek
 ztorFoSY4QeKCFLzZ/SWrWpAeiseHHCLcL++KhdhOcsCVWrixQFijEnI
X-Gm-Gg: ASbGncsknrx3bnJMR1ykRGv9kYfC2NWvgXXjdH7A7GfPNr8c6bv5ILXxiqvBMRz4Zzs
 NCkfW/PssoGy25ZhO2TS8pcEwPCzPfodE//xybDqLbJXTD5kYvV2o+1hqz+zD58QQTjdapTcJZf
 YETJ/eGsodQKXOIXQLXL8Slwy1tmT4XaO5f+IqSNZo7+tEwG7tHFpbf/0ZiyMr4qx2EZlKxQ9ac
 vu3sCR97cp6Vnx98NXHBWErOrBrJQyCWaRthqsqFqF57JTXAHHkuty4BxDnIgPLI0ctmRTD35Q+
 GXqonuc3enTefMs3kpWdkk+XgxHqC2IeNx7cRk83ccxoj6qBgJA0pUQjEsoMpqhUbMrcQ98/T5Q
 j+KHsYl+z5mGP37mEupCAd582
X-Google-Smtp-Source: AGHT+IHJBwIkvW/VwHsEbpXKyVfJ7RBEnWnwN0U8Py57QMTHTnwvYi3mfGECjwrqurnM3zc+Iv7Q5Q==
X-Received: by 2002:a05:6512:3e17:b0:55f:67c6:be48 with SMTP id
 2adb3069b0e04-56099434be2mr5502271e87.1.1757403521219; 
 Tue, 09 Sep 2025 00:38:41 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5680cfe2496sm342580e87.61.2025.09.09.00.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 00:38:40 -0700 (PDT)
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
Subject: [PATCH v1 0/2] DRM: panel: add support for Sharp LQ079L1SX01 panel
Date: Tue,  9 Sep 2025 10:38:29 +0300
Message-ID: <20250909073831.91881-1-clamor95@gmail.com>
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

Sharp LQ079L1SX01 panel is a LCD panel working in dual video mode found in
Xiaomi Mi Pad (A0101).

Svyatoslav Ryhel (2):
  dt-bindings: display: panel: document Sharp LQ079L1SX01 panel
  drm/panel: Add Sharp LQ079L1SX01 support

 .../display/panel/sharp,lq079l1sx01.yaml      |  99 ++++++++
 drivers/gpu/drm/panel/Kconfig                 |  15 ++
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-sharp-lq079l1sx01.c   | 232 ++++++++++++++++++
 4 files changed, 347 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-sharp-lq079l1sx01.c

-- 
2.48.1

