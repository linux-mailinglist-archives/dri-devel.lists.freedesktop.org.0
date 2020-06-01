Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F05811E9F4D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 09:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED8C6E188;
	Mon,  1 Jun 2020 07:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CB86E188
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 07:31:10 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id y13so2608972ybj.10
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 00:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=kRkFC5YJzL5fGZzgFQ171+ROrzAT9l63fzlZn0VZR9c=;
 b=uR63RQhlZd/fs+ADfqDInSTGmCYV3PkEMPvXDmzdk3F4Uh4eoxMzVdAKlm6OfQpk22
 nWI5g01AAYdiDN0zLlmxEJdDfGGWBU08/V9N5ab5SpULecuIi7f7N5MBQ49uaWoFPsrR
 QcgFu+cb10DMGw6EI3zW2lg5prczK4iwE4vljFWSMQRQmBrhGH3eOshJ4wRAExHBBHhR
 Lqn+DfiXcLvhV9l8xSkmR6LR6w+aIWMVkhcJSdDh7O/ggEaWUl+Pi3xHvFCODXzTiC2S
 qak0zOAG3NIXd2GWuVi1k4p7sP6BRzNBM4JXUMN4DH2nGIVIkueSg6FESlcWS1mCmtLV
 WNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=kRkFC5YJzL5fGZzgFQ171+ROrzAT9l63fzlZn0VZR9c=;
 b=bhXQ+3QCDGyfcr6tL5pZrtQvO9deXjhLQk2wusDTkTQ6neuxRDdMBvFQCmhCLFrgqA
 GrIdyp3nRG+Buq3atsRwhod2p8vKilYyvIg9aS3ivpIfOHJkDiHs1uEX2J93ah98IiZH
 Ha3694ku11/6lFS7jiUDtQS0b3Npq+XqtWy8ekRn1OCGmk8MHibFs8hTOAiCgRlFkfCx
 zfAt1EgiBL7ydKQFON7oP03BrAkjzl3SCWlPWu3BKcilcIh7+jva2kCV9PIyszrFnv36
 8xMSqKTbWuCMFojgwmDHlsDqcM7VAMXuVnpLLILq5H/OFWpCGDQp3c9cpJTAv/93vSgF
 pT8Q==
X-Gm-Message-State: AOAM531qHiZ/F6aeFhnTfmAruXM28+LOtIEsWoPn3XGe3RKtEg73+w6l
 kTzM7ZqdmfXFtXfXgoXSDv/ZByZEJW8kx8w1TrTsPVmuQ3M=
X-Google-Smtp-Source: ABdhPJyoNJeNvUaqokXJN6XSg97CF9Y/Nv0bXm43bqUflWLcWrL6kVYpr4txIY+IhmsJQenQlLZd+pV2+fHmAynImgo=
X-Received: by 2002:a25:7b41:: with SMTP id w62mr30134785ybc.435.1590996670029; 
 Mon, 01 Jun 2020 00:31:10 -0700 (PDT)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 1 Jun 2020 17:30:59 +1000
Message-ID: <CACAvsv5WPrkm2X4HyBX8TO_wq83eQ_WJ15MtHxJVU2OR-scVMw@mail.gmail.com>
Subject: [PULL] nouveau-fixes 5.8
To: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just two fixes here, one for HDMI2 modesetting failures, another for a
race with the audio driver.

Thanks,
Ben.

The following changes since commit dc455f4c888365595c0a13da445e092422d55b8d:

  drm/nouveau/dispnv50: fix runtime pm imbalance on error (2020-05-22
11:13:53 +1000)

are available in the Git repository at:

  git://github.com/skeggsb/linux linux-5.8

for you to fetch changes up to 0ad679d157aa69ddf0ee46b564c9fbb646cf6d4e:

  drm/nouveau/kms/gt215-: fix race with audio driver runpm (2020-06-01
17:28:42 +1000)

----------------------------------------------------------------
Ben Skeggs (2):
      drm/nouveau/disp/gm200-: fix NV_PDISP_SOR_HDMI2_CTRL(n) selection
      drm/nouveau/kms/gt215-: fix race with audio driver runpm

 drivers/gpu/drm/nouveau/dispnv50/disp.c              | 4 +++-
 drivers/gpu/drm/nouveau/nouveau_encoder.h            | 1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigm200.c | 4 ++--
 3 files changed, 6 insertions(+), 3 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
