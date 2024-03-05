Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A743871556
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 06:42:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787A8112714;
	Tue,  5 Mar 2024 05:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TyacyrKB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD6710E85F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 02:49:07 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-5e152c757a5so3645866a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 18:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709606946; x=1710211746; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Etsiw27aFJ6ePlRv4kJKzIjRIrMxwFQzPpjYTTmiNpg=;
 b=TyacyrKB350u6KGOlDQDUxHzjwr0B7UDzOwskTLSYhBRSQsRW6ToRrTmoyqwZ0jQ0p
 ARGXbqTwW9xtuakdd5DvpOFMtlTgTiQOgF6siyDma/AjmKlXmUdZ5ya4iPmjUGmYLgSj
 QR/llxvmJf7S63bLsgWZba4rdwZbw5XK6wzRyzEZ/LQHnD8HDC/lS3xUQ9xFnJuiY00Q
 JbniBlyXSk8b+ziXUw+3ROVMLxTIG+Z62DD/VLNasrJgEfo3hF0RIwrs1JhglQanZtMh
 MCoIh0ySTt8qcLJjhOWVeANrSFV7qIRI7ui/lLTGJ7uu0zKVsLQrOxaT9DQwL5Sqd9Hc
 MXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709606946; x=1710211746;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Etsiw27aFJ6ePlRv4kJKzIjRIrMxwFQzPpjYTTmiNpg=;
 b=kg6ADb5u0hrr2f2B5vftEdg64NTkDPFqQNQPtYHqLfxv06Yz6J6cFxu4NqMdPX59mr
 KU4OJA689n3LLe/wy7gCUVMMOjEpjS226t9rOAOhju7Q39GoEqh7eoEA9IDj+XXeb/hY
 6SAmYP9CsZ4ZCNGgSJOxpbGGrpCmJH+AfVlk0sTpXg64NrM6puTWjIv8L2xp/yM87Y2S
 AYKSbnbl+5/ozwRx0IKiB4Q0fAy4IHBNruubZcFrqiaYv5VZuPfb2AqwcgWgMYFRJPru
 r4gp0T0gMPMbMRgPfIYmoqr6O2OvUVcuoujyKtFO4+l+QS3GjLgpE+qKfh4OkcBPPq8P
 bpRg==
X-Gm-Message-State: AOJu0YxIPxKG/SICy5GEjvjAQ/gVtQuGS/HsFRhsoueHlz05FsaIKj+7
 Lv38pt7pCwQFwqQ8tO++8pt3YgowD/IKMr1gxjKhELC10bFZlBVT
X-Google-Smtp-Source: AGHT+IFk9yI11rYtUnsLd3T3/itcAQ/8dXD2j/JJua/SgqclOjI32ujKMZVqVKGMRDVQxz7mbNfDuQ==
X-Received: by 2002:a05:6a21:3399:b0:1a0:dfcc:ca95 with SMTP id
 yy25-20020a056a21339900b001a0dfccca95mr653435pzb.18.1709606946607; 
 Mon, 04 Mar 2024 18:49:06 -0800 (PST)
Received: from kernel.. ([2402:e280:214c:86:bce8:b689:c68d:28ed])
 by smtp.gmail.com with ESMTPSA id
 v26-20020aa7851a000000b006e5b549949asm6324877pfn.206.2024.03.04.18.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 18:49:06 -0800 (PST)
From: R SUNDAR <prosunofficial@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 R SUNDAR <prosunofficial@gmail.com>
Subject: [PATCH] Removed funcs field description for kernel doc warning.
Date: Tue,  5 Mar 2024 08:18:57 +0530
Message-Id: <20240305024857.12783-1-prosunofficial@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 05 Mar 2024 05:42:37 +0000
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

./include/drm/drm_gem_vram_helper.h:185: warning: Excess struct member 'funcs' description in 'drm_vram_mm'

Signed-off-by: R SUNDAR <prosunofficial@gmail.com>
---
 include/drm/drm_gem_vram_helper.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index e18429f09e53..c89c9bafeb44 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -170,7 +170,6 @@ void drm_gem_vram_simple_display_pipe_cleanup_fb(
  * @vram_base:	Base address of the managed video memory
  * @vram_size:	Size of the managed video memory in bytes
  * @bdev:	The TTM BO device.
- * @funcs:	TTM BO functions
  *
  * The fields &struct drm_vram_mm.vram_base and
  * &struct drm_vram_mm.vrm_size are managed by VRAM MM, but are
-- 
2.34.1

