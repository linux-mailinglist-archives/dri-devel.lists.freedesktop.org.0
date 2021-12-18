Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D826247988F
	for <lists+dri-devel@lfdr.de>; Sat, 18 Dec 2021 05:22:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD1210E878;
	Sat, 18 Dec 2021 04:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.ucr.edu (mx2.ucr.edu [138.23.62.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D55D10E878
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Dec 2021 04:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1639801365; x=1671337365;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HiC3hCK63Qa8Qb4loFRgdeRVld94u+OjjR3csxq5Wus=;
 b=oTm1kivZ5RO7AFZdTFar9PafoVWIMYPZD2hJocATwLG+tIDJZc4k+0Mo
 IE01L4Xjik3/SCRzSeQRdBazPlDSAtAk3c/0jPhXdFrwBH6hOscwpPP8R
 lO6iPO6UxjM+8xGQBI9Na72S40u5ByllSObxMQzWpyvnyuHDrZeohDjNZ
 lx41DmznL1audlOazufOgiNldrEba2cQ506/6cBMrYIU2ptDvcL6fdO0d
 kNRTDICIsBFVjtB5JkGC+Bwaoj/EXIy57ZeyRmKuQuCYqHRXHQfIZZRUz
 d7NIjTM8FY1JpTSZqwAAemhlme8e/CrbDdPm32er8hHHfR5nISGiO/5JJ A==;
IronPort-SDR: qGf1SaWR2Y5/nNg9si0/8I40YsNKOfnVKK6eFuluX44tYohOFiGa1tpNjXf+CXGXyO91K49ZD8
 ZOZccinIOzkLWl1UCcWg5amPucOxQ1XD1OUDSGSLnp56OMcWC+Zxhv0jNwG5VM7qyQvNCY1n4x
 w/CZtWG0VBmL1vio8KSxTWXhU4wUryqnJ1K8G1PfFWliLpSJDgbpSA8kgS+pqXSEqvouGoMSMa
 JRvBRXYHmBo5Hvxx4fYp2SHietseUAcab1SszAsUjiFlP4+zPq9O50IMtfl7RIjyEYVJ7zW3VM
 8Eq+nxC5j8bVQc+JaqjVz0NA
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; d="scan'208";a="206501067"
Received: from mail-qv1-f72.google.com ([209.85.219.72])
 by smtp2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Dec 2021 20:22:36 -0800
Received: by mail-qv1-f72.google.com with SMTP id
 a7-20020a056214062700b00410c76282c3so4446473qvx.4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 20:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucr.edu; s=rmail;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uFquvFdIStXIJTsPn2k5rBU0qh7wG0l4oiCoU43pQg8=;
 b=bXlm2lS0L1cyH2tSCF4kf3SQ17o+srdPcNuSX0IN5fdxXx90fPQz8j0OTE/DIoDyNG
 NBLMGRGfhKW/vXeGz0RyOrwHJPODREbZxxtNpZqx1FHpckyz9EkMB+GVjII3tzO39jqR
 54F6vn74a8bEU6PVKdMbAqjnZHWPkSh7B94io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uFquvFdIStXIJTsPn2k5rBU0qh7wG0l4oiCoU43pQg8=;
 b=3zjn5vMetdCn/OupeHWt4HQfY7foWUKV2mt40MBZ5l5zkAx9TwMhrVpdyN9oI7BRuz
 QWu2pXkvYWIH3508gOCX+3tkW1Vo/c2V7XtMOr/tN/SJW249O2uGl+5TTgbWCcK/cesn
 IZT+7b1GKZhd2rgI58mSdnRMEqmJg7dG0tyvasC7kCCLcCP5E0ZDIVLgF4KhEqRm89Jl
 DlakzcJDs5QZHKuvL2qkXIwyPs25bTZjpsjmVh5Jn+CIhyi7DyLMKXzYpy+21NF7hsiR
 RjP1RH0jy1pYXPW0o0se2jvJS286mfutx6h7odQK2HXkxAUdSLnJB/4yNrSAPJTnlHBr
 P7CA==
X-Gm-Message-State: AOAM531L8berHCVM9OUw+LmTqUv/+Em8X/Syz2Cv7N8w+G9UVcNpKl7y
 iUs03vWsJUZ2LlJVdF8fvcNB/rdMPT/rinwzjTlywrzw4LbzzzyXhXfKWJK1FPO8nSPdqZO4tG2
 nd1PorVcsQsza7j42w45IklBlgg9yIg==
X-Received: by 2002:a0c:edca:: with SMTP id i10mr5323761qvr.62.1639801351936; 
 Fri, 17 Dec 2021 20:22:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyE3Tagh5RgslGVJv/eRvjbgxu42RfzRLSIimsqstN4aB/aqSAgEsFtcF+iB7KjMXViNfFsrg==
X-Received: by 2002:a0c:edca:: with SMTP id i10mr5323738qvr.62.1639801351765; 
 Fri, 17 Dec 2021 20:22:31 -0800 (PST)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
 by smtp.googlemail.com with ESMTPSA id s20sm9081682qtc.75.2021.12.17.20.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 20:22:31 -0800 (PST)
From: Yizhuo Zhai <yzhai003@ucr.edu>
To: 
Subject: [PATCH] drm/amd/display: Fix the uninitialized variable in
 enable_stream_features()
Date: Fri, 17 Dec 2021 20:22:23 -0800
Message-Id: <20211218042226.2608212-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.25.1
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
Cc: David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 Jun Lei <jun.lei@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 Jimmy Kizito <Jimmy.Kizito@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 amd-gfx@lists.freedesktop.org, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, "Guo, Bing" <Bing.Guo@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Agustin Gutierrez <agustin.gutierrez@amd.com>,
 Mark Morra <MarkAlbert.Morra@amd.com>, Robin Singh <robin.singh@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Yizhuo Zhai <yzhai003@ucr.edu>, Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In function enable_stream_features(), the variable "old_downspread.raw"
could be uninitialized if core_link_read_dpcd() fails, however, it is
used in the later if statement, and further, core_link_write_dpcd()
may write random value, which is potentially unsafe.

Fixes: 6016cd9dba0f ("drm/amd/display: add helper for enabling mst stream features")
Cc: stable@vger.kernel.org
Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index c8457babfdea..fd5a0e7eb029 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -1844,6 +1844,8 @@ static void enable_stream_features(struct pipe_ctx *pipe_ctx)
 		union down_spread_ctrl old_downspread;
 		union down_spread_ctrl new_downspread;
 
+		memset(&old_downspread, 0, sizeof(old_downspread));
+
 		core_link_read_dpcd(link, DP_DOWNSPREAD_CTRL,
 				&old_downspread.raw, sizeof(old_downspread));
 
-- 
2.25.1

