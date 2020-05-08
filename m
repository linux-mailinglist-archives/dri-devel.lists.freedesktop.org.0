Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5B41CA952
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 13:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932E66EB0D;
	Fri,  8 May 2020 11:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0056EB0D
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 11:13:40 +0000 (UTC)
IronPort-SDR: NdrNiWDMEncBXFWzNdW9Fu5N6pZGMBZKth3jPYwK2PzqMiMv7Rtmrb84nlh9T6Qql+JYYPf2ZD
 wEyb69I23d4Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2020 04:13:40 -0700
IronPort-SDR: eIF/Q1VZlJ45nFw/DjSjd0VLp+0OQ/8lcGbTp134K7Vnz4VtKQH2a69/2ieauy44eIByhNxtI6
 FtZR8tTtELNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,367,1583222400"; d="scan'208";a="278928059"
Received: from irsmsx107.ger.corp.intel.com ([163.33.3.99])
 by orsmga002.jf.intel.com with ESMTP; 08 May 2020 04:13:38 -0700
Received: from irsmsx606.ger.corp.intel.com (163.33.146.139) by
 IRSMSX107.ger.corp.intel.com (163.33.3.99) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 8 May 2020 12:13:38 +0100
Received: from irsmsx605.ger.corp.intel.com (163.33.146.138) by
 IRSMSX606.ger.corp.intel.com (163.33.146.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 8 May 2020 12:13:38 +0100
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138]) by
 IRSMSX605.ger.corp.intel.com ([163.33.146.138]) with mapi id 15.01.1713.004;
 Fri, 8 May 2020 12:13:38 +0100
From: "Kahola, Mika" <mika.kahola@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH v2] uapi/drm/drm_fourcc.h: Note on platform specificity
 for format modifiers
Thread-Topic: [PATCH v2] uapi/drm/drm_fourcc.h: Note on platform specificity
 for format modifiers
Thread-Index: AQHWI58P0LetH3BfX0Go7G4DJCUYMaids5YAgAA23ICAACGhYA==
Date: Fri, 8 May 2020 11:13:38 +0000
Message-ID: <e3060ab6bae34d0e8bfe2f9cf8308779@intel.com>
References: <20200506120827.12250-1-mika.kahola@intel.com>
 <20200508065628.GD1383626@phenom.ffwll.local>
 <20200508101249.GG1383626@phenom.ffwll.local>
In-Reply-To: <20200508101249.GG1383626@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
x-originating-ip: [163.33.253.164]
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Friday, May 8, 2020 1:13 PM
> To: Kahola, Mika <mika.kahola@intel.com>
> Cc: dri-devel@lists.freedesktop.org; daniel@ffwll.ch
> Subject: Re: [PATCH v2] uapi/drm/drm_fourcc.h: Note on platform specificity
> for format modifiers
> 
> On Fri, May 08, 2020 at 08:56:28AM +0200, Daniel Vetter wrote:
> > On Wed, May 06, 2020 at 03:08:27PM +0300, Mika Kahola wrote:
> > > Make an additional note on DRM format modifiers for x and y tiling.
> > > These format modifiers are defined for BDW+ platforms and therefore
> > > definition is not valid for older gens. This is due to address
> > > swizzling for tiled surfaces is no longer used. For newer platforms
> > > main memory controller has a more effective address swizzling algorithm.
> > >
> > > v2: Rephrase comment (Daniel)
> > >
> > > Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Ok I assumed you'd just push that to drm-intel with commit rights or something,
> but that got stuck so applying to drm-misc-next now.

Ok. Thanks a lot!

Cheers,
Mika

> 
> Cheers, Daniel
> >
> > > ---
> > >  include/uapi/drm/drm_fourcc.h | 18 ++++++++++++------
> > >  1 file changed, 12 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/include/uapi/drm/drm_fourcc.h
> > > b/include/uapi/drm/drm_fourcc.h index 8bc0b31597d8..9e488d10f8b4
> > > 100644
> > > --- a/include/uapi/drm/drm_fourcc.h
> > > +++ b/include/uapi/drm/drm_fourcc.h
> > > @@ -354,9 +354,12 @@ extern "C" {
> > >   * a platform-dependent stride. On top of that the memory can apply
> > >   * platform-depending swizzling of some higher address bits into bit6.
> > >   *
> > > - * This format is highly platforms specific and not useful for
> > > cross-driver
> > > - * sharing. It exists since on a given platform it does uniquely
> > > identify the
> > > - * layout in a simple way for i915-specific userspace.
> > > + * Note that this layout is only accurate on intel gen 8+ or valleyview
> chipsets.
> > > + * On earlier platforms the is highly platforms specific and not
> > > + useful for
> > > + * cross-driver sharing. It exists since on a given platform it
> > > + does uniquely
> > > + * identify the layout in a simple way for i915-specific userspace,
> > > + which
> > > + * facilitated conversion of userspace to modifiers. Additionally
> > > + the exact
> > > + * format on some really old platforms is not known.
> > >   */
> > >  #define I915_FORMAT_MOD_X_TILED	fourcc_mod_code(INTEL, 1)
> > >
> > > @@ -369,9 +372,12 @@ extern "C" {
> > >   * memory can apply platform-depending swizzling of some higher address
> bits
> > >   * into bit6.
> > >   *
> > > - * This format is highly platforms specific and not useful for
> > > cross-driver
> > > - * sharing. It exists since on a given platform it does uniquely
> > > identify the
> > > - * layout in a simple way for i915-specific userspace.
> > > + * Note that this layout is only accurate on intel gen 8+ or valleyview
> chipsets.
> > > + * On earlier platforms the is highly platforms specific and not
> > > + useful for
> > > + * cross-driver sharing. It exists since on a given platform it
> > > + does uniquely
> > > + * identify the layout in a simple way for i915-specific userspace,
> > > + which
> > > + * facilitated conversion of userspace to modifiers. Additionally
> > > + the exact
> > > + * format on some really old platforms is not known.
> > >   */
> > >  #define I915_FORMAT_MOD_Y_TILED	fourcc_mod_code(INTEL, 2)
> > >
> > > --
> > > 2.20.1
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> 
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
