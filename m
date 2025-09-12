Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6228CB54EC1
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 15:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4FD10E39A;
	Fri, 12 Sep 2025 13:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gKdalkHu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5285810E39A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 13:07:21 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-251ace3e7caso23955825ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 06:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757682441; x=1758287241; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x544GYJay0OImzEkLS/doW76Om1NP9OFkc47rJ1bRQg=;
 b=gKdalkHuIum1FddJMafacSF15nVgRQQPWwn1pB2FIv7pxKEF+zioSZ0xeKSmRJj+8I
 5jbChF8W9CgG8qb5qhMQCVRU4zt9P0Apnou6UeaQaBOwfKCOtBA5AHZndyL+auqMX2RR
 EawA5rVhd1ho+ON/F/sCFaVyyS2qoxR7U1kO756vg9tHJry0ohDNyEmXpybH7eUo7GEn
 HdfoVAnRhyFobRGPzfa0D0VkWSNOZadipQzfxmIjXnbsauk+7dIUIvi6a09FqHp/B6d4
 bNBW/gbCYIPALemZUBvVmaBMdPx9ldsQjnDRHbDpY1U4tzbS7sxoCE7yxcjLbTsFjUEB
 gCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757682441; x=1758287241;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x544GYJay0OImzEkLS/doW76Om1NP9OFkc47rJ1bRQg=;
 b=cRx4x3HzsZz4Ack1AJcEqMD7jUbfavWOiDVo3WbtpaFYd0jcFwjr8d6TxxdWZEhI1k
 EK6Ke9SMzqeRGTU87AkWSUsA3e4uLOi9akuo2CMudInzGG/qUXklz+00cjfC0RzYDKL/
 PXdsTx5wgMGhVoI9t+LjS0JbD2WasltN82kanZvRXGKIJ2j19GNSZ+UFqGCdR6k9vNgm
 Vi6r+0k5ciL6Y3L9Y6tHJC7cymVNutu538NSqYFN3tpCu4glly0NAoZf/kRb+U9Sy3Ru
 bfNDKd0GGbjkjjPiLo8BGwEdNQNZGavyTXHWF34qdGgZHZoYVoXomLj8DlMFEfjdliIz
 qW6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLTVw/XXIkMUJmX+BcbLs5+S5xDuk/INeY/FlQn5BApI0IZ/3dGXPmW0dtqSZLnqfwNy06d2V256I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzfhdbag5GKslWo1pChL8XUtUrh/2y9gx2A5Ff2ALrAxSbL3EOR
 tWeDo0YxXSlv4zavpBLCGLxEv/e+JiBzf+qg9z0Kn1clXE/+ksS+7cJV
X-Gm-Gg: ASbGncvjdRVFZ5CNjse1rWhtb9MXiY6fn57tioz/xNc0Fw9T3Pi/JPEo57he+IZixPO
 Mo+RXH6eUl3mWRVSkbZg1icEaMDeVS6ZB3iPYUcmSgchlrnT+H7LXKqGYSN5V8tc7EQX5OCwC96
 aLEdsCybLapRxTjHzJuiO2iHfDbTnWhhA8fDeiMJQ93g/mBKCq5V/cqHx6S1yWXHKe39iJxE+7t
 2yVlpkynYcXiHVgyz7MmmNcT4hXNqiM5fVm0inRvuBy2FgzGK/JS169Vo4hMM57kV7+lFTgWNkt
 5CZfTLqhpR1XW71hoyMkoqr1PMqMLLIYxapfzkib6as4NrhQbWQNjAJv2EeD7W6AbZISEai/vgp
 Ho0vkHBact49uh759n79ZMpqBVFi+KX7sFh5B
X-Google-Smtp-Source: AGHT+IFNtOF9483lJqZ0eCDuywtMNSA4/x1QrNPIz5w6iEwUoJ0MCDnna++VYIfN2AunXMyW/zkq8A==
X-Received: by 2002:a17:903:144f:b0:251:19e0:2805 with SMTP id
 d9443c01a7336-25d27922652mr33876225ad.55.1757682440563; 
 Fri, 12 Sep 2025 06:07:20 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c3b307225sm49207635ad.145.2025.09.12.06.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 06:07:19 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id AA34441FA3A0; Fri, 12 Sep 2025 20:07:16 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Javier Garcia <rampxxxx@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] Revert "drm: Add directive to format code in comment"
Date: Fri, 12 Sep 2025 20:06:50 +0700
Message-ID: <20250912130649.27623-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=bagasdotme@gmail.com;
 h=from:subject; bh=m4qhwnsry/SWycpMdOHNFZlNWW6x4f1W26dSGmgsJ6o=;
 b=kA0DAAoW9rmJSVVRTqMByyZiAGjEGlKhXlw/mPScHOQuMTJJKb9msLDKVjN5d75gGJeg1FAW4
 Ih1BAAWCgAdFiEEkmEOgsu6MhTQh61B9rmJSVVRTqMFAmjEGlIACgkQ9rmJSVVRTqNraQD9G99e
 9SXsT9d6z3iT9FNmQBBdwBmkS2WzrDYbjm1fbCgBANgvs+XgMdf6dSl9lCQ5vHWWgIoppY6NPRZ
 zWj/mPL4M
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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

Commit 6cc44e9618f03f ("drm: Add directive to format code in comment")
fixes original Sphinx indentation warning as introduced in
471920ce25d50b ("drm/gpuvm: Add locking helpers"), by means of using
code-block:: directive. It semantically conflicts with earlier
bb324f85f72284 ("drm/gpuvm: Wrap drm_gpuvm_sm_map_exec_lock() expected
usage in literal code block") that did the same using double colon
syntax instead. These duplicated literal code block directives causes
the original warnings not being fixed.

Revert 6cc44e9618f03f to keep things rolling without these warnings.

Fixes: 6cc44e9618f0 ("drm: Add directive to format code in comment")
Fixes: 471920ce25d5 ("drm/gpuvm: Add locking helpers")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index db9b089ef62c85..86853535fb7bd7 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2432,8 +2432,6 @@ static const struct drm_gpuvm_ops lock_ops = {
  *
  * The expected usage is::
  *
- * .. code-block:: c
- *
  *    vm_bind {
  *        struct drm_exec exec;
  *

base-commit: 9a3f210737e958c3f45a4ce0d7f1ff330af3965f
-- 
An old man doll... just what I always wanted! - Clara

