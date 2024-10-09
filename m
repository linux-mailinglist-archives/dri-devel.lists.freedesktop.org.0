Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE7E9969FF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 14:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473F310E29D;
	Wed,  9 Oct 2024 12:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QUz4qNVt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6306110E29D;
 Wed,  9 Oct 2024 12:29:34 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-20c544d34bcso16855395ad.1; 
 Wed, 09 Oct 2024 05:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728476974; x=1729081774; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eMdFLkf55iY8mo8GSix8A+wWwdNb0+DgkDm6Xc8j4s4=;
 b=QUz4qNVtyzSellW7IVQ5osTHDSXF3dIo0x+OD9hlbZpsU95SQG0A25UTomXNtJP2oU
 c8fnOsj570ADwJqfbeu05yD4D3cnJXG1nx2mzsTLwpzyzE3xDyj3k37SQ0Nm5oRxSkyO
 k8vmeW497c4qlJsxGpM2Q2HDUZX+DH5/0vHDkgdoQgQIH1Ef/vaZPI0shxAHiHsMycWg
 s+7DZROMvZaH6ehWifuvQtu5X1NBDC39TtdPp2qNauNSkpRFIu42FqwJtr5NhYXmL9sb
 IidH7HBdcR7UFiaIHT9xsrrTfMBmBhuI81nplYhiN/njBI6dZLzIxH09k6WvH7JEpqF6
 qfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728476974; x=1729081774;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eMdFLkf55iY8mo8GSix8A+wWwdNb0+DgkDm6Xc8j4s4=;
 b=B1z3pmpnw7sko0zvf+GQ1d3J/NvI2ZzO67gBffG3rYBhwVCo7ANwaBny8OIiT1LS6s
 mslRwRYlauu+CsbXC7FSp0rkXhxWZCfXdDXc3qOOVCGwRgHwZGwIeLzY9op+w7F61Ns1
 q7nfzBaARDioEkoqe65xxFjRj+vjEcCK8q/HDEe4ItlYHPI9I05Ngyt0O9aHJdswGehe
 SZekyWNOvuLRkfjSFASj3YDmtTxpb+Ind+E0FK4FBZzhlFHztX+tL83wG5wJKHufneJ4
 WvsZJfh5rVVIw7wuo+pQLHy6E1jGzWYT1J2QElxREJb/lq5m9U77+tGBWZd7qe0K6GXM
 Aqaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTVzBUgjnNYOTaSdi+UuH2fTCabPbKsCnpLwvi9lpkkuCS4hyXIbLe0dq48y0iZlbklINc8Gl5dSE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/Fg1OJIDFqcVx7oxleFKtkKvsiKolHPUA9tiPl2vLT696YG5i
 m6qzgn/fo8p78un8PwVPVoWX4p7270eI3ip7jgQ7SIC5NccmkBh9
X-Google-Smtp-Source: AGHT+IHOhfqq0sDN4lcnvYYpx8jag/IqmcLbJY3tWBChS7jUw5p6ehVxXu2GHV6j0c3N1NtWOWbpag==
X-Received: by 2002:a17:902:d491:b0:20b:983c:f095 with SMTP id
 d9443c01a7336-20c6378fc02mr37086205ad.51.1728476973686; 
 Wed, 09 Oct 2024 05:29:33 -0700 (PDT)
Received: from archlinux.. ([2405:201:e00c:517f:5e87:9cff:fe63:6000])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-20c65fc262dsm10591305ad.225.2024.10.09.05.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 05:29:33 -0700 (PDT)
From: Mohammed Anees <pvmohammedanees2003@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, srinivasan.shanmugam@amd.com,
 David.Wu3@amd.com, felix.kuehling@amd.com, YuanShang.Mao@amd.com,
 pierre-eric.pelloux-prayer@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Mohammed Anees <pvmohammedanees2003@gmail.com>, stable@vger.kernel.org
Subject: [PATCH v2] drm/amdgpu: prevent BO_HANDLES error from being overwritten
Date: Wed,  9 Oct 2024 17:58:31 +0530
Message-ID: <20241009122831.109809-1-pvmohammedanees2003@gmail.com>
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
ensures that if there are multiple BO_HANDLES, we stop.

Cc: stable@vger.kernel.org
Fixes: fec5f8e8c6bc ("drm/amdgpu: disallow multiple BO_HANDLES chunks in one submit")
Signed-off-by: Mohammed Anees <pvmohammedanees2003@gmail.com>
---
v2:
- Switched to goto free_partial_kdata for error handling, following the existing pattern.
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 1e475eb01417..d891ab779ca7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -265,7 +265,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
 
 			/* Only a single BO list is allowed to simplify handling. */
 			if (p->bo_list)
-				ret = -EINVAL;
+				goto free_partial_kdata;
 
 			ret = amdgpu_cs_p1_bo_handles(p, p->chunks[i].kdata);
 			if (ret)
-- 
2.46.0

