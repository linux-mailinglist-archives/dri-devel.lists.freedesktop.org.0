Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63688967161
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 13:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA77510E11C;
	Sat, 31 Aug 2024 11:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814FF10EAB4;
 Sat, 31 Aug 2024 01:19:49 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Wwccg4bYwz1j7m5;
 Sat, 31 Aug 2024 09:19:31 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id 222A91A016C;
 Sat, 31 Aug 2024 09:19:46 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 31 Aug
 2024 09:19:45 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kherbst@redhat.com>, <lyude@redhat.com>, <dakr@redhat.com>,
 <felix.kuehling@amd.com>, <shashank.sharma@amd.com>,
 <srinivasan.shanmugam@amd.com>, <zhenguo.yin@amd.com>, <Jesse.Zhang@amd.com>
CC: <lizetao1@huawei.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH -next -v2 0/3] drm: use clamp() instead of min(max())
Date: Sat, 31 Aug 2024 09:28:00 +0800
Message-ID: <20240831012803.3950100-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-Mailman-Approved-At: Sat, 31 Aug 2024 11:44:34 +0000
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

Hi,

When it needs to get the value of a certain interval [min, max],
it is easier to understand using clamp(x, min, max) instead of
min(max(x, min), max). What needs to be determined is that min
should be smaller than max.

v1 -> v2: Change the title prefix of patch 3 to drm/nouveau/volt
v1: https://lore.kernel.org/all/20240830012216.603623-1-lizetao1@huawei.com/

Li Zetao (3):
  drm/amd: use clamp() in amdgpu_pll_get_fb_ref_div()
  drm/amdgpu: use clamp() in amdgpu_vm_adjust_size()
  drm/nouveau/volt: use clamp() in nvkm_volt_map()

 drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c         | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c          | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.34.1

