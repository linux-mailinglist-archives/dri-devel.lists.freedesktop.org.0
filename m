Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2F548513E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 11:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5B510E8EA;
	Wed,  5 Jan 2022 10:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E42010E8EA
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 10:41:20 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 c14-20020a17090a674e00b001b31e16749cso1838834pjm.4
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 02:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=TM0oLFqK3+UblxbHfTgaii4BcWivZsyv76psXuHkAdQ=;
 b=Wqv/xa7APOKvS+s3RtMpjui+rD9jasoB6tSE+FjVCW8X415sA8drSS/BncsVrgmxxd
 A+nZyiqcJ4kQB5rUfWk19i/MsMUH5qK4ye52bC6lPU//4UnrJOJjCpu29uJV7tF1FZ3n
 ZJOXdJERk87GXedAato/cC7FfmDZFb5pQ4KurmchfwIMd/tx7UeJPwd0HwXOX3Pfh0wl
 wU2Ykot+QW0ORHLfOHQ2/M3vatX4lPcEzyno4tPqwPwr0bsJ5YhvuvlzUWo96FnXQImh
 SGrmfKrEooeFhH4oV/NfyCoHpUHWGmPemW1x2mfb/PxpgUBzzFP9d9usXNuV388nU2a4
 sOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TM0oLFqK3+UblxbHfTgaii4BcWivZsyv76psXuHkAdQ=;
 b=4bl3Hy5oDc6a1MBAZHhW2WVtpoHmNEUrSWUM04UABG/Ftx3cxLuQxoxktIvAszfRBw
 +AYwZkCAPcxtVFDIDxizAhNzgQBBrgoBfLPVHUnnzlG4nyFdO88Zd7Tq3fScv3gYG/wC
 j8EBLW7qg7KHEgiAKLEOqJ5BsMtdvLCeboOq/WFeGk+BZNq1IwTD0zby6vKuDzQYRJ/o
 BCJIXIRcegUiA61taBR07zMa/tSZYnneGJnAwmQ3vs4qdRuBya3WGrztj5S3NBl8KC7t
 NUakgIl0yiRCZi69erQ6Opw3ysyVxbq1hi6y1JhL2RVj81uvzerHSRcjIPA3h7tqeE5j
 RCYQ==
X-Gm-Message-State: AOAM530tUcFc6Nfx8CbkdhB7dOrzXj/EFPh7EM1KBqzKlzYg+VHLb4fx
 As5Rl0IOgciPWkRVvsuJq9Y=
X-Google-Smtp-Source: ABdhPJyN+oiNrioaglDT7LRwLdlGJri9Di6VOmybaC+NlrIgziwYwB5nKvtevXHMnH142YAulUz+hg==
X-Received: by 2002:a17:902:d4c8:b0:149:c99e:dd83 with SMTP id
 o8-20020a170902d4c800b00149c99edd83mr3274694plg.146.1641379279705; 
 Wed, 05 Jan 2022 02:41:19 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id a17sm2254134pjs.23.2022.01.05.02.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 02:41:19 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Subject: [PATCH] drm/bridge: Add missing pm_runtime_disable() in
 __dw_mipi_dsi_probe
Date: Wed,  5 Jan 2022 10:41:09 +0000
Message-Id: <20220105104113.31415-1-linmq006@gmail.com>
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
Cc: linmq006@gmail.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Philippe CORNU <philippe.cornu@st.com>, Robert Foss <robert.foss@linaro.org>,
 Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the probe fails, we should use pm_runtime_disable() to balance
pm_runtime_enable().
Add missing pm_runtime_disable() for __dw_mipi_dsi_probe.

Fixes: 46fc515 ("drm/bridge/synopsys: Add MIPI DSI host controller bridge")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index e44e18a0112a..56c3fd08c6a0 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -1199,6 +1199,7 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 	ret = mipi_dsi_host_register(&dsi->dsi_host);
 	if (ret) {
 		dev_err(dev, "Failed to register MIPI host: %d\n", ret);
+		pm_runtime_disable(dev);
 		dw_mipi_dsi_debugfs_remove(dsi);
 		return ERR_PTR(ret);
 	}
-- 
2.17.1

