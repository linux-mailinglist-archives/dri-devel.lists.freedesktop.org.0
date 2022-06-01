Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F01A53A1AA
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 12:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B8310E1A2;
	Wed,  1 Jun 2022 10:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2D610E1A2
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 10:03:40 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id r129so672268wmr.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 03:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fDESduiqeDUdczoJ6Fv4btIu6tiSoUo0J3rQKZ/xYis=;
 b=T6oTt7BEdJaAcew2vNrT8re+CQk0A5bt+/rhexe3HE9dNR/NgMZnKKxZK9L58bcihk
 U/hWeND0gykKQhflEguBdI4c9B2GMbHYZ3sESMZPKT/99KB+5UUREHB+RhH9G0SBnjYH
 KFWmyj2bStU0GcDsLsBTzKFSIrXGT0g59scazBhSaUmGIhYcXriDIbw4jxkVZIEwLoxA
 xpNUgZrL7AVY0sD2nIOa4pu7D/qc+xZqP8zOPExeYUxHraIn7+YqZmveDcb6+0qZDoF+
 s9WCBfG0Qtbw1rRAWQemZLxhHqxGcPpznO4Olbyz1+p293Kg7Xnjw73/Z3JjgrHALq6t
 lnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fDESduiqeDUdczoJ6Fv4btIu6tiSoUo0J3rQKZ/xYis=;
 b=EU/TEiaTIWLCisrrRdXsdEt9oCoy7w9AHzGqGWl++HK+a454O8YJQDLdPvSPGSYJUe
 ayex48zIkXktp0lOVYnSd+F+c53uyC5jppnKcTWWxhENbLMusWewirVgtHJpH1Q4fvLs
 no8cI5D7XS5Ii8PofhS0dz6zIwFut3zpbxVJ1v/okx3lm5EeuFH3ty6a+ISMjQovrwyz
 h4P4auUotIAXpjxRPXph1NONusnaCWGnaM4RplxaMd+WnR4ivQyuIJ6gEJkBlSfAfdBD
 kix/yi6PKcFCUz7tHBsm598udjkpXjyuMExNES8SH7TrAxfC7USxzP6dbugTzx0iuhVr
 PewA==
X-Gm-Message-State: AOAM530Y8W/muxb6P1tGUYwQw8OTdwvZw7XwVyU8soA8C+mOnhmpu/nj
 9fSAQijbIy3u+Gih1soIhcY=
X-Google-Smtp-Source: ABdhPJw6JdSDeKJqxdfa0rmKW4BlLHfkEJjPchGzUVGCCSNxDOG8c2PaUjb+3Nr2MUNurvvVI5PWKw==
X-Received: by 2002:a05:600c:384c:b0:398:e5d2:bfc9 with SMTP id
 s12-20020a05600c384c00b00398e5d2bfc9mr19734446wmr.180.1654077818694; 
 Wed, 01 Jun 2022 03:03:38 -0700 (PDT)
Received: from localhost ([62.96.65.119]) by smtp.gmail.com with ESMTPSA id
 k12-20020adfd84c000000b0021126891b05sm863013wrl.61.2022.06.01.03.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 03:03:36 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL] drm/tegra: Preparatory work for v5.19
Date: Wed,  1 Jun 2022 12:03:35 +0200
Message-Id: <20220601100335.3841301-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

The following changes since commit cb7e1abc2c73633e1eefa168ab2dad6e838899c9:

  drm/tegra: gem: Do not try to dereference ERR_PTR() (2022-05-06 15:52:49 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-5.19-prep-work

for you to fetch changes up to 597b89d30b42dcc8e6b262e6876b42dde66f97f0:

  gpu: host1x: Add context bus (2022-06-01 11:50:42 +0200)

I realize that this is quite late, but as mentioned in the tag
description, this doesn't actually add anything new and is only
to simplify dependency handling for a new feature that we have
planned for v5.20, so it'd be great if we can still get this
in.

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Preparatory work for v5.19

This contains a single patch from a series that's ready to go for v5.10
but is also a shared build-time dependency for an IOMMU series that is
planned for v5.20. The idea is to take this into v5.19 to fulfill that
dependency and remove the need for close coordination for the two
series.

----------------------------------------------------------------
Mikko Perttunen (1):
      gpu: host1x: Add context bus

 drivers/gpu/Makefile               |  3 +--
 drivers/gpu/host1x/Kconfig         |  5 +++++
 drivers/gpu/host1x/Makefile        |  1 +
 drivers/gpu/host1x/context_bus.c   | 31 +++++++++++++++++++++++++++++++
 include/linux/host1x_context_bus.h | 15 +++++++++++++++
 5 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/host1x/context_bus.c
 create mode 100644 include/linux/host1x_context_bus.h
