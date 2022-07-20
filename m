Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 495D857B2E1
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 10:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776F511311F;
	Wed, 20 Jul 2022 08:28:35 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C20113E71;
 Wed, 20 Jul 2022 08:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658305714; x=1689841714;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=YOQDc2df3klTr/rSN75PBichIB8rFEiaa0BDw/d62e0=;
 b=XyD4AzLBJ20iBFZHd1Sr25yABBtob8NpTfgLBigpwDo1SMOyklj2ohrg
 us/5Kp+0kDEkt8lgVDUVp1SnV3R+qW4SN6bLbRaly6ZbimKqjkQc9ugrj
 oO9wSxEXpkk1a4M2yZ2N2SkgbOy5wsy6gKcDj2PRIGf38Ph7Y2TvCcQBg
 gUSW7Y6ilg6gxgSCCVJYYKB2pNJnxVsmaXF1cSqV35Eq36HrlNxi/Aqz1
 JvHB8g2Izevp/48pohyKnsPBBaqmLiZ8M+ixOS5u7HKaoEql7B5cIZjtc
 kaaQB5sAGmDyj/pqRsvhJk0Xt3/CFLszgIZHS/Br8gkb0Ys4iesKFCE5u w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="350707641"
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="350707641"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 01:28:32 -0700
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="687435534"
Received: from avandyk-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.181.8])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 01:28:31 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPM=9txdca1VnRpp-oNLXpBc2UWq3=ceeim5+Gw4N9tAriRY6A@mail.gmail.com>
References: <20220412225955.1802543-1-John.C.Harrison@Intel.com>
 <20220412225955.1802543-2-John.C.Harrison@Intel.com>
 <Yli4/8OIbjyRaQAK@mdroper-desk1.amr.corp.intel.com>
 <CAPM=9txdca1VnRpp-oNLXpBc2UWq3=ceeim5+Gw4N9tAriRY6A@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/guc: Update to GuC version 70.1.1
From: Jordan Justen <jordan.l.justen@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 20 Jul 2022 01:28:25 -0700
Message-ID: <165830570593.852381.752081233295547410@jljusten-skl>
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
Cc: Intel Graphics Development <Intel-GFX@lists.freedesktop.org>,
 John.C.Harrison@intel.com, dri-devel <DRI-Devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-07-14 16:08:51, Dave Airlie wrote:
> On Fri, 15 Apr 2022 at 10:15, Matt Roper <matthew.d.roper@intel.com> wrot=
e:
> >
> > On Tue, Apr 12, 2022 at 03:59:55PM -0700, John.C.Harrison@Intel.com wro=
te:
> > > From: John Harrison <John.C.Harrison@Intel.com>
> > >
> > > The latest GuC firmware drops the context descriptor pool in favour of
> > > passing all creation data in the create H2G. It also greatly simplifi=
es
> > > the work queue and removes the process descriptor used for multi-LRC
> > > submission. So, remove all mention of LRC and process descriptors and
> > > update the registration code accordingly.
> > >
> > > Unfortunately, the new API also removes the ability to set default
> > > values for the scheduling policies at context registration time.
> > > Instead, a follow up H2G must be sent. The individual scheduling
> > > policy update H2G commands are also dropped in favour of a single KLV
> > > based H2G. So, change the update wrappers accordingly and call this
> > > during context registration..
> > >
> > > Of course, this second H2G per registration might fail due to being
> > > backed up. The registration code has a complicated state machine to
> > > cope with the actual registration call failing. However, if that works
> > > then there is no support for unwinding if a further call should fail.
> > > Unwinding would require sending a H2G to de-register - but that can't
> > > be done because the CTB is already backed up.
> > >
> > > So instead, add a new flag to say whether the context has a pending
> > > policy update. This is set if the policy H2G fails at registration
> > > time. The submission code checks for this flag and retries the policy
> > > update if set. If that call fails, the submission path early exists
> > > with a retry error. This is something that is already supported for
> > > other reasons.
> > >
> > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> >
> > Applied to drm-intel-gt-next.  Thanks for the patch and review.
> >
>=20
> (cc'ing Linus and danvet, as a headsup, there is also a phoronix
> article where this was discovered).
>=20
> Okay WTF.
>=20
> This is in no way acceptable. This needs to be fixed in 5.19-rc ASAP.
>=20
> Once hardware is released and we remove the gate flag by default, you
> cannot just bump firmware versions blindly.
>=20
> The kernel needs to retain compatibility with all released firmwares
> since a device was declared supported.
>=20
> This needs to be reverted, and then 70 should be introduced with a
> fallback to 69 versions.
>=20
> Very disappointing, I expect this to get dealt with v.quickly.

This reminds me of something. A distant memory, really. But, if you
can believe it, i915 used to actually be able to *do something*
without the *closed source* guc. Crazy, right?

Anyway, that's all ancient history now. I mean, you have to go back
pretty far for that. Let me check my notes. Yeah, you'd probably have
to go all the way back to 2021 for that. I guess a lot of things were
much simpler back then though.

Anyway... Always fun to reminisce.

-Jordan
