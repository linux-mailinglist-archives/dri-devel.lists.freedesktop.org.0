Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A28AA553AB2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 21:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F36710E96F;
	Tue, 21 Jun 2022 19:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B5A10E96F;
 Tue, 21 Jun 2022 19:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655840298; x=1687376298;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=boR45GZxY+jzyManmybO5zAg/bHZQCD5HQuzFeY2vgU=;
 b=WvVtryFVgXWr5XPf0fAlzJS2phgdS/jGUWZZLgO2Rl66g/fV2E4gCVkr
 vtYPZAKamZcuLHQKEr8xN8BtDR9JHQXHTMsYJyjISz9jH9/dtS/Ta5w7x
 U5rM2kbqSv5UOyxqLkWv1NaMXpc1yJPZmT5a/Sww0nCXiZqgoaFALYnah
 2bAva7vvfEmoi5WoUb0h40sTb4syBa1ryoSSmxv2p2sybNXyhl7VE+WoQ
 utxc2WnWpHHf4lKCSHQp6sDllhFYUXzwOQT+tiN8ZNkU9noj/x+DjnQts
 HerWHN1PSYZaB0v0/SDhGGLqLqGG5jgA4J7NSuXbCJik2FMellVs9dluy Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="263251664"
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; d="scan'208";a="263251664"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 12:38:17 -0700
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; d="scan'208";a="591802080"
Received: from dfalco1x-mobl.amr.corp.intel.com (HELO localhost)
 ([10.209.29.211])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 12:38:17 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5e590969-56c3-faaf-215c-c02800560dac@intel.com>
References: <20220621104434.190962-1-matthew.auld@intel.com>
 <20220621104434.190962-2-matthew.auld@intel.com>
 <5e590969-56c3-faaf-215c-c02800560dac@intel.com>
Subject: Re: [PATCH v2 01/12] drm/doc: add rfc section for small BAR uapi
From: Jordan Justen <jordan.l.justen@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 21 Jun 2022 12:38:09 -0700
Message-ID: <165584028906.852381.4890629274256327834@jljusten-skl>
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
Cc: Thomas =?utf-8?q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, mesa-dev@lists.freedesktop.org,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-06-21 11:31:39, Lionel Landwerlin wrote:
> On 21/06/2022 13:44, Matthew Auld wrote:
> > Add an entry for the new uapi needed for small BAR on DG2+.
> >
> > v2:
> >    - Some spelling fixes and other small tweaks. (Akeem & Thomas)
> >    - Rework error capture interactions, including no longer needing
> >      NEEDS_CPU_ACCESS for objects marked for capture. (Thomas)
> >    - Add probed_cpu_visible_size. (Lionel)
> > v3:
> >    - Drop the vma query for now.
> >    - Add unallocated_cpu_visible_size as part of the region query.
> >    - Improve the docs some more, including documenting the expected
> >      behaviour on older kernels, since this came up in some offline
> >      discussion.
> > v4:
> >    - Various improvements all over. (Tvrtko)
> >
> > v5:
> >    - Include newer integrated platforms when applying the non-recoverab=
le
> >      context and error capture restriction. (Thomas)
> >
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Jordan Justen <jordan.l.justen@intel.com>
> > Cc: Kenneth Graunke <kenneth@whitecape.org>
> > Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> > Cc: mesa-dev@lists.freedesktop.org
> > Acked-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > Acked-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
>=20
>=20
> With Jordan with have changes for Anv/Iris :=20
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/16739
>=20
> Acked-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>=20

Acked-by: Jordan Justen <jordan.l.justen@intel.com>
