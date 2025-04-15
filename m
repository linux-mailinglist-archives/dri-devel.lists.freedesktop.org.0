Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B26A8A409
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 18:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7390110E124;
	Tue, 15 Apr 2025 16:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="CdA/KFEJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A5710E124;
 Tue, 15 Apr 2025 16:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1744734318; x=1744993518;
 bh=6vA73BnoIbPzed7iHmcw3N0AhaPwWy4e7axyKqB+Nfo=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=CdA/KFEJ4Z4vs8oxCk5FqDymTSS1GAmpbOR2AYnmx9WV0ANzrwUzZQQ9CbQRqXXWz
 381i33NJZLoHV8ONpGsFNpsrJ15H3od0HBEZWOmcGKxDgAYCONznVtKEM9jPROViU3
 /i+fEC9VGfqYQHYe9kDhkWxbnWTdA7vAx5JUPGrciqquNb9XyWeGIy10WjSh4p/jmO
 YHDOtU3oqQpNNtISbKydoDasu1fBwwQEq9E3lX3miguNCEET1YBVlCl4H5szJ6R0bl
 RBO21Z99G4RD9GUKE4yURsPLluagl+NQXLUZ3VnRPhh2k90uApsOPMzhs1xotD+DCj
 4Wv4651bG16/w==
Date: Tue, 15 Apr 2025 16:25:12 +0000
To: Harry Wentland <harry.wentland@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: "Shankar, Uma" <uma.shankar@intel.com>, Alex Hung <alex.hung@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 "leo.liu@amd.com" <leo.liu@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "mwen@igalia.com" <mwen@igalia.com>, "jadahl@redhat.com" <jadahl@redhat.com>,
 "sebastian.wick@redhat.com" <sebastian.wick@redhat.com>,
 "shashank.sharma@amd.com" <shashank.sharma@amd.com>,
 "agoins@nvidia.com" <agoins@nvidia.com>, "joshua@froggi.es" <joshua@froggi.es>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>,
 "aleixpol@kde.org" <aleixpol@kde.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 "victoria@system76.com" <victoria@system76.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "marcan@marcan.st" <marcan@marcan.st>,
 "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>, "Borah,
 Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>
Subject: Re: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT type
Message-ID: <ZqHOWK3X_Ici9wNgijgeUt9r3asi4jhqw-0-keIfXYAFxbsGLaFTIozGHHR64SnkAzPA4CM-zmc6OwVtrKMKjVyoblti88KpRf9wEu8daP0=@emersion.fr>
In-Reply-To: <3ca1958f-62e0-4a5c-837b-3cd705acc181@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-33-alex.hung@amd.com>
 <CY5PR11MB63441E057180C043C51230A3F4B22@CY5PR11MB6344.namprd11.prod.outlook.com>
 <fzuE3KXuocsKA0I9kWXruyw7IVbw3jwH2yeh59SfE0Qb0SGxa29rrj9X_XgNCdmj1vWgxLO619xyJY3r5R3hsZK6ElIkTvbyNfu40x1SiZM=@emersion.fr>
 <CY5PR11MB63449DBA54519766E345CADAF4B22@CY5PR11MB6344.namprd11.prod.outlook.com>
 <3ca1958f-62e0-4a5c-837b-3cd705acc181@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: ce74abd530ae676c8cf1a893f529c06d4b12a4be
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tuesday, April 15th, 2025 at 17:05, Harry Wentland <harry.wentland@amd.c=
om> wrote:

> > > > We want to have just one change in the way we expose the hardware
> > > > capabilities else all looks good in general.
> > >=20
> > > I would really recommend leaving this as a follow-up extension. It's =
a complicated
> > > addition that requires more discussion.
> >=20
> > Hi Simon,
> > We have tried to solve the complex part and made it simple to understan=
d and implement
> > along with a reference implementation [1] (can also help add the same f=
or AMD case as well).
> > Without this we will end up with up 2 interfaces for 1dL Lut which is n=
ot nice where the one above
> > will be able to cover the current one. Let us know the problems with th=
e proposed interface and we can
> > work to fix the same. But having a common and single interface is good =
and the current one will not fit
> > Intel's color pipeline distribution so the generic one anyways will be =
needed, and it will benefit userspace
> > to know the underlying LUT distribution to compute the LUT samples.
> >=20
> > [1] https://patchwork.freedesktop.org/series/129812/
>=20
> I think there is a lot of value in giving userspace a simple LUT
> to work with. There are many compositors and many compositor
> maintainers. When someone new jumps into color management usually
> same thing happens. It starts with "it's not too complicated",
> and then over a period of time progresses to "this is very much
> non-trivial" as understanding one bit usually opens ten more
> questions.
>=20
> Forcing people to deal with another level of complexity will
> discourage implementations and be counterproductive to furthering
> adoption of color operations for HW acceleration, IMO.
>=20
> I'm am not opposed to a complex LUT definition but I don't think
> it should replace a simple and well-understood definition.

Agreed. To add on this, I think shipping many additional features from
day one significantly increases the work load (more code to write,
review, test at once) and we'd also need to go through supplementary
rounds to validate the API design and ensure it's not too
Intel-specific. Also adding this feature as a second step will prove
that the API is as extensible as we desire.=20

I don't really understand why it's important to have this feature in
the first version. Intel has been converting simple LUTs into the
fancy distribution for the existing GAMMA_LUT and DEGAMMA_LUT for a
while, so can do it for colorop as well. The upsides of the fancy
distribution is more precise and smaller LUTs, but that doesn't seem
critical?

Simon
