Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3293D1940E3
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 15:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A65E6E8D0;
	Thu, 26 Mar 2020 14:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3706E8D0;
 Thu, 26 Mar 2020 14:04:42 +0000 (UTC)
IronPort-SDR: DvpBg3W6wQu7iYlbd2Sck5SfbGonEp6g93nD9T4SNhPzu/KLVpR3dQBVgb6H6wF4K3pIvwTlK0
 Oi14Iw5vgC/w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 07:04:41 -0700
IronPort-SDR: VlC48LcBKokgZlAxmaWw2plZBCUp4fg4AD3VSnqmf2xZia6RGbpjLojUE/7Zb1yaKp2/3Ap7lB
 VKBrYnNOwTpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,308,1580803200"; d="scan'208";a="448637424"
Received: from aschoene-mobl.ger.corp.intel.com (HELO [10.252.60.225])
 ([10.252.60.225])
 by fmsmga006.fm.intel.com with ESMTP; 26 Mar 2020 07:04:38 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <ef10e822-76dd-125d-ec1f-9a78c5f76bc3@linux.intel.com>
Date: Thu, 26 Mar 2020 15:04:38 +0100
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

drm-misc-fixes-2020-03-26:
drm-misc-fixes for v5.6:
- SG fixes for prime, radeon and amdgpu.
The following changes since commit b216a8e7908cd750550c0480cf7d2b3a37f06954:

  drm/lease: fix WARNING in idr_destroy (2020-03-18 14:42:18 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-03-26

for you to fetch changes up to 47f7826c520ecd92ffbffe59ecaa2fe61e42ec70:

  drm/radeon: fix scatter-gather mapping with user pages (2020-03-25 12:10:55 -0400)

----------------------------------------------------------------
drm-misc-fixes for v5.6:
- SG fixes for prime, radeon and amdgpu.

----------------------------------------------------------------
Shane Francis (3):
      drm/prime: use dma length macro when mapping sg
      drm/amdgpu: fix scatter-gather mapping with user pages
      drm/radeon: fix scatter-gather mapping with user pages

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
 drivers/gpu/drm/drm_prime.c             | 2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
