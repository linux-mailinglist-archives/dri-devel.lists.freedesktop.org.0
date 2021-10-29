Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9215443F783
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 08:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8BD8910A;
	Fri, 29 Oct 2021 06:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F966E9E2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 06:52:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="294064961"
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="294064961"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 23:52:20 -0700
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="448274796"
Received: from shishpan-mobl2.ccr.corp.intel.com (HELO localhost)
 ([10.249.254.23])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 23:52:18 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211029114840.6a3a78bd@canb.auug.org.au>
References: <20211029114840.6a3a78bd@canb.auug.org.au>
To: DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: linux-next: manual merge of the drm tree with Linus' tree
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <163549033603.4317.6416900804800927743@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Fri, 29 Oct 2021 09:52:16 +0300
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

Quoting Stephen Rothwell (2021-10-29 03:48:40)
> Hi all,
>=20
> Today's linux-next merge of the drm tree got a conflict in:
>=20
>   drivers/gpu/drm/i915/i915_trace.h
>=20
> between commit:
>=20
>   9a4aa3a2f160 ("drm/i915: Revert 'guc_id' from i915_request tracepoint")
>=20
> from Linus' tree and commit:
>=20
>   3cb3e3434b9f ("drm/i915/guc: Move fields protected by guc->contexts_loc=
k into sub structure")
>=20
> from the drm tree.
>=20
> I fixed it up (I used the former version) and can carry the fix as
> necessary.

The resolution for the conflict is to drop the guc_id field completely
in linux-next.

Regards, Joonas

> This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
