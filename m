Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6A49954C0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 18:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99EFA10E596;
	Tue,  8 Oct 2024 16:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="gPcfHI0h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB7010E594
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 16:44:51 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-42cb0f28bfbso55033105e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2024 09:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1728405889; x=1729010689;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2l4FLyzwOuwNRQ0BH8EkMWwB8eDzTs5gmrCiRkeOxgQ=;
 b=gPcfHI0hH/yZV4G2inHUm0MEPHGjythpEGtr9pwrUtKaJygpl+eEgH7YUkEtT2JlJj
 UaBRYGws3768nzRLs2o4370JzKyPZgBsT1bK+opdWlNqD5SrSg0IjVcDSU7ukvSy839G
 m3elc2rgR8qIXwJzJCok2XpecsEoTbmz41V4gJctvhbdBfIZTN/ChJGwVXlkbvtYmuGv
 luxxuuLT0/UAFICHfY5mNEmN+aHU3c9vzW0v8PshA9plwRR4teGBTKkc94KwPKVFt6fC
 ZjhmJciSa/muRegqnBk4mbx8KqtlknYSn9grN/9QY8j+hd1rZxsQilQ+4aFESBH05Hej
 FNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728405889; x=1729010689;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2l4FLyzwOuwNRQ0BH8EkMWwB8eDzTs5gmrCiRkeOxgQ=;
 b=sTVJmzoPl/ICJLKyhmzKIUpSOBJGcGb1jJkf29f+LeEkz5A2Bzh7B07xLMyGley5iz
 Q+9F8mwINAF7+oCVSiPcpikX0ci/ZaQAuRpW7P40yCdO5Lr/r4yVD7JzOpPBwtUtmL57
 4VdtQ/TECurl8b7molRaLmCuGl2KfXE1VuQVgl/y90mhk20ASKM0Qy/+s7qQZpDGKysU
 ALNQMXg7avKPJNXQac/9HtYFiHXfn8+WV8eRv4FsXSJL1ib+JQ5AgHMjh7a69z9INwsJ
 lLzCAmBE3Fh4hVMdvCpt74j0i3SSdT1Cn+6BV6ekcxHLKizbLvgsxKoW6Si07SCnavZ6
 7RMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPsTzrKAnS4BPUWNmsBMKQUthpD4jsbZRSI990ncy6pkEfcQM2/bBemgK2cDb5eW5LojhGAlTZAGg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKhhG/TALII7rfimGGIyoYbtbaPYgPmEW/W3OhJwOkPaZjaUqr
 EAahqShKyORqG9mfVI9+KHH68tvpCaEElFSi9S1KQG0Afb+hZcPd8ik3qq+sfsI=
X-Google-Smtp-Source: AGHT+IHutSlQhM1lnWVmLyvUAsNDvxWyNHWdvnQugeExpuf3dCs4jPGscvamNYC8t4b6FoA34h4a+w==
X-Received: by 2002:a05:600c:35ca:b0:42c:bae0:f05b with SMTP id
 5b1f17b1804b1-43023094011mr28998195e9.1.1728405889355; 
 Tue, 08 Oct 2024 09:44:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42f86b4acddsm132133155e9.44.2024.10.08.09.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 09:44:48 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 08 Oct 2024 17:44:36 +0100
Subject: [PATCH 3/3] drm/vc4: Correct generation check in vc4_hvs_lut_load
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-drm-vc4-fixes-v1-3-9d0396ca9f42@raspberrypi.com>
References: <20241008-drm-vc4-fixes-v1-0-9d0396ca9f42@raspberrypi.com>
In-Reply-To: <20241008-drm-vc4-fixes-v1-0-9d0396ca9f42@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
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

Commit 24c5ed3ddf27 ("drm/vc4: Introduce generation number enum")
incorrectly swapped a check of hvs->vc4->is_vc5 to
hvs->vc4->gen == VC4_GEN_4 in vc4_hvs_lut_load, hence breaking
loading the gamma look up table on Pi0-3.

Correct that conditional.

Fixes: 24c5ed3ddf27 ("drm/vc4: Introduce generation number enum")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index c5ebc317188a..1edf6e3fa7e6 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -224,7 +224,7 @@ static void vc4_hvs_lut_load(struct vc4_hvs *hvs,
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
-	if (hvs->vc4->gen == VC4_GEN_4)
+	if (hvs->vc4->gen != VC4_GEN_4)
 		goto exit;
 
 	/* The LUT memory is laid out with each HVS channel in order,

-- 
2.34.1

