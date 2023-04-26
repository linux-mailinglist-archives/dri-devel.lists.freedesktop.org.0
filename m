Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E336EF3CE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 13:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E27610E1D9;
	Wed, 26 Apr 2023 11:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEA110E1D9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 11:52:48 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9594916df23so111926066b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 04:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1682509967; x=1685101967;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3hxk5YROwrNNZoV/Bi73gimAPSK78ysJEaiqOjcvI8s=;
 b=iwcyBw7pFWdckvv/DD209FeML1MBPZxMBvg3VGKSMqZopGO+JeW1Pe+ZERpRsncDhw
 NNvmCp95yKNJjuWg7IIA4TznbDKSH+mpxziD97W7D5bddG4pgRPOH+/UnLPqGuyHlM4x
 Lv9nKMIaNaYA6Cs8ceWW+KUBAlztPE6LWiVsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682509967; x=1685101967;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3hxk5YROwrNNZoV/Bi73gimAPSK78ysJEaiqOjcvI8s=;
 b=LXTrmCvHPV0hhvh56QmRsgd1LQiSxZLF6au3qoYzedH4o50zeU0kUo4DaXPu3cskDE
 T6QTFLl+lWtMGxbLUn6cLpR/T6urwSP2hAniS1UXnWGElKGMwnbCB2ATCRTg8Bp8mjRX
 csENVCqMwxt3g0zCoszesMGtW0gHHAnwJLijPiOEFnmEwZwDUqVMoXVp6rIGCYPq0128
 CnFcdeO3NHuF87AaiLXPhzTgr414Q43hm7VRUoBg0+V4j4c04ZnlVJa2js44B7S3rZc9
 aqDdYUO7TWVxfckAifTcUXcaGkfR7uhmXNcUfF08iYwG7IVGiJi8libozbeManOy96Ow
 Wiug==
X-Gm-Message-State: AAQBX9dEthNSDXbSZKBd06w/w4PKMondJxWcrcxYrIULoK7lZVkwSJ82
 331PsJVjY6nSUco3BgRNq0J1bQ==
X-Google-Smtp-Source: AKy350ZAsYhDfAtXnbVZOFO8Ojo8U5XTMQWWXAQ6muGPXbkTJSjT/61DWgIUh541+RW0ngvdhVLuog==
X-Received: by 2002:a17:907:2087:b0:930:7f40:c1bb with SMTP id
 pv7-20020a170907208700b009307f40c1bbmr16977955ejb.4.1682509966606; 
 Wed, 26 Apr 2023 04:52:46 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 w27-20020a17090633db00b0094ed0370f8fsm8221249eja.147.2023.04.26.04.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 04:52:46 -0700 (PDT)
Date: Wed, 26 Apr 2023 13:52:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: IOCTL feature detection (Was: Re: [Intel-gfx] [PATCH 8/8]
 drm/i915: Allow user to set cache at BO creation)
Message-ID: <ZEkQi6Zrb6lR4DEm@phenom.ffwll.local>
References: <20230419230058.2659455-9-fei.yang@intel.com>
 <ZEEkV3XOdmtYWnMv@ashyti-mobl2.lan>
 <471addf7-1670-32cd-9d2e-3f94d6825eab@linux.intel.com>
 <BYAPR11MB2567A1A450448AE17B38ED1C9A639@BYAPR11MB2567.namprd11.prod.outlook.com>
 <168211012988.392286.16107510619704913123@jljusten-skl>
 <BYAPR11MB2567F03AD43D7E2DE2628D5D9A669@BYAPR11MB2567.namprd11.prod.outlook.com>
 <168232538771.392286.3227368099155268955@jljusten-skl>
 <5d0e2cf4-a487-1a1e-dae9-4fbe8c2fe649@linux.intel.com>
 <168235638024.392286.14697291321034695564@jljusten-skl>
 <168243011485.13318.1376529380245430200@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168243011485.13318.1376529380245430200@jlahtine-mobl.ger.corp.intel.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, "Teres Alexis,
 Alan Previn" <alan.previn.teres.alexis@intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>, Intel-gfx@lists.freedesktop.org,
 DRI Development <dri-devel@lists.freedesktop.org>, "Yang,
 Fei" <fei.yang@intel.com>, Chris Wilson <chris.p.wilson@linux.intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, "Das,
 Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 25, 2023 at 04:41:54PM +0300, Joonas Lahtinen wrote:
> (+ Faith and Daniel as they have been involved in previous discussions)
> 
> Quoting Jordan Justen (2023-04-24 20:13:00)
> > On 2023-04-24 02:08:43, Tvrtko Ursulin wrote:
> > > 
> > > Being able to "list" supported extensions sounds like a reasonable
> > > principle, albeit a departure from the design direction to date.
> > > Which means there are probably no quick solutions. Also, AFAIU, only
> > > PXP context create is the problematic one, right? Everything else is
> > > pretty much instant or delayed allocation so super cheap to probe by
> > > attempting to use.
> > > 
> > > If I got that right and given this series is about
> > > drm_i915_gem_create_ext I don't think this side discussion should be
> > > blocking it.
> > 
> > This still leaves the issue of no reasonable detection mechanism for
> > the extension.
> 
> I remember this exact discussion being repeated at least a few times in
> the past 5 years. Previously the conclusion was always that detection by
> trying to use the extension leads to least amount of uAPI surface. There
> is also no concern of having mismatch in backporting of the query and the
> functionality patches.
> 
> Why exactly do you think it is more reasonable to do the following?
> 
> check_if_extension_query_is_supported();
> <check retval>
> check_if_extension_xyz_is_supported();
> <check retval>
> 
> VS
> 
> create_[context,buffer,whatever]_with_extension();
> <check errno>
> destroy_[context,buffer,whatever]();
> 
> For contexts and buffers there's no overhead, and we're keeping the uAPI
> surface smaller (less bugs, less validation effort). Additionally we
> support checking combinations of extensions A, B and C without extra
> effort.
> 
> If we're not returning enough clear errnos, then that is something to
> make sure we do.

Joonas asked me to put my thoughts here:

- in general the "feature discovery by trying it out" approach is most
  robust and hence preferred, but it's also not something that's required
  when there's good reasons against it

- the more a feature spans drivers/modules, the more it should be
  discovered by trying it out, e.g. dma-buf fence import/export was a huge
  discussion, luckily mesa devs figured out how to transparantly fall back
  at runtime so we didn't end up merging the separate feature flag (I
  think at least, can't find it). pxp being split across i915/me/fw/who
  knows what else is kinda similar so I'd heavily lean towards discovery
  by creating a context

- pxp taking 8s to init a ctx sounds very broken, irrespective of anything
  else

- in practice there's not really a combinatorial explosion, for a lot of
  reasons:
  - kernel and userspace tend to assume/require implied features where it
    makes sense, e.g. in kms atomic implies planes and universal planes.
    mesa has been doing the same
  - you cold go all the way to what radeon/amdgpu have done for years with
    a single incrementing version. Probably not flexible enough for intel.
  - every pciid is it's own uapi, so a feature only needs to be tested on
    platforms where it didn't ship from the start. Also cuts down on
    runtime discovery a lot
  - mesa tends to only support down to current lts kernels and not older,
    which again cuts the combinations a lot

- I did look through upstream kernel docs for general (driver) uapi
  recommendations, but there isn't really anything about good taste stuff,
  just a lot about not screwing up compatibility across kernels/platforms.

tldr; prefer discovery, don't sweat it if not, definitely don't
overengineer this with some magic "give me all extensions" thing because
that results in guaranteed cross-component backporting pains sooner or
later. Or inconsistency, which defeats the point.

Cheers, Daniel
 
> Regards, Joonas
> 
> > If the discussion gets too complicated, then can we add
> > a GET_PARAM for the SET_PAT extension? I'm hoping we could either come
> > up with something better reasonably quickly, or i915/Xe can add a new
> > param for each new extensions until a better approach is available.
> > 
> > > Furthermore the PXP context create story is even more complicated,
> > > in a way that it is not just about querying whether the extension is
> > > supported, but the expensive check is something more complicated.
> > > 
> > > Going back to implementation details for this proposed new feature,
> > > one alternative to query could be something like:
> > > 
> > >    drm_i915_gem_create_ext.flags |= I915_GEM_CREATE_EXT_FLAG_PROBE_EXTENSIONS;
> > > 
> > > That would be somewhat more light weight to implement that the
> > > i915_query route. And it appears it would work for all ioctls which
> > > support extensions apart for i915_context_param_engines.
> > 
> > This seems little better than the "try it, and if it works then it's
> > supported".
> > 
> > I'm not suggesting that userspace should be able to check that
> > scenario x+y+z will work, but more a list of extensions that
> > conceivably could work. Normally this should just a matter of the
> > kernel unconditionally adding the newly implemented extension to the
> > list returned in the query call.
> > 
> > If a GET_PARAM can be made for the PXP case, then it seems like a
> > query item returning CONTEXT_CREATE extensions could conditionally
> > omit that extension just as easily as implementing the proposed new
> > GET_PARAM.
> > 
> > -Jordan

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
