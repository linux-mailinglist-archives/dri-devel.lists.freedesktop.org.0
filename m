Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FB6322B66
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 14:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34F66E9A6;
	Tue, 23 Feb 2021 13:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652096E9A0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 13:26:34 +0000 (UTC)
IronPort-SDR: HEq/J0RWzONv+OxnZqnc4ZPtmaEhCpkX0mMmmkgVAU+3BEHuAb0oIkwRI6IlyT8Dpl35gmpmb/
 DKRdH7yh77HA==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="204228868"
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; d="scan'208";a="204228868"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2021 05:26:33 -0800
IronPort-SDR: o8aNEzCrGEAvWA55tIZ7/mnHRPMZg8IUZiFShEGBvBpxXH8i1sezxHMN9HVN+VdJ3lG0YGrp2e
 Ae90pd/EKPiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; d="scan'208";a="403517029"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 23 Feb 2021 05:26:29 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 23 Feb 2021 15:26:28 +0200
Date: Tue, 23 Feb 2021 15:26:28 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>
Subject: Re: [PATCH 1/2] drm/dp_mst: Revise broadcast msg lct & lcr
Message-ID: <YDUChEqKeqw1znMc@intel.com>
References: <20210222040027.23505-1-Wayne.Lin@amd.com>
 <20210222040027.23505-2-Wayne.Lin@amd.com>
 <YDPjiz4tiMRo320Q@intel.com> <YDPlPRJXVYfPZenQ@intel.com>
 <BN8PR12MB47700C725A9D4411BDBABE1BFC809@BN8PR12MB4770.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN8PR12MB47700C725A9D4411BDBABE1BFC809@BN8PR12MB4770.namprd12.prod.outlook.com>
X-Patchwork-Hint: comment
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
Cc: "Brol, Eryk" <Eryk.Brol@amd.com>, "Zhuo, Qingqing" <Qingqing.Zhuo@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 23, 2021 at 05:32:32AM +0000, Lin, Wayne wrote:
> [AMD Public Use]
> =

> > -----Original Message-----
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Sent: Tuesday, February 23, 2021 1:09 AM
> > To: Lin, Wayne <Wayne.Lin@amd.com>
> > Cc: Brol, Eryk <Eryk.Brol@amd.com>; Zhuo, Qingqing <Qingqing.Zhuo@amd.c=
om>; stable@vger.kernel.org; Zuo, Jerry
> > <Jerry.Zuo@amd.com>; dri-devel@lists.freedesktop.org; Kazlauskas, Nicho=
las <Nicholas.Kazlauskas@amd.com>
> > Subject: Re: [PATCH 1/2] drm/dp_mst: Revise broadcast msg lct & lcr
> >
> > On Mon, Feb 22, 2021 at 07:02:03PM +0200, Ville Syrj=E4l=E4 wrote:
> > > On Mon, Feb 22, 2021 at 12:00:26PM +0800, Wayne Lin wrote:
> > > > [Why & How]
> > > > According to DP spec, broadcast message LCT equals to 1 and LCR
> > > > equals to 6. Current implementation is incorrect. Fix it.
> > > >
> > > > Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> > > > Cc: stable@vger.kernel.org
> > > > ---
> > > >  drivers/gpu/drm/drm_dp_mst_topology.c | 10 ++++++++--
> > > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > index 17dbed0a9800..713ef3b42054 100644
> > > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > @@ -2727,8 +2727,14 @@ static int set_hdr_from_dst_qlock(struct drm=
_dp_sideband_msg_hdr *hdr,
> > > >  else
> > > >  hdr->broadcast =3D 0;
> > > >  hdr->path_msg =3D txmsg->path_msg;
> > > > -hdr->lct =3D mstb->lct;
> > > > -hdr->lcr =3D mstb->lct - 1;
> > > > +if (hdr->broadcast) {
> > > > +hdr->lct =3D 1;
> > > > +hdr->lcr =3D 6;
> > > > +} else {
> > > > +hdr->lct =3D mstb->lct;
> > > > +hdr->lcr =3D mstb->lct - 1;
> > > > +}
> > > > +
> > > >  if (mstb->lct > 1)
> > > >  memcpy(hdr->rad, mstb->rad, mstb->lct / 2);
> > >
> > > We should also do something about RAD no?
> >
> > Just skip the RAD stuff by s/mstb->lct/hdr->lct/ here I guess?
> Thanks Ville!
> Since LCT=3D1, broadcast message doesn't have a RAD and this is taken
> care while we're constructing the header in drm_dp_encode_sideband_msg_hd=
r().
> In drm_dp_encode_sideband_msg_hdr(), we skip stuffing RAD if LCT=3D1.

Ugh. How many levels of these do we really need...
Either way I'd prefer the code be consistent so you don't
have to sacrifice so many brain cells to understand what
should be trivial details.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
