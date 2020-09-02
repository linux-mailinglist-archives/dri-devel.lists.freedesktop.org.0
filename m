Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9854525AA8D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 13:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4054F6E480;
	Wed,  2 Sep 2020 11:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0078B6E480
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 11:51:51 +0000 (UTC)
IronPort-SDR: 9Nwg5YdIaeeR+L4Sk1fkGIY/w4OMiekp4Vx766reHEUjS+9HUvfnxqiG1pqZ9uGxjRTgal39oQ
 0q6sEDoXOiQw==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="154771557"
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="154771557"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 04:51:51 -0700
IronPort-SDR: CQtRM1RYJ5MtLy/4Fdp89zGj+K2Bq/D7QL0v7PbePF0FOXKDnBv3HLrkBKubWgYFkkDx98vx/O
 eh8b/A6hlstQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="341384980"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 02 Sep 2020 04:51:47 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 02 Sep 2020 14:51:46 +0300
Date: Wed, 2 Sep 2020 14:51:46 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/vkms: add support for gamma_set interface
Message-ID: <20200902115146.GP6112@intel.com>
References: <20200829140647.7626-1-realwakka@gmail.com>
 <UeJwFKvmNgKdZY_icN0-nrFly9R1vbzaMZ-TiyxIIPBcdl278uZsK6YdTTdRl6rFukBAmN-eyCFpnfsIB-El9QpyYiutdcpgJg64n4tsRRc=@emersion.fr>
 <20200831133858.GA9280@realwakka> <20200831134852.GY6112@intel.com>
 <C7EgdPUBX9nRTKx9kkGIZijd0yGMOLEtXOwa2jvk-rKtprmNZKSDP-Jos7mYU88DOQYiXJBnz0_D2FAQ1x7jCwLcR-cmZtzCc5cLsJqyDCk=@emersion.fr>
 <20200901132656.GD2352366@phenom.ffwll.local>
 <DtMHF2YzGDmVCCHE0UKH2NdZW1XmY3V3DoP-rvWbpYlFi1s5ncHyqDZd27U6ya_LBm64G73rqYlZMU0rI4IBcdiUaiSvtGDj2WW3bgZGKDc=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DtMHF2YzGDmVCCHE0UKH2NdZW1XmY3V3DoP-rvWbpYlFi1s5ncHyqDZd27U6ya_LBm64G73rqYlZMU0rI4IBcdiUaiSvtGDj2WW3bgZGKDc=@emersion.fr>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, Sidong Yang <realwakka@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 02, 2020 at 09:09:11AM +0000, Simon Ser wrote:
> On Tuesday, September 1, 2020 3:26 PM, Daniel Vetter <daniel@ffwll.ch> wr=
ote:
> =

> > On Tue, Sep 01, 2020 at 08:57:37AM +0000, Simon Ser wrote:
> >
> > > On Monday, August 31, 2020 3:48 PM, Ville Syrj=E4l=E4 ville.syrjala@l=
inux.intel.com wrote:
> > >
> > > > > > It doesn't seem like this IGT test's goal is to exercise suppor=
t for
> > > > > > gamma LUTs. Does the test just tries to reset the gamma LUT to =
linear?
> > > > > > If so, I think the IGT test should be fixed to ignore "I don't =
support
> > > > > > gamma" errors.
> > > > >
> > > > > It seems like that IGT test pixel-format is to make gamma lut lik=
e below.
> > > > > for (i =3D 0; i < lut_size; i++)
> > > > > lut[i] =3D (i * 0xffff / (lut_size - 1)) & mask;
> > > > > And set this table to drm driver. and test begins. It's the test =
about pixel
> > > > > format. I think you're right. It's not about gamma lut.
> > > >
> > > > The point of the gamma LUT stuff in the pixel format test is to thr=
ow
> > > > away a bunch of the lsbs so that the test passes when the result is
> > > > "close enough" to the 8bpc RGB reference image. Without it we would
> > > > never get a crc match when testing non-8bpc or YCbCr formats.
> > >
> > > OK, that makes sense. Would it be sensible to:
> > >
> > > -   Don't set gamma if the pixel format being tested is 8bpc
> >
> > Hm not sure what 8bpc format you mean here, because we have C8 (needs
> > gamma table or doesn't work) and the 8b greyscale one with the R8 one. =
If
> > you ask for legacy 8bpc you get C8.
> =

> Why do we need a gamma LUT for C8 and R8? There shouldn't be any
> precision loss, right?

C8 always needs a LUT. Somewhat annoying legacy uapi thing that the
crtc's gamma LUT is also the LUT for C8 scanout, but at least it does
match how eg. Intel hw works. I think ideally there should a separate
per-plane LUT for this (with i915 then having to check that the same
LUT is used for all C8 planes on the crtc).

As for why we might need the LUT even for 8bpc formats.
The test does the following:
capture a reference CRC using XRGB8888
for_each_format
	capture CRC using the format
	compare CRC to the reference CRC

So all formats need to use the LUT to preserve the same number
of msbs and throw away the unwanted lsbs.

I guess we could add a special case for the "plane only
supports 8bpc formats" situation and omit the LUT in that case...


> =

> > > -   Make the test skip if the pixel format is >8bpc and gamma isn't
> > >     supported
> > >
> >
> > Yeah the test should skip if gamma isn't there.
> > -Daniel
> >
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> > --
> >
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> =


-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
