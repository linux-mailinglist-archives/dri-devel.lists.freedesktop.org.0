Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7DC1F513F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 11:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FFB6E50C;
	Wed, 10 Jun 2020 09:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E3F6E4F8;
 Wed, 10 Jun 2020 09:37:06 +0000 (UTC)
IronPort-SDR: mJQHi7RfB/aLuhZs6TkZQU7mh5Wr/naJSoiVCXppMwB0TuQeP/MFNLebYoyC5lvGOKhVUyYraP
 K9gJyIyVbRgg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2020 02:37:05 -0700
IronPort-SDR: zPOv8xXpqkrvxx+zNTOOtr7lCCJzwEgSYpPJvNuj4exlttKbcEzjYn3rA92iO0QXqKr4/M2BFK
 znCUzNqFaBdg==
X-IronPort-AV: E=Sophos;i="5.73,495,1583222400"; d="scan'208";a="306533665"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.251.92.206])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2020 02:37:02 -0700
Date: Wed, 10 Jun 2020 12:37:00 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <20200610093700.GA8599@jlahtine-desk.ger.corp.intel.com>
MIME-Version: 1.0
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Sending this one early for it to hopefully make it in before -rc1.

Two important fixes: OOPS fix that was missing "Fixes:" tag and
not picked up earlier. Also fix for a use-after-free in cmdparser.

Additional fixup to module param types.

Regards, Joonas

***

drm-intel-next-fixes-2020-06-10:

- Avoid use after free in cmdparser
- Avoid NULL dereference when probing all display encoders
- Fixup to module parameter type

The following changes since commit 8d286e2ff4400d313955b4203fc640ca6fd9228b:

  Merge tag 'drm-intel-next-fixes-2020-06-04' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2020-06-08 11:59:57 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2020-06-10

for you to fetch changes up to 3680c2e9f4254d1f033bf00f540e47a51f8f996b:

  drm/i915/display: Only query DP state of a DDI encoder (2020-06-09 14:47:05 +0300)

----------------------------------------------------------------
- Avoid use after free in cmdparser
- Avoid NULL dereference when probing all display encoders
- Fixup to module parameter type

----------------------------------------------------------------
Chris Wilson (2):
      drm/i915/gem: Mark the buffer pool as active for the cmdparser
      drm/i915/display: Only query DP state of a DDI encoder

Jani Nikula (1):
      drm/i915/params: fix i915.reset module param type

 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 56 ++++++++++++++++++++++----
 drivers/gpu/drm/i915/i915_params.c             |  2 +-
 3 files changed, 52 insertions(+), 9 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
