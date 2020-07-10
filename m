Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0230921B058
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C838D6EB72;
	Fri, 10 Jul 2020 07:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E3E6EB71;
 Fri, 10 Jul 2020 07:41:48 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 17so4780383wmo.1;
 Fri, 10 Jul 2020 00:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yRzp0fkgzEo5tA9tK65ADA4d9spnntHWN3TuXkgZmws=;
 b=hnIxyl30UtrFXLZ6C2gE3jejOPSzk9VK2aMARHzcMFEZg7PxhTfGSvsUkq38Jmb3FF
 aL8YYBIb0MucB5wIMw9j7LnIxVIrZc1Nu+AEDxD/nYZaGcHZeVzLaUbqtjr+LUW0Uor0
 fG8uwhLNVZGW9T+v+d7kRCQSRP0tSwjELvSuV6bOHOrwuQ1f/VQs3tZ1im5omyHPK/Sk
 0yu+kQt9yJu6/BmfmqFOM8DW/ccPh8khhnvRtGxOkL4hGZLDGSJ0mp4YAzQ8J/59E6a7
 xh2rMZbBe96Iazd9dCQjjsH+M1/M3pKbuiN2GIPPz4qO5QS8bd/B9OKym0BcH/3vt4OZ
 OAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yRzp0fkgzEo5tA9tK65ADA4d9spnntHWN3TuXkgZmws=;
 b=NWlZER3lfdoRNszjE6sO6xgaUISyEDHCDRnjIctssnMWf8gJmD1of75PBAdkN6k6gK
 PKbGptZtTUcwIenmpyO2NwvSBNlLDEqoUIy3jiys59Fa74P8bCl16Tkbgv4UkQJSVSux
 28wUTQKKlQTz1P6shd4U9WUQMJMs3Y5HtI++yunIadlbu26f72G8cawQ5tBeQkm4TSbE
 N6Wzhz57fTdbUjtsggjQX7e11I8RJqCvSE94GcfvOr0a4qvR9rn3MlwcqPpKJ6MTCVkR
 C02dmQxv7xSkW/qoLfnT8g6yb6ieuUwu7eTWXl9yjqQOhJbPHueA89KKVPCJ8Ms4Dzyr
 vUJw==
X-Gm-Message-State: AOAM532bmriy+nQSAaZurY5eT9TmPG3SVWyAI5zP98kJUJrDEz0KUXjt
 IrcgEYR3xf6Fhe0/nsE+d2E=
X-Google-Smtp-Source: ABdhPJxjmu1t81pwJYQvJu6PXnZ1rTlbee7s/kcWW+nojDUMarVkTZhwOJtURe+jV8IEXIJSndJrqA==
X-Received: by 2002:a1c:48d7:: with SMTP id v206mr2150751wma.145.1594366907543; 
 Fri, 10 Jul 2020 00:41:47 -0700 (PDT)
Received: from localhost.localdomain ([62.178.82.229])
 by smtp.gmail.com with ESMTPSA id p17sm7951375wma.47.2020.07.10.00.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 00:41:46 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Add support for GPU load values
Date: Fri, 10 Jul 2020 09:41:23 +0200
Message-Id: <20200710074143.306787-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.26.2
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 cphealy@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series add support for loadavg values for GPU
sub-components. I am adding a SMA algorithm as I was not
really sure if EWMA would be a good fit for this use case.

Christian Gmeiner (4):
  drm/etnaviv: add simple moving average (SMA)
  drm/etnaviv: add loadavg accounting
  drm/etnaviv: show loadavg in debugfs
  drm/etnaviv: export loadavg via perfmon

 drivers/gpu/drm/etnaviv/etnaviv_drv.c     | 14 ++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c     | 44 ++++++++++++-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h     | 29 +++++++++
 drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 79 +++++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_sma.h     | 53 +++++++++++++++
 5 files changed, 218 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_sma.h

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
