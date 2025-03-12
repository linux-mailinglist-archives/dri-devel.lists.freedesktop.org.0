Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F36A5E84F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 00:23:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433D810E0C7;
	Wed, 12 Mar 2025 23:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XREvFEhd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF0A10E07E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 23:23:22 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5e686d39ba2so610742a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 16:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741821800; x=1742426600; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N5XiRjmmSEl/27WyQtk9B76hARduq1iukuO2DeaA0TI=;
 b=XREvFEhd5/Bqe7FI6vxyNiCEs/tgH70yG9Nw8noOJmBQUT7STJD4FXiRwbSgrNMXuR
 EhdPUnnZRBjsaZYMWFNUrOgXRToza8w2Mx8yTnnfY0bFBOmyZjsZYMzR0/AuSmecCELL
 Gsi71zYbq3ZiNJ6NRX7EBEd7Ox4MAaI7/h+bWS7ToduRqTp/vOPdBkBvbaL7oj5GQ4zV
 N0XePHjTWKbMEVnggYENvh1k8AyaVEJGf7JK6wnAjzdcnQ4eq1398vhS4X0SK8/5Xgn5
 hAKTvvsUa+KA2Z8GyPFHcEX4Sc6iRyT1Xgh9gF+OL96rOTTrccN88LqFO4RL5rVFE4wH
 oZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741821800; x=1742426600;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N5XiRjmmSEl/27WyQtk9B76hARduq1iukuO2DeaA0TI=;
 b=SmsXFBoddINR0MRtFunncj63PcXCPf6as0Q5QMHuxbc3lBWLAHQFyKeq7zWhvbvqU4
 cdknJ39Z0MlRMCzAlmKZKO02diSl+S5FG8vC0w4LgAlUumiEdK6ljXaUHgyQAQswf1iw
 n+ulLvdZAkKcNsq7xUNVZCW4g/HFfW9kDJmLDGmMnvOfa5vCfxcRbY72VrFIV9BvT7RC
 HprMT9QWK7fuzrHxCBOY49abwxZze9cV6vR7S00LT0ow9sKVPVNm4IURb2+XqQ1bRiua
 aIvrNmsUTnN1k5Ug5bgGtDrZNkZtgUqJvS5RF1RSbb5XbiwIIwds7/IEkH1hxrye+yoR
 EjwQ==
X-Gm-Message-State: AOJu0YyKIHwW4I5enuvNBQ8n73wNJgoteS55YxAZingyx8FcIIgR9shl
 /L7AokzQXT/704ScOf3o7mW9C7/axz07T/rEQM11sjOyr/ZynRPP
X-Gm-Gg: ASbGncs4p0YAG+RUuQXjkBhCkTVvXW6VCZrIDT4K87VQV/dwvPD+ifd4U74AXLAxSaz
 RUOYfvv9jtQWryqA99PpSqqbPNciUSYc49tbVxsxH0kzzi+fzpInwutql7VAc0ADoaue7gx0+Kr
 jb/zbd9tSi6sjMBpGIl8tzDsdzp0z3WFIUlere/SfpF1Dx3ecT6zfs7hkvjje2li+ylMstjHMPn
 CehZpDLLX1PneGuSVGQg0qyk60MHTtequgAErap2OunTuITYL6+UxwX3h0fpjmL2G2CIZ6QOGjY
 l4JXKzUUPLSEyUS81NsZ6zGeEC1YKUDWljpZMUKaQpC2rJZPUMqpC+fxqzpajs+MajtZcsw4piE
 NTfaVsCQ1QtGFugRQTEEWZ8FlPvLM0GtlCgtdyF8e/w==
X-Google-Smtp-Source: AGHT+IGHCuvkKN2Hnl4IIftTv7iSM7L6WhcdJmI8aN2Zt/SmXrCXjIxp9Wwtgzg+MHajHiqjVl+fZA==
X-Received: by 2002:a05:6402:d08:b0:5e6:60da:dc45 with SMTP id
 4fb4d7f45d1cf-5e75f987950mr11542688a12.31.1741821800333; 
 Wed, 12 Mar 2025 16:23:20 -0700 (PDT)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be.
 [81.240.10.146]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e816afe223sm26732a12.70.2025.03.12.16.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 16:23:20 -0700 (PDT)
From: Philippe Simons <simons.philippe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: [PATCH 0/2] drm/panfrost:
Date: Thu, 13 Mar 2025 00:23:17 +0100
Message-ID: <20250312232319.25712-1-simons.philippe@gmail.com>
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

Allwinner H616 has a dedicated power domain for its Mali G31.

Currently after probe, the GPU is put in runtime suspend which 
disable the power domain.
On first usage of GPU, the power domain enable hangs the system.

This series adds the necessary calls to enable the clocks and
deasserting the reset line after the power domain enabling and
asserting the reset line and disabling the clocks prior to the
power domain disabling.

This allows to use the Mali GPU on all Allwinner H616
boards and devices.

Philippe Simons (2):
  drm/panfrost: Add PM runtime flags
  drm/panfrost: add h616 compatible string

 drivers/gpu/drm/panfrost/panfrost_device.c | 37 ++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_device.h |  4 +++
 drivers/gpu/drm/panfrost/panfrost_drv.c    |  8 +++++
 3 files changed, 49 insertions(+)


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
prerequisite-patch-id: eb8a11e2b24bb282970d8b8528834dea7ee392cc
-- 
2.48.1

