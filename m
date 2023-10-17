Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B55477CC04F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 12:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02D610E2BC;
	Tue, 17 Oct 2023 10:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2081.outbound.protection.outlook.com [40.107.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2735310E2BC
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 10:15:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/SNC0DvX1HxkWHMEqO2ks0OgwEAvOy6dqgBKVlCmoL5R7E6vf6PHbDG9Pyk5jzdu6uwYdvYcro77i10AQl+zjDqw5JDhJKOpHix96N15ebECD67seOcF/C0lKrlE8+1jot3dRkLZt3HKy09cg30soHJ061tnrx01L46Cs7/2011jmeFa8FFoz8Xc9JcER0a+B5eM5hMBDcWw7qTXg+mArGmFHb9yZhJIdWJ9twins1ZFy1/XR103YuCLa0NnxUpw3DyiakNQFYvvQ2b9qVcfG2+A3bFTUlvuj2z3aKeD12P6IUTeSwtB1/auOd6tFXM5kC7WM6L4KHjZI7HRCleuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KH9yVAVeDUzFSzMdzQAi9FUcQx4RhXxg+fYRl23z+U=;
 b=mC9uo/vFeE1jgjfCjdMu/ae0eRRXlJvpro75IQvAg0ly3tjMciWNVyR9vl5o0f8COdLoKKRugZr/alsXzdxz/DkA17idlabMKmlqdF+abA6Vv5dOHKjx/29iQLduAFIwH57TQjtN6VNfDfOrqe4Kk6ifuOifEFkRZ+WjI0RkUonNI3hDre5yT6jmViX6u0BQxJfD+hw37z18N/i9pM2oFr/g+6bvp8s+N6I3Ija8BKlTtB8Z6s8lYMssSc6F77COEAdYwIw95wbEywfqumcXQwNKZcsdTpB0m5njRfXLtRE/86l8pI78+dCSxiIpW1LWnHnBru+QLzcUgasrx+6LGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KH9yVAVeDUzFSzMdzQAi9FUcQx4RhXxg+fYRl23z+U=;
 b=rkVgUI/H//8SVjADmzARiAZXXEOUuXSE9zJmpPzx7Zbg+qsvbx6BKORBUB5HcHotegUv1TIovePnh1/DrBdusuCPQH5DWCrv+nJn8IKitE48XLXyoxHmEXe0xSrf1Gb/mGdnDyyneo+Kr1F3Fkk6beShpCxEFpont69JhFQVuRk=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB6980.eurprd04.prod.outlook.com (2603:10a6:208:17e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 10:15:11 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::1ace:f566:c57a:7d4b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::1ace:f566:c57a:7d4b%3]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 10:15:11 +0000
From: Ying Liu <victor.liu@nxp.com>
To: =?iso-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 5/9] drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock
 rate to calculate lbcc
Thread-Topic: [PATCH 5/9] drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock
 rate to calculate lbcc
Thread-Index: AQHZuHXpqXOq9togg0KlH6zT2dl/2bBNSFMAgAD73jA=
Date: Tue, 17 Oct 2023 10:15:11 +0000
Message-ID: <AM7PR04MB7046C954891C3ABEC568DC1F98D6A@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230717061831.1826878-1-victor.liu@nxp.com>
 <20230717061831.1826878-6-victor.liu@nxp.com> <1971539.CrzyxZ31qj@diego>
In-Reply-To: <1971539.CrzyxZ31qj@diego>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|AM0PR04MB6980:EE_
x-ms-office365-filtering-correlation-id: 09cf8190-7283-40f4-5b33-08dbcef9f2bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LaHJqPcB2ComYqWUjwmlIOz7RRUbG9jPxgUpLlUDJ7ZoekL+rhGW0dw69HfgVtXfxaRZo9fiwdBMObXX+3CHG72SI36W5hzVYNHA292W2j83fnIWgSWppDQvRsx/hfUECuQyvDC7QEAbVh/4pyublekZT8zDFNwmfWpaYdfHbAimo3vigl3/Du0Zleamcu4r9onJ77ZAggep2auZVU8LTP/ihHZJ+xAQOy/Ur8ePcLu90HXRPbfzUrClOb0wOQw4cp5TmKVtpSzUeCxBxUSKHdQa34brOdk9i+AUNOvNEXBkmJaO6w3p1zkn+0mQ/KJ3OuWFHKXyhltUMVe2i/Ec3l1UZxgm4dDKdaEB6RMEptUYCHzgJsxMiHDfEl7+uBULux/mpp8VcD3p/qInIqYBO5HN6qZd6QjJqxq/7gu07B13ZfZ9gGVir5RfptaffWxd0+Az7dJWEr4eSYk7i0MWPzB4J7BOTLllmBnLHMjbDzELTVMSQDWO0yMV+uR6w+0p0coSkVIxXpQl5dXUB0rRfYILALnTICaKpY1M/J46lhMWDzWtPwlshuO4gMxk9g456CRFXIW19P0GxXe3obbyCYFQkKAAXA/HqYFlelqP+wA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(366004)(346002)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(110136005)(966005)(478600001)(45080400002)(53546011)(9686003)(7696005)(86362001)(38070700005)(122000001)(40140700001)(6506007)(33656002)(71200400001)(55016003)(38100700002)(26005)(66574015)(83380400001)(316002)(76116006)(64756008)(54906003)(66946007)(66476007)(41300700001)(5660300002)(66556008)(8936002)(8676002)(66446008)(4326008)(2906002)(7416002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zHYDCNSQXy16hVDJs3vnJOquyVJVu+zz7WeZzXXHy3iAo5IMF1FPiQXoag?=
 =?iso-8859-1?Q?oS0iISyrowYlcKlGoSjA8PtT+6V7LsgkBV0Mr4QKs3bCD93wJySX9CGr5l?=
 =?iso-8859-1?Q?Tc84COfXZi3QxNR+kRMDYyK4NKMFvCsyK8x0/hN9MVIv0WC/e0Rq3kqxmX?=
 =?iso-8859-1?Q?JT6AciqnPj1INq9AzLVy8mFa3t/bUmqdRDC1rD/PLmeZqViMx0T85wRO/H?=
 =?iso-8859-1?Q?c2XuwgBDRBrtls+QVcSgntul8BCTl5TjviE4QSA6+UnJt5Q2zS1pODUQGB?=
 =?iso-8859-1?Q?f9AitQpG4BTYI5Dm53F2jAVQC1lkVS8zy3lYuGqMWjTde1IKuB1ReYmL5V?=
 =?iso-8859-1?Q?ebj6LsXRryJsRh0lFgP7pPChbMZCE0CD9DKnVgrc02h4Re7U/VkQvVNyC0?=
 =?iso-8859-1?Q?+Mzbi34KVvCtPfAZgINlKK3/pMlg1zGePKIf8ls4QW+f+IdhdYQKL63W69?=
 =?iso-8859-1?Q?NbJHMZULn2UPGjMhvahfm7vfpyK40639LJ46nplsXQuEwhNuqF/mryvzPV?=
 =?iso-8859-1?Q?7mnHEf/YmoFrsuxOw5hINBWckfeU6OrRNfh4D2s+Hyugp6T38pS+lbeIzm?=
 =?iso-8859-1?Q?MiPe7rmxpkxS7rH6RAPOj8ewxWs/iydfu3PGHCE1aJjC6hg+G36T7r3HT/?=
 =?iso-8859-1?Q?EOhJfbVcNBt5qlvlpQMX09/hzLnOuM9y1OzYqKS9RmOdbZOvi1BaIJWUkG?=
 =?iso-8859-1?Q?UbZDdfQJp3CurzXOtSE9VDPiWREBGasxn8KY8TyFLQRf2SHg3l5g9q390d?=
 =?iso-8859-1?Q?cYBM/43oJbRIAB8iZBLNUzhFLP6OJ3lGff2ZbfloqRFCOZ2N3c4t3odKsR?=
 =?iso-8859-1?Q?PonyyaztMD+EFU+OUptweRcnYd5eK/Dx6HcWvjJClg4C2+rVIwXw0FcxFG?=
 =?iso-8859-1?Q?bf58zD88sPVBCpNczc8t3+/dv1isZOVR9Dv4GpFSZsHSFIWRACXZx4LuMw?=
 =?iso-8859-1?Q?xBnOTLGs7zQqFdTreHaFqX95qUfpa55ZmNvFds2uscsfGvP8QQDPfQtI5k?=
 =?iso-8859-1?Q?DE5Z0PpnrikUhu2Q/N9URQIUbVobPf99swx5zNUcL/v9xPu103w9uBQYq8?=
 =?iso-8859-1?Q?JXfrl3Ts1mJOuXtB0y2xXzgxQ8XoJm624l5b3fTxZDHuwHMGhbdQPtLTCo?=
 =?iso-8859-1?Q?wWKil9WuKk58rtNSusvo66xOB0kBmt6sokUqpfsE8wIWWwjMy1xXJjFjeh?=
 =?iso-8859-1?Q?foov6BJHNItyINHZQ38qPWxyPZkZHCJOtCQcG/RhhHXIi6HCWFOr7J9p0a?=
 =?iso-8859-1?Q?8uvKq9QAgJc+j+rrXKcnxEOAqUiEswHKtpLGXCieyjmWIFG6WNprEJvQ+3?=
 =?iso-8859-1?Q?zU7U4T27PEJ5+ChOECXHdBg+xX+bloO+DxcCi4V6wCT9CrWHT7dtzGr83m?=
 =?iso-8859-1?Q?gUgmubC9J2bj5IN+cOSJl8nm36WVSp3zYmChZpFr+TgjnYx8dWDLDUT+Kd?=
 =?iso-8859-1?Q?1xSOLQNczXwo5YpHZCHVNX8Ac0Ca0iMyIdriwDmwlQupIjDVsAdBiHOA4y?=
 =?iso-8859-1?Q?Z+D0SfxLUrGP8DmpZWGNHTDIDx0t9TVJ9ZzOEdhaSb/6Txlawh2b30Jllg?=
 =?iso-8859-1?Q?0GN8peU0xfeppT0fneMyF8cOpUF6tjjxxnPJ5VidShG6soanqKA1oaUzNM?=
 =?iso-8859-1?Q?pGCj3+QUPWiXg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09cf8190-7283-40f4-5b33-08dbcef9f2bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2023 10:15:11.7108 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vq00Cb67M4kJ5UrHyK/DB/TMTqofUIAjMSXzfBPVWddiyouwIISE4t0Y+91M6RCV1AHSx6y1fb6PvafVOuolDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6980
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 dl-linux-imx <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, October 17, 2023 2:15 AM, Heiko St=FCbner <heiko@sntech.de> wro=
te:
> Hi,

Hi,

>
> Am Montag, 17. Juli 2023, 08:18:27 CEST schrieb Liu Ying:
> > To get better accuration, use pixel clock rate to calculate lbcc instea=
d of
> > lane_mbps since the pixel clock rate is in KHz while lane_mbps is in MH=
z.
> > Without this, distorted image can be seen on a HDMI monitor connected
> with
> > i.MX93 11x11 EVK through ADV7535 DSI to HDMI bridge in 1920x1080p@60
> video
> > mode.
> >
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
>
> looks like I'm late to the party, but this change breaks the display outp=
ut
> my px30 minievb with the xinpeng xpp055c272 dsi display [0].

Hmm, I asked for a test, but anyway sorry for the breakage.

The panel driver sets MIPI_DSI_MODE_VIDEO_BURST.
And, it seems that rockchip dsi driver [1] only supports the burst mode,
because it takes 1/0.8 =3D 1.25 faster lane_mbps than "bandwidth of RGB".

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c#n568

>
> Found this commit via git bisection and added a bit of debug output to
> compare the value differences for the old and new calculation:
>
> [   34.810722] dw_mipi_dsi_get_hcomponent_lbcc: old lbcc: 810 * 480 * 100=
0
> / 8
> [   34.810749] dw_mipi_dsi_get_hcomponent_lbcc: new lbcc: 810 * 64000 *
> 24 / (4 * 8)
> [   34.810756] dw_mipi_dsi_get_hcomponent_lbcc: old lbcc: 48600000, new
> lbcc: 38880000
> [   34.810762] dw_mipi_dsi_get_hcomponent_lbcc: old lbcc: 10 * 480 * 1000=
 /
> 8
> [   34.810767] dw_mipi_dsi_get_hcomponent_lbcc: new lbcc: 10 * 64000 * 24
> / (4 * 8)
> [   34.810773] dw_mipi_dsi_get_hcomponent_lbcc: old lbcc: 600000, new lbc=
c:
> 480000
> [   34.810778] dw_mipi_dsi_get_hcomponent_lbcc: old lbcc: 40 * 480 * 1000=
 /
> 8
> [   34.810783] dw_mipi_dsi_get_hcomponent_lbcc: new lbcc: 40 * 64000 * 24
> / (4 * 8)
> [   34.810789] dw_mipi_dsi_get_hcomponent_lbcc: old lbcc: 2400000, new
> lbcc: 1920000

Old lbcc / new lbcc is always 1.25.

The new lbcc is for non-burst modes(sync pulse/sync event), IIUC.
At least, it works for i.MX93 with the RM67191 panel and ADV7535 in
sync pulse mode.

>
> With the new lbcc I get a blank dsi panel and just going back to the old
> calculation of lbcc restores the image.
>
> I don't have that much in-depth knowledge about dsi stuff and the origina=
l
> panel times also "just" came from the vendor tree, but I really would lik=
e
> to keep that display working ;-) .
>
> Do you have any idea which way to go to fix this?

Can you please test the below patch for your case?

--------------------------------------------------------8<-----------------=
----------------------------------------------------
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -774,13 +774,19 @@ static u32 dw_mipi_dsi_get_hcomponent_lbcc(struct dw_=
mipi_dsi *dsi,
        u32 frac, lbcc, minimum_lbcc;
        int bpp;

-       bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
-       if (bpp < 0) {
-               dev_err(dsi->dev, "failed to get bpp\n");
-               return 0;
-       }
+       if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
+               /* lbcc based on lane_mbps */
+               lbcc =3D hcomponent * dsi->lane_mbps * MSEC_PER_SEC / 8;
+       } else {
+               /* lbcc based on pixel clock */
+               bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
+               if (bpp < 0) {
+                       dev_err(dsi->dev, "failed to get bpp\n");
+                       return 0;
+               }

-       lbcc =3D div_u64((u64)hcomponent * mode->clock * bpp, dsi->lanes * =
8);
+               lbcc =3D div_u64((u64)hcomponent * mode->clock * bpp, dsi->=
lanes * 8);
+       }

        frac =3D lbcc % mode->clock;
        lbcc =3D lbcc / mode->clock;
--------------------------------------------------------8<-----------------=
----------------------------------------------------

It kind of keeps the old lbcc for burst mode, except for the minimum lbcc c=
heck
I introduced.

It seems that meson supports non-burst modes only and stm supports both
non-burst modes and burst mode.  With the patch, I still worry about non-bu=
rst
modes for stm, assuming the minimum lbcc check is ok and everything works
for meson since I guess Neil has already tested the patch set on meson.

Should we go with the above patch?  If yes, I may send it out.

Regards,
Liu Ying

>
>
> Thanks
> Heiko
>
>
> [0]
> https://git.ker/
> nel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2F
> tree%2Farch%2Farm64%2Fboot%2Fdts%2Frockchip%2Fpx30-
> evb.dts%23n138&data=3D05%7C01%7Cvictor.liu%40nxp.com%7C8f712ad41720
> 4ba7411808dbce73ce63%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
> %7C638330769044424464%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj
> AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%
> 7C%7C&sdata=3DeffPCbPOk3GGuO8mR%2FSlcjFJfDUEZmq082simvjkux0%3D&r
> eserved=3D0
> https://git.ker/
> nel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2F
> tree%2Fdrivers%2Fgpu%2Fdrm%2Fpanel%2Fpanel-xinpeng-
> xpp055c272.c&data=3D05%7C01%7Cvictor.liu%40nxp.com%7C8f712ad417204b
> a7411808dbce73ce63%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7
> C638330769044424464%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C
> %7C&sdata=3DbAgcLnJpIEQaYZZUI1CnUsgP7rMiNV6wKKg%2Bl8%2FlN40%3D&r
> eserved=3D0
>
> > ---
> >  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > index c754d55f71d1..332388fd86da 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/component.h>
> >  #include <linux/debugfs.h>
> >  #include <linux/iopoll.h>
> > +#include <linux/math64.h>
> >  #include <linux/media-bus-format.h>
> >  #include <linux/module.h>
> >  #include <linux/of_device.h>
> > @@ -762,8 +763,15 @@ static u32
> dw_mipi_dsi_get_hcomponent_lbcc(struct dw_mipi_dsi *dsi,
> >                                        u32 hcomponent)
> >  {
> >     u32 frac, lbcc;
> > +   int bpp;
> >
> > -   lbcc =3D hcomponent * dsi->lane_mbps * MSEC_PER_SEC / 8;
> > +   bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > +   if (bpp < 0) {
> > +           dev_err(dsi->dev, "failed to get bpp\n");
> > +           return 0;
> > +   }
> > +
> > +   lbcc =3D div_u64((u64)hcomponent * mode->clock * bpp, dsi->lanes *
> 8);
>
>
>

