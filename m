Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA62B052EF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A090410E534;
	Tue, 15 Jul 2025 07:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=scandent.com header.i=@scandent.com header.b="JjWsd8QK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7D710E0AB
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 19:17:35 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7d3dd14a7edso663914785a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 12:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=scandent.com; s=google; t=1752520654; x=1753125454;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ppm77+VMgkhfwsY1YCayVc7qsiRcdKYM27vglyic/Bs=;
 b=JjWsd8QKXUauLrZFeIsxUMD76ylRupCQDj7/rpKN1j/IKcJyYcaMQ4OqOgmqQnuShT
 SdsUEro3c9BWkJw4ZOmsSglBPpbTHLw16fzc5NytJ4nZQX8ariWQA2tFIrQJP2xgFIam
 5mRcv4xK+eaGF8phPjLaOwEEwUBxqJEI4CKWqTPitubkeDTY7TDsW6W8SSVTa3XZI0tc
 IUmNLOQc0SzU9sKvi100SvVHyOZMng6ZPQECBATEGeD/BGwe4k/uQzrEG4opxjKfxTId
 y9HrdNhf7XA6SiH8xeCO6uKjnOLHAqpJEgeAE/QhDqsmwSe0i/sYIbSmBLTqgxi2mSgY
 BuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752520654; x=1753125454;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ppm77+VMgkhfwsY1YCayVc7qsiRcdKYM27vglyic/Bs=;
 b=ctmUVKs9FwDqs7LYJFSWcRI6j9YQXA4Jw5IRzZ5zk4gJTTVZM7L6MiXhcifWznTV9Z
 r42F8acNb17PUTPFKg8b/gunsbW6rcgPIJSUUO7fYv4lahAnu3GNG6yJRPs2lQ6054sF
 Tza4VgSbV27miVVwFsN2lFk+SZ4gr5rkh5KePshac11076xibUoVcLS9RPfnZSYvPRvd
 z/zpYYPMG+gD5lWIIkdrrOUusliPdxNuVmA+MCahFM6soDSBxSk9hKbintRp0zF4EbVI
 Oyiu2qG2ClYaJDxn53uivvVVso4q2T6kY+Nco/HQajMUVCpvMTCzEJpKge7V2NpJCsrX
 BAbg==
X-Gm-Message-State: AOJu0YzmynqgRYmrq+Ee9L07VeRMnuyCk/NBmXi4DUEe6SjP10E4oboH
 +2xCP56GqZMRZ3PpVG3gA/M0yOBvvoj68MJSC//YU+K8cmV3m40kruaRjQnEtOcJ/1OaSiVQhon
 HnPUr9/M=
X-Gm-Gg: ASbGncsn4h5hCgmPb4NKAy3RpO4TfKRqK456MUZLo88CmAtp3E5c2AcDyaV91RkF9nU
 PzflbYpBFkQ8DAmzfbuFje8/Y4Ifnx7lVb/Us4u8RpLhZzhkwouuPCxzUwz85Y1fCWAcGzmiBsU
 7IcSccOjwuHA+itBk3bM8SQN4jqjTWBbLAi71bgy8vywbMGZHJwMSYQxzYa/0zVv+Ft417zwPI1
 labI7VocoQkOR+dvrzkOQdr6sQ/LaTjExqgspOfxJLAXk0wD4Triuf4PJzUZlItGqX/GiqbC3Gz
 W0INip4el2JLJ6MA60H4pxR++bdxWe/75zObGpEv1uIQpzQJaS6UeLoRINPT8fc9hj1uvHM1fwp
 0AYlKEuMt8cP3E310uvpSdvDgTVLJnp3mUy8iAH3dTZl43CqX
X-Google-Smtp-Source: AGHT+IGP8D0B1lB9WiY8LrpCrDqEWqN/fOscHbnw1FMJjYlEArtBj6PYHuACMQiqFNKRhKBRsvK8ig==
X-Received: by 2002:a05:620a:d8d:b0:7c5:405e:e88f with SMTP id
 af79cd13be357-7ddea60f5e1mr2300530285a.21.1752520654091; 
 Mon, 14 Jul 2025 12:17:34 -0700 (PDT)
Received: from vserver (ool-44c5118c.dyn.optonline.net. [68.197.17.140])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ab801e542bsm1482521cf.3.2025.07.14.12.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 12:17:33 -0700 (PDT)
From: Richard Yao <richard@scandent.com>
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akshay Athalye <akshay@scandent.com>, Richard Yao <richard@scandent.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Andre Przywara <andre.przywara@arm.com>, Junhao Xie <bigfoot@classfun.cn>,
 Caleb James DeLisle <cjd@cjdns.fr>, Kever Yang <kever.yang@rock-chips.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/3] drm/panel: ilitek-ili9881c: Add Tianxinwei TWX700100S0
Date: Mon, 14 Jul 2025 15:17:20 -0400
Message-ID: <20250714191729.2416-1-richard@scandent.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 15 Jul 2025 07:24:49 +0000
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

Hello,

This series adds support for the Tianxinwei TWX700100S0 panel. The first
patch adds the Tianxinwei vendor to the vendor prefixes yaml file.  The
second patch documents the DT binding. The third patch makes fairly
standard changes to the ili9881c driver.

Runtime testing and validation was done using a patched rpi-6.12.36-v8
kernel on a CM4 using a custom carrier board designed by Scandent.

I have confirmed in writing with Tianxinwei that this patch series may
be released under the GPL after sending them an early draft for review.
This should be superfluous given my signed-off, but I want to make it
clear that I did not assume fair use when providing signed-off.

Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: Junhao Xie <bigfoot@classfun.cn>
Cc: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Kever Yang <kever.yang@rock-chips.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Richard Yao <richard@scandent.com>
---
Richard Yao (3):
  dt-bindings: vendor-prefixes: Add Tianxinwei name
  dt-bindings: ilitek-ili9881c: Add Tianxinwei TWX700100S0 support
  drm/panel: ilitek-ili9881c: Add Tianxinwei TWX700100S0 support

 .../display/panel/ilitek,ili9881c.yaml        |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 242 ++++++++++++++++++
 3 files changed, 245 insertions(+)

-- 
2.50.0

