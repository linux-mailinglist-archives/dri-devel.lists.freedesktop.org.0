Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 982E21510A2
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 21:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E186ECDE;
	Mon,  3 Feb 2020 20:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CF26ECDC;
 Mon,  3 Feb 2020 20:00:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 11:58:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="231129362"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga003.jf.intel.com with ESMTP; 03 Feb 2020 11:58:42 -0800
Received: from fmsmsx123.amr.corp.intel.com (10.18.125.38) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 11:58:41 -0800
Received: from bgsmsx153.gar.corp.intel.com (10.224.23.4) by
 fmsmsx123.amr.corp.intel.com (10.18.125.38) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 11:58:41 -0800
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.36]) by
 BGSMSX153.gar.corp.intel.com ([169.254.2.127]) with mapi id 14.03.0439.000;
 Tue, 4 Feb 2020 01:28:39 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, "Alex
 Deucher" <alexdeucher@gmail.com>
Subject: RE: [PATCH 5/8] drm/edid: Document why we don't bounds check the
 DispID CEA block start/end
Thread-Topic: [PATCH 5/8] drm/edid: Document why we don't bounds check the
 DispID CEA block start/end
Thread-Index: AQHV0vFSrrgREs7jO0mnOrQnC27d8Kf+wLsAgADdqgCAClNd4A==
Date: Mon, 3 Feb 2020 19:58:38 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F823A9FF7@BGSMSX104.gar.corp.intel.com>
References: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
 <20200124200231.10517-5-ville.syrjala@linux.intel.com>
 <CADnq5_MM5VHhZan=Q-NUjgvmyovg_33DjvNcZ3kO0=rxCkizQg@mail.gmail.com>
 <20200128114404.GG13686@intel.com>
In-Reply-To: <20200128114404.GG13686@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNTlkNmRiYTctNjBkYy00M2UwLTlhZDUtMjZlYzY2OGM1NDU5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQVlyNERwT3RkQk1kOUZEVkx2MU9VZHlzRTQ3NUt0SVNUUWVac1RodGZIOHNsTVAyc1Vzd0x4MURiSDc5K3VaYyJ9
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Andres
 Rodriguez <andresx7@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Vi=
lle Syrj=E4l=E4
> Sent: Tuesday, January 28, 2020 5:14 PM
> To: Alex Deucher <alexdeucher@gmail.com>
> Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>; Andres =
Rodriguez
> <andresx7@gmail.com>; Maling list - DRI developers <dri-
> devel@lists.freedesktop.org>
> Subject: Re: [PATCH 5/8] drm/edid: Document why we don't bounds check the
> DispID CEA block start/end
> =

> On Mon, Jan 27, 2020 at 05:30:42PM -0500, Alex Deucher wrote:
> > On Fri, Jan 24, 2020 at 3:03 PM Ville Syrjala
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > >
> > > After much head scratching I managed to convince myself that
> > > for_each_displayid_db() has already done the bounds checks for the
> > > DispID CEA data block. Which is why we don't need to repeat them in
> > > cea_db_offsets(). To avoid having to go through that pain again in
> > > the future add a comment which explains this fact.
> > >
> > > Cc: Andres Rodriguez <andresx7@gmail.com>
> > > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_edid.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > > index 3df5744026b0..0369a54e3d32 100644
> > > --- a/drivers/gpu/drm/drm_edid.c
> > > +++ b/drivers/gpu/drm/drm_edid.c
> > > @@ -4001,6 +4001,10 @@ cea_db_offsets(const u8 *cea, int *start, int =
*end)
> > >          *   no non-DTD data.
> > >          */
> > >         if (cea[0] =3D=3D DATA_BLOCK_CTA) {
> > > +               /*
> > > +                * for_each_displayid_db() has already verified
> > > +                * that these stay within expected bounds.
> > > +                */
> >
> > I think the preferred format is to have the start of the comment be on
> > the first line after the /* with that fixed:
> =

> Nope.

Yes the style is correct here, comment is apt as well.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> >
> > >                 *start =3D 3;
> > >                 *end =3D *start + cea[2];
> > >         } else if (cea[0] =3D=3D CEA_EXT) {
> > > --
> > > 2.24.1
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =

> --
> Ville Syrj=E4l=E4
> Intel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
