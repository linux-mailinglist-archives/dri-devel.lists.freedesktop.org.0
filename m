Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA4D2A3E87
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5566EC4B;
	Tue,  3 Nov 2020 08:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648A86EB87;
 Mon,  2 Nov 2020 19:36:48 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id t22so7335044plr.9;
 Mon, 02 Nov 2020 11:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MHfdGffEtslcisUCbmOeWSW1VApIiY4Mb7acBIRPvyE=;
 b=iiUFqfdjvBU7bcdjzspXUShhRDTCbo5dH9vmWRO78vkNOfrSrhFjNBpCGfr1Azs5ks
 HbyvxeWs2SsrmO00bICt8cKMJ94AW7vJBmCryOcaIzSrk2JW65JRoJI/iohRUVqX/ZbW
 5p5W590hKKaSGXe4ACQsa4trr7+U7kpTjjqsnaz4m8/a2WpIvCrAHbMq6r4DX4ywfYwY
 8T3jHAdSTGdDp4CRPuuUhgy8l5lZLkyfSgvkmNvxwWE5u6AZUipFZt/wWq/AYuNUnmKa
 AjSvPFKBAiFVe5Z4q26aKtdrPLzGjmu2MoeOZsIE/fMEbwZveMOUrK08jypD/OiTS8kE
 kc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MHfdGffEtslcisUCbmOeWSW1VApIiY4Mb7acBIRPvyE=;
 b=XGx4lkBA6yjiaXv8R2A5CNmQPh1yN8gqpJSa2m/e9+AFmPWvqLaaHsDY6mKIf67iYE
 oGyeYPV/p/KLmgTaK6PIyIhZ5ghkZvWRNtTM4y1J5qPBKF8oRkA5WzZfN6PsPkBcchf0
 NBf/rANepqbHI3heI2gUXkkwA+t41vhSp3q+mxIdeFhva9qt8/KygMbKDLMWAEkP1L+s
 WSgFvzDB/95A78ptbgYfzDYjY1OW9yVKrr/Ghn0EM5KQPScGug4GHtTw3WeBBGTYKcXS
 R1pN/jvGvZSDSU/XyVaPr6FitHIycdC4m7VLVqARlsrvquj1rFXulwTDq+PHYwaGNJf/
 KKdA==
X-Gm-Message-State: AOAM533VuSFO0OfR7xPLznVfqjun7FS2MtGQdWQd6maKSOOJ6zhN6mmi
 x5+nVDVxmSkaphWsPFlNZrg=
X-Google-Smtp-Source: ABdhPJzy9xZcX3I40BwODb2//W/PYSgeWE+3SkP23N7SQ/GgoBHF6dG7cSBPJUz/BgsgMYp9ZiqYXg==
X-Received: by 2002:a17:902:525:b029:d1:920c:c200 with SMTP id
 34-20020a1709020525b02900d1920cc200mr22502370plf.25.1604345808083; 
 Mon, 02 Nov 2020 11:36:48 -0800 (PST)
Received: from localhost ([160.202.157.3])
 by smtp.gmail.com with ESMTPSA id y5sm8213522pfc.165.2020.11.02.11.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 11:36:47 -0800 (PST)
Date: Tue, 3 Nov 2020 01:06:41 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] drm/amdgpu/sdma: use "*" adjacent to data name
Message-ID: <38e48a03d83e2c6bda3f3b71a1d09ca4a27b40ff.1604345594.git.mh12gx2825@gmail.com>
References: <6ad41a97d7805124d2e31c70d96c846cf0d21524.1604345594.git.mh12gx2825@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ad41a97d7805124d2e31c70d96c846cf0d21524.1604345594.git.mh12gx2825@gmail.com>
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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
Cc: melissa.srw@gmail.com, gregkh@linuxfoundation.org, mh12gx2825@gmail.com,
 daniel.vetter@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When declaring pointer data, the "*" symbol should be used adjacent to
the data name as per the coding standards. This resolves following
issues reported by checkpatch script:
	ERROR: "foo *   bar" should be "foo *bar"
	ERROR: "foo * bar" should be "foo *bar"
	ERROR: "foo*            bar" should be "foo *bar"
	ERROR: "(foo*)" should be "(foo *)"

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c | 6 +++---
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index 86fb1eddf5a6..d1150c33d02e 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -568,7 +568,7 @@ static void sdma_v4_0_destroy_inst_ctx(struct amdgpu_device *adev)
 			break;
 	}
 
-	memset((void*)adev->sdma.instance, 0,
+	memset((void *)adev->sdma.instance, 0,
 		sizeof(struct amdgpu_sdma_instance) * AMDGPU_MAX_SDMA_INSTANCES);
 }
 
@@ -639,8 +639,8 @@ static int sdma_v4_0_init_microcode(struct amdgpu_device *adev)
 		if (adev->asic_type == CHIP_ARCTURUS) {
 			/* Acturus will leverage the same FW memory
 			   for every SDMA instance */
-			memcpy((void*)&adev->sdma.instance[i],
-			       (void*)&adev->sdma.instance[0],
+			memcpy((void *)&adev->sdma.instance[i],
+			       (void *)&adev->sdma.instance[0],
 			       sizeof(struct amdgpu_sdma_instance));
 		}
 		else {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index 9f3952723c63..90c47f1801fd 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -124,7 +124,7 @@ static void sdma_v5_2_destroy_inst_ctx(struct amdgpu_device *adev)
 			break;
 	}
 
-	memset((void*)adev->sdma.instance, 0,
+	memset((void *)adev->sdma.instance, 0,
 	       sizeof(struct amdgpu_sdma_instance) * AMDGPU_MAX_SDMA_INSTANCES);
 }
 
@@ -177,8 +177,8 @@ static int sdma_v5_2_init_microcode(struct amdgpu_device *adev)
 	for (i = 1; i < adev->sdma.num_instances; i++) {
 		if (adev->asic_type == CHIP_SIENNA_CICHLID ||
 		    adev->asic_type == CHIP_NAVY_FLOUNDER) {
-			memcpy((void*)&adev->sdma.instance[i],
-			       (void*)&adev->sdma.instance[0],
+			memcpy((void *)&adev->sdma.instance[i],
+			       (void *)&adev->sdma.instance[0],
 			       sizeof(struct amdgpu_sdma_instance));
 		} else {
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma%d.bin", chip_name, i);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
