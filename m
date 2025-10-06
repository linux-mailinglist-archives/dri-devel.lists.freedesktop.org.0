Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBB1BBF129
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 21:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB6610E101;
	Mon,  6 Oct 2025 19:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bPreKB9d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C7B10E101
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 19:13:46 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-42557c5cedcso2778475f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 12:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759778025; x=1760382825; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RMcBBIOQ7oEULc7Z+X61tqPmJ8i34RpbaRVflxVnH4c=;
 b=bPreKB9dzVaQ7w9sSGFuWs5O6E10L9DkL/cJQsL85U1seW0mhkP49N1VrqHncG4bm/
 xuhjlUu3Aw0tOx4upnLuAyh6ZtM+bt9SiIoD6qDKAg12vii2/WZ2XXsJKSVPItyJeGye
 3L7VikxovLNrlnmu0go9PUz9nJwPXoXQ3brSwfYhUnnJzcvZf5QJffFSQ5i5R0k3dBlN
 FaiFhQ9yjrPaECbRLzHCGzTuBqh9A+C+HltLfwb/q24BuBj0HRXCc8K1Rrxn6I3SC3q/
 AVDGoZLc/jHP/C1+j3z/N5yhEuhQhTUuDypmNrN3Wz64/jRW6tPALSHzyxzJiirkDtPq
 ah2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759778025; x=1760382825;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RMcBBIOQ7oEULc7Z+X61tqPmJ8i34RpbaRVflxVnH4c=;
 b=IL+FsZnlLx/Psl23+HaGHeKsZUEL7+jp12omihlEk6LnRTp/sT2N/BUEOWxl5eZUQj
 EdqQqF+uArx5eyF1FmcYKvK2prbVachcDCzxYGXvpSAV2xORg4u6INzWXbXzXznZqteV
 NCVNJKEyo/5aNCqH6kxQ5y+5/WjEcL686Enn75oq5SUSphxeY4EKxb0Zzos0Hr5reSL8
 qjInEsGNhpMtrE40dchfshOfmmHJi/skftSht7Q0YF3+MqWDB2kcAbYqnwVhg6qPu0SS
 yAf/RPa6Pbk+KJS+UPrK/V/d8jqgqXfLpP8T9HSJTnVg447l1aoaCGC4w/RYLJ+jmqWT
 f6AA==
X-Gm-Message-State: AOJu0YwGTVx7VfPmH39582/WvN1+CDKIUYdUi6c13UwwJlAfQR1O1Zsg
 D/ypEJHg8MzH5jYYR/rraqpU0+/wyi/4ykiPHaXv7Iu5iJskZmuAZsfbwy5g1Q==
X-Gm-Gg: ASbGnct58O9tOtpQ/hb/RyNkN4inOAs8eSXCqEk6T8pUkGaA5ZtPQn3Rbpy4c124d/y
 catbVJcYlDzwGEFTI1oYtHQ/CLMXdjRYZQ6/+Nk9lUFh2MR8vuLCTF/b5kKwiK2Uoai9oEvU071
 sKbJMj4iLq9eX+LrsYsbfldKQuoID+ud8xlHK0A84NTdvL00fFTnh+ndQf4yBQpzON3mKCEbHHQ
 ziLHSgcVihQueaEZMO7q233HvYbaM+zAEdal1qN6hePTA1b6LlCuCxX8LBJPYuXdaHjJw0SWpS1
 WsFNKLpcu4/wuTcmpp8kYUFWg2S8Wxv720yQvqQJx16hUGolaxr7IVqJhlkhuDE9CbvMD60bkyh
 PCQ2WXnWF4uVfKIMDWmb+ynHz9P8G+yoOHKZlSasCBy839axVoaSK3KeaArBQQXCKl1l3
X-Google-Smtp-Source: AGHT+IHV/nfCCK0RCczv7rc5MaQoZEyJWv13YoEqaPNyFNBNdO0E4u+kR/nXuPC982b+no5YRADjmg==
X-Received: by 2002:a05:6000:25c3:b0:3f1:ee44:8bf6 with SMTP id
 ffacd0b85a97d-425671b2af0mr8518969f8f.51.1759778025107; 
 Mon, 06 Oct 2025 12:13:45 -0700 (PDT)
Received: from fedora ([154.182.208.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4256866060fsm16646435f8f.14.2025.10.06.12.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 12:13:44 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Subject: [PATCH 0/5] drm/nouveau: Enable variable page sizes and compression
Date: Mon,  6 Oct 2025 22:13:23 +0300
Message-ID: <20251006191329.277485-1-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new VM_BIND interface only supported 4K pages. This was problematic as
it leaves performance on the table because GPUs don't have sophisticated
TLB hardware. Additionally, this meant that we couldn't enable compression
on the userspace side as the HW supports compression on larger page sizes
only which was a major (>50% in some cases) performance loss.

This patchset sets out to add support for larger page sizes and also
enable compression when userspace binds with the corresponding PTE kinds
and alignment.

Ben Skeggs (2):
  drm/nouveau/mmu/gp100: Remove unused/broken support for compression
  drm/nouveau/mmu/tu102: Add support for compressed kinds

Mary Guillemard (2):
  drm/nouveau/uvmm: Prepare for larger pages
  drm/nouveau/uvmm: Allow larger pages

Mohamed Ahmed (1):
  drm/nouveau/drm: Bump the driver version to 1.4.1 to report new
    features

 drivers/gpu/drm/nouveau/nouveau_drv.h         |   4 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        | 106 ++++++++++++++----
 drivers/gpu/drm/nouveau/nouveau_uvmm.h        |   1 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |  69 +++++++-----
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c    |   4 +-
 5 files changed, 131 insertions(+), 53 deletions(-)

-- 
2.51.0

