Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A7C1C6FCF
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 14:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C8F6E86D;
	Wed,  6 May 2020 12:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF9E6E871
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 12:00:21 +0000 (UTC)
IronPort-SDR: UeL2QP5zoBwsTo+r0pxGi6HbvHLTNbWXyQn+UR+UPU9y6HxQWApb27Tp21FOe0WprhBrR/BspT
 zGvhfVsv74/w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 05:00:20 -0700
IronPort-SDR: 0uIZgfcphnol4MKi9YN8aLCTBYDI3BtaA8J+IPxlIFCk40rTwHBbHxhLdtLCg1eVRwZFCBPLPH
 8jwFCRJDDm+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,358,1583222400"; d="scan'208";a="369774289"
Received: from irsmsx151.ger.corp.intel.com ([163.33.192.59])
 by fmsmga001.fm.intel.com with ESMTP; 06 May 2020 05:00:19 -0700
Received: from irsmsx603.ger.corp.intel.com (163.33.146.9) by
 IRSMSX151.ger.corp.intel.com (163.33.192.59) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 6 May 2020 13:00:19 +0100
Received: from irsmsx605.ger.corp.intel.com (163.33.146.138) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 6 May 2020 13:00:19 +0100
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138]) by
 IRSMSX605.ger.corp.intel.com ([163.33.146.138]) with mapi id 15.01.1713.004;
 Wed, 6 May 2020 13:00:19 +0100
From: "Kahola, Mika" <mika.kahola@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH] uapi/drm/drm_fourcc.h: Note on platform specificity for
 format modifiers
Thread-Topic: [PATCH] uapi/drm/drm_fourcc.h: Note on platform specificity for
 format modifiers
Thread-Index: AQHWIfOp0tLqZCmhM0y+3g058My5xaiXtncAgANA54A=
Date: Wed, 6 May 2020 12:00:18 +0000
Message-ID: <b97f28743a3b467691fb8e1baaab46e7@intel.com>
References: <20200504090843.27074-1-mika.kahola@intel.com>
 <CAKMK7uHb-BADzBcrFgpopq0qQSB=WAQbmJJs=OdypqpSmH+X0w@mail.gmail.com>
In-Reply-To: <CAKMK7uHb-BADzBcrFgpopq0qQSB=WAQbmJJs=OdypqpSmH+X0w@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Monday, May 4, 2020 2:17 PM
> To: Kahola, Mika <mika.kahola@intel.com>
> Cc: dri-devel <dri-devel@lists.freedesktop.org>
> Subject: Re: [PATCH] uapi/drm/drm_fourcc.h: Note on platform specificity for
> format modifiers
> 
> On Mon, May 4, 2020 at 11:08 AM Mika Kahola <mika.kahola@intel.com>
> wrote:
> >
> > Make an additional note on DRM format modifiers for x and y tiling.
> > These format modifiers are defined for BDW+ platforms and therefore
> > definition is not valid for older gens. This is due to address
> > swizzling for tiled surfaces is no longer used. For newer platforms
> > main memory controller has a more effective address swizzling algorithm.
> >
> > Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> > ---
> >  include/uapi/drm/drm_fourcc.h | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/uapi/drm/drm_fourcc.h
> > b/include/uapi/drm/drm_fourcc.h index 8bc0b31597d8..3e56c24cabb6
> > 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -356,7 +356,8 @@ extern "C" {
> >   *
> >   * This format is highly platforms specific and not useful for cross-driver
> >   * sharing. It exists since on a given platform it does uniquely
> > identify the
> > - * layout in a simple way for i915-specific userspace.
> > + * layout in a simple way for i915-specific userspace.  The format is
> > + * ill-defined for platforms older than BDW.
> 
> Hm this is a bit confusing, since you're just adding a new sentences and not
> really clarifying the paragraph overall. Right above we have the detailed
> description of the modifier on gen8+, I'd replace the entire paragraph here with
> something like:
> 
> "Note that this layout is only accurate on intel gen 8+ or valleyview chipsets. On
> earlier platforms the is highly platforms specific and not useful for cross-driver
> sharing. It exists since on a given platform it does uniquely identify the layout in
> a simple way for i915-specific userspace, which facilitated conversion of
> userspace to modifiers. Additionally the exact format on some really old
> platforms is not known."
> 
> That way it's much clearer that the specification is well-defined and where, with
> the old stuff as exceptions. Your patch kinda makes bdw+ the exception of the
> exception, and that's hard to understand.
I admit, that the wording may have been confusing. I'll update the patch with your proposal.

Cheers,
Mika

> 
> Cheers, Daniel
> 
> 
> 
> >   */
> >  #define I915_FORMAT_MOD_X_TILED        fourcc_mod_code(INTEL, 1)
> >
> > @@ -371,7 +372,8 @@ extern "C" {
> >   *
> >   * This format is highly platforms specific and not useful for cross-driver
> >   * sharing. It exists since on a given platform it does uniquely
> > identify the
> > - * layout in a simple way for i915-specific userspace.
> > + * layout in a simple way for i915-specific userspace. The format is
> > + * ill-defined for platforms older than BDW.
> >   */
> >  #define I915_FORMAT_MOD_Y_TILED        fourcc_mod_code(INTEL, 2)
> >
> > --
> > 2.20.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> 
> 
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
