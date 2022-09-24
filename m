Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2882B5E872A
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 03:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D9510E40F;
	Sat, 24 Sep 2022 01:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CBB10E40F
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 01:58:51 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MZBsh15ffzWgt3;
 Sat, 24 Sep 2022 09:54:48 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 24 Sep
 2022 09:58:47 +0800
From: Yuan Can <yuancan@huawei.com>
To: <thierry.reding@gmail.com>, <sam@ravnborg.org>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <laurent.pinchart@ideasonboard.com>,
 <dianders@chromium.org>, <hanxu5@huaqin.corp-partner.google.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/10] drm/panel: Use dev_err_probe() to simplify code
Date: Sat, 24 Sep 2022 01:56:06 +0000
Message-ID: <20220924015616.34293-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
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

This series simplify the error handling in probe function by
switching from dev_err() to dev_err_probe().

Yuan Can (10):
  drm/panel: himax8279d: Use dev_err_probe() to simplify code
  drm/panel: panel-edp: Use dev_err_probe() to simplify code
  drm/panel: elida-kd35t133: Use dev_err_probe() to simplify code
  drm/panel: leadtek-ltk050h3146w: Use dev_err_probe() to simplify code
  drm/panel: leadtek-ltk500hd1829: Use dev_err_probe() to simplify code
  drm/panel: lvds: Use dev_err_probe() to simplify code
  drm/panel: otm8009a: Use dev_err_probe() to simplify code
  drm/panel: rm68200: Use dev_err_probe() to simplify code
  drm/panel: s6d16d0: Use dev_err_probe() to simplify code
  drm/panel: simple: Use dev_err_probe() to simplify code

 drivers/gpu/drm/panel/panel-boe-himax8279d.c  | 27 +++++++------------
 drivers/gpu/drm/panel/panel-edp.c             | 13 +++------
 drivers/gpu/drm/panel/panel-elida-kd35t133.c  | 18 +++++--------
 .../drm/panel/panel-leadtek-ltk050h3146w.c    | 18 +++++--------
 .../drm/panel/panel-leadtek-ltk500hd1829.c    | 18 +++++--------
 drivers/gpu/drm/panel/panel-lvds.c            |  9 +++----
 .../gpu/drm/panel/panel-orisetech-otm8009a.c  |  9 +++----
 drivers/gpu/drm/panel/panel-raydium-rm68200.c |  9 +++----
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c |  9 +++----
 drivers/gpu/drm/panel/panel-simple.c          |  9 +++----
 10 files changed, 45 insertions(+), 94 deletions(-)

-- 
2.17.1

