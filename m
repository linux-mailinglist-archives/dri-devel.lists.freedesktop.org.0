Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A805AFA2E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 04:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D7D10E076;
	Wed,  7 Sep 2022 02:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654CD10E07C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 02:48:27 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id r12so4027594pfl.10
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 19:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=074Tcwe4zC2OIqY0l8+2gc7olupss3e7doklDpLoTRE=;
 b=WrGx5KrhvaP81j5TnplPjOeT45zI7wm09GwEb9gzTS7E4vSrpstW8aVjSaE18Bgm1+
 EZRrn0/Tx9kZ3n4dekAH7dyP3hiSgYr6Kak51N1NQk1WaEq6olAWsqIt97ZStEtYll1p
 pfLr7RD92H7ZE4S9l/zoK4vcAkzZ3XjNVQNZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=074Tcwe4zC2OIqY0l8+2gc7olupss3e7doklDpLoTRE=;
 b=BEftIsP/Rsu3TyfmdQVCBIImx8ZgP/7U9xK7JkOw9JWS2aWBC06MxvU+NNI0zDLA7Q
 NoHcgy+bPzR90n4E2ke5T65GvRFzZeHRg65L5P9SfPWlsrhlNnHXLqx1WOrNF7CsLtDT
 6lCIqyCHF2/ww8KRAUUV+6jOJj/74LqHXxnKi6sKTmeaHgr6O4Zfy5XieSdxaNIfgKuW
 +vfBVb/2yWxkzucA7r3zVI/YGPJvpEz+XkL6A1ahx2PLQWxI1KTXVAuoJIYzgPL3CE+T
 NXg72VfLQEkDLeBICrGmzmExG+o0OUFS09zzVZLkrj4M1Zc55ssb4jFAtMuIcmkQfRLg
 wNqw==
X-Gm-Message-State: ACgBeo1+4vyhWMKZznk5kliDBtoF0+ct4yltp3Cohn38YZEUvMo8BQJi
 39Y9wiUZDNGWytJqxImDz0KJfg==
X-Google-Smtp-Source: AA6agR5lz1lUwMq18VYBZFqYbVEG08TX3JZ33vD1/EDiz9HVbuIn2QDG9hpXP1Pzyc9khjR0ZLuCng==
X-Received: by 2002:a63:81c1:0:b0:434:aeab:7b42 with SMTP id
 t184-20020a6381c1000000b00434aeab7b42mr1493973pgd.619.1662518906890; 
 Tue, 06 Sep 2022 19:48:26 -0700 (PDT)
Received: from localhost.localdomain ([50.45.132.243])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a170902f55000b001754064ac31sm10733963plf.280.2022.09.06.19.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 19:48:26 -0700 (PDT)
From: Doug Brown <doug@schmorgal.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/2] drm/etnaviv: GC300 fixes
Date: Tue,  6 Sep 2022 19:47:17 -0700
Message-Id: <20220907024719.36478-1-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Doug Brown <doug@schmorgal.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series contains a few special cases for supporting the GC300
properly. These were found in the drivers in the vivante_kernel_drivers
repository. These changes were tested on a PXA168 with GC300 revision
0x2201 (date 0x20080814, time 0x12051100), which already has an existing
special case in the driver to modify the revision to 0x1051.

Changes since v1:
- Move power register address remapping to new gpu_read_power and
  gpu_write_power accessors instead of modifying gpu_read and gpu_write.

Doug Brown (2):
  drm/etnaviv: add missing quirks for GC300
  drm/etnaviv: fix power register offset on GC300

 drivers/gpu/drm/etnaviv/etnaviv_dump.c |  9 ++++++--
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c  | 31 ++++++++++++++++----------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h  | 21 +++++++++++++++++
 3 files changed, 47 insertions(+), 14 deletions(-)

-- 
2.25.1

