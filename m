Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B0D9676DB
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2024 15:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D8310E0B4;
	Sun,  1 Sep 2024 13:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FOtKvIzN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D04610E09F;
 Sun,  1 Sep 2024 13:58:16 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a8683dc3b17so203736366b.3; 
 Sun, 01 Sep 2024 06:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725199095; x=1725803895; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lqxrlwZgVOZrfaPkQI4LlyC8aVNLGRmKHeCXm7BpQqU=;
 b=FOtKvIzNQ0R3uhp5xQEnW9VaRKO71rOZyjJyvuMHTlCb1eQMQd49d1lCW2F8wQUrA1
 eIHUhtmIPoN0RBT9or+j2lw5hZHfyu0i2f2v+Z226NOO9qF/0VcY+pizbxI89PTUM1VB
 C6rDxzxGTXL3giLLW3IWL3lYMQN2shGttvV+5OIij5z6WyaBf8GrnE+qiBTUDTwd2J2I
 IkegPTbNHwm+x4WRXtmcya+uUa1+Yr4kq74mQOMewkIlZd4NH0+oYvu2IQm40FuXjZT2
 ZJEYIpo4Sw8xdvivsRVhGBdTXhZ7hcJpjFopcfSFYxXq7dAXvj7PqKQZk1vLBAW0ZmGf
 cZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725199095; x=1725803895;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lqxrlwZgVOZrfaPkQI4LlyC8aVNLGRmKHeCXm7BpQqU=;
 b=YCnDMDhf/BxTT46hoow9ZaMmglMj20WtmRLpayrQEM/M5B+4Ga62Hw19y8PzWR0Ifj
 GLunZh6oEIfWjhrymRDtOjG1edpVmDqdOms00aC4LNUBIH+Y2U5qhr0XWga1RnalJEHz
 BRP25Am2zOqcH63Rlt/lr2FoPiZWeFO62sKys+0drE1eBZFdfk8pUt4P+IhoN8XOYgWB
 gP0/8YibKVZbXLvyqvuBYhmjgQZgc6h5BWJwemoCc7fhiWQqO6H776OhJzb+wOxTTPR7
 s5K4P0q6OG53zbzvwjYgo+MAzfn5Vtwo08Vcf8TtqBS38N9UpdrRQnq9pNekndT7s3jW
 aCRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmeUF0K9lEWNNXASQdnaqonJIXBaKxC/qOEeKtbFnqOaJlM+/GFpX4BaxMp0ewupW9ykDB9kjeN0JR@lists.freedesktop.org,
 AJvYcCXZt+956G6XYTPCJdaGkl30U+gYj7RUFFkq8rDgg/UtXD/3shWeroQcoRb9oVGYyDicqT1yIOMrFME=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJR7M+ZscFJVoyPRJF5szuP4+5NnsRMUhTKzmBxDDohlZl4Iwl
 e7ez5zBeObYfB4g/Ww2WeZ2Z7f86oC1iXgZnoAl01kVyBQjNl659
X-Google-Smtp-Source: AGHT+IGKf5lWnIdWvQXm43UX9gltPdmoOxHDk3rgMDtuWMcrI5JctjcMpoKubosYad2+GjDL5ZOL4g==
X-Received: by 2002:a05:6402:3506:b0:5c0:a8b4:3d92 with SMTP id
 4fb4d7f45d1cf-5c21ed8ba82mr11941841a12.27.1725199094059; 
 Sun, 01 Sep 2024 06:58:14 -0700 (PDT)
Received: from localhost.localdomain (public-nat-01.vpngate.v4.open.ad.jp.
 [219.100.37.233]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ccff17sm4051295a12.73.2024.09.01.06.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2024 06:58:13 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] fixes for Adreno A5Xx preemption
Date: Sun,  1 Sep 2024 13:53:59 +0000
Message-ID: <20240901135419.1075412-1-vladimir.lypak@gmail.com>
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

There are several issues with preemption on Adreno A5XX GPUs which
render system unusable if more than one priority level is used. Those
issues include persistent GPU faults and hangs, full UI lockups with
idling GPU.

---
Changes in v2:
- Use spinlock to serialize preemption initiation in patch 3
- Added Reviewed-by on patch 2
---
Vladimir Lypak (4):
  drm/msm/a5xx: disable preemption in submits by default
  drm/msm/a5xx: properly clear preemption records on resume
  drm/msm/a5xx: fix races in preemption evaluation stage
  drm/msm/a5xx: workaround early ring-buffer emptiness check

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 12 +++++++--
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h     |  2 ++
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 30 +++++++++++++++++++++--
 3 files changed, 40 insertions(+), 4 deletions(-)
---
base-commit: 985bf40edf4343dcb04c33f58b40b4a85c1776d4
-- 
2.46.0

