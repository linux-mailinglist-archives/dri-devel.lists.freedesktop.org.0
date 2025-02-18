Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A2DA3A3A6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 18:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F13B10E73C;
	Tue, 18 Feb 2025 17:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GPjg/7pU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2B410E457
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 17:08:34 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43964e79314so53420215e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 09:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739898512; x=1740503312; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=22DLucK3+Yc7gD+u5BwcgCf4UC4+6P633YUEKabQtVs=;
 b=GPjg/7pUJsEnEglg4k+B7Rdun4bXFXgEYxocqNT7KK/ase1OQmGernQGkn3qiA7JAl
 vQ6y+/Yfte7Xw4P2/VIsA7GxxdGNm/ikkLziZ7sYMTYQvmt5KjPxrNfAEKrc6EPlvE59
 eiZLanAsN0HO23NTq++PAImVOVrsa7OeAM9EEjRPwmXcA6GypyKrp/DvQ+Ay1RQ9U/PA
 ERSucNQjVREYI8eVQ7XqquUUD891WmsnFWSSAAlawrNEDSch9gZf1GLPhJ9WJbgpdqTi
 4ES8VAIJdBSp1Z5dEbC6ESBJkmBceT/xmXWNdwDF12uXe3hsemPQbtZwHhy7T7OSfo9S
 5lmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739898513; x=1740503313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=22DLucK3+Yc7gD+u5BwcgCf4UC4+6P633YUEKabQtVs=;
 b=Ti2e1AF4GjCClWp5yUERlLEbCVzDciqWOKNw8zgLp1Kauw4UecqjhiUWFa5hOZGM+d
 iaLVOEM89tHNaZ6rjrAHuOpm2BJrYOng5B7vkMOyumwHCg743VCpkJgXjIi2pSWagxoj
 0cCxOAkxgcgrgpcUssZKi7KnHn3miI1mpc7q0iYiIwPXCX6TDFFG8S7MiqrU0sjfYzY4
 TU9p5b41ZutgRKlyqeTznS+bsSDtVV2p2aYxpz3MNrYb42oN2E3JsSnMcRHwKkDuK65t
 ZFnvCBJasQdB1uf433iYBEZHe0AdMRdJZHUcQCSOteeTZjTzxIVFhQlyiiw6+bxKRqsu
 WdTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6Teu2MT3yBVhfbKasS2F+JkvEOL8DamHG6Ihr6u56Kz0PyuzRU5whvopfgUuK+2K0JhEPfLNE8zU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCdatiDmKxaW8C/KEEJOqf82Z7CqiQdpyvLHEhPg1fK4HDo+ke
 hZL8GFBR7Bbv1Ecatz2W3lTvPRmHEOIQVUHGCNVZdIoEFLR3mxln
X-Gm-Gg: ASbGncsdsDAwqaoLobRTDFTBim/xmI++uESMEEgPA/A5Gv7IOAlGs3FT+MLZsHurLwb
 uittPFXhSHkehfnvwO2H2AGGVEg2bQvEJ+eswqeogNNPIHCpJ53JZ5FkeQaOLYNmRhaNyjm2xfc
 Df+8c525ozA8+hS8UAgF4KWDLvSGQyYg7Aa8m2pNsVoA6Jz/zgju4pIE/SvX6JlDiaKF5aKvaG4
 4kZwzB6E9Emtwk03LMzSwdKkchy4mBK5numDXFr+XoNB/J37XTloA0ooGFspANUwU2OpBW5mYqi
 5eZXmc3aXOVu+WQkag==
X-Google-Smtp-Source: AGHT+IGiD3HptGQJEipMmcpgiCAIU0akacuYmIdP7lpU6nnc+z3is2VM6M2uT+zI0Es6m92LwRl5VQ==
X-Received: by 2002:a05:600c:4e8c:b0:439:99e6:2ab with SMTP id
 5b1f17b1804b1-43999e60444mr3652025e9.28.1739898512471; 
 Tue, 18 Feb 2025 09:08:32 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439941bd54bsm24680135e9.11.2025.02.18.09.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 09:08:32 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 16/16] drm/vkms: Remove completed task from the TODO list
Date: Tue, 18 Feb 2025 18:08:08 +0100
Message-ID: <20250218170808.9507-17-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218170808.9507-1-jose.exposito89@gmail.com>
References: <20250218170808.9507-1-jose.exposito89@gmail.com>
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

Remove the configfs related TODO items from the "Runtime Configuration"
section.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 3068879ce1fc..0a5fcf0b3114 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -225,21 +225,14 @@ Runtime Configuration
 ---------------------
 
 We want to be able to reconfigure vkms instance without having to reload the
-module. Use/Test-cases:
+module through configfs. Use/Test-cases:
 
 - Hotplug/hotremove connectors on the fly (to be able to test DP MST handling
   of compositors).
 
-- Configure planes/crtcs/connectors (we'd need some code to have more than 1 of
-  them first).
-
 - Change output configuration: Plug/unplug screens, change EDID, allow changing
   the refresh rate.
 
-The currently proposed solution is to expose vkms configuration through
-configfs. All existing module options should be supported through configfs
-too.
-
 Writeback support
 -----------------
 
-- 
2.48.1

