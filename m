Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B0B4D449C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 11:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5CD10EAB8;
	Thu, 10 Mar 2022 10:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB8310EAB8;
 Thu, 10 Mar 2022 10:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646908253; x=1678444253;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=7292UzIr1MfbMrFmnLIDAgORF8SBtIDPfGpSSt4+Iqs=;
 b=AhbiHJZf8usRvBOSnUZ8JvSrEZG+7yeaBVjruqRn6Dca3i45V7crzzgM
 lyK/+JCOVVhiUAPII4OmG3YOW0f1ae+vLrT8or1x0BjFLsVHOqhudDcQf
 enox75yshDNAVI1x/A4Mz/D06VgH5xYP6MdV4ojTfyhhHTj5XyyLKK1nr
 0N62dTLxr3P9uv7tk5/wlcN7VXLe8go9JZXy+nFOHkv1Pyoz/G73/kq/b
 04ZracucBZB8ER921IGu1YDlFPJjoUpWsusFIqT7giQ6wAr+JWtbVgILk
 N+Zvionf7tf80muAt4DOg/M5NK150vinsGQy0+gpY5/Rh8xKDMi6XMAvj Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="341645061"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="341645061"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 02:30:46 -0800
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="712313412"
Received: from npalmass-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.213.186.207])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 02:30:43 -0800
Date: Thu, 10 Mar 2022 10:30:40 +0000
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <YinTFSFg++HvuFpZ@tursulin-mobl2>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,  Daniel,

One PSR2 fix for the next release candidate, if there will be one.

Regards,

Tvrtko

drm-intel-fixes-2022-03-10:
- Fix PSR2 when selective fetch is enabled and cursor at (-1, -1) (Jouni Högander)
The following changes since commit ffb217a13a2eaf6d5bd974fc83036a53ca69f1e2:

  Linux 5.17-rc7 (2022-03-06 14:28:31 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-03-10

for you to fetch changes up to 804f468853179b9b58af05c153c411931aa5b310:

  drm/i915/psr: Set "SF Partial Frame Enable" also on full update (2022-03-07 14:45:31 +0000)

----------------------------------------------------------------
- Fix PSR2 when selective fetch is enabled and cursor at (-1, -1) (Jouni Högander)

----------------------------------------------------------------
Jouni Högander (1):
      drm/i915/psr: Set "SF Partial Frame Enable" also on full update

 drivers/gpu/drm/i915/display/intel_psr.c | 16 ++++++++++++++--
 drivers/gpu/drm/i915/i915_reg.h          |  1 +
 2 files changed, 15 insertions(+), 2 deletions(-)
