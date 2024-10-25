Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0814F9AFBA9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 09:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D9910EA16;
	Fri, 25 Oct 2024 07:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CDC10EA16
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 07:58:15 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XZZL310YNz1HLHn;
 Fri, 25 Oct 2024 15:34:35 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
 by mail.maildlp.com (Postfix) with ESMTPS id 1BBCD1A0188;
 Fri, 25 Oct 2024 15:38:58 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 25 Oct
 2024 15:38:57 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <neil.armstrong@linaro.org>, <quic_jesszhan@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: <chenjun102@huawei.com>, <zhangzekun11@huawei.com>
Subject: [PATCH 0/2]  drm: Add a check to prevent NULL pointer dereference
Date: Fri, 25 Oct 2024 15:34:06 +0800
Message-ID: <20241025073408.27481-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500003.china.huawei.com (7.202.181.241)
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

drm_mode_duplicate() could return NULL due to lack of memory, which
could cause NULL pointer dereference. Add a check to prevent it.

Zhang Zekun (2):
  drm/i2c/ch7006: Add a check to prevent NULL pointer dereference
  drm/panel: himax-hx83102: Add a check to prevent NULL pointer
    dereference

 drivers/gpu/drm/i2c/ch7006_drv.c            | 8 ++++++--
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.17.1

