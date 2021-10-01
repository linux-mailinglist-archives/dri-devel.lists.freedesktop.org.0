Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C830241F27A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 18:50:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4156EE40;
	Fri,  1 Oct 2021 16:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9536E536
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 16:50:16 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id u18so41389957lfd.12
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 09:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l5rYfVQ7iM1QyKb4qznpoO3iNcz3ESl00mm9zd/tA4I=;
 b=g6ToIr4Gbta2a1TWw9cfyk99csGSDgmXcprVJMuHsFrffC9T7CepjZHM7uTDESGGeC
 naKVZLvOzzBR4wKtsJDjfRnJ6zLQoW8qFTQfGBwpiSOyYU8/AJdcCifj8xi0zPkxZXa4
 OPhN6q5DcqQluqBD5w9ynPkCeCWDa0lqEEL2FtMBOEPDVCNjEpch8m+3SEcpInKM/DCl
 5TC7MfdN6rz2SvF7deiAZsCeeeMiQSxOsUkDmfjH2vjoP+DiB3IYTZUaXEjQeA13wjkf
 UCavrGa2z6XtSMLdWRAj2ObhHeS9V515WWFlunB2LwZhmagRFpHKylYsMsHrD4nLL3e6
 f1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l5rYfVQ7iM1QyKb4qznpoO3iNcz3ESl00mm9zd/tA4I=;
 b=qSUd+Gp+IGE6nOFN6Mpxr2Eo8JoY0uRYrGb81J8jQiQaZ9PByZZNYz2Wq83tnz8ijF
 jAPT/XxJuhQt1v0u3UzeHXjlFAjvHvmmSkvZnjuTIp9vj5cfT+PcYuSPXupzHAp1nOok
 NN5cr8o98ALuZEnNZ3pZdWaUdwwibdkFABt+6+4r7VwTuHKs69p2pfyV1BdoFMJ9yRV2
 9rI02ktNnTo+Bhzfjtr/DLCthLFgeiIMDnYNHylHthFbj3QnPJ/jEDcpVfYE86OIIiiW
 M6s4AlUBWRY5vmV9GJyAZkQlu+vBktuNRVzQF1t1lm9L1y9NxVA7dlBU4tIM1qKvs2cl
 7uvw==
X-Gm-Message-State: AOAM530DD18tpbmdP+dkiquL9UT0SmU3wT9OAl3dNi+huIC+RZUQW436
 792GHRC9mGT1owDyGW5Bunw5SQ==
X-Google-Smtp-Source: ABdhPJzZWw4NFAr/uwTlOqKvU9D7G9fo30WtSVpqyaU9GL9OOfrE/Es7/4tm+la0xr9DdVjkFOJBfA==
X-Received: by 2002:a05:6512:16a2:: with SMTP id
 bu34mr6372263lfb.147.1633107014351; 
 Fri, 01 Oct 2021 09:50:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id n24sm787052lfq.294.2021.10.01.09.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 09:50:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH 0/3] drm/msm: drop old eDP support
Date: Fri,  1 Oct 2021 19:50:08 +0300
Message-Id: <20211001165011.441945-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
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

MSM DRM driver has support for eDP block present on MSM 8x74/8x84 SoC
families. However since addition back in 2015 this driver received only
generic fixes. No actual devices with these SoCs supported upstream (or
by the community) seem to support eDP panels. Judging from downstream
kernels the eDP was present only on MSM8974 LIQUID or on APQ8084 CDP.
Remove this driver.

----------------------------------------------------------------
Dmitry Baryshkov (3):
      drm/msm/mdp5: drop eDP support
      drm/msm/edp: drop old eDP support
      dt-bindings: display/msm: remove edp.txt

 .../devicetree/bindings/display/msm/edp.txt        |   56 -
 drivers/gpu/drm/msm/Makefile                       |    6 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   17 +-
 drivers/gpu/drm/msm/edp/edp.c                      |  198 ---
 drivers/gpu/drm/msm/edp/edp.h                      |   77 --
 drivers/gpu/drm/msm/edp/edp.xml.h                  |  388 ------
 drivers/gpu/drm/msm/edp/edp_aux.c                  |  265 ----
 drivers/gpu/drm/msm/edp/edp_bridge.c               |  111 --
 drivers/gpu/drm/msm/edp/edp_connector.c            |  132 --
 drivers/gpu/drm/msm/edp/edp_ctrl.c                 | 1375 --------------------
 drivers/gpu/drm/msm/edp/edp_phy.c                  |   98 --
 drivers/gpu/drm/msm/msm_drv.c                      |    2 -
 drivers/gpu/drm/msm/msm_drv.h                      |   12 -
 13 files changed, 1 insertion(+), 2736 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/edp.txt
 delete mode 100644 drivers/gpu/drm/msm/edp/edp.c
 delete mode 100644 drivers/gpu/drm/msm/edp/edp.h
 delete mode 100644 drivers/gpu/drm/msm/edp/edp.xml.h
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_aux.c
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_bridge.c
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_connector.c
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_ctrl.c
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_phy.c

