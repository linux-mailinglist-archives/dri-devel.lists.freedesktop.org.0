Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BB062D58D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 09:54:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AD010E583;
	Thu, 17 Nov 2022 08:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E71A10E57F;
 Thu, 17 Nov 2022 08:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668675266; x=1700211266;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=s7QCnerC0XNVQ5ZtCOUEKRwtqBdJeutcYxAuu+4e4eY=;
 b=PdazqrSWNfGi7goJUIkKMSNULf5gD+XpdJIgHlcNZ2vFwzXAKuT3p4rL
 O1abJhpos3i2PiZQ/eSP0CTK7J+QBDZjYAC39DOcWD+Q3gOBiN8rOQNYJ
 X0/e6HP96Erhzoxt4sPms2HqWV6pmBQEsqGnYgvuNrhFSVjeh+5PK7zZs
 kBXk67GDmSXPlPUt0XAI+bUXtXnkMjOX+PfUHOV/1ZiFPDUJ3pFufejgO
 O0lv/JWxUFLJMhjcAfZiRCxJ43uNp6uLVedOnGCj1ENtZDSA0/8MSgqlK
 VEo8FOfvU9f13kXR+bcDS+XLvYeso3Ca/KvkQoN0179oLXLDezqH6kOFp A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="293193673"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="293193673"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 00:54:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="672740787"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="672740787"
Received: from neerajde-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.200.114])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 00:54:21 -0800
Date: Thu, 17 Nov 2022 08:54:19 +0000
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <Y3X2bNJ/4GR1BAiG@tursulin-desk>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Just one fix for the release candidate window this week and that is for
a possible use-after-free on discrete platforms with small BAR.

Regards,

Tvrtko

drm-intel-fixes-2022-11-17:
- Fix uaf with lmem_userfault_list handling (Matthew Auld)
The following changes since commit 094226ad94f471a9f19e8f8e7140a09c2625abaa:

  Linux 6.1-rc5 (2022-11-13 13:12:55 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-11-17

for you to fetch changes up to 4f68332b2f89ab84285e5b6cb3d30e8b9894bef1:

  drm/i915/ttm: fix uaf with lmem_userfault_list handling (2022-11-14 09:46:06 +0000)

----------------------------------------------------------------
- Fix uaf with lmem_userfault_list handling (Matthew Auld)

----------------------------------------------------------------
Matthew Auld (1):
      drm/i915/ttm: fix uaf with lmem_userfault_list handling

 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
