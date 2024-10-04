Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA644991356
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 01:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37AB10E0CB;
	Fri,  4 Oct 2024 23:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m3mjtcKB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5887610E0CB;
 Fri,  4 Oct 2024 23:59:20 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-20ba8d92af9so20765435ad.3; 
 Fri, 04 Oct 2024 16:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728086359; x=1728691159; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ELTyDzpdOksZjoNrVzCSOk+1T+6UJusdniGL8nRZ6BA=;
 b=m3mjtcKBEZbGCHoUncmYMN1Ij4ULPef/bPmXtMHo4PgXQdVD/Hg1Vyl/Kb9KiVhwi7
 VEk7uQbZc5VC8rk7t4ijz2VPdtfaz7RUuEuqYuJPWpfIlTJ4vKl1zXpE6yKDM4iO+i7B
 pMVgR9riWVlnMVLul0f9xM/zmkLM7+qIEVWELU8BjMLx4BjcfVzKiG/ckQPEt/e6xCnP
 sR7Kqyz3IyxhJD8FUc1Xod91okrQAt0YiskwwDR5mXZhbRhxK++T1qjMqHj1BukGvvvM
 MpupziDvephlJ0iHm2cryphDzkjoCZfgLtiiynr7/mGlV7xI9TvnRdY/AOnUXzUJ2lxa
 gytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728086359; x=1728691159;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ELTyDzpdOksZjoNrVzCSOk+1T+6UJusdniGL8nRZ6BA=;
 b=w72yAAKKS7Y33GMA3GQQq18WfgvfRV2P+oV0YeahyR/QX9jeVrKYsgCLi4oZXWpHrZ
 L01ny/oiFICR4G4+C7J6rvW0dRVyugfa0H2apZyp6cF8HHvbBdnkU10MME60EeWFxVAI
 v5H4Z5UTsCx4HrG+UkJnzkuCybrxkPnLbmgHAtNl47HDwNnVSBmYRHPwx0XYDPrH18fn
 2E1fb1xBBgSciN3jwaP/UU99rs//IZ11T6g/yg98oUyqBTquPlSBUPS5eahOHQL0mLRy
 akoJtU2smYQmy+nLxx8jrUcWnJ4qa+VjxM8lzxG+TC8na1cUy5g9EyGu/6poNlBQ9l0Q
 Plqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRPKaVhbuuqTJcEC46tGXA8mqpG0DSZu7U1lkmmk48diUJQCwga71qquUkjL2TdO5nfwboyL09SMQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3RSW6+0IajbzAD2steRa4XaSQmtTebz1mkJSjgSm3zxZylZlx
 hz9zzPYuRh/l22ZzWiRWjLB2HvkBRCtGHPKWOpgUB+vXJna0TGu80wkG8o04
X-Google-Smtp-Source: AGHT+IE4KeUCrGU0raePMGcI+7No2gZ8fga25JYXVow+n45+mMfBY6vGLyd1AwU6nr8w1On2GvMBAQ==
X-Received: by 2002:a17:902:e547:b0:20b:b75d:e8c1 with SMTP id
 d9443c01a7336-20bfde5567cmr72247025ad.4.1728086358935; 
 Fri, 04 Oct 2024 16:59:18 -0700 (PDT)
Received: from archlinux.. ([2405:201:e00c:517f:5e87:9cff:fe63:6000])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-20c13987571sm3841785ad.250.2024.10.04.16.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 16:59:18 -0700 (PDT)
From: Mohammed Anees <pvmohammedanees2003@gmail.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 David Wu <David.Wu3@amd.com>, Felix Kuehling <felix.kuehling@amd.com>,
 Mohammed Anees <pvmohammedanees2003@gmail.com>
Subject: [PATCH] drm/amdgpu: prevent BO_HANDLES error from being overwritten
Date: Sat,  5 Oct 2024 05:29:04 +0530
Message-ID: <20241004235904.8605-1-pvmohammedanees2003@gmail.com>
X-Mailer: git-send-email 2.46.0
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

Before this patch, if multiple BO_HANDLES chunks were submitted,
the error -EINVAL would be correctly set but could be overwritten
by the return value from amdgpu_cs_p1_bo_handles(). This patch
ensures that once an error condition is detected, the function
returns immediately, avoiding the overwriting of the error code.

Signed-off-by: Mohammed Anees <pvmohammedanees2003@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 1e475eb01417..543db0df9a31 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -266,8 +266,9 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
 			/* Only a single BO list is allowed to simplify handling. */
 			if (p->bo_list)
 				ret = -EINVAL;
+			else
+				ret = amdgpu_cs_p1_bo_handles(p, p->chunks[i].kdata);
 
-			ret = amdgpu_cs_p1_bo_handles(p, p->chunks[i].kdata);
 			if (ret)
 				goto free_partial_kdata;
 			break;
-- 
2.46.0

