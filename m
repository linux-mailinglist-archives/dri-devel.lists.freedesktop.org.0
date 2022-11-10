Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69545623EF0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 10:45:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF3A10E6B1;
	Thu, 10 Nov 2022 09:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78BD10E6B1;
 Thu, 10 Nov 2022 09:44:50 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N7H442TPczRnxF;
 Thu, 10 Nov 2022 17:44:36 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 17:44:46 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <james.qian.wang@arm.com>, <liviu.dudau@arm.com>,
 <mihail.atanassov@arm.com>, <brian.starkey@arm.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
 <dmitry.baryshkov@linaro.org>, <sean@poorly.run>, <thierry.reding@gmail.com>, 
 <sam@ravnborg.org>, <emma@anholt.net>, <mripard@kernel.org>,
 <vladimir.lypak@gmail.com>, <quic_akhilpo@quicinc.com>,
 <dianders@chromium.org>, <cuigaosheng1@huawei.com>, <olvaffe@gmail.com>,
 <angelogioacchino.delregno@somainline.org>, <marijn.suijten@somainline.org>
Subject: [PATCH 0/5] Fix IS_ERR() vs NULL check for drm
Date: Thu, 10 Nov 2022 17:44:40 +0800
Message-ID: <20221110094445.2930509-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500012.china.huawei.com (7.221.188.12)
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series contains a few fixup patches, to fix IS_ERR() vs NULL check
for drm, and avoid a potential null-ptr-defer issue, too. Thanks!

Gaosheng Cui (5):
  drm/panel: Fix IS_ERR() vs NULL check in nt35950_probe()
  drm/msm: Fix IS_ERR() vs NULL check in a5xx_submit_in_rb()
  drm/msm: Fix IS_ERR_OR_NULL() vs NULL check in msm_icc_get()
  drm/komeda: Fix IS_ERR() vs NULL check in
    komeda_component_get_avail_scaler()
  drm/vc4: kms: Fix IS_ERR() vs NULL check for vc4_kms

 .../gpu/drm/arm/display/komeda/komeda_pipeline_state.c    | 2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c                     | 2 +-
 drivers/gpu/drm/msm/msm_io_utils.c                        | 2 +-
 drivers/gpu/drm/panel/panel-novatek-nt35950.c             | 2 +-
 drivers/gpu/drm/vc4/vc4_kms.c                             | 8 ++++----
 5 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.25.1

