Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CFEB3697A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 16:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA1B10E675;
	Tue, 26 Aug 2025 14:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SWg78eaE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C1610E671;
 Tue, 26 Aug 2025 14:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756218446; x=1787754446;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kTvCH26GLT58m81s+RpuAy0MqgcReykTYLyTUiW6VuY=;
 b=SWg78eaEmCb85ScvWX4DxKuPN8hgsV0tHH8XjtEw0qlDTTwHKqNGRuLm
 KX00IPHnLj+lUqaN2qvoJZ6a4y9xKgfuJ1rBUsVfF/oJuBY4pZkq6WDB1
 fRfBTzS045O+imFS83sgfF7A743L1VLq+/PWtcpCJtfY3jyYY5vDkyhwq
 OhYagz6m1JlSPMR+lkEHi6uZMumcw3N3IEvQrSDfm3LodeQfzXKUMKCmB
 yq6NFA1WcEi5bnL8qrRGQRXMlxU8pZX58i2DE4ot+JsA7X9BExyqIP995
 k2Xk57DEn5/oA3BhX7imA90kVHfnQHtQpJlt7jkhRzDRZWI4jJaYhmcW+ A==;
X-CSE-ConnectionGUID: h7UMaRbaTAm+KNgrPHPgXQ==
X-CSE-MsgGUID: FwulIZ16TVCgW1la0R08BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="62271600"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="62271600"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 07:27:26 -0700
X-CSE-ConnectionGUID: /Ux3JAQ+RF2Gn3IpcpMSPg==
X-CSE-MsgGUID: AOXlYmKdTuSi6JoiCz5NMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169992784"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.245.235])
 ([10.245.245.235])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 07:27:23 -0700
Message-ID: <b297fb4289ceaf36e8a9a237a7b2ac8d5f373158.camel@linux.intel.com>
Subject: Re:
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, David
 Hildenbrand <david@redhat.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 	dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, x86@kernel.org
Cc: airlied@gmail.com, matthew.brost@intel.com, dave.hansen@linux.intel.com,
 luto@kernel.org, peterz@infradead.org, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>
Date: Tue, 26 Aug 2025 16:27:21 +0200
In-Reply-To: <a01f7ca8-7930-4b04-b597-0ebf8500a748@amd.com>
References: <20250820143739.3422-1-christian.koenig@amd.com>
 <edf4aee5-54eb-4fad-aa89-4913d44371fe@redhat.com>
 <4e5f4ef0-53f1-417e-8f3b-76fd7c64cd23@amd.com>
 <f983521c-b43d-4245-93fc-fcb847908573@redhat.com>
 <a1b95d23-1908-42c1-8ff6-da051fc140aa@amd.com>
 <6591105b-969d-44d6-80e1-233c1b84b121@redhat.com>
 <fc3e013c-e7f7-441d-a638-2ee3dd372775@amd.com>
 <75aca34d-3557-49e9-a523-bd3244c28190@redhat.com>
 <a01f7ca8-7930-4b04-b597-0ebf8500a748@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

Hi, Christian,

On Tue, 2025-08-26 at 11:56 +0200, Christian K=C3=B6nig wrote:
> On 26.08.25 11:17, David Hildenbrand wrote:
> > On 26.08.25 11:00, Christian K=C3=B6nig wrote:
> > > On 26.08.25 10:46, David Hildenbrand wrote:
> > > > > > So my assumption would be that that is missing for the
> > > > > > drivers here?
> > > > >=20
> > > > > Well yes and no.
> > > > >=20
> > > > > See the PAT is optimized for applying specific caching
> > > > > attributes to ranges [A..B] (e.g. it uses an R/B tree). But
> > > > > what drivers do here is that they have single pages (usually
> > > > > for get_free_page or similar) and want to apply a certain
> > > > > caching attribute to it.
> > > > >=20
> > > > > So what would happen is that we completely clutter the R/B
> > > > > tree used by the PAT with thousands if not millions of
> > > > > entries.
> > > > >=20
> > > >=20
> > > > Hm, above you're saying that there is no direct map, but now
> > > > you are saying that the pages were obtained through
> > > > get_free_page()?
> > >=20
> > > The problem only happens with highmem pages on 32bit kernels.
> > > Those pages are not in the linear mapping.
> >=20
> > Right, in the common case there is a direct map.
> >=20
> > >=20
> > > > I agree that what you describe here sounds suboptimal. But if
> > > > the pages where obtained from the buddy, there surely is a
> > > > direct map -- unless we explicitly remove it :(
> > > >=20
> > > > If we're talking about individual pages without a directmap, I
> > > > would wonder if they are actually part of a bigger memory
> > > > region that can just be reserved in one go (similar to how
> > > > remap_pfn_range()) would handle it.
> > > >=20
> > > > Can you briefly describe how your use case obtains these PFNs,
> > > > and how scattered tehy + their caching attributes might be?
> > >=20
> > > What drivers do is to call get_free_page() or alloc_pages_node()
> > > with the GFP_HIGHUSER flag set.
> > >=20
> > > For non highmem pages drivers then calls set_pages_wc/uc() which
> > > changes the caching of the linear mapping, but for highmem pages
> > > there is no linear mapping so set_pages_wc() or set_pages_uc()
> > > doesn't work and drivers avoid calling it.
> > >=20
> > > Those are basically just random system memory pages. So they are
> > > potentially scattered over the whole memory address space.
> >=20
> > Thanks, that's valuable information.
> >=20
> > So essentially these drivers maintain their own consistency and PAT
> > is not aware of that.
> >=20
> > And the real problem is ordinary system RAM.
> >=20
> > There are various ways forward.
> >=20
> > 1) We use another interface that consumes pages instead of PFNs,
> > like a
> > =C2=A0=C2=A0 vm_insert_pages_pgprot() we would be adding.
> >=20
> > =C2=A0=C2=A0 Is there any strong requirement for inserting non-refcount=
ed
> > PFNs?
>=20
> Yes, there is a strong requirement to insert non-refcounted PFNs.
>=20
> We had a lot of trouble with KVM people trying to grab a reference to
> those pages even if the VMA had the VM_PFNMAP flag set.
>=20
> > 2) We add another interface that consumes PFNs, but explicitly
> > states
> > =C2=A0=C2=A0 that it is only for ordinary system RAM, and that the user=
 is
> > =C2=A0=C2=A0 required for updating the direct map.
> >=20
> > =C2=A0=C2=A0 We could sanity-check the direct map in debug kernels.
>=20
> I would rather like to see vmf_insert_pfn_prot() fixed instead.
>=20
> That function was explicitly added to insert the PFN with the given
> attributes and as far as I can see all users of that function expect
> exactly that.
>=20
> >=20
> > 3) We teach PAT code in pfnmap_setup_cachemode_pfn() about treating
> > this
> > =C2=A0=C2=A0 system RAM differently.
> >=20
> >=20
> > There is also the option for a mixture between 1 and 2, where we
> > get pages, but we map them non-refcounted in a VM_PFNMAP.
> >=20
> > In general, having pages makes it easier to assert that they are
> > likely ordinary system ram pages, and that the interface is not
> > getting abused for something else.
>=20
> Well, exactly that's the use case here and that is not abusive at all
> as far as I can see.
>=20
> What drivers want is to insert a PFN with a certain set of caching
> attributes regardless if it's system memory or iomem. That's why
> vmf_insert_pfn_prot() was created in the first place.
>=20
> That drivers need to call set_pages_wc/uc() for the linear mapping on
> x86 manually is correct and checking that is clearly a good idea for
> debug kernels.

So where is this trending? Is the current suggestion to continue
disallowing aliased mappings with conflicting caching modes and enforce
checks in debug kernels?

/Thomas


>=20
> > We could also perform the set_pages_wc/uc() from inside that
> > function, but maybe it depends on the use case whether we want to
> > do that whenever we map them into a process?
>=20
> It sounds like a good idea in theory, but I think it is potentially
> to much overhead to be applicable.
>=20
> Thanks,
> Christian.

