Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B151377A74
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 05:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927156E3AC;
	Mon, 10 May 2021 03:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B9A6E328;
 Mon, 10 May 2021 03:16:28 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FdmMk3QXtzqTmV;
 Mon, 10 May 2021 11:13:06 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Mon, 10 May 2021 11:16:16 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, linux-arm-msm
 <linux-arm-msm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/1] drm/msm/dpu: Fix error return code in dpu_mdss_init()
Date: Mon, 10 May 2021 11:16:05 +0800
Message-ID: <20210510031606.3112-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.177.72]
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
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v1 --> v2:
According to Anton Ivanov's review comments, detele the unnecessary local
variable initialization "ret = 0".


Zhen Lei (1):
  drm/msm/dpu: Fix error return code in dpu_mdss_init()

 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.26.0.106.g9fadedd


