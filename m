Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AA16767C4
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 18:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBE910E2AB;
	Sat, 21 Jan 2023 17:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214A810E1A7;
 Sat, 21 Jan 2023 17:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674322901; x=1705858901;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=bZbzLBRSYHALctzAHZ0CNb5mY62MyzVCgbG2fg+bYig=;
 b=PnUDeG58qLpLoPsj0oMFTR6UybxOpV1DlqQqarXIlQgQXZR/585p2Oxh
 Dvt1wlRdphZr/llrO08hP/0Mo1Q2Gp+FzF/9rDkLQHqWAAp3iVFtirwlk
 LeNQT/C5OxQo4GhSj0v6Z5mgNkZnnPK/ZZhm3fT3XXy64AIF9SYFGnkYW
 2E4jvhit/bdFuU/4r1A1O3SEFOlJnk+ppApddhV8ubmTmfJ9JIZBMEft2
 fginQLCVIx5vOL7PbxqSxzwIkIt6WFf0y7YL+0YY8othQyn/cX5qmBvU6
 YiTQTOCFsV0Df8KQOLYJUZJvrs45GxIoedw0xLXzGPWgGSOpxzjp2S52Z w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="388167995"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; d="scan'208";a="388167995"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2023 09:41:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="729472795"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; d="scan'208";a="729472795"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 21 Jan 2023 09:41:38 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pJHs1-0004KA-0n;
 Sat, 21 Jan 2023 17:41:37 +0000
Date: Sun, 22 Jan 2023 01:41:12 +0800
From: kernel test robot <lkp@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [drm-intel:drm-intel-gt-next 1/2] htmldocs:
 Documentation/gpu/i915:64: ./drivers/gpu/drm/i915/gt/intel_workarounds.c:32:
 WARNING: Inline emphasis start-string without end-string.
Message-ID: <202301220116.qlw4dHOC-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm-intel drm-intel-gt-next
head:   8d7eb8ed3f83f248e01a4f548d9c500a950a2c2d
commit: 0c3064cf33fbfa8a25871d847e715f33b64f323e [1/2] drm/i915/doc: Document where to implement register workarounds
reproduce:
        git remote add drm-intel git://anongit.freedesktop.org/drm-intel
        git fetch --no-tags drm-intel drm-intel-gt-next
        git checkout 0c3064cf33fbfa8a25871d847e715f33b64f323e
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/gpu/i915:64: ./drivers/gpu/drm/i915/gt/intel_workarounds.c:32: WARNING: Inline emphasis start-string without end-string.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
