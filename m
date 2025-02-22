Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8FCA4046E
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 01:55:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C04E10E1A8;
	Sat, 22 Feb 2025 00:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B5WGG42X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FD810E0E9
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 00:07:08 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-22113560c57so53952025ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 16:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740182828; x=1740787628; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MswCAZSr11JhdHu1wpbuxpiR6tFA6D+Bi7/K0hdahk0=;
 b=B5WGG42XeDuO4R5IYEddv4CkDGAjLibA97sIrgfZVGz46HYByUye9oV/VV/+xts+7C
 lEjsU6mgnJt7Rx8GN/ZlyhqIIFo2x8p4EVDxFrtAMiV4vtM2/NiiTF+zdzuFlA7KnkAJ
 T5TfT+3kqB89+7B9/4z6vjrakERKNCK3sEdZw7CrKkgbGlz7pONBMFmvGQdlOWmF67Wa
 Uyvt+fvAaPEXmg6CQ787kjC/r9lU3DO4AZiNxk3dQZM6eNsEzpbcKEdcB5n2jaTVjcpn
 nN1p9T1kWRyOMkA/xeZj+DwJppmGkIkzOcrcX21vuxPFPA2vXPdO7Ye5anMb6uS621jF
 Ye5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740182828; x=1740787628;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MswCAZSr11JhdHu1wpbuxpiR6tFA6D+Bi7/K0hdahk0=;
 b=GyLr9YwKPUAKCTPZi4evA1fV0W/2PiiAi2IFzRqaaYXHOyLwPgZwc07nwFAeGYaRut
 hLs3dKLm18atFxRKN+/b2165pTzhNSv83mRuIuSmKTX6B+97XmEvX32WXah+AExzW4DE
 Rm6KARGQcTgb9njN8ytSf+VF4oAz6ZOHcT9eG6CkIfFUJjl9d/rOL6iCUVA5Wmx8W+07
 UmVryF9nIZJ9wbdPc8033E+6DQs+aSTNy4FkCpkcOdhDsYR+mTl0P6gIg2akQKt9S+ob
 0DDh0O3ejQmry9ZLEUOzAgBp+7QiSYxfn/iCS/n0eN4c2p6TTTdAh0MA0wpmXFdWNsfc
 MQEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn3dlAlb/UoFQqm9I3b8qYNqUswoK1rLpudFCyPpl8u+nCYnfl/8XUNQSQgKyWlhsdTH3Tf6VIJwk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKtCHD3icySgkXJt73jTfgfbA7DvclyulEzQAFsM689ouYhNCT
 5i1O+1HVs7Gq34tNq99NHHVFmwP8UsRpWYntVLT+IMYAJBSJ43vC
X-Gm-Gg: ASbGncvlZETl9TF7CLDapMUZpATVcc7vE/D2dTZwNB3rw7t3Roj0bE+TpuzpSGYsxo8
 NoEHQTI7UUVTMqSKhQLiawOLjA/9tG6jHHwTSMmeZUPfqKVEPUG95QEjtzbMoPg3LuAkuwCHL75
 knohYQwCUSBYDPWPmaaCEzOE5foI4C6uzhH0Brhj7V4+HuNoF6kBU96ZDdDeYSaYmhZA8qiF26Q
 7Q7g1e5wgJ3bGrTCOoDhP7nlHPaI/5X4N9ug9jqIw3jr5aQKxOVcAVDJp7YU3B4KjG7HVxYWbcS
 JI3hKQLSgH3ptj6E6dfxpA==
X-Google-Smtp-Source: AGHT+IE+JUzncJ3icMuuqbvaTXRAsotDNDLEJLaGIzMZ36tKqpWXYEDIxlg16w83TwVii4xDF7xHAw==
X-Received: by 2002:a05:6a00:3d0a:b0:730:888a:251d with SMTP id
 d2e1a72fcca58-73426d9ee22mr8844925b3a.20.1740182828276; 
 Fri, 21 Feb 2025 16:07:08 -0800 (PST)
Received: from dev.. ([2804:14d:887:95a9:5a0c:64ab:937e:e751])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73261ca7831sm13053223b3a.104.2025.02.21.16.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 16:07:07 -0800 (PST)
From: Leonardo Felipe Takao Hirata <leo.fthirata@gmail.com>
X-Google-Original-From: Leonardo Felipe Takao Hirata <leofthirata@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net
Cc: Leonardo Felipe Takao Hirata <leofthirata@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: [PATCH] drm-vm-bind-locking: grammar fixing
Date: Fri, 21 Feb 2025 21:06:42 -0300
Message-ID: <20250222000654.137621-1-leofthirata@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 22 Feb 2025 00:55:20 +0000
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

Fixes grammar issues in the VM_BIND locking documentation:
- Corrects adverb "also" positioning in the sentence.

Signed-off-by: Leonardo Felipe Takao Hirata <leofthirata@gmail.com>
---
 Documentation/gpu/drm-vm-bind-locking.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-vm-bind-locking.rst b/Documentation/gpu/drm-vm-bind-locking.rst
index a345aa513d12..05d1a4e0d754 100644
--- a/Documentation/gpu/drm-vm-bind-locking.rst
+++ b/Documentation/gpu/drm-vm-bind-locking.rst
@@ -362,7 +362,7 @@ while processing each item:
 
 Due to the additional locking and atomic operations, drivers that *can*
 avoid accessing the gpu_vm's list outside of the dma_resv lock
-might want to avoid also this iteration scheme. Particularly, if the
+might also want to avoid this iteration scheme. Particularly, if the
 driver anticipates a large number of list items. For lists where the
 anticipated number of list items is small, where list iteration doesn't
 happen very often or if there is a significant additional cost
-- 
2.43.0

