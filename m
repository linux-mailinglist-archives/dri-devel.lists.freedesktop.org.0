Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA1C783AA9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 09:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296B3882AF;
	Tue, 22 Aug 2023 07:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA4C10E2DB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 07:15:27 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RVLCn3PG0zVkZJ;
 Tue, 22 Aug 2023 15:13:09 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 15:15:23 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <thierry.reding@gmail.com>, <mperttunen@nvidia.com>, <jonathanh@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH -next 0/2] drm: Use PTR_ERR_OR_ZERO() to simplify code
Date: Tue, 22 Aug 2023 15:15:01 +0800
Message-ID: <20230822071503.178000-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
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
Cc: ruanjinjie@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PTR_ERR_OR_ZERO() return the error code within @ptr if it is
an error pointer, otherwise return 0. So use it to simplify code.

Jinjie Ruan (2):
  drm/bridge: Use PTR_ERR_OR_ZERO() to simplify code
  drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code

 drivers/gpu/drm/bridge/tc358762.c | 10 ++--------
 drivers/gpu/drm/bridge/tc358764.c |  5 +----
 drivers/gpu/drm/tegra/drm.c       |  5 +----
 drivers/gpu/drm/tegra/gem.c       |  5 +----
 4 files changed, 5 insertions(+), 20 deletions(-)

-- 
2.34.1

