Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C723C430B0B
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 19:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824406E7FE;
	Sun, 17 Oct 2021 17:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5CE6E429
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 10:19:10 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id g39so197820wmp.3
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 03:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uFHq5pMrJLlqHIoifd8IzUgmATqJ0HiByPSLSQnC1pY=;
 b=mUi7nbno2+KOl/X+jthof1bE34sfYVb7uCDDj5/WgpSL8yV2DadYaLOHjlTzKm9i6g
 q9s7tZlxZ+rrs7aJnuzaCAEJfjySkp0lwmkpyns0JeBS2r15+DW/XpiuPDZ0DdVcAld2
 0IjibwlX0gg/OHQMIJ8kXEAfWMblhiOGURAGsTvVcy5q5Ttcj1JUkb7Kfy3xCGCDUQf1
 zF0uIvAzC2cE9FkwflqVHxqjt7q32LW7NKW0yWMvX83nqBvAD3qWZWEedsE2AqSKLx2Y
 fUsmuRPng7IhAUwCiOwOA4e1Sf8fzXWoaU2hHq7FDDyWrwySXZvFDR0jm6BOPDMoDIfY
 By1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uFHq5pMrJLlqHIoifd8IzUgmATqJ0HiByPSLSQnC1pY=;
 b=GNZ7cG2Ag7MDubpcfNir/4QWwz09WkWEk11ZiQ7z/boFsTTlMx1bQyJuvmbf0VcN0+
 j1QmtHrN6F2iGHk/pSCuPu2SqvIlLMRhEgGPSVi+6btSoESXCWos5eSBbwFN6pDGSDuG
 276w/KeZivV9jJWMAn++GLL2ZNKf5Lw/Jw1vLugYSCoa4nktWuzPzw1vI8LgYCGsc/H0
 Z/NLuwCsYKtFSGf2SME3+5RnGT6FNR7QQEinF1WNwzF2moTPV31IxiIsEtgN/Z0fRvwB
 7CkpDVEEfpg+NGV4aFuQvRyHWoKoL2A7IO5naQSq+RMrxPbwq4AmFAK35JHAP/sgRBJV
 9Ibw==
X-Gm-Message-State: AOAM532zPfE98KY+IXFUPYZXY+6vfjBtu4SUOMKrvEBtLxr/Rm+WCW5H
 zHPrK+oQDBwjLTZQt8ycinucRL7VKtwzPBcw
X-Google-Smtp-Source: ABdhPJzgT7XXN9D8uSHf18Ft8oKY1Q7cFjkU3MF9MbinYRG/nfCkVnSA8B2cf+vaCwH/hduer+eeow==
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr18355372wmk.51.1634379548494; 
 Sat, 16 Oct 2021 03:19:08 -0700 (PDT)
Received: from apple.sigmaris.info (ebrouter.sigmaris.info. [82.69.107.165])
 by smtp.gmail.com with ESMTPSA id k13sm2920926wrp.86.2021.10.16.03.19.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 16 Oct 2021 03:19:08 -0700 (PDT)
From: Hugh Cole-Baker <sigmaris@gmail.com>
To: heiko@sntech.de,
	hjc@rock-chips.com
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Hugh Cole-Baker <sigmaris@gmail.com>
Subject: [PATCH 0/3] drm/rockchip: support gamma control on RK3399
Date: Sat, 16 Oct 2021 11:18:49 +0100
Message-Id: <cover.1634378097.git.sigmaris@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 17 Oct 2021 17:06:15 +0000
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

This extends the Rockchip VOP driver to support setting the gamma LUT on the
RK3399 SoC. Previously, the driver supported gamma control for the RK3288
only. On the RK3399 the method for updating the LUT is slightly different.
This implementation was based on the code and description from the vendor
kernel [1].

The RK3399 also has the address resources for the VOP general registers and
the gamma LUT located adjacent to each other, not on either side of the IOMMU
address as on the RK3288, but for simplicity this series follows the existing
DT binding which requires the gamma LUT as a second address resource.

This should enable gamma control and "night mode" on all RK3399-based devices
such as the Pinebook Pro, it has been tested using the "redshift" app and
GNOME's "Night Light" feature on a RockPro64 SBC. The changes should not
affect RK3288 gamma support using the existing code path, testing on RK3288
would be welcome.

[1]: https://github.com/rockchip-linux/kernel/commit/4a361fa5d433dabe64b0fae49b49c0fcd16982fa

Hugh Cole-Baker (3):
  drm/rockchip: define gamma registers for RK3399
  drm/rockchip: support gamma control on RK3399
  arm64: dts: rockchip: enable gamma control on RK3399

 arch/arm64/boot/dts/rockchip/rk3399.dtsi    |  4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 89 +++++++++++++++------
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h |  2 +
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 24 +++++-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.h |  1 +
 5 files changed, 90 insertions(+), 30 deletions(-)

-- 
2.24.3 (Apple Git-128)

