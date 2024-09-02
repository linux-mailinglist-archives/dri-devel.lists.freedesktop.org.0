Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E579968341
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 11:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E7D10E276;
	Mon,  2 Sep 2024 09:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FX9XXTGU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E4510E277
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 09:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725269544; x=1756805544;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=vvWZEZ6qZ8OD+HQtruckzZ5u8YapWIkwBoQSy1nJc5k=;
 b=FX9XXTGUPZFrcR0O3RVRX7PTGjVnISI7o1aK+yrfgefifad03xVLDcE7
 /xunywXb0nvdDmBL2sApfUte6YjYFRxbspx4wOvBiAqbo4GdPgfWyZ4M3
 Gd1gUe+ieYEvvnDQW2M+NlgS6kt2d1oMcutLrwojeNOBltzO686iR133F
 IThLLXLfT12iHPWMOuaJ46c/xeWaTqX2xhdfPIvCfz5mqjpqTc/TaVHG1
 f6vMDFpS2Li8Lax9Ax1CotryOnxWwDevLcGWMsifgA7Q9JccA6/8TaVN/
 hFJ80gmrcy0E17Oad+OmAtjBP9MzAwDJF4zZHtfAGBbfXHDqQYD4iM2Pp g==;
X-CSE-ConnectionGUID: FZE4EtNDTuOtyN2NoL8tIQ==
X-CSE-MsgGUID: BKpPu6xrRW6dhA8KVS/A8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="26745093"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="26745093"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 02:32:23 -0700
X-CSE-ConnectionGUID: +qAmpj7nSyqX+ewj0owl5Q==
X-CSE-MsgGUID: I1GbNqO4TFO8g5jU9dKTKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="95268241"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO [10.245.244.77])
 ([10.245.244.77])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 02:32:20 -0700
Message-ID: <440d041982f7f232f0ce3284bed4db391adb05c1.camel@linux.intel.com>
Subject: Re: [git pull] drm fixes for 6.11-rc6
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Linus Torvalds
 <torvalds@linux-foundation.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, 
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, lingshan.zhu@amd.com, "Koenig, Christian"
 <Christian.Koenig@amd.com>, Matthew Brost <matthew.brost@intel.com>
Date: Mon, 02 Sep 2024 11:32:17 +0200
In-Reply-To: <CAPM=9txF4+rC_CXQTftPctUd0N37t306YKcV3oKPjz+_zQGqag@mail.gmail.com>
References: <CAPM=9tzX71UKndfu8JECMOzc9kf4s4pp9cWTMWwE476cQXt_Yw@mail.gmail.com>
 <CAHk-=wijFJM9MHvwGSS4ADs8ncRagrXYi2E9SvhK8coMH32D7A@mail.gmail.com>
 <CAPM=9txF4+rC_CXQTftPctUd0N37t306YKcV3oKPjz+_zQGqag@mail.gmail.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
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

On Mon, 2024-09-02 at 08:13 +1000, Dave Airlie wrote:
> On Fri, 30 Aug 2024 at 12:32, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >=20
> > On Fri, 30 Aug 2024 at 14:08, Dave Airlie <airlied@gmail.com>
> > wrote:
> > >=20
> > > The TTM revert is due to some stuttering graphical apps probably
> > > due
> > > to longer stalls while prefaulting.
> >=20
> > Yeah, trying to pre-fault a PMD worth of pages in one go is just
> > crazy talk.
> >=20
> > Now, if it was PMD-aligned and you faulted in a single PMD, that
> > would
> > be different. But just doing prn_insert_page() in a loop is insane.
> >=20
> > The code doesn't even stop when it hits a page that already
> > existed,
> > and it keeps locking and unlocking the last-level page table over
> > and
> > over again.
> >=20
> > Honestly, that code is questionable even for the *small* value,
> > much
> > less the "a PMD size" case.
> >=20
> > Now, if you have an array of 'struct page *", you can use
> > vm_insert_pages(), and that's reasonably efficient.
> >=20
> > And if you have a *contiguous* are of pfns, you can use
> > remap_pfn_range().
> >=20
> > But that "insert one pfn at a time" that the drm layer does is
> > complete garbage. You're not speeding anything up, you're just
> > digging
> > deeper.


>=20
> I wonder if there is functionality that could be provided in a common
> helper, by the mm layers, or if there would be too many locking
> interactions to make it sane,
>=20
> It seems too fraught with danger for drivers or subsystems to be just
> doing this in the simplest way that isn't actually that smart.

Hmm. I see even the "Don't error on prefaults" check was broken at some
point :/.

There have been numerous ways to try to address this,

The remap_pfn_range was last tried, at least in the context of the i915
driver IIRC by Christoph Hellwig but had to be ripped out since it
requires the mmap_lock in write mode. Here we have it only in read
mode.

Then there's the apply_to_page_range() used by the igfx functionality
of the i915 driver. I don't think we should go that route without
turning it into something like vm_insert_pfns() with proper checking.
This approach populates all entries of a buffer object.

Finally there's the huge fault attempt that had to be ripped out due to
lack of pmd_special and pud_special flags and resulting clashes with
gup_fast.

Perhaps a combination of the two latter if properly implemented would
be the best choice.

/Thomas

>=20
> Dave.

