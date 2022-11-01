Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E327A6144D8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 07:54:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821EE10E17C;
	Tue,  1 Nov 2022 06:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3358911F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 06:54:28 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4N1gdn0s3wzpW4B;
 Tue,  1 Nov 2022 14:50:53 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 1 Nov
 2022 14:54:24 +0800
From: Yuan Can <yuancan@huawei.com>
To: <rodrigosiqueiramelo@gmail.com>, <melissa.srw@gmail.com>,
 <hamohammed.sa@gmail.com>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <seanpaul@chromium.org>, <sylphrenadin@gmail.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/2] drm/vkms: Fix some memory related bug
Date: Tue, 1 Nov 2022 06:51:54 +0000
Message-ID: <20221101065156.41584-1-yuancan@huawei.com>
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

This series contains two memory related bugfixes about vkms driver.

Yuan Can (2):
  drm/vkms: Fix memory leak in vkms_init()
  drm/vkms: Fix null-ptr-deref in vkms_release()

 drivers/gpu/drm/vkms/vkms_drv.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.17.1

