Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F03A841C5
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 13:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EC410E964;
	Thu, 10 Apr 2025 11:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazon11020115.outbound.protection.outlook.com
 [52.101.227.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0919110E964
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 11:33:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKZXPqgw2Hoo8WWVt3V6CsoJhBJK09lqSZhqTkddEDotCbvYwTyXCUnmsvJh/S0nRbGeiIaE9M3hBfEcIuKeBK3fICQqFtqUjuPFgaSb9cv8iGWk796kfzmEBB25KsXg5EZ8g5AOZiWDI4OERUcCkRTbjUIImCWJCtpVTaWU7gcBhCVTUGMmnTM4C8bDVZj2KuAfNKgl4IUT3qfnWx/Ll1bsfFM2bWK+O4+00jmAvgIY13XBX6632cziWz9UCUdhNOK8itLiobjxiEAy9tUl4z9XWxjsGTakvRlmjk+WkOx7zDdye5CYl5Sir+2Iin9fwe318H2fzHehQv4JH0Hqeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6V8Pt5GLIX25MlU1bHXvwb2r30xbAuYH7uZFlVYnWM=;
 b=Giu3U3Z1zE2JAtLSoHiBbXkOndqWJ31k17TbB4cuRdUcvRHUtUSkFxseuDnRvOxfH/Q6wjxfi+UoDNhEMcvRRDcy4Rm6JCZ8g1t0+Zy/pS1Ov4eGHXssrbOboZeJfYVd2IAjSMMZ52RkpvbhCgOdym7bMmlNi4Or28p7oUWVBOSzexmVEtRlFVYwRiK/bTIPtoc7k9e4vs+4kEZUnE7qB/gJJTkyKexPKXk/dRYYgteesbkrEA4/fAlIehWWLZrcaIM7ahMzrh2L5LkALWC8X4aNE9O49047lCx8qyyN/YbX4NgFNjZAKTwrL2GFDE8Ggm67Y5ZCaIdYRHvW+LxDZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB2037.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:121::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 11:33:09 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%2]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 11:33:08 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: Need Help Enabling HDMI on Debix Model A
Thread-Topic: Need Help Enabling HDMI on Debix Model A
Thread-Index: AQHbp61bJ8rSy9+zQkebTS5KwgzRBLOYK2mAgAAM5vOAA553AIAAsMExgAA5UQCAAAUpFQ==
Date: Thu, 10 Apr 2025 11:33:08 +0000
Message-ID: <PN3P287MB18297DA8D651F08CA323A7578BB72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <PN3P287MB1829E84B6B79E9C7189D7CB78BAA2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250407130257.GD3924@pendragon.ideasonboard.com>
 <PN3P287MB1829692B4C3D5AD273CB62DE8BAA2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250409210504.GB12162@pendragon.ideasonboard.com>
 <PN3P287MB18297239252C1032A05686558BB72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250410110250.GB24866@pendragon.ideasonboard.com>
In-Reply-To: <20250410110250.GB24866@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB2037:EE_
x-ms-office365-filtering-correlation-id: 5972b651-0955-465f-7505-08dd782377d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?Windows-1252?Q?YRQHVQ/18ms7JAXFT5areheX2liPuRH5vg24soRA+vVpiDbgKWlQMBUf?=
 =?Windows-1252?Q?7rDFbUxhPZVaT3V7T6zaaKaEf8QOlbCFCxF4AY5upsxBjvz0bjO2KyjA?=
 =?Windows-1252?Q?aZnIj4/1zDvza5bjweIdFxpl4vazsHCOMbM4Dua5eNHQ2+MbaFmtFoAU?=
 =?Windows-1252?Q?SMu8wNEbiuhClkzp775R+gSUPFXWZETeLADAd7ZVfrULK39l+q9F2pLK?=
 =?Windows-1252?Q?qAiIwip8g0nyEQ8dJhL8gWZ+jrt+ABToEaBrYbZjLAcS79mEMnQ8Wr38?=
 =?Windows-1252?Q?iTCQXucLVodqM2CNp79rBz6FXZXdwLvm9WUGLEklPxvVBZ6wm0vxlJSX?=
 =?Windows-1252?Q?T/IJXqenUIj0MwAFrksZHdUi0RWP3DXJs7d/qOJH81DpFkonobo5ObNJ?=
 =?Windows-1252?Q?BwO4vJUCwA4zltPYdbxwZFdpimDtovH0htjrgSPIxBLxDFQvXpY4u7XL?=
 =?Windows-1252?Q?+pC4HTRQY/t13eowsR5q6p/CgmeaKzm1MWgo+qAsh7/n+utoMXIEIpp6?=
 =?Windows-1252?Q?tc12HlAdedRCWsOJGTkR/Qq+h5lmmck+AiIwWkoOXwDbfuePle9nbXIL?=
 =?Windows-1252?Q?cyCysReveWksSE+gOArp+sk8dSGEp4DmbGQRXEaiItYKaK9u08K3Wld5?=
 =?Windows-1252?Q?QwHlvWTrv17UICl+XTf4RChFX92fJGM/ZDbDTsxUtcww1EibvZBP5vf+?=
 =?Windows-1252?Q?ceKVZIMiXdyaXUvapP2BTHQxECrtUdV42ztg5C9LpxKVgbC9KxhFYzjA?=
 =?Windows-1252?Q?TNnV9AD/bX+GDlWThnyUvq1I1WdwZoid6RRtAh4HduVoAc8FDWu0e+au?=
 =?Windows-1252?Q?OV6kJdgwHzcqWfkA1DxyRFSLyaF9vHYB12vc/8KQ0A6/8K9c5zxcNbov?=
 =?Windows-1252?Q?mYOtCTvMO57J1sMHK6GarcOkZ6oTlheU29ZtX2E9ojV+uhbb1BG85y/S?=
 =?Windows-1252?Q?oUs5+oztlfOeu7tvkRo2xooEq/egjgnBxs5aJUUtJxEh+Sj3IgOkezWg?=
 =?Windows-1252?Q?t8afUe4lqUdl/qrR5KH+5KgbRHC2U9JEsYaG5VBHPaq8xMqRdJi+CTpS?=
 =?Windows-1252?Q?yzyGPKjZmVGRqEdPsNOrhmq+PJzOl6/LAe3PpGG91kdEh2t0ztuiVFxB?=
 =?Windows-1252?Q?GEj+0s0l+kI/negFhU03zdhvxtYY2xL7O8HtKqgviCyjtc5AXdl3JzKy?=
 =?Windows-1252?Q?TZrQDHNEoZRSt+n5bTVVe6tWpUE4lBQ+3dGBVD+7EimazSOjpsSpFHW4?=
 =?Windows-1252?Q?fM3Pjcqejo9+zSg9PDDpmTLPd03q+SBmxsVJWTYf5QgYOteiHENOUvGY?=
 =?Windows-1252?Q?Ytuo8dl79XdjshF6hcAGwkt8n2tWUyQsSsiHiBjjrum6h8QWzmAnPlo6?=
 =?Windows-1252?Q?P0VbRx0UvNZbXsVN4vwFRJxphs18nnU6gLXl7q5pUAeoOFl2Q1l/bIYz?=
 =?Windows-1252?Q?/1gQ5b7aVxKSx4T/Llg+W85DET9LNyzqqSJEL456t6vNmp10xx5UYs+z?=
 =?Windows-1252?Q?4cJjagnTsSJR3joUatltKhSfY/TS0IzQt/jhbdOJbku/larfuo4ojQFG?=
 =?Windows-1252?Q?/5J3iQkTVExORwPO?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?0cfVCpY3/peKgMOHJZfQDO/uqJb8KWdJ9QhYSOpyc4rw6eBe19rHlz38?=
 =?Windows-1252?Q?GXKi+/BGX10KA6Zrz+Vxs37V0YMHVdje9MGK0NaXUtuXCo5xS/+ArBgB?=
 =?Windows-1252?Q?hSXeYHI5WQRvndvdiODHvKgOWIkFxNsPEo0b1zU3Fsvja9erBi8x+zgK?=
 =?Windows-1252?Q?OK+GB5AsnJZ5CMUt0QgwQ2lg7W7D4TGzPV7OA+H43vz16yslJKNEwlA+?=
 =?Windows-1252?Q?PJEZuWhig6ZXJ2VB9IrIbGkHFP5qZjModEkiXnRJY6ANwJiI6rENBn8n?=
 =?Windows-1252?Q?4AKKnBtXWDb39O9dNngMTk5qixmI7Qo4ToskVBl7RJe3rkCIyx3cdRa9?=
 =?Windows-1252?Q?GnGOC2QMpOItG3M0FrZPNuwyC/yttE99CsmJv+nBUZkdI8v/3LhHb5r+?=
 =?Windows-1252?Q?2TAbxKJFrAMMtojynZ5+pETrCMSVzG2tDW513LW6PRo48IjOacmPWt2A?=
 =?Windows-1252?Q?rbk49e+JmAs+67BtwCXEgbH7gco2lPvL11mtdIBgzVIiH/qiCXjcS9DX?=
 =?Windows-1252?Q?oWqaAtV7vUxJN8LBhEKfVzLF8N1znCTnxF8TM+x7oTOfOewuc3OGSpaL?=
 =?Windows-1252?Q?dowbY6aFtMQRfjy/3wn+PrVWwHOrcncRKUL9HfFvxbmf84lXQzfKKYaQ?=
 =?Windows-1252?Q?fYdeByHnGguVre5+7gemtoRR1tC/KBOqW1KDxySZacQ7CQdef9urpuIf?=
 =?Windows-1252?Q?9J2IWDGq2cLx6TowkfWqs3/rZuTPDwlsFkORIGHtIaqAOoxmSHJxTDwy?=
 =?Windows-1252?Q?Gs60XUFk7VZL/XgfEHkAJBRXBuH/2SJDiT5CdO2a9Pmy43OIBg+nVhc0?=
 =?Windows-1252?Q?ni886jkLAwptYIkOHZgHbxHHDXhSFJh7k76FV7E34DsSscJd4qUgi5lr?=
 =?Windows-1252?Q?7jXeuRx4zzy/ah80I5CnW4Qd0s3lUKzFig21kB6CZxS6l+L8nbltw+Lx?=
 =?Windows-1252?Q?clkWKJ7TApDj5NCxHErT2X9DyExgH+kBje+RtPplsqO8sK1P9cJUEVLC?=
 =?Windows-1252?Q?vmLYpT0PJEFEkM0k15uWdmxEacXqX5zvHj0Uw9HrxxP0j2r080Tsbl86?=
 =?Windows-1252?Q?BJ7UC5upcAbbt0bF9oTOHOcV4gYy0DlaqnBt/Y6hCJR58VNsKt9ERZJ0?=
 =?Windows-1252?Q?XyzrWvoS+vLMpSd0kDrFRUeRY5ohWA8nW5IkbIGonSORLuu8uKVT5lgV?=
 =?Windows-1252?Q?VLu/Pe56FYl/MAE0u1vhD/50+xd4BttUr+qYXOdtZWfNRy3Ie4qB8B+Q?=
 =?Windows-1252?Q?GDiKRuk6hJsG6o3hBp2Y18ALrR7Ddhiq4MzIeQMhSynUoaIH3FvUeSK/?=
 =?Windows-1252?Q?YgbPBmirEAZjrIGa6TXSonP09OdtkeuIqqZejsNQ2bc5sicZZkzothO8?=
 =?Windows-1252?Q?GLoICnTSHk8Q+cLmeS5+RhGZS9wwZxHPAKs/FY+kRD9O/oL7hY/Rd8Xs?=
 =?Windows-1252?Q?Gf28jN4d5MUsRs2e2ICyutk2CGMQPUhSPd8wz+Q5FODsnsX9Lmosvcl1?=
 =?Windows-1252?Q?8BjvJInxxo6tfYB/go6cBXcWrcTLICttoENuOq1YA9Ubs1KBG4/wojZH?=
 =?Windows-1252?Q?rcgjRSmXzvDVzW7bruwTJ8X/SPZ6bSj7gsxIYZKnv2/hFTF++3Wnms2E?=
 =?Windows-1252?Q?EKqQKdBjFZ7CfCoXz6/tyZamS2NG7xmZT2DNe9D7TXYRyiOm29cVFr7j?=
 =?Windows-1252?Q?ZMhRbeSUcv8BX6+LWxKtE4yNa+nwz+nmiHt4zYOyPvgCRI+pAsAn8A?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5972b651-0955-465f-7505-08dd782377d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 11:33:08.5867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rD8XQZo8gFQ/0dvPpZIxkN/oAjyorGe2Jg7Bn6n/33gOhApBiie3eFR5oaz32RVAyiWTAYmVQ25SvivTn0XlxJ2OaTIGR9bP1SdsrSyIOtQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB2037
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,=0A=
=0A=
> On Thu, Apr 10, 2025 at 08:13:17AM +0000, Tarang Raval wrote:=0A=
> > > On Mon, Apr 07, 2025 at 02:06:35PM +0000, Tarang Raval wrote:=0A=
> > > > > On Mon, Apr 07, 2025 at 11:10:23AM +0000, Tarang Raval wrote:=0A=
> > > > > > Hi Laurent,=0A=
> > > > > >=0A=
> > > > > > I=92m trying to bring up HDMI on the Debix Model A board using =
the=0A=
> > > > > > mainline kernel, but I=92m currently facing issues.=0A=
> > > > > >=0A=
> > > > > > I saw that you tested the patch for HDMI support on this board =
in=0A=
> > > > > > mainline, so I am hoping you could help me figure out what migh=
t be=0A=
> > > > > > missing.=0A=
> > > > > >=0A=
> > > > > > To clarify =97 I'm using the prebuilt image provided by Debix, =
but I replaced=0A=
> > > > > > the kernel image and the device tree (DTS) file in the /boot di=
rectory with=0A=
> > > > > > ones built from the mainline kernel.=0A=
> > > > > >=0A=
> > > > > > I=92ve enabled the following configurations in the kernel:=0A=
> > > > > > CONFIG_DRM_DISPLAY_CONNECTOR=3Dy=0A=
> > > > > > CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE=3Dy=0A=
> > > > > > CONFIG_DRM_IMX8MP_HDMI_PVI=3Dy=0A=
> > > > > > CONFIG_DRM_IMX_LCDIF=3Dy=0A=
> > > > > > CONFIG_PHY_FSL_SAMSUNG_HDMI_PHY=3Dy=0A=
> > > > > >=0A=
> > > > > > When I boot the board, I see the following HDMI/DRM related log=
s:=0A=
> > > > > > debix@imx8mp-debix:~$ dmesg | grep -iE "drm|hdmi"=0A=
> > > > > > [ =A0 =A00.121979] /soc@0/bus@32c00000/display-bridge@32fc4000:=
 Fixed dependency cycle(s) with /soc@0/bus@32c00000/hdmi@32fd8000=0A=
> > > > > > [ =A0 =A00.122164] /soc@0/bus@32c00000/hdmi@32fd8000: Fixed dep=
endency cycle(s) with /soc@0/bus@32c00000/display-bridge@32fc4000=0A=
> > > > > > [ =A0 =A00.127417] /soc@0/bus@32c00000/hdmi@32fd8000: Fixed dep=
endency cycle(s) with /hdmi-connector=0A=
> > > > > > [ =A0 =A00.127608] /hdmi-connector: Fixed dependency cycle(s) w=
ith /soc@0/bus@32c00000/hdmi@32fd8000=0A=
> > > > > > [ =A0 =A01.947962] imx8mp-dw-hdmi-tx 32fd8000.hdmi: Detected HD=
MI TX controller v2.13a with HDCP (SAMSUNG HDMI TX PHY)=0A=
> > > > > > [ =A0 =A01.949220] imx8mp-dw-hdmi-tx 32fd8000.hdmi: registered =
DesignWare HDMI I2C bus driver=0A=
> > > > > > [ =A0 =A01.956365] [drm] Initialized imx-lcdif 1.0.0 for 32fc60=
00.display-controller on minor 0=0A=
> > > > > > [ =A0 =A02.016601] imx-lcdif 32fc6000.display-controller: [drm]=
 fb0: imx-lcdifdrmfb frame buffer device=0A=
> > > > > > [ =A0 =A08.380915] systemd[1]: Starting Load Kernel Module drm.=
..=0A=
> > > > > >=0A=
> > > > > >=0A=
> > > > > > I also checked that the display's modeline is recognized under =
sysfs :=0A=
> > > > > >=0A=
> > > > > > root@imx8mp-debix:~# ls /sys/class/drm/card0-HDMI-A-1/=0A=
> > > > > > connector_id =A0dpms =A0 =A0 =A0 =A0 =A0modes =A0 =A0 =A0 =A0 s=
ubsystem/=0A=
> > > > > > ddc/ =A0 =A0 =A0 =A0 =A0edid =A0 =A0 =A0 =A0 =A0power/ =A0 =A0 =
=A0 =A0uevent=0A=
> > > > > > device/ =A0 =A0 =A0 enabled =A0 =A0 =A0 status=0A=
> > > > > >=0A=
> > > > > > However, there is still no HDMI output on the display. Instead,=
=0A=
> > > > > > I only see a white blinking cursor on the screen.. I'm not sure=
=0A=
> > > > > > what I'm missing.=0A=
> > > > >=A0=0A=
> > > > > The white blinking cursor means the display is working from the k=
ernel=0A=
> > > > > point of view. What are you expecting, are you running an X serve=
r or=0A=
> > > > > Wayland compositor ?=0A=
> > > >=0A=
> > > > I'm expecting to see the Ubuntu desktop environment on the HDMI=0A=
> > > > display =97 just like how it appears with the original prebuilt ima=
ge provided=0A=
> > > > by Debix. I'm running the default Ubuntu 22.04 LTS prebuilt image, =
and I only=0A=
> > > > replaced the Image and .dtb file=0A=
> > > >=0A=
> > > > I'm not explicitly launching an X server or Wayland compositor myse=
lf=0A=
> > > >=0A=
> > > > However, based on your response, I now realize that I may also need=
 to=0A=
> > > > enable GPU support in the mainline device tree. Specifically, I bel=
ieve I=0A=
> > > > need to enable the gpu2D and gpu3D nodes to allow the graphical=0A=
> > > > environment to start properly and render the desktop over HDMI.=0A=
> > > >=0A=
> > > > Does that sound correct, or is there anything else I should check o=
r=0A=
> > > > enable?=0A=
> > >=A0=0A=
> > > That's a plausible explanation. The 2D GPU is probably not used by th=
e=0A=
> > > compositor, but a 3D GPU could be required. I'd recommend checking th=
e=0A=
> > > system logs to see why the compositor (or session manager) failed to=
=0A=
> > > start.=0A=
> >=0A=
> > I reviewed the system logs for more context regarding the failure of th=
e=0A=
> > compositor (or session manager) to start.=0A=
> >=0A=
> > Here are some relevant log entries from journalctl -b -p err:=0A=
> >=0A=
> > debix@imx8mp-debix:~$ journalctl -b -p err=0A=
> > Hint: You are currently not seeing messages from other users and the sy=
stem.=0A=
> > =A0 =A0 =A0 Users in groups 'adm', 'systemd-journal' can see all messag=
es.=0A=
> > =A0 =A0 =A0 Pass -q to turn off this notice.=0A=
> > Apr 10 06:37:29 imx8mp-debix pulseaudio[766]: GetManagedObjects() faile=
d: org.freedesktop.systemd1.NoSuchUnit: Unit dbus-org.bluez.serv>=0A=
> > Apr 10 06:37:29 imx8mp-debix systemd[757]: Failed to start Application =
launched by gnome-session-binary.=0A=
> > Apr 10 06:37:29 imx8mp-debix systemd[757]: Failed to start Application =
launched by gnome-session-binary.=0A=
> > Apr 10 06:37:30 imx8mp-debix systemd[757]: Failed to start GNOME Shell =
on Wayland.=0A=
> >=0A=
> > Additionally, from journalctl -b | grep -i gnome, the following lines a=
ppear to be significant:=0A=
> >=0A=
> > Apr 10 06:37:29 imx8mp-debix systemd[757]: org.gnome.Shell@x11.service:=
 Skipped due to 'exec-condition'.=0A=
> > Apr 10 06:37:29 imx8mp-debix systemd[757]: Started GNOME Shell on X11.=
=0A=
> > Apr 10 06:37:30 imx8mp-debix gnome-shell[873]: Running GNOME Shell (usi=
ng mutter 42.9) as a Wayland display server=0A=
> > Apr 10 06:37:30 imx8mp-debix gnome-shell[873]: g_hash_table_destroy: as=
sertion 'hash_table !=3D NULL' failed=0A=
> > Apr 10 06:37:30 imx8mp-debix gnome-shell[873]: Failed to open gpu '/dev=
/dri/card0': No suitable mode setting backend found=0A=
>=A0=0A=
> I don't know how gnome-shell finds the GPU, if Ubuntu ships a modified=0A=
> version, or possibly configuration files specific to the closed-source=0A=
> GPU stack shipped with the BSP kernel. It could also be that the mesa=0A=
> version they ship does not support the upstream kernel driver. You will=
=0A=
> have to investigate all this.=0A=
=0A=
I need to verify the compatibility between the kernel GPU driver (etnaviv),=
 =0A=
the Mesa library version, and GNOME Shell on my Ubuntu image, is that corre=
ct?=0A=
=0A=
you're suggesting that the prebuilt Ubuntu image might be expecting a =0A=
proprietary GPU driver provided by the BSP kernel is that what you meant?=
=0A=
=0A=
> > Apr 10 06:37:30 imx8mp-debix gnome-shell[873]: Added device '/dev/dri/c=
ard1' (imx-lcdif) using atomic mode setting.=0A=
> > Apr 10 06:37:30 imx8mp-debix gnome-shell[873]: Failed to setup: No GPUs=
 with outputs found=0A=
> >=0A=
> > the GNOME Shell logs indicate that no GPUs with outputs were found but =
the dmesg=0A=
> > output suggests that the GPU is successfully probed and initialized:=0A=
> >=0A=
> > debix@imx8mp-debix:~$ dmesg | grep -i -e drm -e gpu -e galcore -e etnav=
iv=0A=
> > [ =A0 =A02.156784] etnaviv etnaviv: bound 38000000.gpu (ops gpu_ops)=0A=
> > [ =A0 =A02.157294] etnaviv etnaviv: bound 38008000.gpu (ops gpu_ops)=0A=
> > [ =A0 =A02.157753] etnaviv etnaviv: bound 38500000.npu (ops gpu_ops)=0A=
> > [ =A0 =A02.157852] etnaviv-gpu 38000000.gpu: model: GC7000, revision: 6=
204=0A=
> > [ =A0 =A02.157986] etnaviv-gpu 38008000.gpu: model: GC520, revision: 53=
41=0A=
> > [ =A0 =A02.158111] etnaviv-gpu 38500000.npu: model: GC8000, revision: 8=
002=0A=
> > [ =A0 =A02.158118] etnaviv-gpu 38500000.npu: etnaviv has been instantia=
ted on a NPU, for which the UAPI is still experimental=0A=
> > [ =A0 =A02.158905] [drm] Initialized etnaviv 1.4.0 for etnaviv on minor=
 0=0A=
> > [ =A0 =A02.161597] [drm] Initialized imx-lcdif 1.0.0 for 32fc6000.displ=
ay-controller on minor 1=0A=
> > [ =A0 =A02.161637] imx-lcdif 32fc6000.display-controller: [drm] Cannot =
find any crtc or sizes=0A=
>=A0=0A=
> This doesn't seem right. Here's the corresponding part of my boot log:=0A=
>=A0=0A=
> [ =A0 =A03.347606] imx8mp-dw-hdmi-tx 32fd8000.hdmi: Detected HDMI TX cont=
roller v2.13a with HDCP (SAMSUNG HDMI TX PHY)=0A=
> [ =A0 =A03.352436] imx8mp-dw-hdmi-tx 32fd8000.hdmi: registered DesignWare=
 HDMI I2C bus driver=0A=
> [ =A0 =A03.378609] etnaviv etnaviv: bound 38000000.gpu (ops gpu_ops)=0A=
> [ =A0 =A03.379829] etnaviv etnaviv: bound 38008000.gpu (ops gpu_ops)=0A=
> [ =A0 =A03.381695] etnaviv etnaviv: bound 38500000.npu (ops gpu_ops)=0A=
> [ =A0 =A03.382290] etnaviv-gpu 38000000.gpu: model: GC7000, revision: 620=
4=0A=
> [ =A0 =A03.383178] etnaviv-gpu 38008000.gpu: model: GC520, revision: 5341=
=0A=
> [ =A0 =A03.383735] etnaviv-gpu 38500000.npu: model: GC8000, revision: 800=
2=0A=
> [ =A0 =A03.383753] etnaviv-gpu 38500000.npu: etnaviv has been instantiate=
d on a NPU, for which the UAPI is still experimental=0A=
> [ =A0 =A03.386818] [drm] Initialized etnaviv 1.4.0 for etnaviv on minor 0=
=0A=
> [ =A0 =A03.390018] stackdepot: allocating hash table of 131072 entries vi=
a kvcalloc=0A=
> [ =A0 =A03.399113] [drm] Initialized imx-lcdif 1.0.0 for 32fc6000.display=
-controller on minor 1=0A=
> [ =A0 =A03.523021] Console: switching to colour frame buffer device 180x5=
6=0A=
> [ =A0 =A03.539272] imx-lcdif 32fc6000.display-controller: [drm] fb0: imx-=
lcdifdrmfb frame buffer device=0A=
=0A=
Thank you for sharing this.=0A=
=0A=
One last question: Is this log from the mainline kernel?=0A=
If so, did you apply any external patches to the GPU driver to make it work=
?=0A=
=0A=
Best regards,=0A=
Tarang=0A=
=0A=
> > [ =A0 10.201152] systemd[1]: Starting Load Kernel Module drm...=0A=
> >=0A=
> > I have not yet identified a conclusive reason for GNOME Shell's failure=
 to start.=0A=
> >=0A=
> > However, since my primary objective was to preview the camera output=0A=
> > on the display, I initially suspected the issue might be related to the=
 HDMI=0A=
> > display, as I encountered errors while using autovideosink. After your=
=0A=
> > confirmation that the display was functioning correctly, I explored alt=
ernative=0A=
> > video sinks and was able to successfully achieve a working preview usin=
g=0A=
> > fbdevsink.=0A=
> >=0A=
> > I may revisit the GNOME Shell issue when time permits. If you have any=
=0A=
> > suggestions or insights regarding the compositor or GPU setup failure, =
I=92d be=0A=
> > happy to take them into consideration.=0A=
> >=0A=
> > > > > > Could you please help me out or point me in the right direction=
?=0A=
> > > > > >=0A=
> > > > > > Thank you for your time.=0A=
>=A0=0A=
> --=0A=
> Regards,=0A=
>=A0=0A=
> Laurent Pinchart=
