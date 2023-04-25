Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AB26EE778
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 20:20:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782E010E151;
	Tue, 25 Apr 2023 18:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35A110E0A9;
 Tue, 25 Apr 2023 18:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682446799; x=1713982799;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=6Z2AM4xrsQEB+9d6uQ4pnrhzROqLvbE4l793iUoVGqg=;
 b=bPTCH3bHu6iYwcGONkQGr2MAzj/ZOm/l1aF2FOoeOq696poL7jVfs5te
 yQxSfRXwtkSoYAjV9CTK3NY5WpOfGQWD2btqG11tZ1Bbj1y3YBscS/SFW
 Omhdx7/dVMPy82RzwlZoBnShiL6ugorLatEm4MjiMSx4zBHXIwbHkcB++
 zkmP44ZucqaVKNVSHql+6zY78mefanxVUuBLmCkwHznSmi0s1e/oJM/OO
 MciA1OKVG52QLyUohDN4S9r3BkPOFbmP0Owb0n/nJuCMLRETyxyWmukyG
 Mi2PXgqf39PVTk8HJuJo6CX0unGRMDKfRylpr8g61EzYI1NRvpCBIFL1u A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="345614345"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="345614345"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 11:19:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="837550899"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="837550899"
Received: from fyang16-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.212.168.41])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 11:19:58 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <168243011485.13318.1376529380245430200@jlahtine-mobl.ger.corp.intel.com>
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <ZEEkV3XOdmtYWnMv@ashyti-mobl2.lan>
 <471addf7-1670-32cd-9d2e-3f94d6825eab@linux.intel.com>
 <BYAPR11MB2567A1A450448AE17B38ED1C9A639@BYAPR11MB2567.namprd11.prod.outlook.com>
 <168211012988.392286.16107510619704913123@jljusten-skl>
 <BYAPR11MB2567F03AD43D7E2DE2628D5D9A669@BYAPR11MB2567.namprd11.prod.outlook.com>
 <168232538771.392286.3227368099155268955@jljusten-skl>
 <5d0e2cf4-a487-1a1e-dae9-4fbe8c2fe649@linux.intel.com>
 <168235638024.392286.14697291321034695564@jljusten-skl>
 <168243011485.13318.1376529380245430200@jlahtine-mobl.ger.corp.intel.com>
Subject: Re: IOCTL feature detection (Was: Re: [Intel-gfx] [PATCH 8/8]
 drm/i915: Allow user to set cache at BO creation)
From: Jordan Justen <jordan.l.justen@intel.com>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Yang,
 Fei" <fei.yang@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Tue, 25 Apr 2023 11:19:57 -0700
Message-ID: <168244679731.392286.18325463358448012053@jljusten-skl>
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
 Intel-gfx@lists.freedesktop.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, "Das,
 Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-25 06:41:54, Joonas Lahtinen wrote:
> (+ Faith and Daniel as they have been involved in previous discussions)
>=20
> Quoting Jordan Justen (2023-04-24 20:13:00)
> > On 2023-04-24 02:08:43, Tvrtko Ursulin wrote:
> > >=20
> > > Being able to "list" supported extensions sounds like a reasonable
> > > principle, albeit a departure from the design direction to date.
> > > Which means there are probably no quick solutions. Also, AFAIU, only
> > > PXP context create is the problematic one, right? Everything else is
> > > pretty much instant or delayed allocation so super cheap to probe by
> > > attempting to use.
> > >=20
> > > If I got that right and given this series is about
> > > drm_i915_gem_create_ext I don't think this side discussion should be
> > > blocking it.
> >=20
> > This still leaves the issue of no reasonable detection mechanism for
> > the extension.
>=20
> I remember this exact discussion being repeated at least a few times in
> the past 5 years. Previously the conclusion was always that detection by
> trying to use the extension leads to least amount of uAPI surface. There
> is also no concern of having mismatch in backporting of the query and the
> functionality patches.
>=20
> Why exactly do you think it is more reasonable to do the following?
>=20
> check_if_extension_query_is_supported();
> <check retval>
> check_if_extension_xyz_is_supported();
> <check retval>

As I've mentioned a couple times, I'm asking for query item that
returns it all the extensions that conceivably could work.

In theory it could be made a single query item which somehow then
enumerates if something is a context extension or bo extension. But,
it seems simpler for all if we just have a couple query items
returning a simple u64 array for the few classes of extensions.

> VS
>=20
> create_[context,buffer,whatever]_with_extension();
> <check errno>
> destroy_[context,buffer,whatever]();
>=20
> For contexts and buffers there's no overhead,

There's no-overhead to creating and destroying things? I think the 8s
timeout when trying create a protected content context shows it's not
always quite that simple.

Over time userspace will have to continue growing this set of
create/destroy tests as new extensions are added. Simply so we can
discover what extensions are supported.

This doesn't seem like a very robust way to advertise extensions for
an api.

Another point ... say you need to debug why some simple app is failing
to start the driver. One tool might be strace. But now you have a
bunch of noise of calls from the driver creating and destroying things
just to discover what extensions the kernel supports. It would be nice
if all this was handled with a query item vs a bunch of
create/destroys.

> and we're keeping the uAPI surface smaller (less bugs, less
> validation effort).

I understand wanting to keep the kernel uapi and implementation
simple.

Is it too complicated to return a u64 array for a query item
indicating the extensions supported for the various classes of
extensions? I think in most cases it'll just be essentially shuffling
across an array of u64 items. (Since most known extensions will always
be supported by the kernel.)

> Additionally we support checking combinations of extensions A, B and
> C without extra effort.

Regarding combinations of extensions, is that really something
userspace needs to probe? I would think if userspace knows about the
possible extensions, then it's on userspace to use combinations
appropriately.

But, in detecting extensions, it is possible that, say extension B
relies on extension A. Now userspace may have to probe to see if
extension A is supported, and then probe for extension B while using
extension A. Essentially, probing for an extension could become a bit
complicated. Vs the kernel just giving us a u64 array of known
extensions...

-Jordan
