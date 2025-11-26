Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3550C898E3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 12:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B7E10E5AA;
	Wed, 26 Nov 2025 11:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mnJd+THi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DD110E545;
 Wed, 26 Nov 2025 11:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764157122; x=1795693122;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8Ci9qIas4o7sPCdSNP+D4JZKN0W53oO/eb7N06IRCks=;
 b=mnJd+THinkgrXjVHFko7i1ETrV57ZoaRiKlJcU0vpvLfQY4hJHqsfS1O
 UonPjme1aYNtS6XQOhkOo8w5qUCj4gzDtIolF3RsR8hhZCYOt/m35a29k
 L0nwLoneNH06ZLq5y+KtsBtDQG1ikNh6w/CK1LVVd2SI/ofndWJWIyHB1
 b7XazRXcKQEa5n0MEQYnvrczc9PhJcydmXo70MYuyesS0BHyr4I95M8m+
 yCe0gp5Uf92UfaYVB7ZvDJpq4TUR+F0CuFQAzWUwKjoIvJrtdnWPbLQxL
 zmfSTgEyJpMYdBKYQ6EtOm8YyriEXoxsG6ru9Hb6rKf01p/UGrqfRIRmE Q==;
X-CSE-ConnectionGUID: D2au8iFMRVeJPl6QTKa7Zw==
X-CSE-MsgGUID: rbvZeX/xRz6MXHla8Jx1qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66223747"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="66223747"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 03:38:41 -0800
X-CSE-ConnectionGUID: ISg4W5Y1Qo+YgZq7Xm+gjw==
X-CSE-MsgGUID: WXccPcVMQwGjwSI2KXdLEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="192567071"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.127])
 ([10.245.245.127])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 03:38:36 -0800
Message-ID: <c5f1344daeec43e5b5d9e6536c8c8b8a13323f7a.camel@linux.intel.com>
Subject: Re: [PATCH v6 0/4] vfio/xe: Add driver variant for Xe VF migration
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Alex Williamson <alex@shazbot.org>
Cc: =?UTF-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe	 <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin
 Tian	 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>, 
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie	 <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna	 <lukasz.laguna@intel.com>, Christoph
 Hellwig <hch@infradead.org>
Date: Wed, 26 Nov 2025 12:38:34 +0100
In-Reply-To: <aSZVybx3cgPw6HQh@lstrano-desk.jf.intel.com>
References: <20251124230841.613894-1-michal.winiarski@intel.com>
 <20251125131315.60aa0614.alex@shazbot.org>
 <aSZVybx3cgPw6HQh@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Tue, 2025-11-25 at 17:20 -0800, Matthew Brost wrote:
> On Tue, Nov 25, 2025 at 01:13:15PM -0700, Alex Williamson wrote:
> > On Tue, 25 Nov 2025 00:08:37 +0100
> > Micha=C5=82 Winiarski <michal.winiarski@intel.com> wrote:
> >=20
> > > Hi,
> > >=20
> > > We're now at v6, thanks for all the review feedback.
> > >=20
> > > First 24 patches are now already merged through drm-tip tree, and
> > > I hope
> > > we can get the remaining ones through the VFIO tree.
> >=20
> > Are all those dependencies in a topic branch somewhere?=C2=A0 Otherwise
> > to
> > go in through vfio would mean we need to rebase our next branch
> > after
> > drm is merged.=C2=A0 LPC is happening during this merge window, so we
> > may
> > not be able to achieve that leniency in ordering.=C2=A0 Is the better
> > approach to get acks on the variant driver and funnel the whole
> > thing
> > through the drm tree?=C2=A0 Thanks,
>=20
> +1 on merging through drm if VFIO maintainers are ok with this. I've
> done this for various drm external changes in the past with
> maintainers
> acks.
>=20
> Matt

@Michal Winiarski

Are these patches depending on any other VFIO changes that are queued
for 6.19?=20

If not and with proper VFIO acks, I could ask Dave / Sima to allow this
for drm-xe-next-fixes pull. Then I also would need a strong
justification for it being in 6.19 rather in 7.0.

Otherwise we'd need to have the VFIO changes it depends on in a topic
branch, or target this for 7.0 and hold off the merge until we can
backmerge 6.9-rc1.

Thanks,
Thomas


>=20
> >=20
> > Alex

