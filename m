Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FB739E6D9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 20:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D156E9B5;
	Mon,  7 Jun 2021 18:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF4D6E9B5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 18:48:53 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id b12so3255819plg.11
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 11:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3yUHFhWCcq/kgRCGJHT5yo1C2JrDTMIOj65kvK76Gco=;
 b=TqQyJo8zyp5yld5/QbvhnU3CAEFB28B+nTFE0duD3TYzp9FeaHLWO0XG2vdFDua6mh
 BfHOFGJrWZ/Jrq3oAS6JuQ3a2RZv8NSw8a9J1LgWfy5RQj7ZsIz15Q7Exrlu/9NbQcih
 N5cIq18cmNsh2TuHr7CZSg87Z4an02b2IyzUva+1dDTRkqJ1U5Esmyj94ktjG88r3PaV
 hpTS8GvrNDtGvzyKtmKfbWauHXWdUpJ0znEGNUDxqf7QY5qle3TbaUGITegWQG9dGzj3
 AjilalI8QsQXQcPXQBlM72MtW+WBJkUUSEFLNtch9/vAmtoMIIriGJXJYPaeabazpJF8
 Rkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3yUHFhWCcq/kgRCGJHT5yo1C2JrDTMIOj65kvK76Gco=;
 b=QnFNrC7lSmVQ41QqAQMjwjjaRnGch+KNaI6oUOCXM6rMmm1a/ecSaIeLuJH4XJxIee
 TiVyZXIxVTYrtgktM3Ig08jGEf8iHMJYfckCzqqbIq9nujJZynZZjmK13oRvlXDJyOhd
 fAn2D1MkZhkmZV7vtSrU8oJsCKxUG7Suv5epmHGBcdJ0qVNalpiWn3mJ/JwYIovnCBod
 H7Uc15HqvwsG/QsXnU5oyL46ytLBTHkSUMAbBJKcH9iuiQXfRoNY8BIPW9yuUlaRv9yL
 3dKLSUvwuZygdZkVcDzJ1Mq+S2WdlXVo95m79jGbuidfWZuw89eMbFTeAVckiJ1yVsRb
 7roQ==
X-Gm-Message-State: AOAM5336+3Hmec9pXRVrDRVrfMmdYY3qRCo4RYYWoMU29d690KrT39yV
 kFan11pvbVfFm214FK2C4PA=
X-Google-Smtp-Source: ABdhPJwtDWvQmpvtg2U50J55aazoPkaU18pviaJHRPmbRx1Jb7DUydJLScDmTuvMgIlA72tNanFNAg==
X-Received: by 2002:a17:90a:9e5:: with SMTP id
 92mr22405507pjo.34.1623091733324; 
 Mon, 07 Jun 2021 11:48:53 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9005:8001:a09b:9c7c:331d:38fe])
 by smtp.gmail.com with ESMTPSA id a23sm8628028pff.43.2021.06.07.11.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 11:48:52 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2] drm/rockchip: remove of_match_ptr()
Date: Tue,  8 Jun 2021 00:18:36 +0530
Message-Id: <20210607184836.3502-1-jrdr.linux@gmail.com>
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
 Souptick Joarder <jrdr.linux@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kernel test robot throws below warning when CONFIG_OF
is not set.

>> drivers/gpu/drm/rockchip/analogix_dp-rockchip.c:457:34:
warning: unused variable 'rockchip_dp_dt_ids' [-Wunused-const-variable]
   static const struct of_device_id rockchip_dp_dt_ids[] = {

Fixed it by removing of_match_ptr().

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com> 
---
v2:
	Address review comment from Robin.
	updated change logs and subject line.

 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index ade2327a10e2..8abb5ac26807 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -467,6 +467,6 @@ struct platform_driver rockchip_dp_driver = {
 	.driver = {
 		   .name = "rockchip-dp",
 		   .pm = &rockchip_dp_pm_ops,
-		   .of_match_table = of_match_ptr(rockchip_dp_dt_ids),
+		   .of_match_table = rockchip_dp_dt_ids,
 	},
 };
-- 
2.25.1

