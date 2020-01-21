Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42102144D70
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BAA6FAF8;
	Wed, 22 Jan 2020 08:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45166ED09;
 Tue, 21 Jan 2020 14:00:59 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E2C832175FCBBEF9725C;
 Tue, 21 Jan 2020 22:00:46 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Tue, 21 Jan 2020 22:00:36 +0800
From: Chen Zhou <chenzhou10@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH -next 00/14] drm/amdgpu: remove unnecessary conversion to bool
Date: Tue, 21 Jan 2020 21:55:26 +0800
Message-ID: <20200121135540.165798-1-chenzhou10@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
Cc: chenzhou10@huawei.com, Felix.Kuehling@amd.com, tao.zhou1@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Hawking.Zhang@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series remove unnecessary conversion to bool in dir 
drivers/gpu/drm/amd/amdgpu/, which is detected by coccicheck.

Chen Zhou (14):
  drm/amdgpu: remove unnecessary conversion to bool in mmhub_v1_0.c
  drm/amdgpu: remove unnecessary conversion to bool in vega10_ih.c
  drm/amdgpu: remove unnecessary conversion to bool in navi10_ih.c
  drm/amdgpu: remove unnecessary conversion to bool in gfx_v10_0.c
  drm/amdgpu: remove unnecessary conversion to bool in sdma_v5_0.c
  drm/amdgpu: remove unnecessary conversion to bool in athub_v1_0.c
  drm/amdgpu: remove unnecessary conversion to bool in amdgpu_acp.c
  drm/amdgpu: remove unnecessary conversion to bool in soc15.c
  drm/amdgpu: remove unnecessary conversion to bool in nv.c
  drm/amdgpu: remove unnecessary conversion to bool in mmhub_v9_4.c
  drm/amdgpu: remove unnecessary conversion to bool in amdgpu_device.c
  drm/amdgpu: remove unnecessary conversion to bool in athub_v2_0.c
  drm/amdgpu: remove unnecessary conversion to bool in sdma_v4_0.c
  drm/amdgpu: remove unnecessary conversion to bool in gfx_v9_0.c

 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c    |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/athub_v1_0.c    |  4 ++--
 drivers/gpu/drm/amd/amdgpu/athub_v2_0.c    |  4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c     |  4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c      |  4 ++--
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c    |  4 ++--
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c    |  4 ++--
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c    |  4 ++--
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/nv.c            |  8 ++++----
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c     |  6 +++---
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c     |  4 ++--
 drivers/gpu/drm/amd/amdgpu/soc15.c         | 28 ++++++++++++++--------------
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c     |  2 +-
 15 files changed, 43 insertions(+), 45 deletions(-)

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
