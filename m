Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76849592A03
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 09:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F076BA3430;
	Mon, 15 Aug 2022 07:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACCAADFB5;
 Mon, 15 Aug 2022 07:01:23 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id 17so5709760pli.0;
 Mon, 15 Aug 2022 00:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=lBxuKExwJiydRUzCxRZG0pdDOfLn9vnu6Gvrg3IOunk=;
 b=N2pYGvniog5ztC4WpHJhrj6BeJx9tktZsy+GCUmnqRhXpAxABkZ5aqV9Q0nkMNfvgS
 ir2vahkblaz1/952V515s81n2Db6xV+r6LR9ZFy5etUzT0MD/rkgSC+aQS18vQ7PeQq3
 EV8RTskC5koFGiIDYAyZETNdqzN0BJQLix4lR7x8vmaMTI14jzOKqJvyAWzXi+Q0FaGK
 xpkXSvzYKRIpRF6K9td0tdRAwp+70PzydSVHL477nXuTwLZLw85Mb7fTaIwvHJdjpPGO
 cFMzSaiNmWBQ2Dq9jDn1rUCV8uFPuuNcsPPCf13pmU2xAAbvM2C3ToEIqPiVa6wQS0Wn
 epSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=lBxuKExwJiydRUzCxRZG0pdDOfLn9vnu6Gvrg3IOunk=;
 b=mXCbsyX+uosUIlED3AMw0bc143z7TxAUdcsJZ3MYwrbeRBwfeOrPqkdKCU4AHKyszS
 NsppbZUYr4SfNnqUaxCc644HFDv25RNi/IHyJVBNPVgS3ir9NrYnAm4ExPEFS+Ogaxmm
 /jG0T5Wr8Mqu3YXEVHHMYPqnR6hgqlErRBcMlDpESl3xOmVLNuFk6Fi4jmN5Gxu+JdI0
 BFp3viSFbmAwxQtWl0US0wFcrCXw2IvNoB11V3fY4T2WOWH1jPJQJ7LZMm4N77k2NzCI
 IIQjavPNYxxHxAXQg/v+23lHKHN61osJONcLU6M3j3W8g/fvOggCvRZPVJTnA4qvrzJ6
 8tHw==
X-Gm-Message-State: ACgBeo0h8tlitg57+kIIJyPDeqzdU1Meu7LYI8qykxpqm8EliDABQ8hk
 +ThTY4ovA0u5AfqvXKFTZzpBej9sbhsSRK4p
X-Google-Smtp-Source: AA6agR7sVypDFOcf7uuBLF8hsvBcfE4nZsErFsVMqm9kaY77S3uHGMBjMpNocX1KWARSUXPR0DWzEA==
X-Received: by 2002:a17:902:d4c1:b0:16f:8311:54bc with SMTP id
 o1-20020a170902d4c100b0016f831154bcmr14884497plg.25.1660546882289; 
 Mon, 15 Aug 2022 00:01:22 -0700 (PDT)
Received: from fedora.. ([103.159.189.139]) by smtp.gmail.com with ESMTPSA id
 g2-20020aa79dc2000000b0052d27ccea39sm6224743pfq.19.2022.08.15.00.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 00:01:21 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment in
 vcn_v4_0_stop
Date: Mon, 15 Aug 2022 13:00:56 +0600
Message-Id: <20220815070056.10816-1-khalid.masum.92@gmail.com>
X-Mailer: git-send-email 2.37.1
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
Cc: Wan Jiabing <wanjiabing@vivo.com>, Khalid Masum <khalid.masum.92@gmail.com>,
 David Airlie <airlied@linux.ie>, Pan Xinhui <Xinhui.Pan@amd.com>,
 Sonny Jiang <sonny.jiang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Ruijing Dong <ruijing.dong@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The value assigned from vcn_v4_0_stop_dbg_mode to r is overwritten
before it can be used. Remove this assignment.

Addresses-Coverity: 1504988 ("Unused value")
Fixes: 8da1170a16e4 ("drm/amdgpu: add VCN4 ip block support")
Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index ca14c3ef742e..80b8a2c66b36 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -1154,7 +1154,7 @@ static int vcn_v4_0_stop(struct amdgpu_device *adev)
 		fw_shared->sq.queue_mode |= FW_QUEUE_DPG_HOLD_OFF;
 
 		if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
-			r = vcn_v4_0_stop_dpg_mode(adev, i);
+			vcn_v4_0_stop_dpg_mode(adev, i);
 			continue;
 		}
 
-- 
2.37.1

