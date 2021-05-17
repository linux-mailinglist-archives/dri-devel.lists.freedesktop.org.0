Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A253827C0
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 11:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A496E915;
	Mon, 17 May 2021 09:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99AAF6E8EA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 08:07:33 +0000 (UTC)
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FkBW31LGfz16RBk;
 Mon, 17 May 2021 16:04:47 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 16:07:14 +0800
Received: from huawei.com (10.175.127.227) by dggema762-chm.china.huawei.com
 (10.1.198.204) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 17
 May 2021 16:07:13 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <emma@anholt.net>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH 0/2] cleanup patches for PM reference leak
Date: Mon, 17 May 2021 16:14:36 +0800
Message-ID: <20210517081438.1562410-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 17 May 2021 09:04:21 +0000
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
Cc: yukuai3@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yi.zhang@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yu Kuai (2):
  drm/v3d: Fix PM reference leak in v3d_get_param_ioctl()
  drm/v3d: Fix PM reference leak in v3d_v3d_debugfs_ident()

 drivers/gpu/drm/v3d/v3d_debugfs.c | 4 ++--
 drivers/gpu/drm/v3d/v3d_drv.c     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.25.4

