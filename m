Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB1655E8E8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 18:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0057211298E;
	Tue, 28 Jun 2022 16:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9B9112535;
 Tue, 28 Jun 2022 16:37:35 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id n185so7678282wmn.4;
 Tue, 28 Jun 2022 09:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=zTrnKXsP357t4essNdCGgt/pIcSI3m0gn7jRuKNWiEQ=;
 b=dYQyZu9hKQVdrmwLqjZuuis22j79t0huSOLkc/q7KbSN2p5jEDEmGQKqxKccXO4PEQ
 /AF/u57LtJgqmCBOmjUXGL9LVX3784EwUj7hbppVcj/fRXLNxRe4Zn6KJsf9uH6TVtZs
 Qm6EjILKgODglsV1SG+Vzn4jqAenxwNHHN4gB7I8CUYz+wJ+20h6HaE7BzonhBbSffEC
 q6Hm7zIG/4bzIW9KxOYoJ+4T/kvaavYZX0DXsF3BJONMyOUsicaZoVq5xJOshlgck260
 5IiRk3gZ9x0e7Bu1fpYJytGdiA0otZ5WOfhrmUp7lyS9I17yjPUSYuDznR/GJrW6r6A/
 qqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=zTrnKXsP357t4essNdCGgt/pIcSI3m0gn7jRuKNWiEQ=;
 b=agGyN0jWT1dWFinHfKEq66G5D/VRNSjdGd/UtDgYySVI+9Eoy3MPJMqo3FNAd8SY1S
 rcfMko1I4MENEpcyrwdUalum4Dvh2zt5S8TGC2Hk7shlPrbxjZog83/wpdw7KnE5ynci
 UOp+MIxy44rFNQSWsQ6tKfRTdXUY5NnUksiJuwrTE+rJX/sht6ScWnnjEGjxMfQw5/Vk
 xnLdkLNLdAYO8VAlU2tWSOtFX1srrCH1eElFwCggrGSZDQ3YZF015gES+Mjesi5z7aYp
 SQTiA2k/zf+JavBWWKb30KTig4Ky82Xj3WXIDWlK1lmw2wMN/jzcKNZBqEbpJKgx4KZI
 0WjQ==
X-Gm-Message-State: AJIora9ZTj6wryywYw/vItsdvnMDJasOdv/TjHB95ycGi8euBOcQo4sH
 sUHFBGDYGAO3cqjCf1X9hfJ+gBGmQyR8neuKKHk=
X-Google-Smtp-Source: AGRyM1uOPdxafZdL1L2hYPRlKZOts53RkqBtiPY4vRVqV7TiAXTMG9m44Ga3PBCJeX+pOZH4DKOC2Gr5zsxTPxL6B/Y=
X-Received: by 2002:a05:600c:4f96:b0:39c:951e:66b7 with SMTP id
 n22-20020a05600c4f9600b0039c951e66b7mr556966wmq.84.1656434254256; Tue, 28 Jun
 2022 09:37:34 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 Jun 2022 09:37:48 -0700
Message-ID: <CAF6AEGvswNKdd02EYKYv5Zjv7f+mcqeWC7hHQ1SBjqYzN_ZHnA@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2022-06-28 for v5.19-rc5
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

Hi Dave,

A couple remaining fixes for v5.19, summary below (and in tag msg)

The following changes since commit a6e2af64a79afa7f1b29375b5231e840a84bb845:

  drm/msm/dp: force link training for display resolution change
(2022-06-18 09:14:06 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2022-06-28

for you to fetch changes up to 08de214138cdea438a0dfcb10d355a6650c6017c:

  drm/msm/gem: Fix error return on fence id alloc fail (2022-06-27
12:48:27 -0700)

----------------------------------------------------------------
Fixes for v5.19-rc5

- Fix to increment vsync_cnt before calling drm_crtc_handle_vblank so that
  userspace sees the value *after* it is incremented if waiting for vblank
  events
- Fix to reset drm_dev to NULL in dp_display_unbind to avoid a crash in
  probe/bind error paths
- Fix to resolve the smatch error of de-referencing before NULL check in
  dpu_encoder_phys_wb.c
- Fix error return to userspace if fence-id allocation fails in submit
  ioctl

----------------------------------------------------------------
Kuogee Hsieh (1):
      drm/msm/dp: reset drm_dev to NULL at dp_display_unbind()

Rob Clark (1):
      drm/msm/gem: Fix error return on fence id alloc fail

Stephen Boyd (1):
      drm/msm/dpu: Increment vsync_cnt before waking up userspace

sunliming (1):
      drm/msm/dpu: Fix variable dereferenced before check

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         |  3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 10 +++++-----
 drivers/gpu/drm/msm/dp/dp_display.c                 |  2 ++
 drivers/gpu/drm/msm/msm_gem_submit.c                |  2 +-
 4 files changed, 10 insertions(+), 7 deletions(-)
