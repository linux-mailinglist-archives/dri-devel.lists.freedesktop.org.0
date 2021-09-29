Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2152041CF39
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 00:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA776E247;
	Wed, 29 Sep 2021 22:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7C56E247
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 22:28:40 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id x27so17088032lfu.5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 15:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s5sTdJ8JKqsgJbxnEz9RKpMDTn4k9mcAGcN+lDKvBZ4=;
 b=NxBEz55jmzV1nXguvJUvMdN756MI83400cnyZN072rHeHNO2dvXY17+XOAwAW1f650
 IRpdbmJqjuLjTbUOr53d5VWR81T6UKGuF7G9VwnQ+Tq+fgwHuvpa1ujuHDicCyZgDMZU
 syQ3W5+rDhHSJ8KX+e6G3iltSJRQcBvRlUKNgo3Qf2DW4VECkBxNL+xmJjIP1KBiOofF
 DtI3UH6FPSzBxHnxHSpjgXrjRTid5VqIL/7Im2ji9fPTCC6lrd93tyEz24aqWff5Dxre
 qwZoH/1JcrvlqKTMPOMDmKpmeH8iY3Oc3oG6zIBatvHgpdwGBiNph71V/GCRC0V3OX/8
 zPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s5sTdJ8JKqsgJbxnEz9RKpMDTn4k9mcAGcN+lDKvBZ4=;
 b=0v80TJxt5rGbOD0uqi5bJZQo8skYoSRZk6+1CEGxSx8JlBjJqyW8+bI9fOWvW4yLtm
 Gqb79yi7xl0YicquqC1g2te0WQTg6gGHpL1R89M20co/H9qlX8WTYYvmXFBynahCRr7u
 CfT7ULzEuJfPspmu9XAHeAEpArp+eBYENk0CPv9oTLuMHX5c5BH0RJfWkuD0VJKh4dvl
 h9f4Jw8ucPjcIHPJVyEW9mdoLb6j3VbqEe7Nm5ioAi+T+v6auSTP5WTLYQThpajJ/TGz
 LKL9ZBEphBYcxF4GLMezuVzAMNymjJLiqzAW9tGZYHkeCapYdAIJ8P6kPaj5ztkV7nER
 zz4Q==
X-Gm-Message-State: AOAM533i5dQrt+jYTZ2vkX7G4iXEMh3SW4rj2VXwN0L314uPRl7A9Aze
 dABZOQGmXOnQvGEEhuAVvug=
X-Google-Smtp-Source: ABdhPJw+yaInYJQjq0bNQMNlQqDMSXq2759kVCyrXVuaJndz8EeuhODulDCQ/QNDGACqK7rdNkFHHQ==
X-Received: by 2002:a2e:9d88:: with SMTP id c8mr2439901ljj.189.1632954518583; 
 Wed, 29 Sep 2021 15:28:38 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru.
 [46.138.80.108])
 by smtp.gmail.com with ESMTPSA id br40sm137782lfb.64.2021.09.29.15.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 15:28:38 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/2] NVIDIA Tegra display driver improvements
Date: Thu, 30 Sep 2021 01:28:03 +0300
Message-Id: <20210929222805.16511-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Asus Transformer TF700T tablet requires couple minor changes to the
display driver in order to light up display panel, here they are.

Dmitry Osipenko (2):
  drm/tegra: dc: rgb: Move PCLK shifter programming to CRTC
  drm/tegra: dc: rgb: Allow changing PLLD rate on Tegra30+

 drivers/gpu/drm/tegra/dc.c  | 33 ++++++++++++++++-------
 drivers/gpu/drm/tegra/dc.h  |  1 +
 drivers/gpu/drm/tegra/rgb.c | 53 ++++++++++++++++++++++++++++++++-----
 3 files changed, 71 insertions(+), 16 deletions(-)

-- 
2.32.0

