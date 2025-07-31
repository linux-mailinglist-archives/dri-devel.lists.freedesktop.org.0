Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B93DB16C9E
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 09:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69EF210E70D;
	Thu, 31 Jul 2025 07:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Snu0vmw6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8195110E702;
 Thu, 31 Jul 2025 05:36:52 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3b78d337dd9so337703f8f.3; 
 Wed, 30 Jul 2025 22:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753940211; x=1754545011; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5L5CPo11vx1WT5kIB7Vz4RYoRKGO5r44hwwfolXkFs4=;
 b=Snu0vmw6ccPoPj+eWYQtopQLLZC4ckXG3J3Vo93YVr9IBLmbxEP/Kcd3eH5UqyJYR+
 BKeu+ShpJPSBURS7Gxn7ENUBCiVl7dpieo5Lm3FEffNtkV+jTYhx5G9FEleG5JYsIw25
 cpjZI+cHQroAd4jJBnGJ0/ygIU41qT0Vbz2UOWq0tOYAZv8LXO5znjg/h6JF2//XBVxR
 o+UUbVQTyA2mTo66lkW0Rsuv/yclLpMQecWhbPz8YsMnyCCpWlGiXfgilAfQ2H9FwVZa
 G2W+p3RrditoJTIxedNm2sEQ/tkysK18jUHqrQJe7Jw1sdYLCgdw+Un6YCVZGukpcnjm
 cZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753940211; x=1754545011;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5L5CPo11vx1WT5kIB7Vz4RYoRKGO5r44hwwfolXkFs4=;
 b=ll/InVjlFx0pCYLxLicgMrUOG03EZ5x3IYihTspSUzPoBK2TNUT5h64RqSXKRZwov3
 oUkHMd9ZcB30l9DVgOLiylz7KxrcOsGOJXDMMefBfUxA4VyKdeieZisx9916YA1LBrZY
 Moz9Z0D1K6x7kvceUpREL6FOKuitdfHcupcNtC0E76U1YMPEMgvMy5aV3Ckv9hht/Skm
 4UqajhIGW8KfcTXwbEsF4LMBLkbGpobp5H/ejz3D8pRtLmvjbpb19O0vAMsMVwgzTbaL
 2UyXuupQuK+urH4D0KfWz3HdGfRf39gMKo42mHs94lAXEcK9JqOheq8+k7h0LIkf+BNA
 G9ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj8nTMUQ3acTZGbmBPUNH6q9ObLIp0TDTjKWrxABIT35hTbpdu+dVnflW15c19tMGeBdpnIK+Kj+Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5aG3pWdSZa8Zy+7poTCkcqa489TyLpry0Ud5PbFQDcPmjfYNl
 s43utRPcbv/tCmMF5D3pvelMkYj8PRj/hRvf7Mrxa9Xou1iFPA9ybHN+
X-Gm-Gg: ASbGnctEmOAsAfMELKBgacInbol0KI+X5z6PoZU5PNMpwroUi4K0227Rvi3Gvph8gkn
 Fa71yRYIbvlaFJ49Nmotp564xdeHwsWSQ6cOXg22Ng4CvrdsJd5gsD7Ms0Z6eEnXNctvpkZh5h5
 vCr42fx06s6sYqsnQZSqOGkz40koNTsq26YW5wskzryS1QCDDQQnF3eiC6pUm2iva9woo5w7Phd
 vgAQXXh1MVOTvEAH3hshMmoBu4WJQC/op6E/r8IOaY8stoy2w3K1oZUU1y1OBPwfoZvieL+FF9H
 Ak9dGhb8MiTzbwvMcHgzcuV72UrXrLodJWrnM/Yz/QkkA9Pi8Os0DdxK931avjFtV5a/qCsZyN6
 zEcONgBXjaMgrMVw1wiX+x5MSH+NnpB8L8JSBzlkFc1SGId1Hsxw3cfjIbjUkx7ogb2ajSeg=
X-Google-Smtp-Source: AGHT+IEEFZqWGgNeRd5nb5UBRZkfnTiNiCgdeRhXusb9GlwFSioJhj2kNspsCCRhW9Y+Hhgyh9TqGA==
X-Received: by 2002:a05:6000:40c8:b0:3a4:f66a:9d31 with SMTP id
 ffacd0b85a97d-3b794fd59bbmr4759177f8f.16.1753940210946; 
 Wed, 30 Jul 2025 22:36:50 -0700 (PDT)
Received: from [192.168.1.205]
 (dynamic-176-005-138-071.176.5.pool.telefonica.de. [176.5.138.71])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac093sm1149137f8f.9.2025.07.30.22.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 22:36:50 -0700 (PDT)
From: Philipp Zabel <philipp.zabel@gmail.com>
Date: Thu, 31 Jul 2025 07:36:38 +0200
Subject: [PATCH RFC 5/6] drm/amdgpu: don't wake up the GPU for
 mmGB_ADDR_CONFIG register read
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-b4-dont-wake-next-v1-5-e51bdc347fa3@gmail.com>
References: <20250731-b4-dont-wake-next-v1-0-e51bdc347fa3@gmail.com>
In-Reply-To: <20250731-b4-dont-wake-next-v1-0-e51bdc347fa3@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, 
 Philipp Zabel <philipp.zabel@gmail.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Mailman-Approved-At: Thu, 31 Jul 2025 07:23:44 +0000
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

Don't wake the GPU if libdrm queries the mmGB_ADDR_CONFIG register
value during amdgpu_query_gpu_info_init(). Instead, return the already
cached value adev->gfx.config.gb_addr_config.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2295
Signed-off-by: Philipp Zabel <philipp.zabel@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index fe1347a4075c4..ed4d7d72f2065 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -883,6 +883,16 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 
 		alloc_size = info->read_mmr_reg.count * sizeof(*regs);
 
+		if (info->read_mmr_reg.dword_offset == 0x263e &&
+		    info->read_mmr_reg.count == 1) {
+			/* Return cached value of mmGB_ADDR_CONFIG */
+			regs[0] = adev->gfx.config.gb_addr_config;
+
+			n = copy_to_user(out, regs, min(size, alloc_size));
+			kfree(regs);
+			return n ? -EFAULT : 0;
+		}
+
 		ret = pm_runtime_get_sync(dev->dev);
 		if (ret < 0) {
 			pm_runtime_put_autosuspend(dev->dev);

-- 
2.50.1

