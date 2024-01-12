Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C79882BE12
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 11:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DCB10E1B1;
	Fri, 12 Jan 2024 10:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA2210EAB5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 09:12:18 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50e67e37661so8314524e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 01:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705050736; x=1705655536; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U5fHJerOb90cwlcti5b/xGaL1H5BmgZVl2HamtZSIec=;
 b=W1OdR9M3wFbe/lSPuIYILUE6pyGKgmzyT4RwH0YW4pKkQg+aOzVsl5+WN88Ij9L+Qm
 2MGqC96YrgIsCisgav+Rgfd/a0pJTLSSmEaSgRXVtzLNudpBnVmNZXyHuwK1OuG9JxzU
 QvwSJZSE9J3zh4pY75A4GRiMg+WXSaIWcw92tLP3e3fZ0wWrLQOx8Zy0uLwFAplJaqO/
 HhVcpEJgNn21yMH8qd4BHLBGY8G7FCdrpuuO7olTKiOktTdk4aJC1/454QoGZwMj/Y2E
 yDbZFuSL9OU7nJTcdoKd/tpHJkljJMomi4BwQ1j5m7EzAHVh4noERSthIU5W6k9xTnoz
 AptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705050736; x=1705655536;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U5fHJerOb90cwlcti5b/xGaL1H5BmgZVl2HamtZSIec=;
 b=Dau3uUSu5Ld5uo7zD+9mMHkjwIsJrkAjWywuNa2328DDXcdJ/6nRlaQhGCguAwWgxF
 FB2mM0ny+7+b+LYXx7dHzJWleGhw9giy94AapRXS+neOlHADgdHMMwrdPBnLeiMBg0z8
 cBPPx54z3Cl/e0tHMKQ1jPFJ6iro5IzhkNPFilKoh82jR6iJVwqOO+5PPauNJBotGhkg
 eiuDqyp6OkaGCSDhH1OdSKPJahAvkG+a1tlPlUACQ07lzr4lCqErIi4RImN5XfT0cjMV
 az0f5B88c2pGoyJzgkYjoMZQBfreLTAe4kLiliqbI8d8lid4gm06TKpMGvIWKPBx8itz
 Ql0w==
X-Gm-Message-State: AOJu0Yw82/BYDReiYG/BvuNXTpm7m7nC+0uF8Drrx9sfhDRbPOA9q0uF
 ViSFiLhfdgLeUo6acg/LGS28panyWno=
X-Google-Smtp-Source: AGHT+IFL0JRSFSJRX18rSJxRbV2v1EcJGdEZRkVxZoFCgjpLxRv/LvW1iG584qamhcwSHG3uRM/POg==
X-Received: by 2002:a2e:2e1a:0:b0:2cd:5a05:7a85 with SMTP id
 u26-20020a2e2e1a000000b002cd5a057a85mr587435lju.84.1705050736286; 
 Fri, 12 Jan 2024 01:12:16 -0800 (PST)
Received: from archlinux.htlwrn.ac.at (vpn.htlwrn.ac.at. [195.202.162.6])
 by smtp.googlemail.com with ESMTPSA id
 l26-20020adfb11a000000b0033762d4ad5asm3313322wra.81.2024.01.12.01.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 01:12:15 -0800 (PST)
From: Alexander Richards <electrodeyt@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: make compiler include linux headers when compiling drm
 for managarm
Date: Fri, 12 Jan 2024 10:11:55 +0100
Message-ID: <20240112091158.101973-1-electrodeyt@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 12 Jan 2024 10:06:39 +0000
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
Cc: Alexander Richards <electrodeyt@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Managarm mainly follows the Linux ABI, and so needs to be in the Linux
path when including needed headers here.

Signed-off-by: Alexander Richards <electrodeyt@gmail.com>
---
 include/uapi/drm/drm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index de723566c..875499d8f 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -41,7 +41,7 @@
 #include <asm/ioctl.h>
 typedef unsigned int drm_handle_t;
 
-#elif defined(__linux__)
+#elif defined(__linux__) || defined(__managarm__)
 
 #include <linux/types.h>
 #include <asm/ioctl.h>
-- 
2.43.0

