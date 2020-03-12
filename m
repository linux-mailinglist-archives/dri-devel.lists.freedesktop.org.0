Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E044183515
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 16:37:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159546EAE8;
	Thu, 12 Mar 2020 15:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47F46E245;
 Thu, 12 Mar 2020 15:37:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 08:37:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; d="scan'208";a="415974688"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga005.jf.intel.com with ESMTP; 12 Mar 2020 08:37:24 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 12 Mar 2020 08:37:24 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 12 Mar 2020 08:37:07 -0700
Received: from bgsmsx105.gar.corp.intel.com (10.223.43.197) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 12 Mar 2020 08:37:06 -0700
Received: from BGSMSX107.gar.corp.intel.com ([169.254.9.15]) by
 BGSMSX105.gar.corp.intel.com ([169.254.3.70]) with mapi id 14.03.0439.000;
 Thu, 12 Mar 2020 21:07:04 +0530
From: "Laxminarayan Bharadiya, Pankaj"
 <pankaj.laxminarayan.bharadiya@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 "Lattannavar, Sameer" <sameer.lattannavar@intel.com>
Subject: RE: [RFC][PATCH 0/5] Introduce drm scaling filter property
Thread-Topic: [RFC][PATCH 0/5] Introduce drm scaling filter property
Thread-Index: AQHV+HctBjfB2kqX90uGdf9/VtAqI6hFFo+g
Date: Thu, 12 Mar 2020 15:37:03 +0000
Message-ID: <E92BA18FDE0A5B43B7B3DA7FCA031286057B3798@BGSMSX107.gar.corp.intel.com>
References: <20200225070545.4482-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200312140434.GG13686@intel.com>
In-Reply-To: <20200312140434.GG13686@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
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
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>, "Kunche,
 Kishore" <kishore.kunche@intel.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>,
 "mihail.atanassov@arm.com" <mihail.atanassov@arm.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: 12 March 2020 19:35
> To: Laxminarayan Bharadiya, Pankaj
> <pankaj.laxminarayan.bharadiya@intel.com>
> Cc: jani.nikula@linux.intel.com; daniel@ffwll.ch; intel-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; airlied@linux=
.ie;
> maarten.lankhorst@linux.intel.com; tzimmermann@suse.de;
> mripard@kernel.org; mihail.atanassov@arm.com; linux-
> kernel@vger.kernel.org; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> Subject: Re: [RFC][PATCH 0/5] Introduce drm scaling filter property
> =

> On Tue, Feb 25, 2020 at 12:35:40PM +0530, Pankaj Bharadiya wrote:
> > Integer scaling (IS) is a nearest-neighbor upscaling technique that
> > simply scales up the existing pixels by an integer (i.e., whole
> > number) multiplier. Nearest-neighbor (NN) interpolation works by
> > filling in the missing color values in the upscaled image with that of
> > the coordinate-mapped nearest source pixel value.
> >
> > Both IS and NN preserve the clarity of the original image. In
> > contrast, traditional upscaling algorithms, such as bilinear or
> > bicubic interpolation, result in blurry upscaled images because they
> > employ interpolation techniques that smooth out the transition from
> > one pixel to another.  Therefore, integer scaling is particularly
> > useful for pixel art games that rely on sharp, blocky images to
> > deliver their distinctive look.
> >
> > Many gaming communities have been asking for integer-mode scaling
> > support, some links and background:
> >
> > https://software.intel.com/en-us/articles/integer-scaling-support-on-i
> > ntel-graphics http://tanalin.com/en/articles/lossless-scaling/
> > https://community.amd.com/thread/209107
> > https://www.nvidia.com/en-us/geforce/forums/game-ready-drivers/13/1002
> > /feature-request-nonblurry-upscaling-at-integer-rat/
> >
> > This patch series -
> >   - Introduces new scaling filter property to allow userspace to
> >     select  the driver's default scaling filter or Nearest-neighbor(NN)
> >     filter for scaling operations on crtc/plane.
> >   - Implements and enable integer scaling for i915
> >
> > Userspace patch series link: TBD.
> =

> That needs to be done or this will go nowhere.

Yes, Sameer is working on enabling this feature in Kodi. =

Sameer, please share link here once you post patches.
 =

Thanks,
Pankaj

> =

> >
> > Thanks to Shashank for initiating this work. His initial RFC can be
> > found here [1]
> >
> > [1] https://patchwork.freedesktop.org/patch/337082/
> >
> > Modifications done in this series -
> >    - refactored code and incorporated initial review comments and
> >      added 2 scaling filter types (default and NN) to begin with.
> >    - added scaling filter property support for planes and new API
> >      helpers for drivers to setup this property.
> >    - rewrote code to enable integer scaling and NN filter for i915
> >
> >
> > Pankaj Bharadiya (5):
> >   drm: Introduce scaling filter property
> >   drm/drm-kms.rst: Add Scaling filter property documentation
> >   drm/i915: Enable scaling filter for plane and pipe
> >   drm/i915: Introduce scaling filter related registers and bit fields.
> >   drm/i915/display: Add Nearest-neighbor based integer scaling support
> >
> >  Documentation/gpu/drm-kms.rst                |   6 ++
> >  drivers/gpu/drm/drm_atomic_uapi.c            |   8 ++
> >  drivers/gpu/drm/drm_crtc.c                   |  16 +++
> >  drivers/gpu/drm/drm_mode_config.c            |  13 +++
> >  drivers/gpu/drm/drm_plane.c                  |  35 +++++++
> >  drivers/gpu/drm/i915/display/intel_display.c | 100 ++++++++++++++++++-
> >  drivers/gpu/drm/i915/display/intel_display.h |   2 +
> >  drivers/gpu/drm/i915/display/intel_sprite.c  |  32 ++++--
> >  drivers/gpu/drm/i915/i915_reg.h              |  21 ++++
> >  include/drm/drm_crtc.h                       |  10 ++
> >  include/drm/drm_mode_config.h                |   6 ++
> >  include/drm/drm_plane.h                      |  14 +++
> >  12 files changed, 252 insertions(+), 11 deletions(-)
> >
> > --
> > 2.23.0
> =

> --
> Ville Syrj=E4l=E4
> Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
