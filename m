Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D8EB06986
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 00:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200C710E69D;
	Tue, 15 Jul 2025 22:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="l/kPPqir";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0B110E6DA
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 22:58:49 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-73e5d932ab5so479272a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 15:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752620329; x=1753225129; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dQdS/fnesxZHeRTbK+njettpxhb9T3PJtvTTlq4Hbyo=;
 b=l/kPPqirYsZPtX9w8YMJqfk6aLgUP69VB02X9pN3Z0/87toKBr/B/BYhuIwMfHQ/1x
 sR6bMkQ0l74KvfL9kioFian9GizNa9T0hCO65te76EXamyn9/BoH4FkPz4eMuh8YJue6
 nwIXOiB/S1QlLHC/cRx0Vw/A26SCfiIwIwwdVSCMZLGoPy668h/06jSq2x2ztHa/oiwQ
 Ge6WaEi1kMxYx8WtwebBQt2bFWsXTwT92tr2F3lRgKXpRVSjI/hwzypPxl91b3BKgddF
 9GhfXY9jlPD/x8UOPiz2psxRz6l5HHdq03BFlRM09OaUyx265zLDXpoepO3CbrZeeeGB
 UsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752620329; x=1753225129;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dQdS/fnesxZHeRTbK+njettpxhb9T3PJtvTTlq4Hbyo=;
 b=iaVTTmPEG53p8OP+2VTOI8daA3CMaN8AUo3st8fRvwgVpr0JXeeZp4ocv9D3yU52gS
 X0GWoFcqb/IC7HvEKlipWlV7KuBobfaJOBs9vcAs4url5RLkg6mdJeWUscUAvpIW8uSh
 fpj0ZkPRW9M1Q8p+FNn/1CeTskGl7KFCxzv2mKzulVuFxZ9qyJbR4gXEKOaimv2VpNA0
 thixxAxoSTicnyyJPWNlWRC3vLj0fChiZ3UK8IOASMiZ1MrSMxLtlSmt3yn8rFLOTg0i
 i1f3dKZ8rfz8enB6ly/35a3+VO4rNPjhFnTDgGcPR7+j4OtK/hqcBrTUjngAhHj2nLzG
 onBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxIkDm/IltTSwEaUhfI40cHHhenGTAYrAtmn0/cnSYULqiVi8JJSWMPqABAGuyG9336KuQdRv7hcE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyuRY3Pna8meSekrreeU+ZHWRnDj/cUHDyxQ9Ig8UInOfDA/pz
 LMTR/3aWlNOcGNajElDOGYwrmU3xXN0nSxExLv9rfI3E5gpUM96nbV8mKhKZp0q0fF0=
X-Gm-Gg: ASbGncvXdV1rKw5nFLX69CMS1Khm27P5u5DKnP7CyaPjhbrKqegLFABdTfEN02MWnnd
 5ZN+EgRizDf2weoz0JSIPqsgrx+rgzWyN2E6dtXhq0diS6hmL0Nb5BrQvgchuM02/SKNj2DTDN7
 0gTop4QqddVdk9OEMkeWjbsfw0bsWqU9WNe7C0amcqT27y8sNm50qyCxksDV6lz19avAMEIcTTo
 Eft7EdMqLJmdXFSd9Gq/p3n+243CiQDzxEjAs6fl1ikLjORtV/viXxFnNFqeL5CgztH1f00LBDV
 HR2KXUtL6NZJ5tZHWjxmClxLzDVMoVJC/PXEcJbWAVIZ3pUniIaUuLqjC9xnG2eZ6aW00xSZe/K
 qsNSO/wW62AtP4FDXbCrTZ9el2Zac
X-Google-Smtp-Source: AGHT+IF8MmVG4ypCu726fhwqLEetif2ChyidvWvdhwWbSrW4wyOjZnawR/MGOE0avl2B+dB2nPbJkg==
X-Received: by 2002:a05:6830:2d86:b0:73b:2751:eee2 with SMTP id
 46e09a7af769-73e66613225mr334520a34.23.1752620329043; 
 Tue, 15 Jul 2025 15:58:49 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
 by smtp.gmail.com with UTF8SMTPSA id
 46e09a7af769-73cf10857b2sm2518429a34.16.2025.07.15.15.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 15:58:48 -0700 (PDT)
Date: Tue, 15 Jul 2025 17:58:47 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sunil Khatri <sunil.khatri@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amdgpu: unlock on error in amdgpu_userq_create()
Message-ID: <ef53ff29-4d1e-4f07-a431-c0b91578f93b@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

We need to drop a couple locks before returning if the kasprintf() fails.

Fixes: c03ea34cbf88 ("drm/amdgpu: add support of debugfs for mqd information")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 492f1089316f..c3ace8030530 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -521,8 +521,10 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 	}
 
 	queue_name = kasprintf(GFP_KERNEL, "queue-%d", qid);
-	if (!queue_name)
-		return -ENOMEM;
+	if (!queue_name) {
+		r = -ENOMEM;
+		goto unlock;
+	}
 
 #if defined(CONFIG_DEBUG_FS)
 	/* Queue dentry per client to hold MQD information   */
-- 
2.47.2

