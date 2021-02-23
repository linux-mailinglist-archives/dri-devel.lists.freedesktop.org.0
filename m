Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE3C322B55
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 14:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62306E99C;
	Tue, 23 Feb 2021 13:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7344D6E99C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 13:21:09 +0000 (UTC)
IronPort-SDR: G6VuRrPT/XbX602S8G6Aj85+/viU2XKOYnjCa9LMM3gtVJjCnZTgkzSDAWESFMHkE7YomCUw7G
 xREkgm7ACVrg==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="269754497"
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; d="scan'208";a="269754497"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2021 05:21:08 -0800
IronPort-SDR: SqzV2J8UYCZcd7OQicr2SiY9ITDXP+eivb3GyAu3oMlj79ZziHGg77wtk3YRXowUwiLLrDy659
 Ut4qHLHmalDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; d="scan'208";a="366581461"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 23 Feb 2021 05:21:05 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 23 Feb 2021 15:21:04 +0200
Date: Tue, 23 Feb 2021 15:21:04 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>
Subject: Re: [PATCH 2/2] drm/dp_mst: Set CLEAR_PAYLOAD_ID_TABLE as broadcast
Message-ID: <YDUBQE3acwhDbUxp@intel.com>
References: <20210222040027.23505-1-Wayne.Lin@amd.com>
 <20210222040027.23505-3-Wayne.Lin@amd.com>
 <YDPjFzPdfZXJqex8@intel.com>
 <BN8PR12MB47700A55800116A14DF96B1FFC809@BN8PR12MB4770.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN8PR12MB47700A55800116A14DF96B1FFC809@BN8PR12MB4770.namprd12.prod.outlook.com>
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
 "stable@vger.kernel.org" <stable@vger.kernel.org>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 23, 2021 at 05:32:36AM +0000, Lin, Wayne wrote:
> [AMD Public Use]
> =

> > -----Original Message-----
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Sent: Tuesday, February 23, 2021 1:00 AM
> > To: Lin, Wayne <Wayne.Lin@amd.com>
> > Cc: dri-devel@lists.freedesktop.org; Brol, Eryk <Eryk.Brol@amd.com>; Zh=
uo, Qingqing <Qingqing.Zhuo@amd.com>;
> > stable@vger.kernel.org; Zuo, Jerry <Jerry.Zuo@amd.com>; Kazlauskas, Nic=
holas <Nicholas.Kazlauskas@amd.com>; Dhinakaran
> > Pandiyan <dhinakaran.pandiyan@intel.com>
> > Subject: Re: [PATCH 2/2] drm/dp_mst: Set CLEAR_PAYLOAD_ID_TABLE as broa=
dcast
> >
> > On Mon, Feb 22, 2021 at 12:00:27PM +0800, Wayne Lin wrote:
> > > [Why & How]
> > > According to DP spec, CLEAR_PAYLOAD_ID_TABLE is a path broadcast
> > > request message and current implementation is incorrect. Fix it.
> > >
> > > Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> > > Cc: stable@vger.kernel.org
> > > ---
> > >  drivers/gpu/drm/drm_dp_mst_topology.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > index 713ef3b42054..6d73559046e5 100644
> > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > @@ -1072,6 +1072,7 @@ static void build_clear_payload_id_table(struct
> > > drm_dp_sideband_msg_tx *msg)
> > >
> > >  req.req_type =3D DP_CLEAR_PAYLOAD_ID_TABLE;
> > >  drm_dp_encode_sideband_req(&req, msg);
> > > +msg->path_msg =3D true;
> > >  }
> > >
> > >  static int build_enum_path_resources(struct drm_dp_sideband_msg_tx
> > > *msg, @@ -2722,7 +2723,8 @@ static int set_hdr_from_dst_qlock(struct
> > > drm_dp_sideband_msg_hdr *hdr,
> > >
> > >  req_type =3D txmsg->msg[0] & 0x7f;
> > >  if (req_type =3D=3D DP_CONNECTION_STATUS_NOTIFY ||
> > > -req_type =3D=3D DP_RESOURCE_STATUS_NOTIFY)
> > > +req_type =3D=3D DP_RESOURCE_STATUS_NOTIFY ||
> > > +req_type =3D=3D DP_CLEAR_PAYLOAD_ID_TABLE)
> > >  hdr->broadcast =3D 1;
> >
> > Looks correct.
> > Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >
> > Hmm. Looks like we're missing DP_POWER_DOWN_PHY and DP_POWER_UP_PHY her=
e as well. We do try to send them as path
> > requests, but apparently forget to mark them as broadcast messages.
> Hi Ville,
> I also look up the spec but DP_POWER_DOWN_PHY & DP_POWER_UP_PHY seems to =
be defined as path or node request only. Not broadcast message. Please corr=
ect me if I'm wrong here.

Doh. Yeah, you're correct. Not sure what section I was reading earlier
when I came to that conclusion.

> Appreciate for your time!
> >
> > >  else
> > >  hdr->broadcast =3D 0;
> > > --
> > > 2.17.1
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
ist
> > > s.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D04%7C01=
%7C
> > > Wayne.Lin%40amd.com%7C372bbed7b5354ca05f5608d8d753533a%7C3dd8961fe4884
> > > e608e11a82d994e183d%7C0%7C0%7C637496100180287539%7CUnknown%7CTWFpbGZsb
> > > 3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> > > 7C1000&amp;sdata=3D2uhm9Nf31hfhf%2FbmwfqYW7b6ay9swWb8oS10Uc%2FVFRQ%3D=
&am
> > > p;reserved=3D0
> >
> > --
> > Ville Syrj=E4l=E4
> > Intel
> Regards,
> Wayne Lin

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
