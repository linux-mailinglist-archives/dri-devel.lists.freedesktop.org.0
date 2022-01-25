Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 530CA49BF5D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 00:07:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD5D10E539;
	Tue, 25 Jan 2022 23:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA00B10E539;
 Tue, 25 Jan 2022 23:07:33 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id c23so6932768wrb.5;
 Tue, 25 Jan 2022 15:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=Y9LwOzwvaj9hQQsDetJws7+MI998U+lrWJC7uwIJJ/I=;
 b=FX4F+DMIKGKmh9PQFb9g5hzRstVD20nuH4FkrocpJZlPVtYgB3zhE6mwitpKZDcFC/
 uekdVtlkXjflrtrGJba+H3PBATlZe0npU2KtorCZp1sLM3jkJ+0OwkYwFyi31DvhSAQs
 fb0QvQUfZFS8sitFnno4N6aYL2ayouoQwEHDSVVI8hw4OTWvgCoZVyNarKr0QBo8A/VT
 VdQZ627YqW4oVHrHBzF49a73/fDOUPcyI6FCChs8kjLVKuC4grDiDRpG5FqHGlkHCqPz
 NehwkN3mswrfm7+Xc0Vz/hfNT4JC0t7BgvLiuS5/AnYq98E7S/0PhFJcgvy3YC42HEvA
 zsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=Y9LwOzwvaj9hQQsDetJws7+MI998U+lrWJC7uwIJJ/I=;
 b=iZWFJbrzu2bGjMmb5e02t3mRjoj5+22xEkTjxHAy4XeP9m+wB97lfmzUKuo7YtIuka
 N85lG3Fa/lLZjd3cfvsSXeiaZfTxwfUz6Dv26fMYtYBZwOJ5m2eDSuBdTSF9cnuANCHA
 R4FuWcQy1gG+FaeiMG2pHVxC0e9F8r7huhaFd9j9XR/y9jamhjVWAcK+xJK/nQSZQM6v
 Tg3Hf4mSfNGAWtxB84MDhi1FRSG+UtG1jF8aIAJNwtK3Z+DBiPM9lBL89LTkWkFkaGjH
 FaNgzFepEOErE72TOv9Mfu8Cp8I2lP9R7kgERQhvU1VsiCa34wty40N24/f/RHkK7qHS
 EpAw==
X-Gm-Message-State: AOAM533TncoarlBoOqV/1PlXWlS5OZmzvVIP/ek2DA48dcvF98rGYbCR
 DKFubmyJti9kSuRzKst/7OGwo3QXsro7eNnr55Y=
X-Google-Smtp-Source: ABdhPJy7pW57yvv0C0Ltewjty7KY3mPgDXMn6HXB3Cn0j/zsfcqkqDzThlWqXh7h4JjErvp80D/KedK8rjz/+x96pDo=
X-Received: by 2002:a5d:4bd0:: with SMTP id l16mr20168250wrt.93.1643152052027; 
 Tue, 25 Jan 2022 15:07:32 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 25 Jan 2022 15:07:40 -0800
Message-ID: <CAF6AEGvAfsgtr==VM4wixAC_hSTuV=eNWXxX=BhZqQrbxHjKgg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2022-01-25 for v5.17
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

A few fixes for v5.17.

The following changes since commit 6ed95285382d6f90a3c3a11d5806a5eb7db715c3=
:

  drm/msm/a5xx: Fix missing CP_PROTECT for SMMU on A540 (2021-12-17
15:09:46 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2022-01-25

for you to fetch changes up to 6aa89ae1fb049614b7e03e24485bbfb96754a02b:

  drm/msm/gpu: Cancel idle/boost work on suspend (2022-01-25 08:54:41 -0800=
)

----------------------------------------------------------------
Jos=C3=A9 Exp=C3=B3sito (2):
      drm/msm/dpu: invalid parameter check in dpu_setup_dspp_pcc
      drm/msm/dsi: invalid parameter check in msm_dsi_phy_enable

Miaoqian Lin (2):
      drm/msm/dsi: Fix missing put_device() call in dsi_get_phy
      drm/msm/hdmi: Fix missing put_device() call in msm_hdmi_get_phy

Rob Clark (3):
      drm/msm/a6xx: Add missing suspend_count increment
      drm/msm/gpu: Wait for idle before suspending
      drm/msm/gpu: Cancel idle/boost work on suspend

Xianting Tian (1):
      drm/msm: Fix wrong size calculation

Yang Li (1):
      drm/msm: remove variable set but not used

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  2 ++
 drivers/gpu/drm/msm/adreno/adreno_device.c  | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 11 +++++++++--
 drivers/gpu/drm/msm/dsi/dsi.c               |  7 ++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c       |  4 +++-
 drivers/gpu/drm/msm/hdmi/hdmi.c             |  7 ++++++-
 drivers/gpu/drm/msm/msm_drv.c               |  5 +----
 drivers/gpu/drm/msm/msm_gpu.c               |  3 +++
 drivers/gpu/drm/msm/msm_gpu.h               |  3 +++
 drivers/gpu/drm/msm/msm_gpu_devfreq.c       | 21 +++++++++++++++++++--
 10 files changed, 70 insertions(+), 11 deletions(-)
