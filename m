Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A31872D7B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 04:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC9E10E6CF;
	Wed,  6 Mar 2024 03:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="koYUx7Rf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8005A10E6CF;
 Wed,  6 Mar 2024 03:24:25 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-2210a266118so1179333fac.1; 
 Tue, 05 Mar 2024 19:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709695464; x=1710300264; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YY8pprhlY2hfjI+DczSHGBDtQSXX8a4KHHRyaWkDhB0=;
 b=koYUx7Rf2RIGQOWxkpt917ls0e+ruCePeWLJd6jE1MNtT9NGK95Rj2yNZXsIDlztSt
 eM70sLkzEpbpHemReFEBxSRXaYJpVVGBdRG3fT1j0Yn2pwuNqond/8KB668sbNfjiFVG
 rDVJDchgPtES8uA7lPGETcMkMU08iA9sCdjo7bSI4o0XPOHffWNveEB7KaKvigph7Ozd
 YlFfERsm0seQxqubUWmJPqLmVbltB4Ofk3oxFXixM40L7NytaN4dLikNHZw99Lw00Zs5
 BbN9xRvs4ruVHQctbIWFZSULsRqkXvuTmnAG1F7UbDdoORLmhPXS7E9qpmEqnkSe/hek
 L6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709695464; x=1710300264;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YY8pprhlY2hfjI+DczSHGBDtQSXX8a4KHHRyaWkDhB0=;
 b=RKy/PlYaYtNTyOQRyW5KzDNJxdNbfm533URXooJKX8Q5SwlPG8R7gsie0fQvPosH7e
 Zz//GlR9b0dAJeIJBu0vTXTgsD59fU5hxZSN5nVX8DU+Fz9U8Wy86kMM24cKuhs1xNYa
 SEAjBGqr5JCg7AWz7mLb5eSJY0SryfbcPBjMH8GJ0xUf6vq3Y+DGcyeYBuUfd0w+gbbD
 Er9uFRgQfHI970MqEcnqELjHPGhy8lFJzozEzoLun7wl+xK3HCJhOLQQVHWUxvcFQ64b
 QhG9wh0iO1e6q0cWhR8jxKskWoDKmQY7XtwfP8htDSuiVaiMQUZwfjxO5qn/6PjImu89
 61Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCViDJqukJSDZN+wFWWYV7LyvjMwh+gczMD+RQxXO2NhgvN/L2vHQZegr5lvLEt1TvHTU9Odqxj0BS77SqkebUAn58nJyY0N1Nx7kE+yJ7IW
X-Gm-Message-State: AOJu0YwOmvoBjs9wBNt4qL/l4nOci6Lj0ZUFBrqX4M7UltvLSLdzxbOg
 /stafJOTICjD25bZP96ze2AyjMepCs6xVaoELMjfeLyXUSO9hlft
X-Google-Smtp-Source: AGHT+IG/qPbUHBENxg8B/NMPAY+Iva1zLONMjiTm2XMFQUb8yAin0rmXFmVqAKQdmhrKgGpK008ing==
X-Received: by 2002:a05:6871:2218:b0:21e:e069:5852 with SMTP id
 sc24-20020a056871221800b0021ee0695852mr4336776oab.55.1709695464513; 
 Tue, 05 Mar 2024 19:24:24 -0800 (PST)
Received: from kernel.. ([2402:e280:214c:86:d881:224e:f9c2:b24a])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a056a0008d200b006e5af565b1dsm1824624pfu.201.2024.03.05.19.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 19:24:24 -0800 (PST)
From: R SUNDAR <prosunofficial@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, rdunlap@infradead.org,
 mario.limonciello@amd.com, mwen@igalia.com, swarupkotikalapudi@gmail.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, R SUNDAR <prosunofficial@gmail.com>
Subject: [PATCH] Removed redundant @ symbol to fix kernel-doc warnings in
 -next repo
Date: Wed,  6 Mar 2024 08:54:14 +0530
Message-Id: <20240306032414.18488-1-prosunofficial@gmail.com>
X-Mailer: git-send-email 2.34.1
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

For linux-next repository.

./drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h:1: warning: no structured comments found
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:132: warning: Incorrect use of kernel-doc format:          * @@overlap_only: Whether overlapping of different planes is allowed.
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:132: warning: Incorrect use of kernel-doc format:          * @@overlap_only: Whether overlapping of different planes is allowed.
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:1: warning: no structured comments found
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:132: warning: Incorrect use of kernel-doc format:          * @@overlap_only: Whether overlapping of different planes is allowed.
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:162: warning: Function parameter or struct member 'pre_multiplied_alpha' not described in 'mpcc_blnd_cfg'

Signed-off-by: R SUNDAR <prosunofficial@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
index ba9b942ce09f..34a398f23fc6 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
@@ -110,9 +110,8 @@ struct mpcc_blnd_cfg {
 	 */
 	enum mpcc_alpha_blend_mode alpha_mode;
 
-	/***
-	 * @@pre_multiplied_alpha:
-	 *
+	/**
+	 * @pre_multiplied_alpha:
 	 * Whether pixel color values were pre-multiplied by the alpha channel
 	 * (MPCC_ALPHA_MULTIPLIED_MODE).
 	 */
@@ -129,7 +128,7 @@ struct mpcc_blnd_cfg {
 	int global_alpha;
 
 	/**
-	 * @@overlap_only: Whether overlapping of different planes is allowed.
+	 * @overlap_only: Whether overlapping of different planes is allowed.
 	 */
 	bool overlap_only;
 
-- 
2.34.1

