Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB9BB1D904
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 15:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E4010E84B;
	Thu,  7 Aug 2025 13:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="GESx64Ob";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A4610E849
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 13:28:12 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-459ebb6bbdfso6927015e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 06:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1754573291; x=1755178091;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S9NhIkmh6pa4LMtXboVJCwnuCZbZ5X3r44AzxS4gd7g=;
 b=GESx64ObaXVj+VW2zqglKpWUZhQfuy83qODbYalf+yUmcft8+IIkcm7kMad2ajCr2m
 MRpc9zHoMBIvaqAnIoJB5jB0dkR07C08Q04zQj/vSr8XFCDt1SEloogsehjX5adWFK2K
 GGeXdTJuvxEuEqfyLwvWh+VEQHrIfqEONtCxqI6j37FCBfFr1czq0Z1QXm5bz0S+ufbf
 AtkCvbZ4Iomgn4bStRlhRpS8XEvYufCLUGXF1eRKpdwBqEAbr3tcJvy/M/F9FYPF4iaT
 gtq7wBWCG/rC689no1CZEQpPE3CB2fenW8Jxrj6UNNsFupOi1+qDXAZAK4W4Ije3z+vD
 wQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754573291; x=1755178091;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S9NhIkmh6pa4LMtXboVJCwnuCZbZ5X3r44AzxS4gd7g=;
 b=rOLq83L340y0TdQhhmT+lcFts2ayx2cbuqhrj29i5cTjUzi07dmbxSokFsWA2KOu6s
 6Mt+jFYLs3Xgr0wOb1NXwDTMav33kx9DVimr/6qA5zphLYiHn/yJjHYBfvvmHBqx/F2A
 kJrRdP2e1WlZF1x650qzZinRyUJYz2j1eib1oTglBSnByVhuIwhKApXafcy41MLZjopT
 4ezNXsgEbXmsSzDV+yRafvnucS2zkPqqVy3cebvv7gtz5EBgzTCCtXGxpKFRDcTsjvzA
 wYYa64hblEjQosvcnLPnI0y/iRlymqwCtEvW1AiVacaWzR6AkSe1KZveyrwOKxrQdwBf
 FKlw==
X-Gm-Message-State: AOJu0YxnTSCMBn0FL/6e8I4LfTTEBtxWWfCoyEflT5Dbu9bagqociOWj
 8U3BjX4Y4J2NoEyYSGQpbIFnrymHojK1nz07FHv3hFLtvaHNBCcOkrtQ0iOC52l5fmw=
X-Gm-Gg: ASbGncvvci0hCEZdCRcskC45//7Abz6Bcn7vAtbE7s7NoMDs7T9couegFg6jIZ+724Y
 /GC5JnF6ihUPiLphAEXzm4V8wSXzB7uXo/XiGajNCNqgGN31FWUHmJFD+UOXZU7nFvvPpDQ12rk
 M6uzCAB7EFsdIYA4/1+8MJ9/1TOS7xGUzHPfggDnzny+UHRYgc76gUrcd0dha8O1l+UKicDqYK5
 4hmfQPOtEjrKwL4Cgr+G7VgJw5k6sfKJVppOz9LbxbxnePTMrDTCmYMq8F7hkgtsOWPDLJRUNYk
 +IPECZapcG8v5BphYz/2yiKk9KQaCLrbQHKR9HrP5fjtu0wq/jrtZhZdimyARF226sorv8++yVp
 OGQ/2VFQrj6Ak1Q==
X-Google-Smtp-Source: AGHT+IFP5gGyK67ezPZUVxGJG8n6WwFpHK9eRMOuh7S6Y+Uq3tIIh1ArW3G3UuUlE5XlffAyaWQvhg==
X-Received: by 2002:a05:600c:3109:b0:458:bd31:2c35 with SMTP id
 5b1f17b1804b1-459ee8721c3mr25230775e9.25.1754573291068; 
 Thu, 07 Aug 2025 06:28:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-459e6dcdbbbsm38337875e9.7.2025.08.07.06.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 06:28:10 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 0/2] drm: vc4: Add support for additional 10/12/16bit
 YUV plane formats
Date: Thu, 07 Aug 2025 14:28:00 +0100
Message-Id: <20250807-drm-vc4-extra-formats-v2-0-fadc93844551@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOCplGgC/4WNSw6DMAxEr4K8riuS8ild9R4VizQ4xQtI5KAIh
 Lh7Uy7Q1eiNNG92iCRMER7FDkKJI/s5g74UYEczfwh5yAy61HXZ6goHmTDZCmldxKDzMpklonL
 1jZqqU9YqyNsg5Hg9va8+88hx8bKdN0n92n/GpFBh0zpzL+sux/AUE8ObRLbAV+sn6I/j+AJBh
 gajwAAAAA==
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Robert Mader <robert.mader@collabora.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
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

We'd been asked if the S01x YUV formats could be supported on Pi5 as some
software codecs produce them.
The answer was yes, so this patch adds them and the P01x formats.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes in v2:
- Swapped from adding an extra bool hvs6_only to having a min_gen for
  each format (suggested by Maíra)
- Link to v1: https://lore.kernel.org/r/20250724-drm-vc4-extra-formats-v1-1-67fa80597fad@raspberrypi.com

---
Dave Stevenson (2):
      drm/vc4: plane: Flag formats as having a minimum generation
      drm/vc4: plane: Add support for P01[026] and S01[026] formats

 drivers/gpu/drm/vc4/vc4_plane.c | 56 +++++++++++++++++++++++++++++++++++------
 drivers/gpu/drm/vc4/vc4_regs.h  |  9 +++++++
 2 files changed, 58 insertions(+), 7 deletions(-)
---
base-commit: d2b48f2b30f25997a1ae1ad0cefac68c25f8c330
change-id: 20250724-drm-vc4-extra-formats-1f53e6491cc1

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

