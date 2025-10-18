Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2590BBEC83B
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 07:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BE410E07B;
	Sat, 18 Oct 2025 05:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=0x0f.com header.i=@0x0f.com header.b="TOPeRnch";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649C510E07B
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 05:44:58 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-b6271ea39f4so1783381a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 22:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0x0f.com; s=google; t=1760766298; x=1761371098; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z6J7CTQVzJTdpSsBpyYymkd2d5jUSp6/gZICW09ccYI=;
 b=TOPeRnchGCTs6F4fgs1EpM0cSCZf7Xmx1bUcCF1LgrCuWPVxV8IDOl7fE+6bRdJBVV
 W8HGLmp2zt0OmgkVbOQj5i5MxaRNhpCHhS/shTsoNxW9J1yRpKNydF4z5e1DnDxac09g
 nhWw+KMhYK1Ug5DotSiC1HS0c90ArX23OYZqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760766298; x=1761371098;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z6J7CTQVzJTdpSsBpyYymkd2d5jUSp6/gZICW09ccYI=;
 b=Cz+5e1eWBW13mABHcuomMjP+QJYJIN3CpCdIndHc0yoMiJcCFO9ipt2k+HzUZoAWGq
 hco1hVaehB6X5W3yj9GNwOIivtm8z7w+CPmyKgedgAsyiRraVn2wzvwba89JSqOIyPxV
 nf84P4OESuJ8sMY5HNFDEmPpeB/BbdAC50P1CwLgJkiog5+gEaSN7vWdAQTawBxrLmxI
 O2/VmNPjoCFd8EY8NzhPfJiEhZFYDSMKsN022742t6EbIPlSVfqu6mv806EIRyoHAAji
 6nanLqcmuDq9+rgWVr3lZDwCFfavwguXyK0MrhY/9u6VVaH9/S63jB33+ypzM6SwE9Zu
 L7OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5/nqIKPLYXelCp9wJUUQJB1b8y04kKuRSNisYjfWvWYyTrPHi80dEA+b/7CGNy+ZMPgnw62focJY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyF6EhPbTjy5w1DH2AUG/4G7pH/vp9Ymcd4NvcCYVhBh5AIhDY1
 wAOOpSiY5HJelgtPfZhxQJFTEZF2PSHLwA3Nlu8rt9Hwm9+4lMrZXhoeERVCO4D7ExQ=
X-Gm-Gg: ASbGnct94rgsZ2MwutdxDJzeiTsCjbXFciL5Gqo4K7TDFxNdHVCOb7CZ3nRGHWGdaj8
 nGUkWoN0U70ly99VHYAcx1tlmh7XDA+qVDfSY0Tk+5myIAlpNFfPcF5UGui+tKv/K82kERhblow
 ZzfHbXVWoCMVZnLerhhiDPs4mfZcQ6RiCmRNmGhiaf9UjPYgGirrTaKSGpmVw5/97Nck1iLUEJw
 4m5Moeq7u4Kjje94GHaHd2VXSG4nIg2kaURDG0LWpqhS5mQTQLB8urIohykjAdsdLXg5cIIH6lA
 ZBvJaF2/UvU5ipkxnkbUqtBL5gE3cZ8bDz+vS+eJhNeMxIiqp2zWR/pBIuE3Ia0yVcm6xKkG2Px
 yt248R5WbjIXkO2B/mYZmhbr6KsjsxCK4E4pzJRCpvFZrd0iC62+tjqy8J3HCuB+PQP7FVFr5Ab
 3mTZ6X4BhH9+btVPARBUtG6tMbygeq7vXLBwO/3xq9BKrzZKX98G0=
X-Google-Smtp-Source: AGHT+IHf1Q2t9Le+gs9UNqzy+mF5hSF6zqhbbRPGceW+0BhDH7PF/VO1zXANTCABMZI3hDYV10XUbQ==
X-Received: by 2002:a17:902:f642:b0:28a:5b8b:1f6b with SMTP id
 d9443c01a7336-290c9cbbd49mr82013025ad.21.1760766297848; 
 Fri, 17 Oct 2025 22:44:57 -0700 (PDT)
Received: from shiro (p1391188-ipxg00a01sizuokaden.shizuoka.ocn.ne.jp.
 [153.222.3.188]) by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-b6a76645c61sm1657222a12.3.2025.10.17.22.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 22:44:57 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, wuhoipok@gmail.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 0/3] drm/radeon: fix up some badness when probe fails
Date: Sat, 18 Oct 2025 14:44:48 +0900
Message-ID: <20251018054451.259432-1-daniel@0x0f.com>
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

I have been trying to get a Radeon 9250 running on an Amiga 4000[0].

On that setup it fails to find the BIOS and the probe fails which is
expected but then a bunch of WARN_ON()s etc are triggered.

I though maybe this is "m68k problems" so I bought an old x86 board and
there if I have a different primary VGA card the BIOS part of the
probe fails in the same way and the same scary messages[1] are showing
up in the console.

It seems like the probe failure path wasn't tested when some previous
cleaning up happened.

I'll fix the issues with not finding the BIOS if the card wasn't
initialised in the normal x86 way later.

0 - https://lore.kernel.org/lkml/20251007092313.755856-1-daniel@thingy.jp/
1 - https://gist.github.com/fifteenhex/b971bd62c49383a0558395c62c05ce3b

Daniel Palmer (3):
  drm/radeon: Clean up pdev->dev instances in probe
  drm/radeon: Do not kfree() devres managed rdev
  drm/radeon: Remove calls to drm_put_dev()

 drivers/gpu/drm/radeon/radeon_drv.c | 34 ++++++++---------------------
 drivers/gpu/drm/radeon/radeon_kms.c |  1 -
 2 files changed, 9 insertions(+), 26 deletions(-)

-- 
2.51.0

