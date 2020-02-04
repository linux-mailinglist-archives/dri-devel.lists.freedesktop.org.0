Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24063151B54
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 14:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9636EEA9;
	Tue,  4 Feb 2020 13:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2ECC6EEA9;
 Tue,  4 Feb 2020 13:32:41 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Feb 2020 05:32:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,401,1574150400"; d="scan'208";a="263836507"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 04 Feb 2020 05:32:13 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 04 Feb 2020 15:32:12 +0200
Date: Tue, 4 Feb 2020 15:32:12 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [Intel-gfx] [PATCH 6/8] drm/edid: Add a FIXME about DispID CEA
 data block revision
Message-ID: <20200204133212.GI13686@intel.com>
References: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
 <20200124200231.10517-6-ville.syrjala@linux.intel.com>
 <E7C9878FBA1C6D42A1CA3F62AEB6945F823AA020@BGSMSX104.gar.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E7C9878FBA1C6D42A1CA3F62AEB6945F823AA020@BGSMSX104.gar.corp.intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Andres Rodriguez <andresx7@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 03, 2020 at 08:15:51PM +0000, Shankar, Uma wrote:
> =

> =

> > -----Original Message-----
> > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of =
Ville Syrjala
> > Sent: Saturday, January 25, 2020 1:32 AM
> > To: dri-devel@lists.freedesktop.org
> > Cc: intel-gfx@lists.freedesktop.org; Andres Rodriguez <andresx7@gmail.c=
om>
> > Subject: [Intel-gfx] [PATCH 6/8] drm/edid: Add a FIXME about DispID CEA=
 data block
> > revision
> > =

> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > I don't understand what the DispID CEA data block revision means. The s=
pec doesn't
> > say. I guess some DispID must have a value of >=3D 3 in there or else w=
e generally
> > wouldn't even parse the CEA data blocks. Or does all this code actually=
 not do
> > anything?
> =

> This signifies the CTA extension revision (byte 1 of the block). As per t=
he spec, seems like
> Version 1 is legacy and 2 is deprecated. So version >=3D3 is checked here.
> Refer section 7.3 of CTA-861-G

The confusion is about the revision field in the DispID CTA
block, not in the CTA extension block.

> =

> > Cc: Andres Rodriguez <andresx7@gmail.com>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_edid.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > =

> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c in=
dex
> > 0369a54e3d32..fd9b724067a7 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -3977,6 +3977,13 @@ cea_db_tag(const u8 *db)  static int  cea_revisi=
on(const
> > u8 *cea)  {
> > +	/*
> > +	 * FIXME is this correct for the DispID variant?
> > +	 * The DispID spec doesn't really specify whether
> > +	 * this is the revision of the CEA extension or
> > +	 * the DispID CEA data block. And the only value
> > +	 * given as an example is 0.
> > +	 */
> >  	return cea[1];
> >  }
> > =

> > --
> > 2.24.1
> > =

> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
