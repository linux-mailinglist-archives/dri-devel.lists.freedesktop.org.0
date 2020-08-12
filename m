Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D8C242A39
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 15:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B966E109;
	Wed, 12 Aug 2020 13:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F5D6E109;
 Wed, 12 Aug 2020 13:24:37 +0000 (UTC)
IronPort-SDR: ZdVQzlRv18N1G293eIpbLR7SZbUT3tb6D7SXRz4F/OB9AZlfKLp+Utrrky3IErP0HEmD07hV8h
 kvdg77nyjXHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9710"; a="141569741"
X-IronPort-AV: E=Sophos;i="5.76,304,1592895600"; d="scan'208";a="141569741"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2020 06:24:36 -0700
IronPort-SDR: miMmxn9KccU84+Ewg0KkaAX2MHNnnfZrodgK2LjFKqULhRVO2jOOEuSo5fCgHpEZI71tVtjTit
 +h/oTnDwMKDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,304,1592895600"; d="scan'208";a="295065873"
Received: from cwilli-mobl.ger.corp.intel.com (HELO [10.252.41.147])
 ([10.252.41.147])
 by orsmga006.jf.intel.com with ESMTP; 12 Aug 2020 06:24:33 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <d50eb2e0-75c8-b724-006f-5e7b391961ff@linux.intel.com>
Date: Wed, 12 Aug 2020 15:24:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
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

drm-misc-fixes-2020-08-12:
drm-misc-fixes for v5.9-rc1:
- Add missing dma_fence_put() in virtio_gpu_execbuffer_ioctl().
- Fix memory leak in virtio_gpu_cleanup_object().
The following changes since commit b5ac98cbb8e5e30c34ebc837d1e5a3982d2b5f5c:

  drm: Added orientation quirk for ASUS tablet model T103HAF (2020-08-04 11:45:23 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-08-12

for you to fetch changes up to 836b194d65782aaec4485a07d2aab52d3f698505:

  drm/virtio: fix memory leak in virtio_gpu_cleanup_object() (2020-08-07 13:59:08 +0200)

----------------------------------------------------------------
drm-misc-fixes for v5.9-rc1:
- Add missing dma_fence_put() in virtio_gpu_execbuffer_ioctl().
- Fix memory leak in virtio_gpu_cleanup_object().

----------------------------------------------------------------
Qi Liu (1):
      drm/virtio: fix missing dma_fence_put() in virtio_gpu_execbuffer_ioctl()

Xin He (1):
      drm/virtio: fix memory leak in virtio_gpu_cleanup_object()

 drivers/gpu/drm/virtio/virtgpu_ioctl.c  | 1 +
 drivers/gpu/drm/virtio/virtgpu_object.c | 1 +
 2 files changed, 2 insertions(+)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
