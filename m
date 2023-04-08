Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A32416DB7D2
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 02:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA90210E0A6;
	Sat,  8 Apr 2023 00:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F8610EE92
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 00:27:53 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id h11so49258471lfu.8
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Apr 2023 17:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680913671;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QocMDDn8DwDw0qXiJTkMUymAN7joIFS2Ye/0Qdix5yY=;
 b=kQGdvRwOxmR5CbW2yGId9v9QFtdAJqYLpfbA/64abBc1mKJlAva0v1467S0967Yez0
 LmJLVWc6B25OxvfYbKZQh4wSedertfHOaTIuHXAMQ8oFQquDafVdY9QkE3O+B0yNqgzu
 SkXiW4xdG06jP2xKacgOkh1fox5q1tX2dlpchyZ5Hf44amJr+LGLFRpraqNxvd8FNSRT
 DfSjz3+M+y1F5hA/hsplZls1d0zm//n/MLnZI6QxmcZMmVrHCLuRmPRJfrOr/kvvziWD
 4SwhmxK4PDMB9++lezacv84PevIhzAXcFeKeq4fHcpyWXAgLy5om0BU7kag0ZvXMO/Ws
 aTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680913671;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QocMDDn8DwDw0qXiJTkMUymAN7joIFS2Ye/0Qdix5yY=;
 b=o5iBag7F5oAG94FVVtkVcbY6jd431bMjVd+UsoIOUgviHZbWWWq8fd8dtIjFuGJ+PA
 Wh1Zqb+P+BnhAANAd4F7SzM4y7owj1u/3Iwfle9hvdHznnb6WOr38Mmk1Lg2gz0Bb02r
 JdjnZQx3McCJqWTWdOVizTidZ6llFUYZUpBLhpZPVKxBCFmyxDAcQfqScpdlyeCTa17l
 KikzQOVZiMk/XA3l+/7jjczQ4f6yFD9P+TUl7nZi1aWLmtqAh749j5a4DLCEza9CbMmV
 p4T2ts+EWhsmBGw0d7S+uuLKlfvgXrlBv/UPaSWK/i2/0YRc4oH8yvAMQAzZOWQwcsFg
 hU2w==
X-Gm-Message-State: AAQBX9c5X+RiW6sI7AOIf1FD2DvMu1hOnqCb/kbQQdwQz+QfyRiRgpWg
 dtXsVa5RynwPWm8X4IxPl7dcPQ==
X-Google-Smtp-Source: AKy350YOBr25W7qvgcoTETSbm44LgFRivLUr/kIUFzRDxT595IgxtGtCmYCspyO9iqw04hO4Es/oEg==
X-Received: by 2002:ac2:4d12:0:b0:4e9:aeaa:ddb5 with SMTP id
 r18-20020ac24d12000000b004e9aeaaddb5mr1143901lfi.14.1680913671031; 
 Fri, 07 Apr 2023 17:27:51 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 q15-20020a19a40f000000b004db3e2d3efesm915759lfc.204.2023.04.07.17.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 17:27:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v5 0/4] drm/msm/dpu: more catalog fixes
Date: Sat,  8 Apr 2023 03:27:46 +0300
Message-Id: <20230408002750.2722304-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a spin-off from [1]. Since most of the patches have been merged,
split away the small fixes. Continue the versioning of the patches.

Changes since v4:
- Fix commit message of sc8280xp patch. It is split display/panel rather
  than split source (Abhinav)
- Added DSC_4 and DSC_5 to sc8180x patch (Abhinav)
- Expanded commit message of the sm8450's CTL patch to describe all
  reasons to use existing masks for the SoC CTL features.

[1] https://patchwork.freedesktop.org/series/113910/

Dmitry Baryshkov (4):
  drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
  drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
  drm/msm/dpu: enable DSPP and DSC on sc8180x
  drm/msm/dpu: use CTL_SC7280_MASK for sm8450's ctl_0

 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 28 +++++++++++++++++--
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  5 ++--
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  6 ++--
 3 files changed, 32 insertions(+), 7 deletions(-)

-- 
2.39.2

