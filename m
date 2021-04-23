Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7D3369BAB
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 22:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38476E19A;
	Fri, 23 Apr 2021 20:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56E76E19A;
 Fri, 23 Apr 2021 20:56:55 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id c3so16047857pfo.3;
 Fri, 23 Apr 2021 13:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=xC8clke3UM2mIx9JGjB0xLMHhnD9lAyHPoIkVfVmf7k=;
 b=UORleTQPlx//sA16AmZyNLDCyyT6yx4snwp1FzP4HvVAy1iDD1Ic7kri3Qcw3uhMD+
 xpgrMrKWQaNluZw0SPUjkfFiidjjQlmpIVcR/zzQHmKgnVp7FMBeR82Wu0rWCmpgK2UY
 0PbiLnAayVV0WXAUKOV1xr1WXhIXAzZJumDEPQnnLagOWQ2KazSvEZ4z0B3tgSefqEuX
 Bu7PUSyqKAmBIhUvX0zjXsVHdf1xyicGu3wrj9iWNgzoS2xIKtg/liwCMvLxy6FnoENF
 tB/onb2lv6kYgMAtvgdAQH2Juy+c0oZyDP9V3cWtjBPBvcYQoPdM3gZQKK4dq9MM5pjV
 vgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xC8clke3UM2mIx9JGjB0xLMHhnD9lAyHPoIkVfVmf7k=;
 b=SOFB9qplxpme4Q6bD3wVTCVvBEQMkZ1dGk8wG6a6Dno7dYIeLTn+7weMK3SRRsWOrZ
 Lp54iodbTxlhEMfDaQxAgb2ARTnR41IUjmQVe2799ckVUfAs6VBw3cngJmGuaSRpgAp5
 Z8QvW+gKq/W874irzUgq3I1LsdARRSynTUdJuqiV315YoI/iBW5m16jcL2rRvv6565SF
 QEwLBRgVDEFYwhMYOrWgF3rCtbTkeRRFk6KzYEA0s0pSqH04UhbUVGBiafWm9qWKDzBz
 o1TBkA1wcOcQHif4FIod4Wsa2cqcV9RzkrbWrRbPyS6xt4l4POcGvKT7zVZ6h1WnvD2m
 D/rA==
X-Gm-Message-State: AOAM533WMqRQ68NV2zAjZB+m824CZUTCp147+lJKxpW6HVB5jRv64wNg
 JXEmPYHZtZzvp5sqsj9NUxe8tAq+yCqPEovF
X-Google-Smtp-Source: ABdhPJzL0RqFTXQzlWUn3TBLPE8uRtZmzcDmCmxaOZU1fHE1r7/T8vCM+UJ+PGA1xeCtwGogUkk4pQ==
X-Received: by 2002:a63:fe12:: with SMTP id p18mr5519203pgh.425.1619211415366; 
 Fri, 23 Apr 2021 13:56:55 -0700 (PDT)
Received: from localhost.localdomain ([49.37.83.174])
 by smtp.gmail.com with ESMTPSA id g21sm5679013pjl.28.2021.04.23.13.56.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:56:54 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 mikita.lipski@amd.com, eryk.brol@amd.com, aurabindo.pillai@amd.com,
 Nicholas.Kazlauskas@amd.com, stylon.wang@amd.com, Wayne.Lin@amd.com,
 nirmoy.das@amd.com, bhanuprakash.modem@intel.com
Subject: [PATCH] drm/amd/display: Remove condition which is always set to True
Date: Sat, 24 Apr 2021 02:26:44 +0530
Message-Id: <1619211404-5022-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
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
Cc: Souptick Joarder <jrdr.linux@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kernel test robot throws below warning ->

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:3015:53:
>> warning: address of 'aconnector->mst_port->mst_mgr' will always
>> evaluate to 'true' [-Wpointer-bool-conversion]
                           if (!(aconnector->port &&
&aconnector->mst_port->mst_mgr))
                                                  ~~
~~~~~~~~~~~~~~~~~~~~~~^~~~~~~

Remove the condition which is always set to True.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 9a13f47..8f7df11 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -3012,7 +3012,7 @@ static int trigger_hpd_mst_set(void *data, u64 val)
 			if (!aconnector->dc_link)
 				continue;
 
-			if (!(aconnector->port && &aconnector->mst_port->mst_mgr))
+			if (!aconnector->port)
 				continue;
 
 			link = aconnector->dc_link;
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
