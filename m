Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9F0552BAE
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 09:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C4A10FC63;
	Tue, 21 Jun 2022 07:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192DF10FC63;
 Tue, 21 Jun 2022 07:21:14 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id fu3so25522130ejc.7;
 Tue, 21 Jun 2022 00:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I49iaT9479MLDi3TYueSZinlKruIKCVXqSN6hfWZ6x4=;
 b=gpAE1+YcSfcBdfh7BwfrIoGbRZBggiIKzxdzevy+uY0mwZ38SqW5C24UGUW26VY4UQ
 WP1S+RpCG/FKyBZUka5u2+CPPXZJ3KWRf8OHVm/eGamVrfkx0pZ8k/r1dCJiI/Y9tWmz
 1oQm+ijCrgg6t5IQfVcRYcG0EZ0onOIYztGApiM1tQeP5guXwyXfw38Q2H/4ynJnW2mS
 3D4OkdRnQ+BJI/MKwgR+djuQCWPssy+Hrsm09S+yer0zBBwLofZ5OECr99J3AzlS+crQ
 9DHd3RGJuWdVl8yX4ILXR2mG3nU1o6BthJk/4T+xZCQa/Ujz8QiKP9A6AoGoZqirNj/t
 B4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I49iaT9479MLDi3TYueSZinlKruIKCVXqSN6hfWZ6x4=;
 b=fCfGF/qoBcBSYjOzbdiE+Ll5BYmw42vOjghRv9K8LD9jy5WXVgJ1xp4iKqme3b8lfS
 SN1HbPBV7h8Zt7eKHQMC+M14z9Wce8bgZyL8zJDS0m2F6sz+pIJQZt6BFAatRADIWdsD
 OtQgKzyjijaN37dywz3fhY/Yft7AeRHjC7GNoKbrSHApPCesBvoxY9Ta2ONw/ZGVqoIJ
 Ij2Xuheb9KI9QD2E4B1XojoMrpliNyG2Kb9/oh1RKctC7qBmT747nAA4jY7FFRz/Apzl
 5Z9zJ8WXHVfvqx9OC21mZXXZIaD5F3GG2LceBu0SZGooDbKw7KSpI0Tluj/oEJ47+7LT
 tjAg==
X-Gm-Message-State: AJIora+joOHYbtWTGrCJAWQ536132L3APFYAOllkEE1oQD+tiGCNtXQd
 /GJte2wLicIab2z9R8NlgDI=
X-Google-Smtp-Source: AGRyM1vduCB6Dl0uXtQ/uJ/zcFkNMY0AX9tE24LM9PyHr98TUnsUGHKRZg4/lze+IGydS4QD7MJIWw==
X-Received: by 2002:a17:906:6a28:b0:711:d032:caa4 with SMTP id
 qw40-20020a1709066a2800b00711d032caa4mr23990285ejc.80.1655796072583; 
 Tue, 21 Jun 2022 00:21:12 -0700 (PDT)
Received: from localhost.localdomain.info
 (62-178-82-229.cable.dynamic.surfer.at. [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a17090653c100b00722e771007fsm50711ejo.37.2022.06.21.00.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 00:21:11 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Add support for GPU load values
Date: Tue, 21 Jun 2022 09:20:46 +0200
Message-Id: <20220621072050.76229-1-christian.gmeiner@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP" <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series add support for loadavg values for GPU
sub-components. I am adding a SMA algorithm as I was not
really sure if EWMA would be a good fit for this use case.

Changes v2:
 - Addressed feedback from Lucas

Christian Gmeiner (4):
  drm/etnaviv: add simple moving average (SMA)
  drm/etnaviv: add loadavg accounting
  drm/etnaviv: show loadavg in debugfs
  drm/etnaviv: export loadavg via perfmon

 drivers/gpu/drm/etnaviv/etnaviv_drv.c     | 14 ++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c     | 76 +++++++++++++++++++++-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h     | 37 +++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 79 +++++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_sma.h     | 53 +++++++++++++++
 5 files changed, 257 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_sma.h

-- 
2.36.1

