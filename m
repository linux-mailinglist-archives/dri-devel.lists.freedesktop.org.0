Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D829E98FEC8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 10:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7280110E8F0;
	Fri,  4 Oct 2024 08:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kpPH/93h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB53110E8F0;
 Fri,  4 Oct 2024 08:16:36 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-20b1335e4e4so17952575ad.0; 
 Fri, 04 Oct 2024 01:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728029796; x=1728634596; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EpHwQlBLt9aUuZVqI52DbACRCcwYewzEXJNWbf21nvo=;
 b=kpPH/93hbHeOIBVxiPIdPSFfo9tyLjWchudR5Kpf8/DCWDsNoiJk6ZikAgS1RKB/18
 JnOFYm/XWEQXRAguhiEdO1zxfJUi+H30T/mwFWQ7kQfkQsFcWdL+sT4uG1ZOe3o+z6y5
 Dd4H1MagZLzxbSqnSfey6PxsUYPISwfrWQT33MGYQK9Yb2Z3RYOZ+iBI2VETjjZtJ4/f
 hSkKU8nK72lBG78oPhSlPARkBiC1CO0dVEDt16dhB65Gn3ctFtXM5CF6WPbIls6i2id4
 dA2CCGprsrnp3EuT+bEeUCAG+Dzws+hdYNEt8DNdJoIK0UHch7s/7MM2tzI1IEqg0yrx
 QtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728029796; x=1728634596;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EpHwQlBLt9aUuZVqI52DbACRCcwYewzEXJNWbf21nvo=;
 b=UwrMZ1DdFufiM490nIISPOTGhG6mKcsw9J5I8FiqpOfErLuAHEPOADiBRU0eopYDoL
 HzPVJxYQj+cZPia6DcaC09jkOo5P+t/GkPMLWRq53hQkos2QFv4TdjuOhl0ID38G+/9q
 03yXwQk44GBQakggC0bRX1kY6GHK+SC6v0aoJ3M55Za6IeoUfq7xOhru/B8FdsWJAF72
 3lJhinU981/2jc3Te5fhct+TfSH0jAbA3ETf8oy2/8L+WCdZkC74i6wBMhALX++3mN2t
 3d5PW12mO0I1BtOZG6bkP22J1+h3iKJUBINj0NXFAuwRFWiggKWCgxO8vkWpg+Q6bBat
 4arg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdcNedMMoOVro3cc/Wh59ScFUmVT+VwTlEpXBAJb9vqTF+1qCllkQQlPtnOBM8Wv6HtftAgB890fk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8qBvtWw5m/GubBUKUYfjjWmfAYu/zWil7bhE6JwKmcNPFSks+
 NF/RZUm3B9i4rKKpWLk6Ql882Hm1IUH6JSg6f/wttMFzMhp3bwS6
X-Google-Smtp-Source: AGHT+IESstItqCuBNL/elHzMasRvg1qmLhXnxawENnsB30tcavQLHFcDrefZED0ZlkxVd/XHEigKaA==
X-Received: by 2002:a17:902:e551:b0:20b:4875:2c51 with SMTP id
 d9443c01a7336-20bfe024d5cmr32004945ad.27.1728029796105; 
 Fri, 04 Oct 2024 01:16:36 -0700 (PDT)
Received: from advait-kdeneon.. ([2405:201:1e:f1d5:4e5:4fce:4f6a:9764])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20beead49b4sm19832125ad.32.2024.10.04.01.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 01:16:35 -0700 (PDT)
From: Advait Dhamorikar <advaitdhamorikar@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, leo.liu@amd.com,
 sathishkumar.sundararaju@amd.com, saleemkhan.jamadar@amd.com,
 Veerabadhran.Gopalakrishnan@amd.com, advaitdhamorikar@gmail.com,
 sonny.jiang@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 anupnewsmail@gmail.com
Subject: [PATCH-next] Fix unintentional integer overflow
Date: Fri,  4 Oct 2024 13:46:18 +0530
Message-Id: <20241004081618.27599-1-advaitdhamorikar@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix shift-count-overflow when creating mask.
The expression's value may not be what the
programmer intended, because the expression is
evaluated using a narrower integer type.

Fixes: f0b19b84d391 ("drm/amdgpu: add amdgpu_jpeg_sched_mask debugfs")
Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
index 95e2796919fc..7df402c45f40 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
@@ -388,7 +388,7 @@ static int amdgpu_debugfs_jpeg_sched_mask_get(void *data, u64 *val)
 		for (j = 0; j < adev->jpeg.num_jpeg_rings; ++j) {
 			ring = &adev->jpeg.inst[i].ring_dec[j];
 			if (ring->sched.ready)
-				mask |= 1 << ((i * adev->jpeg.num_jpeg_rings) + j);
+				mask |= (u64)1 << ((i * adev->jpeg.num_jpeg_rings) + j);
 		}
 	}
 	*val = mask;
-- 
2.34.1

