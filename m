Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BADA385BE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 15:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3C910E4E4;
	Mon, 17 Feb 2025 14:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="q03VNUok";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCB910E4E4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 14:17:03 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2211cd4463cso23882315ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 06:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739801823; x=1740406623; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AgZb9vFHqGbbrUhX0AClGPorEmPUShOdtzPqIURbFyI=;
 b=q03VNUokGZtUHUwFYlxzUC0EhQNQczeCvnE5h7ypMH7xwSana5QmwEaDAdDTZi4m5i
 Aw5Cl7afQhcndgTref+cqmbF4ThL6TGJaxnEcqYQ/YhzDBxnUeuB6g39uZ/mSC6FhGOi
 4YPJX2lqWZCD8u3+Y+UaWhZlO55gjO98WJSl3F81+W0VSufwzq/rE56Uzisu4In8TX1k
 Yo6A1F2Cmq48CPOyVdBQg9gTz9AfTh1iEgsZMy4DbDrv8r5le/s8dGA5tAM9TG2/OVnF
 qptT5GfMVaMRiGFMvQHqtzY5SS0egda/7w3H/egYQ2zgvION/TJl3f/OBrtCX+E/gQbW
 yFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739801823; x=1740406623;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AgZb9vFHqGbbrUhX0AClGPorEmPUShOdtzPqIURbFyI=;
 b=a9ogPOvQr50Oxix1jl7YEuMIcGrgQF67w+Ea4c5m4V6/apAGLaNBPsecsqxyH58x0u
 T/c/Oxv3qin3JT+dghCgk2MIznAD7IwgVQBnG4/pj6MMRzSFa8tXeTYxuhzd2G4GEolv
 +RYisW0xT5a86xY8wlKouvLLSdVB4GDTYaUcZ5nZKw14Z/GVejYNTZytQlzds+X6mVem
 a0muHgQ44AWO9Petk6+lNDPuzZJ+plqJgIuRIRYQhAnleKcbZ+yOw2M+3UARdQ1z9A+C
 i+/ztDd8DA4n1/1G5B/ZwAnEBAR9woIIZO9UtyBEexCltRPcS1lV4BCvQbVq5HdkPA/F
 muig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqb5FJZjc//2YY8tXu+4qndR8pzYvHJ6sDnk2hteAwdhRA+Z8HLNUkbYmntC7qIEwUWvjAvqznd5w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxC+9GJqF+bNdJjQ58/SRCxi6O0zAV00iFn7A219+8we4Kul9P
 gaWqwpBuTSChWrBKS2UX666XSOJTToiq9gqnv+bCVdWHiEXEkJQp5Ms1zTF1AHE=
X-Gm-Gg: ASbGncuhVg9/AJZw+EXPLEAb7Hboegd3skn9ksC2QhHFegoE9gxQtu1+1zLx71wrnoe
 dRiMyxFczUU/92/JorKhwUmxLTkMeytI9lV7PM4Yu97gL6zde/FsWa60gw3Dj2cyZqwtdgJDosS
 Rydf+6Vj7b/x/w/1w7w+R7WLAzLa4UyGhFtyoIXZzp9mnBxaQ4XhY/FeVrWhFYCdxw7OduD898o
 Sb1pmpVin5Y3y33NS6KiulIG8A2+y6Gkwv3BE1WsdQRwtxAhwVJyuE6GH7msBp6sba9Bbo6NTCN
 802NrYONcDdD
X-Google-Smtp-Source: AGHT+IFeltiqYZ01XeVBukpD9aotaPbVJK+H+9lmaQXByPgl7WgVurkIerWDOUdc5+qfs9Bzr9iwVw==
X-Received: by 2002:a17:902:d502:b0:21f:3e2d:7d42 with SMTP id
 d9443c01a7336-221040620a5mr151503565ad.23.1739801823386; 
 Mon, 17 Feb 2025 06:17:03 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d5366984sm71900845ad.60.2025.02.17.06.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 06:17:03 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 17 Feb 2025 22:15:53 +0800
Subject: [PATCH v6 04/15] drm/msm/dpu: polish log for resource allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-4-c11402574367@linaro.org>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739801787; l=2259;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=aJOtxV7p2hzo+78dTS+V6QD+6d00i3eKRY4QZgmhCkQ=;
 b=IDE1Zdpu5jFx+kMQo1OdjkeN0YD3cohBgglvXImn3/+XiN2uPyTRmcdz8y2Y28SIQ/cyuUHqr
 5tEYBuNeq+BDREy7yr5nkqDHi2QzYdzRe5eXBuxeMWhgOeSeLWJndDW
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

It is more likely that resource allocation may fail in complex usage
case, such as quad-pipe case, than existing usage cases.
A resource type ID is printed on failure in the current implementation,
but the raw ID number is not explicit enough to help easily understand
which resource caused the failure, so add a table to match the type ID
to an human readable resource name and use it in the error print.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index a67ad58acd99f5c14b9ec34806b83c7a58b71e16..24e085437039e677e0fb4bbd755a8cb3852300a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -802,6 +802,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
 }
 
+static char *dpu_hw_blk_type_name[] = {
+	[DPU_HW_BLK_TOP] = "TOP",
+	[DPU_HW_BLK_SSPP] = "SSPP",
+	[DPU_HW_BLK_LM] = "LM",
+	[DPU_HW_BLK_CTL] = "CTL",
+	[DPU_HW_BLK_PINGPONG] = "pingpong",
+	[DPU_HW_BLK_INTF] = "INTF",
+	[DPU_HW_BLK_WB] = "WB",
+	[DPU_HW_BLK_DSPP] = "DSPP",
+	[DPU_HW_BLK_MERGE_3D] = "merge_3d",
+	[DPU_HW_BLK_DSC] = "DSC",
+	[DPU_HW_BLK_CDM] = "CDM",
+	[DPU_HW_BLK_MAX] = "unknown",
+};
+
 /**
  * dpu_rm_get_assigned_resources - Get hw resources of the given type that are
  *     assigned to this encoder
@@ -862,13 +877,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 			continue;
 
 		if (num_blks == blks_size) {
-			DPU_ERROR("More than %d resources assigned to enc %d\n",
-				  blks_size, enc_id);
+			DPU_ERROR("More than %d %s assigned to enc %d\n",
+				  blks_size, dpu_hw_blk_type_name[type], enc_id);
 			break;
 		}
 		if (!hw_blks[i]) {
-			DPU_ERROR("Allocated resource %d unavailable to assign to enc %d\n",
-				  type, enc_id);
+			DPU_ERROR("%s unavailable to assign to enc %d\n",
+				  dpu_hw_blk_type_name[type], enc_id);
 			break;
 		}
 		blks[num_blks++] = hw_blks[i];

-- 
2.34.1

