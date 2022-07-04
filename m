Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2E9566972
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422D610F7F9;
	Tue,  5 Jul 2022 11:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B4910E00B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 02:52:36 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 o31-20020a17090a0a2200b001ef7bd037bbso2899075pjo.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jul 2022 19:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tmhuCm9brp5mt6f3uHVK43St1tlnXn9UsMtpRIeG8p8=;
 b=A7Ff3bdAfbT0D0hxGYGcPVbr5FEd6Br1hgRpsx8LeLn/64N69ac7HZTN8G5Ae6VFHp
 5cJlHEB9DTAKorUrMBnEXVX7fGdgRbazNL5gk2nZiq3xjoy67V8zEPVloeUenID2bSKa
 KBGZS1dvZvY/8d6Ks3CkTXM3j2Hnb0p1tPRXTH+IbT3QKZNjvxn4VDXJ7FweZj4mDv/7
 tNV2JFmmA80Dhrsa0zvZNFrB+KXnPGvJolcnSYRjLgqeIrvoQbjtxWKPGg5F1L0If9j6
 C+6fy23yRjQ/qGljugVz1u6+BG5vNbthSw3+8Jtq2YB/UjWe9Ksh/rCDLLmFiSI0MHWZ
 KQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tmhuCm9brp5mt6f3uHVK43St1tlnXn9UsMtpRIeG8p8=;
 b=LLB0nA1rNq+rk3qRqoVqP0dLuj/l6OMKDB+6xwCspmsZaoFGMMaU69itZ6EqATdLgO
 NpzufxsHXjABdmfgoWEUDnCdFpkKNn4fZKyv8twapB9Gcdunok20xBEMo0TpFmiQebWd
 bO/a1v6JYc+RCG7/rAz2jzKUNYOZH2ZK64AEh+asIDw4frO8GYppFYlOoLyxTj6rNpJq
 LILtcNKUvP6orXPXqZa0NIYmdv1aZUEdWd2vHVQcK5Z/3mssLOJUTE3pp1WGgn9zRPuw
 Gm7aAoSOtHNNPhZFI6+g9Wh+ZS3oUMPAtS6VEDcWkleACB6AxhHeK/+sFo9WdEVxsv39
 msEQ==
X-Gm-Message-State: AJIora+qvpuo4FgZgVtt8Mj+Ysrlf32gD8fvf3YJ4m/NG95f37Xq8trr
 GgGXTeYTdsD4j27Yd3v6T7YcnG923B61p7KC
X-Google-Smtp-Source: AGRyM1vor7udaTpunpUWuttCOhbXPTjt5BlCE4py0pRe1SY/dk9ocxVkeuPRko4Gjpx/LhEc+2mq6w==
X-Received: by 2002:a17:902:8f89:b0:168:d336:ddba with SMTP id
 z9-20020a1709028f8900b00168d336ddbamr32355327plo.1.1656903155852; 
 Sun, 03 Jul 2022 19:52:35 -0700 (PDT)
Received: from taki-u2.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a634e4b000000b004118fd18476sm8730813pgl.60.2022.07.03.19.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 19:52:35 -0700 (PDT)
From: Takanari Hayama <taki@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] Add DRM pixel blend mode support to R-Car DU
Date: Mon,  4 Jul 2022 11:52:28 +0900
Message-Id: <20220704025231.3911138-1-taki@igel.co.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 05 Jul 2022 07:31:09 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham+renesas@ideasonboard.com,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The series of patches adds support for DRM pixel blend mode to R-Car DU.
The current R-Car DU implicitly supports "Coverage" only.

Unfortunately, this changes the default blending mode of R-Car DU to
"Pre-multiplied" which is the default when pixel blend mode is
supported.

Takanari Hayama (3):
  media: vsp1: save pixel alpha info in vsp1_rwpf
  media: vsp1: add blend mode support
  drm: rcar-du: Add DRM blend mode support

 drivers/gpu/drm/rcar-du/rcar_du_vsp.c           | 17 +++++++++++++++++
 drivers/media/platform/renesas/vsp1/vsp1_drm.c  | 12 ++++++++++++
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c  |  6 +++---
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.h |  2 ++
 include/media/vsp1.h                            | 14 ++++++++++++++
 5 files changed, 48 insertions(+), 3 deletions(-)

-- 
2.25.1

