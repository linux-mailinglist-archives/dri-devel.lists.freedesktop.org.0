Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CC314265B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 09:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311626E871;
	Mon, 20 Jan 2020 08:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60112.outbound.protection.outlook.com [40.107.6.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433CD6E5B9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 07:59:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLEk8JPQMxIxqwHTV9TRRZpq9JBUgXR2f0PDSbdIWeV2iaKUrx+Uxknw63oJWsNbgDRyZxDoW7EBkJS3n2QCldTJoW1Db8xRCcVU7QqW2OocHeeV8wlxOZAoUh4rUd1RjR8QCdQCFwm+KovfRpcQ763u4PpOMeoDFtgCLZc9lB43iLrYg+7mAsTPkaCeXmJCeb60Fj7Dqplgg6EXw5vE/ZQgoeyz8MUh17zz6xRqAhP8QDzXJSBnSmulrMJpNFFlYhOFz2hljwXd3pa2piBzKzY+t07+Tuv3xIHaTG5I3w4r/qoQ3Kdhx+9i36v0j27484K6p0ucAtiYcEJMSXk3KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I20ihGB+QcJLSprXuKuUDK3XggWeLGQfRMHzX7WNEdA=;
 b=gySq6j7OpnYLlBjOyuEX7CrMTNUEnQiPSJJsXJa5WK2WrITQrn/FBi+maD1fiKHCnOAYFV3+3J5OJoVbpuqzOcp6zHV5S0C9in6MJRAIQxSw8Bgit3mCQVOEqPYWbLu0WxseMHd2fo5RRY5k4XRWNjlerArAvPG/kFLEk/MLe2MoikHNu8vQfrM5ZBAhHqZ0aYEFUCNM26XahaQ+YyjHBj21MvEqjl8if3QQmsrukK8tKAhNsnYfOGDHwaYNGmgcKjc+xOGV9yAWY1M5meuJM+j0W+XNedpvBWvOtQEMsPEv5LxUMqL7Nel8get5+ggTstTETdtOGnDU4Y22t2qTWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I20ihGB+QcJLSprXuKuUDK3XggWeLGQfRMHzX7WNEdA=;
 b=WRUj/VEGweYsuzEb3lnBEylYLL1YfjPGrC2v52TcWH2xoW3D3/e3tCsSt06g3h6IGMU7u4953m26adDHaQOP0TdipCVf12CtP5/Lm/VpHRN/D4t/DAk4f6/pfy7tiaTjTs0Ysn8/xGF+JHyNfsjo6RvrQHIXqb5Um8IeX1IPCtU=
Received: from VI1PR05MB6845.eurprd05.prod.outlook.com (10.186.163.80) by
 VI1PR05MB3392.eurprd05.prod.outlook.com (10.170.237.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.24; Mon, 20 Jan 2020 07:59:46 +0000
Received: from VI1PR05MB6845.eurprd05.prod.outlook.com
 ([fe80::9192:77a8:62cf:c098]) by VI1PR05MB6845.eurprd05.prod.outlook.com
 ([fe80::9192:77a8:62cf:c098%3]) with mapi id 15.20.2644.024; Mon, 20 Jan 2020
 07:59:46 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "sam@ravnborg.org" <sam@ravnborg.org>
Subject: Re: [PATCH v3 2/3] drm/panel: simple: add display timings for logic
 technologies displays
Thread-Topic: [PATCH v3 2/3] drm/panel: simple: add display timings for logic
 technologies displays
Thread-Index: AQHVzxQmuO2riiBZC0CHoF0hnCfH66fylqMAgACaXIA=
Date: Mon, 20 Jan 2020 07:59:46 +0000
Message-ID: <7d4934675dee1bb4ecfbef551ea7c2e363a452de.camel@toradex.com>
References: <20200119220204.208751-1-marcel@ziswiler.com>
 <20200119220204.208751-2-marcel@ziswiler.com>
 <20200119224716.GA4703@ravnborg.org>
In-Reply-To: <20200119224716.GA4703@ravnborg.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=marcel.ziswiler@toradex.com; 
x-originating-ip: [31.10.206.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7a4b58c-673b-4442-8d27-08d79d7eb77a
x-ms-traffictypediagnostic: VI1PR05MB3392:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR05MB33924CA76191B4B8496B8103FB320@VI1PR05MB3392.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39840400004)(376002)(346002)(136003)(396003)(199004)(189003)(6512007)(2906002)(966005)(76116006)(26005)(91956017)(6506007)(54906003)(478600001)(186003)(5660300002)(4326008)(7416002)(8936002)(6916009)(86362001)(8676002)(2616005)(81166006)(81156014)(71200400001)(66446008)(6486002)(66476007)(66556008)(64756008)(66946007)(44832011)(36756003)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR05MB3392;
 H:VI1PR05MB6845.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lxE43od1Y4/lCFU1JIa6c64ueGu0MgzxBeGnamuLQza5b0etTahGeJSKvdV5xKUiK8EjnLQH+r446zW+voBzPc4leI3vbPwPZQrFyAHHL5UdxPiNdik/6G2QUpn2NDvWXejeKEl3F/47YNkATtkAF6PpXKX3TQyyjCZIrudL6w784t1hOSgyaDWFX62PmcYm+4KbtbAL6exylSMMTzdKjU3fLcXL+khmjZWYT7z3BvM3jzjzXt88eXKOlYeC1MbXs/iElWyFVx/ovvOMzI8iuRwIRra7NoNbFYTIaSxuFTJEm+pOCrImsRMZCZ72JrBbT7z+aU96VRofBehuef5QuDbeJLELFXPQ3vbWKl3aLqqZ3vB/gbZZdG88NUNgVDaDJ801g/QnubNAKBFMRXXVintyNeK+ToXu5IBIiN125AV/6Z0nEXBTWqntUm6NdI40detzLfXjXUProllzXbtQzKaU+k74+Sz7lGlmCZ1Pnt/5WaMyaEdwh6y0FBxnvbWZDuyDG4oYxi6swNdj7gxu1w==
Content-ID: <76380504DE363E41B1C4126AD8F8E95A@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a4b58c-673b-4442-8d27-08d79d7eb77a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 07:59:46.3367 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4kgk15Uh0vbLNt2bmcMs2nKuXB9T+s/1KE1aDofFIMoCGvueR+iG6MAVzAFv9RubgASoAQphDDP1ZQND8wJPi2LuAosr99hVe4nZuShdjcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3392
X-Mailman-Approved-At: Mon, 20 Jan 2020 08:58:36 +0000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "j.bauer@endrich.com" <j.bauer@endrich.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 "info@logictechno.com" <info@logictechno.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam

On Sun, 2020-01-19 at 23:47 +0100, Sam Ravnborg wrote:
> Hi Marcel.
> 
> On Sun, Jan 19, 2020 at 11:02:03PM +0100, Marcel Ziswiler wrote:
> > From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > 
> > Add display timings for the following 3 display panels manufactured
> > by
> > Logic Technologies Limited:
> > 
> > - LT161010-2NHC e.g. as found in the Toradex Capacitive Touch
> > Display
> >   7" Parallel [1]
> > - LT161010-2NHR e.g. as found in the Toradex Resistive Touch
> > Display 7"
> >   Parallel [2]
> > - LT170410-2WHC e.g. as found in the Toradex Capacitive Touch
> > Display
> >   10.1" LVDS [3]
> > 
> > Those panels may also be distributed by Endrich Bauelemente
> > Vertriebs
> > GmbH [4].
> > 
> > [1] 
> > https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
> > [2] 
> > https://docs.toradex.com/104498-7-inch-parallel-resistive-touch-display-800x480.pdf
> > [3] 
> > https://docs.toradex.com/105952-10-1-inch-lvds-capacitive-touch-display-1280x800-datasheet.pdf
> > [4] 
> > https://www.endrich.com/isi50_isi30_tft-displays/lt170410-1whc_isi30
> > 
> > Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > Reviewed-by: Philippe Schenker <philippe.schenker@toradex.com>
> > 
> > ---
> > 
> > Changes in v3:
> > - Fix typo in pixelclock frequency for lt170410_2whc as recently
> >   discovered by Philippe.
> > 
> > Changes in v2:
> > - Added Philippe's reviewed-by.
> > 
> >  drivers/gpu/drm/panel/panel-simple.c | 65
> > ++++++++++++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c
> > b/drivers/gpu/drm/panel/panel-simple.c
> > index d6f77bc494c7..4140e0faff06 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -2107,6 +2107,62 @@ static const struct panel_desc lg_lp129qe =
> > {
> >  	},
> >  };
> >  
> > +static const struct display_timing logictechno_lt161010_2nh_timing
> > = {
> > +	.pixelclock = { 26400000, 33300000, 46800000 },
> > +	.hactive = { 800, 800, 800 },
> > +	.hfront_porch = { 16, 210, 354 },
> > +	.hback_porch = { 46, 46, 46 },
> > +	.hsync_len = { 1, 20, 40 },
> > +	.vactive = { 480, 480, 480 },
> > +	.vfront_porch = { 7, 22, 147 },
> > +	.vback_porch = { 23, 23, 23 },
> > +	.vsync_len = { 1, 10, 20 },
> > +	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> > +		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE
> > |
> > +		 DISPLAY_FLAGS_SYNC_POSEDGE,
> > +};
> > +
> > +static const struct panel_desc logictechno_lt161010_2nh = {
> > +	.timings = &logictechno_lt161010_2nh_timing,
> > +	.num_timings = 1,
> > +	.size = {
> > +		.width = 154,
> > +		.height = 86,
> > +	},
> > +	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
> > +		     DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> > +		     DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
> > +};
> connector_type needs to be specified for all panels.
> This is something we have added recently and is today mandatory
> for new panel-simple panels.

Sorry, forgot about that one. Will add it in v4.

> Also please re-order so we add bindings before we driver support for
> the panels.
> This makes checkpatch (and me) more happy.

Not that my checkpatch would warn me about that but kinda makes sense.

> Ohh, and bonus points for using display_timing and specifying
> min,typ,max values.

Thanks, man.

> 	Sam

Cheers

Marcel

> > +
> > +static const struct display_timing
> > logictechno_lt170410_2whc_timing = {
> > +	.pixelclock = { 68900000, 71100000, 73400000 },
> > +	.hactive = { 1280, 1280, 1280 },
> > +	.hfront_porch = { 23, 60, 71 },
> > +	.hback_porch = { 23, 60, 71 },
> > +	.hsync_len = { 15, 40, 47 },
> > +	.vactive = { 800, 800, 800 },
> > +	.vfront_porch = { 5, 7, 10 },
> > +	.vback_porch = { 5, 7, 10 },
> > +	.vsync_len = { 6, 9, 12 },
> > +	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> > +		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE
> > |
> > +		 DISPLAY_FLAGS_SYNC_POSEDGE,
> > +};
> > +
> > +static const struct panel_desc logictechno_lt170410_2whc = {
> > +	.timings = &logictechno_lt170410_2whc_timing,
> > +	.num_timings = 1,
> > +	.size = {
> > +		.width = 217,
> > +		.height = 136,
> > +	},
> > +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
> > +		     DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> > +		     DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
> > +};
> > +
> >  static const struct drm_display_mode mitsubishi_aa070mc01_mode = {
> >  	.clock = 30400,
> >  	.hdisplay = 800,
> > @@ -3417,6 +3473,15 @@ static const struct of_device_id
> > platform_of_match[] = {
> >  	}, {
> >  		.compatible = "logicpd,type28",
> >  		.data = &logicpd_type_28,
> > +	}, {
> > +		.compatible = "logictechno,lt161010-2nhc",
> > +		.data = &logictechno_lt161010_2nh,
> > +	}, {
> > +		.compatible = "logictechno,lt161010-2nhr",
> > +		.data = &logictechno_lt161010_2nh,
> > +	}, {
> > +		.compatible = "logictechno,lt170410-2whc",
> > +		.data = &logictechno_lt170410_2whc,
> >  	}, {
> >  		.compatible = "mitsubishi,aa070mc01-ca1",
> >  		.data = &mitsubishi_aa070mc01,
> > -- 
> > 2.24.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
