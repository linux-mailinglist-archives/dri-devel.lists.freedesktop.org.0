Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F881228DF
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F4C6E9BF;
	Tue, 17 Dec 2019 10:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410108.outbound.protection.outlook.com [40.107.141.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBF16E860
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 18:36:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHVJlysE86zlQ5JVg7pMdOHQUctj+unFr9rZ+ri+/CMZf0ZWv5H3QSxAhgN9fKSKR/ipi8fyXcN1ExS0zE/KNOFSDTxCT6nhJ4z+GmHMHox41w/SvTTg+wKVAuT0qRLWiaTOUsYHWotJkkENnWY2oERcCMScrGbEzHEOL1mXqSuluQR0pYIIcbNvv+MMj0Ni9MPy6AeUwnTpKCUP9FOFn5RcBu5+AZ0kaM0Nje1Svsui1pWP7UGrA60u+fOv9hffmcear4/MPCBviFYDLtGjqALGNSwLemxygpSZtqwnReBe+acR5QIpZeqgQ1PmOgqxuN9l6lHmI1gK/1tWEc+aRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vilVCzEWW8PMIvXzecbIYJGRTZXZ9Q/7/lEniltajSw=;
 b=MRuTql1r5eP0sFFcwjMxPWIFiD/me68ElL6YnBfW+WTNbNOzaDJDBlsgZGg3S93xHewH8UXJU1lB5+iGWmMocobjGhQMgeOnv4Z4C5fs0bFB5Hvo6za2EDBe9QUsCu2XfwqrtTV/RbES4AWOkTICocMjVrmHraRpqkhXDbaKqia9fOJiiDMckOWlesd2tH3eOZKlIX1qy2pK2xYVC98BQQU3fS74v1R93sXXoiS0kdFAuZwTzlZCSUIUNl3mX5JAsCifnp6OA9LWwUkk1kB9tzB/93RkDGLxkZAtm1q86B0QgLJmpO5zl/XVsThiGh1kv7mIQYhu5zu0cBQmKux1lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vilVCzEWW8PMIvXzecbIYJGRTZXZ9Q/7/lEniltajSw=;
 b=oRCP7Yvfg83AVEBYiWdy5VIhqA3oeXLeO4vpJ7mrqolvpnrFdkUt4owuLaYaqOpI4WRv7r5wcSiWNHi6tlSE6Og8K7FWC5TcPE0Rdymfz7cRn8XWepZhOYvaYWFHAsEGYCN1uCPBHuMg7VclmgAIP1Cuz5GJ/YeGUqd0iKgn9HU=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1786.jpnprd01.prod.outlook.com (52.133.163.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.20; Mon, 16 Dec 2019 18:36:51 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2538.019; Mon, 16 Dec 2019
 18:36:50 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v4 4/7] drm: rcar-du: lvds: Allow for even and odd pixels
 swap
Thread-Topic: [PATCH v4 4/7] drm: rcar-du: lvds: Allow for even and odd pixels
 swap
Thread-Index: AQHVrFLkVuXzzsoGLUiqLLtwh/qf5ae4o1SAgAR9UUA=
Date: Mon, 16 Dec 2019 18:36:50 +0000
Message-ID: <TY1PR01MB1770E8AC6980F36FDD1A5BEEC0510@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1575649974-31472-5-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191213214050.GO4860@pendragon.ideasonboard.com>
In-Reply-To: <20191213214050.GO4860@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0f7c1cef-ac39-49c0-17b2-08d78256ea87
x-ms-traffictypediagnostic: TY1PR01MB1786:|TY1PR01MB1786:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1786772FBC47EE3AFCE41B05C0510@TY1PR01MB1786.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02530BD3AA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(189003)(199004)(478600001)(7416002)(55016002)(9686003)(6916009)(2906002)(66476007)(5660300002)(44832011)(76116006)(71200400001)(86362001)(33656002)(8936002)(54906003)(66556008)(66446008)(64756008)(186003)(53546011)(316002)(7696005)(66946007)(26005)(52536014)(4326008)(81166006)(8676002)(81156014)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1786;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0aWWeCCGmJj9dQ5vxeO28ixvE+QOiDs1v+nGxKX96BbNJ3cuhKHXs7HYS2JxNaQ/1aI4dInqgu2UQSurT1uDbLeQmwbakwzLn/b7Xn6uAZ5cAKug7105XUpee2hUT65E3glFlhJlvTcROBrYfBsooH1ogV+gAUpxBBRBm0W3pbsn9JqoYiaDCCbtTLH7rOFaPfvPOPrs+kfrpY/aVRaQkUpIWT83MxDMXX8I8rY4EIL7Mh82zfFBxqUPcPjfIMIqQ13gWhl2hNAGcBttHfUW4vNRa/u1BIpTeUNZp6Iav4oJ+8AI2vzBxQhSNmF8mGiL/mFADyNS3Y9kX0Iabd+aTENKypbqqx/+OfedaOHgVpXZ0hRfjzIj2ogRu4GTJpMOli4aVykFFEWy3K4byFRtp0662BjF5sqIkbUvCGrWd6kedXkwV+jwHw9+gnpak4Ly
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7c1cef-ac39-49c0-17b2-08d78256ea87
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2019 18:36:50.6746 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QVIPCoc54mx4vDXzDJjsEW1zT4RK50TIURRPPy+txz1zRTXbfGayh5T9VYdBC4wJRnUkeAVUYFNSAO5UNeaHpEjjEnu1B1hZPfNIz13jY+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1786
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

> From: devicetree-owner@vger.kernel.org <devicetree-owner@vger.kernel.org> On Behalf Of Laurent Pinchart
> Sent: 13 December 2019 21:41
> Subject: Re: [PATCH v4 4/7] drm: rcar-du: lvds: Allow for even and odd pixels swap
> 
> Hi Fabrizio,
> 
> Thank you for the patch.
> 
> On Fri, Dec 06, 2019 at 04:32:51PM +0000, Fabrizio Castro wrote:
> > DT properties dual-lvds-even-pixels and dual-lvds-odd-pixels
> > can be used to work out if the driver needs to swap even
> > and odd pixels around.
> >
> > This patch makes use of the return value from function
> > drm_of_lvds_get_dual_link_pixel_order to determine if we
> > need to swap odd and even pixels around for things to work
> > properly.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > ---
> > v3->v4:
> > * New patch extracted from patch:
> >   "drm: rcar-du: lvds: Add dual-LVDS panels support"
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c | 46 +++++++++++++++++++++++++++++--------
> >  1 file changed, 37 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > index 6c1f171..cb2147c 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > @@ -71,6 +71,7 @@ struct rcar_lvds {
> >
> >  	struct drm_bridge *companion;
> >  	bool dual_link;
> > +	bool stripe_swap_data;
> 
> Should we merge those two fields in an int dual_link that would be set
> to DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS,
> DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS or a negative value (or maybe we the
> value of enum drm_lvds_dual_link_pixels could be modified so that 0
> could mean single link) ?

I see your point, and I think there is a third option, using definitions local to the
RCAR LVDS driver (via an enum?).
The reason for thinking about a third option is that option 1 could be a bit error prone,
as negative values usually have special meaning. I like option 2, I find it neat, but if
I did that then we would need to agree again on names, definitions, interfaces, etc.,
as the meaning of things will change slightly. Also, we will probably be fine with the
helper and definitions we already agreed on.

I think option 3 will offer a little bit of decoupling between the helper and the driver,
and should have a limited effect on previous uses of dual_link.

I'll make option 3 related changes in v5, if you don't like them then I think we should
try option 2.

> 
> >  };
> >
> >  #define bridge_to_rcar_lvds(b) \
> > @@ -441,12 +442,20 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
> >  	rcar_lvds_write(lvds, LVDCHCR, lvdhcr);
> >
> >  	if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK) {
> > -		/*
> > -		 * Configure vertical stripe based on the mode of operation of
> > -		 * the connected device.
> > -		 */
> > -		rcar_lvds_write(lvds, LVDSTRIPE,
> > -				lvds->dual_link ? LVDSTRIPE_ST_ON : 0);
> > +		u32 lvdstripe = 0;
> > +
> > +		if (lvds->dual_link)
> > +			/*
> > +			 * Configure vertical stripe based on the mode of
> > +			 * operation of the connected device.
> > +			 *
> > +			 * ST_SWAP from LVD1STRIPE is reserved, do not set
> > +			 * in the companion LVDS
> 
> Maybe "ST_SWAP is reserved for the companion encoder, only set it in the
> primary encoder." ?

sure

> 
> > +			 */
> > +			lvdstripe = LVDSTRIPE_ST_ON |
> > +				(lvds->companion && lvds->stripe_swap_data ?
> > +				 LVDSTRIPE_ST_SWAP : 0);
> 
> To match the coding style of the rest of the driver,

ok

> 
> 			lvdstripe = LVDSTRIPE_ST_ON
> 				  | (lvds->companion && lvds->stripe_swap_data ?
> 				     LVDSTRIPE_ST_SWAP : 0);
> 
> Even though not strictly required, could you surround this statement
> with { } as it spans quite a few lines with the comment ?

Will rework this slightly anyway to make room for option 3.

> 
> > +		rcar_lvds_write(lvds, LVDSTRIPE, lvdstripe);
> >  	}
> >
> >  	/*
> > @@ -702,17 +711,33 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
> >  	dual_link = drm_of_lvds_get_dual_link_pixel_order(p0, p1);
> >  	of_node_put(p0);
> >  	of_node_put(p1);
> > -	if (dual_link >= DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS) {
> > +
> > +	switch (dual_link) {
> > +	case DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS:
> > +		/*
> > +		 * By default we generate even pixels from this encoder and odd
> > +		 * pixels from the companion encoder, but since p0 is connected
> > +		 * to the port expecting ood pixels, and p1 is connected to the
> > +		 * port expecting even pixels, we need to swap even and odd
> > +		 * pixels around.
> > +		 */
> > +		lvds->stripe_swap_data = true;
> > +		lvds->dual_link = true;
> > +		break;
> > +	case DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS:
> >  		lvds->dual_link = true;
> > -	} else if (lvds->next_bridge && lvds->next_bridge->timings) {
> > +		break;
> > +	default:
> >  		/*
> >  		 * Early dual-link bridge specific implementations populate the
> >  		 * timings field of drm_bridge, read the dual_link flag off the
> >  		 * bridge directly for backward compatibility.
> >  		 */
> > -		lvds->dual_link = lvds->next_bridge->timings->dual_link;
> > +		if (lvds->next_bridge && lvds->next_bridge->timings)
> > +			lvds->dual_link = lvds->next_bridge->timings->dual_link;
> >  	}
> >
> > +
> 
> A single blank line is enough.

Oops

Thanks,
Fab

> 
> >  	if (!lvds->dual_link) {
> >  		dev_dbg(dev, "Single-link configuration detected\n");
> >  		goto done;
> > @@ -728,6 +753,9 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
> >  		"Dual-link configuration detected (companion encoder %pOF)\n",
> >  		companion);
> >
> > +	if (lvds->stripe_swap_data)
> > +		dev_dbg(dev, "Data swapping required\n");
> > +
> >  	companion_lvds = bridge_to_rcar_lvds(lvds->companion);
> >
> >  	/*
> 
> --
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
