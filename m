Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E03F56EB307
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 22:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE74410EF0E;
	Fri, 21 Apr 2023 20:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA8410E05C;
 Fri, 21 Apr 2023 20:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682110132; x=1713646132;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=xSxRO8iiXGSkKzGat90zKWmdtibsD7ihmljrQYZiOnc=;
 b=isThppcOJ1KZGXifbY4V84O7o/et/E+dKZeL94wBa1QpFb4K7aF557vn
 5QyxJLYRmBBPr1t3YFrrC/cu4rpARL6Txqiq+UJsS9p8u20nYX8xPky4V
 wQeUo+JI7Po1bkmQahsnnCEvY3spo/sfm+T1aUylxlQtcAR3PMpGS/Hxj
 5VbMO4e8+jPBrjqHkv1htsEF8OtoQfRcbCyKlOVtr4t9VOSAuo2VmPFy6
 adi5F+m3sPeQSjqrt6iZtzPuE33i8wKudKIF1rvT3kdZ3IBAEM6PngPLw
 35raEYEL9f+Ezpuwpc4RloGkrufPQKxB86BL0pL3ufSbP+zIPaQFn954l A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="326409209"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="326409209"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 13:48:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="695059778"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="695059778"
Received: from miyoungj-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.209.56.12])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 13:48:50 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <BYAPR11MB2567A1A450448AE17B38ED1C9A639@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-9-fei.yang@intel.com>
 <ZEEkV3XOdmtYWnMv@ashyti-mobl2.lan>
 <471addf7-1670-32cd-9d2e-3f94d6825eab@linux.intel.com>
 <BYAPR11MB2567A1A450448AE17B38ED1C9A639@BYAPR11MB2567.namprd11.prod.outlook.com>
Subject: Re: [Intel-gfx] [PATCH 8/8] drm/i915: Allow user to set cache at BO
 creation
From: Jordan Justen <jordan.l.justen@intel.com>
To: "Yang, Fei" <fei.yang@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Fri, 21 Apr 2023 13:48:49 -0700
Message-ID: <168211012988.392286.16107510619704913123@jljusten-skl>
User-Agent: alot/0.10
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, "Das,
 Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-20 09:11:18, Yang, Fei wrote:
> > On 20/04/2023 12:39, Andi Shyti wrote:
> >> Hi Fei,
> >>
> >>> To comply with the design that buffer objects shall have immutable
> >>> cache setting through out their life cycle, {set, get}_caching ioctl's
> >>> are no longer supported from MTL onward. With that change caching
> >>> policy can only be set at object creation time. The current code
> >>> applies a default (platform dependent) cache setting for all objects.
> >>> However this is not optimal for performance tuning. The patch extends
> >>> the existing gem_create uAPI to let user set PAT index for the object
> >>> at creation time.
> >>> The new extension is platform independent, so UMD's can switch to usi=
ng
> >>> this extension for older platforms as well, while {set, get}_caching =
are
> >>> still supported on these legacy paltforms for compatibility reason.
> >>>
> >>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> >>> Cc: Matt Roper <matthew.d.roper@intel.com>
> >>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> >>> Signed-off-by: Fei Yang <fei.yang@intel.com>
> >>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> >>
> >> because this is an API change, we need some more information
> >> here.
> >>
> >> First of all you need to CC the userspace guys that have been
> >> working on top of your series and get their ack's.
> >
> > Yes, and a link to a Mesa merge request which uses the uapi should be
> > included.
>=20
> Working with Mesa team on this, stay tuned.
>=20

I would like to see the extension detection issue is handled before
ack'ing this.

How about a new DRM_I915_QUERY_GEM_CREATE_EXTENSIONS item, that
returns a u64 array of usable extension names for
DRM_IOCTL_I915_GEM_CREATE_EXT?

A similar DRM_I915_QUERY_GEM_CONTEXT_CREATE_EXTENSIONS could also
provide an alternative to Alan's "drm/i915/uapi/pxp: Add a GET_PARAM
for PXP", and more easily allow advertising future new extensions for
context/buffer creation.

-Jordan
