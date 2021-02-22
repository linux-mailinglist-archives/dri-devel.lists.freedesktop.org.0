Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B19D322218
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 23:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD2C89E39;
	Mon, 22 Feb 2021 22:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F4C89E35
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 21:55:13 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id c16so13622452otp.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 13:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OLfykMuiVp97Rmb4dR5kZNxPyJhV2fWYdudzIpCtISY=;
 b=o88aOI+Dusj5SWjl2KYpv9ucVTpkAY0fQ25FXGveFb8RKroDMCMDiCSMOIhJE5PAY/
 DorEPAWkpAwzxXOBAs60MjmEVweeScjH48CeRtZ1wTTVdlVe42tJsiLi7/2OxseOmnR/
 TGf0g+FF9djMUj1Bt6dCh3jI/swyDz3JrA1gaGpmBE/OTo+GUrEJlCuNMY1PdVTp7eFL
 2eWi7/Mo/NbB4HKqXBzcbo1+y2+r/vVdQ+M/HDHlZt2fAW9HqznHSX8eXLkv0AKN2iVi
 J6PQxokMqI+cS/a6714M9N+7FpgfwqnyEGayLTbGBjIXQC98rhlXbmfcddFCvxSRG049
 424Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=OLfykMuiVp97Rmb4dR5kZNxPyJhV2fWYdudzIpCtISY=;
 b=ZJq96sUNLL9BkdC/HLHs+YFvJiv4e5L65yYusBkWrwGFUc6KzVDkR9tWZHh+rICp7b
 QryrS6OftjVauH9qToH59+CdQdPjprm7HtGYpsStdtatW0kdijD7bR3Af+kvIna0rAB+
 WyXjJtltqcjXUBNSc9F5TaPPxm7fXHnBzpXY4uxWEWVQexTyiU40/PqHTtrj+fCXubM9
 bNdctnIbU3XsbxQ1t25z0yl4ch8xgV8I6UKvfG7wjGKrkB2HJPbmJpyWs4F1rJ7VYZAQ
 GYAdQMvkz5vJnruJ5xQa5HglDjygRVQVEOoWwYCoPIc/ptcHyjK0m+kvxXCmNwxlzO8q
 R2lQ==
X-Gm-Message-State: AOAM530AZJmlTO1XPbMY2hP8tbADDgS4LUWgnHjqah99sZpxHd7uh2OF
 ngNYdwHFj2h8zA+VjNKAO0D4d0/5W8k3wUHS
X-Google-Smtp-Source: ABdhPJzSx3nmidUraXL7Q0bwY9tezH7lG9cwiOijB4n65u5xyqTZ55zhqdS6qsaKTfnORT50fZ8Jww==
X-Received: by 2002:a9d:204f:: with SMTP id n73mr12064979ota.68.1614030911794; 
 Mon, 22 Feb 2021 13:55:11 -0800 (PST)
Received: from localhost.localdomain ([208.64.158.253])
 by smtp.gmail.com with ESMTPSA id m11sm3996562oih.34.2021.02.22.13.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 13:55:11 -0800 (PST)
From: Julian Braha <julianbraha@gmail.com>
To: a.hajda@samsung.com
Subject: [PATCH] drivers: gpu: drm: bridge: fix kconfig dependency on
 DRM_KMS_HELPER
Date: Mon, 22 Feb 2021 16:55:02 -0500
Message-Id: <20210222215502.24487-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 Feb 2021 22:23:08 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When DRM_TOSHIBA_TC358762 is enabled and DRM_KMS_HELPER is disabled,
Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for DRM_PANEL_BRIDGE
  Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && DRM_KMS_HELPER [=n]
  Selected by [y]:
  - DRM_TOSHIBA_TC358762 [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && OF [=y]

This is because DRM_TOSHIBA_TC358762 selects DRM_PANEL_BRIDGE,
without depending on or selecting DRM_KMS_HELPER,
despite that config option depending on DRM_KMS_HELPER.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index e4110d6ca7b3..909d0a5643c2 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -183,6 +183,7 @@ config DRM_TOSHIBA_TC358762
 	tristate "TC358762 DSI/DPI bridge"
 	depends on OF
 	select DRM_MIPI_DSI
+	select DRM_KMS_HELPER
 	select DRM_PANEL_BRIDGE
 	help
 	  Toshiba TC358762 DSI/DPI bridge driver.
--
2.27.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
