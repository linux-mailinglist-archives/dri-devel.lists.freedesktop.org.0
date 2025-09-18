Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DCFB854FC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 16:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE2F10E20F;
	Thu, 18 Sep 2025 14:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dj3fItcJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C82D10E204
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 14:45:26 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7761578340dso1512921b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 07:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758206726; x=1758811526; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=beNHBIORwWdI6jz0Xklt4Z8Y7brA2iCv2EEwx022pAc=;
 b=Dj3fItcJp3MzUxSMSUg33mP52zjjRGD00+Jfpp+4uvBChQAQRojgBtP4GCG9q1eFUR
 rF86vKuo9vx6uLSZpK8QBoBj6cwzSy8TVQrzt/7zIUOcdfjeOqrxM1ulwwMN7Jv6Us17
 TH0CRjQA9egxJA8DPXuX7cCBYEu5a0f+Y1RXWG0NOTPZj6/Ai6rZGkwANDGv47ZdAADg
 tG1YanBoMKMm8/0k1xxmHeOToy5A3YLOuRpn3iyhaGugKoDfssj6GgdO7JiJMApTxi2M
 RuTthgDpKFm+6EoeUEzT9Kpy3ivCZDf6urpZAgvjSOmwyqft+lu8IcrLZrmbYQeo95sH
 Vzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758206726; x=1758811526;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=beNHBIORwWdI6jz0Xklt4Z8Y7brA2iCv2EEwx022pAc=;
 b=oxFa+XWkxmak89AYJt9EInJgR8hxHBd96urC/cJYQ7h8Et1ApHbKjTr6hqAJzzdinz
 xagX92Mt1kEscqe8DfDFt6ck2bs8ZziifDFAcAKPwWFB40cKKsDGSpEENcqXZ0DwOdNo
 xqdDggka2ywbv+RgOGuGJVu+VmDW6es8Ec1tC7qjqmH0FEMBE5K4tKlBg6m0zrZUuHsc
 d2zuABZg7n2I5NPsq56KPa1t5Ji/lk02Kn3fiFlBuSuvqFUqd49Vu2+vqKu/pG1L5ekZ
 oT3+YtaMxP2pnqK2WP+gLRlmhluNeKDZEiOvLkMARmL5zRhDUDiu17bGFO8s8DEyyidl
 qMYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIKpDOf8aNCZc7CTZ3W6FOtOHpqXu9ISKYJlCwM8ejGl9ULzPrKO+vpLpJx6od91tQpVbERi9gMhI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKFOUGLIVTSBtdjSb75U18T+xycYzbyAq1WQp/RiZM4Jxgcmeq
 06HVSh+ezowzhx4rU4PIvwp/8kQUHhOof1ng3hh4tWq/qFrJuIk+jwIDJ7vGLrRI3dc=
X-Gm-Gg: ASbGncvIobmJCQtmiWe/3NRNLMbqH6feT4vaxqeVouafm9RlUpM3E2lM+JVrdAaElqu
 40ujDbci03ShOfSfc9q8TijIp/So2Nxs80KLBmk0Zw81ge5lMR1j775RuL4djG6B0kCyg4ADzOa
 9Hj+XwT9nT3a2vCe2VQKktcsd5YgSHiBluEI9Lpk1f5E3JGnY5h+1RbK07QDw3bd61dau6rXTWS
 wwZFEKWytbIYgIktdTlGmU726iqV0MVk5Lb+3pV0GQ8WObcMEG/TJuxtv22jYx0LzDb2gwMgX80
 2rVU6fRWyfTO9lUYf/RE/U1sPeMuX/vVE0KbjdscXHmtroqGfIz1C+fMYJCgvItidbZIsxSorl1
 zMBNYFF7m2oX7Ws1NR8SoEpaKYZFNzVc2772Ujywxvg==
X-Google-Smtp-Source: AGHT+IGIvBO3xzseHmX1P7b9dSF7ElctZYn/Sd/EuikFaigeHUhCCsSkueAeH62n8Nrlv3YnRL44AQ==
X-Received: by 2002:a17:903:187:b0:24e:593b:d107 with SMTP id
 d9443c01a7336-268137f2459mr75365495ad.32.1758200706397; 
 Thu, 18 Sep 2025 06:05:06 -0700 (PDT)
Received: from lgs.. ([2408:8417:e00:1e5d:c81b:8d5e:98f2:8322])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b55138043b6sm424564a12.26.2025.09.18.06.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 06:05:05 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Guangshuo Li <lgs201920130244@gmail.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Kees Cook <kees@kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] drm/amdgpu/atom: Check kcalloc() for WS buffer in
 amdgpu_atom_execute_table_locked()
Date: Thu, 18 Sep 2025 21:04:33 +0800
Message-ID: <20250918130434.3547068-1-lgs201920130244@gmail.com>
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

kcalloc() may fail. When WS is non-zero and allocation fails, ectx.ws
remains NULL while ectx.ws_size is set, leading to a potential NULL
pointer dereference in atom_get_src_int() when accessing WS entries.

Return -ENOMEM on allocation failure to avoid the NULL dereference.

Fixes: 6396bb221514 ("treewide: kzalloc() -> kcalloc()")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/atom.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
index 81d195d366ce..bed3083f317b 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.c
+++ b/drivers/gpu/drm/amd/amdgpu/atom.c
@@ -1246,6 +1246,10 @@ static int amdgpu_atom_execute_table_locked(struct atom_context *ctx, int index,
 	ectx.last_jump_jiffies = 0;
 	if (ws) {
 		ectx.ws = kcalloc(4, ws, GFP_KERNEL);
+		if (!ectx.ws) {
+			ret = -ENOMEM;
+			goto free;
+		}
 		ectx.ws_size = ws;
 	} else {
 		ectx.ws = NULL;
-- 
2.43.0

