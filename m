Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B3883E317
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 21:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DAB410FE1C;
	Fri, 26 Jan 2024 20:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B8910FE1C
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 20:09:12 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-59a0d71b0fdso300056eaf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 12:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1706299691; x=1706904491;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l5yVEX+DQavjWZqEF/n5hw9ZhRiUZlhI2LlED1pucFI=;
 b=HSfzesFyDbKOTwilaCruINAUoUpgSGA5mlezqX56PoUA04Tm0gb/Bvt9EGTRTE5sjc
 ERnVl4c/8anM3VDJmOrRJKjygpuxcrKpG4s1L0d2chu4Wp39nbAcfwgz250f6VVM8q92
 MXl/1dc0W3VJCTF9BIQTDgaQ8/c9w+Yu4lYF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706299691; x=1706904491;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l5yVEX+DQavjWZqEF/n5hw9ZhRiUZlhI2LlED1pucFI=;
 b=Ycf08KC/nnRXD2FzkH2we0M2LZWd8Q0qtDEtGFWEuDcT1P/Xx6IXQ9e0ym2t64GXXK
 g5mpHjA2Yedil0dDxi59KLrYEnKq8oI5GIFHVx8SHM0Cy9sIamr4SqfZmJPobIX6leL/
 lgnUMkoUYgaZhVsHRo52Wvt7t8dXg5XydZOIF9yZa6Vv7BoqOb5nEo+XR9L3/fbLLALB
 gbiyvkUBJZM42fQA5YxeDdsdUT59LmHJwHC7GCkHW4YUxDcuahUn+0uM/sMX7kEL1hMx
 t9uyquAMnrozACcSnuPWI8tR42WmJGi86ur8F0haHMp/Bw5zayhfuDzEeH1hV1Fej3vx
 81JA==
X-Gm-Message-State: AOJu0Yw1e4+IEdrrbqtFBuKQnZ6g/BDhDY977f4PPh1zsNdLw1InwOum
 sD1GHze1uP3/0loUDF3QMHfIV6YHpp3hGWizvMe0hTknQYJpMgSSbdIS9Y4fRnWGNj0zaqWAOhB
 XabdbKYhLTx952kWVu6IqEBpFMAJRMYB+cj4sMLOvcuJdeps7FDuJaXttxx1eX3k66h0gwprxiM
 46IGh8UduineJj8W+VLRsyfGm2XiffwSM3NPxr0VBQCntQ3Kx52A==
X-Google-Smtp-Source: AGHT+IFM+20GG8NkvlfQEEXcbTN4PE+Qf0keDqS6PYYC79OO0IGHdGdWgZNSbEteW2keCwLPYIqeOA==
X-Received: by 2002:a4a:d309:0:b0:599:f42b:9f5d with SMTP id
 g9-20020a4ad309000000b00599f42b9f5dmr209475oos.2.1706299691079; 
 Fri, 26 Jan 2024 12:08:11 -0800 (PST)
Received: from vertex.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a4abd87000000b00599f5c2c052sm358161oop.8.2024.01.26.12.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 12:08:10 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] drm/vmwgfx: Various kms related fixes
Date: Fri, 26 Jan 2024 15:07:59 -0500
Message-Id: <20240126200804.732454-1-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A small backlogged series with various fixes mostly related to kms.

Use the drm internal kms modelist instead of rolling out own version and
fix two issues related to cursor handling.

Maaz's patches were already on dri-devel but patchworks doesn't deal
very well with changes in email address and the patches needed
s/vmware.com/broadcom.com/ so those patches are being resent here to
fix patchworks handling of them.

Maaz Mombasawala (2):
  drm/vmwgfx: Make all surfaces shareable
  drm/vmwgfx: Add SPDX header to vmwgfx_drm.h

Martin Krastev (2):
  drm/vmwgfx: Refactor drm connector probing for display modes
  drm/vmwgfx: Fix vmw_du_get_cursor_mob fencing of newly-created MOBs

Zack Rusin (1):
  drm/vmwgfx: Fix the lifetime of the bo cursor memory

 drivers/gpu/drm/vmwgfx/ttm_object.c     |   6 +-
 drivers/gpu/drm/vmwgfx/ttm_object.h     |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c     | 296 ++++++++----------------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h     |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c     |   5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c    |   5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c    |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c |  17 +-
 include/uapi/drm/vmwgfx_drm.h           |   6 +-
 9 files changed, 126 insertions(+), 222 deletions(-)

-- 
2.40.1

