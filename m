Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA052755938
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 03:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4CD10E121;
	Mon, 17 Jul 2023 01:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57AD10E120;
 Mon, 17 Jul 2023 01:47:45 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4R44dJ1jQ6ztR79;
 Mon, 17 Jul 2023 09:44:36 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 09:47:39 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <liviu.dudau@arm.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
 <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>,
 <sam@ravnborg.org>, <quic_eberman@quicinc.com>, <a39.skl@gmail.com>,
 <quic_gurus@quicinc.com>, <cuigaosheng1@huawei.com>,
 <angelogioacchino.delregno@somainline.org>, <james.qian.wang@arm.com>
Subject: [PATCH v4 0/3] Fix IS_ERR() vs NULL check for drm
Date: Mon, 17 Jul 2023 09:47:36 +0800
Message-ID: <20230717014739.2952665-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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

v4:
- 1. Update the second patch's commit messages.
  2. Update the first patch, use dev_err_probe() instead of dev_err().

  Thanks!

v3:
- Update the second patch:
  1. change IS_ERR to IS_ERR_OR_NULL
  2. add Dmitry's R-b in this revision:
  link: https://patchwork.freedesktop.org/patch/511035/?series=110745&rev=1

  Thanks!

v2:
- I'm sorry I missed some emails, these patches were submitted last year,
  now let me resend it with the following changes:
  1. remove the patch: "drm/msm: Fix IS_ERR_OR_NULL() vs NULL check in msm_icc_get()"
  2. remove the patch: "drm/vc4: kms: Fix IS_ERR() vs NULL check for vc4_kms"
  3. add "Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>" to the second patch.

  Thanks!

v1:
- This series contains a few fixup patches, to fix IS_ERR() vs NULL check
  for drm, and avoid a potential null-ptr-defer issue, too. Thanks!

Gaosheng Cui (3):
  drm/panel: Fix IS_ERR() vs NULL check in nt35950_probe()
  drm/msm: Fix IS_ERR_OR_NULL() vs NULL check in a5xx_submit_in_rb()
  drm/komeda: Fix IS_ERR() vs NULL check in
    komeda_component_get_avail_scaler()

 drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c | 2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c                      | 2 +-
 drivers/gpu/drm/panel/panel-novatek-nt35950.c              | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.25.1

