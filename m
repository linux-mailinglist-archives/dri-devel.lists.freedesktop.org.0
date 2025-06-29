Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A92AECBEA
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 11:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D34810E14A;
	Sun, 29 Jun 2025 09:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gRmh4Xi2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB69E10E14A
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 09:17:52 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2350fc2591dso30306245ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 02:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751188667; x=1751793467; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=pqcRd2yr9slWTxBRPc3E4dnPOHab8OahlY63BTf5c7U=;
 b=gRmh4Xi2QQmjqQ8frQ1JD4RVMXouncohmNdneRiSR+c1mnsYLoRj87H3+ogaKhdhwY
 7Y6jS0im5R01yQh5CTCLcuRtfTksAWN9WjQd8pOtnSEV71LVHOX/WTrbhMt3FF3sMeCS
 9SNJ0WUZMBIrD3ubkPI0xQMB3BTnNuHK2/vGIigfNrHhnl0bur6ILNQE2dIkFlgh/ae2
 PfF7Of1L8OPlEntoEDSonD27g0BPj5MO+hHivIFtY9IjK8usco+0gmQIbkvX+wcEdy0d
 jw11im32y75mOpNj+GtH4l2FrhgHXoN9VepZ6tyiCiAXAjv4z+5Z2e2vSEK4LTPHSgF9
 ewAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751188667; x=1751793467;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pqcRd2yr9slWTxBRPc3E4dnPOHab8OahlY63BTf5c7U=;
 b=ZLjpgS3LcmKjwBgzaRWo5PPNyJxj5NyzSis5Z572OfFGSSeOI+TtPAhWZRJWtI2MjI
 1R5rEYcdjiGmwTB04l2K8IoLXDHc4otGgYlGOmNocSK/VcDvUJsUdsXnV8Dw8wbZfFYH
 pV78TxWOGgrywPQGKxythMqM+52pmQj0MFHy7yQWfG+pxf1Jm+ywL81XWS5esF2nDx/V
 ekWh7TlbYWjJAJA4NOnwDhSy0AOFz1HMeEgr60gM9BljgO1yJNVmfDWgRLgPnFjaQb9S
 IbFgAGSlHuzWOSiKDeKRpThetg/3Pzn3tGnaSKfC2klGulpuXpzNeAGSSv9LQqRmt97+
 TtKg==
X-Gm-Message-State: AOJu0YwR6fnzZsoJc9aotf/2z6KaoDtBMYfHkCgOpjid9S7nxE671iuO
 tcZjTbaWuiOpmuhManTidIp4kfJ1DxQyXGSZRDd+XG1QL4F0kl8XN4gU
X-Gm-Gg: ASbGncvyIWU/I8vq2nrpPMvvdvwtE97d7j50d/jHXC09pdptZzAqiBCp6IC7KDuGxol
 7kBeBrWetNZstldXYloPJwzWFWdt1J+sEuzYX5L1PTo422nfbwuCdrmjoo/j7wUQ+0PkksvpqlQ
 xEibhn/Ma/SKKnBZcP8qD/8lsnBTIMs7qRoBHVsLFbsWfpDVGlythusi/98jMex0x6PS3zkB+Gc
 b3P8hSy0/6VC5yDU6tANWRqEdjkkorKIqhEIWAiZW6AXaQoowO/Drr4IEu3cY2OSlvjVIcv7llA
 GgiWNKDpFwxRkDyJR/O469swYezhJ9wF4XWi0exNNrGDN171oA9XsamLbEoOSQ3N9ZDwtOR2DM8
 tgtOZ+UMaqkJxoea9qx75DCZXdNhlxUs=
X-Google-Smtp-Source: AGHT+IH27CenTTY4wAk6ooOK5q7PIwusjv28QE/O2orPE0Z34Ie4F2XU6HSiwSX+o9sFVwVSvoypeA==
X-Received: by 2002:a17:903:3c6b:b0:237:f757:9ad8 with SMTP id
 d9443c01a7336-238e9e06b68mr203593385ad.1.1751188667350; 
 Sun, 29 Jun 2025 02:17:47 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2e1c05sm56828035ad.16.2025.06.29.02.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 02:17:46 -0700 (PDT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] drm-misc-next-fixes
Date: Sun, 29 Jun 2025 18:17:42 +0900
Message-Id: <20250629091742.29956-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

    Just prevented pointer leakage in printk() of samsung-dsim.c module.

Please kindly let me know if there is any problem.

Thanks,
Inki Dae


The following changes since commit fd03f82a026cc03cb8051a8c6487c99f96c9029f:

  drm/bridge: analogix_dp: Fix clk-disable removal (2025-05-28 16:53:31 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/samsung-dsim-fixes-for-v6.16-rc4

for you to fetch changes up to 2ab3ba39153dcdc9de7d2eec42bf19f84d4844cf:

  drm/bridge: samsung-dsim: Don't use %pK through printk (2025-06-29 18:05:51 +0900)

----------------------------------------------------------------
- Fixed raw pointer leakage and unsafe behavior in printk()
  . Switch from %pK to %p for pointer formatting, as %p is now safer
    and prevents issues like raw pointer leakage and acquiring sleeping
    locks in atomic contexts.

----------------------------------------------------------------
Thomas Weißschuh (1):
      drm/bridge: samsung-dsim: Don't use %pK through printk

 drivers/gpu/drm/bridge/samsung-dsim.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
