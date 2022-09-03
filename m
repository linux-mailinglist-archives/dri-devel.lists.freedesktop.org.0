Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DA15ABD64
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 08:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BD010E77B;
	Sat,  3 Sep 2022 06:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9804110E77B
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Sep 2022 06:06:58 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id d12so3806192plr.6
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Sep 2022 23:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=py5Y0Qaf4PxCG0tcE0IMumOn8gfqYfS1sNrqUe6Qubw=;
 b=Xq8zSPfLEU6xzfhSfzvaThWR+khiq/LaCdQEVJBYFxRsOd7JjYMwVkFisU/8H5uU7F
 nUiGkdCFO4ZGUGj61sMPG4eaeGAK/vhG4KAuzSJ4vrE3q0j2yw+JMzItB8U5/5YEHon2
 ghlxjfWLzyYOKWh5MX1I3uUA7mBZ4GwvOx6eU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=py5Y0Qaf4PxCG0tcE0IMumOn8gfqYfS1sNrqUe6Qubw=;
 b=E8eEb014aAOYhT9CMheQBRl2WWp3yeebs1dt3UOQxPvQQd/3LFQ1zQYbLYLNZXVf3y
 ypKYfV7VD4fXGn9nIrB/w147bxzs0zFmxwnP0H/f2maNJ/3mWzwxmcFezAD9Yywj6OEi
 ieD6+HjkjGhku2Wkw90tpjv0AP2WSmfZrZLcz6ohq7cF8fG1t6BSlxd6BcRFQvyX4XEv
 7iojLum7jbQB4pu21HmaCgA/RrNuclphZEWViUbtv+bBz1Sp6xLrJeHeKhIJw7qeoJbN
 Olsc0hjWDMjSGUpUE2NmRrBvgNwEwuJT9KosqFGt5E1ms6VCitPK81B/i2UpYa5OmxA2
 JOKw==
X-Gm-Message-State: ACgBeo08+7ntMtsq7oVTonV0QlX0t70Dmntm1puLgWJI2KkFoIq4pP2O
 OFa54BoG8MZOIpY+gcxbWPluFA==
X-Google-Smtp-Source: AA6agR7/u/4EbZMJfQ06VEfBmYTGMFsMtuHoiMGb+/ZUcagUJB8L4821HZEMG+HDPmdtHUYWwq3xtQ==
X-Received: by 2002:a17:903:22c4:b0:175:41bc:9596 with SMTP id
 y4-20020a17090322c400b0017541bc9596mr16512413plg.112.1662185218128; 
 Fri, 02 Sep 2022 23:06:58 -0700 (PDT)
Received: from localhost.localdomain ([50.45.132.243])
 by smtp.gmail.com with ESMTPSA id
 v28-20020aa799dc000000b00537ab89c66csm3048793pfi.143.2022.09.02.23.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Sep 2022 23:06:57 -0700 (PDT)
From: Doug Brown <doug@schmorgal.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/2] drm/etnaviv: GC300 fixes
Date: Fri,  2 Sep 2022 23:05:56 -0700
Message-Id: <20220903060558.55167-1-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 03 Sep 2022 06:10:40 +0000
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

I was a little unsure of the "correct" way to do the fixup to the power
register offsets. I implemented the change in gpu_write and gpu_read,
but if someone has a better idea I would be happy to do it differently.

Doug Brown (2):
  drm/etnaviv: add missing quirks for GC300
  drm/etnaviv: fix power register offset on GC300

 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 11 +++++++++--
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h | 16 ++++++++++++++--
 2 files changed, 23 insertions(+), 4 deletions(-)

-- 
2.25.1

