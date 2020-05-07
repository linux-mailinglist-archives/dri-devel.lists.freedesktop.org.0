Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2464A1C8260
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 08:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712656E041;
	Thu,  7 May 2020 06:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601476E02E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 06:18:35 +0000 (UTC)
IronPort-SDR: ynimP46ccXa8jP7NIjLShqMt97RrOTdoxX9Xn+gLR6+1fVppnm4S8qJD5XuKNokHxk+K8Rly9w
 L55a8Lz9erfg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 23:18:34 -0700
IronPort-SDR: s+137jPejiS2+v5x9CYYcqJWZEO9Mgcpti8vCV+YamOUHmlaODLkpSOhqBAPhbxn3azAcNfO7k
 taEJ/QCHYbDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,362,1583222400"; d="scan'208";a="250002612"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 06 May 2020 23:18:32 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 07 May 2020 09:18:31 +0300
Date: Thu, 7 May 2020 09:18:31 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Artem Mygaiev <joculator@gmail.com>
Subject: Re: Question about sRGB framebuffer support
Message-ID: <20200507061831.GU6112@intel.com>
References: <CAJwc6KtGT4+Y2jT1fxzYrkcqvkxgs9GGqxT-zZtj6ktRf-67jQ@mail.gmail.com>
 <20200506074457.GK6112@intel.com>
 <CAJwc6Kum2SrGixZyJzAWjC71pxO8zkBJ7MBfdVhxZOFvWyw4RQ@mail.gmail.com>
 <20200506091840.GP6112@intel.com>
 <CAJwc6Kvg3o2S3tYOoUqfCrg9eagErtStRkgQAASwm0uFPhVxew@mail.gmail.com>
 <20200506093316.GQ6112@intel.com>
 <CAJwc6KsY0fQwQE8RA5BVnuVqNm12W7fJWdi_vR8u+91erpe8Og@mail.gmail.com>
 <20200507060759.GT6112@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507060759.GT6112@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 07, 2020 at 09:07:59AM +0300, Ville Syrj=E4l=E4 wrote:
> On Wed, May 06, 2020 at 04:54:08PM +0300, Artem Mygaiev wrote:
> > On Wed, May 6, 2020 at 12:33 PM Ville Syrj=E4l=E4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Wed, May 06, 2020 at 12:25:00PM +0300, Artem Mygaiev wrote:
> > > > On Wed, May 6, 2020 at 12:18 PM Ville Syrj=E4l=E4
> > > > <ville.syrjala@linux.intel.com> wrote:
> > > > >
> > > > > On Wed, May 06, 2020 at 12:04:22PM +0300, Artem Mygaiev wrote:
> > > > > > Hello Ville
> > > > > >
> > > > > > On Wed, May 6, 2020 at 10:45 AM Ville Syrj=E4l=E4
> > > > > > <ville.syrjala@linux.intel.com> wrote:
> > > > > > >
> > > > > > > On Tue, May 05, 2020 at 01:24:16PM +0300, Artem Mygaiev wrote:
> > > > > > > > Hello all
> > > > > > > >
> > > > > > > > I am currently working on DRM/KMS driver for Fresco Logic F=
L2000 USB display
> > > > > > > > controller [1]. I have already implemented a POC driver [2]=
 which is working for
> > > > > > > > me, although there are still plenty of things to improve or=
 fix, of course.
> > > > > > > >
> > > > > > > > So far I have one thing that I somehow cannot find in DRM/K=
MS documentation or
> > > > > > > > existing drivers: how to tell the system that HW expects sR=
GB (i.e. non-linear)
> > > > > > > > color encoding in framebuffers? This is a HW limitation tha=
t I cannot influence
> > > > > > > > by configuration.
> > > > > > >
> > > > > > > Does it do something to process the data that requires linear=
ization
> > > > > > > or why does it care about the gamma applied to the data? In a=
 typical
> > > > > > > use case the data is just passed through unless the user asks=
 otherwise,
> > > > > > > so it doesn't matter much what gamma was used. Though most di=
splays
> > > > > > > probably expect something resembling sRGB gamma by default, s=
o that's
> > > > > > > presumably what most things generate, and images/videos/etc. =
pretty
> > > > > > > much always have gamma already applied when they are produced.
> > > > > > >
> > > > > >
> > > > > > Unfortunately the HW was designed in a way that when it is conf=
igured to 24-bit
> > > > > > RGB888 it expects sRGB and applies degamma automatically. It is=
 not possible to
> > > > > > disable this, I've asked vendor and they confirmed this [1].
> > > > >
> > > > > So it always does degamma+gamma for no real reason? That shouldn't
> > > > > really matter (apart from potentially losing some precision in th=
ose
> > > > > conversions).
> > > > >
> > > >
> > > > It always does only degamma (sRGB -> linear), so if you supply line=
ar RGB it
> > > > will totally corrupt picture colors, e.g. this is how kmscube looks=
 like:
> > > > https://github.com/klogg/fl2000_drm/issues/15
> > >
> > > That doesn't really make sense to me. You never feed linear data to
> > > actual displays.
> > >
> > =

> > I have a display with gamma 1.0 (as populated in EDID) which I assume m=
eans
> > linear gamma (am I wrong here?) which is connected to FL2000 dongle, so=
 there is
> > no gamma applied after de-gamma.
> =

> Never seen one like that myself IIRC.
> =

> Hmm. Looks like edid-decode (assuming that's what you used) decodes a =

> value of 0xff as 1.0 for EDID v1.3 and older. That may be what's
> happening in your case. Unfortunately the spec only says ""If set to
> FFh, the gamma value is not defined here." without any further hint
> as to where it might actually be defined. I think the only other
> place we know of is the DispID ext block. Do you have one of those?
> I suspect DispID might require the EDID to be v1.4 though.

Actually just found two ways an extension block might specify: =

Display Information Extension (DI-EXT), and Display Transfer
Characteristics Data Block (DTCDB) as part of the CEA ext block.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
