Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF0151C147
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 15:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632A510E1F7;
	Thu,  5 May 2022 13:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBD410E1F7
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 13:50:11 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id p10so7566124lfa.12
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 06:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UpknYVo+DPBanWKhGXXYTya2awtDru7xqOaKjU/zIXs=;
 b=jYpTjc8C+5n8SykUBLJlcX5f4/GaOP6cofNjPFSWocIRskcsTJBKXn3aPUWYfj9ejM
 U0o0tNYhzJ24OB1Rfdisw6FWA/OiwTIjo1pVJyKqKIgw5KQ8503scj/bwx+0FoLZAsSU
 f8C2J/BFIz122GP0+cSOtixDfiIBQWM/5TqmXVTk6v8iv1477Lu1Ovh1EmQKvz8QQ4fA
 61mA+ykZrb+zZbseVcAbtUao6oxksh6pLzGGal+wb06aDuN7MPMuIS5aefWz3fIID0a7
 n+Lrr/z3RNnpg9plBf7SPpW/oQHW0y+Jp2HB0m8U7GDhig/z9d/z9j6TL3o+urvX28Pd
 rvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UpknYVo+DPBanWKhGXXYTya2awtDru7xqOaKjU/zIXs=;
 b=Mrr8XUUkpOrFxY+zT/17LN6padPBPGvr1qzKGBO+35GWXs+H5RYQ33rAuU1ofpZFyE
 IF/GeZETnk6b0RCkj29pAQo8ZEwMa2EU6mUfaJIDD3omD5CqrIouJIq/i3ilpdYHL71q
 TYxLQejDxl6KbZyQmqdZagJe6qDFM1rs6fCE01477FOBTzStWcXDmi/qTh6jo6Vk4Nkk
 8uFhVtADS3yhImG/GiAYoA2yhL1+fy62326LpAxyOZv2jGr0Rur1RbKnrJWux4Vcy0+m
 0BSRl1EgvZBZQEIyZLgdgrz4/4AcFRWiwWtZE41Zqg7wkiZ0FfnZNzWHEGhunnGfUFPg
 R93A==
X-Gm-Message-State: AOAM532J1l2vzY24StLWUvvJ/1eC9kmkBPWL+jWuVJQTVsJLQoiL+3qc
 sjIKYqjnF+e1wVtX0jGBVOnivA==
X-Google-Smtp-Source: ABdhPJxk+A+USoTrmmhDNbDbzaJg/sCHtmKZabpJS2NcPJFPHS1t7xOecFr/5FjS9oNdhmox/ahsPA==
X-Received: by 2002:a05:6512:158c:b0:473:9d87:aa23 with SMTP id
 bp12-20020a056512158c00b004739d87aa23mr12785524lfb.409.1651758609431; 
 Thu, 05 May 2022 06:50:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 c17-20020a2ea791000000b0024f3d1dae96sm210935ljf.30.2022.05.05.06.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 06:50:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 0/2] drm/msm/mpd4: get rid of struct mdp4_platform_config
Date: Thu,  5 May 2022 16:50:06 +0300
Message-Id: <20220505135008.1351533-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The struct mdp4_platform_config is a remnant from pre-DT times. It
serves no particular purpose nowadays. So let's get rid of it.

Dmitry Baryshkov (2):
  drm/msm/mdp4: move iommu_domain_alloc() call close to its usage
  drm/msm/mdp4: get rid of struct mdp4_platform_config

 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 29 ++++++++----------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h |  6 -----
 2 files changed, 10 insertions(+), 25 deletions(-)

-- 
2.35.1

