Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5FDA9FB39
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C70310E275;
	Mon, 28 Apr 2025 20:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R88KEhpA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6D010EA5F;
 Mon, 28 Apr 2025 20:58:02 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-22435603572so60471775ad.1; 
 Mon, 28 Apr 2025 13:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745873882; x=1746478682; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ldKiKXMw4E7/uFSSwgQ+a6OPkM5zfTFd91m8s/ysTB0=;
 b=R88KEhpA57I2d0noayDX0mlqA/v1tn2m5rNgq+L6jrQdrXo2j/W6FQ9Y5jfH30DPjO
 ThAjUmJet34UBVwIax333QZ7s3OoZZk5rmaADK8jpxmBlWZo7aMnBPcpkY1ij2uaCkhd
 gSv/WcUpmxFgYVjz4J+zNRlZuCo2Z4AAQmQXsi1DbiLy9jRoTVfHRo+UJnzGdO2I/bUp
 WATVro3Gg66J4BUSNHzzd+QPItIFbZW1Kj9SR4AKHuDO2K0wk5Sh+xMBORHcNu+t/W83
 tb/KweqdFSBJGSz6nfOz8t/cYXKAX554UHN4zY9jXymmMfxcQSMHcvSmkeBViDQweJ7F
 hESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745873882; x=1746478682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ldKiKXMw4E7/uFSSwgQ+a6OPkM5zfTFd91m8s/ysTB0=;
 b=i9/IGSGCbfoFfib4MpgBpmZWxXSqLY/SCznU8R/9cZg0KhLivsS9ftJgHds3iUj4eZ
 g5lgYF7Fyvl2/veaok1Z6t+1bupRTLNxkAvZkKIscdLlhvZu6fVlg1zY/qEVLTIcLcNN
 cNLfp6azuKgbv/B2bjU2vD6bqAAUjpbsyCF2w7fn+iybzx9RGKEh4/0Yw7unx5KwRORQ
 TLXBBuI6JEUFZRwRdRNnz5PF1l0pAOxEodY+5guVQ2S8y0UF7XJE90mC+o2FSVOHfji0
 Q+IRvmP7Qw41xVR54Hi6eADGwu8De7i/wAfIgLbQ01fRjW/6XmTlvjLpBtnlbg43ps2Q
 n2/g==
X-Gm-Message-State: AOJu0Ywpo9JGQtJDNLEUD129mlLSD/Iz9VAeUpxiL7zibVZMBSd+4AAL
 KuxGEMXvUjtg+ZgD+xrcaNbwBiOfKPvxQZTBCuAZJqGANswEFibrvce3hw==
X-Gm-Gg: ASbGnct2DrRPBM+kox6e2kgXQuAvd5bCLIMkB1OlDc2jRCxRsOpQilNZYKXLHjBUPgc
 zqvHIDtVgoMnAfBRew+E9GL6gjbgA+H095JTy1kRj8ochBQqkZwa7f2/7MEPdFYw1gi/4F/xzxv
 EYLnU+Xnt6SfkvWjIVxVur9FbZQd4JF5JJWZPr7PaGFpfJdHZWSMPHHwwRA/13GCh4FQYBgKrj1
 YvW520tjDW8521KyaOwjgoDyOwGs9zRekY2gsTP1CX0xz+gwoW52JdA4sNRItP0Z5DhQNPhmL5M
 QmjgjrJoJ/fqpDnrEIfQFD/TTit/em6xzwqZYKPzfqag8jCPjQsLEp3TiE14mqCXZHU/JOny3qU
 a0kKunTCmkNGGQ4o=
X-Google-Smtp-Source: AGHT+IE6Y1fcOD7teBZT2uIjq6ymsxElS+a5WqLYb6PxcGWb/RDRt49Ka1e9aDellQzGFACgV7MBgQ==
X-Received: by 2002:a17:903:8d:b0:224:c46:d162 with SMTP id
 d9443c01a7336-22de5fcee3amr11816975ad.20.1745873882064; 
 Mon, 28 Apr 2025 13:58:02 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-309f7754d52sm8607024a91.19.2025.04.28.13.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 13:58:01 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 33/33] drm/msm: Bump UAPI version
Date: Mon, 28 Apr 2025 13:54:40 -0700
Message-ID: <20250428205619.227835-34-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
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
index a63442039e22..4117c866350d 100644
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

