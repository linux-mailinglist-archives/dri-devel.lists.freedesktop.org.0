Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3782FAB7E80
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 09:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A9210E769;
	Thu, 15 May 2025 07:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OR5NtyQ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE69A10E025;
 Wed, 14 May 2025 21:36:18 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-30a99cff4feso349532a91.0; 
 Wed, 14 May 2025 14:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747258578; x=1747863378; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v5+DNS9xaFvD08mwIBHjANTPXx95oyivENI1zztffOE=;
 b=OR5NtyQ+e5d71Q3CAIAfHOWhmaVqxeYVWMkQDdvL7m6eIjGQjS8xxSirbXrh/PIe6N
 6BmRO4SGKYkqOGLTvj7AKjjrkskbzR2AdFcNIrz06HR4szD8ZKSv1mPSsEaYAh+2E9Td
 7FRq2m/2drN0z+qUyH+VHNR3sMRp/z+aJJhA4q2waEjOai8ADnMn6SfZ9nvmvxt3PIuo
 UhM3NEVdSFWdVyhZwawLyic+JA6xdEfSVeXU7TVBx/yW4taLgwcuFrF5ePwpXlRxuQnt
 QrOjpEa5H7dI5EGb18JPc/MNalyjXl51LogyL2W7KIqI19aaBG5u910hYqeMDUBd5txC
 A3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747258578; x=1747863378;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v5+DNS9xaFvD08mwIBHjANTPXx95oyivENI1zztffOE=;
 b=HFcWG/RKIyNjVr3WHCBGEmTr9TxRm/5LnS+MnpSI858PCB33kyM6BmzjhKBl/nlMAK
 z9NA5HlC1mHoxvYw3Ax3S9vbVAeiCykIsQ+nadgGD/4EJexaO9/bABpJ4pgNC4hNdjNf
 uJuoqNtUudnPV6X0is9AEbXSMxx4ddhxCuuCTTwGSBOtUQ1eYKQX9flyhM8qxjuO3y94
 Feu5DM+mXBNHCRa09QyOkLW0e1Ao6fL17r43mJxp5dsYhmmWrHEahQOgFx7BaaRTgRrP
 BZq3Sgf7ptw9cfP0aJs+FV8rkGwh7gJy0mSxKrjby+U29/Lg5+ZEi6JGZkrRL2zx+FZH
 BM+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPtGoFZWDT8pDNHiKQYqkzWnikz54gQyAXoxTO0hWZN7EKzbfmLdkq5Fqs0gUPoL/L6isQH2P8PMg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCD5idBm3y6l6He0r/9bBjpFkBOMbjChGZAXDCiAPHJZPdKDMO
 LUuwvD1Etn2vPpbTSDVNiws1nF7cbUAfU+sEH0IXcCBMlleRXJ5o
X-Gm-Gg: ASbGnctgrN4bVFLSYUjYhFf9M8nAH+W/2yo+86M0HHWc3iqGR1jy8rhSKg26xSW8NQI
 ApBcVYpprXDo1VRpRNn0J9VXfPq1zfPh+SQh44Z18YPeQacNj0wW+OnlbvEtLUx7KCR2R9Ni+in
 IsFsB7+7jbcfWjcnNmSehmtld9Z1pY3eE2PtRSciULbUcZ1xl0yiRJyN+9ocnQ14nxddGODBVO9
 NFx4NEuwm+YhMXrdH2dBtgO6cQMIZVQg3XPRNjJWupG8UUPX9tG/T7eQofFmyMp9pBxQVqtpzOv
 8AuCxuO+ymicIOSkdKnPyeuUbkJGhT921yukzr0xTDA/RO1ag+KZpSZJTutngkMwjA==
X-Google-Smtp-Source: AGHT+IHOlcKTEqpmbbwYa6fymXr66iLa7UzzLeEx4mTbWzk9LmvInpwWaQApBbo8ZP8SyJLL2+etOQ==
X-Received: by 2002:a17:90b:1c09:b0:30c:540b:99e with SMTP id
 98e67ed59e1d1-30e2e5b678cmr7925932a91.13.1747258578130; 
 Wed, 14 May 2025 14:36:18 -0700 (PDT)
Received: from rahul-mintos.ban-spse ([165.204.156.251])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30e33425194sm2026770a91.14.2025.05.14.14.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 14:36:17 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, skhan@linuxfoundation.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 rk0006818@gmail.com
Subject: [PATCH] docs: fix doc warning for DC_HDCP_LC_ENABLE_SW_FALLBACK in
 amd_shared.h
Date: Thu, 15 May 2025 03:05:11 +0530
Message-ID: <20250514213511.380890-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 15 May 2025 07:09:42 +0000
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

Fixes a kernel-doc warning by correctly documenting the enum value
`DC_HDCP_LC_ENABLE_SW_FALLBACK` in the DC_DEBUG_MASK enum.

The previous documentation was incorrectly formatted and incomplete.
Updated to follow proper kernel-doc syntax with a full description.

Verified fix using `make htmldocs`, and the warning is no longer present.

Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
 drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 4c95b885d1d0..ebe0caf1fda4 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -366,7 +366,7 @@ enum DC_DEBUG_MASK {
 	DC_HDCP_LC_FORCE_FW_ENABLE = 0x80000,
 
 	/**
-	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
+	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK: Enables software fallback for HDCP locality check if the firmware fails.
 	 * path failure, retry using legacy SW path.
 	 */
 	DC_HDCP_LC_ENABLE_SW_FALLBACK = 0x100000,
-- 
2.43.0

