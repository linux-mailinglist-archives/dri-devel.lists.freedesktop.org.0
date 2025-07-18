Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E459B09B86
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 08:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A626E10E8CC;
	Fri, 18 Jul 2025 06:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TLGZhHi9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33B210E8CC
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 06:38:24 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-748fe69a7baso1684483b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 23:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752820704; x=1753425504; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=BwdSPh4JvmFHd+Iv/wF6gcUfSJNt2xnQHwuiHcjJGJA=;
 b=TLGZhHi9+bCKpLXQgWaKmTKFA/TVMLv7PDXB4PisHc/SbQkgs+hvbQoXvnyjnMt6dt
 mFCoekWGQYvjfiesNakDXZ148Su8E7wIj0pg6OjKpFFfstE1LCxMWnNU+ziOdiG6UusO
 g0iPhe6DLvgniHN9nAtSZOK0PJqYCy+z8G6qNJYGIyKHZt/a/6Vktk3hDLHbgrFQctMn
 SUuLYecz91PbR2OWRULLnKX5wjY94JaqDuFapAUEbXccmSYucL/hxoNxy2SCIcs0DZTQ
 z6lU+nb4MgmJ6q24tidVrwGr5foZdHCB0/0vKgtRYUfl1PXBswtQxQZnTymKfXAL4+UG
 AGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752820704; x=1753425504;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BwdSPh4JvmFHd+Iv/wF6gcUfSJNt2xnQHwuiHcjJGJA=;
 b=VeM//iI+d2xCMl2mQ9ezDm6ujeT87Z7Lx9JnxHRgCarMR0TOxbV3+7n7UpNnEzcaKp
 pyO64ximGcjFZ9PKpEex4HZbj+uiph7L0D1O6nxSLgRkN0uFGgTvO8U0Ir45Rio2q2fk
 L98Cc2liUIW76YqHImGnFjRfV0qU/0qlUhqf1pDgLZPSGpnKk69LH7z29fym5ahsV3pm
 mHmLw2mL8bZseC7Qgw0d8cOmf8oFmRllFrs8Gf448upZKIT7jNHwW+jnIzmrnslf7eyR
 oaGJidG119nB9to95VYX8ZcVuyo4oMLaspJFzGTddlzQpPVbEtJFmeXp7BrP9KH5TMUD
 tTCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ/u1zo0+qbk2FgK7pbLwVdS3Kj0ZGD8m+6D/utHo0LwnwiKHwizU5ByxClRFbJWis1qKAP0HAh1A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtBQkezGnsuRn2BKENUEoub8Z/yeZVQvRJBNRVpKbT8t10hT/8
 l+lsrt3V/nwKav1gOvZhIRv6u0KDKpgGnHXwxcOla0nFPi1yahLMR5y+OOWyfwvGW9Y=
X-Gm-Gg: ASbGncu4p8gL/+bD/D2snQZ09nCo+wNu2SQGLi3D8KasdB2lWz3tUlBg8z5M/j642ZL
 NGCnlLDkpzwA9KQDfdWVicNXhHnXvuXt9X+cyoFN9aXQWLvGpgUbH9Fps8vHNZJC/SGuep1oSop
 e6sS7vM25ty8A7QQaLg3rmhJbKE6VKy2kDSx0a1coXbWcVpm0oFtY5Solnb+xpVhKTL/TKn2yJK
 iZiAmYVes0ymagDEmZ7XdfogYPCpxU/DaNVXh1UHML9O7sQ6FNgAYh97Xb45DHit+Ke/rJP+jNh
 DyJzSdIphN/Kp3NEtK6nXQatZXvICdF+r1hcmR70knBeCB7lVhcW6wMwyMFvTJXnYYoSBb9Genb
 hdv/U4RZUR+CO08HXy4vGcZ6URgZ6WfkFMGyi+ZFP0LiZZ7NITRJYwEzt
X-Google-Smtp-Source: AGHT+IEZ1zQnWI3otwhr8y5LlqoEUCJegDnSK/x/zcL8x+MwvxlKyS+ojAWhWHoDTHssrGqPUTARzQ==
X-Received: by 2002:a05:6a21:1709:b0:1f5:79c4:5da6 with SMTP id
 adf61e73a8af0-2390da529b1mr9223362637.5.1752820704230; 
 Thu, 17 Jul 2025 23:38:24 -0700 (PDT)
Received: from localhost (212.18.125.34.bc.googleusercontent.com.
 [34.125.18.212]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-759cb155d77sm576969b3a.78.2025.07.17.23.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 23:38:23 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] panthor: print task pid and comm on gpu errors
Date: Thu, 17 Jul 2025 23:38:13 -0700
Message-ID: <20250718063816.1452123-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
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

This series saves task pid and comm in panthor_group and prints task pid and
comm on gpu errors.

v3: fix new kerneldoc warnings
v2: save the task info in panthor_group on panthor_group_create, rather than
    in panthor_file on panthor_open, because, when the two differ, we are more
    interested in the task that created the group.

Chia-I Wu (3):
  panthor: set owner field for driver fops
  panthor: save task pid and comm in panthor_group
  panthor: dump task pid and comm on gpu errors

 drivers/gpu/drm/panthor/panthor_drv.c   | 14 ++------
 drivers/gpu/drm/panthor/panthor_sched.c | 43 ++++++++++++++++++++++---
 2 files changed, 41 insertions(+), 16 deletions(-)

-- 
2.50.0.727.gbf7dc18ff4-goog

