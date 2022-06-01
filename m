Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 845E253A034
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF39110E956;
	Wed,  1 Jun 2022 09:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11DF10E956
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:23:14 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id be31so1700383lfb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 02:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/r6NqWyKwkAvlnZuK9JbpQgMnctzAS4b6Fwh8DKIHWM=;
 b=XsuS66MQtvsfW1Fp0qnPaiQFk4rd0pQTnWDDwoYcQtnHJoOfwq5Ap7HA5DHqdmCjSk
 /nuTNiuoPPzaIEFjVdq286NWw2u0xQMdIZ2XRmxIK82EOHsaVJCNkIxQ9okrcPya12Lj
 E+cfQ7gAiTwkFxV/ORcVAVjOYgXIPO6XgU9gzD5hYGCzPGbNSDeMBThbeTTe0OQYVAs4
 Yj4fr+yD68R0bHJXbDQSz86dS3psBQNCAThAWI5YZnzmlqDM/PtvjbzVN78hGYL99gSv
 N/kG+UR/akQKMzi+e4Gt6L7JLFub9pUyoI7uKnXcoFsCmKAAiUM94E0uNC16gLtpZTL9
 K9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/r6NqWyKwkAvlnZuK9JbpQgMnctzAS4b6Fwh8DKIHWM=;
 b=pl+kUvdXszgXAV+VV4V2RrbwzuvYFLwO5r/C7pHjPn9qNgGDlYY0tWArGIpdbx49Fh
 R12oVh4xLlAih4F4n8G0PQ8tqXku9RENY+U06MBuT6GDbFRyC/TPSlifEcABj+XAbnt/
 yMDse80rgHVn72+VnsTG7/U6LyJJDjLkQCKW35MqAzOQc7B2O9IYQL1U/5dyDW8vOBvo
 I6nb8oOK8AiDJFJe/G5IU6uL4fWeAs2gmBXMGXkpH9irZOMLDwfuS0V0Qd67jCxsQpvv
 BeoYu1n8FFHXRHiO+Lov8Rjn3hk6uF/g+ApLn1PcAyUpiM0VkAIiVWo+qT2B1HFlL3xJ
 GONA==
X-Gm-Message-State: AOAM5311REe1UrnRNj3b0PhlabwnAyWszbDe0HLg5p+ein3jpvnSYgRw
 TUpCxKMXK/H2c1eFpcEXC/61JiiAt1s=
X-Google-Smtp-Source: ABdhPJy1JO33OBlDO+fFa8soEwC0Zi2fPaAZjd2OsohQYjNSIDMs0+VVehjpGioD0QtxvtgvWm0LpA==
X-Received: by 2002:a05:6512:910:b0:478:584d:33e8 with SMTP id
 e16-20020a056512091000b00478584d33e8mr41172203lft.135.1654075392749; 
 Wed, 01 Jun 2022 02:23:12 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 z14-20020a056512308e00b00478f60ca3a4sm257065lfd.56.2022.06.01.02.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 02:23:12 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/8] Cleanup use of ddc i2c buses
Date: Wed,  1 Jun 2022 11:23:03 +0200
Message-Id: <20220601092311.22648-1-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.36.1
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
Cc: tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The various chips have slight differences in how they handle and store
ddc i2c buses. This series tries to put the main i2c adapter for ddc
into the drm_connector->ddc pointer. This makes it easier to unify the
code for the different encoders in upcoming series. Oaktrail HDMI and
PSB SDVO are not included.

Patrik Jakobsson (8):
  drm/gma500: Use gma_ prefix for our i2c abstraction
  drm/gma500: Make gma_i2c_chan a subclass of i2c_adapter
  drm/gma500: Make cdv lvds use ddc adapter from drm_connector
  drm/gma500: Make cdv hdmi use ddc adapter from drm_connector
  drm/gma500: Make psb lvds use ddc adapter from drm_connector
  drm/gma500: Make cdv crt use ddc adapter from drm_connector
  drm/gma500: Make oaktrail lvds use ddc adapter from drm_connector
  drm/gma500: Read EDID from the correct i2c adapter

 drivers/gpu/drm/gma500/cdv_intel_crt.c     | 47 ++++++-----
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c    | 98 +++++++++++-----------
 drivers/gpu/drm/gma500/cdv_intel_lvds.c    | 80 ++++++++----------
 drivers/gpu/drm/gma500/intel_i2c.c         | 36 ++++----
 drivers/gpu/drm/gma500/oaktrail_lvds.c     | 50 ++++++-----
 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c | 36 ++++----
 drivers/gpu/drm/gma500/psb_drv.h           |  2 +-
 drivers/gpu/drm/gma500/psb_intel_drv.h     | 24 +++---
 drivers/gpu/drm/gma500/psb_intel_lvds.c    | 86 +++++++++----------
 9 files changed, 237 insertions(+), 222 deletions(-)

-- 
2.36.1

