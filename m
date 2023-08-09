Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC10D77518B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 05:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11E810E13B;
	Wed,  9 Aug 2023 03:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319A910E12A;
 Wed,  9 Aug 2023 03:45:25 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RLGBf426Tz1GDtx;
 Wed,  9 Aug 2023 11:44:10 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 9 Aug
 2023 11:45:19 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <inki.dae@samsung.com>,
 <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>,
 <krzysztof.kozlowski@linaro.org>, <alim.akhtar@samsung.com>,
 <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
 <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <bskeggs@redhat.com>, <kherbst@redhat.com>,
 <lyude@redhat.com>, <kraxel@redhat.com>, <gurchetansingh@chromium.org>,
 <olvaffe@gmail.com>, <paulo.miguel.almeida.rodenas@gmail.com>,
 <wenjing.liu@amd.com>, <haoping.liu@amd.com>, <Charlene.Liu@amd.com>,
 <chiahsuan.chung@amd.com>, <george.shen@amd.com>, <sancchen@amd.com>,
 <tony.tascioglu@amd.com>, <jaehyun.chung@amd.com>,
 <tales.aparecida@gmail.com>, <drv@mailo.com>, <aurabindo.pillai@amd.com>,
 <quic_vpolimer@quicinc.com>, <jiasheng@iscas.ac.cn>, <noralf@tronnes.org>,
 <jose.exposito89@gmail.com>, <javierm@redhat.com>, <mairacanal@riseup.net>,
 <davidgow@google.com>, <arthurgrillo@riseup.net>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <virtualization@lists.linux-foundation.org>
Subject: [PATCH -next 0/7] drm: Remove many unnecessary NULL values
Date: Wed, 9 Aug 2023 11:44:38 +0800
Message-ID: <20230809034445.434902-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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

The NULL initialization of the pointers assigned by kzalloc() or
kunit_kzalloc() first is not necessary, because if the kzalloc() or
kunit_kzalloc() failed, the pointers will be assigned NULL, otherwise
it works as usual. so remove it.

Ruan Jinjie (7):
  drm/amdkfd: Remove unnecessary NULL values
  drm/amd/display: Remove unnecessary NULL values
  drm/msm: Remove unnecessary NULL values
  drm/radeon: Remove unnecessary NULL values
  drm/virtio: Remove an unnecessary NULL value
  drm/format-helper: Remove unnecessary NULL values
  drm: Remove unnecessary NULL values

 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c  |  4 +--
 .../gpu/drm/amd/display/dc/bios/bios_parser.c |  4 +--
 .../drm/amd/display/dc/bios/bios_parser2.c    |  4 +--
 drivers/gpu/drm/drm_agpsupport.c              |  2 +-
 drivers/gpu/drm/drm_atomic_uapi.c             |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.c       |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c      |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c     |  2 +-
 drivers/gpu/drm/radeon/radeon_agp.c           |  2 +-
 drivers/gpu/drm/radeon/radeon_combios.c       |  6 ++--
 .../gpu/drm/radeon/radeon_legacy_encoders.c   |  4 +--
 .../gpu/drm/tests/drm_format_helper_test.c    | 28 +++++++++----------
 drivers/gpu/drm/virtio/virtgpu_submit.c       |  2 +-
 14 files changed, 33 insertions(+), 33 deletions(-)

-- 
2.34.1

