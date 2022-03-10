Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1990B4D559A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 00:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5271E10E0E4;
	Thu, 10 Mar 2022 23:45:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D62F10E0E4;
 Thu, 10 Mar 2022 23:45:32 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id o23so5983522pgk.13;
 Thu, 10 Mar 2022 15:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TJVGSw0Gsp0ElMn++CtRLOM3hI6c+NG4/N8yRR58DmQ=;
 b=nFHfOqVeAKi8MeaSk15PZpvyM2vC539pwlaEbTxQd/oePNq3xoZ9IdbxmFGQHzwuzl
 ouayfD2MWaKeAcMYR3kdbw7bQtTMrzN9e/PpPyMng3zpKWktpQC5mPZFeZ5dMnt3zbB+
 VIy5JCjQpWwv5ptUwYpCcXwGaBDvJ5uf6gx1IIf5PAYqbfBPdlPCtqqSnZr+pGKotUZg
 WY6Iw8waLo69on5La8JQFpvVPDH57przII556uWEXQpViIyxgVSiuitQmbx9zAoz9PAC
 hRHAu7lo4UQ/+jFLU1Y1cIiYe3bR9CNBnO3cHBjfQ9whAaAub5TBmx4hU80aNbK7xVth
 4uAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TJVGSw0Gsp0ElMn++CtRLOM3hI6c+NG4/N8yRR58DmQ=;
 b=PLM6LrGoaprZJ1AAAonTE/PuVUb/GFfwjxUmUqC1a2fO+xXYc/cJQkf7XBuiALomT5
 H4HPd0vdi/ShxsVAoaOu8MWZ3ASaUFB6ropmGH/jztn3FVNnj4ysD4ZcIxwaxF4I2L6i
 GGgxqro4S5h5tfAOO7EOxerE4AeAHMW8YRHz+jH4f94d5xGED27LqPMX+30/lsWChIBT
 QnfZCO0EUbQiN1bKVXuaB0U3huiEYfgybl9rqprfCMP6UJF0YjrYCtjE9JgDkfz+k496
 yOCXQwCicU7ypZCxSNW0jNXVkDDVNFI7b1PgpBvdQf8g9xLmxNqzQmugVODAKgPOglNt
 NUug==
X-Gm-Message-State: AOAM532fw6VqXSxbnxAiy6BdfcaacwOJZ9q0ROwNnDXx6+/k0JGIWghN
 85RZb2imbXpp5+1ycw3pZzVBkrgXlSI=
X-Google-Smtp-Source: ABdhPJwLCG3YZoyGRoW8VPXvzJyAmxxuYzqRFyADp5+KhU4VByp4OuLPa6ObO/2zjFDSW87z4UMlVw==
X-Received: by 2002:a63:e817:0:b0:373:8abb:2c51 with SMTP id
 s23-20020a63e817000000b003738abb2c51mr6075407pgh.185.1646955931416; 
 Thu, 10 Mar 2022 15:45:31 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a056a0022c200b004f7649f78dbsm5915119pfj.139.2022.03.10.15.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 15:45:29 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/msm/gpu: More system suspend fixes
Date: Thu, 10 Mar 2022 15:46:03 -0800
Message-Id: <20220310234611.424743-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In particular, we want to park the scheduler threads so that suspend
is not racing with the kthread pushing more jobs to the driver.

Rob Clark (3):
  drm/msm/gpu: Rename runtime suspend/resume functions
  drm/msm/gpu: Park scheduler threads for system suspend
  drm/msm/gpu: Remove mutex from wait_event condition

 drivers/gpu/drm/msm/adreno/adreno_device.c | 79 ++++++++++++++++++----
 1 file changed, 65 insertions(+), 14 deletions(-)

-- 
2.35.1

