Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C7D91C2AE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 17:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F29110EC66;
	Fri, 28 Jun 2024 15:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="gLx1zXf5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C48810E271;
 Fri, 28 Jun 2024 14:49:08 +0000 (UTC)
Received: from [192.168.1.130] (BC2492F3.dsl.pool.telekom.hu [188.36.146.243])
 by mail.mainlining.org (Postfix) with ESMTPSA id 7B6DBE44E7;
 Fri, 28 Jun 2024 14:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1719585598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BpaaS2OIMoGBVUdFbPUqueqmBQUDNqTEOvL6otASaZM=;
 b=gLx1zXf5CGZ91j76c/awAbhU83Vzm61Tye15C0WwbYke+J3x0zEOJs5lV9AOk6e37Zk3hH
 LoG8lv1C9M9T/GnU+U30S5v3waMYBKzRAXtp3UDjPAv+dm8Z2++DJD/SLxM8KTIyWV9y2r
 1Dd/QezZaTcTFXkcbiWnBmaGi+DeTncB7dbfm143Sqv19kcb9s9aunODmCXConK655hAFH
 gvEonstF0yFw6b1sDe9WzACDM06o1VfMLtjf3hlMWm7QHmwAVCU4l9G6jgMWcJYErsZgFc
 x/mf+8+fzOyzgaeszYg4IpP1ViFoumdxnhX0NlcKZwvLq7in8DfxG08genmY2w==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Subject: [PATCH 0/2] Add MSM8996/MSM8953 dpu catalog
Date: Fri, 28 Jun 2024 16:39:38 +0200
Message-Id: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACrLfmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUyML3ZSCUt3c4lwLS1NjCG1ppmuaYpCWZJ5qbGGeZKEE1FlQlJqWWQE
 2NTq2thYAKdviqGUAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>
X-Mailer: b4 0.14.0
X-Mailman-Approved-At: Fri, 28 Jun 2024 15:32:40 +0000
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

This patch series add dpu support for MSM8996/MSM8953 devices.

Note, by default these platforms are still handled by the MDP5 driver
unless the `msm.prefer_mdp5=false' parameter is provided.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Dmitry Baryshkov (1):
      drm/msm/dpu: add support for MSM8953

Konrad Dybcio (1):
      drm/msm/dpu: Add MSM8996 support

 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   | 218 +++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    | 348 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 106 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +
 drivers/gpu/drm/msm/msm_drv.c                      |   2 +
 6 files changed, 678 insertions(+)
---
base-commit: df9574a57d02b265322e77fb8628d4d33641dda9
change-id: 20240528-dpu-msm8953-msm8996-5d0fb7e387b8

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>

