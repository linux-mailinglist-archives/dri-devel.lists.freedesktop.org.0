Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B35B24238E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 03:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E576E888;
	Wed, 12 Aug 2020 01:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45D36E888
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 01:00:00 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l2so452417wrc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 18:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=VikuBdcAHg+0vtlQUX8EZkd3qJ5zfXzHomxqGlBAveg=;
 b=q7c/84CcN2f6s25ATtA1utzBb/AyLg/agUsQBt2K67xO/YbDORfIEw7mrCdyUWLPzF
 nRJ7tta9PNHpodYVg3JAwIyGHZHUxNfWZ8rzwuBsgyf8coDJsTpOvo4CT6AFBGGIgwJm
 fPEsONmzxVYfJQ9J28prXOQWCBiOnh6fokYZzY7GYK1Txk0Nadhg2F7KI0ker5vgec93
 NJSpXocMsyeV6ocHZpwPT+dKyhOhJ6DsDrappKqlJ873FKZoH4EX2HVjbkvhw60KpkQu
 /IzJ5K+w5bc+rIIrWEl5CiJ5i3eU3HWrnxekkLT1lb/Hqfd5OTqPgJTFFDnLomqHVaHN
 NFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=VikuBdcAHg+0vtlQUX8EZkd3qJ5zfXzHomxqGlBAveg=;
 b=IJsjlv9al6Ip1DmALw9+34nqRXoZ/4wMzWsRoKDhXMsbDbVXr6xVBfZT9bppDxEIoj
 vq20lpJzEN5WFUFUJFZWUgdTfrfPbz4qcPbfylJU3VmjlS//Fj6wvdg/SUtBGCUyIDVN
 VGdAWZiU30ATDTdp6QzoIuYpgZpDVi95eTQ/BZj7uuQywMuFGwN8dgTrKtd3Tj1AxzTG
 3YYQ5JsjD93IInQ4NTb5PQTWPfzEWBiCUT9H9AXawHiUgFNmytCoIDY9Ol4j8lE1mbp3
 wg4s85Qm7B0EvWaSzVVVQOgZ0jcUQneTyXJwTkRoBJz3bxxjqfMYfTXaJNBPZ73yw+tg
 +wbQ==
X-Gm-Message-State: AOAM532KADMMIfKuBpfogjE0K3VoCNhJ9SNKRe/jBjtXJ7V8Smt5HRQY
 TsqBVl1eMG84q22WurwqXcFmFBdI
X-Google-Smtp-Source: ABdhPJwCkf9MmaM5KxG7177K4e9Y/CRBx2Yd8LriDE/wRtNxOArX1tMhwWWTcoTC5v5bb+K5f0mJew==
X-Received: by 2002:a5d:5048:: with SMTP id h8mr610962wrt.424.1597193999066;
 Tue, 11 Aug 2020 17:59:59 -0700 (PDT)
Received: from sroland-t5810.vmware.com (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id i4sm1024884wrw.26.2020.08.11.17.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 17:59:58 -0700 (PDT)
From: "Roland Scheidegger (VMware)" <rscheidegger.oss@gmail.com>
To: dri-devel@lists.freedesktop.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [git pull] vmwgfx-next-5.9
Date: Wed, 12 Aug 2020 02:59:41 +0200
Message-Id: <20200812005941.19465-1-rscheidegger.oss@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-graphics-maintainer@vmware.com,
 Roland Scheidegger <rscheidegger.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dave, Daniel,

vmwgfx fixes pull for 5.9.
The drm_mode_config_reset patches are very important fixing a recently
introduced kernel crash, the others fix various older issues which are
a bit less serious in practice.
(Although still pending a solution for the other crash introduced by
2ddef17678bc2ea1d20517dd2b4ed4aa967ffa8b.)

The following changes since commit dc100bc8fae59aafd2ea2e1a1a43ef1f65f8a8bc:

  Merge tag 'drm-msm-next-2020-07-30' of https://gitlab.freedesktop.org/drm/msm into drm-next (2020-08-05 08:05:31 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~sroland/linux vmwgfx-next-5.9

for you to fetch changes up to e97644ebcdc83854e6e29e96285b25042445c28c:

  drm/vmwgfx: fix spelling mistake "Cant" -> "Can't" (2020-08-11 03:16:03 +0200)

----------------------------------------------------------------
Colin Ian King (2):
      drm/vmwgfx: fix spelling mistake "Cound" -> "Could"
      drm/vmwgfx: fix spelling mistake "Cant" -> "Can't"

Dan Carpenter (2):
      drm/vmwgfx: Use correct vmw_legacy_display_unit pointer
      drm/vmwgfx: Fix two list_for_each loop exit tests

Daniel Vetter (1):
      drm/vmwgfx/stdu: Use drm_mode_config_reset

Gustavo A. R. Silva (1):
      drm/vmwgfx: Use struct_size() helper

Roland Scheidegger (2):
      drm/vmwgfx/sou: Use drm_mode_config_reset
      drm/vmwgfx/ldu: Use drm_mode_config_reset

 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c     | 10 +++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c     | 13 ++++---------
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c    |  9 ++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c    |  9 ++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c |  2 +-
 6 files changed, 15 insertions(+), 30 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
