Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7DF48F03D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 19:57:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD67C10E196;
	Fri, 14 Jan 2022 18:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E2D10E196;
 Fri, 14 Jan 2022 18:57:37 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id h23so3468502pgk.11;
 Fri, 14 Jan 2022 10:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SfsWlZ8NFWx1uU7iqNfomSH4aDVoXB8WLZulfHDXbiU=;
 b=AxXYGXioXE1+f7CtBSW0vuFQGuUAd3neKR96VsJGT+uTkETY8PP4fDNvWZiatTjGrd
 Bq2zK8rBoROD5kYZADr0RiaMTWBi+CZYxAbEDFZ4rjDEfuR79bZm1QiZLu2YZaHTi2PJ
 9jWykAN+I7uOxZWAIuO5DL35ySbJ7mzH0T5k6EoiLJ5Sge8i7VmhisQkzlPAAFjysAGm
 ztTre6fsBXmne6SQYtwPeZON1kgUVcYqE5kscE8w+RXo945r62emwYRq9gUjqwt+N0Rg
 orv+dNzGhbY4KoBzAQL7Lt38OsjUF/s+PHElWbl/4k5MHOf4q0FB/34dv5LY2fNReqnm
 iCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SfsWlZ8NFWx1uU7iqNfomSH4aDVoXB8WLZulfHDXbiU=;
 b=Kg3/u1AfNhTYojk1hfAogTaD/o/jyH4AFSrzdUJKNK9AUdrPA1W9cSI7LrLuzFA3xp
 b5YlfGq4RVRYSQyzHzeOsyiM9FOo+2Riakqy054io/sLFi5s2rYznLvbcPUzjVUVlKBq
 Vq0xOPxQYZ5QPu5YtOVRYQCJL80vicgAv68KrWt47nOAJ6aMr5rOu46zomFL8kB7lETF
 SAXjQ+ZHRRvGJDlRQ4QswVaRiRKWekhtDOoMqMPz3HtXkVVU+iqgg+IBMtrdhGRNoyAw
 Kq15UF/f7+791UdIY2VsixgjHU7Hj8qo7iWj4U2PRHGXLlhj0m7/Hm7SyEBke8vyNvUX
 2xIw==
X-Gm-Message-State: AOAM5313IO6OeIhkR02hv+U8RLkdf7LOv02L9of8lSFIu7WLTvMaLBST
 3o1ZVNkK+utxp8B4yj29TtvLUxlLQfM=
X-Google-Smtp-Source: ABdhPJyQgrBlfjf4WxO3o5H3yNyytTGW/UpG9pHb6wp7ZenQY6PoaUUorCVedNy4OVKwvZCYXZSMZw==
X-Received: by 2002:a62:3893:0:b0:4ba:7246:4830 with SMTP id
 f141-20020a623893000000b004ba72464830mr10421883pfa.30.1642186656908; 
 Fri, 14 Jan 2022 10:57:36 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 h15sm7017170pfc.89.2022.01.14.10.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 10:57:35 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/rd: Add chip-id
Date: Fri, 14 Jan 2022 10:57:42 -0800
Message-Id: <20220114185742.283539-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

For newer devices which deprecate gpu-id and do matching based on
chip-id, we need this information in cmdstream dumps so that the
decoding tools know how to decode them.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_rd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index 81432ec07012..7e4d6460719e 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -62,6 +62,7 @@ enum rd_sect_type {
 	RD_FRAG_SHADER,
 	RD_BUFFER_CONTENTS,
 	RD_GPU_ID,
+	RD_CHIP_ID,
 };
 
 #define BUF_SZ 512  /* should be power of 2 */
@@ -202,6 +203,9 @@ static int rd_open(struct inode *inode, struct file *file)
 
 	rd_write_section(rd, RD_GPU_ID, &gpu_id, sizeof(gpu_id));
 
+	gpu->funcs->get_param(gpu, MSM_PARAM_CHIP_ID, &val);
+	rd_write_section(rd, RD_CHIP_ID, &val, sizeof(val));
+
 out:
 	mutex_unlock(&gpu->lock);
 	return ret;
-- 
2.34.1

