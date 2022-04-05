Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1FE4F572B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 10:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B0110EDFF;
	Wed,  6 Apr 2022 08:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774B710EC96;
 Tue,  5 Apr 2022 21:38:04 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id e16so690833lfc.13;
 Tue, 05 Apr 2022 14:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bxKqK2XNY4gRVlPJC2xJqtnMP47aAtqK7bCRdORZQrc=;
 b=pPMhHD+MAeCOHNTEHA/NpfXCwZpLhzs4orOzrp/sfSfjhe/NVw9jqmSdaz70eZjqcR
 5o+2PV5F7QxxcmHTa8f6dNstumF3Bgv/gf8pWeNhL92TVdFP5PDHzDOoRJk5nLuBT0nS
 Jd1XoFDylIGl8besXC0b/wp9t8DBqdw1LRLz1HySjABgaPBfJls6Zszkyb83sFtIXLBl
 x7DLWhNpP05EDwn4zDvh3/5kTeSgrs/vR5QgrL0lKRUw9/WB6jSazvA40N5k1wEL+bJi
 2+PfQeE4zNpnRiCg30HJ7RKvxj6OZihDtemYYzyAROjixwHBVKJbKZ0wixHYaNKh9va7
 t1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bxKqK2XNY4gRVlPJC2xJqtnMP47aAtqK7bCRdORZQrc=;
 b=Ab24FmdqHZ21blDO7qvLYPcMbIgNe0usNQ7oVr0Dem1oyZrojli6KwcfLUnQJv0VIF
 0he1xe6vfpF8L5q7TNSP7vobrhDCM0Fglh7LZ1FR0YJuhfLxURQgn9WSUYTprju6z/76
 FXqWQXEpy1Ex6FrHPlt39ap/99267BAw7r5TYdeqxvdJJbjLeOvPnpC0JXefQ6vkreIS
 9WZ5tE0SJbPyRnYxLfVomtVBrO//xqij5rvNuSPpPrwiLhf75WrkAr33L6bZUW2SesuY
 wlSeHk1ji+iDgxXot/bauEIGchE6EGiDPTuUSGVnNpbq40DmBHU2iVMWjQ2r3UmJot/4
 53TA==
X-Gm-Message-State: AOAM5328E28PAC71RfZwGNNp9NAUDsSBpG2WZjNiwqOnF9XXUj2I5hqQ
 DC4JEnB0l0Y5OG3R+1FkCCI=
X-Google-Smtp-Source: ABdhPJzRzL5AGzm3x9i2e6gg3GsjIDzn3cmvURvQmjY6sxRLiGWhAVY1LXX59+ePvChm1x9/n+eryg==
X-Received: by 2002:a05:6512:3d8e:b0:44a:3ad1:8bae with SMTP id
 k14-20020a0565123d8e00b0044a3ad18baemr3806975lfv.231.1649194682658; 
 Tue, 05 Apr 2022 14:38:02 -0700 (PDT)
Received: from noname.. ([2a02:2698:8c2a:226e:6d9:f5ff:fecb:a8ab])
 by smtp.googlemail.com with ESMTPSA id
 v17-20020a2e7a11000000b0024b127cfc2bsm1033175ljc.127.2022.04.05.14.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 14:38:02 -0700 (PDT)
From: Grigory Vasilyev <h0tc0d3@gmail.com>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH] drm/amdgpu: Unnecessary code in gfx_v7_0.c
Date: Wed,  6 Apr 2022 00:37:59 +0300
Message-Id: <20220405213800.90205-1-h0tc0d3@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 06 Apr 2022 08:00:38 +0000
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
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Joseph Greathouse <Joseph.Greathouse@amd.com>,
 Guchun Chen <guchun.chen@amd.com>, Grigory Vasilyev <h0tc0d3@gmail.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The code is useless and doesn't change the value.

(0 << GB_ADDR_CONFIG__ROW_SIZE__SHIFT) = 0
gb_addr_config | 0 = gb_addr_config

Perhaps there could be 1 instead of 0, but this does not correspond with
the logic of the switch.

Signed-off-by: Grigory Vasilyev <h0tc0d3@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
index 1cb5db17d2b9..5ed84a6467ee 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
@@ -4409,16 +4409,14 @@ static void gfx_v7_0_gpu_early_init(struct amdgpu_device *adev)
 	/* fix up row size */
 	gb_addr_config &= ~GB_ADDR_CONFIG__ROW_SIZE_MASK;
 	switch (adev->gfx.config.mem_row_size_in_kb) {
-	case 1:
-	default:
-		gb_addr_config |= (0 << GB_ADDR_CONFIG__ROW_SIZE__SHIFT);
-		break;
 	case 2:
 		gb_addr_config |= (1 << GB_ADDR_CONFIG__ROW_SIZE__SHIFT);
 		break;
 	case 4:
 		gb_addr_config |= (2 << GB_ADDR_CONFIG__ROW_SIZE__SHIFT);
 		break;
+	default:
+		break;
 	}
 	adev->gfx.config.gb_addr_config = gb_addr_config;
 }
-- 
2.35.1

