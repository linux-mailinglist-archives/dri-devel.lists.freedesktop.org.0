Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91534515F5B
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 18:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D973210E42C;
	Sat, 30 Apr 2022 16:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77C810E1E8;
 Sat, 30 Apr 2022 16:54:37 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 az27-20020a05600c601b00b0039431ba4905so229636wmb.1; 
 Sat, 30 Apr 2022 09:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=UgcfR9fxU4zn71AkYAESURVcvwrfVRwbY7xOuXfpyVs=;
 b=RaVNxJ1ZS3dYfc2EW9OaPpgudBJ6n/5ARY+OKf5kiz//QhyBK2GzO9Vw2u8KbabzK1
 frw4eR+tJiKArbMjTF1ZgMt9cUi5CyFBn3dsiQS8tMnWM4ARCMV8qABMTXq7Uo2/7hNk
 6aTo//bGnmWPO7PTMJqBlOG+zEaJ9kIohIdOCiu3XG7dd3qP6H0jvG6sT1xDQ2gG6rJb
 bQraA3FCd35zqxDSTIAMW1w/3vFr/9Iu3fRWdUKM3TnRNGmbvz/ywWY+ldq2vaKwRdLR
 Gm6n0vax5hJ949t7uHBVkyFjfzCDpS61SxeDyOgGuWddSdEpCTQo9vjMmun8SNYezJHI
 w0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=UgcfR9fxU4zn71AkYAESURVcvwrfVRwbY7xOuXfpyVs=;
 b=z2LlLH0i+MIX3iThhc3st/uY/7FpQ5eR6dk6jnseg7kgOOLOhj9Q6yk/zv5R4aHYhj
 tW4Jk6GS/V6Bxy+AIx8ba2/F8ZITmAim1LnNPlAIfeC40QAnbkXJBnRqT+jAaA3WAB6K
 xnkh5jQcrdosHM+XGNlkH06BYu8hhrgXn1a5e1bMoTobBxpYFI2N9NFEcI3BkRfhUyz2
 6NJvu8h9Taz8nargr0IVcAjROOl7KdXJKweTKwc/EhQcmpJAivxv4YLnlcdSiZubZH7w
 6v3XNB0XE6r+y4TKpzWL2z7q5M17kSefWvVv40lX9q6WSjIkab/suK3/I5eoL2mALSO0
 vK1Q==
X-Gm-Message-State: AOAM5306JXnoOaQf/UAsf4nyUOsTU3i7jtjOkxZOEDvp9E2iB7nA8eCE
 MQTYiBo21447NHOS8Hak3d69B90idp+14rHsCAE=
X-Google-Smtp-Source: ABdhPJwdO4xjsnmx6Bm8HEjwC+mQZtQxVrKTkJrHIUXRSOWdtkI810k4ORQlSla+k9gRR1V+zWGIQR6Xo0tEsV3sFr4=
X-Received: by 2002:a05:600c:1548:b0:392:8e1a:18c3 with SMTP id
 f8-20020a05600c154800b003928e1a18c3mr4259445wmg.102.1651337676201; Sat, 30
 Apr 2022 09:54:36 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 30 Apr 2022 09:54:24 -0700
Message-ID: <CAF6AEGtkzqzxDLp82OaKXVrWd7nWZtkxKsuOK1wOGCDz7qF-dA@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2022-04-30
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

One last fix for v5.18, to fix a lockdep issue.  Sorry, I meant to
send this a couple days ago but forgot.

The following changes since commit 0371870b96907bf560ecf7dc3fadc238fadf7845:

  drm/msm: Revert "drm/msm: Stop using iommu_present()" (2022-04-19
10:33:07 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2022-04-30

for you to fetch changes up to 3f65b1e2f424f44585bd701024a3bfd0b1e0ade2:

  drm/msm/dp: remove fail safe mode related code (2022-04-27 10:17:05 -0700)

----------------------------------------------------------------
Kuogee Hsieh (1):
      drm/msm/dp: remove fail safe mode related code

 drivers/gpu/drm/msm/dp/dp_display.c |  6 ------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 11 -----------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  1 -
 3 files changed, 18 deletions(-)
