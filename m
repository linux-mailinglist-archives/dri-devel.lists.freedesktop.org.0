Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 770BE6D240F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 17:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D64C10E103;
	Fri, 31 Mar 2023 15:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8343810E0FA;
 Fri, 31 Mar 2023 15:32:21 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r11so22835630wrr.12;
 Fri, 31 Mar 2023 08:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680276740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jfS1A2UVrL/vzisEkb7b8TXzYiJS2jrBia0j1kZ6QPc=;
 b=iVACrs7aNGDMS+Iz72GAFBLZld4BV+nVYjKc0gWOkFx26+FRyAR4H7H1+PzgWPS7EE
 fYhVpsD4N+Y7cmyLAxwS1lBsdWE2C/d9M6BGgIvXM3J0V/1MN76fXxxVC+9YJBOySJ8g
 EABMuZEZ3bhnNCTiQv0k6yRXWhficZULBrJSEo9jwWCO3DZfwhOLEWPWe0EAPWcxezqb
 K/XXQ+XudT+12hA9yZhD8QQCRJdOdpG8vcdlp9o5aaCkjUTUyTUrUDeh2rMlxIlnwz2F
 tMaRQnm3BEc9t6dgKl/BcckPwkufjTDr7AmiQ8A1fjQfvyWpI5znA5OHRpKJUHKyzZSK
 W6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680276740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jfS1A2UVrL/vzisEkb7b8TXzYiJS2jrBia0j1kZ6QPc=;
 b=XT00lJhVKiQCQxaIJ6bp/qzw3WbxouN2Hw+mT0pODl79soIUd203REYDbyi2dP1f6A
 DlJ/HlF2PKhRw7YvmUbb2Jc5wXsaI9Xz4qQ2EK7+2Z80mJb5hHk1N1wf7OeqLniZyphE
 ZwXJ8zoRlNRopWYBqN7g0mXEgKQqimq143/kfSNxNp5Sv+HKUfVDdQA9yu+T6k0gSSqt
 ru/EYfEi7nF8v/nc19KcpBfvQuB2O6IAJBz4rCWHM+2X38/AbxQBgkb3616oJ9cKbTQW
 tmYlD0FQ3qGaQLRto/E6VCyD7DltdLbp41JBoEiEGYYeHjjfYwpNyeGWB6JkEeKhNv8j
 J+6A==
X-Gm-Message-State: AAQBX9dnj7RS9hX2h3Rr9gDC7Aunfqgk/Kcs/2a+1RwFnZBQryBvKjp7
 x2t6mxt3HwN/9BTSXsb2+ck=
X-Google-Smtp-Source: AKy350YMiqhSspjSjgIhnwFge0LPZC1zNwzgtXMArLtNAygmlwXBTaXtMCws7lIwvtD2MsLnQeRbxQ==
X-Received: by 2002:adf:d4c8:0:b0:2d4:d4ef:265c with SMTP id
 w8-20020adfd4c8000000b002d4d4ef265cmr21698755wrk.45.1680276739789; 
 Fri, 31 Mar 2023 08:32:19 -0700 (PDT)
Received: from suse.localnet (host-82-55-106-106.retail.telecomitalia.it.
 [82.55.106.106]) by smtp.gmail.com with ESMTPSA id
 t16-20020adfdc10000000b002e5ff05765esm1890713wri.73.2023.03.31.08.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 08:32:19 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Ira Weiny <ira.weiny@intel.com>, Zhao Liu <zhao1.liu@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v2 9/9] drm/i915: Use kmap_local_page() in
 gem/i915_gem_execbuffer.c
Date: Fri, 31 Mar 2023 17:32:17 +0200
Message-ID: <2177327.1BCLMh4Saa@suse>
In-Reply-To: <fdc8a470-1e6b-815d-e367-a9df1b0b14dd@linux.intel.com>
References: <20230329073220.3982460-1-zhao1.liu@linux.intel.com>
 <64265ef8725fe_375f7e294a@iweiny-mobl.notmuch>
 <fdc8a470-1e6b-815d-e367-a9df1b0b14dd@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Zhao Liu <zhao1.liu@intel.com>, Zhenyu Wang <zhenyu.z.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On venerd=EC 31 marzo 2023 13:30:20 CEST Tvrtko Ursulin wrote:
> On 31/03/2023 05:18, Ira Weiny wrote:
> > Zhao Liu wrote:
> >> From: Zhao Liu <zhao1.liu@intel.com>
> >>=20
> >> The use of kmap_atomic() is being deprecated in favor of
> >> kmap_local_page()[1], and this patch converts the calls from
> >> kmap_atomic() to kmap_local_page().
> >>=20
> >> The main difference between atomic and local mappings is that local
> >> mappings doesn't disable page faults or preemption (the preemption is
> >> disabled for !PREEMPT_RT case, otherwise it only disables migration).
> >>=20
> >> With kmap_local_page(), we can avoid the often unwanted side effect of
> >> unnecessary page faults and preemption disables.
> >>=20
> >> In i915_gem_execbuffer.c, eb->reloc_cache.vaddr is mapped by
> >> kmap_atomic() in eb_relocate_entry(), and is unmapped by
> >> kunmap_atomic() in reloc_cache_reset().
> >=20
> > First off thanks for the series and sticking with this.  That said this
> > patch kind of threw me for a loop because tracing the map/unmap calls d=
id
> > not make sense to me.  See below.
> >=20
> >> And this mapping/unmapping occurs in two places: one is in
> >> eb_relocate_vma(), and another is in eb_relocate_vma_slow().
> >>=20
> >> The function eb_relocate_vma() or eb_relocate_vma_slow() doesn't
> >> need to disable pagefaults and preemption during the above mapping/
> >> unmapping.
> >>=20
> >> So it can simply use kmap_local_page() / kunmap_local() that can
> >> instead do the mapping / unmapping regardless of the context.
> >>=20
> >> Convert the calls of kmap_atomic() / kunmap_atomic() to
> >> kmap_local_page() / kunmap_local().
> >>=20
> >> [1]:
> >> https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com
> >>=20
> >> v2: No code change since v1. Added description of the motivation of
> >>=20
> >>      using kmap_local_page() and "Suggested-by" tag of Fabio.
> >>=20
> >> Suggested-by: Ira Weiny <ira.weiny@intel.com>
> >> Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> >> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> >> ---
> >>=20
> >> Suggested by credits:
> >>    Ira: Referred to his task document, review comments.
> >>    Fabio: Referred to his boiler plate commit message and his descript=
ion
> >>   =20
> >>           about why kmap_local_page() should be preferred.
> >>=20
> >> ---
> >>=20
> >>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 10 +++++-----
> >>   1 file changed, 5 insertions(+), 5 deletions(-)
> >>=20

[snip]
=20
> However I am unsure if disabling pagefaulting is needed or not. Thomas,
> Matt, being the last to touch this area, perhaps you could have a look?
> Because I notice we have a fallback iomap path which still uses
> io_mapping_map_atomic_wc. So if kmap_atomic to kmap_local conversion is
> safe, does the iomap side also needs converting to
> io_mapping_map_local_wc? Or they have separate requirements?

AFAIK, the requirements for io_mapping_map_local_wc() are the same as for=20
kmap_local_page(): the kernel virtual address is _only_ valid in the caller=
=20
context, and map/unmap nesting must be done in stack-based ordering (LIFO).

I think a follow up patch could safely switch to io_mapping_map_local_wc() =
/=20
io_mapping_unmap_local_wc since the address is local to context.

However, not being an expert, reading your note now I suspect that I'm miss=
ing=20
something. Can I ask why you think that page-faults disabling might be=20
necessary?=20

Thanks,

=46abio

> Regards,
>=20
> Tvrtko



