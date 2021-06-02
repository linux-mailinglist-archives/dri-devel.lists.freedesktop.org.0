Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A20398506
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 11:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF916EC12;
	Wed,  2 Jun 2021 09:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561D16EC12
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 09:13:44 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id q25so1683061pfh.7
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 02:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sRa/SCLvjxclceznxdFj3+fej72AkhZROM61oD4qmtY=;
 b=PadHvrgXfsF8NWcRseL9ndsK0SRDFHvq0J/1AMXGNoo+jdHj8ecNl05GYTtB9gcCsf
 iNzuowUlrzCHtWiOLSoDBfqYgiVe4uU0h5IDeB5+B0WMSCrVMie24Z9Izk7qe1T1f2th
 DRRlzyJyZziM9RYXYOLSeGitJSIcP0r/5Mgz3htnRHKalG5Q1wR0Vl43G2N1pEK+sJRy
 Kr37L33/rdJyF2nJ6xGS7rngukMiR+ozULYXoxFewWgVUgwqkV2uYDHv5uyrHyuMwxzw
 yFw3vYnJLzO1hq1yeLXmdUhbYW6m63O5HUVUQzUOsKZ10LwMPgLpCtixZyUDLq6fQOYz
 oV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sRa/SCLvjxclceznxdFj3+fej72AkhZROM61oD4qmtY=;
 b=R7kdWA94MZLBDM6dVm9HCk4EL1I+Y0BBnfP2XbKnmRjMAU67fI7wbBbu8yCN5QKqgy
 lF8dnOtdQgx2ykOFBW2j0f9VP2rV53acolfDSw6Q50srvHWMQmS28dvL3q6+ZJEXqwfj
 gj/DRtW1NVBMOXEnXJYzC3qdEkpjfXk8RM7KXiIhX1N33nt2/o1FtaDye/YKVvyLbtwR
 NzqWBVrcWMDYsKA+yfKlDSeizjKk+bIkyN4MuhrXkFhVdCTEBSXyxSQ+yUuoUde0OO1i
 3CofC0c1DoZRtOHvStMT/cazi+1ZVsQ2CfCSmquusqDGCMIxjBEREAwEnojy8mWQn6TE
 1k2A==
X-Gm-Message-State: AOAM531nyTlxcq6pduMJ8yXMfzZ1ZBqVKV4ZTzFow1FDKxMjhmF24Fhi
 BJhrDscTqZsp9juEAtolkaJ+dYyj8tyhwQ==
X-Google-Smtp-Source: ABdhPJwTV3FKHHyx7tOoeqkV1rWY56OKsASLEP4SLRoWUowqvbbpSHctG+YB0L+ldtG6q+z9mDmYrg==
X-Received: by 2002:aa7:9581:0:b029:2ea:39e:2224 with SMTP id
 z1-20020aa795810000b02902ea039e2224mr6870691pfj.32.1622625223899; 
 Wed, 02 Jun 2021 02:13:43 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9005:8001:1fcc:40d0:d6f2:3e07])
 by smtp.gmail.com with ESMTPSA id o20sm2433387pjq.4.2021.06.02.02.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 02:13:43 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/rockchip: defined struct vop_driver_dt_match[] under
 CONFIG_OF
Date: Wed,  2 Jun 2021 14:43:24 +0530
Message-Id: <20210602091324.9440-1-jrdr.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Souptick Joarder <jrdr.linux@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kernel test robot throws warning when CONFIG_OF not set.

>> drivers/gpu/drm/rockchip/rockchip_vop_reg.c:1038:34:
warning: unused variable 'vop_driver_dt_match' [-Wunused-const-variable]
   static const struct of_device_id vop_driver_dt_match[] = {

Fixed it by defining vop_driver_dt_match[] under CONFIG_OF.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index ca7cc82125cb..2cdf889ca361 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -1069,6 +1069,7 @@ static const struct vop_data rk3328_vop = {
 	.win_size = ARRAY_SIZE(rk3328_vop_win_data),
 };
 
+#ifdef CONFIG_OF
 static const struct of_device_id vop_driver_dt_match[] = {
 	{ .compatible = "rockchip,rk3036-vop",
 	  .data = &rk3036_vop },
@@ -1099,6 +1100,7 @@ static const struct of_device_id vop_driver_dt_match[] = {
 	{},
 };
 MODULE_DEVICE_TABLE(of, vop_driver_dt_match);
+#endif
 
 static int vop_probe(struct platform_device *pdev)
 {
-- 
2.25.1

