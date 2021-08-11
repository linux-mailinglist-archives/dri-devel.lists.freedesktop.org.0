Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D573E89FE
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 08:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0C26E0AC;
	Wed, 11 Aug 2021 06:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCFE6E0AB;
 Wed, 11 Aug 2021 06:06:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="194649929"
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; d="scan'208";a="194649929"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 23:06:00 -0700
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; d="scan'208";a="503379058"
Received: from mtiebout-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.53.238])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 23:05:57 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPM=9tyT17Qbd0b46Xap=vGhiicTKko7qCEsFJwOBVsb=_2axA@mail.gmail.com>
References: <CAPM=9tyT17Qbd0b46Xap=vGhiicTKko7qCEsFJwOBVsb=_2axA@mail.gmail.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: missing signoff on drm-intel-gt-next pull
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <162866195438.4169.13003970815194920952@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Wed, 11 Aug 2021 09:05:54 +0300
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

Quoting Dave Airlie (2021-08-11 06:48:39)
> dim: db47fe727e1f ("drm/i915/step:
> s/<platform>_revid_tbl/<platform>_revids"): committer Signed-off-by
> missing.
>=20
> I'm not sure how much pain it is to fix that up, but
> commit db47fe727e1fc516cf60fc9ab8299605ef3c2d54
> Author: Anusha Srivatsa <anusha.srivatsa@intel.com>
> Commit: Matt Roper <matthew.d.roper@intel.com>
>=20
>     drm/i915/step: s/<platform>_revid_tbl/<platform>_revids
>=20
>     Simplify the stepping info array name.
>=20
>     Cc: Jani Nikula <jani.nikula@linux.intel.com>
>     Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
>     Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>     Link: https://patchwork.freedesktop.org/patch/msgid/20210713193635.33=
90052-2-matthew.d.roper@intel.com
>=20
> It's definitely missing an S-o-b by anyone who handled the patch.
>=20
> Let me know if it's insanely painful to fix that.

Added you to the earlier mail thread that discussed the incident.

There are now 277 patches on top of that patch, so means rebasing all of
those and changing the hashes and trying to fixup all the Fixes:.

So it's painful but not insanely so. Let me know if you want the tree
rebased.

Regards, Joonas
