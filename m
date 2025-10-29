Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CADC1A186
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 12:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C257510E7A7;
	Wed, 29 Oct 2025 11:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QikJlqny";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4C510E7AC;
 Wed, 29 Oct 2025 11:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MZC9LcALFawU+sjP7r9opzWpptxerG35I28k8oNPkcU=; b=QikJlqny7WUoDbPoVNaPlK9dAN
 4IRpO9Zs0UHf8uyMuYPs39cILQ9H71fa1JND9kR7Gv9pKwl3+3yP0I1Dx8odGvE7deQ2p5xxafKL9
 53E2HuTGSkUqleEgctlrX7Ga7fV/DEe91pWAGSyB0SFGuhVPKlaQ8xO6f0buTwbnCkvYTzx76tw+0
 WeIY4Lb4HJqm05I0pRGsLFz0dZCqUsHf5nV0avcKz7k8JGh60ueLs+BO6nyV0vYcEADZiLT/8UebM
 w7ocLdGmNcroAl6bv4utFy+t1xWl5XEZNBJi66wsPR1EldTP/SE6SEgTIVRrprehbYaprKO6Y83wp
 MRyT4bKQ==;
Received: from [90.242.12.242] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vE4an-00GalV-08; Wed, 29 Oct 2025 12:43:53 +0100
Date: Wed, 29 Oct 2025 11:43:51 +0000
From: Tvrtko Ursulin <tursulin@igalia.com>
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
Subject: [PULL] drm-intel-gt-next
Message-ID: <aQH994lQI_iVPzTI@linux>
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


Hi Dave, Sima,

First drm-intel-gt-next pull request for 6.19 with only small fixups
relating to pwrite error code handling, GuC engine busyness reporting and
GuC reset handling. Plus a typo and a selftest fix.

One cross merge to synchronise the branches.

Regards,

Tvrtko

drm-intel-gt-next-2025-10-29:
Driver Changes:

Fixes/improvements/new stuff:

- Set O_LARGEFILE in __create_shmem() (Taotao Chen)
- Fix incorrect error handling in shmem_pwrite() (Taotao Chen)
- Skip GuC communication warning on reset in progress [guc] (Zhanjun Dong)
- Fix conversion between clock ticks and nanoseconds [guc] (Umesh Nerlige Ramappa)

Miscellaneous:

- Avoid accessing uninitialized context in emit_rpcs_query() [selftests] (Krzysztof Karas)
- Fix typo in comment (I915_EXEC_NO_RELOC) [gem] (Marlon Henrique Sanches)

Backmerges:

- Merge drm/drm-next into drm-intel-gt-next (Joonas Lahtinen)
The following changes since commit 5770495279d79514989b00fe9ef0ff487bf2e54e:

  Merge tag 'exynos-drm-next-for-v6.18' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-next (2025-09-16 10:35:52 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-gt-next-2025-10-29

for you to fetch changes up to 2ada9cb1df3f5405a01d013b708b1b0914efccfe:

  drm/i915: Fix conversion between clock ticks and nanoseconds (2025-10-16 14:40:22 -0700)

----------------------------------------------------------------
Driver Changes:

Fixes/improvements/new stuff:

- Set O_LARGEFILE in __create_shmem() (Taotao Chen)
- Fix incorrect error handling in shmem_pwrite() (Taotao Chen)
- Skip GuC communication warning on reset in progress [guc] (Zhanjun Dong)
- Fix conversion between clock ticks and nanoseconds [guc] (Umesh Nerlige Ramappa)

Miscellaneous:

- Avoid accessing uninitialized context in emit_rpcs_query() [selftests] (Krzysztof Karas)
- Fix typo in comment (I915_EXEC_NO_RELOC) [gem] (Marlon Henrique Sanches)

Backmerges:

- Merge drm/drm-next into drm-intel-gt-next (Joonas Lahtinen)

----------------------------------------------------------------
Joonas Lahtinen (1):
      Merge drm/drm-next into drm-intel-gt-next

Krzysztof Karas (1):
      drm/i915/gem: Avoid accessing uninitialized context in emit_rpcs_query()

Marlon Henrique Sanches (1):
      drm/i915/gem: fix typo in comment (I915_EXEC_NO_RELOC)

Taotao Chen (2):
      drm/i915: set O_LARGEFILE in __create_shmem()
      drm/i915: Fix incorrect error handling in shmem_pwrite()

Umesh Nerlige Ramappa (1):
      drm/i915: Fix conversion between clock ticks and nanoseconds

Zhanjun Dong (1):
      drm/i915/guc: Skip communication warning on reset in progress

 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          | 22 +++++++++++++++++++---
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |  3 ++-
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c     |  4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |  9 ++++++++-
 5 files changed, 32 insertions(+), 8 deletions(-)
