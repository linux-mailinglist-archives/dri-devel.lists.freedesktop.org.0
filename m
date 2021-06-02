Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F473983C5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 10:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541C06EB74;
	Wed,  2 Jun 2021 08:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D8B6EB74
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 08:02:28 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 jz2-20020a17090b14c2b0290162cf0b5a35so2972679pjb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 01:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=02lHhfAhDq/BBAvi74B9e064tWGyy9vbCO1eroU+qno=;
 b=u1ryXFkSvsAEYZ+uPIFhIuVePkCzK4HehzqpdC8Am7BJaL2NRh9dd3nf+LP84yrNjJ
 NAAOuESPsyd2JOuQLAd3ayAEwFD9FKCorwfKoOppIcTaalwONFEH3Rl12W0n/Izr0yvP
 9scM2jz5fuiagQv1RMDEMTKqrLzkrOyy4Z9EJ5alV+R83ZfzkqWQi7tiBRjj8VSqD1AL
 YEEpsmzacHB+1WU6VKjkISsDc2lPfhO3GrnwDQArvXgdxZrM9a+lN9/dC1+P9afew0or
 ubUQNM5Wy5VpBUg40daz+kEBDePJm6/x+3cXcP1hKsjQnKtCletrvGZP1IOG8zH1LN4o
 GdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=02lHhfAhDq/BBAvi74B9e064tWGyy9vbCO1eroU+qno=;
 b=PczmEoaSh4Khl1a46Q5WnTzbGGJYJK2Zr9PPmMKLL/XLfpLG8+GM5vCk9Pg4Z+5q0I
 IE0Tfr4G9KjWhNGZVyYt5q+6rVZTKEpKVbaQfRZuYSJwFWOed2lX/zrAekXNklZP/KUa
 IsyTVBsza/I7+6STc5ODvFIPTH5z9pWZxOR96BfuYHw7YRdO0b/PZpTr2NKBZGYhBOHy
 FWiVk5v+yltGjFDclMCIltFesiAz6aEhWucfkRf9zxzWq37UgEZ/Qpw5ICZQ1pqd93X8
 XXi9F1f8/AdqNL6Pej6ejrKRzJxnFpV925Higl2GjFpx25YnDCJ+K/7EuzfWeBp8ZeLG
 N1kw==
X-Gm-Message-State: AOAM531lICf0UsS0AYZTQ0itJMEc0eVoQC9AtZ1fwFMD9CmFPMbANoLs
 TOOhLqnjiTrNZ2YHa0K/N8k=
X-Google-Smtp-Source: ABdhPJwZj521mEUfCJQhdlbkixXBugXjsDZMrppxRTIFdGees+XZ69j8CuVFihztyyqUBF4Il/siOA==
X-Received: by 2002:a17:90b:4b04:: with SMTP id
 lx4mr4355874pjb.54.1622620947943; 
 Wed, 02 Jun 2021 01:02:27 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9005:8001:2df9:2568:9194:5f9])
 by smtp.gmail.com with ESMTPSA id
 h1sm15379903pfh.72.2021.06.02.01.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 01:02:27 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/rockchip: defined struct rockchip_dp_dt_ids[] under
 CONFIG_OF
Date: Wed,  2 Jun 2021 13:32:12 +0530
Message-Id: <20210602080212.4992-1-jrdr.linux@gmail.com>
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

Kernel test robot throws below warning when CONFIG_OF
is not set.

>> drivers/gpu/drm/rockchip/analogix_dp-rockchip.c:457:34:
warning: unused variable 'rockchip_dp_dt_ids' [-Wunused-const-variable]
   static const struct of_device_id rockchip_dp_dt_ids[] = {

Fixed it by defining rockchip_dp_dt_ids[] under CONFIG_OF.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index ade2327a10e2..9b79ebaeae97 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -454,12 +454,14 @@ static const struct rockchip_dp_chip_data rk3288_dp = {
 	.chip_type = RK3288_DP,
 };
 
+#ifdef CONFIG_OF
 static const struct of_device_id rockchip_dp_dt_ids[] = {
 	{.compatible = "rockchip,rk3288-dp", .data = &rk3288_dp },
 	{.compatible = "rockchip,rk3399-edp", .data = &rk3399_edp },
 	{}
 };
 MODULE_DEVICE_TABLE(of, rockchip_dp_dt_ids);
+#endif
 
 struct platform_driver rockchip_dp_driver = {
 	.probe = rockchip_dp_probe,
-- 
2.25.1

