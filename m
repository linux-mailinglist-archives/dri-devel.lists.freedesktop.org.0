Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E968839E634
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 20:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060ED6E9AF;
	Mon,  7 Jun 2021 18:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D1D6E9AE;
 Mon,  7 Jun 2021 18:07:27 +0000 (UTC)
IronPort-SDR: +5p/t/D2vZhQy21M6cCL4U7W7oBJpE4B1Qu3eXJcbrO+WhHIVMkK5LQM5W5ehot8O45WRGNoV1
 kdK/OdfYoJlQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="185048098"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="185048098"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 11:07:27 -0700
IronPort-SDR: wwnIwISEhrnfoMGxVxjWfxc/OzOOjfOJ/DCzxW1KpCS3K+Eo95D7vo6LOQJmv5Y0StqA48akcj
 1V78AK2KW0Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="551317091"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 07 Jun 2021 11:07:26 -0700
Received: from bgsmsx603.gar.corp.intel.com (10.109.78.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 7 Jun 2021 11:07:25 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX603.gar.corp.intel.com (10.109.78.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 7 Jun 2021 23:37:23 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2242.008;
 Mon, 7 Jun 2021 23:37:23 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>, Harry Wentland
 <harry.wentland@amd.com>
Subject: RE: [PATCH 0/9] Enhance pipe color support for multi segmented luts
Thread-Topic: [PATCH 0/9] Enhance pipe color support for multi segmented luts
Thread-Index: AQHXVs2wPEDPA6xI2k+X99uG7qHEqqsD226AgAP4h4CAAQz/EA==
Date: Mon, 7 Jun 2021 18:07:23 +0000
Message-ID: <f14650b0e9734d309d685e6fc3f60e1e@intel.com>
References: <20210601104135.29020-1-uma.shankar@intel.com>
 <0909131c-1340-c93b-7b80-b661497ccf73@amd.com>
 <20210607102943.5c9bceb9@eldfell>
In-Reply-To: <20210607102943.5c9bceb9@eldfell>
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
 Sebastian Wick <sebastian@sebastianwick.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Modem, 
 Bhanuprakash" <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Pe=
kka
> Paalanen
> Sent: Monday, June 7, 2021 1:00 PM
> To: Harry Wentland <harry.wentland@amd.com>
> Cc: intel-gfx@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>=
;
> Sebastian Wick <sebastian@sebastianwick.net>; dri-devel@lists.freedesktop=
.org;
> Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: Re: [PATCH 0/9] Enhance pipe color support for multi segmented l=
uts
>=20
> On Fri, 4 Jun 2021 14:51:25 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
>=20
> > On 2021-06-01 6:41 a.m., Uma Shankar wrote:
> > > Modern hardwares have multi segmented lut approach to prioritize the
> > > darker regions of the spectrum. This series introduces a new UAPI to
> > > define the lut ranges supported by the respective hardware.
> > >
> > > This also enables Pipe Color Management Support for Intel's XE_LPD hw=
.
> > > Enable Support for Pipe Degamma with the increased lut samples
> > > supported by hardware. This also adds support for newly introduced
> > > Logarithmic Gamma for XE_LPD. Also added the gamma readout support.
> > >
> > > The Logarithmic gamma implementation on XE_LPD is non linear and
> > > adds 25 segments with non linear lut samples in each segment. The
> > > expectation is userspace will create the luts as per this
> > > distribution and pass the final samples to driver to be programmed in=
 hardware.
> > >
> >
> > Is this design targetting Intel XE_LPD HW in particular or is it
> > intended to be generic?
> >
> > If this is intended to be generic I think it would benefit from a lot
> > more documentation. At this point it's difficult for me to see how to
> > adapt this to AMD HW. It would take me a while to be comfortable to
> > make a call on whether we can use it or not. And what about other vendo=
rs?
> >
> > I think we need to be cautious in directly exposing HW functionality
> > through UAPI. The CM parts of AMD HW seem to be changing in some way
> > each generation and it looks like the same is true for Intel. The
> > trouble we have with adapting the old gamma/degamma properties to
> > modern HW is some indication to me that this approach is somewhat probl=
ematic.
> >
> > It would be useful to understand and document the specific use-cases
> > we want to provide to userspace implementers with this functionality.
> > Do we want to support modern transfer functions such as PQ or HLG? If
> > so, it might be beneficial to have an API to explicitly specify that,
> > and then use LUT tables in drivers that are optimized for the implement=
ing HW.
>=20
> Hi Harry,
>=20
> from my very limited understanding so far, enum might be fine for PQ, but=
 HLG is not
> just one transfer function, although it may often be confused as one. PQ =
and HLG
> are fundamentally different designs to HDR broadcasting I believe. It wou=
ld be
> unfortunate to make a mistake here, engraving it into UAPI.

Yes Pekka, putting this in UAPI may limit us.

> > Or is the use case tone mapping? If so, would a parametric definition
> > of tone mapping be easier to manage?
>=20
> A very good question at least I have no idea about.

Responded on earlier mail in thread. For non linear lut (gamma block), usec=
ase is primarily tone
mapping but there are implementations where non linear blending is seeked (=
AFAIR Android does that),
so it leaves room for those usecases as well.

Regards,
Uma Shankar
>=20
> Thanks,
> pq
>=20
> > > +-----+------------------------------+
> > > | x   |  2 pow x segment|No of Entries
> > > |     |  0              | 1          |
> > > | 0   |  1              | 1          |
> > > | 1   |  2              | 2          |
> > > | 2   |  4              | 2          |
> > > | 3   |  8              | 2          |
> > > | 4   |  16             | 2          |
> > > | 5   |  32             | 4          |
> > > | 6   |  64             | 4          |
> > > | 7   |  128            | 4          |
> > > | 8   |  256            | 8          |
> > > | 9   |  512            | 8          |
> > > | 10  |  1024           | 8          |
> > > | 11  |  2048           | 16         |
> > > | 12  |  4096           | 16         |
> > > | 13  |  8192           | 16         |
> > > | 14  |  16384          | 32         |
> > > | 15  |  32768          | 32         |
> > > | 16  |  65536          | 64         |
> > > | 17  |  131072         | 64         |
> > > | 18  |  262144         | 64         |
> > > | 19  |  524288         | 32         |
> > > | 20  |  1048576        | 32         |
> > > | 21  |  2097152        | 32         |
> > > | 22  |  4194304        | 32         |
> > > | 23  |  8388608        | 32         |
> > > | 24  |  16777216       | 1          |
> > > |     | Total Entries   | 511        |
> > >  -----+-----------------+------------+
> > >
> > > Credits: Special mention and credits to Ville Syrjala for coming up
> > > with a design for this feature and inputs. This series is based on
> > > his original design.
> > >
> > > Note: Userspace support for this new UAPI will be done on Chrome and
> > > plan is to get this supported on mutter as well. We will notify the
> > > list once we have that ready for review.
> > >
> >
> > Is this an RFC? If so it would be good to mark it as such.
> >
> > Harry
> >
> > > Uma Shankar (9):
> > >   drm: Add gamma mode property
> > >   drm/i915/xelpd: Define color lut range structure
> > >   drm/i915/xelpd: Add support for Logarithmic gamma mode
> > >   drm/i915/xelpd: Attach gamma mode property
> > >   drm: Add Client Cap for advance gamma mode
> > >   drm/i915/xelpd: logarithmic gamma enabled only with advance gamma m=
ode
> > >   drm/i915/xelpd: Enable Pipe Degamma
> > >   drm/i915/xelpd: Add Pipe Color Lut caps to platform config
> > >   drm/i915/xelpd: Enable XE_LPD Gamma Lut readout
> > >
> > >  drivers/gpu/drm/drm_atomic_uapi.c          |   8 +
> > >  drivers/gpu/drm/drm_color_mgmt.c           |  75 ++++
> > >  drivers/gpu/drm/drm_ioctl.c                |   5 +
> > >  drivers/gpu/drm/i915/display/intel_color.c | 454 +++++++++++++++++++=
+-
> > >  drivers/gpu/drm/i915/i915_pci.c            |   3 +-
> > >  drivers/gpu/drm/i915/i915_reg.h            |   7 +
> > >  include/drm/drm_atomic.h                   |   1 +
> > >  include/drm/drm_color_mgmt.h               |   8 +
> > >  include/drm/drm_crtc.h                     |  25 ++
> > >  include/drm/drm_file.h                     |   8 +
> > >  include/uapi/drm/drm.h                     |   8 +
> > >  include/uapi/drm/drm_mode.h                |  43 ++
> > >  12 files changed, 630 insertions(+), 15 deletions(-)
> > >
> >

