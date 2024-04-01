Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9503894767
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 00:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13ACD10F62A;
	Mon,  1 Apr 2024 22:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gu49fWgW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4EA310F62A;
 Mon,  1 Apr 2024 22:43:38 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-56d5d4d2e2bso2442209a12.3; 
 Mon, 01 Apr 2024 15:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712011417; x=1712616217; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Qcik2ZKpGkaSDWlkrFdRKbIB9C35lYhPbyGch8RiDYE=;
 b=Gu49fWgW+quLrp3B+Oca3SRKjSeRX2EP3Dnw+H8kkj61xefAQ0KU3Y8j/lu614lKOX
 aGHXVto8Ic19/5DUokuAvW9RJL7HZd8/08+0flsTxY57Td8K5W/Sr+Jq7W7Rg57Eb/JI
 Zu8T4gJs+xatS0dY0HD1vxdkV2jROTDLhW5Q5ZOV5DUTjgKFv0MGoidQIGdD1Y6g14Ci
 gvjIM4SBb3K049Z474utQXU/qLKAQJEHrq46swqvKJpBe7RsN05r9pP/TJFLITz8+jn6
 lMzbyMiIqPkkXSEj9UVqBot+NoaTQjZoPUkVxtZ+w1cZwWddYjW52y4int3kEIWdCW9q
 h5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712011417; x=1712616217;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qcik2ZKpGkaSDWlkrFdRKbIB9C35lYhPbyGch8RiDYE=;
 b=DwqrfjVNJUWdhvnl5OX/fWSZe59Uqzkd45o8mtCp114XxTUsBNS3idnb4jFgHmjXTF
 nfctmZGZqB09Dr/li/lMeSdG/EKjYS7QtOvM8t1T1F8cylU7NBdchmZOITpdjqodHS7Y
 mtluJg8Ql1kgK3jRFIG+iReHYcUXN4Y5tT1mdcgVH58lAr91J1WLgMgL3qFIWjPw3Y1e
 ocItilwA1St62WnikcFoXK7mKh4duxapSo8N8rmxfXvr3L857YPT/5GKw8qU6ac4lrPn
 xMRVb/ZvL8zdbEH5JGcmaJ/ygJDvAa2LYB427m3jm3ZXGBtOXKU80jmxj0VgReZnH3hD
 XD9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt7KuE+3fws+xSE8EQiWNnan6EwwXqSHl9XtGYwg6obN8ce82BaD7bACSLuOwXPzsRs2hMQiAk4p7GCcF/qLlfILMOepB5qR40kdsJ7KRHYIoKSzIJCohf91m/Hld4UvoNEgkDeWBPO9tn0A==
X-Gm-Message-State: AOJu0Yyb9FeyQhSLIzc1t8DwPuVgbOuVcuvVA4cvSmCpq/J5QXcThoNk
 r41eZVWXraDbJDha5Ka8X96Eu3lCEQcvpNtgqkki/JN04PlgDz0i
X-Google-Smtp-Source: AGHT+IFCq9xTRzVKnUogJcMxAWnpUfEpfgOajgprHKVs1djxX9T4SpkK3k/wCGnJbNBww8lu687rQQ==
X-Received: by 2002:a17:906:4a01:b0:a4e:2ac2:bb27 with SMTP id
 w1-20020a1709064a0100b00a4e2ac2bb27mr6448520eju.9.1712011416859; 
 Mon, 01 Apr 2024 15:43:36 -0700 (PDT)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 c3-20020a170906340300b00a4739efd7cesm5796808ejb.60.2024.04.01.15.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 15:43:36 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, anarsoul@gmail.com,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 Erico Nunes <nunes.erico@gmail.com>
Subject: [PATCH 0/2] drm/lima: two driver cleanups
Date: Tue,  2 Apr 2024 00:43:27 +0200
Message-ID: <20240401224329.1228468-1-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.44.0
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

Patch 1 is a fix for a crash which triggers on removing the module on
kernels with CONFIG_DEBUG_SHIRQ enabled, such as the Fedora kernel.

Patch 2 is a fix to this warning:
  drivers/gpu/drm/lima/lima_drv.c:387:13: error: cast to smaller integer
  type 'enum lima_gpu_id' from 'const void *'
  [-Werror,-Wvoid-pointer-to-enum-cast]
which we have received as a repeated report from the kernel test bot to
the lima mailing list.
The warning only reproduces with recent clang on aarch64, but the patch
does get rid of it and there seem to be no more warnings for W=1.

Erico Nunes (2):
  drm/lima: fix shared irq handling on driver remove
  drm/lima: fix void pointer to enum lima_gpu_id cast warning

 drivers/gpu/drm/lima/lima_drv.c | 21 ++++++++++++++++++---
 drivers/gpu/drm/lima/lima_drv.h |  5 +++++
 drivers/gpu/drm/lima/lima_gp.c  |  2 ++
 drivers/gpu/drm/lima/lima_mmu.c |  5 +++++
 drivers/gpu/drm/lima/lima_pp.c  |  4 ++++
 5 files changed, 34 insertions(+), 3 deletions(-)

-- 
2.44.0

