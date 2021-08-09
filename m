Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 995E33E4F57
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 00:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C971589DED;
	Mon,  9 Aug 2021 22:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A497895C3;
 Mon,  9 Aug 2021 12:01:25 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id c9so21033084wri.8;
 Mon, 09 Aug 2021 05:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i4If4cpP4LPIaPQs636VHmaLTFfgMpoUmseK3DeS8Y0=;
 b=gE/LA37GWYJJf00sk9Rv7LV4oh2eDaoHMclKUUCqHwhHXETfKaQGoSgdeMsvWxs1Fn
 iAN+gqjRVb32zuHbu8gv5PQ8hw0wWvS8w6l0QeAZmQaG0MX2w7s7cvOZ1jAJN246/HUS
 AsAjqFcg/kIC1Sp6HsWX3JAkwAwsStHjDp0nj5DWEC57jXfFd46IwTs6EcrhaHed4k8u
 j8ZhlgWjoEeNJ6vgB4fhO3USZSYu0/nBtkAIQT3fNyqv/LNhnm9iqlutL7apvDyoZ3x6
 yMtrhUtaTbDCYyMObF9P08AX+rMd98IPI7MmATkzOPwh79Du58owcEt48dxTiF3lWtnp
 eXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i4If4cpP4LPIaPQs636VHmaLTFfgMpoUmseK3DeS8Y0=;
 b=HCQfmT5Z4fJCkAsRWK5KUvZyYEWgnWEED2WTMvXNZqUWP9QRondRJsNbMsJ/43oRO8
 Lszswo77Vqx2WeWkMQU9eAGbbjGZ0KmRqXc5el79N4bFDKGddlrZxhtA5NqP96vNzyt+
 g1gaU1zy4eLUrHLe9e1MPpALNkPAslqNDrCZ51+dHFLIoapbHarsI7dobSxOcmIPhLAL
 hP0CQ2hrPbgdmqWOO16u9mfvAkDruBEEwbX+72HwejRsDSS6MWdmUXqC9VtW6F3SOuN/
 6P+IqmLyT4HMIsBG/eekUwKxMGUOBJRZstv1u+qjHJHxe56QEWfB3CnrjLP7YecGMhJF
 mN8Q==
X-Gm-Message-State: AOAM532yNuJ2AsrJAwTs9Tibq+qMyh1exbNSgmaH9Zo5fwrCz+UXAN0K
 qP6jcj7S96u1O5f6nV2BS9Y=
X-Google-Smtp-Source: ABdhPJz2+xJ2R2cWN2HTp440376o4s3BF7cxkmZov7B1XkOSTkldojCEYJretPMpEuTrnFiMfbMgyA==
X-Received: by 2002:adf:f80f:: with SMTP id s15mr24570467wrp.330.1628510484098; 
 Mon, 09 Aug 2021 05:01:24 -0700 (PDT)
Received: from icebear.localdomain ([170.253.11.129])
 by smtp.gmail.com with ESMTPSA id g198sm26028771wme.0.2021.08.09.05.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 05:01:23 -0700 (PDT)
From: "=?UTF-8?q?Sergio=20Migu=C3=A9ns=20Iglesias?=" <lonyelon@gmail.com>
X-Google-Original-From: =?UTF-8?q?Sergio=20Migu=C3=A9ns=20Iglesias?=
 <sergio@lony.xyz>
To: alexander.deucher@amd.com
Cc: christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, Hawking.Zhang@amd.com, Felix.Kuehling@amd.com,
 ray.huang@amd.com, lee.jones@linaro.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Sergio=20Migu=C3=A9ns=20Iglesias?= <sergio@lony.xyz>
Subject: [PATCH] drm/amdgpu: Removed unnecessary if statement
Date: Mon,  9 Aug 2021 14:00:50 +0200
Message-Id: <20210809120050.679048-1-sergio@lony.xyz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 09 Aug 2021 22:37:36 +0000
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

There was an "if" statement that did nothing so it was removed.

Signed-off-by: Sergio Miguéns Iglesias <sergio@lony.xyz>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
index 09b048647523..5eb3869d029e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
@@ -273,9 +273,6 @@ static int amdgpufb_create(struct drm_fb_helper *helper,
 	return 0;
 
 out:
-	if (abo) {
-
-	}
 	if (fb && ret) {
 		drm_gem_object_put(gobj);
 		drm_framebuffer_unregister_private(fb);
-- 
2.32.0

