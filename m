Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A91AE0B07
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 18:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA05510E19C;
	Thu, 19 Jun 2025 16:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="igwa8+ah";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9922310E111;
 Thu, 19 Jun 2025 16:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750349036; x=1781885036;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=g1wuA+3Bm5fjSAmJaxDskX5yucV1m/wl7q9NanZXzi4=;
 b=igwa8+ah+Vb0DahOdX/r/qyXDscmZeDiQ6IFuyegQPcu9IJwk99uo1ZF
 fNL9XmpskynC9slc9u16y9AtohZKIDYSm9Bu5wdqLM46o2QKbKmlYMRJS
 ySoiToaWBr3h4LFeqUtfaK2KQ8ZPfwibiwuGOvttxDVUg31148T0M//gQ
 MpO3O6PvkNWvMVKjfWFlqkFs7xPNbHUGd5JanRxUmHkDP8CjpZWekV8cS
 RNSqE6bw8NN2aTWsLtKMEaBZClL69VEFJjuImVWddOWeizBdFyzWiYJg2
 O/RdDCI+ox4bhkVH7welmhkAJ0kee7SdCTdgSywp/lUvwB5cbz2nYn2XB A==;
X-CSE-ConnectionGUID: D9mk/KO4SdSK3Awk5f48+g==
X-CSE-MsgGUID: ctGb3GwBRL2i/t/GtFu9DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="51715785"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; d="scan'208";a="51715785"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 09:03:56 -0700
X-CSE-ConnectionGUID: wRRBmDLNRJKW6lRUBtru0Q==
X-CSE-MsgGUID: p+T1KRIXT6Krr7FnJqwxlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; d="scan'208";a="151007900"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 09:03:53 -0700
Date: Thu, 19 Jun 2025 18:03:42 +0200
From: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-xe-fixes
Message-ID: <aFQ03kNzhbiNK7gW@fedora>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Simona

Three fixes for -rc3. There are a couple more pending with
non-trivial merge conflicts that need to be properly
backported.

drm-xe-fixes-2025-06-19:
Driver Changes:
- A workaround update (Vinay)
- Fix memset on iomem (Lucas)
- Fix early wedge on GuC Load failure (Daniele)

The following changes since commit 9c7632faad434c98f1f2cc06f3647a5a5d05ddbf:

  drm/xe/lrc: Use a temporary buffer for WA BB (2025-06-12 18:09:50 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-06-19

for you to fetch changes up to a39d082c3553d35b4fe5585e1e2fb221c130cae8:

  drm/xe: Fix early wedge on GuC load failure (2025-06-19 17:24:30 +0200)

----------------------------------------------------------------
Driver Changes:
- A workaround update (Vinay)
- Fix memset on iomem (Lucas)
- Fix early wedge on GuC Load failure (Daniele)

----------------------------------------------------------------
Daniele Ceraolo Spurio (1):
      drm/xe: Fix early wedge on GuC load failure

Lucas De Marchi (1):
      drm/xe: Fix memset on iomem

Vinay Belgaumkar (1):
      drm/xe/bmg: Update Wa_16023588340

 drivers/gpu/drm/xe/xe_gt.c                  | 2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 ++++++++
 drivers/gpu/drm/xe/xe_guc_ct.c              | 7 +++++--
 drivers/gpu/drm/xe/xe_guc_ct.h              | 5 +++++
 drivers/gpu/drm/xe/xe_guc_pc.c              | 2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c          | 3 +++
 6 files changed, 23 insertions(+), 4 deletions(-)
