Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E353F43291A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 23:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327156E0E6;
	Mon, 18 Oct 2021 21:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D6D6E0E6;
 Mon, 18 Oct 2021 21:34:12 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id r7so43882390wrc.10;
 Mon, 18 Oct 2021 14:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=T0jbfDzJhAYd0E08unfXmLsF1SeJ11JRZ9S7Xu6DDhA=;
 b=Ap4Sec0h0DHf5IaMMymV165P9PD7vk5os+9JkSO2YPCQiD1tKgErEELDtFHBK6LN7y
 OhJONaKS39EMam+tjxYM4sR9D318mrT4YHuUmGDo+dAGqKgoevFztXfR4TwiTLb3xxlv
 LtZ2x5OMONacvjDCPcskcsevkG17TpoUZjW+MixCxKWnbRU8GBHTGQIsC8KYxF5QYKsN
 q27A7Li37de3wnukyYkA9E969mlofeq9TmCT7Z1cy3KeUnda4s8VPQBuZgfK+vi6amIX
 sfWG38lTXe2PiftbMojT22O+KODUIbVOKcoeG9zuwND8BrjP3ZObkZ4WiRO3NdqCOhe6
 CDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=T0jbfDzJhAYd0E08unfXmLsF1SeJ11JRZ9S7Xu6DDhA=;
 b=XpHyIA8fm+hryFcjnt63jnWYvkiVLFPz1mHxTxYEeQCDG6f7Dwf9iWGL5rPjU6/Bf8
 h9uZGHyxkcUwyLPFqyX9uvSfeFRdEVIvcrSRFIEvGumDJKRX7W+iVYzgM6jxb9v8qhOw
 /mcDy/5uzXoNEjBnumrdNVtidTGK+IEKlj7S27jxRPE+t5n5deZFeWFS+r+WaGlhodov
 LfMbqp5ZbSK8oerrJbfAvr7IOkectP0yiKM3XDABVNO8qY7ZkkGsTR12X+j51DpAhJ6g
 XVxeViQd5JxxDZncwMtMdl6aZUhGLqWrTgba3nE7/j/2TEo4IhHKtoLfZtP59Fe9KkB5
 H0/w==
X-Gm-Message-State: AOAM533ot0/PIsuvCF+NyOSoYEUYNi9Z4dI3yOXjubgF0ZM9qtqSwFuG
 ds5mxNOH6Pb7Sjys5rU+lzqiAHEp5TZ8+QehmlE=
X-Google-Smtp-Source: ABdhPJw0IclkSarK4jj7Q6U+Oj1MJqGgjHDd5sF7mnnCra0vsssJR4GhC5Ky4Zwpe9LcQwMeFo1ews/EDBUMvl1/0kg=
X-Received: by 2002:adf:bbd1:: with SMTP id z17mr38272312wrg.61.1634592851221; 
 Mon, 18 Oct 2021 14:34:11 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 18 Oct 2021 14:38:50 -0700
Message-ID: <CAF6AEGs1WPLthmd=ToDcEHm=u-7O38RAVJ2XwRoS8xPmC520vg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2021-10-18
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

Hi Dave & Daniel,

One more fix for v5.15, to work around a power stability issue on a630
(and possibly others)

The following changes since commit c8f01ffc83923a91e8087aaa077de13354a7aa59:

  drm/msm/dsi: fix off by one in dsi_bus_clk_enable error handling
(2021-10-11 17:30:54 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-10-18

for you to fetch changes up to 5ca6779d2f18b195cb3b66a14a271911fc609094:

  drm/msm/devfreq: Restrict idle clamping to a618 for now (2021-10-18
14:31:57 -0700)

----------------------------------------------------------------
Rob Clark (1):
      drm/msm/devfreq: Restrict idle clamping to a618 for now

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 +++++++
 drivers/gpu/drm/msm/msm_gpu.h         | 4 ++++
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 3 ++-
 3 files changed, 13 insertions(+), 1 deletion(-)
