Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E333B73B0E2
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 08:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2659A10E0C7;
	Fri, 23 Jun 2023 06:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E5D10E0C7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 06:49:11 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-98862e7e3e6so27619266b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 23:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687502949; x=1690094949;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vjmvjxhnNaI0Yluhjoa/ZS3+/Po3RuAfjAFA/HF9CDc=;
 b=YMsTLPxNkj0lXiRjaRm7ABVWnS/oxM7WrLRG3gM2rL1vVLg/5lzIB4DbYq4zHZ3Vb3
 ZgXkem5khk4MshitB7qsW6jo2tBQLd/X1jKIk5Drt6w+4ufHX6NzzKi9W3F+coYOheR/
 yBQDZi71YuCWN/j66AOwsJYCdbEcCD74W4zssXGvTWhs3rMRSeVaaMo+0rINj9igBqrz
 xZE361i4UWXxziMGnGtEm32O7RlfGCCzWywUw7NA14M8igPn0GFeB/kkK8OH9bt5+qTe
 1i2JqaduBzxZx69zJKVNTwz+BMmbPuHVFchHnCmpWJCCJbHLYibLSfZoaGMt/TT/+rmZ
 SCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687502949; x=1690094949;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vjmvjxhnNaI0Yluhjoa/ZS3+/Po3RuAfjAFA/HF9CDc=;
 b=KPWaqh8qCvKCVbcU6ukOIdUoEyfyi7LDne3PFFwK8YY4yzwZvQ7/x9Psod1uVRhxXP
 GobGOnT7dYHe6bSpf7rdRQQZCReB69yGU/hRjzoDSrmjh7v8+SYOek12HxwkVxIowp3s
 KfkPmTGC64HfSjgEoF/EqHE+pffns7MccXO8RjseAc35Uf2HbaE0yCNmur/LH09z4oj9
 Mij2mZqoT/DpjFgk3W33yCEvQdLoMCg8DRHul3PjHFtG0yWZVpUOrXJI6TYEDA3gZPjF
 TaVrTJIqph5yroARDjrawgCIhY1THX/G5CXAhuLAmM2hsgpKEyUsqb9AXFaRqeksZY8T
 AqvA==
X-Gm-Message-State: AC+VfDy29OyHNgne46n1EQlUwCN3OE5nPPF3hnM0tirL17aztwpnIISG
 y4OAMDPiy0uXKW3NMZ6zDDuvGceXgudZoTw7Q0s=
X-Google-Smtp-Source: ACHHUZ56w/y9lGFMIMkJAnm7tvWQwK9zFXhdBPrNaz+Lkyk6ygciwjIC46SxpEuDOBpegdSvYW9T5uiji00GdV4jRgk=
X-Received: by 2002:a17:907:628c:b0:96a:63d4:24c5 with SMTP id
 nd12-20020a170907628c00b0096a63d424c5mr16581811ejc.77.1687502948843; Thu, 22
 Jun 2023 23:49:08 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 23 Jun 2023 16:48:56 +1000
Message-ID: <CAPM=9twXadK-V1qttzJV3ks8hZu7jY3Nswzw6EgGADnJZF2+fA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.4 final
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Linus,

very quiet last week, just two misc fixes, one dp-mst and one qaic.

Should be all ready for the merge window next week.

Dave.

drm-fixes-2023-06-23:
drm fixes for 6.4 final

qaic:
- dma-buf import fix

dp-mst:
- fix NULL ptr deref
The following changes since commit 45a3e24f65e90a047bef86f927ebdc4c710edaa1:

  Linux 6.4-rc7 (2023-06-18 14:06:27 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-06-23

for you to fetch changes up to 9bd9be5cbaf8a8faa175ef4fba04a5623281debe:

  Merge tag 'drm-misc-fixes-2023-06-21' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2023-06-23
12:16:48 +1000)

----------------------------------------------------------------
drm fixes for 6.4 final

qaic:
- dma-buf import fix

dp-mst:
- fix NULL ptr deref

----------------------------------------------------------------
Dave Airlie (1):
      Merge tag 'drm-misc-fixes-2023-06-21' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Jeff Layton (1):
      drm: use mgr->dev in drm_dbg_kms in drm_dp_add_payload_part2

Pranjal Ramajor Asha Kanojiya (1):
      accel/qaic: Call DRM helper function to destroy prime GEM

 drivers/accel/qaic/qaic_data.c                | 4 ++--
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
