Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD39939947C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 22:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750C96EE60;
	Wed,  2 Jun 2021 20:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727DA6EE60;
 Wed,  2 Jun 2021 20:22:39 +0000 (UTC)
IronPort-SDR: +nxuYznuEh0ZPZaZiuwjDKkHKwZreUsa8CI6d91+awA3M/jcggtN6PTWbjq+am/gkZNQla9Lry
 3Zwi3eJPk/dw==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="225180308"
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="225180308"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 13:22:37 -0700
IronPort-SDR: qfIdZ5lxpMfzVDp7dQsS3lyxocIJUXRt+0ePcaQPX1S8keBS7xY3qRcTXtriuxkcgzqXIkpbZJ
 g6oY/045p8BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="400174838"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga006.jf.intel.com with ESMTP; 02 Jun 2021 13:22:37 -0700
Received: from bgsmsx606.gar.corp.intel.com (10.67.234.8) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 2 Jun 2021 13:22:36 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX606.gar.corp.intel.com (10.67.234.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 3 Jun 2021 01:52:34 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2242.008;
 Thu, 3 Jun 2021 01:52:33 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: RE: [PATCH 00/21] Add Support for Plane Color Lut and CSC features
Thread-Topic: [PATCH 00/21] Add Support for Plane Color Lut and CSC features
Thread-Index: AQHXVs8fT5zmdeaE5UiCHnxqtZHD0qsAGZIAgAERuqA=
Date: Wed, 2 Jun 2021 20:22:33 +0000
Message-ID: <5a9a8c3ee8d54c3ca2ccaca4aa5ad1d9@intel.com>
References: <20210601105218.29185-1-uma.shankar@intel.com>
 <20210602122850.29412a29@eldfell>
In-Reply-To: <20210602122850.29412a29@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.223.10.1]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Modem, 
 Bhanuprakash" <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Pekka Paalanen <ppaalanen@gmail.com>
> Sent: Wednesday, June 2, 2021 2:59 PM
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Mod=
em,
> Bhanuprakash <bhanuprakash.modem@intel.com>; Harry Wentland
> <harry.wentland@amd.com>
> Subject: Re: [PATCH 00/21] Add Support for Plane Color Lut and CSC featur=
es
>=20
> On Tue,  1 Jun 2021 16:21:57 +0530
> Uma Shankar <uma.shankar@intel.com> wrote:
>=20
> > This is how a typical display color hardware pipeline looks like:
> >  +-------------------------------------------+
> >  |                RAM                        |
> >  |  +------+    +---------+    +---------+   |
> >  |  | FB 1 |    |  FB 2   |    | FB N    |   |
> >  |  +------+    +---------+    +---------+   |
> >  +-------------------------------------------+
> >        |  Plane Color Hardware Block |
> > +--------------------------------------------+
> >  | +---v-----+   +---v-------+   +---v------+ |
> >  | | Plane A |   | Plane B   |   | Plane N  | |
> >  | | DeGamma |   | Degamma   |   | Degamma  | |
> >  | +---+-----+   +---+-------+   +---+------+ |
> >  |     |             |               |        |
> >  | +---v-----+   +---v-------+   +---v------+ |
> >  | |Plane A  |   | Plane B   |   | Plane N  | |
> >  | |CSC/CTM  |   | CSC/CTM   |   | CSC/CTM  | |
> >  | +---+-----+   +----+------+   +----+-----+ |
> >  |     |              |               |       |
> >  | +---v-----+   +----v------+   +----v-----+ |
> >  | | Plane A |   | Plane B   |   | Plane N  | |
> >  | | Gamma   |   | Gamma     |   | Gamma    | |
> >  | +---+-----+   +----+------+   +----+-----+ |
> >  |     |              |               |       |
> >  +--------------------------------------------+
> > +------v--------------v---------------v-------|
> > ||                                           ||
> > ||           Pipe Blender                    ||
> > +--------------------+------------------------+
> > |                    |                        |
> > |        +-----------v----------+             |
> > |        |  Pipe DeGamma        |             |
> > |        |                      |             |
> > |        +-----------+----------+             |
> > |                    |            Pipe Color  |
> > |        +-----------v----------+ Hardware    |
> > |        |  Pipe CSC/CTM        |             |
> > |        |                      |             |
> > |        +-----------+----------+             |
> > |                    |                        |
> > |        +-----------v----------+             |
> > |        |  Pipe Gamma          |             |
> > |        |                      |             |
> > |        +-----------+----------+             |
> > |                    |                        |
> > +---------------------------------------------+
> >                      |
> >                      v
> >                Pipe Output
>=20
> Hi,
>=20
> this is an excellent picture. I have long been wanting schematics like th=
at in the DRM
> UAPI documentation. Another note on that:
> https://lists.freedesktop.org/archives/dri-devel/2021-May/307310.html
>=20
> But the schematic for DRM UAPI documentation needs to be written in terms=
 of the
> abstract KMS pipeline with property names spelled out, like in what Ville=
 sketched in
> that email.

Sure Pekka, I can add that.

> > This patch series adds properties for plane color features. It adds
> > properties for degamma used to linearize data and CSC used for gamut
> > conversion. It also includes Gamma support used to again non-linearize
> > data as per panel supported color space. These can be utilize by user
> > space to convert planes from one format to another, one color space to
> > another etc.
>=20
> This is very much welcome!
>=20
> There is also the thread:
> https://lists.freedesktop.org/archives/dri-devel/2021-May/306726.html
>=20
> Everything mentioned will interact with each other by changing what the a=
bstract
> KMS pixel pipeline does. I think you and Harry should probably look at ea=
ch others'
> suggestions and see how to fit them all into a single abstract KMS pipeli=
ne.
>=20
> People are adding new pieces into KMS left and right, and I fear we lose =
sight of how
> everything will actually work together when all KMS properties are suppos=
ed to be
> generic and potentially present simultaneously. This is why I would very =
much like to
> have that *whole* abstract KMS pipeline documented with *everything*. Oth=
erwise
> it is coming really hard fast to figure out how generic userspace should =
use all these
> KMS properties together.
>=20
> Or if there cannot be a single abstract KMS pipeline, then sure, have mul=
tiple, as long
> as they are documented and how userspace will know which pipeline it is d=
ealing
> with, and what things are mutually exclusive so we can avoid writing user=
space code
> for combinations that will never exist.

This is a good suggestion to have the whole pipeline and properties documen=
ted along with
the exact usages. We may end with 2 properties almost doing similar work bu=
t needed due to
underlying hardware, but we can get that properly documented and defined.=20

I will discuss with Harry and Ville as well to define this.

Regards,
Uma Shankar
>=20
> Thanks,
> pq
>=20
> > Userspace can take smart blending decisions and utilize these hardware
> > supported plane color features to get accurate color profile. The same
> > can help in consistent color quality from source to panel taking
> > advantage of advanced color features in hardware.
> >
> > These patches add the property interfaces and enable helper functions.
> > This series adds Intel's XE_LPD hw specific plane gamma feature. We
> > can build up and add other platform/hardware specific implementation
> > on top of this series.
> >
> > Credits: Special mention and credits to Ville Syrjala for coming up
> > with a design for this feature and inputs. This series is based on his
> > original design and idea.
> >
> > Note: Userspace support for this new UAPI will be done on Chrome. We
> > will notify the list once we have that ready for review.
> >
> > ToDo: State readout for this feature will be added next.
> >
> > Uma Shankar (21):
> >   drm: Add Enhanced Gamma and color lut range attributes
> >   drm: Add Plane Degamma Mode property
> >   drm: Add Plane Degamma Lut property
> >   drm/i915/xelpd: Define Degamma Lut range struct for HDR planes
> >   drm/i915/xelpd: Add register definitions for Plane Degamma
> >   drm/i915/xelpd: Enable plane color features
> >   drm/i915/xelpd: Add color capabilities of SDR planes
> >   drm/i915/xelpd: Program Plane Degamma Registers
> >   drm/i915/xelpd: Add plane color check to glk_plane_color_ctl
> >   drm/i915/xelpd: Initialize plane color features
> >   drm/i915/xelpd: Load plane color luts from atomic flip
> >   drm: Add Plane CTM property
> >   drm: Add helper to attach Plane ctm property
> >   drm/i915/xelpd: Define Plane CSC Registers
> >   drm/i915/xelpd: Enable Plane CSC
> >   drm: Add Plane Gamma Mode property
> >   drm: Add Plane Gamma Lut property
> >   drm/i915/xelpd: Define and Initialize Plane Gamma Lut range
> >   drm/i915/xelpd: Add register definitions for Plane Gamma
> >   drm/i915/xelpd: Program Plane Gamma Registers
> >   drm/i915/xelpd: Enable plane gamma
> >
> >  Documentation/gpu/drm-kms.rst                 |  90 +++
> >  drivers/gpu/drm/drm_atomic.c                  |   1 +
> >  drivers/gpu/drm/drm_atomic_state_helper.c     |  12 +
> >  drivers/gpu/drm/drm_atomic_uapi.c             |  38 ++
> >  drivers/gpu/drm/drm_color_mgmt.c              | 177 +++++-
> >  .../gpu/drm/i915/display/intel_atomic_plane.c |   6 +
> >  .../gpu/drm/i915/display/intel_atomic_plane.h |   2 +
> >  drivers/gpu/drm/i915/display/intel_color.c    | 513 ++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_color.h    |   2 +
> >  .../drm/i915/display/skl_universal_plane.c    |  15 +-
> >  drivers/gpu/drm/i915/i915_drv.h               |   3 +
> >  drivers/gpu/drm/i915/i915_reg.h               | 176 +++++-
> >  include/drm/drm_mode_object.h                 |   2 +-
> >  include/drm/drm_plane.h                       |  81 +++
> >  include/uapi/drm/drm_mode.h                   |  58 ++
> >  15 files changed, 1170 insertions(+), 6 deletions(-)
> >

