Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 454BE189B72
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 12:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C7C6E8D4;
	Wed, 18 Mar 2020 11:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E576E8CA;
 Wed, 18 Mar 2020 11:55:56 +0000 (UTC)
IronPort-SDR: +TZ/SE9M6akjc1yB01VFb4BlCnkkQmaUJD0EufVJf4w2Eug/88EUMJ0aJoRmJS5dq7OwXiG2dI
 KIPllk5k/EsQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 04:55:54 -0700
IronPort-SDR: 7UEWuY5XWtHwI5O30OC9EQEE3xQpMPqYpl6qFA6nYdsrdKh2ehr6a+jWgEW5+8Wbvyumz7ovhJ
 vsd4tBmPN5EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,567,1574150400"; d="scan'208";a="445844367"
Received: from sksobhee-mobl.ger.corp.intel.com (HELO [10.249.43.187])
 ([10.249.43.187])
 by fmsmga006.fm.intel.com with ESMTP; 18 Mar 2020 04:55:52 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <d9c9250c-cec6-8ab9-10fb-e7da5d7c01db@linux.intel.com>
Date: Wed, 18 Mar 2020 12:55:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
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

drm-misc-fixes-2020-03-18:
drm-misc-fixes for v5.6:
- Fix AVI frame colorimetry in the dw-hdmi bridge.
- Fix compiler warning in komeda by annotating functions as __maybe_unused.
- Downgrade bochs pci_request_region failure from error to warning to
  workaround firmware fb.
The following changes since commit 1b79cfd99ff5127e6a143767b51694a527b3ea38:

  drm: kirin: Revert "Fix for hikey620 display offset problem" (2020-03-04 13:29:05 +0000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-03-18

for you to fetch changes up to 8c34cd1a7f089dc03933289c5d4a4d1489549828:

  drm/bochs: downgrade pci_request_region failure from error to warning (2020-03-13 15:34:19 +0100)

----------------------------------------------------------------
drm-misc-fixes for v5.6:
- Fix AVI frame colorimetry in the dw-hdmi bridge.
- Fix compiler warning in komeda by annotating functions as __maybe_unused.
- Downgrade bochs pci_request_region failure from error to warning to
  workaround firmware fb.

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/komeda: mark PM functions as __maybe_unused

Gerd Hoffmann (1):
      drm/bochs: downgrade pci_request_region failure from error to warning

Jernej Skrabec (1):
      drm/bridge: dw-hdmi: fix AVI frame colorimetry

 drivers/gpu/drm/arm/display/komeda/komeda_drv.c |  4 +--
 drivers/gpu/drm/bochs/bochs_hw.c                |  6 ++--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c       | 46 ++++++++++++++-----------
 3 files changed, 30 insertions(+), 26 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
