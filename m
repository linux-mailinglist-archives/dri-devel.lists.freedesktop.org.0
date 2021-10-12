Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A4F42AE68
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 23:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06AF6E9E1;
	Tue, 12 Oct 2021 21:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC1B6E9E6;
 Tue, 12 Oct 2021 21:01:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="227554904"
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="227554904"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 14:01:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="547606463"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2021 14:01:34 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 12 Oct 2021 14:01:33 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX604.gar.corp.intel.com (10.67.234.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 02:31:31 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2242.012;
 Wed, 13 Oct 2021 02:31:31 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "brian.starkey@arm.com" <brian.starkey@arm.com>,
 "sebastian@sebastianwick.net" <sebastian@sebastianwick.net>,
 "Shashank.Sharma@amd.com" <Shashank.Sharma@amd.com>
Subject: RE: [RFC v2 00/22] Add Support for Plane Color Lut and CSC features
Thread-Topic: [RFC v2 00/22] Add Support for Plane Color Lut and CSC features
Thread-Index: AQHXo2JIE/IO8tQ2FEih6gWwBznIZ6vPHSKAgAD0N9A=
Date: Tue, 12 Oct 2021 21:01:30 +0000
Message-ID: <1260585655bd41ebb734056dd1f42740@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20211012145529.687dfdee@eldfell>
In-Reply-To: <20211012145529.687dfdee@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Pekka Paalanen <ppaalanen@gmail.com>
> Sent: Tuesday, October 12, 2021 5:25 PM
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> harry.wentland@amd.com; ville.syrjala@linux.intel.com; brian.starkey@arm.=
com;
> sebastian@sebastianwick.net; Shashank.Sharma@amd.com
> Subject: Re: [RFC v2 00/22] Add Support for Plane Color Lut and CSC featu=
res
>=20
> On Tue,  7 Sep 2021 03:08:42 +0530
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
> >
> > This patch series adds properties for plane color features. It adds
> > properties for degamma used to linearize data and CSC used for gamut
> > conversion. It also includes Gamma support used to again non-linearize
> > data as per panel supported color space. These can be utilize by user
> > space to convert planes from one format to another, one color space to
> > another etc.
> >
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
> > Note: Userspace support for this new UAPI will be done on Chrome in
> > alignment with weston and general opensource community.
> > Discussion ongoing with Harry Wentland, Pekka and community on color
> > pipeline and UAPI design. Harry's RFC below:
> > https://patchwork.freedesktop.org/series/89506/
> > We need to converge on a common UAPI interface which caters to all the
> > modern color hardware pipelines.
> >
> > ToDo: State readout for this feature will be added next.
> >
> > v2: Added UAPI description and added change in the rfc section of
> > kernel Documentation folder
>=20
> Hi,
>=20
> thank you for this. I do believe the KMS UAPI should expose what hardware=
 can do
> (prescribed operations) rather than how they would be often used (to real=
ize a
> conversion from one space description to another). This proposal fits qui=
te nicely
> with what I have envisioned for Weston.

> I mainly went over the big picture by commenting in detail on the proposa=
l
> document, and not looking too carefully at the other documentation or UAP=
I details
> at this time.

Thanks Pekka for the feedback.

> Unfortunately I was unable to decipher how userspace is supposed to use t=
he
> XE_LPD special gamma features.

I will include the details on how userspace should actually get this throug=
h a sample
IGT reference, that should help make this clear.

Regards,
Uma Shankar

>=20
> Thanks,
> pq
>=20
> >
> > Uma Shankar (22):
> >   drm: RFC for Plane Color Hardware Pipeline
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
> >  Documentation/gpu/rfc/drm_color_pipeline.rst  | 167 ++++++
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
> >  16 files changed, 1337 insertions(+), 6 deletions(-)  create mode
> > 100644 Documentation/gpu/rfc/drm_color_pipeline.rst
> >

