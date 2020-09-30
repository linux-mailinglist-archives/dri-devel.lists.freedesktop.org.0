Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAE927FB3C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87F76E85E;
	Thu,  1 Oct 2020 08:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248806E0AB
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 11:53:33 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g4so1469607wrs.5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 04:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3zdVvKUiJ3XeC/vkqQQH/4KWS4wblWtvBCpqUTc2vCY=;
 b=TCiL/Ow2l394SQAIf9E+NXOjWbI+WiUZG7czSxAutmvCNiJtnVGmyAKFcrIxA3P6TG
 iem9fGPWkXCjpFIzTsrLgfR626HY6Dh7O/ew2TTQLIy2ZNIHCeNp9b7Wl+HJk1EWv1Gj
 vqmTiip3ypcHhHa8hHcZCjbold9Ay6FWuC+t710keQKAnwnO7wWEs1lWQMUfMxNLsT/Z
 4mqvNWl0iEMvmKTsL/IRlRGh3Vl5KqJVxNjhMsOf2+m8p6v6ks5w4zXOyQaTezHxih6U
 Tgca1XosUIDPyHpReL6b1b1BJyH95NW2xkoyok6wGBC3xiSwPzTDPZH8AQSERNh9bCe2
 Gj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3zdVvKUiJ3XeC/vkqQQH/4KWS4wblWtvBCpqUTc2vCY=;
 b=O/IxPmtVvosJRuhkUq8dLG/hxINO+vJf4kH2VYzPmCeQxSWSh8vRjGyoKfrNgyslG8
 PTCw6iTq1JZDr7mtCKWUAAxwEkazWJiKw1vu9IztTjwSN+GOJqPt4sEYuKIr4ANd5Oif
 6bZ5xxGA4nTl1wI0ydeUOaENuvqzJqYPh+isFOVaVOI+7eDAtKYjsJX+JlYgAQvNxyrl
 WTi6dbU3dNjTLayS0MEvEJINiSzHCm9tCrCnqdOuqeH6RVv/GMja4vMwSlF9OVRAYw/u
 YVrkUJQCZO+EA6lIYAze9YNVomLgsoCULZUMAtcRjj/MtPvErM2jyzxCZsgyTrQZQ29X
 N2MA==
X-Gm-Message-State: AOAM531IBBaF3eKjqg5SJcjcFL0/qTIB/kWNbeRPvcOjSwrqJ2tAqcXP
 MlOiCklajIVV9gmNh43NQi34Tw==
X-Google-Smtp-Source: ABdhPJynAyzrltVOO76tuR2J6MDfUIbi/vTOpYZLQJ7fsMqXMDV/uBFWBXb2toRs7bpZsX3qQln9GA==
X-Received: by 2002:a5d:554c:: with SMTP id g12mr2743183wrw.294.1601466811718; 
 Wed, 30 Sep 2020 04:53:31 -0700 (PDT)
Received: from alex-xps13.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s12sm2222353wmd.20.2020.09.30.04.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 04:53:30 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: linux-remoteproc@vger.kernel.org
Subject: [RFC PATCH 0/4] Add a RPMsg driver to support AI Processing Unit (APU)
Date: Wed, 30 Sep 2020 13:53:46 +0200
Message-Id: <20200930115350.5272-1-abailon@baylibre.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:15:43 +0000
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
Cc: ohad@wizery.com, gpain@baylibre.com, stephane.leprovost@mediatek.com,
 jstephan@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 mturquette@baylibre.com, Alexandre Bailon <abailon@baylibre.com>,
 bjorn.andersson@linaro.org, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds a RPMsg driver that implements communication between the CPU and an
APU.
This uses VirtIO buffer to exchange messages but for sharing data, this uses
a dmabuf, mapped to be shared between CPU (userspace) and APU.
The driver is relatively generic, and should work with any SoC implementing
hardware accelerator for AI if they use support remoteproc and VirtIO.

For the people interested by the firmware or userspace library,
the sources are available here:
https://github.com/BayLibre/open-amp/tree/v2020.01-mtk/apps/examples/apu

Alexandre Bailon (3):
  Add a RPMSG driver for the APU in the mt8183
  rpmsg: apu_rpmsg: update the way to store IOMMU mapping
  rpmsg: apu_rpmsg: Add an IOCTL to request IOMMU mapping

Julien STEPHAN (1):
  rpmsg: apu_rpmsg: Add support for async apu request

 drivers/rpmsg/Kconfig          |   9 +
 drivers/rpmsg/Makefile         |   1 +
 drivers/rpmsg/apu_rpmsg.c      | 752 +++++++++++++++++++++++++++++++++
 drivers/rpmsg/apu_rpmsg.h      |  52 +++
 include/uapi/linux/apu_rpmsg.h |  47 +++
 5 files changed, 861 insertions(+)
 create mode 100644 drivers/rpmsg/apu_rpmsg.c
 create mode 100644 drivers/rpmsg/apu_rpmsg.h
 create mode 100644 include/uapi/linux/apu_rpmsg.h

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
