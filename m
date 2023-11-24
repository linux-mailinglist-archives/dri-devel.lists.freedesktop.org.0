Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F41087F6BAF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 06:28:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E8510E134;
	Fri, 24 Nov 2023 05:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED7010E33A;
 Fri, 24 Nov 2023 05:28:10 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-41c157bbd30so7814481cf.0; 
 Thu, 23 Nov 2023 21:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700803689; x=1701408489; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A+g/jSytR8KV47uGGJN5Pp83HT1uHDIXM+AadWQ9RdY=;
 b=Hjtvu/wCnuH2LAdsVK1l28MbhgBZYe5waVgfD8tW9cofnyui5fsTD/fqb3Ib7slkFR
 hNoXbEx2dDu7VV4TVEzC4qkabUV9Wewvq4QdCUYbtE6LusD0VSgK2fwRwbV47mGpAWxi
 Yaa6+c++2PDqDaDhOeH+Tz/80CW6cTOx3MIjT/RjuRwnBrgE2bz3pEeD/PCGMx9A5O4l
 e/9cqzEPrQvlb5RM7B2560QAcxOdjB3b5plG/juK75gSrD2PGnuRm0UjW3qSAPApq0vv
 l+xkS8WIu/j6A0Lg2GBtFoIu29XChgO3uVY9QbKX/CGElxQqvHc0cvtgbpc8E9nVxmaM
 a5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700803689; x=1701408489;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A+g/jSytR8KV47uGGJN5Pp83HT1uHDIXM+AadWQ9RdY=;
 b=AswvWPI+27MuP4j0cx1Ib4tFIza5BnK60xeKNWtC8Ln/Fmn886J1IawM00rH/vgAK9
 ggg80NfgXj/o0VOeiFpjE+F5eSr66GNgSMKr497zYeg5+D36sdUaabNU1El/J6PncEPk
 iZ/PZ2W0eu/4UCYHix2QFF/poyyLkfyfRVPmgMSqANnzXy217GsIJ5m/2TRT3qPxy0cT
 tBfZD55ctT2st+zP+hPnTVo+CsQJYo6bVeSecEAxU7xMSNu8u7Ne6//tYKlr3sxbWTZ4
 gTSTdg5x54uHGV7/y9hySQLQoJSdijRGWIJxGB9/+oVeTQvGw6ZDNUJPn28L2il0Fbra
 kbEQ==
X-Gm-Message-State: AOJu0YwzF48cCcvaRvp9VLW/bK0XLfQj180TsoDa6zZzujKeqOxW5zmj
 d1H7spbP7fmALqcMdIn7rqa7Yv3ppETTEg==
X-Google-Smtp-Source: AGHT+IGm+xtyokx8k4hy+Buxm8YsDEwOmKBEc5pdNoy78fxzknvd/uWSJkc4U3i0/iWZVl1V2Y3C7w==
X-Received: by 2002:ac8:7c4b:0:b0:412:309f:c0fa with SMTP id
 o11-20020ac87c4b000000b00412309fc0famr2158332qtv.64.1700803689185; 
 Thu, 23 Nov 2023 21:28:09 -0800 (PST)
Received: from localhost.localdomain ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 g11-20020ac842cb000000b004181c32dcc3sm1017819qtm.16.2023.11.23.21.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 21:28:08 -0800 (PST)
From: Luben Tuikov <ltuikov89@gmail.com>
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/2] Make scheduling of the same index, the same
Date: Fri, 24 Nov 2023 00:27:53 -0500
Message-ID: <20231124052752.6915-4-ltuikov89@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Luben Tuikov <ltuikov89@gmail.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Alex Deucher <alexander.deucher@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The first patch renames priority MIN to LOW.

The second patch makes the "priority" of the same run-queue index in any two
schedulers, the same.

This series sits on top on this fix
https://patchwork.freedesktop.org/patch/568723/ which I sent yesterday.

Luben Tuikov (2):
  drm/sched: Rename priority MIN to LOW
  drm/sched: Reverse run-queue priority enumeration

 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c  |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h            |  2 +-
 drivers/gpu/drm/scheduler/sched_entity.c |  7 ++++---
 drivers/gpu/drm/scheduler/sched_main.c   | 15 +++++++--------
 include/drm/gpu_scheduler.h              |  6 +++---
 6 files changed, 18 insertions(+), 18 deletions(-)

Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org

base-commit: e4d983acffff270ccee417445a69b9ed198658b1
prerequisite-patch-id: d0fec7c91768937b5e22ce9508017e5b9d462000
-- 
2.43.0

