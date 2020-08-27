Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D045254468
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 13:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92246E41F;
	Thu, 27 Aug 2020 11:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E8E6E075
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 11:37:33 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id m8so3279056pfh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 04:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=COUgfE5wgL7+JbIMZhWB39OK8LsfGvz5zIU2HotEwUw=;
 b=t1FbtLsy+ICubBAtlsbz1SkQasIvOPlqdw0Soqs8z5bJCUvbV09MqGBdXONQs4y2td
 x1xPf0DoSPQd7iB6wbslLO1T7TNnkKswtRRJHOc5frgnCmPSlicxPKpS17XfEr7diuwk
 J9Ik/dFr0PiuJc2Rns4AsWTl7Mo09N7Gog3YyO70AETMT1Wy1Y+IGFOY+Yuo+3wBxz/o
 E5i/INTM20NbgIPIsyuni9ddxeB09kWM7snr0NxJhlV/3n97paTMbh4gLJXDRddhd6MG
 xCg9Ew52lWTvYY3U55JA791d4H5di21HPVIjc8mzY1bNOdXMcwT/DcUIs7pQydYJBR7h
 /5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=COUgfE5wgL7+JbIMZhWB39OK8LsfGvz5zIU2HotEwUw=;
 b=Nt8QYJfDjEk+h1QJhxFAY5Pqk1ymNwBgKbrIfrCYL2i46WCtcuGhL5LDq3Kw2MmvEm
 lw8txQCvgQByC2Qt8mtmV06tCFVj5XUzmsGcL5Mo0pCx4AH03IhkEbrVkeZmxmEAOMbh
 VbUgOlb1hkbavRZyBiR/4Sm4zjM3Ph58HZXa+hfvjd3Cy6J48fTULz3fClHAZLDBi/B8
 YJKA8ZgALSDhbFlRNENNF3MPGhUX3v3iUqNEvw8qrTiEf6+yxUJTsM9D4J+aJtAhEEW+
 6j+GljSsdCB/sqNYd7QKFDnR99t8f4Ee+hSGW8T1GY6X3EnRhGHRANnvHNBlD5fk9WHf
 ZPAg==
X-Gm-Message-State: AOAM530xSv+IYC0a8ehvYvgRQFzFQemOMFhs11ihissSa0qGhGjmqFJ2
 H7f7865X3Oxv/NBq8K0bMl6r1N4VMMijKA==
X-Google-Smtp-Source: ABdhPJxk5AEFhuLdN9oW5c88L0O6g9EhdQsQp8dQo3qJvi+yMWyPuObevFFWiEk460P3fnmI1SZQTw==
X-Received: by 2002:a17:902:6ac9:: with SMTP id
 i9mr16364679plt.128.1598528253253; 
 Thu, 27 Aug 2020 04:37:33 -0700 (PDT)
Received: from [192.168.86.30] ([49.206.125.84])
 by smtp.gmail.com with ESMTPSA id y203sm2772256pfb.58.2020.08.27.04.37.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2020 04:37:32 -0700 (PDT)
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>
From: Sandeep Raghuraman <sandy.8925@gmail.com>
Subject: [PATCH 1/1] AMDGPU: Specify get_argument function for ci_smu_funcs
Message-ID: <f1cb7c18-5580-65f4-9eac-ffc0402963b4@gmail.com>
Date: Thu, 27 Aug 2020 17:07:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Starting in Linux 5.8, the graphics and memory clock frequency were not being reported for CIK cards. This is a regression, since they were reported correctly in Linux 5.7. This was due to changes in commit a0ec225633d9f681e393a1827f29f02c837deb84.

After investigation, I discovered that the smum_send_msg_to_smc() function, attempts to call the corresponding get_argument() function of ci_smu_funcs. However, the get_argument() function is not defined in ci_smu_funcs.

This patch fixes the bug by specifying the correct get_argument() function.

Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>

---
 drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
index ad54f4500af1..63016c14b942 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
@@ -37,6 +37,7 @@
 #include "cgs_common.h"
 #include "atombios.h"
 #include "pppcielanes.h"
+#include "smu7_smumgr.h"
 
 #include "smu/smu_7_0_1_d.h"
 #include "smu/smu_7_0_1_sh_mask.h"
@@ -2948,6 +2949,7 @@ const struct pp_smumgr_func ci_smu_funcs = {
 	.request_smu_load_specific_fw = NULL,
 	.send_msg_to_smc = ci_send_msg_to_smc,
 	.send_msg_to_smc_with_parameter = ci_send_msg_to_smc_with_parameter,
+	.get_argument = smu7_get_argument,
 	.download_pptable_settings = NULL,
 	.upload_pptable_settings = NULL,
 	.get_offsetof = ci_get_offsetof,
--
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
