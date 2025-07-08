Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6464CAFC861
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 12:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D15210E5F0;
	Tue,  8 Jul 2025 10:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bS925b7N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F81C10E033
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 00:48:03 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4537edf2c3cso40366515e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 17:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751935682; x=1752540482; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YSn52M56yjzHQIR5J828LB8d9xrk3LfotYJtBZIJgRI=;
 b=bS925b7NAPI1ZFSoeLSuAAfHurusJ8vj4XtAz0gYpAtYepLiriJ0CL7o8bG5p4NNLQ
 MlgRkX39mPVtLDpn0qMf1qPmfDT275dCysB+NJUgkoHhPYAjsJBgCb2trCA5niuQcj3S
 WQQ8AnktBa/2xF8TD1upA39OVYNuMFMqf3iAqWqUaZi5rCeOyaUfxB0rHFuQ0RZDkOhW
 4mZVtEK1mMqTEHhvxqND7PBqrTB2Le6+sBGLGIzI0ezJDJbC7lysc9Gv6lMY7ARfVBB+
 A2qXiiMOxpPAl7WjIuI1KYFNciIxaokS4I1yyD9WE8t/7nZHykjVxpNW7VVsCMDBuIpw
 fbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751935682; x=1752540482;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YSn52M56yjzHQIR5J828LB8d9xrk3LfotYJtBZIJgRI=;
 b=ngdPGzm16Ghct+s8rJrR1QGWKmCaG7ZRs0Khvx9pmwVDNuA9zOcl9G9ql7qHwTz0Vt
 gpiwk9hJlTSxnDSuexNupPS9LtumZ8yakw5Er0STYd78rtpq+mMN22IMoWiMimGnDitc
 liMeqOIP6CJ/2fdTvy0GU7mwmoEbDzcXV7WpqiT45ACZfnUa5WFtvy5JEPk4EXf90/w6
 6bCCzkUeLXv8eY2ooKbKWMlo+7xt7VlWNKU6tmYUtIN6UP4rC18+Xizuq9Y3yaZaFgol
 AORWh14hjivsKZnZJXbbbHOlOqRWlmhU9xhMvOko9S/opQUu9jVuiox2OwvgUXvGDjEX
 bv2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuWyCjauIZOowCq//0SNumGJTZY57a6KxNNHDUKB1Ngynv998bITbswtMKCS8pMr2E5Dvky3849DE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5JXj5FS3aK44aQU58ieRhI8tADTWMw8XEfkv8u4CIrDBpZAMm
 Iye7jd8YJCrzjYyXXGRLutyzpmBTUU/G4h84uJWdZ42cy0Wl4w68jjaJ
X-Gm-Gg: ASbGncv+vqeLEqXx0iJX1CNQDIm0FnK8p6/tWrRUmY5a9H7JuJ8iVN4S05QnWrhPgYt
 bNLJzYPjBJuC2GoaKfgmZygKinoeKW1ielOVdjnLDBaeAnPbYT8V+bRNj9VlKLYfpO/SvkKvgTg
 Fp5AqoNzECZGVlzgrKxyXLXpc++e2h/hoAoZOoo049EpkBi3M2a6/fF3b3S9WH4JU8BmvvXcT8z
 lDUNxJAod03E42hrC4BqjGbfUSy010qKjKYIirCaLez0onsYmSgXSppITZHKIEAndPBRgPbESU1
 rT4EaFlbgzH+fQEUO5vtRqxMP1Ya24YKfprrJZ6qE8Nz5C1hdV3ovBtXPPD7/fSv/YFYXrY0Vt/
 pSoQ=
X-Google-Smtp-Source: AGHT+IGJ4dP8w5g6hpev8HIQOasgA+wtMF5Q7BTmSBjCSF661zBqxSTmgFB03VmUSIC5zOxHBrEonw==
X-Received: by 2002:a05:600c:3b26:b0:453:2433:1c5b with SMTP id
 5b1f17b1804b1-454cd4baf8dmr6686095e9.5.1751935681656; 
 Mon, 07 Jul 2025 17:48:01 -0700 (PDT)
Received: from burak-MiniBook-X.. ([2a00:8a60:e00e:10f7:92ef:ff1c:488e:a26e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b471b966cbsm11354484f8f.49.2025.07.07.17.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 17:48:01 -0700 (PDT)
From: Ibrahim Burak Yorulmaz <iburaky.dev@gmail.com>
To: maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ibrahim Burak Yorulmaz <iburaky.dev@gmail.com>
Subject: [PATCH] platform/x86: Add panel orientation quirk for Chuwi MiniBook X
Date: Tue,  8 Jul 2025 02:47:39 +0200
Message-ID: <20250708004739.9792-1-iburaky.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Jul 2025 10:27:43 +0000
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

The Chuwi MiniBook X (CWI558) uses a tablet screen which is oriented
incorrectly by default. This adds a DMI quirk to rotate the panel into
the correct orientation.

Signed-off-by: Ibrahim Burak Yorulmaz <iburaky.dev@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index c554ad8f246b..c85f63c42bbe 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -282,6 +282,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Hi10 pro tablet"),
 		},
 		.driver_data = (void *)&lcd1200x1920_rightside_up,
+	}, {	/* Chuwi MiniBook X (CWI558) */
+		.matches = {
+		  DMI_MATCH(DMI_SYS_VENDOR, "CHUWI"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MiniBook X"),
+		},
+		.driver_data = (void *)&lcd1200x1920_rightside_up,
 	}, {	/* Dynabook K50 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dynabook Inc."),
-- 
2.43.0

