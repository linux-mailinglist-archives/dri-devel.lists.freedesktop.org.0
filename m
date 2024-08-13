Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 225829502D9
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 12:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD6E10E2E8;
	Tue, 13 Aug 2024 10:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m1EmgxE5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD6810E2E8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 10:51:40 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-428e3129851so39286825e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 03:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723546299; x=1724151099; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FGWIzU9UBPty+CKLYhL1tn5nT2Ew9UDERtQrqlN+ZGk=;
 b=m1EmgxE5jHm8bM5BC6ROF6IngtQOd3AFIqbADfeB478NyxZ+/mf2NVl6WaEa/npRy3
 mPVHknVC93o70N6UA4j+UO0h47vGyl3jefROl2YofCnHPq8XxVcyYBx/9cXCqeKAH/Dk
 SxbpK4HOpDccXSayoN2PaTmauqm6tE0AWlFzpcLkinHuTfVveXw+p6NilD1e+3x62S/S
 FP7oWDTVPN1vcrIW2Qd8o4XgB5Iwfpe0L2Ou8AKB0jrudnXWnu7iG8qHNSu1ugMobYOC
 2gxeiLrWoQGiFERbTbfnNYw+FyxnrRLaSZdJu8MlSzMp65We6/teC25h4TAaQs+gO7tt
 8Dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723546299; x=1724151099;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FGWIzU9UBPty+CKLYhL1tn5nT2Ew9UDERtQrqlN+ZGk=;
 b=weRrlBZNP2PMwbbWSR1MCwRMNJBfHajX8mn1qmIzVDT5ytNCiVgRtok3kN5LYRnoIK
 qq/EVWhla5orkCHjcYletE8uNnquK8Mpri9idk/ZTk9ALQ7YyqZPKfBgoBBDRMweplJv
 0BNtAL4dt1n6cHdNczeYo+SGGzSd8tFuLiVSkRX+Duu4622flVHSPvr3D6nt+qcWj09b
 0FAWtEflEpQbuycgWMyn9whyrSK1c24XTC/KupdeH/FI+99zVP2YFe1FZ4t6IK/9AJjI
 EezGCBpqjfMkIm6iHUgSqzsJnlDCLVfX0YagDTmwlKGCE2nVBcNOLBHyhE5fiKX5xuBf
 nnQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVLir2PBr3j8Zsh21J4r/gl+Eq9pm68Dml+JrantZqV9Jrki6MuRmV85GDv7e9UogirRAACsmlwHdZsXRiZzhNm5+B38i/SS+4Xut5dTJs
X-Gm-Message-State: AOJu0YwPeY9SB7ridOnd+IZcYhLzqdn75LnHOGNWQRh1hVaCoIeKPLin
 5tAll1ptTNhMd/LxyUQGQ6888vugiTDqfjj861I/rNPZVjeQ2JpG
X-Google-Smtp-Source: AGHT+IGWbgy0PBVcisK1FtGfSWK7HffrMzfzFzEI9qfsm2AIfwJhmohkWStvEIZf+7CLpQ6y4FsSEQ==
X-Received: by 2002:a05:600c:4593:b0:428:2502:75b5 with SMTP id
 5b1f17b1804b1-429d480e44emr22261135e9.11.1723546298640; 
 Tue, 13 Aug 2024 03:51:38 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429d877e066sm17290785e9.1.2024.08.13.03.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 03:51:38 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Cc: melissa.srw@gmail.com, mairacanal@riseup.net, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [RFC PATCH 00/17] VKMS: Add configfs support
Date: Tue, 13 Aug 2024 12:44:11 +0200
Message-ID: <20240813105134.17439-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
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

Hi everyone,

This RFC implements support to configure VKMS using configfs.
It allows to:

 - Create multiple devices
 - Configure multiple overlay planes, CRTCs, encoders and
   connectors
 - Enable or disable cursor plane and writeback connector for
   each CRTC
 - Hot-plug/unplug connectors after device creation
 - Disable the creation of the default VKMS instance to be
   able to use only the configfs ones

This work is based on a previous attempt to implement configfs
support by Jim Shargo and Brandon Pollack [1].
I tried to keep the changes as minimal and simple as possible
and addressed Sima's comments on [1].

Currently, there is another RFC by Louis Chauvet [2]. As I
mentioned on his RFC, I'm not trying to push my implementation.
Instead, I think that having 2 implementations will make code
review way easier and I don't mind which implementation is used
as long as we get the feature implemented :)

I'm looking forward to analyzing Louis's implementation, seeing
what the differences are and finding a common solution.

What's missing?

 - DebugFS only works for the default VKMS instance.
   If we want to support it on instances created with configfs
   I'll need to implement it.

Known bugs:

 - When a CRTC is added and removed before device creation, there
   is a vblank warning.
   The issue is caused because vblanks are referenced using the
   CRTC index but, because one of the CRTCs is removed, the
   indices are not consecutives and drm_crtc_vblank_crtc() tries to
   access and invalid index
   I'm not sure if CRTC's indices *must* start at 0 and be
   consecutives or if this is a bug in the drm_crtc_vblank_crtc()
   implementation.

Best wishes,
José Expósito

[1] https://patchwork.kernel.org/project/dri-devel/list/?series=780110&archive=both
[2] https://lore.kernel.org/dri-devel/ZrZZFQW5RiG12ApN@louis-chauvet-laptop/T/#u

José Expósito (17):
  drm/vkms: Extract vkms_config header
  drm/vkms: Move default_config creation to its own function
  drm/vkms: Set device name from vkms_config
  drm/vkms: Allow to configure multiple CRTCs
  drm/vkms: Use managed memory to create encoders
  drm/vkms: Allow to configure multiple encoders
  drm/vkms: Use managed memory to create connectors
  drm/vkms: Allow to configure multiple connectors
  drm/vkms: Allow to configure multiple overlay planes
  drm/vkms: Allow to change connector status
  drm/vkms: Add and remove VKMS instances via configfs
  drm/vkms: Allow to configure multiple CRTCs via configfs
  drm/vkms: Allow to configure multiple encoders via configfs
  drm/vkms: Allow to configure multiple encoders
  drm/vkms: Allow to configure multiple planes via configfs
  drm/vkms: Allow to configure the default device creation
  drm/vkms: Remove completed task from the TODO list

 Documentation/gpu/vkms.rst            | 102 +++-
 drivers/gpu/drm/vkms/Kconfig          |   1 +
 drivers/gpu/drm/vkms/Makefile         |   4 +-
 drivers/gpu/drm/vkms/vkms_composer.c  |  30 +-
 drivers/gpu/drm/vkms/vkms_config.c    | 265 ++++++++++
 drivers/gpu/drm/vkms/vkms_config.h    | 101 ++++
 drivers/gpu/drm/vkms/vkms_configfs.c  | 721 ++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_configfs.h  |   9 +
 drivers/gpu/drm/vkms/vkms_crtc.c      |  99 ++--
 drivers/gpu/drm/vkms/vkms_drv.c       |  75 ++-
 drivers/gpu/drm/vkms/vkms_drv.h       |  52 +-
 drivers/gpu/drm/vkms/vkms_output.c    | 187 ++++---
 drivers/gpu/drm/vkms/vkms_plane.c     |   6 +-
 drivers/gpu/drm/vkms/vkms_writeback.c |  27 +-
 14 files changed, 1464 insertions(+), 215 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_config.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_config.h
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.h

-- 
2.46.0

