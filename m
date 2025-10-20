Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F6ABF1C11
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 16:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C82C10E184;
	Mon, 20 Oct 2025 14:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JgQZfH34";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301EE10E184
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 14:13:19 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-7bb79ad6857so2359605a34.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 07:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760969598; x=1761574398; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=fkXQwQlWLeV11fwEEU3R5ApVtb851ixMfg9BiNrOmeo=;
 b=JgQZfH34QrEalOZT9FLMXgNKGETVAqlNXN01d9v9whyrvh76J6PhfjF18F5ZEW+K+H
 Vt0C4aNqH+wDLnolMAmaiQvkfdlZSUdtFQ6olSnXphv/38p0jaMC3WtvLVuJJMl3MU7B
 fDNk1G7ifVa2zFkwVNe9iOWP0DPAWbHbslaDaj4I3Lo9UiZfYCY6i6Rgfdgb8VMn7Dyr
 13HwZwvDPsoMlilBE8Iv9wJhMb2dcR6hgmtm0SFRGjfHB55QKdip4vfGREDrmLHXMoTd
 qt2M1bKmcc6Lrqc+jF3UCmZR2WlmpHGye6vkc/5+YXrdmXfkDzdnii5+kcAunwCyeK+5
 5FyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760969598; x=1761574398;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fkXQwQlWLeV11fwEEU3R5ApVtb851ixMfg9BiNrOmeo=;
 b=R4cvpoIpDbCbY8LSekBlTNyixsp5HKE5Rz/CTKTC813xyprCz7tlORjnXi1x94cDr1
 IoH/OL9udeV9rraN5te+xnOKYylwbn3hdq9TLgL1gdaZpPMq5y6lfC5fI5pZ00TI3rU5
 usfi56d/tlKa/dXz52/Yl8DmXbQemD1S3DxPljfbFQCbem5tYu1MlqJjJ57s8EgfBz72
 bIR7NwD4vSxIXjP+21LTpY9WWQ9iAMbhbWeAssSgojkkvECB3dKk2CFID1ERCdU3v11T
 JuKteQqSbUFEAcBb23DRvh2CsqJZacqjeDTq00+8Hwf/ECSlhwZMgyzZZ3Mj8rp1Xo+j
 NRBw==
X-Gm-Message-State: AOJu0YwYinjrd9zwg1RwULu9+68w/l07+zkoQh/m8eznFXoNAUbo7g8Z
 2nl4TtIOLblnT+ZgJgAWxZ6rrYXI82TM/j8JDlz206u5S6heuPLy4sVofBT2oHXCH8v7GEpFJ7s
 ocYPtKFOyiOcpvqzJhUAovg6EHZHM9sXmlq6QN7k=
X-Gm-Gg: ASbGncuIgo3Kats0T3vs7w3gQ/7QpLi6LkMMslR9EpMwayT6ZhYu749q24ETE8KrB2v
 Z2Qb6tD9Fu2lcdUkume1gosdVNUkS2ammmgEiFJQnk2CyBv7P6FWDpGWzSkAvYsnCiDTZqKMI4i
 jk8bby366JNUfi/kLXncXCp/UchIt/1kyGFn3lmEiP1kvzMspx+lxiJltzul5SucNTu+f6pObn7
 ASxrxc8u6ZzU0U5FNYDd96Cas7AT7rQSEHS0fAn+cqjJ1jTFccTtGJI3UfLpsp2rSb2Cg==
X-Google-Smtp-Source: AGHT+IF35Y2fndkE5HlLC6M9BzQ2o1EKqt4uqM1iZEd/o0Yxg7ib1fvVXjYfsxs/rkQUOVISP/vR2c63jmdKU/rMQcg=
X-Received: by 2002:a05:6808:318e:b0:43d:23d2:719e with SMTP id
 5614622812f47-443a309527emr5490285b6e.44.1760969598134; Mon, 20 Oct 2025
 07:13:18 -0700 (PDT)
MIME-Version: 1.0
From: John Smith <itistotalbotnet@gmail.com>
Date: Mon, 20 Oct 2025 16:13:06 +0200
X-Gm-Features: AS18NWBJ5MpXGF8cnAnjYWmVhHpuQLD4yKcxetX94gz0QETDC7JR1Lacp_HcWdA
Message-ID: <CAGkpkRXO35=pmEZLJ4efTzaUytu6GURwogPdv3hroOYmHWg4JQ@mail.gmail.com>
Subject: [PATCH] drm/amd/pm/powerplay/smumgr: Fix PCIeBootLinkLevel value on
 Fiji
To: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

Fiji seems to have difficulty with switching PCIe generations
including on my Instinct MI8, where it is basically stuck at Gen 1
unless manually switched by using a different PowerPlay profile.
(using the pp_dpm_pcie sysfs does not work)

18edef19ea44 introduced support for Fiji's SMU, which included setting
the PCIeBootLinkLevel value to zero which is equal to PCI Express Gen
1.

By copying what Tonga and other generations of AMD GPUs do, which is
to use the maximum value from the speed table, fixes the issue.

(p.s. I believe Topaz's SMU also has the same issue, I can send in an
additional patch if needed)

Fixes: 18edef19ea44 ("drm/amd/powerplay: implement fw image related
smu interface for Fiji.")
Signed-off-by: John Smith <itistotalbotnet@gmail.com>
---
 drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
index d2dbd90bb427..0a876c840c79 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
@@ -2024,7 +2024,7 @@ static int fiji_init_smc_table(struct pp_hwmgr *hwmgr)
  table->VoltageResponseTime = 0;
  table->PhaseResponseTime = 0;
  table->MemoryThermThrottleEnable = 1;
- table->PCIeBootLinkLevel = 0;      /* 0:Gen1 1:Gen2 2:Gen3*/
+ table->PCIeBootLinkLevel = (uint8_t) (data->dpm_table.pcie_speed_table.count);
  table->PCIeGenInterval = 1;
  table->VRConfig = 0;
