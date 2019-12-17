Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF6A12414C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:13:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0746E23F;
	Wed, 18 Dec 2019 08:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400112.outbound.protection.outlook.com [40.107.140.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7176E995
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 11:37:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A64P6DZQmKmQnkRn+ItR1S1GGIQmIOltPV1sgf2EtmUuais/jn8afpRhwkLqPsDmWyUTY80sfZCtNoXXt/7SkZ8wqcpUdV462ZyS51mjX5A5E5Z5xbJsSJpGUbn/8oOZ7/mt9fqFawolN66iHRG5qiNXVHCSQHMPOQ9Eq/swTkPjutob9lNb/9X/GPrT5Oh71kVZT7Y0fHQpcDFKLuTCgvqp2PW2Uo0o4ZjWcch5+SFjhP2Dy9rsUJ9RO9Kir7AAFCYp/EaB4TWpoUWI+Ofw3XhpIFMJAoAe7e+ofiONmd/giU4PCLIf+vjW6es99dm2KoIbU4GdAKPCwOr+9vPU8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkqT5EK3wgkclV5IboO4mFyeYpOFM/UJZwOc0pGPcvA=;
 b=Kh7ebNk/5D6Tz0PUm2N5Q6LtIv+SFBxY53HFRIngkQXio2dZT/UU/Q0ShYv6sINfWjfuIpmyKLCUFSzmIVK7JzDU//vFI+MTvUkeUunK42PUZOutVvBTk5/Ybu8Ndlz2yvvXOlSpOz11C38HYZN9GseEgirNz5Vp175rHe2umd3EaHQrN48Huyb6TpSZGxdZUdbnwer/fmqaTpDxrOWFdHbZEH8UUZiaYCoz0XGKoCaPuWsalIaL8/bhP8MN8UBdHfMWI6HQzRYiD0DmWXpdg7dZAKHY4PJ6wJlLPB/VlHbkkQuxaDXC98c89GPjG7DCHlHwv0YUtM+WL1HgVhJY5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkqT5EK3wgkclV5IboO4mFyeYpOFM/UJZwOc0pGPcvA=;
 b=pHH3/HRypqCwmo6N8FWfLC4WDRkAsyIEH8STOCcNRrBoN7LOOK6/Qzjxaeotwszk8T0oT+tJ1ZvzSLS2RrHyw6DkH2mpU7SbZk7ihMr7hvGislNQxx/Y/0Kbk85poS6BkHmVgsg9SmnTub0mVWPKN8WJSHdJkG5HIbKwWsbgOZc=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1595.jpnprd01.prod.outlook.com (52.133.162.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Tue, 17 Dec 2019 11:37:00 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2538.019; Tue, 17 Dec 2019
 11:37:00 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v5 4/6] drm: rcar-du: lvds: Allow for even and odd pixels
 swap
Thread-Topic: [PATCH v5 4/6] drm: rcar-du: lvds: Allow for even and odd pixels
 swap
Thread-Index: AQHVtE07BUnRYq5ge0iAec2iH9Afuqe9SLGAgADpHdA=
Date: Tue, 17 Dec 2019 11:37:00 +0000
Message-ID: <TY1PR01MB177069E9FABCAE39A27C6A00C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1576527154-18391-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1576527154-18391-5-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191216213451.GH4856@pendragon.ideasonboard.com>
In-Reply-To: <20191216213451.GH4856@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3c73ea3a-8566-4d07-73c6-08d782e56e39
x-ms-traffictypediagnostic: TY1PR01MB1595:|TY1PR01MB1595:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1595B86CA345A37F2ADFBE07C0500@TY1PR01MB1595.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02543CD7CD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(199004)(189003)(7416002)(52536014)(71200400001)(7696005)(9686003)(2906002)(81166006)(55016002)(966005)(66946007)(6916009)(186003)(4326008)(66556008)(64756008)(66476007)(66446008)(478600001)(54906003)(26005)(316002)(5660300002)(8936002)(76116006)(44832011)(53546011)(81156014)(6506007)(8676002)(86362001)(33656002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1595;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +aXcuOvVYVo6CnBXbAoqoYOGvqnVQ0rKZvtYizO3gktz+IX23qJdpFSmDyXcS2hOKq0CuCN5qx7bCVa8XbaHY5TlDKBCI8PH9NMjejQQ3Z8lDxWJ6/FUVnZNOm3QDPkxJoz09OjeQ+mhzBgXG/c/3thX/CszLA5BDntjgAsm1HXl6zanZmL86x+LPjZEHbqMbqcJ9V21B8eNfb0sOUK8XhcQi9tRO1+cHbzVg6ayiqbUbZk+QUP/dNlzXoBmxzicZgN9e/JfZzc6Kol/6Bh+3nxzlym63uIO3bujrVqnyXnvoQ85ECqj0zPy5YZk0i5xcE0pdhJq8wLF16QwGfHo5kgL3gO6/17qWlDd/ZOyBXP2t7DkA9Di3s/KGvkelHjIgN7idaF0YrH8EhRJRH8GvRJriorPpUNk3sn5hZOcLj3s3CNPD7gGT6XN2tUPujYc8mNvuvgjPULGQTFTO4JuSNp5T4//dGjagZOX2p6sex4=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c73ea3a-8566-4d07-73c6-08d782e56e39
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2019 11:37:00.2196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n51coTTOssNJFsBN2BxGA32SNRdsUrwUejVth718wouC3LMI2LwJjXlqU9N5teflKzFcRBP5+WkiJcU04eLPQq04xlhU98OhZGMIfxrZZdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1595
X-Mailman-Approved-At: Wed, 18 Dec 2019 08:13:03 +0000
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
> Sent: 16 December 2019 21:35
> Subject: Re: [PATCH v5 4/6] drm: rcar-du: lvds: Allow for even and odd pixels swap
> 
> Hi Fabrizio,
> 
> Thank you for the patch.
> 
> On Mon, Dec 16, 2019 at 08:12:32PM +0000, Fabrizio Castro wrote:
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
> > v4->v5:
> > * Addressed comments from Laurent's review
> >
> > v3->v4:
> > * New patch extracted from patch:
> >   "drm: rcar-du: lvds: Add dual-LVDS panels support"
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c | 67 +++++++++++++++++++++++++++++--------
> >  1 file changed, 53 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > index 3eb208e..c6a38c3 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > @@ -37,6 +37,12 @@ enum rcar_lvds_mode {
> >  	RCAR_LVDS_MODE_VESA = 4,
> >  };
> >
> > +enum rcar_lvds_link_type {
> > +	RCAR_LVDS_SINGLE_LINK = 0,
> > +	RCAR_LVDS_DUAL_LINK_EVEN_ODD_PIXELS = 1,
> > +	RCAR_LVDS_DUAL_LINK_ODD_EVEN_PIXELS = 2,
> > +};
> > +
> >  #define RCAR_LVDS_QUIRK_LANES		BIT(0)	/* LVDS lanes 1 and 3 inverted */
> >  #define RCAR_LVDS_QUIRK_GEN3_LVEN	BIT(1)	/* LVEN bit needs to be set on R8A77970/R8A7799x */
> >  #define RCAR_LVDS_QUIRK_PWD		BIT(2)	/* PWD bit available (all of Gen3 but E3) */
> > @@ -67,7 +73,7 @@ struct rcar_lvds {
> >  	} clocks;
> >
> >  	struct drm_bridge *companion;
> > -	bool dual_link;
> > +	enum rcar_lvds_link_type dual_link;
> 
> Do you think we should rename this to link_type (and test for
> lvds->link_type != RCAR_LVDS_SINGLE_LINK) instead of lvds->dual_link) ?
> Apart from that,

I'll send v6 to address that. I will also rebase on top of:
https://patchwork.kernel.org/patch/11295991/
and will use that as a dependency for v6

Cheers,
Fab

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> >  };
> >
> >  #define bridge_to_rcar_lvds(b) \
> > @@ -484,12 +490,31 @@ static void rcar_lvds_atomic_enable(struct drm_bridge *bridge,
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
> > +		if (lvds->dual_link) {
> > +			/*
> > +			 * By default we generate even pixels from the primary
> > +			 * encoder and odd pixels from the companion encoder.
> > +			 * Swap pixels around if the sink requires odd pixels
> > +			 * from the primary encoder and even pixels from the
> > +			 * companion encoder.
> > +			 */
> > +			bool swap_pixels = lvds->dual_link ==
> > +				RCAR_LVDS_DUAL_LINK_ODD_EVEN_PIXELS;
> > +
> > +			/*
> > +			 * Configure vertical stripe since we are dealing with
> > +			 * an LVDS dual-link connection.
> > +			 *
> > +			 * ST_SWAP is reserved for the companion encoder, only
> > +			 * set it in the primary encoder.
> > +			 */
> > +			lvdstripe = LVDSTRIPE_ST_ON
> > +				  | (lvds->companion && swap_pixels ?
> > +				     LVDSTRIPE_ST_SWAP : 0);
> > +		}
> > +		rcar_lvds_write(lvds, LVDSTRIPE, lvdstripe);
> >  	}
> >
> >  	/*
> > @@ -716,15 +741,26 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
> >  	of_node_put(port0);
> >  	of_node_put(port1);
> >
> > -	if (dual_link >= DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS)
> > -		lvds->dual_link = true;
> > -	else if (lvds->next_bridge && lvds->next_bridge->timings)
> > +	switch (dual_link) {
> > +	case DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS:
> > +		lvds->dual_link = RCAR_LVDS_DUAL_LINK_ODD_EVEN_PIXELS;
> > +		break;
> > +	case DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS:
> > +		lvds->dual_link = RCAR_LVDS_DUAL_LINK_EVEN_ODD_PIXELS;
> > +		break;
> > +	default:
> >  		/*
> >  		 * Early dual-link bridge specific implementations populate the
> > -		 * timings field of drm_bridge, read the dual_link flag off the
> > -		 * bridge directly for backward compatibility.
> > +		 * timings field of drm_bridge. If the flag is set, we assume
> > +		 * that we are expected to generate even pixels from the primary
> > +		 * encoder, and odd pixels from the companion encoder.
> >  		 */
> > -		lvds->dual_link = lvds->next_bridge->timings->dual_link;
> > +		if (lvds->next_bridge && lvds->next_bridge->timings &&
> > +		    lvds->next_bridge->timings->dual_link)
> > +			lvds->dual_link = RCAR_LVDS_DUAL_LINK_EVEN_ODD_PIXELS;
> > +		else
> > +			lvds->dual_link = RCAR_LVDS_SINGLE_LINK;
> > +	}
> >
> >  	if (!lvds->dual_link) {
> >  		dev_dbg(dev, "Single-link configuration detected\n");
> > @@ -741,6 +777,9 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
> >  		"Dual-link configuration detected (companion encoder %pOF)\n",
> >  		companion);
> >
> > +	if (lvds->dual_link == RCAR_LVDS_DUAL_LINK_ODD_EVEN_PIXELS)
> > +		dev_dbg(dev, "Data swapping required\n");
> > +
> >  	/*
> >  	 * FIXME: We should not be messing with the companion encoder private
> >  	 * data from the primary encoder, we should rather let the companion
> > @@ -751,7 +790,7 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
> >  	 * for the time being.
> >  	 */
> >  	companion_lvds = bridge_to_rcar_lvds(lvds->companion);
> > -	companion_lvds->dual_link = true;
> > +	companion_lvds->dual_link = lvds->dual_link;
> >
> >  done:
> >  	of_node_put(companion);
> 
> --
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
