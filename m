Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4F074EB4E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 11:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD6010E353;
	Tue, 11 Jul 2023 09:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E287F10E352;
 Tue, 11 Jul 2023 09:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689069526; x=1720605526;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=1qj29AhuaqnUIMeMpWCtNCeUwRnvR5XYWbfnhRpXIco=;
 b=Ppmec3+hFi+8f6nupWS60xLgqVUtpYtfQw5d1p5awTbDB55a8PpkgyE4
 d2yQ9G6IZpfJw8rq9q8hwCSR2iOXZiNkchXptPvXtu1OeiehegfW/A1TV
 39BZBXWkwxOHtq4fWsR4jZylc4yAHZO8Mlhq2gdKdOATsnKvk97PhjEk9
 QUbAmUd/QHjANgxjIBeAOfThBaksxTtrquQ0WALz2HA3RrBdzCTbBVR6m
 guZO9AB4NWE89+EyYNeDpMmg3dmqXeXpHjrF8zae1NtPf2gK2frT+8Ibv
 StOXbkE79fayBQAc8gqfnjtEW4j4F8xrbTS6a0n+EFZ0m9C+WN+4R6U5Z A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="367158453"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="367158453"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 02:58:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="756284846"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="756284846"
Received: from sneaga-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.52.179])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 02:58:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: John Garry <john.g.garry@oracle.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com
Subject: Re: i915 build issue
In-Reply-To: <ad2601c0-84bb-c574-3702-a83ff8faf98c@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <ad2601c0-84bb-c574-3702-a83ff8faf98c@oracle.com>
Date: Tue, 11 Jul 2023 12:58:36 +0300
Message-ID: <878rbmixbn.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 11 Jul 2023, John Garry <john.g.garry@oracle.com> wrote:
> Hi guys,
>
> Did anyone else notice this build issue on v6.5-rc1:
>
> drivers/gpu/drm/i915/i915_pci.c:143:15: error: expected expression
> before =E2=80=98,=E2=80=99 token
>    GEN3_FEATURES,
>                 ^
> drivers/gpu/drm/i915/i915_pci.c:151:15: error: expected expression
> before =E2=80=98,=E2=80=99 token
>    GEN3_FEATURES,
>                 ^
> drivers/gpu/drm/i915/i915_pci.c:159:15: error: expected expression
> before =E2=80=98,=E2=80=99 token
>    GEN3_FEATURES,
>                 ^
> drivers/gpu/drm/i915/i915_pci.c:166:15: error: expected expression
> before =E2=80=98,=E2=80=99 token
>    GEN3_FEATURES,
>                 ^
> drivers/gpu/drm/i915/i915_pci.c:174:15: error: expected expression
> before =E2=80=98,=E2=80=99 token
>    GEN3_FEATURES,
>                 ^
> drivers/gpu/drm/i915/i915_pci.c:180:15: error: expected expression
> before =E2=80=98,=E2=80=99 token
>    GEN3_FEATURES,
>                 ^
> drivers/gpu/drm/i915/i915_pci.c:186:15: error: expected expression
> before =E2=80=98,=E2=80=99 token
>    GEN3_FEATURES,
>                 ^
> drivers/gpu/drm/i915/i915_pci.c:209:15: error: initialized field
> overwritten [-Werror=3Doverride-init]
>    .has_snoop =3D false,
>                 ^~~~~
> ...
>
> I'm using following gcc:
>
> john@localhost:~/mnt_sda4/john/linux> gcc --version
> gcc (SUSE Linux) 7.5.0
> Copyright (C) 2017 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOS=
E.
>
> I didn't notice anything on dri-devel mailing list about this.

I presume you're using CONFIG_WERROR=3Dy or W=3De.

See [1] and [2]. I'm undecided how we should treat this.


BR,
Jani.


[1] https://lore.kernel.org/r/87wmzezns4.fsf@intel.com
[2] https://gitlab.freedesktop.org/drm/intel/-/issues/8768


--=20
Jani Nikula, Intel Open Source Graphics Center
