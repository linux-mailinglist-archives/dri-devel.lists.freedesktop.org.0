Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E54AB736E
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBB910E6D9;
	Wed, 14 May 2025 17:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f7PhR7yp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7E410E6E4;
 Wed, 14 May 2025 17:56:34 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-741b3e37a1eso191302b3a.1; 
 Wed, 14 May 2025 10:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747245394; x=1747850194; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5PtOzJz3dhv1LS9QV7CQZ1khNGE/TmCpgM2HiFcWd9g=;
 b=f7PhR7ypbFvHs2H38l4woQBqPHV9hT1+oaR1FoWbeRwn2nY3y5VNUSukx93bSKTu2i
 MGCF21ygqahs2xp76Cwqw3i/BxCWvLeFjT7aRzKIQawfBkV0hsfdklNZf+CQ9kHJJKai
 ssXgRj8ZfirUihaeNum8sfJCxfpa/nvznm9YVML8Ug1widwJAfkImXf80ZyPySiv8fri
 QuSB2gRufoESPkRB/dn6Z7SzuZxfu+yr0Qoc5VN/gjoj1++8BVb7n09pPLzhPnZSo+Yn
 3hJjz4rt1mydRUT5H82N6Soa/IMhsC6RGmb0zjQ0V0DkHNDQriqtVSt3aumG/GxR5MyQ
 T90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747245394; x=1747850194;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5PtOzJz3dhv1LS9QV7CQZ1khNGE/TmCpgM2HiFcWd9g=;
 b=kK/yU6MU8XAL4T8uNAyU32BCj2lWczW7y0korXkNlAWZEwdrwRj06ppXr8Etl9zIlu
 FPflSByYi6lp+8I54EmDuRjBzWfIsUdQ39yk7CiR5nJO+nhkU07RiCv7cjYgmGg7QaRe
 PEZw5h82XMgNcLdtei/hj8Tfl7d4kp17Hi/pz+9IqyW/7mRXNXhwnhiVcsiTez7Gyo5+
 qgnaipudfMvRFaxIdRLhP719I95EUnsp1WKw8rLWXQ3hsbsFiFbjBQ56wwWpSUAiv/tQ
 G9r69ff/4lrdtwROPvtdILLA9HV7BABOQKsL9vqiEoorL9E3iwhrTxlx/yncfubZ90+l
 WG0A==
X-Gm-Message-State: AOJu0YzBQ4H3hg93o6RPS9nmkowOjeDSwbd5lZVcTwMqkpmEV7sOzRNg
 e3j0gwkNGEhvwJzNolIOosy+XmCgVlXVWml8xDWDA4V6xjND0AIcLZR3Cg==
X-Gm-Gg: ASbGnctMcH/3cJyUvz6OeDseuRYq/uXnACXUMSBAroeFMU37d6C1E4hb/JxMZu2E6LX
 ZBvF1j0hfU9NTFCu8kYrIsQghp7Y4BXGnlA41ieBGY3KoJuAzlWKHf/pNEis5fxtgPUR01McK2J
 swmwg6oCYZrW6pMA7TdqFnei961q1bJJTPwPA1qQMMlIz6djvRCKETDakrmKiUBt7aC/9/xvPAJ
 sRcLW++B2I/eMoogs6evdRyI85sC2nU7AXdmy0qGfHPbbB12QC565ijyymftU5wW9ydixnZ8GXX
 Tqlsc143SEK0Y9vZxfZetdozDEc5QN6vg5c/Ksd7TI+HRHoB5ctOZZWKYTe4k5JpcUapj0681rO
 025Z/W3XYoLZEJ/vrJBsRxEYl8w==
X-Google-Smtp-Source: AGHT+IFjYrjVteYwXMT42fev71TvPXfnsKs9wRFlle4mc7tfIqXVcQzNh2N4X+20ZqWAPV8hLo3K2A==
X-Received: by 2002:a05:6a21:9999:b0:1f5:591b:4f73 with SMTP id
 adf61e73a8af0-215ff16e836mr7109817637.34.1747245393759; 
 Wed, 14 May 2025 10:56:33 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742522ce92fsm7188374b3a.49.2025.05.14.10.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:56:33 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 12/40] drm/msm: Don't close VMAs on purge
Date: Wed, 14 May 2025 10:53:26 -0700
Message-ID: <20250514175527.42488-13-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514175527.42488-1-robdclark@gmail.com>
References: <20250514175527.42488-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

Previously we'd also tear down the VMA, making the address space
available again.  But with drm_gpuvm conversion, this would require
holding the locks of all VMs the GEM object is mapped in.  Which is
problematic for the shrinker.

Instead just let the VMA hang around until the GEM object is freed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 4c10eca404e0..50b866dcf439 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -763,7 +763,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, true);
+	put_iova_spaces(obj, false);
 
 	msm_gem_vunmap(obj);
 
-- 
2.49.0

