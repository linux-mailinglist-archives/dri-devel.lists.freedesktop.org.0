Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEE56F04E4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 13:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A090B10EB1F;
	Thu, 27 Apr 2023 11:24:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1729E10E0DF;
 Thu, 27 Apr 2023 11:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682594639; x=1714130639;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=n5WRvjGljDh9jGTwtheV27aaLqZl6ZzFzuw5ylqwDuI=;
 b=e/c4aSJpgBpdXeKie7ltuErCpSBH6h5rzwwejCAHn0p902AlQGIxYSfN
 ZGZyu5OlA8bvyaLwYhJnTMblquxGoWhTdxIMyEHVx8BmdKGwggD7i2ZKH
 qj0/rnIO4YBcdlLI8QTVtvzYCyhuOLMJ6mTEtQCcIivRcw+uMo/iyAj9l
 Q2WHiHujmUZfxrApJxn1725Vtghq5La3O8IyVpCuf7Ui1A5lHlpzi1QGz
 lE5gu5lcpAKZnDrd/Qz2y9Ewl2GUM6LgRYubBlkJnCU9M9K8y2cao/lNg
 zDUnSd+8PFry8U8hcVPBthvOffGjFe2kR21r/lNJYYxFrJUAo2xk3aiVb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="331663941"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="331663941"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 04:23:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="697034168"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="697034168"
Received: from jaoriord-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.11.96])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 04:23:54 -0700
Date: Thu, 27 Apr 2023 14:23:52 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <ZEpbSG1ZOSVqzGLx@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Just one Cc stable SKL+ pipe source size fix for #8357: CML-U: external
5120x2160 monitor can't play video.

Best Regards, Joonas

***

drm-intel-next-fixes-2023-04-27:

One cc stable for pipe source size check on SKL+

The following changes since commit 2c69679626d5daa680d71c77ad58af0088db537f:

  drm/i915/dp_mst: Fix active port PLL selection for secondary MST streams (2023-04-19 17:25:29 +0300)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2023-04-27

for you to fetch changes up to d944eafed618a8507270b324ad9d5405bb7f0b3e:

  drm/i915: Check pipe source size when using skl+ scalers (2023-04-24 14:48:42 +0300)

----------------------------------------------------------------
One cc stable for pipe source size check on SKL+

----------------------------------------------------------------
Ville Syrjälä (1):
      drm/i915: Check pipe source size when using skl+ scalers

 drivers/gpu/drm/i915/display/skl_scaler.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
