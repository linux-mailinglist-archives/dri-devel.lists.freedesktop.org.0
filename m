Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C078C5F416
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 21:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9202510EB16;
	Fri, 14 Nov 2025 20:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="SffFV5kP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f227.google.com (mail-il1-f227.google.com
 [209.85.166.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB7210EB16
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 20:37:15 +0000 (UTC)
Received: by mail-il1-f227.google.com with SMTP id
 e9e14a558f8ab-43380a6fe8cso20079885ab.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 12:37:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763152634; x=1763757434;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QxWa764V1q0jSP3H3PqjwIYzJgusmRyNxi7Rpj+TUzs=;
 b=ROtb9NDtTFBUqH6tYEc4/kerKdwOSOidLBX+VM9lVUEOSFbn6gQlKhPym/mIFYkQuf
 s9cZ+YhqO6iki5E4ZsWokCE//0Lw7Z/F4BSYcjg7R9Vry/zT1f2ZG2ZYxF89x+UP+eX4
 wJrsvNr730iO7JZsUOkyxU6MdFxVPfKGkSHmA8a1xtBn7pNmNniWd/h32Ln5HTY05mEG
 xaUr2/nhty+gf93fgUtqTJwg4d5Qnb8VU9u/1GtZQrmzJbLDQ8j2yIIWIcFQf1BivCL7
 MoZAz3hSfGfLIJvg/T4M+jANXlg3dNLzTmVib47mXwDAcyvqe8SakaFOeVt/aPJU7Yel
 IcDg==
X-Gm-Message-State: AOJu0Yw/NncRrbdbD3N98sEgxo+X1QVa4RzWKvSlc7Hr6hYrCzFrtCv/
 FT43hGVKxcgAkceULDBmKsUHkjImdwhRhotCasSvNWWl4pGiyit8jn+glblGm7kt6g9jJ7gsUlf
 VH1HAgP1smahHaJ7NkMhjyJyD+OKNx713HgPe8wRXGq5rrE0SXFRXGsBwuUmLGOO8ZJPYkQuxwL
 IO4WJyeqdV0iZj5gFxZa0N+jHnr4qpsK9WVYNvBRqKaIhrZkY5CrmKU2JKrloILPO9MtYvA/I6w
 37K++LiMEU6rBxLuvPy
X-Gm-Gg: ASbGncuXWjFV/2wsuN/SKnNhhlYqGg99HVPWdU4GzoOim3Uh3m+qOEVubRNLbh8IKvv
 f3CFaCD16wgCYmdCwVsGWWXMpgV1yXud0pR73384a+Gq6NgcL0REC1h8PkbsIt2If4hEH35PfHT
 yTNqNdViWrGAN53GqPjK17DZYOVixQME3xegAeaTHAoyqYyLGSh/bxJnn/SxD1357q4TFY5Q4/5
 VYHWguQioYRkWg9sAWoBnB1rGA7mlsXO+eCYKq1Fmv6ChwKTu2TGVpb9L27CZ7IIsiGaD3ICieJ
 G4ygzg8S3cGjrAf4q9Oq/DoxPK4HNnu5GpMV3gQ9jl2OUW0Byt7saA3yNAtg6p7wAFkGJEVLo1Q
 OWpJkhBFnGsJ8PvStckQgx2IQwmnqVkSvrKu+5IeOFm7aNFIsDP1Yh2NCZ5Poe+1NUgZmDedEWt
 nJmYzNsWE3HtKp8h2yCk/isn4e5qogrgFQ/g==
X-Google-Smtp-Source: AGHT+IEerys7QlCO+KYcI+TtDkhgWL1IQ0GjHrLbkHCyIDoRT1BCzVaVSvkjXtR4OpWkms71gSPtpZGOOaiO
X-Received: by 2002:a05:6e02:19c6:b0:433:31c:ec1b with SMTP id
 e9e14a558f8ab-4348c88f88fmr62464945ab.5.1763152634467; 
 Fri, 14 Nov 2025 12:37:14 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-118.dlp.protect.broadcom.com. [144.49.247.118])
 by smtp-relay.gmail.com with ESMTPS id
 e9e14a558f8ab-434839f98b6sm5599075ab.31.2025.11.14.12.37.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Nov 2025 12:37:14 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-343806688cbso3652127a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 12:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1763152633; x=1763757433;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QxWa764V1q0jSP3H3PqjwIYzJgusmRyNxi7Rpj+TUzs=;
 b=SffFV5kPcRUjVp6Z1kUf01x/TNgyERJAV3bhdIN/gGDR5zm2168rgHUU6xAvMEOT8Y
 HXWzDdvHJgnZxBG350ke9dAe9eShf/ypp31LSdnb+EJHhkBLkJiOPdXU1eu4cjMavW07
 9iPhIJJbuvMEk2M6iZLPlmakIuD1uw7osbKwg=
X-Received: by 2002:a05:7022:e29:b0:119:e56b:9589 with SMTP id
 a92af1059eb24-11b40f8fc18mr1988330c88.14.1763152632652; 
 Fri, 14 Nov 2025 12:37:12 -0800 (PST)
X-Received: by 2002:a05:7022:e29:b0:119:e56b:9589 with SMTP id
 a92af1059eb24-11b40f8fc18mr1988318c88.14.1763152631965; 
 Fri, 14 Nov 2025 12:37:11 -0800 (PST)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11b86afe12esm441505c88.6.2025.11.14.12.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 12:37:11 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 maaz.mombasawala@broadcom.com, Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH] drm/vmwgfx: Fix KMS with 3D on HW version 10
Date: Fri, 14 Nov 2025 14:37:03 -0600
Message-ID: <20251114203703.1946616-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
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

HW version 10 does not have GB Surfaces so there is no backing buffer for
surface backed FBs. This would result in a nullptr dereference and crash
the driver causing a black screen.

Fixes: 965544150d1c ("drm/vmwgfx: Refactor cursor handling")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 87448e86d3b3..4446f25e526d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -767,13 +767,15 @@ static struct drm_framebuffer *vmw_kms_fb_create(struct drm_device *dev,
 		return ERR_PTR(ret);
 	}
 
-	ttm_bo_reserve(&bo->tbo, false, false, NULL);
-	ret = vmw_bo_dirty_add(bo);
-	if (!ret && surface && surface->res.func->dirty_alloc) {
-		surface->res.coherent = true;
-		ret = surface->res.func->dirty_alloc(&surface->res);
+	if (bo) {
+		ttm_bo_reserve(&bo->tbo, false, false, NULL);
+		ret = vmw_bo_dirty_add(bo);
+		if (!ret && surface && surface->res.func->dirty_alloc) {
+			surface->res.coherent = true;
+			ret = surface->res.func->dirty_alloc(&surface->res);
+		}
+		ttm_bo_unreserve(&bo->tbo);
 	}
-	ttm_bo_unreserve(&bo->tbo);
 
 	return &vfb->base;
 }
-- 
2.51.1

