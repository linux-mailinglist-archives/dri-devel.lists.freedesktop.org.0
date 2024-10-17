Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 070049A1AB1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 08:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F199B10E774;
	Thu, 17 Oct 2024 06:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE8F10E2FC
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 06:32:11 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.48])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4XTdJp1M50zQrmH;
 Thu, 17 Oct 2024 14:31:22 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 6E67D18009B;
 Thu, 17 Oct 2024 14:32:07 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 17 Oct
 2024 14:32:06 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <christian.koenig@amd.com>, <ray.huang@amd.com>,
 <dmitry.baryshkov@linaro.org>, <dave.stevenson@raspberrypi.com>,
 <quic_jjohnson@quicinc.com>, <mcanal@igalia.com>, <ruanjinjie@huawei.com>,
 <davidgow@google.com>, <skhan@linuxfoundation.org>,
 <karolina.stolarek@intel.com>, <Arunpravin.PaneerSelvam@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <asomalap@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/4] drm/tests: Fix some memory leaks
Date: Thu, 17 Oct 2024 14:31:21 +0800
Message-ID: <20241017063125.3080347-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemh500013.china.huawei.com (7.202.181.146)
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

Fix some memory leaks in drm tests.

Changes in v3:
- Adjust drm/drm_edid.h header to drm_kunit_helpers.c.
- Drop the "helper" in the helper name.
- s/fllowing/following/
- Add Acked-by.

Changes in v2:
- Fix it with new introduced helper instead of drm_mode_destroy().
- Update the commit message.
- Add Reviewed-by.

Jinjie Ruan (4):
  drm/tests: helpers: Add helper for drm_display_mode_from_cea_vic()
  drm/connector: hdmi: Fix memory leak in
    drm_display_mode_from_cea_vic()
  drm/ttm/tests: Fix memory leak in ttm_tt_simple_create()
  drm/tests: hdmi: Fix memory leaks in drm_display_mode_from_cea_vic()

 drivers/gpu/drm/tests/drm_connector_test.c    | 24 +++++------
 .../drm/tests/drm_hdmi_state_helper_test.c    |  8 ++--
 drivers/gpu/drm/tests/drm_kunit_helpers.c     | 40 +++++++++++++++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  1 +
 include/drm/drm_kunit_helpers.h               |  4 ++
 5 files changed, 61 insertions(+), 16 deletions(-)

-- 
2.34.1

