Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 108221228E4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BDA6E9B4;
	Tue, 17 Dec 2019 10:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410105.outbound.protection.outlook.com [40.107.141.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25573897E4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 18:00:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLXRFkhocYv6z3pL3Mcg475ctdT5TZQViBuG6AB6eygUVrxS4vy0kFcqS+i9DZADjNAT+EE3voOvPAfQvoacLeodXTfusnwZtW6GSRS12L4slfgwwO9hNj71ROxCepK5+auxq7zCZ/2OMEekqMJxfYTtaKQG9RiXZVhA2mYScwwZPJlj3+eQOS3834CrWjypmSN6cq3NnPJgy6ZL5OTeyXnT09LeYtT8t2MbOypr6RzQ/iH/tG1/HFOtRoAAMVZi/sFwFC3KAgwuBuT+Ld05h91xz54V9nQgCYr1m5dNYfXstz1HZdZPo+pBE0ERWBjxCcxzNfYy3i/DUy8JiQ+H8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Glkd+9TVukY0BcoEF+tknKFlTwQkAurn+op8ZhCIuNw=;
 b=XAw5q8mkl7frbCZjbLS3ZTvCBJIV3aKxL9jmXNAEu3M+HkuPGq3/J2YPkbvcQALJjTsTO5p9oqJjWUPM9dTsbukuEg1H6qg2fmIBkTkKkCsO9pBSuGjR7IWE3poza1VLKA/fKoPZRNM2HDanwnqpg7XkhBsMeogJnqbAYIxJlxuw9uAeZZ08dQdfS7lB0qxDS8qlHTGl4sAmcQz04sIkamg8BpzBmNzdBTBcJsDZ3Lx6X2sbSY00tk+fvungwq8wmfEelO+/fcc5KFcRv6C5FVyK6Mg4Vc9CG+baxFkPGJzmMdmHbDWNHKinDZZ1AfOoCpTeA6lihRuMACIKTTCiTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Glkd+9TVukY0BcoEF+tknKFlTwQkAurn+op8ZhCIuNw=;
 b=k4M+HqyA8QCIGBpbGBQH6e4rtu/PHBNIF0A6T/upi9aKwmC08bLzx7C8oDhDNY3K5O/i+j4YUeM7gE+PxCrhuLyI3xPKrrwmnEIY9PyPZ9LwDRx2Wv/yDA8OghVhuDVGJQc3sHKVtDBG2pb7EP6wxAdvySrH0xl5rmG+rTrMJKw=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1497.jpnprd01.prod.outlook.com (52.133.162.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Mon, 16 Dec 2019 18:00:09 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2538.019; Mon, 16 Dec 2019
 18:00:09 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v4 2/7] drm: rcar-du: lvds: Improve identification of
 panels
Thread-Topic: [PATCH v4 2/7] drm: rcar-du: lvds: Improve identification of
 panels
Thread-Index: AQHVrFLdhiNZZ/6mLk+E8oj0P8Dcc6e4nfKAgAR+fuA=
Date: Mon, 16 Dec 2019 18:00:09 +0000
Message-ID: <TY1PR01MB177010675ADC18D97DADADE8C0510@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1575649974-31472-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191213212135.GM4860@pendragon.ideasonboard.com>
In-Reply-To: <20191213212135.GM4860@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 32a3e3b4-74e3-41b6-938e-08d78251ca7d
x-ms-traffictypediagnostic: TY1PR01MB1497:|TY1PR01MB1497:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1497C22A1E513B2397B3CC16C0510@TY1PR01MB1497.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 02530BD3AA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(199004)(189003)(71200400001)(4326008)(86362001)(6916009)(7416002)(5660300002)(9686003)(44832011)(7696005)(76116006)(2906002)(26005)(478600001)(81166006)(81156014)(8676002)(8936002)(6506007)(53546011)(55016002)(66556008)(54906003)(66476007)(186003)(316002)(66946007)(66446008)(33656002)(52536014)(64756008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1497;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bXC6Gl6BLGROAiC1mRll/k1fgGdRqVo46DK74zLUBoRJzY0MCe6iMpWlPtLtJIPvTgDMZj9pzlx5LerJqxpgxHXuW0lD8ZjtmqeuE6bp7G8nbSC05g0wfgKKYDsEJWr+kV3mTCk3Sa6mZRgs6iwD3o6+IqnMT8wkC5wqjJq20rz0mfOHf4zH4rS6rJFJsLIBvm44QEqzZh5+4Qj9b38QEKvsk21bWHqozqjvAOKMHzEpJCa+8JFXD+eLrzc0FwvBj36UUyIA4m0HpJGO9/es7MfpHhpsmKrjK6Zaes2E3Xe8CAEGbKoFfu4jX4wf7m5UDuycrYbEwQFPGtEa4msGS1DdbUhtQUXHRdPqeBM8N8pQ0rHMrjR1a9KdBu+83c9WdTB6v6Uc4amK4lpqxE0qJIfvbScE5GZQdGlRRxpuzXc/qFshkynYgWakfCzUAM0R
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a3e3b4-74e3-41b6-938e-08d78251ca7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2019 18:00:09.5365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pnqr6ida4DaWEo+jLwjfxdDDG+5V30DOKXJ9favPSYmhe3DxN1Y0j89UCE+0TZYh6G32/RYLYVway+JXVATsIBBMeuDQzchAj9//CvPXD6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1497
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
> Sent: 13 December 2019 21:22
> Subject: Re: [PATCH v4 2/7] drm: rcar-du: lvds: Improve identification of panels
> 
> Hi Fabrizio,
> 
> Thank you for the patch.
> 
> On Fri, Dec 06, 2019 at 04:32:49PM +0000, Fabrizio Castro wrote:
> > Dual-LVDS panels are mistakenly identified as bridges, this
> > commit replaces the current logic with a call to
> > drm_of_find_panel_or_bridge to sort that out.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > ---
> > v3->v4:
> > * New patch extracted from patch:
> >   "drm: rcar-du: lvds: Add dual-LVDS panels support"
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c | 45 +++++++++----------------------------
> >  1 file changed, 10 insertions(+), 35 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > index 8c6c172..3cb0a83 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > @@ -21,6 +21,7 @@
> >  #include <drm/drm_atomic.h>
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_bridge.h>
> > +#include <drm/drm_of.h>
> >  #include <drm/drm_panel.h>
> >  #include <drm/drm_probe_helper.h>
> >
> > @@ -705,10 +706,7 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
> >  static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
> >  {
> >  	struct device_node *local_output = NULL;
> > -	struct device_node *remote_input = NULL;
> >  	struct device_node *remote = NULL;
> > -	struct device_node *node;
> > -	bool is_bridge = false;
> >  	int ret = 0;
> >
> >  	local_output = of_graph_get_endpoint_by_regs(lvds->dev->of_node, 1, 0);
> > @@ -736,45 +734,22 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
> >  		goto done;
> >  	}
> 
> I think you can remove the calls above this too.
> drm_of_find_panel_or_bridge() calls of_graph_get_remote_node(), which in
> turn calls of_graph_get_endpoint_by_regs(),
> of_graph_get_remote_port_parent() and checks the status of the remote
> with of_device_is_available().

Will take those out in v5

Thanks,
Fab

> 
> >
> > -	remote_input = of_graph_get_remote_endpoint(local_output);
> > -
> > -	for_each_endpoint_of_node(remote, node) {
> > -		if (node != remote_input) {
> > -			/*
> > -			 * We've found one endpoint other than the input, this
> > -			 * must be a bridge.
> > -			 */
> > -			is_bridge = true;
> > -			of_node_put(node);
> > -			break;
> > -		}
> > -	}
> > -
> > -	if (is_bridge) {
> > -		lvds->next_bridge = of_drm_find_bridge(remote);
> > -		if (!lvds->next_bridge) {
> > -			ret = -EPROBE_DEFER;
> > -			goto done;
> > -		}
> > +	ret = drm_of_find_panel_or_bridge(lvds->dev->of_node, 1, 0,
> > +					  &lvds->panel, &lvds->next_bridge);
> > +	if (ret)
> > +		goto done;
> >
> > -		if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
> > -			lvds->dual_link = lvds->next_bridge->timings
> > -					? lvds->next_bridge->timings->dual_link
> > -					: false;
> > -	} else {
> > -		lvds->panel = of_drm_find_panel(remote);
> > -		if (IS_ERR(lvds->panel)) {
> > -			ret = PTR_ERR(lvds->panel);
> > -			goto done;
> > -		}
> > -	}
> > +	if ((lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK) &&
> > +	    lvds->next_bridge)
> > +		lvds->dual_link = lvds->next_bridge->timings
> > +				? lvds->next_bridge->timings->dual_link
> > +				: false;
> >
> >  	if (lvds->dual_link)
> >  		ret = rcar_lvds_parse_dt_companion(lvds);
> >
> >  done:
> >  	of_node_put(local_output);
> > -	of_node_put(remote_input);
> >  	of_node_put(remote);
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
