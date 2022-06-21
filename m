Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AD2552E68
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 11:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1889A10EFC0;
	Tue, 21 Jun 2022 09:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD2D10E292;
 Tue, 21 Jun 2022 09:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655804045; x=1687340045;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qoLU5bfn71M3ZU+W4I45jj7MFE1YSG68aNN32RzwgEw=;
 b=n0l1dwtTB6teUw8WZzAKEEwSD+Hm3dMN5nishw9ItaX9cuIcDXmJBWag
 +GhEqOuE0jdw4AIGwebMbNKf3FXxANqzSDBysfi7woewTe6AIPjK9D+l9
 dBaktGyIg+HNFvDyTjFObetDbtE+GGBuATb9A42A9xN6tu0gWPNN3v/C5
 +gYR7U1q2nt7lKaPwv5eVdmaheg+38pG3J2/FqTG85J82QRQBN4eCPdHk
 5UyrBz5BtsWcObygPxbB/cCrxI4CKokNR55skkN/vglWJP4zF+EBWDdMt
 woaXOekxUv6ZgpKz5Mp9HibBcZX5jS49IrEVANqK6k8AcGAdZr+9Mnp19 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="280807417"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="280807417"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 02:34:04 -0700
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="655061421"
Received: from djustese-mobl.ger.corp.intel.com (HELO [10.249.254.174])
 ([10.249.254.174])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 02:34:03 -0700
Message-ID: <ccb7b41555d2d3cd29baa8bed840567451a6d83f.camel@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 09/10] drm/i915: turn on small BAR support
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Das, Nirmoy" <nirmoy.das@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 21 Jun 2022 11:34:01 +0200
In-Reply-To: <20680d19-2b2c-583e-ce79-032f0a21e128@linux.intel.com>
References: <20220525184337.491763-1-matthew.auld@intel.com>
 <20220525184337.491763-10-matthew.auld@intel.com>
 <7cf923bd-ae17-24fb-24de-1a53aee34630@linux.intel.com>
 <d63ce1b2-cd44-665b-2b42-19dea4cc6f1c@intel.com>
 <20680d19-2b2c-583e-ce79-032f0a21e128@linux.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-5.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 Kenneth Graunke <kenneth@whitecape.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-06-21 at 11:05 +0200, Das, Nirmoy wrote:
> 
> On 6/21/2022 10:38 AM, Matthew Auld wrote:
> > On 17/06/2022 13:33, Thomas Hellström wrote:
> > > 
> > > On 5/25/22 20:43, Matthew Auld wrote:
> > > > With the uAPI in place we should now have enough in place to
> > > > ensure a
> > > > working system on small BAR configurations.
> > > > 
> > > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > > > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > > > Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> > > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > Cc: Jordan Justen <jordan.l.justen@intel.com>
> > > > Cc: Kenneth Graunke <kenneth@whitecape.org>
> > > > Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/i915/gt/intel_region_lmem.c | 10 ++++------
> > > >   1 file changed, 4 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c 
> > > > b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> > > > index e9c12e0d6f59..6c6f8cbd7321 100644
> > > > --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> > > > +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> > > > @@ -111,12 +111,6 @@ static struct intel_memory_region 
> > > > *setup_lmem(struct intel_gt *gt)
> > > >           flat_ccs_base = intel_gt_read_register(gt, 
> > > > XEHPSDV_FLAT_CCS_BASE_ADDR);
> > > >           flat_ccs_base = (flat_ccs_base >>
> > > > XEHPSDV_CCS_BASE_SHIFT) 
> > > > * SZ_64K;
> > > > -        /* FIXME: Remove this when we have small-bar enabled
> > > > */
> > > > -        if (pci_resource_len(pdev, 2) < lmem_size) {
> > > > -            drm_err(&i915->drm, "System requires small-BAR
> > > > support, 
> > > > which is currently unsupported on this kernel\n");
> > > > -            return ERR_PTR(-EINVAL);
> > > > -        }
> > > > -
> > > >           if (GEM_WARN_ON(lmem_size < flat_ccs_base))
> > > >               return ERR_PTR(-EIO);
> > > > @@ -169,6 +163,10 @@ static struct intel_memory_region 
> > > > *setup_lmem(struct intel_gt *gt)
> > > >       drm_info(&i915->drm, "Local memory available: %pa\n",
> > > >            &lmem_size);
> > > > +    if (io_size < lmem_size)
> > > > +        drm_info(&i915->drm, "Using a reduced BAR size of
> > > > %lluMiB. 
> > > > Consider enabling the full BAR size if available in the
> > > > BIOS.\n",
> > > > +             (u64)io_size >> 20);
> > > > +
> > > 
> > > Hmm. I wonder what BIOS uis typically call the mappable portion
> > > of 
> > > VRAM. I'll se if I can check that on my DG1 system. Might be that
> > > an 
> > > average user misinterprets "full BAR".
> > 
> > "PCI Subsystem settings" -> "Above 4G memory [enabled/disabled]"
> > 
> > Sample size of one though.
> > 
> > Maybe s/full BAR size/full memory size/ ?
> 
> 
> Or  s/full BAR size/re-sizable BAR/
> 
> In newer BIOS, there is a more direct option to enable re-sizable
> bar: 
> "Re-Size BAR"/"Resizable BAR".

A quick googling turns up "Resizable BAR". My Asus Bios on the DG1
machine says "ReSize BAR (Resizable BAR support to harness full GPU
memory)".

So "Resizable BAR" should hopefully be understood by most people. Not
sure though if this is the same as "Above 4G memory", although the
latter must be a prerequisite I assume. 

/Thomas



> 
> 
> Nirmoy
> 
> > 
> > > 
> > > /Thomas
> > > 
> > > 
> > > 
> > > >       return mem;
> > > >   err_region_put:


