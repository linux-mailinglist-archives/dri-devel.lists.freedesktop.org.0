Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3CD54B2D1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 16:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D50A11243B;
	Tue, 14 Jun 2022 14:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394DD1123A5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 14:13:43 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so11903194pjm.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 07:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id;
 bh=ANOowJ5ARtAcljDH6UUEi0ItbiiRCNHVn+O1+7Vhyfw=;
 b=K6VAErCInuHbNCxmIHVTflFX7zxN8ilYfUa2exM1M+cyx7rBvDKyhW8j4OqZwmzSZk
 gcx6nnLTVIPnpOB6xKwnVhf/aEdnzwLf+dCde737elSVBJhvlUdx/PBdwxS6YeRKCaq4
 cw4RefBfytSwXD7sBmK8h2KQcBqLGKzq8eKrKELszYnSJ49uT53rClKH6jZxHgftj97w
 qrcAXTOGSyD9pCMLxGPVIdygX8mPcTcef0v2J4ZUJFvhkj2/+W5ESr/SfCIk7G798oiH
 1We4sO4ghE7nLGOwuAlK4pAn7zgvmaA/faf7LvWRN3ZvLKlj7j75cTAvGaDpKPrGZUUF
 iuag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=ANOowJ5ARtAcljDH6UUEi0ItbiiRCNHVn+O1+7Vhyfw=;
 b=HaAmKxRBMeoDlixfnsfKbgB2/Y5O0Lx0gaxLlFEbmunysA6/7RVMiu9bfWWAOsM5K6
 1KVKclfozCkR6BVTLXFdzzLfLL/QXCYufb8C1TpjNLxg+VYU3qzE+kGSiltUrl8KBcus
 VlC9yG6UAjk24cSmyh5SUwF/KxreIgWHnGWGrndI3CJRD3lDwCRN0XokuociJD3etLPN
 FCM/WH2QXV7sfY22ser4wKADrHfQ8dUOGcocEfVuDdzlT5BPEb4uX1ygcF8cDjIJHbsH
 2bBmKzzOoTN5jaFjoEU7d5kPXlwF1xDDdRD4T2m3hkj7DydKu+Us2o4d6k3taI9M/HQy
 Qc/w==
X-Gm-Message-State: AJIora/xJ7f5RiZ4Dial5WGZ5B7aX8wk1oi/36brwNTd4FkeX+S3pT4K
 5/uKlmZCQweuyXmz53pFw5Q=
X-Google-Smtp-Source: AGRyM1tjIvfmuMHaS07fxgbOS276UaMZCjk0+Johh6lVHiVKpXd1OLucB2eHGdLNFeJgF9JW6ZinKw==
X-Received: by 2002:a17:902:d547:b0:168:ec21:2e5a with SMTP id
 z7-20020a170902d54700b00168ec212e5amr3727491plf.58.1655216022708; 
 Tue, 14 Jun 2022 07:13:42 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a170902e8d500b00163d8d9aefcsm7294762plg.80.2022.06.14.07.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 07:13:41 -0700 (PDT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel.vetter@ffwll.ch
Subject: [GIT PULL] exynos-drm-fixes
Date: Tue, 14 Jun 2022 23:13:36 +0900
Message-Id: <20220614141336.88614-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

   Just two regression fixups.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3:

  Linux 5.19-rc2 (2022-06-12 16:11:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-v5.19-rc3

for you to fetch changes up to 7d787184a18f0f84e996de8ff007e4395c1978ea:

  drm/exynos: mic: Rework initialization (2022-06-14 22:32:16 +0900)

----------------------------------------------------------------
two regression fixups
- Check a null pointer instead of IS_ERR().
- Rework initialization code of Exynos MIC driver.

----------------------------------------------------------------
Dan Carpenter (1):
      drm/exynos: fix IS_ERR() vs NULL check in probe

Marek Szyprowski (1):
      drm/exynos: mic: Rework initialization

 drivers/gpu/drm/exynos/exynos_drm_drv.c |  6 ++---
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 42 ++++++++++-----------------------
 2 files changed, 15 insertions(+), 33 deletions(-)
