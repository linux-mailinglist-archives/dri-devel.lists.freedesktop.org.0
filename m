Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB30B18FC7
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 21:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EA410E48F;
	Sat,  2 Aug 2025 19:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="Qh4jYuMo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B06C10E48F
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Aug 2025 19:26:04 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-31ecd40352fso2655021a91.2
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 12:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1754162764; x=1754767564;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CaTaCEwiy5ye/b7edAgdJni69arTuyowWyDQz6ouBQQ=;
 b=Qh4jYuMoM+hFYcgOqJXDbWs2F4fmdoKl0F76AiNiESWxI8bAhvweP0QHsB5Ars9LAb
 rQbX6dcns9vVcUhpEIdq2LiUh1vv5N433kj6ATlpH8gs+7RHgsImValYpNENmvmO2dVy
 WSHDBNVg6ObYk4ph3onjWt3qOvBeES/Gc9MOy+8IWgMNZBlFdfvIgA/ieEgsQcBlX9Zz
 WYX28A14C2Ad9nes99kIO3TDtMmSOrNfyPCdn93y6434aqwTuPFbfbGgua0bScf8ztw2
 0lZjXMKSKif3y9Zc1wym7rJGnQqJNvHfhErpAOrUN5plMCrAFNiG3TbQyFQFiKhcbVoT
 nnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754162764; x=1754767564;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CaTaCEwiy5ye/b7edAgdJni69arTuyowWyDQz6ouBQQ=;
 b=DjB31wYdo11AFCpkIrSH8+uxOIT+0sYicGixu3zBMG45nUT2R7CO6xhlhZ1xAnmSft
 f4bUcR/3rS3tEftX2O972lQDETRKqBaKIZpnGsh1s8VSgwEyTxRXY5sHAQDcBBVHEujW
 uQV1PLgS51VvQAWLrRW/z3mJcc4Fi+FL9k8ExV8oUmQal2Cws8BGvRiOz7FXIjPjAaXE
 Uwzh73okIyeBQcnaRUt4TXOVcH3/4vyvj80U++Bh60JvvJxTLWW2CXR3mxsYSf5H0lk0
 u1AV0rMLQ6j6pywNaZCDH8p15XZIltzD6RIeW2C6YtGCItOeKX/cRXuSoahPKXz98kJQ
 lwfQ==
X-Gm-Message-State: AOJu0YwofnbGkgM2c4O+ERhWpnJYDh2wh1mpE6xT4/7Ad5fxKHldPFvx
 wobrRe4qSwhSKipdUMEVG0HsMC94cUqY+ybLs/CkxwXhKa9YD3LtTzF4uNLv4gS5PbE=
X-Gm-Gg: ASbGncuqaY7bBuoNcubIX9k8BOWaaYW1TKuI2YBWCP24043RqoTE0KQq8nMOqxK0C0v
 TiR3878xF0aQu61G5H2qQ1ellqGbpmN5JrV96DgKuMD0c27NXUAbDMmi+YxTksaN6MYp2SaEhoc
 6oa/EfKS8O/qk36MvT1UCgPHrpMCokqBhSVtQPWGMCcoCg5IsIAmNLCEB7NGow6Gxjg2fLTJydk
 VOJN+SZJk1757uKZbMqVoEu54CilZjDiriqtkOrub0E3SnquZlHtQXlS/J55cj5WFi3QE/SfmPR
 rx/TXnkJ/EdKyFcAb620TwcV2z2DEAvVy6wB6cxuukXnF+6UOuhRLjmW08R9L0YFVcil9Cg9Is1
 AhCDdt5FtX3BFzJv47kBorA8FMAEGPo9bpRA=
X-Google-Smtp-Source: AGHT+IGlEGRhwr4gr8Z2C6l17HnHwUs58sjegA3GcEnBznTqiAkjnii/hJFGH6edhQsfKk84gJlxdw==
X-Received: by 2002:a17:90b:6ce:b0:315:c77b:37d6 with SMTP id
 98e67ed59e1d1-321162c7400mr5456322a91.23.1754162764043; 
 Sat, 02 Aug 2025 12:26:04 -0700 (PDT)
Received: from mystery-machine.local ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3207eba6bb8sm7887583a91.4.2025.08.02.12.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 12:26:03 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
Date: Sat, 02 Aug 2025 13:25:47 -0600
Subject: [PATCH 2/2] accel/rocket: Fix undeclared const rocket_pm_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-fix-rockchip-npu-build-v1-2-fb0f0dacb3fe@brighamcampbell.com>
References: <20250802-fix-rockchip-npu-build-v1-0-fb0f0dacb3fe@brighamcampbell.com>
In-Reply-To: <20250802-fix-rockchip-npu-build-v1-0-fb0f0dacb3fe@brighamcampbell.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
 Brigham Campbell <me@brighamcampbell.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=838; i=me@brighamcampbell.com; 
 h=from:subject:message-id;
 bh=z+5KRxYc5UqnilO3In24UU4dyirhMN0G97cy/9xmtoA=; 
 b=owGbwMvMwCUWLsWS0KCyxZPxtFoSQ0ZfmttLvbj5zpsCrVsrf13/u/D0Iq8zjQ9rJi7bO1/xh
 NC0vObWjlIWBjEuBlkxRRaVW7PUL062fnQwgn8CzBxWJpAhDFycAjARBh5Ghq4JJYxNU1q9X7wp
 bjhzzWd532QVb1/Ljc93ySnfThC182BkOGLs/ars5/3PS6XmiIYWOsovjXy98ebZ4Le3D4pmdsR
 HsgAA
X-Developer-Key: i=me@brighamcampbell.com; a=openpgp;
 fpr=24DA9A27D1933BE2C1580F90571A04608024B449
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

Fix sparse warning regarding an undeclared const rocket_pm_ops, which is
used in rocket_drv.c.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508030021.uwdr4P08-lkp@intel.com/
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/accel/rocket/rocket_drv.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accel/rocket/rocket_drv.h b/drivers/accel/rocket/rocket_drv.h
index f50634935b605c542cce16a2b91c1e43ec16bc81..2c673bb99ccc1d90e2dafdc89e9a5c6df216a309 100644
--- a/drivers/accel/rocket/rocket_drv.h
+++ b/drivers/accel/rocket/rocket_drv.h
@@ -9,6 +9,8 @@
 
 #include "rocket_device.h"
 
+extern const struct dev_pm_ops rocket_pm_ops;
+
 struct rocket_iommu_domain {
 	struct iommu_domain *domain;
 	struct kref kref;

-- 
2.50.1

