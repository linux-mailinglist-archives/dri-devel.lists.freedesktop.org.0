Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3F272408F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 13:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D03C10E21F;
	Tue,  6 Jun 2023 11:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFE510E21F;
 Tue,  6 Jun 2023 11:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686049937; x=1717585937;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:to:subject:from:cc:message-id:date;
 bh=Hny5tNm2JvoOCazlWLYnJ5ZVMcMCAdG9E5+PlKRxZ+M=;
 b=FReFkWXUjfB603LBKe8pcI7xNF4XKTa9UpMqp1frW9lxVx87NHs41JWr
 S0qtl9lUn/xiIyH14CWy0NCuqt+8Rn6yk+FP3E1we6W4tmnEVgMq3fJZ3
 tuwgW2/9R/v3lYoGkWhLdHAZKNdMUWP0f6WTDMofCmvx0d6d3Y/HCl8dC
 u7SWYAma4C7cdwdLfhYZZvQn62/kfgu6adsxlSm113aZlZn9JoSGXoARf
 bbgQg+CSgJEV9axopZDyPNQ8S4uEwMy1/JkPgS/7fCLorMON852mzexJ2
 xaAnGH9D5EHRuKfN1qbuRe6zgGBr//jH2gxspUxOV9csGfIxHln9RTgJm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="443015226"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="443015226"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 04:12:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="712170491"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="712170491"
Received: from qfortuin-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.20.157])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 04:12:06 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZH8H3ovN20uVO+tK@ashyti-mobl2.lan>
References: <20230606100042.482345-1-andi.shyti@linux.intel.com>
 <20230606100042.482345-2-andi.shyti@linux.intel.com>
 <ec219702-8608-e919-cbcd-f271646845d1@linux.intel.com>
 <ZH8H3ovN20uVO+tK@ashyti-mobl2.lan>
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v17 1/1] drm/i915: Allow user to set cache at BO creation
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <168604992363.24014.14317865195655387952@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Tue, 06 Jun 2023 14:12:03 +0300
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
Cc: Lihao Gu <lihao.gu@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>, Carl Zhang <carl.zhang@intel.com>,
 Fei Yang <fei.yang@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Andi Shyti (2023-06-06 13:18:06)
> On Tue, Jun 06, 2023 at 11:10:04AM +0100, Tvrtko Ursulin wrote:
> >=20
> > On 06/06/2023 11:00, Andi Shyti wrote:
> > > From: Fei Yang <fei.yang@intel.com>
> > >=20
> > > To comply with the design that buffer objects shall have immutable
> > > cache setting through out their life cycle, {set, get}_caching ioctl's
> > > are no longer supported from MTL onward. With that change caching
> > > policy can only be set at object creation time. The current code
> > > applies a default (platform dependent) cache setting for all objects.
> > > However this is not optimal for performance tuning. The patch extends
> > > the existing gem_create uAPI to let user set PAT index for the object
> > > at creation time.
> > > The new extension is platform independent, so UMD's can switch to usi=
ng
> > > this extension for older platforms as well, while {set, get}_caching =
are
> > > still supported on these legacy paltforms for compatibility reason.
> > > However, since PAT index was not clearly defined for platforms prior =
to
> > > GEN12 (TGL), so we are limiting this externsion to GEN12+ platforms
> > > only. See ext_set_pat() in for the implementation details.
> > >=20
> > > Note: The documentation related to the PAT/MOCS tables is currently
> > > available for Tiger Lake here:
> > > https://www.intel.com/content/www/us/en/docs/graphics-for-linux/devel=
oper-reference/1-0/tiger-lake.html
> > >=20
> > > BSpec: 45101
> > >=20
> > > Mesa support has been submitted in this merge request:
> > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22878
> > >=20
> > > The media driver is supported by the following commits:
> > > https://github.com/intel/media-driver/commit/92c00a857433ebb34ec575e9=
834f473c6fcb6341
> > > https://github.com/intel/media-driver/commit/fd375cf2c5e1f6bf6b43258f=
f797b3134aadc9fd
> > > https://github.com/intel/media-driver/commit/08dd244b22484770a33464c2=
c8ae85430e548000

Andi, let's still get these corrected before merging once the media-driver
revert is completed.

Regards, Joonas

> > > The IGT test related to this change is
> > > igt@gem_create@create-ext-set-pat
> > >=20
> > > Signed-off-by: Fei Yang <fei.yang@intel.com>
> > > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > Acked-by: Jordan Justen <jordan.l.justen@intel.com>
> > > Tested-by: Jordan Justen <jordan.l.justen@intel.com>
> > > Acked-by: Carl Zhang <carl.zhang@intel.com>
> > > Tested-by: Lihao Gu <lihao.gu@intel.com>
> > > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> >=20
> > Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>=20
> Fiuuu! Thanks a lot, Tvrtko!
>=20
> As soon as CI gives green light, I will get this in.
>=20
> Andi
