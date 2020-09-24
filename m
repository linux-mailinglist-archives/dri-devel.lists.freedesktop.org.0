Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA133276EF6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 12:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88846E1D7;
	Thu, 24 Sep 2020 10:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99FD6E1BA;
 Thu, 24 Sep 2020 10:47:09 +0000 (UTC)
IronPort-SDR: BU6UaC0WVAwqJPsmi6wrZaGD5v1fSIlhUaBsL3LzJm+czhdb1E+s5de7EOLYPzt0Gegd6SqzCn
 a4rX6+L/zrMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="148922924"
X-IronPort-AV: E=Sophos;i="5.77,297,1596524400"; d="scan'208";a="148922924"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 03:47:09 -0700
IronPort-SDR: GL65Yuwc+QJlKzw3HP6MsYar/L1nd0RjVRUB4thcCknSyPn7RpuyNzk+UWQjgDPaEiAxST7Dya
 NwZFwFXrnWlA==
X-IronPort-AV: E=Sophos;i="5.77,297,1596524400"; d="scan'208";a="486852741"
Received: from mwiktor-mobl.ger.corp.intel.com (HELO [10.249.47.51])
 ([10.249.47.51])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 03:47:06 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <4106c21e-f52c-4c05-6cdb-daa743bb8617@linux.intel.com>
Date: Thu, 24 Sep 2020 12:47:04 +0200
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

drm-misc-fixes-2020-09-24:
drm-misc-fixes for v5.9:
- Single null pointer deref fix for dma-buf.
The following changes since commit 74ea06164cda81dc80e97790164ca533fd7e3087:

  drm/sun4i: mixer: Extend regmap max_register (2020-09-10 13:08:48 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-09-24

for you to fetch changes up to 19a508bd1ad8e444de86873bf2f2b2ab8edd6552:

  dmabuf: fix NULL pointer dereference in dma_buf_release() (2020-09-21 11:17:06 +0200)

----------------------------------------------------------------
drm-misc-fixes for v5.9:
- Single null pointer deref fix for dma-buf.

----------------------------------------------------------------
Charan Teja Reddy (1):
      dmabuf: fix NULL pointer dereference in dma_buf_release()

 drivers/dma-buf/dma-buf.c | 2 ++
 1 file changed, 2 insertions(+)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
