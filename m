Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BBF3912D1
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7E06EC45;
	Wed, 26 May 2021 08:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D387E6EC2F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:51 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 f6-20020a1c1f060000b0290175ca89f698so15003568wmf.5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GJer5W/toWhPsUhogBXg4zIXSRSHg7fRSySLo0mmvxU=;
 b=c4kUnaRXN1uSNT9CNqKjLxGgwMYV5KPLAkWSyqK5DOgFijFCdPEer5ag+RhVskDw8W
 xD5Wm1G3uhkJQFCh9CEozH8HaqWRsKb3lQa6A8QKchsv4XF45F0g4L4kIRz9YnJzeM6J
 R9O4BkOK8yTJg2L9Eh3RQJB2LisUZWeHoD0TKD7j6TAOWauUevORNcMzXlaLCANb+nWS
 vhmPGu+ZC+SIosHydMuuyePzdK5IqegCQydfd8NglfJf/fOqcywr3kvB2QvDWBTF3LPY
 XXV0kLgr0qrY8mZm+YmZwRmFB/vZoQRUvj0bOzwp3/0UAd60jYd5IU8l8stUaFHUn7kj
 YJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GJer5W/toWhPsUhogBXg4zIXSRSHg7fRSySLo0mmvxU=;
 b=rc82f5Ud/3L4mfhk1H9g7ZcMIDbxsgtgr3SmJo1InZaKm3APkzp5ijIgv/KpptVIEP
 AYBKPpxSZjSW/OOeNf5tw4PPV5bFuC/kH83UbvxOm34oo8MYGlxl980t/xc35iXL0V9I
 d7HekaPF0t+3TtctcOgd8BMXBHvHwU81N8dTNG38o/YW35of6MpzIttEFCLcMyxuFUHj
 5LZZaqHa5jCkaVH8c0lX75uLWLUmSrRJt/68UhjVDXUqD3XbOBBhjpkTTzzAbiIGbvmX
 ++ql4rWL1fmJvjm9i5+/4jywWD2+oBkXoT9Di1SXjzK6JLaE/pHe6iB47+h/ZcTxkyVT
 AQ1Q==
X-Gm-Message-State: AOAM5336+vf2j0tTTF1ujy9XomaP1yFkKu+Ras0qX/vozhU90tWPAgDn
 g+eNpn0jJ3xATZqgqkedzv6avw==
X-Google-Smtp-Source: ABdhPJwHBmPkTr0OwYKxXZYQj65BdllZ8Ja6Z0GE6xo0CnlLEphmyzg+9I2oJbQU8XCK/MwCALnPqg==
X-Received: by 2002:a1c:e284:: with SMTP id z126mr1717895wmg.108.1622018870506; 
 Wed, 26 May 2021 01:47:50 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:50 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 19/34] drm/amd/amdgpu/amdgpu_device: Make local function static
Date: Wed, 26 May 2021 09:47:11 +0100
Message-Id: <20210526084726.552052-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4624:6: warning: no previous prototype for ‘amdgpu_device_recheck_guilty_jobs’ [-Wmissing-prototypes]

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 4a040f89ca5aa..f15e180762d2e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4692,7 +4692,7 @@ static int amdgpu_device_suspend_display_audio(struct amdgpu_device *adev)
 	return 0;
 }
 
-void amdgpu_device_recheck_guilty_jobs(
+static void amdgpu_device_recheck_guilty_jobs(
 	struct amdgpu_device *adev, struct list_head *device_list_handle,
 	struct amdgpu_reset_context *reset_context)
 {
-- 
2.31.1

