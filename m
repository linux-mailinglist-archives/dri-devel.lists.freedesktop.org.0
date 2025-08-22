Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1199EB31B85
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 16:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024F510EB0E;
	Fri, 22 Aug 2025 14:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="tZxr5Y15";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B25810EB0E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 14:30:09 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-4b121dc259cso16822791cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 07:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1755873008; x=1756477808;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+g0RHJlTrkgLw/H7weUsUlBTzklhg4XVgzVbYgiP3Vc=;
 b=tZxr5Y15EQsbbMCjmDpfzS7+jQXxiFsUpyneR+bkR8V7h6Rf9r3+iuI5C0C01fFs/7
 itGHbAWZTQ5vttO+xfgcGQPm4E9T6HMSexy0safKfg2r6l9IwBJfPThC4GI4uMx02doY
 4gCNWhY00s4NxxX2xxZjhQ5pQAiQkHhtER02annzTmbVmc7vhYO1AvawjUlT5rbEkQOc
 din4+dwy4SUDJffYnSjW7TQx+sGk4hqDvNDBNGz9cqf6wbxn75K2meJG8Nl965lbVQvW
 WxvzIwO442gkLLdCV8PYBDtKsAirI8GLOkb4wt4DRRwxTLzLdP1Uujz3IMaPMoGEHpb4
 RujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755873008; x=1756477808;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+g0RHJlTrkgLw/H7weUsUlBTzklhg4XVgzVbYgiP3Vc=;
 b=OOlWfOQckPoV5RBkK6lJFiMvpg0Xp7IQkJQrzjUn6N0B10+5nsx2Zd9b1w+EhJt65B
 SKNCSgbWQ3X4i4xYwmDQ60HTjJ9UkgDGhfRAH22gVt1icfcxBJ7D2pkH9aO72McbLqed
 ZZ3fikzzZMJu/lw+6So1liUjkIfCCmj1Y4RPSZsaQ9iAo8ySdRckN2zOo8rPcTYcbmTm
 Sn+F/gDbxQBSLJsRYO+NvN6Lm6GZpyzL02EXHiP5/GO59n8z+ovauHsGQV8eDD2MN36Z
 ntmEisNgWK/MwNQx12rOLvCInownAFgdQTdBIV+Yckv9pSTV7ET7NxZBGaiGrxUWIo85
 UDSA==
X-Gm-Message-State: AOJu0YyQ4cVENyErTB/xFyEZlpMDjmifD/dD10HOHLo0e97pt5KMa9ik
 I/1WW2cytnPf4xxO1Ar4QPnpJlUeS49Yp88/2iD8LjRvhFRaKPziVsyen2Fjb/AgS8gT1V9Bv4W
 072AR+CM=
X-Gm-Gg: ASbGnctimqu26bRib1U43WtMDw9/xam5HcfkEHRXK505R9GWjfUjibohndDYZ12nSby
 JXRHBCYzbNYpTMiJ9xYSE0ulevbt5jNoyvlBkEHoSSKAVg/M5jRGqchxlNzxANtnIZ7xR+FIPxU
 na7E8aturIOIWnLV1VfNn8X0psSD0j4b85PbJTNcCTB3wukxMXgrmrqkNg/XA+oOnAFr8aNyeLI
 bw1KQPNiJThkUy5wxJIPUZfnNLyol8+rvY3vsUtp1FbpBypaJ02lHiq1Nn7qVieysku+oROeIBw
 bijqZQ/XD70/gEU9mKY2YrhiiCvr1/ijejEdyBMF6J50qEmL8T1ZBPE/58HZX8clrQeZCetSMXl
 f3wYHyM9wf08OWS564FoMBCdly0g4ReM=
X-Google-Smtp-Source: AGHT+IHetutGX5n1wP6C7E1Q4iN0Mqqi1ZDzWkwNfd/I/6Z1VzhdQdUUIk8ynOSIOLsmja/tKrbWAQ==
X-Received: by 2002:ac8:7d8b:0:b0:4b2:9728:d976 with SMTP id
 d75a77b69052e-4b2aab514b5mr31412661cf.80.1755873007570; 
 Fri, 22 Aug 2025 07:30:07 -0700 (PDT)
Received: from kermit.lan ([65.93.159.244]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b2b8e6023asm420131cf.53.2025.08.22.07.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 07:30:07 -0700 (PDT)
From: Faith Ekstrand <faith@gfxstrand.net>
X-Google-Original-From: Faith Ekstrand <faith.ekstrand@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: [PATCH 0/7] panfrost,panthor: Cached maps and explicit flushing
Date: Fri, 22 Aug 2025 10:29:09 -0400
Message-ID: <20250822142954.902402-1-faith.ekstrand@collabora.com>
X-Mailer: git-send-email 2.50.1
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

This series implements cached maps and explicit flushing for both panfrost
and panthor.  To avoid code/bug duplication, the tricky guts of the cache
flusing ioctl which walk the sg list are broken into a new common shmem
helper which can be used by any driver.

The PanVK MR to use this lives here:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36385

Faith Ekstrand (6):
  drm/shmem: Add a drm_gem_shmem_sync_mmap() helper
  drm/panthor: Add a PANTHOR_BO_SYNC ioctl
  drm/panthor: Bump the driver version to 1.6
  drm/panfrost: Add flag to map GEM object Write-Back Cacheable
  drm/panfrost: Add a PANFROST_SYNC_BO ioctl
  drm/panfrost: Bump the driver version to 1.5

Loïc Molinari (1):
  drm/panthor: Add flag to map GEM object Write-Back Cacheable

 drivers/gpu/drm/drm_gem_shmem_helper.c  | 64 +++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_drv.c | 67 +++++++++++++++++++++++--
 drivers/gpu/drm/panfrost/panfrost_gem.c | 23 +++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h |  2 +
 drivers/gpu/drm/panthor/panthor_drv.c   | 58 +++++++++++++++++++--
 drivers/gpu/drm/panthor/panthor_gem.c   | 23 +++++++++
 drivers/gpu/drm/panthor/panthor_gem.h   |  3 ++
 include/drm/drm_gem_shmem_helper.h      |  3 ++
 include/uapi/drm/panfrost_drm.h         | 46 +++++++++++++++++
 include/uapi/drm/panthor_drm.h          | 65 ++++++++++++++++++++++++
 10 files changed, 348 insertions(+), 6 deletions(-)

-- 
2.50.1

