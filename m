Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3042CE965
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:20:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757976E138;
	Fri,  4 Dec 2020 08:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42076E134
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 08:19:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 23so4423017wrc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Dec 2020 00:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uFjKy1JMQGds6QCWv9HgfQo7basi56RFkixKbM89qBQ=;
 b=iLmFK7YliCdlWPtPemg20hSOC9+X0t97zFpxwojlugyjm5Ntx5rhE2aymcQjZFsI7A
 FcAkMDcv4bJ4q7Wv/C9JK60TLmp0sRkQFNE1k8Qk8lt2bSoIoKCak+UH5vbtlcXeBdRz
 m73MSfm60b/c4NPBoAaarCInCaV2yx1Wh1KIbMGbBprjxwQ89iAlXD+IAvlGY4vCFtql
 iMb/7WcIp3bpSXipN7GY2Ex9qkHJ2SXlMY51CpWW61OJbWOa1UcTNcSJ8TvaHl/2f07E
 q+lqbW/z1pxM8yXsNze2PxmqhbgYt/FAaYzbN5JslOIwNF1R+ghXS6L3AxwFYKxsAino
 2smg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uFjKy1JMQGds6QCWv9HgfQo7basi56RFkixKbM89qBQ=;
 b=tLWg9+PWxST2WOwlZ6WMj/40TBOxCl9X9MQgTkTx+B71cEAlr0TpGMFF4RE4sC3Pua
 C1Z6DV100RPTNXeN456d5PUt8yNngOu86OPdp7qHabSbiuz4Yym7NNIHz6Z8pZ4zaUdH
 wvSLhUU5LGCV6h5odDwB9QiGRgwY7GbzC5Oxh2GETLcNosJl+AT94lDhFq3h6BMd69W1
 RT6hD19wcWuZGZlo1JOtCJEBY1szLssTmQ4lvAcs8Jfl3ej9h49QXUuFklozNrMQK5tw
 2GdhKcw7XtAbW72262AOYB0VeEr64slm77EEjl08EAELZVenz/aYPCqciZE3WJXZC/TT
 CObw==
X-Gm-Message-State: AOAM530NYRmd0CwCpCktCnY0enTjWj/si0MKTIYHtRhyKiC5etIq0mzE
 4Vn1zfXXCy7hsm/Vm4BpRQe4GQ==
X-Google-Smtp-Source: ABdhPJykB+eU1y7MuAmsKGB/sLYnbS2V5dqlJBOTpU3F9+1gTVE8TYjBwDFd8NbGB5pAHfOHTslnWA==
X-Received: by 2002:a5d:634c:: with SMTP id b12mr3477924wrw.130.1607069998193; 
 Fri, 04 Dec 2020 00:19:58 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:296a:40d9:d5a0:bbc5])
 by smtp.gmail.com with ESMTPSA id b17sm1691156wrv.10.2020.12.04.00.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 00:19:57 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: sam@ravnborg.org
Subject: [PATCH v2 0/2] drm: panel: add support for the Khadas TS050 panel
Date: Fri,  4 Dec 2020 09:19:47 +0100
Message-Id: <20201204081949.38418-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This add support & bindings for the Khadas TS050 1080x1920 5" LCD DSI panel designed
to work with the Khadas Edge-V, Captain, VIM3 and VIM3L Single Board Computers.
It provides a MIPI DSI interface to the host, a built-in LED backlight
and touch controller.

Changes since v1:
- removed drm_print include
- added reset_gpio to 1 after prepare failure
- now ignore regulator_disable() on prepare failure
- mark prepared=false whatever the result of the unprepare function errors
- also reset_gpio to 1 on unprepare
- do not return on mipi_dsi_dcs_enter_sleep_mode error on unprepare
- mark enabled=true unconditionnally
- use dev_err_probe in probe()

Neil Armstrong (2):
  dt-bindings: panel-simple-dsi: add Khadas TS050 panel bindings
  drm: panel: add Khadas TS050 panel driver

 .../display/panel/panel-simple-dsi.yaml       |   2 +
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-khadas-ts050.c    | 866 ++++++++++++++++++
 4 files changed, 880 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-khadas-ts050.c

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
