Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D878242AE6E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 23:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0536E030;
	Tue, 12 Oct 2021 21:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFD16E030;
 Tue, 12 Oct 2021 21:02:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="227168082"
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="227168082"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 14:02:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="547606934"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2021 14:02:56 -0700
Received: from bgsmsx606.gar.corp.intel.com (10.67.234.8) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 12 Oct 2021 14:02:55 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX606.gar.corp.intel.com (10.67.234.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 02:32:53 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2242.012;
 Wed, 13 Oct 2021 02:32:53 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "brian.starkey@arm.com" <brian.starkey@arm.com>,
 "sebastian@sebastianwick.net" <sebastian@sebastianwick.net>,
 "Shashank.Sharma@amd.com" <Shashank.Sharma@amd.com>
Subject: RE: [RFC v2 03/22] drm: Add Plane Degamma Mode property
Thread-Topic: [RFC v2 03/22] drm: Add Plane Degamma Mode property
Thread-Index: AQHXo2JOuoDKY7Z/CEScLcTVgGuQlavPG5wAgAD2ZBA=
Date: Tue, 12 Oct 2021 21:02:53 +0000
Message-ID: <1875243ac7544f79b398c16c312b7322@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-4-uma.shankar@intel.com>
 <20211012145002.4382df2b@eldfell>
In-Reply-To: <20211012145002.4382df2b@eldfell>
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
> Sent: Tuesday, October 12, 2021 5:20 PM
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> harry.wentland@amd.com; ville.syrjala@linux.intel.com; brian.starkey@arm.=
com;
> sebastian@sebastianwick.net; Shashank.Sharma@amd.com
> Subject: Re: [RFC v2 03/22] drm: Add Plane Degamma Mode property
>=20
> On Tue,  7 Sep 2021 03:08:45 +0530
> Uma Shankar <uma.shankar@intel.com> wrote:
>=20
> > Add Plane Degamma Mode as an enum property. Create a helper function
> > for all plane color management features.
> >
> > This is an enum property with values as blob_id's and exposes the
> > various gamma modes supported and the lut ranges. Getting the blob id
> > in userspace, user can get the mode supported and also the range of
> > gamma mode supported with number of lut coefficients. It can then set
> > one of the modes using this enum property.
> >
> > Lut values will be sent through separate GAMMA_LUT blob property.
> >
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > ---
> >  Documentation/gpu/drm-kms.rst             | 90 ++++++++++++++++++++++
> >  drivers/gpu/drm/drm_atomic.c              |  1 +
> >  drivers/gpu/drm/drm_atomic_state_helper.c |  2 +
> >  drivers/gpu/drm/drm_atomic_uapi.c         |  4 +
> >  drivers/gpu/drm/drm_color_mgmt.c          | 93 ++++++++++++++++++++++-
> >  include/drm/drm_mode_object.h             |  2 +-
> >  include/drm/drm_plane.h                   | 23 ++++++
> >  7 files changed, 212 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/gpu/drm-kms.rst
> > b/Documentation/gpu/drm-kms.rst index 1ef7951ded5e..f4658417bf20
> > 100644
> > --- a/Documentation/gpu/drm-kms.rst
> > +++ b/Documentation/gpu/drm-kms.rst
> > @@ -545,9 +545,99 @@ Damage Tracking Properties  Color Management
> > Properties
> >  ---------------------------
> >
> > +Below is how a typical hardware pipeline for color will look like:
> > +
> > +.. kernel-render:: DOT
> > +   :alt: Display Color Pipeline
> > +   :caption: Display Color Pipeline Overview
> > +
> > +   digraph "KMS" {
> > +      node [shape=3Dbox]
> > +
> > +      subgraph cluster_static {
> > +          style=3Ddashed
> > +          label=3D"Display Color Hardware Blocks"
> > +
> > +          node [bgcolor=3Dgrey style=3Dfilled]
> > +          "Plane Degamma A" -> "Plane CSC/CTM A"
> > +          "Plane CSC/CTM A" -> "Plane Gamma A"
> > +          "Pipe Blender" [color=3Dlightblue,style=3Dfilled, width=3D5.=
25, height=3D0.75];
> > +          "Plane Gamma A" -> "Pipe Blender"
> > +	  "Pipe Blender" -> "Pipe DeGamma"
> > +          "Pipe DeGamma" -> "Pipe CSC/CTM"
> > +          "Pipe CSC/CTM" -> "Pipe Gamma"
> > +          "Pipe Gamma" -> "Pipe Output"
> > +      }
> > +
> > +      subgraph cluster_static {
> > +          style=3Ddashed
> > +
> > +          node [shape=3Dbox]
> > +          "Plane Degamma B" -> "Plane CSC/CTM B"
> > +          "Plane CSC/CTM B" -> "Plane Gamma B"
> > +          "Plane Gamma B" -> "Pipe Blender"
> > +      }
> > +
> > +      subgraph cluster_static {
> > +          style=3Ddashed
> > +
> > +          node [shape=3Dbox]
> > +          "Plane Degamma C" -> "Plane CSC/CTM C"
> > +          "Plane CSC/CTM C" -> "Plane Gamma C"
> > +          "Plane Gamma C" -> "Pipe Blender"
> > +      }
> > +
> > +      subgraph cluster_fb {
> > +          style=3Ddashed
> > +          label=3D"RAM"
> > +
> > +          node [shape=3Dbox width=3D1.7 height=3D0.2]
> > +
> > +          "FB 1" -> "Plane Degamma A"
> > +          "FB 2" -> "Plane Degamma B"
> > +          "FB 3" -> "Plane Degamma C"
> > +      }
> > +   }
> > +
> > +In real world usecases,
> > +
> > +1. Plane Degamma can be used to linearize a non linear gamma encoded
> > +framebuffer. This is needed to do any linear math like color space
> > +conversion. For ex, linearize frames encoded in SRGB or by HDR curve.
>=20
> Hi,
>=20
> Maybe better to avoid the term "gamma" as the curves are not always a pur=
e power
> function.
>=20
> sRGB with a small s.

Sure Pekka, will update these.

Thanks & Regards,
Uma Shankar

>=20
> Thanks,
> pq
>=20
> > +
> > +2. Later Plane CTM block can convert the content to some different
> > +colorspace. For ex, SRGB to BT2020 etc.
> > +
> > +3. Plane Gamma block can be used later to re-apply the non-linear
> > +curve. This can also be used to apply Tone Mapping for HDR usecases.
> > +
> > +All the layers or framebuffers need to be converted to same color
> > +space and format before blending. The plane color hardware blocks can
> > +help with this. Once the Data is blended, similar color processing
> > +can be done on blended output using pipe color hardware blocks.
> > +
> > +DRM Properties have been created to define and expose all these
> > +hardware blocks to userspace. A userspace application (compositor or
> > +any color app) can use these interfaces and define policies to
> > +efficiently use the display hardware for such color operations.
> > +
> > +Pipe Color Management Properties
> > +---------------------------------
> > +
> >  .. kernel-doc:: drivers/gpu/drm/drm_color_mgmt.c
> >     :doc: overview
> >
> > +Plane Color Management Properties
> > +---------------------------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/drm_color_mgmt.c
> > +   :doc: Plane Color Properties
> > +
> > +.. kernel-doc:: drivers/gpu/drm/drm_color_mgmt.c
> > +   :doc: export
> > +
> >  Tile Group Property
> >  -------------------
