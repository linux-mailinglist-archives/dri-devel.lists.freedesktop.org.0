Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0809E1228D6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:32:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A7B6E97D;
	Tue, 17 Dec 2019 10:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400137.outbound.protection.outlook.com [40.107.140.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927736E85E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 18:10:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IegOPDQcYLmH9Uh2nbBHfpIEWlWlikm3+POvidVscwRCseawwrzWq26STfWSk/Vi0wzXowBXGjJJqBCIOQktg89KzW1TCOHqIDJnMnUkOEyw0QgUr0fyJ7cPjKE9w7/oXZ7/7cpAaChTITgQp6P/xrLmhfEN6TYSD4aaTyKzCqgfK7m2enLx8yxt7rO6TJv4xRREXKvI1ABpKiz60iNl7fD9qhecjnxe/fh8zlyg40pEb/zZUGdsnpquozwAceZ3xQKCyhm7eswSAmyVJV2UvDtpIBgCxCrAFgHsn/KWwV0Bkdcku1+5m5oBFev+ELnUrBv3N9dO4fOGpshEhcv/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEwvxJpXarH/Lhpan8twx7oGY1ccDblgB8aNOgqPyu8=;
 b=YToPLxXxzbKF4aId82HRGTjb9inZtlk6kCUJ+yKPyHZw1mGnhwUu/X6k3Kxi/3nauCmY3AKJYH+pF3NZLlRIbMxQpdx3DjQuDrRUgfGc6lw+N+546U1lSUxt0UwPlpI3fxevp/IYbii8PBiY7BtbDURSTZzjdonYIurGA5d8DC/ZrfEnYOtYFXTfbRLF+vdWgShRQcSelB7QuzAqJlpK8BJajIky/X7BIyIJlMPdMvHJEjaAE16ngV47HM72LTHUk6kv1J2N/+RZQ9JhLy/Aa2bQMFAAlLUMVGPPgJHR/WYwMV7EDUAZHdMOw2u4BF+d0xW8IReFK9MrBGQuQkaE8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEwvxJpXarH/Lhpan8twx7oGY1ccDblgB8aNOgqPyu8=;
 b=LowUI15/HMKqtpQQAuuSTW9QPV38aghKHfaq97vu2irPabSezgQo5ptGKiOGvZ40ig7IibtHGUFLJSm7ub/bdD8OJL3aPtoOoCYMDvK99Trij+8+vsSdm0K0Le/dTm62Mk4lOfGU6IWMs+Yg3es3CZ4Q3N9i6FjWsdbkbIYZqYw=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1596.jpnprd01.prod.outlook.com (52.133.162.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Mon, 16 Dec 2019 18:10:56 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2538.019; Mon, 16 Dec 2019
 18:10:56 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v4 3/7] drm: rcar-du: lvds: Get dual link configuration
 from DT
Thread-Topic: [PATCH v4 3/7] drm: rcar-du: lvds: Get dual link configuration
 from DT
Thread-Index: AQHVrFLgNLi4JqNqqE+gKHtXbAdbBqe4oFgAgAR975A=
Date: Mon, 16 Dec 2019 18:10:56 +0000
Message-ID: <TY1PR01MB17700938B2C48F684E910BA4C0510@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1575649974-31472-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191213213010.GN4860@pendragon.ideasonboard.com>
In-Reply-To: <20191213213010.GN4860@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1a24a863-fab8-41d3-374a-08d782534c0f
x-ms-traffictypediagnostic: TY1PR01MB1596:|TY1PR01MB1596:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1596D54E87D281DF3035CAA0C0510@TY1PR01MB1596.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02530BD3AA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(189003)(199004)(6916009)(186003)(8676002)(55016002)(54906003)(44832011)(53546011)(52536014)(7696005)(2906002)(478600001)(33656002)(86362001)(76116006)(66446008)(66946007)(66476007)(7416002)(66556008)(64756008)(6506007)(9686003)(26005)(81156014)(81166006)(5660300002)(8936002)(316002)(4326008)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1596;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LCiX6qECK4pf4bfsUsjkcWkDF/NvnsibKK5VOQ4Ns1A0wONSisw79qUn6PSasseSqMDqbTX7eqB/+tJghJC7AEkg27iXeB/ODpc4GOLjSqllsm6DVJjWEVdV2VT6Hk0lAtkUMuPhORSLIxUulyIsy9/I+EfMDytdr+++/QjBp7VVlAUkZT+RiVs7dB3VNgUiFtjGWEm7s6TNFYagMTB0e7B9CDrBqHRf/tpRRsC9kmF1HorHxFw656zDVUgd2H/oUwCPk6akOeOr5dy48IZcuUVnfIC/uKLvw2BVQdJ4Tyub+yJst+BOx1Z3AJPRk0j/cMLgntjU7Res5w9WZAa/0T7hwgcnx4nMXkv4WVYmbV96O+/7buMBqV26gbz+4YEkOVD/TlparqjJG4AMuLEdiN1THjD3wX/5ZmQIW4IZAOjAOPb7Qn5f6oR4PsRK4OQe
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a24a863-fab8-41d3-374a-08d782534c0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2019 18:10:56.4247 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lbs9gpcMQiV2bbELTA4do/qIlCADCyIePlbSYkoC1nBT9a3VsdpV8pYcPLAFTq4bZ44hBIRX9ClrjpcRGyiyrr8NdXBkfs50bkG2Ye+3yXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1596
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Magnus Damm <magnus.damm@gmail.com>,
 "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thank you for your feedback!

> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Sent: 13 December 2019 21:30
> Subject: Re: [PATCH v4 3/7] drm: rcar-du: lvds: Get dual link configuration from DT
> 
> Hi Fabrizio,
> 
> Thank you for the patch.
> 
> On Fri, Dec 06, 2019 at 04:32:50PM +0000, Fabrizio Castro wrote:
> > For dual-LVDS configurations, it is now possible to mark the
> > DT port nodes for the sink with boolean properties (like
> > dual-lvds-even-pixels and dual-lvds-odd-pixels) to let drivers
> > know the encoders need to be configured in dual-LVDS mode.
> >
> > Rework the implementation of rcar_lvds_parse_dt_companion
> > to make use of the DT markers while keeping backward
> > compatibility.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > ---
> > v3->v4:
> > * New patch extracted from patch:
> >   "drm: rcar-du: lvds: Add dual-LVDS panels support"
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c | 56 +++++++++++++++++++++++++++++++------
> >  1 file changed, 47 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > index 3cb0a83..6c1f171 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > @@ -669,8 +669,10 @@ EXPORT_SYMBOL_GPL(rcar_lvds_dual_link);
> >  static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
> >  {
> >  	const struct of_device_id *match;
> > -	struct device_node *companion;
> > +	struct device_node *companion, *p0, *p1;
> 
> Could you rename p0 and p1 to port0 and port1, and spit them to a
> separate line of variable declaration ?

sure

> 
> > +	struct rcar_lvds *companion_lvds;
> >  	struct device *dev = lvds->dev;
> > +	int dual_link;
> >  	int ret = 0;
> >
> >  	/* Locate the companion LVDS encoder for dual-link operation, if any. */
> > @@ -689,13 +691,55 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
> >  		goto done;
> >  	}
> >
> > +	/*
> > +	 * We need to work out if the sink is expecting us to function in
> > +	 * dual-link mode. We do this by looking at the DT port nodes we are
> > +	 * connected to, if they are marked as expecting even pixels and
> > +	 * odd pixels than we need to enable vertical stripe output.
> > +	 */
> > +	p0 = of_graph_get_port_by_id(dev->of_node, 1);
> > +	p1 = of_graph_get_port_by_id(companion, 1);
> > +	dual_link = drm_of_lvds_get_dual_link_pixel_order(p0, p1);
> > +	of_node_put(p0);
> > +	of_node_put(p1);
> > +	if (dual_link >= DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS) {
> > +		lvds->dual_link = true;
> > +	} else if (lvds->next_bridge && lvds->next_bridge->timings) {
> > +		/*
> > +		 * Early dual-link bridge specific implementations populate the
> > +		 * timings field of drm_bridge, read the dual_link flag off the
> > +		 * bridge directly for backward compatibility.
> > +		 */
> > +		lvds->dual_link = lvds->next_bridge->timings->dual_link;
> > +	}
> > +
> > +	if (!lvds->dual_link) {
> > +		dev_dbg(dev, "Single-link configuration detected\n");
> > +		goto done;
> > +	}
> > +
> >  	lvds->companion = of_drm_find_bridge(companion);
> >  	if (!lvds->companion) {
> >  		ret = -EPROBE_DEFER;
> >  		goto done;
> >  	}
> >
> > -	dev_dbg(dev, "Found companion encoder %pOF\n", companion);
> > +	dev_dbg(dev,
> > +		"Dual-link configuration detected (companion encoder %pOF)\n",
> > +		companion);
> > +
> > +	companion_lvds = bridge_to_rcar_lvds(lvds->companion);
> 
> Could you move this line after the FIXME comment ?

Will do

Thanks,
Fab

> 
> With these small issues fixed,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > +
> > +	/*
> > +	 * FIXME: We should not be messing with the companion encoder private
> > +	 * data from the primary encoder, we should rather let the companion
> > +	 * encoder work things out on its own. However, the companion encoder
> > +	 * doesn't hold a reference to the primary encoder, and
> > +	 * drm_of_lvds_get_dual_link_pixel_order needs to be given references
> > +	 * to the output ports of both encoders, therefore leave it like this
> > +	 * for the time being.
> > +	 */
> > +	companion_lvds->dual_link = true;
> >
> >  done:
> >  	of_node_put(companion);
> > @@ -739,13 +783,7 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
> >  	if (ret)
> >  		goto done;
> >
> > -	if ((lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK) &&
> > -	    lvds->next_bridge)
> > -		lvds->dual_link = lvds->next_bridge->timings
> > -				? lvds->next_bridge->timings->dual_link
> > -				: false;
> > -
> > -	if (lvds->dual_link)
> > +	if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
> >  		ret = rcar_lvds_parse_dt_companion(lvds);
> >
> >  done:
> 
> --
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
