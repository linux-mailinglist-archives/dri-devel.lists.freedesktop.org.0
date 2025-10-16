Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7008FBE280D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 11:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A074F10E9A0;
	Thu, 16 Oct 2025 09:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="wTf9sNOH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88BB10E9A0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 09:50:51 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-3306eb96da1so396156a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 02:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1760608251; x=1761213051; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1UqL1IWSrCrB8SZs0M+f9GgpD3kKZ3YvqrOYctBtGCw=;
 b=wTf9sNOH7cMuLsAo7tTvrcQMl64wXQNjzw/v65Y4ZQve/jzfNUo2J750UA1s04X2FO
 ZLXIvGTJkQ7c2ciLwKUKqQ5JZv6BcsS1nmb8pYysitBmLTKB2BVU6iSvTudF66eLkJkj
 XJ9WsM0WONFb2pxGZyngBomHiQYVvT7cCRnKyQsraSvHquAMOfYC70YKj/Z8FcOK2XtX
 7LOptVD8/SAn2O2g1MBtNDjXyDejXzKuTXQIzfQlWFe+78hdQHHEX5VlLtkxCvRXya4u
 UPUunC3C+OaGDVe9BbKHLguQi5N3iuXZ4zy6HPRdn48Qswihfw4hyQ8/pbK9YPk7UgU5
 0APA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760608251; x=1761213051;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1UqL1IWSrCrB8SZs0M+f9GgpD3kKZ3YvqrOYctBtGCw=;
 b=e1vRnr9l8X9Eb15of31RxkqGl2sff8F2Csvw6F52wndMuPomwdala6t2XzNyCQz5qb
 vMKt+DuEmucCQJItGBcXYL3xbBSoFSc6xBG8dYVsT/i69JZQt49N/lgc6pNaL40taj4T
 ZZVEYribmktNyhTkEzh4+sHk713IyayT9rVCCd2AU+/EZEOunqSIE+mKE6emSeZMUO6O
 0F2SwfWWOqJyDTkYoMFBujdJ5R8FlPTvoKoFaP/c9zhv+vKF2ucmWBZalV4gmptDh2Hh
 fKTIIJMlsoply6Hg42wpOgxD4YqqHBLO8WYTAl5iuj7C1B3SjWi0h/xP5Ysp+RKpe0qT
 FwBw==
X-Gm-Message-State: AOJu0Yyh4g++13vOmR6FofWmfX6pe3F45H7hYbq+VV48aNe+Y0/BiEdw
 I4yW2gi7FAxHR8Ob9kCtaT37CKg4+vgHyOIv7sodGFtr3w1zIINAQvxq3q0N2/bUJXo=
X-Gm-Gg: ASbGnctXWrO0fib/qvXY9ipU7u4i5HzBO0JpCrIH0/ti9McqVtcmt3JKPqDOuDZsVYX
 Lw2x6CXoPRqgiNHJN+oorJYCSNjSZibaswEwhToIwTRfKYlKJoejpqXYZlpI/kyHvRgUup60on/
 W8m62Yok2PBf/3ebOtrdMgCRlOWIJDTRbhz5kwYgSviqzUTpPJZD1MOdlVLVi7A0GV9+A6gMSC7
 SDLnOlBtS54oAgD+tiDS2EPtZVkUjxvllUcTTg9nVwfJoyjyimHkd01FrskvAy+TjNzIHi8oHHd
 08YNKQ8B1yg0M0jLomAOkz3Rg1eaTa1VmF+f/aeqmR1qMJt9JzwvJLdRCXN2g2w85Wsq0Hxt6Ea
 b7aosJr+uaXOeGuGh245iDNy4hiSMJmhYdLgMBx+PfsjzPfQMruAWGmo8yp9eIM4FKBRlrI01bi
 YuKqsj3+4OK6sMPMkwbAZzwT2i1WW8w1KfyN5rnaXQMEv2nO6XC2dYHK1h/Q==
X-Google-Smtp-Source: AGHT+IHds62hDOWB8Db/Nb46keQgSIaK4qyBY+XsAGxqUcA+ucqFv6LqUgHKR4GZ/2/Bst1JZdDjzw==
X-Received: by 2002:a17:90a:e7d2:b0:32d:d408:e86 with SMTP id
 98e67ed59e1d1-33b511172d4mr45695437a91.7.1760608251293; 
 Thu, 16 Oct 2025 02:50:51 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33bb6519421sm1272402a91.1.2025.10.16.02.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 02:50:50 -0700 (PDT)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v3 0/2] drm/panel: Add Ilitek IL79900A controller and bindings
Date: Thu, 16 Oct 2025 17:50:41 +0800
Message-Id: <20251016095043.1694736-1-yelangyan@huaqin.corp-partner.google.com>
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

This series adds device tree bindings and a DRM panel driver for
the Ilitek IL79900A MIPI-DSI LCD controller, which is used in the
Tianma TL121BVMS07-00 12.1-inch panel.

Changes in v3:
- PATCH 1/2: Fix DT schema error for `backlight` property.
- PATCH 2/2: Address review feedback (use mipi_dsi_msleep/_multi, move init sequence to mode, minor cleanups).
- Link to v2: https://lore.kernel.org/all/20251010093751.2793492-1-yelangyan@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 1/2: Address Rob Herring’s review comments and align with panel-common.yaml conventions.
- PATCH 2/2: Rename driver to panel-ilitek-il79900a and align naming and structure with existing Ilitek panel drivers.
- Link to v1: https://lore.kernel.org/all/20250930075044.1368134-1-yelangyan@huaqin.corp-partner.google.com/

Langyan Ye (2):
  dt-bindings: display: panel: Add Tianma TL121BVMS07-00 panel
  drm/panel: Add driver for Ilitek IL79900A-based panels

 .../display/panel/ilitek,il79900a.yaml        |  66 ++++
 drivers/gpu/drm/panel/panel-ilitek-il79900a.c | 358 ++++++++++++++++++
 2 files changed, 424 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-il79900a.c

-- 
2.34.1

