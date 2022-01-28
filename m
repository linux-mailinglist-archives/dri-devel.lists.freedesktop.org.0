Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0384A2DCC
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jan 2022 11:50:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F20910E14B;
	Sat, 29 Jan 2022 10:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62BD10E7DB;
 Fri, 28 Jan 2022 09:27:53 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso7730295wma.1; 
 Fri, 28 Jan 2022 01:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CS091XzEzoAHOCH+W/UyduhGkZsqrIdDMgBdSqoCcpo=;
 b=hshMphxIhDJjd8wz/XCTf9sG1j4yjdSB5F3LG3yO0jyaupBJR9xz+YQaV765Y5kH6O
 uz5mgvD8j47gpIVvoRpH7ovVglDn7Ncc66JJVNkLmKAjW71m6FQKOeqWiIh5PNIotr3q
 FAYKNaoDMyGsNNziHp5CYfK1YIxfFbUs2RQGs+1MDDvrKpmbxOejL37g/n8f15zYy9Fd
 St6LLugKQvRb2b4eFPJo5TcbP37FfK8WTVwS3j9WaVCyoW8KyQy23ER0Wzz5Y/AzfpCF
 ST7gQrkd8u5n0EEWQYOUgvMxA855sPAG27WKmmxLZBvoD+T0caZLk0EdPt3F+FGi7EOQ
 7+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CS091XzEzoAHOCH+W/UyduhGkZsqrIdDMgBdSqoCcpo=;
 b=Y1PTTalqYitQzYCJxdl151EmvnxXpCJhz7Vt+QmRJZArEQ+gpUQR+oxBhR1329Od/q
 3JLZbV3DEqe5Ak0TbNytKaxoLeggGgiYeAP5eTVD8cKq4/KCGlvnDz12H0gZo1/ZXcL9
 Q5GVrsuK8lDtjQ8BF2jw/Zk3FP6TPpzHLE4KranW5xpysEUtqB6/li8L5WivohS0rZ1s
 YlPgt6NHCANtz8h+k1dwI2r7CF/Rg6K4OLuiHYcTvflv+XuLoMYcszs7B5GRtI1rPni2
 M9xJMRbOiPgujjHocmBKuXhN9NUUjeab2d1kNmC+kzCdjX3/KQfOzL6gsGXWmLri4nSm
 2+Kg==
X-Gm-Message-State: AOAM532UPU7eKZjVXiebGzrLlbUIPZzdjFMwhVSVajifGswt6W4UGvGa
 UvqnpKo3P7dMKjQUJD+XIIjsFpj5M9I=
X-Google-Smtp-Source: ABdhPJw8D66rjld6L8qeoS5ngWtmYyTWjMRJEykBje9p8zqY/V3QSAo1ErhTpM6Cu2jVvnr1tT1U9A==
X-Received: by 2002:a05:600c:6028:: with SMTP id
 az40mr15217262wmb.33.1643362072333; 
 Fri, 28 Jan 2022 01:27:52 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id c8sm1605684wmq.34.2022.01.28.01.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 01:27:51 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amdgpu: Fix a couple of spelling mistakes
Date: Fri, 28 Jan 2022 09:27:51 +0000
Message-Id: <20220128092751.7679-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 29 Jan 2022 10:50:33 +0000
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

There are two spelling mistakes in dev_err messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index 80c25176c993..06d3336a1c84 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -919,14 +919,14 @@ static u32 amdgpu_virt_rlcg_reg_rw(struct amdgpu_device *adev, u32 offset, u32 v
 						"wrong operation type, rlcg failed to program reg: 0x%05x\n", offset);
 				} else if (tmp & AMDGPU_RLCG_REG_NOT_IN_RANGE) {
 					dev_err(adev->dev,
-						"regiser is not in range, rlcg failed to program reg: 0x%05x\n", offset);
+						"register is not in range, rlcg failed to program reg: 0x%05x\n", offset);
 				} else {
 					dev_err(adev->dev,
 						"unknown error type, rlcg failed to program reg: 0x%05x\n", offset);
 				}
 			} else {
 				dev_err(adev->dev,
-					"timeout: rlcg faled to program reg: 0x%05x\n", offset);
+					"timeout: rlcg failed to program reg: 0x%05x\n", offset);
 			}
 		}
 	}
-- 
2.34.1

