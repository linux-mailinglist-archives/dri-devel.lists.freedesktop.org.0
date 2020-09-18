Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 963D326FB2C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 13:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F146ECCE;
	Fri, 18 Sep 2020 11:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2726E0DA;
 Fri, 18 Sep 2020 11:11:18 +0000 (UTC)
IronPort-SDR: CMnQA9nX/jqBq5fHBoQEkIw7xFYOAULHo1KhxCj3E6sk2FjKpRZBR5H3pwdhfF/1xHMzsur9Qn
 r1IlZ2QbAvaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="160830682"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="160830682"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 04:11:17 -0700
IronPort-SDR: KZ3+3NgJN7PZwhtkK4HdYLpS4dI5jcq4B5PA5ecjWB39VHYA/6f23mKXog7Lvk2UwHJbCEnQRZ
 SN79tPYmrqjw==
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="484162098"
Received: from ammantio-mobl1.amr.corp.intel.com (HELO [10.249.46.116])
 ([10.249.46.116])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 04:11:14 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <e3ab56cf-3b8e-9b21-f1b6-9a4989a52996@linux.intel.com>
Date: Fri, 18 Sep 2020 13:11:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Language: en-US
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm-misc-fixes-2020-09-18:
drm-misc-fixes for v5.9-rc6:
- Fill asoc card owner in vc4.
- Program secondary CSC correctly in sun4i, and extend
  register mapping to cover secondary CSC registers.
The following changes since commit fc7f148feb8975784bd40e41fff875d33f698be8:

  drm/virtio: drop virtio_gpu_output->enabled (2020-09-04 13:11:32 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-09-18

for you to fetch changes up to 74ea06164cda81dc80e97790164ca533fd7e3087:

  drm/sun4i: mixer: Extend regmap max_register (2020-09-10 13:08:48 +0200)

----------------------------------------------------------------
drm-misc-fixes for v5.9-rc6:
- Fill asoc card owner in vc4.
- Program secondary CSC correctly in sun4i, and extend
  register mapping to cover secondary CSC registers.

----------------------------------------------------------------
Marek Szyprowski (1):
      drm/vc4/vc4_hdmi: fill ASoC card owner

Martin Cerveny (2):
      drm/sun4i: sun8i-csc: Secondary CSC register correction
      drm/sun4i: mixer: Extend regmap max_register

 drivers/gpu/drm/sun4i/sun8i_csc.h   | 2 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
