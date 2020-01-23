Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B52AE1479B7
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 09:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429A36FF89;
	Fri, 24 Jan 2020 08:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50109.outbound.protection.outlook.com [40.107.5.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F3D6FCB7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 13:33:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bu48LjLOTPZLNkp6x7ElmAzU/PyeQ9mG77qkhPjfF0DZN12qyllqsBp73IXQ3BjUJ1WQWRCD0ljwtxzYMHg7hAbNVOLMj9Srps9aLCOUZoEBREOS8z+mDMapCg0fLSRFkTOkdpRlH6gV8BeF19DWbiVmNoMghNaIGHjsJK24jKqX0eEsh8VOL1kvNpLsrSNo7yCrnCntcjSAkM6+gwM8YE7LFUVPoOb3vUBOeSPDnqEHOQ01gxICVPFNNQooo1AJTKhiwUbbS8ptxknU+KQiiG9v8Fxl6BsZB1rE8i9CtqLFmK5en/R7qKHbwmFK/hT53BSyk+6zEXjhZAceLraGmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyGYRwUAdl76/dnRq7nb6vRVMIRVtsTopT3zpbP2Hoo=;
 b=hcoU9xdkAoto0VRTCrEk7yHDP8bgKbjCNMD9fwXjA7otZocIc484gS2wsavnAl69nLGr9uAxGRoU4DTXflaPe27ne9JEtRbccOCxNzKlT8R89WqgtiVfiOFgmi+fpzhstaspQAPRzF7/SSLj94KZg54DUyiEQLdFsx1rOgkj3o9ZGQ2atVDh8wO18GSL5PmLpzoWQNbxdS0ZhVySZGtlz26fX3bqivKRQuEJDYF6kg9SCSDcdFKq5SkgNcLZewBAT6XZ0BSVVdJ0jeM82Mq2Oyf4MxLmLefN8Dng6dlxWQevelkVzallqdoPg4xrvLo3tUjdbd2iuqEf19HHRDqeng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyGYRwUAdl76/dnRq7nb6vRVMIRVtsTopT3zpbP2Hoo=;
 b=tlFp42Y0Ed9SiF8kHxeC+rqNbEbE0V/SyRDE15ltjRYz74RMhGSQ0AVtD+Zot3Lgu4cboqcuCflKK/EtPxmSFSpoCTLlx43vVloL2ErCCQmE+vIcf2lYRuHmXju/X/CuW3FUSxdze9sxV9OHVWHf2F63zmHj5sa6B1zUJex+pms=
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com (10.170.238.24) by
 VI1PR05MB6768.eurprd05.prod.outlook.com (10.186.163.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.28; Thu, 23 Jan 2020 13:33:35 +0000
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::c14f:4592:515f:6e52]) by VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::c14f:4592:515f:6e52%7]) with mapi id 15.20.2644.027; Thu, 23 Jan 2020
 13:33:35 +0000
Received: from mail-qk1-f173.google.com (209.85.222.173) by
 MN2PR20CA0045.namprd20.prod.outlook.com (2603:10b6:208:235::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20 via Frontend
 Transport; Thu, 23 Jan 2020 13:33:34 +0000
Received: by mail-qk1-f173.google.com with SMTP id v195so3336922qkb.11 for
 <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 05:33:33 -0800 (PST)
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Marcel Ziswiler <marcel@ziswiler.com>
Subject: Re: [PATCH v4 3/3] drm/panel: simple: add display timings for logic
 technologies displays
Thread-Topic: [PATCH v4 3/3] drm/panel: simple: add display timings for logic
 technologies displays
Thread-Index: AQHV0fGspUwBsIOC+UqtQgRpcBDVdg==
Date: Thu, 23 Jan 2020 13:33:34 +0000
Message-ID: <CAGgjyvH1TPgVevuXyjY-m-+gxokTZHf84bHLRxtm=v4gDnz2xQ@mail.gmail.com>
References: <20200120080100.170294-1-marcel@ziswiler.com>
 <20200120080100.170294-3-marcel@ziswiler.com>
In-Reply-To: <20200120080100.170294-3-marcel@ziswiler.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR20CA0045.namprd20.prod.outlook.com
 (2603:10b6:208:235::14) To VI1PR05MB3279.eurprd05.prod.outlook.com
 (2603:10a6:802:1c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-gm-message-state: APjAAAWPu1jKx5P9j8OiwgtgM548yN6titfAI5n+0W1PPWCspQA24vE6
 5jJjINnytGKWE5LJ1nV5UPCRtAWwuFMXY4lY3eo=
x-google-smtp-source: APXvYqzXleXgx8VP42yU4MjCDPR0mp2ou+BKiHP60Ca9SQfsUq2Yh11AaCQGH7/c7GbRFGHccrzRgt4kRsho3OmaGcw=
x-received: by 2002:a37:8ac4:: with SMTP id
 m187mr15707564qkd.277.1579786410499; Thu, 23 Jan 2020 05:33:30 -0800 (PST)
x-gmail-original-message-id: <CAGgjyvH1TPgVevuXyjY-m-+gxokTZHf84bHLRxtm=v4gDnz2xQ@mail.gmail.com>
x-originating-ip: [209.85.222.173]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a560d819-6123-460d-1a02-08d7a008d7fe
x-ms-traffictypediagnostic: VI1PR05MB6768:
x-microsoft-antispam-prvs: <VI1PR05MB676878198C564B6041B822AEF90F0@VI1PR05MB6768.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 029174C036
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39840400004)(396003)(136003)(346002)(366004)(376002)(199004)(189003)(8936002)(26005)(52116002)(186003)(53546011)(54906003)(42186006)(71200400001)(8676002)(316002)(44832011)(6862004)(107886003)(9686003)(4326008)(66446008)(66476007)(66556008)(64756008)(86362001)(55446002)(966005)(81166006)(81156014)(2906002)(66946007)(478600001)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR05MB6768;
 H:VI1PR05MB3279.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lqL5vlEmgmJPZoaRt5jATnNCX4twoMnMQHiKkhceSJmYZv8VOokRD1nLOF1mZDuLT8aESgOaZjEwhDokyMkkBxN0V2/Vy8NDACXradJNndt7kDtfw0OmvL8Vw82kFTpffGPXnozpddrwydB2Bp4wnDxum8/g3tFsjyOtabD8l70PmjoAZqCr/3ImvHj4dTNIKFtJmXbHplcp+hc+63kdulTka+WmSJFj2vJQQ/aodSq+ogzOU9Pw7gd/f9AI4YcrzYpgCSCvMgZGLtsYzV1izg5fTg62oblfcpyqvysFWDDpT029qFpvFwOUXnX3Qm3Ne2ou4+9AvIznMRcrT9xaWwrnlNF3hY2I2eqB8Ksj1HZMRovRWau7eLg0rSduuoV0pNVzkNsxmoW5ycKoDQO9H6ms6DPZcrTtTwvWxAlFmcdrw/EaTmqm6SKJSTN3LUxojsurLEBlQ6oOukTY27r7yC0iNDg0m0L6kzggnqXP628=
x-ms-exchange-transport-forked: True
Content-ID: <53FA65BB42171D4FAF7C4706CA31C9E1@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a560d819-6123-460d-1a02-08d7a008d7fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2020 13:33:34.3969 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F2p2/OslnLF1dUjYiBWGBnVoZNEuupSKMleK26aq2tNQY4UwlwO/+8cRVktSW06GiOmsFUaiwhrTtGquWHKfFpY9CPoKh0sltmsdCLibtPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6768
X-Mailman-Approved-At: Fri, 24 Jan 2020 08:52:34 +0000
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
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "j.bauer@endrich.com" <j.bauer@endrich.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 "info@logictechno.com" <info@logictechno.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 20, 2020 at 10:02 AM Marcel Ziswiler <marcel@ziswiler.com> wrote:
>
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>
> Add display timings for the following 3 display panels manufactured by
> Logic Technologies Limited:
>
> - LT161010-2NHC e.g. as found in the Toradex Capacitive Touch Display
>   7" Parallel [1]
> - LT161010-2NHR e.g. as found in the Toradex Resistive Touch Display 7"
>   Parallel [2]
> - LT170410-2WHC e.g. as found in the Toradex Capacitive Touch Display
>   10.1" LVDS [3]
>
> Those panels may also be distributed by Endrich Bauelemente Vertriebs
> GmbH [4].
>
> [1] https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
> [2] https://docs.toradex.com/104498-7-inch-parallel-resistive-touch-display-800x480.pdf
> [3] https://docs.toradex.com/105952-10-1-inch-lvds-capacitive-touch-display-1280x800-datasheet.pdf
> [4] https://www.endrich.com/isi50_isi30_tft-displays/lt170410-1whc_isi30
>
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Reviewed-by: Philippe Schenker <philippe.schenker@toradex.com>

Reviewed-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>

>
> ---
>
> Changes in v4:
> - Added recently made mandatory connector_type information as pointed
>   out by Sam.
>
> Changes in v3:
> - Fix typo in pixelclock frequency for lt170410_2whc as recently
>   discovered by Philippe.
>
> Changes in v2:
> - Added Philippe's reviewed-by.
>
>  drivers/gpu/drm/panel/panel-simple.c | 67 ++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index d6f77bc494c7..a0dd84e11db7 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2107,6 +2107,64 @@ static const struct panel_desc lg_lp129qe = {
>         },
>  };
>
> +static const struct display_timing logictechno_lt161010_2nh_timing = {
> +       .pixelclock = { 26400000, 33300000, 46800000 },
> +       .hactive = { 800, 800, 800 },
> +       .hfront_porch = { 16, 210, 354 },
> +       .hback_porch = { 46, 46, 46 },
> +       .hsync_len = { 1, 20, 40 },
> +       .vactive = { 480, 480, 480 },
> +       .vfront_porch = { 7, 22, 147 },
> +       .vback_porch = { 23, 23, 23 },
> +       .vsync_len = { 1, 10, 20 },
> +       .flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> +                DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE |
> +                DISPLAY_FLAGS_SYNC_POSEDGE,
> +};
> +
> +static const struct panel_desc logictechno_lt161010_2nh = {
> +       .timings = &logictechno_lt161010_2nh_timing,
> +       .num_timings = 1,
> +       .size = {
> +               .width = 154,
> +               .height = 86,
> +       },
> +       .bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> +       .bus_flags = DRM_BUS_FLAG_DE_HIGH |
> +                    DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> +                    DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
> +       .connector_type = DRM_MODE_CONNECTOR_DPI,
> +};
> +
> +static const struct display_timing logictechno_lt170410_2whc_timing = {
> +       .pixelclock = { 68900000, 71100000, 73400000 },
> +       .hactive = { 1280, 1280, 1280 },
> +       .hfront_porch = { 23, 60, 71 },
> +       .hback_porch = { 23, 60, 71 },
> +       .hsync_len = { 15, 40, 47 },
> +       .vactive = { 800, 800, 800 },
> +       .vfront_porch = { 5, 7, 10 },
> +       .vback_porch = { 5, 7, 10 },
> +       .vsync_len = { 6, 9, 12 },
> +       .flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> +                DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE |
> +                DISPLAY_FLAGS_SYNC_POSEDGE,
> +};
> +
> +static const struct panel_desc logictechno_lt170410_2whc = {
> +       .timings = &logictechno_lt170410_2whc_timing,
> +       .num_timings = 1,
> +       .size = {
> +               .width = 217,
> +               .height = 136,
> +       },
> +       .bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +       .bus_flags = DRM_BUS_FLAG_DE_HIGH |
> +                    DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> +                    DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
> +       .connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>  static const struct drm_display_mode mitsubishi_aa070mc01_mode = {
>         .clock = 30400,
>         .hdisplay = 800,
> @@ -3417,6 +3475,15 @@ static const struct of_device_id platform_of_match[] = {
>         }, {
>                 .compatible = "logicpd,type28",
>                 .data = &logicpd_type_28,
> +       }, {
> +               .compatible = "logictechno,lt161010-2nhc",
> +               .data = &logictechno_lt161010_2nh,
> +       }, {
> +               .compatible = "logictechno,lt161010-2nhr",
> +               .data = &logictechno_lt161010_2nh,
> +       }, {
> +               .compatible = "logictechno,lt170410-2whc",
> +               .data = &logictechno_lt170410_2whc,
>         }, {
>                 .compatible = "mitsubishi,aa070mc01-ca1",
>                 .data = &mitsubishi_aa070mc01,
> --
> 2.24.1
>


-- 
Best regards
Oleksandr Suvorov

Toradex AG
Altsagenstrasse 5 | 6048 Horw/Luzern | Switzerland | T: +41 41 500
4800 (main line)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
