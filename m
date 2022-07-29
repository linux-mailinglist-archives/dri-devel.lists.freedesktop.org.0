Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9795A585436
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 19:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE28A10E4F7;
	Fri, 29 Jul 2022 17:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C688210E301;
 Fri, 29 Jul 2022 17:07:16 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id 17so5199705pfy.0;
 Fri, 29 Jul 2022 10:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=xOX9chVYPROOGAwdmaGgZcPW07GxLyOUqTmIVsiyRrY=;
 b=MRLwlAUouciI2C7C4GlFSSMaiCgUFvFJHEtdHFSFik2hSiv0VP8gL4ZSfprY2hsTK1
 71DIYxBGrwqXFBScOnqP+VzlVWE/yF7/4yB3mDGe+vThJBq8uPvmws21UEmirDlolpMy
 x549Jju9p8IU2GkZyiWgwKVdtIHXMUNPMhzRBu+dYou1+wt+08d0lBPCrTdJXwzkiDN6
 JGHGbeMh9SUdLwzzK3x2hd2GyvGvJjuGYxepwaCRt1WmmePQgRRw+KTKKuRl+7PDrYbw
 HFD4qHEQTMrxQPUwhb11Op/lv6vtakCbR4692upCeChRxW01QL5PORt1xeQ8tBNUL24N
 4sXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=xOX9chVYPROOGAwdmaGgZcPW07GxLyOUqTmIVsiyRrY=;
 b=2jl8qqxYuvwaQiJpa2de6Qi2Rw/dYnXNfJ2Mhwkbb+3Z5T9yglvygnZwmYUzr+WJC4
 IIv8zu9pWUAZ6iXBPMVJgmQkKDaElGfMMrnJvffd5f6fRh1aSH7xqr0Wth6TLZq5l4va
 mlnKVObpUU0AQvlsr4c4t8pP21W2EBdlpuJuf8zYVP3rmqb4TKu23ZVpwau3ESh4ocfU
 4YCl+MhGVXKM5jAEh9ovMpNLfvOpiP/bI9AOStl28wlu55bCrhclDwAC7HkKTgek1PXm
 sjpLIpV+telFnjMamH+TplETNzDnDbUMrObNiU9cMI0hyDRTMjv1nfw922cL8X84h3Zh
 GG+g==
X-Gm-Message-State: AJIora/DE6ODjDl80S6wlXxbgFXUjwmOaQrh+n1thX194KABDSdLYf5F
 iuArHqo6GAgnQRab5AhIIzPIQll6pJg=
X-Google-Smtp-Source: AGRyM1uGBuQ9vqrdjA1iXWiRUZ+wtLiHx4OPCFlykBcsRNNxwJRC70pXFBsgRPqQ7gjXtfmlRSztjQ==
X-Received: by 2002:a63:4546:0:b0:41a:5e8f:508a with SMTP id
 u6-20020a634546000000b0041a5e8f508amr3767050pgk.419.1659114435380; 
 Fri, 29 Jul 2022 10:07:15 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 bg1-20020a056a02010100b00419a6f3c8f5sm2778376pgb.19.2022.07.29.10.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 10:07:14 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] dma-buf: map-info support
Date: Fri, 29 Jul 2022 10:07:39 -0700
Message-Id: <20220729170744.1301044-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

See 1/3 for motivation.

Rob Clark (3):
  dma-buf: Add ioctl to query mmap info
  drm/prime: Wire up mmap_info support
  drm/msm/prime: Add mmap_info support

 drivers/dma-buf/dma-buf.c           | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/drm_prime.c         | 12 ++++++++++++
 drivers/gpu/drm/msm/msm_drv.c       |  1 +
 drivers/gpu/drm/msm/msm_drv.h       |  1 +
 drivers/gpu/drm/msm/msm_gem_prime.c | 11 +++++++++++
 include/drm/drm_drv.h               |  7 +++++++
 include/linux/dma-buf.h             |  7 +++++++
 include/uapi/linux/dma-buf.h        | 28 ++++++++++++++++++++++++++++
 8 files changed, 93 insertions(+)

-- 
2.36.1

