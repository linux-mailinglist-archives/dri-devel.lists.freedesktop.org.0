Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C0289D108
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 05:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07D110EC46;
	Tue,  9 Apr 2024 03:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N+P8Qc+W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBC310EC46
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 03:29:54 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a519eae91d1so472939166b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 20:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712633392; x=1713238192; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=joAq2N38aoIlqm7xfkJJG+CXn5j7wZMMcXjDfZYpbSM=;
 b=N+P8Qc+WDqXFug2pmQyzkOIpaKzNCfqLCP2hacPxpJwkkrRU4gWTUGNK3RXojrCgLj
 eK1YXuhehrIaMbjlYzujihIWucY2YPoo6+JIzNu0bM0E+CkhaJzW6tQGeCoH0GK2POka
 s+Mw5icRh/MUvyj2wvdLl5CJk/dhKjKHdPE86pf7cNDRTtIQaDxxGZekYzwPtjb1djF0
 /1J4oJkn7qCyWUwkvKLADiEN5XIDs3fNSPilBMbftgCMFKFKHWxxLBEMJPdKXx10fbmj
 DEsTHAOesWXjuf//NmfWBrTZyaA+qXlDSI5XL1eA8U54mQSXmXJeRkgttRQ28qd1pW+E
 03oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712633392; x=1713238192;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=joAq2N38aoIlqm7xfkJJG+CXn5j7wZMMcXjDfZYpbSM=;
 b=mB0sa237CaGLuVPoU1L/CDb0hDCUomZs46wDSEQkBt9pQFUl33UCUBw6cNgmnmGwl0
 GSlveDt4KG61wEWWvZZsN+yVQ59txsqt11AjI6hwpjNsAA0dqs4hkBd/FWYNAGAU/+8m
 uZSaPMwyh7yF5fGVkNK+CwQFsCGIbsjaksvsR2/rF2Yk8n72Q+a5QNQtYgy5jjk3nnG6
 4TAeylgWmMTjJMpKmqoyNLxyLWby2ye80Pden1jv2WrQMIJIsQDrd8nSqcSlB/HsA6Cs
 QZbMOlvXmR7w/WBqyYxuWC4M3bShN9IEzRFhyTyiT0VPqxz4CVjz9YPUK3Luy2CYfVRO
 NZxw==
X-Gm-Message-State: AOJu0YyD2C6Jlap3u2Z0b86pByGdfCN1fNEFXDPO27fiB+9As6nuD03f
 76qK7EfBgX57MWdvgP4CoxeOQD8Zsm022F38teeOJ4NQGeF1Bc9iRoE4LjjMik4MPWu9sLTgR5T
 vaiIU3FSR5eSIHBBuFj/Yumye7YqlvmCbMxE=
X-Google-Smtp-Source: AGHT+IHs0JV1E8bUqajO4WPrFcRBHm2Q4MG0qurmd1AQ/SfbgRh3WnV8UCY6D4Xu3I+qlbzQShgOyUlamumtqo5ihbc=
X-Received: by 2002:a17:907:1b17:b0:a51:da29:6f67 with SMTP id
 mp23-20020a1709071b1700b00a51da296f67mr2907187ejc.20.1712633392237; Mon, 08
 Apr 2024 20:29:52 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 9 Apr 2024 13:29:41 +1000
Message-ID: <CAPM=9tysq6sxv-HRUf4+AoAoC0YA_s0tUz6ujms0FcxrgtOUdQ@mail.gmail.com>
Subject: [git pull] drm urgent fix for 6.9-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

Hi Linus,

A previous fix to nouveau devinit on the GSP paths fixed the Turing
but broke Ampere, I did some more digging and found the proper fix.
Sending it early as I want to make sure it makes the next 6.8 stable
kernels to fix the regression.

Regular fixes will be at end of week as usual.

Thanks,
Dave.

drm-fixes-2024-04-09:
drm nouveau fix for 6.9-rc4

nouveau:
- regression fix for GSP display enable.
The following changes since commit fec50db7033ea478773b159e0e2efb135270e3b7:

  Linux 6.9-rc3 (2024-04-07 13:22:46 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-04-09

for you to fetch changes up to 718c4fb221dbeff9072810841b949413c5ffc345:

  nouveau: fix devinit paths to only handle display on GSP.
(2024-04-09 13:14:13 +1000)

----------------------------------------------------------------
drm nouveau fix for 6.9-rc4

nouveau:
- regression fix for GSP display enable.

----------------------------------------------------------------
Dave Airlie (1):
      nouveau: fix devinit paths to only handle display on GSP.

 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c | 12 ++++++++----
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c  |  1 +
 2 files changed, 9 insertions(+), 4 deletions(-)
