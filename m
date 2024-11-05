Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA029BE02F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 09:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81E410E029;
	Wed,  6 Nov 2024 08:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1079 seconds by postgrey-1.36 at gabe;
 Tue, 05 Nov 2024 14:30:43 UTC
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C61A10E5BD;
 Tue,  5 Nov 2024 14:30:43 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XjVdt0jJfz2Fb4S;
 Tue,  5 Nov 2024 22:12:18 +0800 (CST)
Received: from kwepemd200012.china.huawei.com (unknown [7.221.188.145])
 by mail.maildlp.com (Postfix) with ESMTPS id 11EDE1401F4;
 Tue,  5 Nov 2024 22:13:58 +0800 (CST)
Received: from huawei.com (10.67.175.84) by kwepemd200012.china.huawei.com
 (7.221.188.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 5 Nov
 2024 22:13:56 +0800
From: Zicheng Qu <quzicheng@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <Alvin.Lee2@amd.com>, <chiahsuan.chung@amd.com>,
 <alex.hung@amd.com>, <wenjing.liu@amd.com>, <Dillon.Varone@amd.com>,
 <george.shen@amd.com>, <mwen@igalia.com>, <yi-lchen@amd.com>,
 <martin.leung@amd.com>, <yongqiang.sun@amd.com>, <tony.cheng@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <tanghui20@huawei.com>, <zhangqiao22@huawei.com>,
 <judy.chenhui@huawei.com>, <quzicheng@huawei.com>
Subject: [PATCH 0/2] drm/amd/display: Fix Power Gating Configuration
Date: Tue, 5 Nov 2024 14:02:54 +0000
Message-ID: <20241105140256.2465614-1-quzicheng@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.175.84]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200012.china.huawei.com (7.221.188.145)
X-Mailman-Approved-At: Wed, 06 Nov 2024 08:18:14 +0000
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

Hi all,

I am submitting two patches to correct power gating configurations in
the AMD display driver.

1. Patch 1/2 (Fixes: 46825fcfbe16): Corrects DOMAIN10_PG_CONFIG to use
DOMAIN10_POWER_FORCEON.
2. Patch 2/2 (Fixes: 46825fcfbe16): Corrects DOMAIN11_PG_CONFIG to use
DOMAIN11_POWER_FORCEON.

Thanks for reviewing!

Zicheng Qu (2):
  drm/amd/display: Fix incorrect power gating configuration for DOMAIN10
  drm/amd/display: Fix incorrect power gating configuration for DOMAIN11

 drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

