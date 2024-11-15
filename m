Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768AD9CDD43
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 12:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFADA10E84A;
	Fri, 15 Nov 2024 11:10:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mko7yFdP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3977210E002;
 Fri, 15 Nov 2024 11:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731669057; x=1763205057;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=inicd7qMAXnWNGd+kIssvayBlHuA+3dQZDjZmsPDGUY=;
 b=mko7yFdPfPRHl+PJitN0EWRE2hgo0wBSVk2kJYs8qZLfqVJGgKR77Yes
 VQqg1sWLhtlH74yNNRTzGJKGyBusYxCCXe8p3hJ/ZBMjkipZjL3thdTQk
 RMsRo+eqqy6f4TVwGIfyhl7YxXHoGWW+C8LbsUT52HA8pn+VHbyn4wbEc
 3ux/pIpmY6n7f+6XhX6tBe75+M9t9DgkswhA7vCQL0P+jJbNu2YMCPX90
 HuGnznJNv0shVaBHGk5nKJKlerWobVa4k5QjJYwYD/m1N/BbGNGhjuFZX
 nr0QbUv23lCmQlKJWD9Zk6t/kHd0tW+P7gpTWB6P4ysagKWN83s5f114A g==;
X-CSE-ConnectionGUID: k0mJVDbKT8m/+5cw+dWITg==
X-CSE-MsgGUID: Kf9yh/FIT4Wc6qwQfRMtbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="57088006"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="57088006"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 03:10:56 -0800
X-CSE-ConnectionGUID: OvvfHNylTme7qaEqkaPPTg==
X-CSE-MsgGUID: taTsBs9rRSyzsTeO/UHYJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="88695222"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.246.56])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 03:10:51 -0800
Date: Fri, 15 Nov 2024 12:10:41 +0100
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
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-xe-next-fixes
Message-ID: <ZzcsMT_FEqBE0cAW@fedora>
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

A single NULL ptr deref fix this week.

Thanks,
Thomas

drm-xe-next-fixes-2024-11-15:
Driver Changes:
- Fix a NULL pointer deref (Everest K.C.)

The following changes since commit 56b70bf9ec460ad7d7d94dfb7a54a8829741e16e:

  Merge tag 'drm-misc-next-2024-11-08' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next (2024-11-11 12:10:49 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2024-11-15

for you to fetch changes up to 6d9f9115c091c88cacf78734d8ea34c8609e8680:

  drm/xe/guc: Fix dereference before NULL check (2024-11-14 14:55:01 +0100)

----------------------------------------------------------------
Driver Changes:
- Fix a NULL pointer deref (Everest K.C.)

----------------------------------------------------------------
Everest K.C. (1):
      drm/xe/guc: Fix dereference before NULL check

 drivers/gpu/drm/xe/xe_guc_capture.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
