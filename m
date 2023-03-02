Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4606A8889
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 19:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606F510E53B;
	Thu,  2 Mar 2023 18:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F30A10E27A;
 Thu,  2 Mar 2023 09:18:39 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id y10so12644551qtj.2;
 Thu, 02 Mar 2023 01:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ur3zzFSZ+L9nV38J9531/+rGzVcRq8CFrus3AZSDIC4=;
 b=Ql31hrT5twUkGostOsh1nmd4im63SgW755GgYt3GS4BXhnbkG8ne6ZyhfUlLgo3t3+
 iHwbogagcCXr5FD+AzXCJpunon2xqnGpMzm80nAQm0mANklMJf8j8B3PQGQrRUQ5Blc1
 /rkyJwI0DYUpJJOg0eRIs6XQuQiYNJ3bKPicHU39NmmbjEGTCkm0VDdiE9TJ/VpEwhWp
 cO0JTYBI3RV+TMRJJg0r5lOtSTr7d+mFrg2+q8RSU7YPcX7zsDBYZZnREYN63dEYwcG7
 wgwOWNUl4z9697pEaT35wQBct/CVnR4ZBDtcLPRKpNKJVUfhXNicZxu9kdWysS+NOW2b
 zX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ur3zzFSZ+L9nV38J9531/+rGzVcRq8CFrus3AZSDIC4=;
 b=T/PoDlDR2M03EUiRfmZHpdzSnVgph4xiArSK34/K+4OYC5HZw7H8r1VSzO7iWs1GJ1
 x8Yku4FZ35Mpahs2YxGA9C0PxIaOrDlcNa1Ni6LBlUxek3eLBps/TRViwPBASiPfHBkY
 Am1OTdfrZ9JK1qRVSVa2dpdlZq8OJcvraljnetzRQfAdFzwffjc2mh3Czy1CyKWDIJ1B
 1ICzffCt/BeRTGn53aPpiG/uG8JsnLZXR1CRnUm4lhH1nHkjUhiT083+J4FvElTWZqQl
 MIAXdZl2KND2h5fHMxooP4w+4u6mLjuKNlCIDMzqnJMCO2zbvxiqhw+YbmHRPEFWO2Rb
 vQtA==
X-Gm-Message-State: AO0yUKUfCHnvEzlxsdQ/zCu2QjfQ4NdfIYJg3P6s7cPvg5jsTQJ+bQNl
 ZrRQxTDX3l10L7BKXo6AQts=
X-Google-Smtp-Source: AK7set9SuQ0AOlZ1zc7C0byxOux2y+v0hR+O7KZZvVydEwsFnjb+4DOp3GVQQK7F6g3bXCqz65vwnw==
X-Received: by 2002:a05:622a:15c2:b0:3bf:db42:777f with SMTP id
 d2-20020a05622a15c200b003bfdb42777fmr16599569qty.0.1677748718118; 
 Thu, 02 Mar 2023 01:18:38 -0800 (PST)
Received: from localhost ([45.61.188.240]) by smtp.gmail.com with ESMTPSA id
 n19-20020a05620a153300b0073df51b5127sm10505174qkk.43.2023.03.02.01.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 01:18:37 -0800 (PST)
From: Jeff Pang <jeff.pang.chn@gmail.com>
To: evan.quan@amd.com
Subject: [PATCH] gpu: amd/pm: mark symbols static where possible for smu11
Date: Thu,  2 Mar 2023 17:16:14 +0800
Message-Id: <20230302091614.62093-1-jeff.pang.chn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Mar 2023 18:33:13 +0000
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
Cc: Jeff Pang <jeff.pang.chn@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I get one warning when building kernel with -Werror=missing-prototypes :

drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1600:5:
error: no previous prototype for ‘vangogh_set_apu_thermal_limit’
[-Werror=missing-prototypes]
int vangogh_set_apu_thermal_limit(struct smu_context *smu, uint32_t limit)

In fact, this function don't need a declaration due to it's only used
in the file which they are.
So this patch marks the function with 'static'.

Signed-off-by: Jeff Pang <jeff.pang.chn@gmail.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
index 016d5621e0b3..24046af60933 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
@@ -1597,7 +1597,7 @@ static int vangogh_get_apu_thermal_limit(struct smu_context *smu, uint32_t *limi
 					      0, limit);
 }
 
-int vangogh_set_apu_thermal_limit(struct smu_context *smu, uint32_t limit)
+static int vangogh_set_apu_thermal_limit(struct smu_context *smu, uint32_t limit)
 {
 	return smu_cmn_send_smc_msg_with_param(smu,
 					      SMU_MSG_SetReducedThermalLimit,
-- 
2.34.1

