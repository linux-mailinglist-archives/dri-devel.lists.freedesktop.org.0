Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E98B24F8FF8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 09:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FA610E390;
	Fri,  8 Apr 2022 07:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8AEF10E23B;
 Fri,  8 Apr 2022 07:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649404674; x=1680940674;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=liK3gMhN8QfzHqxpaMqTMFS4xrVbB+MTfKzgumdtbRQ=;
 b=Ziy+jr02N8oVcLrJV27kP5+vmmp5W04XFvFdJiScqZzcDoE6AGo2OM7t
 DqiexoW0jOii7RRPGshyvP+25kGUL+5sOaeH2RDlAZvt1dkOpNorooJSW
 +dPtzVwHuB2TSnKa33D9JOOILgO7RpCK6ZBSG7T/VoM6xD7MkGfvtdxLV
 QsD/1d4uLHAkw4MpWehdaHS4yeBvNa0FTPR5iqZADlmVMB6Nzo/rc/wH7
 hxh/kglGD+pcGE5Gy+hsuhljn21PjFQqeA9BNkGXomfEp6RwZSYe+0Dpn
 w4GsioMHErUuNQQOhGsz9ixNYk2bNDBaidEBe0+jOByuAA6wN3Z+HSIzB Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="241472750"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="241472750"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 00:57:48 -0700
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="525285417"
Received: from mionica-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.148.41])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 00:57:45 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [Intel-gfx] [PATCH 0/4] drm/i915/dg2: Add support for
 render/media decompression
In-Reply-To: <20220404133846.131401-1-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220404133846.131401-1-imre.deak@intel.com>
Date: Fri, 08 Apr 2022 10:57:41 +0300
Message-ID: <874k34j9ca.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Juha-Pekka =?utf-8?Q?Heikkil=C3=A4?= <juha-pekka.heikkila@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 04 Apr 2022, Imre Deak <imre.deak@intel.com> wrote:
> This is a rebased version of patches 15-17 of [1], adding DG2 display
> engine support for decompressing render and media compressed
> framebuffers.
>
> The dependency patches from [1] should be merged already to drm-tip.
>
> It addresses the review comments on the modifier layout description from
> Nanley, updates the commit logs vs. flat CCS and Tile4 and splits out
> the changes adding the modifiers to drm_fourcc.h to separate patches.

Cc'd a bunch more people; ack on merging patches 2 & 4 via drm-intel?

BR,
Jani.


>
> [1] https://patchwork.freedesktop.org/series/95686/
>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Mika Kahola <mika.kahola@intel.com>
> Cc: Juha-Pekka Heikkil=C3=A4 <juha-pekka.heikkila@intel.com>
> Cc: Nanley Chery <nanley.g.chery@intel.com>
>
> Anshuman Gupta (1):
>   drm/i915/dg2: Add support for DG2 clear color compression
>
> Matt Roper (2):
>   drm/fourcc: Introduce format modifiers for DG2 render and media
>     compression
>   drm/i915/dg2: Add support for DG2 render and media compression
>
> Mika Kahola (1):
>   drm/fourcc: Introduce format modifier for DG2 clear color
>
>  drivers/gpu/drm/i915/display/intel_display.c  |  4 +-
>  drivers/gpu/drm/i915/display/intel_fb.c       | 53 +++++++++++++++----
>  .../drm/i915/display/skl_universal_plane.c    | 49 +++++++++++++----
>  include/uapi/drm/drm_fourcc.h                 | 36 +++++++++++++
>  4 files changed, 122 insertions(+), 20 deletions(-)

--=20
Jani Nikula, Intel Open Source Graphics Center
