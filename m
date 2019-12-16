Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2481228FC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B39E6E9C9;
	Tue, 17 Dec 2019 10:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400090.outbound.protection.outlook.com [40.107.140.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B986E860
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 18:43:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxPoGbZnykm56aeaicgDV6oai9DEi1Qh2VjUygq9YVrTJQbSS5d0bYhrBcvL2YqM8VeV5lJiBZTL0DvTJLdRCysCqyAiasFTa7+/CUzJf9P1a2Bojspa5TRWPT3HhumSlrvo7yE+vkHqYtlpyX3ZqDAkSDeQ2zmZMUeByf4B9lUlJJtrq7Jim+Iwt5IpeOUF+1S9+PMZUi2W0bMxgH7wWDeon4CvuT0h0B/OwmamRv80qYhF4l5l21srCC5LaogsJ5SkWNvT7bqYID5Ck632U28k3SgHTWOZBY96BLxPPwwamHTRFjWpXm2vFq994ezCUSfTmDaznug7zV5y3vIxVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDRfU7yEKpUGLgOzT4AasND8fG68gxUr7EUUIi2aTIo=;
 b=jTwl1COyRUB58U1S2ZaBPBH0oCpNWeE1dyD89xpK3KMYcX0WWd3xRfd3IMHGxCK1ECAiEA6I/hsC0bN5sv9R/uqE5+xoF0GSn8tOCem+T2IKuh/VpqQCEbpVhcfBu5BxTuPMvtzlWhcA0KuYy9R3Uz6zDsED+yuMUiMfr+8Kv2sehtqO/+SR28Wq/a2nvAH/E9pOkdAf3Q5m3B05JtkdSzr+lDAJopjVLeMqm7q2tGHwHYMNakakbUbB0HhP6N+czVDWcoz+2hy2QULBvkz++6upEYPYeaQXBUGafmpP+Oc59YLMKag+EewW+Hj+5w+IJl537VA5pHxApypMOearvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDRfU7yEKpUGLgOzT4AasND8fG68gxUr7EUUIi2aTIo=;
 b=NOxi59jeiigOw83DpwXewWwHZhz0I4k1Z/j78NebfYaGVsgsA8DveRIc2Quimsj1b0TREA/nXHhdzTu3zDE5ecLa2rC+5oONsbvZ8BEicT9i4kpO67DxCj5SBB13A27/49Ky9XZxSaO64f9hwcbvHbFw0lY6PJeiQh5d8uRjhv0=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1786.jpnprd01.prod.outlook.com (52.133.163.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.20; Mon, 16 Dec 2019 18:43:05 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2538.019; Mon, 16 Dec 2019
 18:43:05 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v4 5/7] drm: rcar-du: lvds: Fix mode for companion encoder
Thread-Topic: [PATCH v4 5/7] drm: rcar-du: lvds: Fix mode for companion encoder
Thread-Index: AQHVrFLnUCKj2BNq0EOPdrx0L3Dgfae4o5YAgASEiMA=
Date: Mon, 16 Dec 2019 18:43:04 +0000
Message-ID: <TY1PR01MB177062A4ED216B58266008D1C0510@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1575649974-31472-6-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191213214146.GP4860@pendragon.ideasonboard.com>
In-Reply-To: <20191213214146.GP4860@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a7f7935c-3ce3-4831-87a2-08d78257c997
x-ms-traffictypediagnostic: TY1PR01MB1786:|TY1PR01MB1786:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB17864616600B0AE85918F8A7C0510@TY1PR01MB1786.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
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
x-microsoft-antispam-message-info: r1dq84szu1Wum9chAHmM5fva9R6HD4jqpl3ZFfTE81I81mU39TkXU0DQJzFdXgbmL/2Q/E4Omy1OVOwJrTyZBGVcMdR9/8No8kfyd1tfbvH5fA8aYCkx7neMuXjExI32qMJkksl1ndNI3u+WbEcLSyoL7U84Ql3nyLW1n1NhVIOiqaQpuXpdxCglG79HUos0nZGVL031zuoPyZkIcRQ06wIV5ocYlrBGVMyJG9EbjRDvUHiGs2tTJwoimua/yoKEV7W/iJWrNC6Ue1ECsiVPPCrIqSxUgiDsxgG7QWoH7+sXXG8R/VrEjxm99GZT3/ZvQelonZUJOKRMkRiLYnujEjSQk2T0IeABENh4vcEPBSiiqSPijBrzgMtVQ6hxVJY5bbtTH5RR82TBzXR9psA2UWGZadKDUGuxXMt0L+KEceFvgtH9utqQ65hJDneL1pCa
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f7935c-3ce3-4831-87a2-08d78257c997
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2019 18:43:04.9992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pDiiDaSnJ8WMKLPBuf+mhajkjvrnVK/7EZnmlty/Wci/Uzd24Y9NoyaLUZ5cwfY4V+uflAE4bY/qdfBjYlMu6J3Rk2Zi0J0vth5mrHSP/30=
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
> Sent: 13 December 2019 21:42
> Subject: Re: [PATCH v4 5/7] drm: rcar-du: lvds: Fix mode for companion encoder
> 
> Hi Fabrizio,
> 
> Thank you for the patch.
> 
> On Fri, Dec 06, 2019 at 04:32:52PM +0000, Fabrizio Castro wrote:
> > Primary and companion encoders need to set the same mode for
> > things to work properly.
> >
> > rcar_lvds_mode_set gets called into for the primary encoder only,
> > therefore initialize the companion encoder mode while sorting
> > the primary encoder mode out.
> >
> > Fixes: fa440d870358 ("drm: rcar-du: lvds: Add support for dual-link mode")
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Would you mind rebasing this on top of "drm: rcar-du: lvds: Get mode
> from state" ?

It looks like dropping this patch and rebasing on top of your v2 for
"drm: rcar-du: lvds: Get mode from state" does the trick now.

Will put a dependency to your patch in v5.

Cheers,
Fab

> 
> > ---
> > v3->v4:
> > * New patch extracted from patch:
> >   "drm: rcar-du: lvds: Add dual-LVDS panels support"
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > index cb2147c..eed5611 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > @@ -614,6 +614,18 @@ static void rcar_lvds_mode_set(struct drm_bridge *bridge,
> >  	lvds->display_mode = *adjusted_mode;
> >
> >  	rcar_lvds_get_lvds_mode(lvds);
> > +	if (lvds->companion) {
> > +		struct rcar_lvds *companion_lvds = bridge_to_rcar_lvds(
> > +							lvds->companion);
> > +
> > +		/*
> > +		 * FIXME: We should not be messing with the companion encoder
> > +		 * private data from the primary encoder, but since
> > +		 * rcar_lvds_mode_set gets called into for the primary encoder
> > +		 * only, we don't have much of a choice for now.
> > +		 */
> > +		companion_lvds->mode = lvds->mode;
> > +	}
> >  }
> >
> >  static int rcar_lvds_attach(struct drm_bridge *bridge)
> 
> --
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
