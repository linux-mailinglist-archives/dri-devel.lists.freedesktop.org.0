Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A592CABC687
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 19:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08AF10E4B7;
	Mon, 19 May 2025 17:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UBxp5gS7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC0410E4C8;
 Mon, 19 May 2025 17:58:55 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7399838db7fso4519737b3a.0; 
 Mon, 19 May 2025 10:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747677535; x=1748282335; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F/hXTxlFJMrvU7CPa2JHrx2ogSsPgBPZqjeavvvUR14=;
 b=UBxp5gS7zRtXGJP+Kb4+x3vaAq2HNpwLhK5qbWkeDaEjvLE4llJtU8Wh+mMMrEWvea
 mYj7AO/rovfb/if9wS8ErRyYgOZd4SHFJ7KkvpZYiApUtPEwLAecd0ySWTg7ux+Ednes
 F8pwOg/ea4bXh9Tbh5XPjfDivGHcCIIoP/b7f343N9f1h9pw3Cnq7pHgcubMfv7do4oJ
 eShCf4qKWvbxA5NEMEOehi4M1U1NPYPOYePOEfDbMf8QrQbLQ6uiyc/dVZrEhYWt3vyR
 dvPz0HWYwlIOLPcfF0yaGuKZGFVG3Q4LcultjutDKudzITAUWF4a+Bo4eDrOKw23R6xw
 a7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747677535; x=1748282335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F/hXTxlFJMrvU7CPa2JHrx2ogSsPgBPZqjeavvvUR14=;
 b=JDgn0xPMy0Wawf1bGM4fe9Z3WUUAs3Sy84aJUMKraNbG/aArSTOCfZE+K3Ky+uUBVk
 nKuhghQWQ75N1+9mOEO4TRznJc0MdA3h0UAZP+nqPD9hBVtP9QJsbnsiRQF/N0+qpR6s
 3nuIC8RShjJ45EdsUoqQU6+en6ul0lxzwih0t1VJ2QzZrmslgojPbq0AbwG8SqwukOnj
 WndfT74g2plND9RXoyelJ+OmAVXYMqYhKQSOE+L/QCWSHsTqm50Mxu8OLBD+hQ5GU6Da
 9gMc8VjxTvWmXK1Ar1xsGcyfWyIdeVaa5/g+uZb4Ef74Kw6FpHEX8vVLjlik9XeET4gg
 N1yw==
X-Gm-Message-State: AOJu0YzYXtGl6mDqLsTHBL9cxY8KeHzgzk08RmKNSeE4is9dsF3LUXvg
 rtKWzkmpl3mGH5krCfLybSAL7tpAn5ki+3VqKCbSdpcHifejpHlf1ePQ4RKxaQ==
X-Gm-Gg: ASbGncsM2L8SAKiD/CUULJWSXeTRyy/YmJnURR6zxVK3BdW8jzf1R8z/WOsLNWCL+L9
 LXjKTFV00RRA0nM/q2GksSl3eiWtPFW9cs7K1qIKa0jr4NREo9CKbaN3tu2sLLp6lQ5BQ7Y5vPY
 4acM95fzX58hftbP8OHuSgoYiY6gC9rc9yqQnrna+Ne3++Hqz0g+BFySDtXMnmuyYPJh1bqqb3n
 ypnwYAmqbWlpbUFY2sYJPKGIQHz6cSLeGzf+hljFd1gNEKbs9NAjPbzL4xxz28/zDHNWB0kpO+S
 rKfTBPq/to9c9uuU4qC+vjdG3oNVNrufWcfXyJc8YAsbOfoGFa954GnBjhQUAxUrKLwOxnaEpU4
 kK6/T78ebFG+ayRFcciIoObXMAw==
X-Google-Smtp-Source: AGHT+IHO7vUmfXPvZMeyKDWjNf4LOGaBf9hXJlFDwffRUWBX2ZxfXn1HguqoFF3TkkZafBez0mFjWA==
X-Received: by 2002:a05:6a00:e06:b0:742:cdf2:62c7 with SMTP id
 d2e1a72fcca58-742cdf26398mr7819210b3a.4.1747677534937; 
 Mon, 19 May 2025 10:58:54 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a9709293sm6466435b3a.37.2025.05.19.10.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 10:58:54 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 40/40] drm/msm: Bump UAPI version
Date: Mon, 19 May 2025 10:57:37 -0700
Message-ID: <20250519175755.13037-28-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175755.13037-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175755.13037-1-robdclark@gmail.com>
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

Bump version to signal to userspace that VM_BIND is supported.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index bdf775897de8..710046906229 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -41,9 +41,10 @@
  * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
  * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
  * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA
+ * - 1.13.0 - Add VM_BIND
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	12
+#define MSM_VERSION_MINOR	13
 #define MSM_VERSION_PATCHLEVEL	0
 
 bool dumpstate;
-- 
2.49.0

