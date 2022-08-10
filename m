Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA5358E8E6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 10:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4622CF2640;
	Wed, 10 Aug 2022 08:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88365F25C2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 08:37:20 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id m2so13655141pls.4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 01:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=+8Zc8rYa4ZxEs+Ek2Veiq0PdTVu1ampOcuivxciZFJ0=;
 b=4P/ZUbIZjm73r78BXFNP71nshS+JXMhpGurRsQ6u30PLvyV1/jSisEnt/wjw70iAKt
 dbh2AvaMkGOastO2TZ257O6ZVKxQWDR0KL5qIXa0Mx9LCRikzecreU8jOwNx+uM4neCb
 BpEyCCUL2HRor7KNQw1a3Nz/Wo/IG2uALiV+QuAgudl+/4gw9szJq4W0WMYtd9pZNEUM
 FzU9L1H0ONwYmZXIwHYOhU3vqV5WoQGf0klR64xK4iuiFGTS66Ydrwv1JPT3ojk8z41+
 xM51EvsgwdoJtAakJT1+9ueQ9RJl2T9JgoRafmqQIMP+PBz2OaDffRI8Ytka40vffp4B
 FBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=+8Zc8rYa4ZxEs+Ek2Veiq0PdTVu1ampOcuivxciZFJ0=;
 b=NuTREeMTVAI1NFFfp6XR2eb4gVG4IttdEPn41toeNNyGjpALmMLhFI+J5L3z1+BWYy
 fIBJmsX9CCYnjJD0yDxAO+e3vO8NDEhCZkenh2Ks3XZF8Pd+6vXKU4wPlBSuenE3XPCp
 6Zu4RNc5OQW28IP/RuosSaH2VP/0KKKdNBY0qwf42cvaOR7wTjSlFbAK68ijFydAk45J
 8YOfFMuLVhXJuCoto0orEkQITWlLXkK0ujwpJygdL7xGx9Aezy7WhtMAILqPNsQWz8Ft
 emGHrQuMW7aYQc3azQCRIhtO5f/M1zRnetGJgpNVDnM0IqKO7Cfg5zSybQD3rPczMttb
 NxnQ==
X-Gm-Message-State: ACgBeo1BXHuxpAHbaiZiYXBT2yK2JG+DZYS3qbWhZbcEQ0Yt1Wtl+eGz
 grLKGNaQX3MhxQU3fn+EUg6l/gSM+h5eGg==
X-Google-Smtp-Source: AA6agR7L3QFrswCxE+ExkFevYhjKCaNMiyRwotJVapBpfZHxZ7APHHcKeHV4wMY7XBjhMm3S/Q8xBQ==
X-Received: by 2002:a17:902:f548:b0:16f:9649:be69 with SMTP id
 h8-20020a170902f54800b0016f9649be69mr21690874plf.134.1660120639828; 
 Wed, 10 Aug 2022 01:37:19 -0700 (PDT)
Received: from taki-u2.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 f1-20020aa79681000000b0052d63fb109asm1323607pfk.20.2022.08.10.01.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 01:37:19 -0700 (PDT)
From: Takanari Hayama <taki@igel.co.jp>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/3] Add DRM pixel blend mode support to R-Car DU
Date: Wed, 10 Aug 2022 17:37:08 +0900
Message-Id: <20220810083711.219642-1-taki@igel.co.jp>
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
Cc: Takanari Hayama <taki@igel.co.jp>, airlied@linux.ie,
 kieran.bingham+renesas@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 mchehab@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The series of patches adds support for DRM pixel blend mode to R-Car DU
driver. The current R-Car DU implicitly supports "Coverage" only.

Unfortunately, this changes the default blending mode of R-Car DU to
"Pre-multiplied" which is the default when pixel blend mode is
supported.

v2:
 vsp1:
 - Add a premult flag instead of blend mode enum
 rcar-du:
 - Support DRM_MODE_BLEND_PREMULTI via the premult flag
 - Support DRM_MODE_BLEND_PIXEL_NONE via format override [1]

[1] https://lore.kernel.org/linux-renesas-soc/20220704025231.3911138-1-taki@igel.co.jp/T/#m3351cb5965cd5bf2d416fa5ca5007773260205bd

Takanari Hayama (3):
  media: vsp1: add premultiplied alpha support
  drm: rcar-du: Add DRM_MODE_BLEND_PREMULTI support
  drm: rcar-du: Add DRM_MODE_BLEND_PIXEL_NONE support

 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         | 26 ++++++++++++++++++-
 .../media/platform/renesas/vsp1/vsp1_drm.c    |  2 ++
 include/media/vsp1.h                          |  2 ++
 3 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.25.1

