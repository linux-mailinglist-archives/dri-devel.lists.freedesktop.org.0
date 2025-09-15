Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E74B57875
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 13:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D36610E455;
	Mon, 15 Sep 2025 11:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LKDnj1j2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8055D10E455
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 11:35:49 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-77619f3f41aso2018801b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 04:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757936149; x=1758540949; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=dUzFkFk1+mO2jRYji6fAqwLaxf+InG/7uYm0PLcoMDU=;
 b=LKDnj1j2xB4ku+azZIb/hTX1beHPi33cMH4RduyBq7yeaec8s3WkyeMuq+L7nEviSo
 KcHUcp9O/tc/frMbyK9vOuYpbvxQ37Iunw8ASHxCZm4UAqAxoyq+cW7dRf7XM7ihiKG+
 X/DrcamXPqhPdE23EFhB+tz99QyjOa7R35I2yJyFv71wHTFnPt5HdDD8REMHTSo2gqSY
 NTOjRIoDl3Ns8hKZGV8cw0JGbTKRO/N2imkA3by1U/2OUlZCqLd4uGVHTs6nlhBWfHRB
 G+nFnbs72hHLnC+rw28d58L74JvowKhThQbjw1CYMGHb3fmRS3zXErB6D29i6V8KTF4k
 vN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757936149; x=1758540949;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dUzFkFk1+mO2jRYji6fAqwLaxf+InG/7uYm0PLcoMDU=;
 b=r7OylDtWfGcZmWf5Kc7kCydMwAysCcJNovHa/S8xMpjBM/Upo6bhjhPZdp/gSij8xR
 OAiHvVjxBCWvszM4rskyItnnZhycKS/Awt9mWB/dZ8ihWAuyL0gEMJBI2wLLO847sB/M
 C7SrV3UyvuO6LzaPCL8mo5qhR44MWM0y7vgSTYFPokvVLzUufoGl3NCLmE9Il7u9l27F
 MALO/nf+jhpVOnSGaFTU2x44e6hqGw9mdXEOHPsZVVH+wQEaxDSULs7kCIp+y9dQhPCe
 9UNFPKggbmaUyV/4RKglMh0fViXwz1RP3TGSc4tM2bNQsYQNrjChDmrJlyqodkyVO+5s
 YnmQ==
X-Gm-Message-State: AOJu0Yw5mWEVWlB+x9uBk+vzSWfuuvUKlTb96j+AknUxLsWGeEKv2oJJ
 nmtRBpvTuU1Jtltzoa5PEHDZnTQ2VOoTvefF2y7X0gGQrTqQe5Lmgqj2
X-Gm-Gg: ASbGncudf8czXswLTz4f1GbJ1PtCRxynN1OhEBjjriB145WgJqVbzBoq1OS70Xvme1q
 L5FewdkkFCfqjM0P7jt1c8Sk1TjWHn61OrUFysGjmV4UtlpM+UJUKGzjIFxMEq82VZfHi+xJCSh
 pfwdZAeXfX6E7aEZVBeHOaLo5S0GZZ/T21ED1CpBZSsSAi9cZdyIRIo8ECp56ht85LvdAe1S7Ta
 XdIDYLp5HBTtkaHJqC7/LFB70r8kTavc+2g8i1uGkJfhYGWbEl7MjBCWPn7U/UZgzp5PQiZW+Qq
 G8QROEcN1LroW7gAFT5B2vaiEQJLGdoTLd8bpMwFL5kI+fE+5VyIgmqxqy3C9nEtRmEU3Myqo4I
 8SMmxjPVQRZkifmCxnrMzyEkV04UcnYcF85WP6inBXyF2kC7qFI8lubYYYngHxMetcZ4=
X-Google-Smtp-Source: AGHT+IGr09urmEGmQvVvTRHCnJeUE3anzGKvE0M1XN+hFGHJ2XSQsiB0hamET89RZILOw7ceUvDY3A==
X-Received: by 2002:a05:6a00:4646:b0:770:4ede:a2e8 with SMTP id
 d2e1a72fcca58-77612163929mr12201677b3a.16.1757936148826; 
 Mon, 15 Sep 2025 04:35:48 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77607b18400sm13054455b3a.59.2025.09.15.04.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 04:35:48 -0700 (PDT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL RESEND] exynos-drm-next
Date: Mon, 15 Sep 2025 20:35:43 +0900
Message-Id: <20250915113543.51294-1-inki.dae@samsung.com>
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

Hi Dave and Daniel,

   Add Exynos7870 SoC support to Exynos DSI driver and a bug fixup.

Please kindly let me know if there is any problem.

Ps. This PR depends on the following PR being merged first:
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-misc-next-for-v6.18

Thanks,
Inki Dae


The following changes since commit 77169a11d4e9916f6c22587df396d6128505dbfb:

  drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM bridge (2025-09-15 19:55:15 +0900)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.18

for you to fetch changes up to 472df181d7c4c732d5c5b98d506d1902e7580acb:

  drm/exynos: dsi: add support for exynos7870 (2025-09-15 20:19:23 +0900)

----------------------------------------------------------------
New feature
- Add glue layer support for Exynos7870 DSIM in Exynos DSI driver
  . Introduces Exynos7870 DSIM bridge integration at Exynos DRM DSI layer.

Bug fixups for exynos7_drm_decon.c module
- Remove redundant ctx->suspended state handling
  . Cleans up unused state check logic as call flow is now correctly managed.
  . Fixes an issue where decon_commit() was blocked from decon_atomic_enable() due to incorrect state setting.

----------------------------------------------------------------
Kaustabh Chakraborty (3):
      dt-bindings: display: samsung,exynos7-decon: document iommus, memory-region, and ports
      drm/exynos: exynos7_drm_decon: remove ctx->suspended
      drm/exynos: dsi: add support for exynos7870

 .../display/samsung/samsung,exynos7-decon.yaml     | 21 +++++++++++++
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         | 36 ----------------------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  9 ++++++
 3 files changed, 30 insertions(+), 36 deletions(-)
