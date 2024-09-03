Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD6F96937B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 08:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC86C10E37F;
	Tue,  3 Sep 2024 06:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="KCxgwGyP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73A810E37F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 06:16:12 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-2704d461058so2565517fac.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 23:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1725344172; x=1725948972; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ElCvWR7fcelFVFGE8p4d+UKKJx8aarvsE8q+pY5j500=;
 b=KCxgwGyP3b6z7O5npy96Aj7CpWUoNAKiu7jo/IBAhttBPZlV0QwFNLxMtk83Bf+Ob+
 eNNJp3kn0C0s8sRJSl/yrm/ruxn6lI36sqvWDlRBQVfNQb/ZV4quKMeehXE66jgnmmL6
 mkUPfVJHeBcgY7yaIIng0FdQ7W4nSUSt6qDb+xRAOayV/SKHIaPkJb/D6pNUnYooxhpO
 UU0077S3a8um6q0un5R/tDgWCm0WwO/9ktz35IuudqiIgs6DZaGHJ75K6wyd8WdeUYhH
 AINEtwb9J2nbaE8mx4G5eO+yrnRPrj+mCbnat8uKCwwsAxkXAmShvCpJER1xYgT3HNwc
 ACkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725344172; x=1725948972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ElCvWR7fcelFVFGE8p4d+UKKJx8aarvsE8q+pY5j500=;
 b=cHZW8tNklxPXXFmNJBwfZ5olrbdyPHw1jOj0xRjePV5PWKrlAUBJorRx/2bxn7XQBq
 jICYOatspkaXQiCp2p4UdxrBiJFGENTfKgHrsmfMf7OZCC3WAZ+NpgnlOt5WRgC7s4qh
 epXaXJ8QA6wo7Y0XhgjjYbVn6ZbqpFgcLlHV0pulbOtFG7ryj8oW0YdvFTi89+AcsJVb
 twHtrh+bx/uj3iC1fOppBsVPxsv3yfu2veYhPo7k8N4JGIeF1O2GmrnasH0EadxRCata
 Yf6470w+Mi6JrSUU89L24MfKCKihK+oDfpmbF71/Q+wvZCNTViGR4Gq0iBeoyhgmn9Mc
 uI4w==
X-Gm-Message-State: AOJu0YyWXi3Wq+hkvuFcwTZsgHPL5u32y5Zj7DX6P90jgQDmrQ90ggRO
 1IpLo3oCUwcUFezxXykNoP812mPSWsJ/JWhZY6+QL6B+2rlnE9mv+ixUDYjM1UM=
X-Google-Smtp-Source: AGHT+IG2tdFZEFYcyYni0un9vMzsadLohCJ0pP2jLeBlZ1Od8A3SVpwYq5Bvb8FiaHawN5AZA7QK4g==
X-Received: by 2002:a05:6870:328f:b0:270:2c3:f362 with SMTP id
 586e51a60fabf-2781a94563amr1280235fac.32.1725344171802; 
 Mon, 02 Sep 2024 23:16:11 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9be1efsm7151415a12.62.2024.09.02.23.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 23:16:11 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v2 0/2] arm64: dts: mediatek: Add MT8186 Ponyta
Date: Tue,  3 Sep 2024 14:16:01 +0800
Message-Id: <20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
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

This is v2 of the MT8186 Chromebook device tree series.

Jianeng Ceng (2):
  dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
  arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks

 .../devicetree/bindings/arm/mediatek.yaml     | 11 +++++
 arch/arm64/boot/dts/mediatek/Makefile         |  2 +
 .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 24 ++++++++++
 .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 27 ++++++++++++
 .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 44 +++++++++++++++++++
 5 files changed, 108 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi

-- 
2.34.1

