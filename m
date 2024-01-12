Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF75E82C01F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 13:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BC810EBC3;
	Fri, 12 Jan 2024 12:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7676C10EB03;
 Fri, 12 Jan 2024 12:52:08 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-555f581aed9so7487762a12.3; 
 Fri, 12 Jan 2024 04:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705063927; x=1705668727; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9gqe6zt+K1SwL5LJS94hj5/KUX3LpPHn8y08oK/nAmQ=;
 b=ejpp6/TQ2dRTFUIlYSu3Nhvjyd6URh36M4DWvXwGTmmFw3CEMjrkLX9/4DnrJk+Ccz
 HSL7bZscC10D8KmPWnEokuq5XOmjVR/ggqbfOBtTK9h9NySw0HJ/1mFSUwEOXVsGIYtV
 jvsIb45GMa2RtylDVl1u49671czEf55jc5pbTu1pzLXeXVoofFsySXA0jram4kkof1qE
 w0yoDjuI6NbweXGBBrMeIr9slairv0ZylaqTZECzNA0Z0iSg+C5E8FhazMU4j3yRTCbz
 aqN3i4LNY51WmT01sFBok3mtimdaKESquOO7sz+OcN/P866c5CHooV3fxZfSA9Ky9WoM
 6Eyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705063927; x=1705668727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9gqe6zt+K1SwL5LJS94hj5/KUX3LpPHn8y08oK/nAmQ=;
 b=Ze6YVIHPQ7rRtLpDyg6tK5VP78SdGEdHiXmrzuxyOnEKfYIiBtt8SYuvNQKpd+qqlU
 mAeH740qh3gKTRqekiVESkmY134zeAHC4largJ3bKbkEkwRK6H7kl5fzUOWD70KdMVNE
 QNNogzWYSk/0nrpNdFbV5m4aOqVMrwaZaioCfdcUFUrQgr6U7+SCNVCXsLxDrLnDkSgz
 H+QbThZfDkoD2sSHGWkvDta0YlR6MekCEUfBfqZ+eDJKHpPG633gOAZj9qb7M1823cDn
 mFq8wiGP4SP19Jy+dT/wEKUqN0V2Lf8WdTTWe3mxBwZWycJ6/zgYdFlePM3z27sJqeEE
 XIvA==
X-Gm-Message-State: AOJu0Yzy9RYi8t09EbsuthGez82EVudGxixliGfCZa6FDmRS4AAe7bYS
 R/79V/5WEMftSDb4WSac+xTWUa7csztRQfor
X-Google-Smtp-Source: AGHT+IHVk055NGr7VOr6JLLMuYJwLHJQBa+mA0jKkUCa+2/s2SoSr9i41bE6ESRSyGiXXKKa0sQGrw==
X-Received: by 2002:aa7:c485:0:b0:557:63f0:1eff with SMTP id
 m5-20020aa7c485000000b0055763f01effmr603584edq.9.1705063926964; 
 Fri, 12 Jan 2024 04:52:06 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:5d00:a6e1:95b5:7596:5333])
 by smtp.gmail.com with ESMTPSA id
 y10-20020aa7ccca000000b005572a1159b9sm1752427edt.22.2024.01.12.04.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 04:52:06 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 thomas.hellstrom@linux.intel.com, nouveau@lists.freedesktop.org,
 jani.nikula@linux.intel.com, kherbst@redhat.com, lyude@redhat.com,
 zackr@vmware.com, michel.daenzer@mailbox.org
Subject: [PATCH 5/5] drm/amdgpu: use GTT only as fallback for VRAM|GTT
Date: Fri, 12 Jan 2024 13:51:58 +0100
Message-Id: <20240112125158.2748-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112125158.2748-1-christian.koenig@amd.com>
References: <20240112125158.2748-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Try to fill up VRAM as well by setting the busy flag on GTT allocations.

This fixes the issue that when VRAM was evacuated for suspend it's never
filled up again unless the application is restarted.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 06fb3fc47eaa..2752f2a67a44 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -173,6 +173,12 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
 			abo->flags & AMDGPU_GEM_CREATE_PREEMPTIBLE ?
 			AMDGPU_PL_PREEMPT : TTM_PL_TT;
 		places[c].flags = 0;
+		/*
+		 * When GTT is just an alternative to VRAM make sure that we
+		 * only use it as fallback and still try to fill up VRAM first.
+		 */
+		if (domain & abo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM)
+			places[c].flags |= TTM_PL_FLAG_FALLBACK;
 		c++;
 	}
 
-- 
2.34.1

