Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B92204DA3DE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 21:20:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D71E10E3C3;
	Tue, 15 Mar 2022 20:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B4710E3C3;
 Tue, 15 Mar 2022 20:20:02 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id j26so203786wrb.1;
 Tue, 15 Mar 2022 13:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DTszUtVXhMXCklp1DkwPfLyUBq8IyS44PJQOjnsl7zM=;
 b=SPqWmTFtkfahHl0PUZs9Lg2ZO2M/oEw97UPxTfJ/vQHXox2hjbH8lSKWcWMAHe4puk
 8mF+u7KkA0GwkJH+47537hJBjA9aE+0wp3L8MBZfWI+eYyqtmGkBSCpPy8E4f76r0VMO
 G+jMTTdRvYNumxJE+6+hhRD+mWljFffNtADIU4RGL/EoqeQlbDAUKqFSHuCiU/y2gAjT
 rcYkS43vdDuGxYzmaWpVQ1rG+oLa67n0aP/QSjfNZjyTcTNeTOFu9eNSdoK7pXLolGr6
 MlbLwjNi+iIxEZYKll19BCfQNuuQRQf7yc0gT3Xzp+pf7SM9k6ZeOj7V39CI2N5NC53v
 LKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DTszUtVXhMXCklp1DkwPfLyUBq8IyS44PJQOjnsl7zM=;
 b=YzxzMkV1+yE/6A6E1Fy9WFADvrAmfpxy7bQo75ZpRLhasUpuVj40OcXa3FIvy8761p
 doX+/5aRnko4BWlK3Ej0HqwUKGp46yYYW7u5UD89oFIheagiBLLwwJFV3MXZ9ES/XWsu
 w2DNC7rkPLuYTNODzxHc/27XnYftTfyShK/3c9stUCNg4+dX+kvyIpRN5wbMDewC43uQ
 zIA0xR4cn9xEXh/I4BFuU5sFpEJe498/dOQx0o8Fk4YlHk2G3dGM+kwfBVyzXmlmltRs
 BKVDc5b3M7nnnmL8VbERhe5IxOOBCW/H28oO5ctG5SYlceFcLTFc0Id6H5uQkHzBTI6O
 T8Eg==
X-Gm-Message-State: AOAM530gXjr3Om7LFF24a/+YPqif9+qoK9GIOP9HsOclE0pkPHAMGYz+
 C5X9lEa+muqgxtefvj0+Qmo=
X-Google-Smtp-Source: ABdhPJxQNMuNpDzGV85jK9DavDvA+ngvgzAqBLvkyT6j8b8JEHgSYCJaSLlNbf5IIq5d6udlcm+CKA==
X-Received: by 2002:a05:6000:1847:b0:203:8141:9d58 with SMTP id
 c7-20020a056000184700b0020381419d58mr21770796wri.262.1647375600540; 
 Tue, 15 Mar 2022 13:20:00 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 h12-20020a5d548c000000b001f1f99e7792sm16084895wrv.111.2022.03.15.13.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 13:20:00 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: Fix spelling mistake "regiser" -> "register"
Date: Tue, 15 Mar 2022 20:19:59 +0000
Message-Id: <20220315201959.2952327-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a spelling mistake in a dev_error error message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index a025f080aa6a..9aa355a5ac3c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -919,7 +919,7 @@ static u32 amdgpu_virt_rlcg_reg_rw(struct amdgpu_device *adev, u32 offset, u32 v
 						"wrong operation type, rlcg failed to program reg: 0x%05x\n", offset);
 				} else if (tmp & AMDGPU_RLCG_REG_NOT_IN_RANGE) {
 					dev_err(adev->dev,
-						"regiser is not in range, rlcg failed to program reg: 0x%05x\n", offset);
+						"register is not in range, rlcg failed to program reg: 0x%05x\n", offset);
 				} else {
 					dev_err(adev->dev,
 						"unknown error type, rlcg failed to program reg: 0x%05x\n", offset);
-- 
2.35.1

