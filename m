Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5B4AECDFD
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B329310E06E;
	Sun, 29 Jun 2025 14:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BUiGB9al";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D6510E06E
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:41:09 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7426c44e014so3922698b3a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751208069; x=1751812869; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ngH93iqwU56AyBIpW4Url2/UbBhraQmZe5IjknGkMe8=;
 b=BUiGB9alD6yZIxFUuxC2zEawSLqJrEdKwVzyFxEb0zbfc4i8MeCDueUwKSYwuiGuBN
 H/LLtFCOMNUaUlWGlAet1ROZtZfrl4aMBx/O3MG8qH3hznlrKQ4KeNr2ELyZ33bwHtBG
 WuVpNAfDYsahtYtZCntiEg80co97MIS2ei/qSN1sfCGzzfYoHmRWl6tPvJTrRZrQYh8q
 xqv0o/Egyj9/3saiKL6+2646YaYH8FZgRlHiuplvjqR8E7gyRxokDj2KwN3NnZYVjf5D
 32syARbimAbeegn6BTsMU2qs1a9kegdmkZz/jXZ1c9Do16ZUwtbLtI58iMS7ObaFnKN4
 L6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751208069; x=1751812869;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ngH93iqwU56AyBIpW4Url2/UbBhraQmZe5IjknGkMe8=;
 b=mL9qbVMgqxpfkgO3PcYz1RJR5cIjJG/2yKWVPtl6c0wy4PRu+/WU36lZmgcte3vw3g
 rdX36vz77uZrnzyiUwhiilLOfGCifnZ36y2vaLLp2vrFrfwtY2v9dPkuXGoPvCfZdxdT
 2pZM0YPfwk3yqNS9NXKIQvI+F1sXoXdGQ57lw0bvmmPLdd3vxgDV2IsDvGMbeCvhGMzJ
 U6mSR6IpaGpjaua/pTvMd7vspVKIRSc3DM3pvgdTplGUDa9NAvS7+2eInrrnU8KPTf2c
 t7GC0dIFSttPqSHaGBD0F4yltYTkCbe2ps60tt2N+ltmjndPw4CoQ0VhtRJ7qseaNrzL
 /pWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6nNlMgA3VNcPuWmJblfcsue8NWgFPiy1XLNCBeWH0Wu5SX7E/28rKNY3CkdTUY13idKQUCAN4PhU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZ4a4iY6q+gUrxR2bKZbuWs3yqGCx8wmI4E4pq6bUqFz5jclWc
 UaOBF0dVVcjusf94RTTrUPHml/33eVKpXqxRapW453VKHyornSdQ1i0y
X-Gm-Gg: ASbGnctGDAX2unqy/GjEjJpU6WhhGbl5gdyEyt9PuC77aP+ReY5n6y6ECguH+oDaZ3d
 HNumZUy9P10mNJv5v1EGxuBnPVtFAXlMkhmxvGoVeu4hv0bxdCECKSsy2LLFcoUhgRhMNVCOVKQ
 wq1R7FjnEYR1zorj8yxA1sHl8VhfdEXXjRmjGw5k3wdHFmg20H2t50VWj1ljKanBLm5HIAKr93T
 bzcw326+Gn3veGEOpRpRBRW1LRzO1LLXli603AqexP668vUvRpoyhEj06u0RuII/VR2S9FHk2fo
 sPufn0UYqffTAp5dKFS8vV0jMCkcVfbtVlX0pgFH1ViW9VjP4QhgTciRc3UF8ENp1/RXn7vl6Uh
 f6xb43OlSq40I
X-Google-Smtp-Source: AGHT+IHtRc/795RNnE3dT1YxPcD9508ibGAtu/WX122P8XMCfUg4pdoaiikvlcOosNNP++JAPhMsug==
X-Received: by 2002:a05:6a21:339c:b0:21f:becf:5f4d with SMTP id
 adf61e73a8af0-220a169c8edmr14074658637.20.1751208069031; 
 Sun, 29 Jun 2025 07:41:09 -0700 (PDT)
Received: from localhost.localdomain ([49.37.221.186])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-74af55c7e89sm7039127b3a.109.2025.06.29.07.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:41:08 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: andy@kernel.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>, dan.carpenter@linaro.org,
 gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
 tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
 notro@tronnes.org, thomas.petazzoni@free-electrons.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] staging: fbtft: cleanup fbtft_framebuffer_alloc()
Date: Sun, 29 Jun 2025 20:10:09 +0530
Message-ID: <cover.1751207100.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Fix a potential memory leak and cleanup error handling in
fbtft_framebuffer_alloc().

v3:
- Remove a redundant check before calling kfree

v2:
- Change the earlier patch to also handle the error code returned by
  fb_deferred_io_init() and update Fixes tag to point to the commit that
  introduced the memory allocation (which leads to leak).
- Add second patch to make the error handling order symmetric to
  fbtft_framebuffer_release() and also remove managed allocation for
  txbuf as suggested by Andy and Dan.

Link to v2: https://lore.kernel.org/linux-staging/cover.1751086324.git.abdun.nihaal@gmail.com/T/#md111471ddd69e6ddb0a6b98e565551ffbd791a34
Link to v1: https://lore.kernel.org/all/20250626172412.18355-1-abdun.nihaal@gmail.com/

Abdun Nihaal (2):
  staging: fbtft: fix potential memory leak in fbtft_framebuffer_alloc()
  staging: fbtft: cleanup error handling in fbtft_framebuffer_alloc()

 drivers/staging/fbtft/fbtft-core.c | 38 +++++++++++++++++-------------
 1 file changed, 21 insertions(+), 17 deletions(-)

-- 
2.43.0

