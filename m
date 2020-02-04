Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC0A151BBC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 14:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8346EF28;
	Tue,  4 Feb 2020 13:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E286EF28
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 13:59:34 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w12so12265176wrt.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2020 05:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xo1vD3bli406eUVIXbkQ0Zqxke8qKNMVbFU2u7O6vqk=;
 b=g3wd6YoEdjx+1f/jDqUF+fmNAN+7pQJT9H3uOU7aAc1X/QaBA/HKHmhzHv6I7AlaVo
 TiCQLQGe/HN2oOoOucyfSJCveHCISRGj2WKK2UjvGgKCe4CzJy2WqAsYsP99E8a5lEry
 a84D0McZP0f6hEKFIv5niXFxgfJz26u8uJVaNHg26iydajMIqxvK+K04I7hRsLJ0qIcD
 38gk4HwAcEk09zdF6G7Gtf3DWllj4bAEEGz2SblRuxGb0xeaXP8DTVSzBi6mMdfKxBWk
 FFJm5hFVB5Amtx+xPwJPw95ySEceqJiBDB6I7VYdbfZ7S5q3wJDbFanJophfryMmoX2O
 fsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xo1vD3bli406eUVIXbkQ0Zqxke8qKNMVbFU2u7O6vqk=;
 b=AunzCVdRIWNQd4OJiYTWj1DStyVSb56tu7+PaRcr7n1IV0zzKdw72ieF2vb2bfDP3P
 +avHqcG/6DEuXMjh9gbPC3T2ZHIo88X3T7v6ytV30Ce3hL86VSMWQjEQ8anDzHKkC8MP
 Bbj1pLNutwe7l49R8cxa6+hWvVs8pcOVxm3eusA8thYUZZ9WOFlOupdSPsd9pkDHM3Cs
 Jn2N948h5SQIvkYEbKneVPV7rfmWubvkAx2tTswZsJuF6lfMIJ2FiC0fp/1S+4/MHi/2
 4By4mgu/2i3ST/MXcm92pyoH4BJwvzXd9kUjrIUeWv15dbNFCYzYp3lq1v46AYrkPFVn
 F7PA==
X-Gm-Message-State: APjAAAVNC55fhF4rHxFHntZRmqG4TrC/SYjFJGiU/MEfg1Gsg0KJ7KVQ
 i24FXpU8r9F2eb/3NeUDd8E=
X-Google-Smtp-Source: APXvYqzjfJsFs9scrTrfr6ES22T61+rUZj6CciAgIfYGpGmGcd5Dv9OkXlKme4iqb7T69j36fu3tAQ==
X-Received: by 2002:adf:82ce:: with SMTP id 72mr22306786wrc.14.1580824773351; 
 Tue, 04 Feb 2020 05:59:33 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
 by smtp.gmail.com with ESMTPSA id q3sm3753081wmj.38.2020.02.04.05.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 05:59:32 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 0/3] drm/tegra: A couple of fixes for v5.6-rc1
Date: Tue,  4 Feb 2020 14:59:23 +0100
Message-Id: <20200204135926.1156340-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Hi,

this contains a couple of fixes for a DMA API performance regression
that was introduced in v5.5 for older Tegra devices. Patches 1 and 2
will likely have to be backported to v5.5.

Thierry

Thierry Reding (3):
  drm/tegra: Relax IOMMU usage criteria on old Tegra
  drm/tegra: Reuse IOVA mapping where possible
  gpu: host1x: Set DMA direction only for DMA-mapped buffer objects

 drivers/gpu/drm/tegra/drm.c   | 49 +++++++++++++++++++++++------------
 drivers/gpu/drm/tegra/gem.c   | 10 ++++++-
 drivers/gpu/drm/tegra/plane.c | 44 +++++++++++++++++--------------
 drivers/gpu/host1x/job.c      | 34 +++++++++++++++++++++---
 4 files changed, 96 insertions(+), 41 deletions(-)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
