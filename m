Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE9B5EEB54
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 03:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127F810E93F;
	Thu, 29 Sep 2022 01:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA07810E93F
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 01:56:46 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MdGZg41P5z1P6lS;
 Thu, 29 Sep 2022 09:52:27 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 29 Sep
 2022 09:56:44 +0800
From: Yuan Can <yuancan@huawei.com>
To: <dianders@chromium.org>, <thierry.reding@gmail.com>, <sam@ravnborg.org>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 0/2] drm/panel: Use dev_err_probe() to simplify code
Date: Thu, 29 Sep 2022 01:55:01 +0000
Message-ID: <20220929015503.17301-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
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
Cc: yuancan@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series contains two patchs simplify the error handling in probe
function by switching from dev_err() to dev_err_probe().
---
changes in v2:
- simplify the same case in panel_edp_probe
- add Reviewed-by from Douglas Anderson

Yuan Can (2):
  drm/panel: panel-edp: Use dev_err_probe() to simplify code
  drm/panel: simple: Use dev_err_probe() to simplify code

 drivers/gpu/drm/panel/panel-edp.c    | 22 ++++++----------------
 drivers/gpu/drm/panel/panel-simple.c |  9 +++------
 2 files changed, 9 insertions(+), 22 deletions(-)

-- 
2.17.1

