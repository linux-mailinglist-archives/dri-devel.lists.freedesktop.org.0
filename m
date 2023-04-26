Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 243726EFB81
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 22:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B504A10E14F;
	Wed, 26 Apr 2023 20:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104F810E105;
 Wed, 26 Apr 2023 20:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682539488; x=1714075488;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=XqfRp5+ieFJ3Ybp5clGQt8iE0BLjp8cz8czLwrjjhqw=;
 b=g62SB31bb09eQb8BNe9Q1d2TcyIPRBbrmGJIgL5Omtz8w42xCXVYhavK
 E46s7sYpbW/AmVEJ8N2yGrpQVOG2kKatGt2m7b/7F0T9vahWUj8R0pLE9
 x2ip76aP21ymVW/dxAmrAKiZZ93KAcL3NrqYJyPzp7Yq94i2XcOei5mnP
 vjMRniRDTbaEwy1FkW8M4m9hkIoDjsjEnBwpdmAODZEyP9I1DUMY9V55E
 ezrwVQ150zx4NLFmIsBl1cFJuuucJT4+H5r6el4LbJIl4VDYYNM7npQUk
 jtBOEKtL+C+eb5fQdP/kiSRu5XJBpfcy8mSxlPWNSHLKKEf5xz9MkQs7P Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="375191068"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="375191068"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 13:04:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="940378648"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="940378648"
Received: from taylorv1-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.168.208])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 13:04:46 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZEkQi6Zrb6lR4DEm@phenom.ffwll.local>
References: <20230419230058.2659455-9-fei.yang@intel.com>
 <471addf7-1670-32cd-9d2e-3f94d6825eab@linux.intel.com>
 <BYAPR11MB2567A1A450448AE17B38ED1C9A639@BYAPR11MB2567.namprd11.prod.outlook.com>
 <168211012988.392286.16107510619704913123@jljusten-skl>
 <BYAPR11MB2567F03AD43D7E2DE2628D5D9A669@BYAPR11MB2567.namprd11.prod.outlook.com>
 <168232538771.392286.3227368099155268955@jljusten-skl>
 <5d0e2cf4-a487-1a1e-dae9-4fbe8c2fe649@linux.intel.com>
 <168235638024.392286.14697291321034695564@jljusten-skl>
 <168243011485.13318.1376529380245430200@jlahtine-mobl.ger.corp.intel.com>
 <ZEkQi6Zrb6lR4DEm@phenom.ffwll.local>
Subject: Re: IOCTL feature detection (Was: Re: [Intel-gfx] [PATCH 8/8]
 drm/i915: Allow user to set cache at BO creation)
From: Jordan Justen <jordan.l.justen@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Date: Wed, 26 Apr 2023 13:04:45 -0700
Message-ID: <168253948596.392286.2237664538921869335@jljusten-skl>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, "Teres Alexis,
 Alan Previn" <alan.previn.teres.alexis@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, Intel-gfx@lists.freedesktop.org,
 DRI Development <dri-devel@lists.freedesktop.org>, "Yang,
 Fei" <fei.yang@intel.com>, Chris Wilson <chris.p.wilson@linux.intel.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, "Das,
 Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-26 04:52:43, Daniel Vetter wrote:
>=20
> Joonas asked me to put my thoughts here:
>=20
> - in general the "feature discovery by trying it out" approach is most
>   robust and hence preferred, but it's also not something that's required
>   when there's good reasons against it

More robust in what sense?

Userspace has to set up some scenario to use the interface, which
hopefully is not too complex. It's difficult to predict what it may
look like in the future since we are talking about undefined
extensions.

Userspace has to rely on the kernel making creating and destroying
this thing essentially free. For
I915_GEM_CREATE_EXT_PROTECTED_CONTENT, that did not work out. For
I915_GEM_CREATE_EXT_SET_PAT, just wondering, since the PAT indices are
platform specific, what might happen if we tried to choose some common
index value to detect the extension in a generic manner? Could it
potentially lead to unexpected behavior, or maybe just an error. I
guess it's really extension specific what kind of issues potentially
could arise.

> tldr; prefer discovery, don't sweat it if not, definitely don't
> overengineer this with some magic "give me all extensions" thing because
> that results in guaranteed cross-component backporting pains sooner or
> later. Or inconsistency, which defeats the point.

I guess I don't know the full context of your concerns here.

For returning the gem-create extensions, isn't this just a matter of
returning the valid indices to the create_extensions array in
i915_gem_create.c? Is that an over-engineered query?

It seems weird that there's a reasonably well defined "extension"
mechanism here, but no way for the kernel to just tell us what
extensions it knows about.

-Jordan
