Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F5B4B5752
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 17:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D9B10E13F;
	Mon, 14 Feb 2022 16:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00068.outbound.protection.outlook.com [40.107.0.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A369510E13F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 16:44:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJoqRhXm8RIaXNqn+2qfqDC3+TtrBcNKFzNfWotVJJ9vXQ0d7DnewUg69Ntu6Aql+dHHnHVpbUrm0bt2rezYyStTtmAcYSrRA3wahahy/Mi1yObvOJDV3/FfL3hdpXj3e626ashaxtRr7aLzgkQd+E5TNj5uGV57fqZkKkqv08UZTrVPZDnlL+l6uNASs06Vv+WyyUTvOh2CIdE2bFPm0gUUXaLfDZhku3P5GUStI32qVxSDwchAQnDwSlMKJ/zseK0A32TUn8CgHBDiU80bbbaEarAfVopgGTbsCtEUdnoTAHBaX/SrdaJ/3gAASr5tXH/wB3GQJf3mz27Wodn+Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNf9DETFwiLkEBnBdUOl8okKQ6rpnhdqGTSDecD6KCE=;
 b=gl1hHbviRZqVNHzVtVpM+fzilGOuChXM7GunOz/oqLT4AqlEmVXWQTKyi1LHTlxkzKZ8ZXHfPesLTs69qVOofao6oQQRGt/tUOye8zsldzntJWAVzkQWvuGdGITew9EBIiCwOJhUuic3X1QSHRIVfyLfgCBWbG9IKmZihjZuufydeiOtLiIE64FS/VJgKYEJg/djr3Fk8VGfqNZ1Wh3RBK5RVK0RTy+tIaW3B6U3tKTpexIUySgnj/IZVYBzR79Vq5Hq7CU+MR0Ye8SaEsdkw9jpqIspEe3c85tHFbjY5vx9jA+b/ErFa/chMkEyXe5MCkz3X4Ruv8qs23Yr9yoGmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNf9DETFwiLkEBnBdUOl8okKQ6rpnhdqGTSDecD6KCE=;
 b=kv72XWiTFK2+kLwN7vqI9kpb9vPONsA+7AUvGgjmudPnliPdw4KY5oBT/YG8PRRNVTKhHkZX5q+Ge7e6eEV/HBrQmCOp3G4WHVgY46BEdCyQMZGsH/Fht1MZJc8do8yZte90OcZjMj3Bwjb8uDaxWqKJUdEDGN10rhYtMplVtKo=
Received: from PAXPR10MB5405.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:28b::9)
 by VI1PR10MB2717.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:e6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Mon, 14 Feb
 2022 16:44:47 +0000
Received: from PAXPR10MB5405.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::50e2:8a6f:71d9:e26f]) by PAXPR10MB5405.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::50e2:8a6f:71d9:e26f%4]) with mapi id 15.20.4951.019; Mon, 14 Feb 2022
 16:44:47 +0000
From: "Jonas Mark (BT-FIR/ENG1-Grb)" <Mark.Jonas@de.bosch.com>
To: "Jonas Mark (BT-FIR/ENG1-Grb)" <mark.jonas@de.bosch.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: AW: [PATCH] gpu: ipu-v3: Fix dev_dbg frequency output
Thread-Topic: [PATCH] gpu: ipu-v3: Fix dev_dbg frequency output
Thread-Index: AQHYHDV1Q6HWKEJY1UC+dT9O++/HWqyTSuDw
Date: Mon, 14 Feb 2022 16:44:46 +0000
Message-ID: <PAXPR10MB540528C7049118472B4F190EAD339@PAXPR10MB5405.EURPRD10.PROD.OUTLOOK.COM>
References: <20220207151411.5009-1-mark.jonas@de.bosch.com>
In-Reply-To: <20220207151411.5009-1-mark.jonas@de.bosch.com>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.bosch.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98a5f109-b371-4d7e-27c7-08d9efd94f83
x-ms-traffictypediagnostic: VI1PR10MB2717:EE_
x-ld-processed: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4,ExtAddr
x-microsoft-antispam-prvs: <VI1PR10MB2717D728F857C49284C08F95AD339@VI1PR10MB2717.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:289;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a362dPk3w5wLkHtugbcXfU/r749RE3KXQvA1VoNdqU+UMy5Iyeo5QpfX8ekFU+vEWUiGrxr2Nxv6RDXTw8amYwFN7u/XXw9bXPLl3+jNcN0s2qvuc+5QLvRF7GGxOiGntxWRkrO8qNRFDksKAr803dI7CX2HDr0EvEbQCEhBd/v1M43YSa0YW161vhQDcvBXbhoWnFXdEojGvWGgTDR6pV1pUhnNbh2eOV/j2NBfnoAaDYravcRiTlmA7ISXmbG+sQiArw+9jD6LJzNfOzpHnDzY9tgRhXH2sEahYv0F6zYYEvvuglSIkK/UXrlyKzlTGVXhK/yn+7QBzWtAXTODKIUUOh4lEWqYcjG8Kj9p5f7rNAkLyAU4fohFyEaoNnx0BD6qa1uyYYcNcGIqVlPIjOm0WLUpiRyq5ejtbpM671m5Hbs121DB1X4UMEyxRWTWZNFeTtzknxs21J+bUmNvRoYw8JjqjrK6eHsy8Dg5Wzy0QY4iCX6KnLGTlAqSwe1XnKv1BhQODvKOMqCQQnES0/Gtd7tQ57rlG2LeJpckFTX/jah/xMECIiZ3m5g0OOJCyTUAelQ3uLx3NrGQIyboG0qqYYd9P0sz8D0y/ppHhX6IPx3w96Eurux0ok9RbYKr1a65g4YhAdpl0FOvukYzUIYXBBokeoLA14LT2LbvBabahB6hl1cGWvVEOYD4VENOZdBiRQl8PFbsd1UzsXn9IwxMRwGf+7T8dAkcSaScn/GuTAfmzYqTQj8RLoUQCUh8HkRq5Hyx+wU64LQgDar+MgC0aiA1pdxMI+mIfuZ8zAw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR10MB5405.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(66476007)(55016003)(83380400001)(66946007)(76116006)(66556008)(66446008)(82960400001)(64756008)(508600001)(38100700002)(316002)(54906003)(122000001)(110136005)(4326008)(8676002)(2906002)(52536014)(9686003)(33656002)(26005)(186003)(107886003)(5660300002)(71200400001)(15974865002)(38070700005)(8936002)(7696005)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?axa/gkCo0f9Uha8yybK9Wvb/2E/Pi0OtKlNFNvbWMcmmUh3IQmX0r1SDJ8?=
 =?iso-8859-1?Q?blpy3ws6gtVJMKTKxa8Il5dPoMxcZBazXdkA+5noFq1KhT/QyFVCod9exy?=
 =?iso-8859-1?Q?e1OmU2V+eBZ+NrFDwyq6ul7psU8n4lgmMMaAlcc7qPZTN8m3g9pherib/v?=
 =?iso-8859-1?Q?jPWWK+Nf2tYgFzbHQdhRjtsEQdOIbY8+UySsD/JuqVOPkpz7KUaBxPkmQl?=
 =?iso-8859-1?Q?YaYcEuos0imHWL+v3sHkP7AAGRcMS28FcAFj0RM2BhoCiN3kheN1e/46QE?=
 =?iso-8859-1?Q?oamebqJxyF/n1bEdAjehEDr41cxRpeBSjsGm2x4ifubQOuWSGGhYpHgKz1?=
 =?iso-8859-1?Q?hpCiX2x4rLjjKDMWjnZX6nuxojKSwvH2KfLGD6KTTJin5UlGva9+o/w/TQ?=
 =?iso-8859-1?Q?Nep93PZmmkb9YqPwZcClhzCsBHq1PZCQVAqdW4FltvRTng/jT5NaI8KwW5?=
 =?iso-8859-1?Q?BCONHE1nwcAwn5BUVOH2fcxo+01CDpuspL7//oEOUEitfXESrVJB2TZHxL?=
 =?iso-8859-1?Q?VnNoM/L4aPvrRQxBym457QMyX/gTt6Bs8M+a7dHj+Zdg0MptO4NhI64Mtf?=
 =?iso-8859-1?Q?zOipX4CtHA1CQUWyMrKEmrkIZKcMIDpNMIqKxP9j1taV7/9lnHFgPNRm9A?=
 =?iso-8859-1?Q?rjcZPvFSkKTvsz1ZX251tTawsv24qeLkWGAWzbDK3QyHOva9vIOr5rZP9s?=
 =?iso-8859-1?Q?8lMbuPh1mMGu3druYhytZRnPAz4msDpNjB67tmn3yk6MYSGRZwH57ib+Jl?=
 =?iso-8859-1?Q?G/M3zR3Lp7u4BKaLSTp2hRc8VTpA8viJ+prxaXvV5pbTdjg9/YwGpsKIlC?=
 =?iso-8859-1?Q?5Ayh30LiRtPjbQx+VbkW2APDLF017cIaVOjCS+FbQZfI3M92xCHNVFST1M?=
 =?iso-8859-1?Q?GZIgbtJMTmUxQxiEIsp06796xLl2LgEz4gCigkgdP7NNG33dFp9HRul6X+?=
 =?iso-8859-1?Q?rjQXTmTZtns8x9EQ1N2Cwi5XGH65TQRZpg9E9VecAAHYhld4eHA0Yhwl9W?=
 =?iso-8859-1?Q?r2/22WN2aOzA1a3GTEATK/A1kchAc09lExmzIFEMUKEAgzCUiUstZK+XZO?=
 =?iso-8859-1?Q?OBUPCss1oZQHjKR6Tfjw6r/kU4XUqkzp1vJ8qc0AJHakqBndPLEVNVJsFi?=
 =?iso-8859-1?Q?H9hClSagZ4KUmi8+AHfm45fBeF/1dYdf9Bsej4wMSAIAEkd9LXJhmuHspI?=
 =?iso-8859-1?Q?jDZaleYs8OW/TBKa8bXcQz9hnojYXXFskD2Q2wno+vdBvs62ohRhjnE+tC?=
 =?iso-8859-1?Q?hDBM6O+166f2APUaQ/pUaI4ok6u8DNF6qMhxO0xZdbFf2OqWnnh5m74I7j?=
 =?iso-8859-1?Q?PJUablcws4cGbCjqkizuUWuKRptl/Y6r4Uv9fzTQXycD/At5Myg1zWfEIb?=
 =?iso-8859-1?Q?X5rJj+nYLo5Fwu64Iso8nJGkeSz0FpETFBLs8wbxPIAUgRoixxIYpdD5uS?=
 =?iso-8859-1?Q?x8f1roQ2/sRwIZjjAUUVqfOvBThnmJdOS8DK4tdOr17kNCjZ4aU64aYc5C?=
 =?iso-8859-1?Q?9wVwuX4+dCMxWck/dfEdWbT2qSiQ8AXzQ5GTJAjQx0yBF4druT39ZRfRtU?=
 =?iso-8859-1?Q?e+G02/GbkcKyrLazEBvoU1iExHS9mKcP6Xk11OWo24uvkk3fg4lMav+uQJ?=
 =?iso-8859-1?Q?97bQGZ9/F8v6V8yoFmcxIVsbp7UFiwsdiGCrlhz8IA3HhjFx+nHnCGzw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5405.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a5f109-b371-4d7e-27c7-08d9efd94f83
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 16:44:46.9635 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0BqnocVPG+SSx1AULCTZqJVe/Ol9cW1QXVXmFd6gJxaFXxkaMl+VSoWSc702Fwnxk688HtJ95J6oqOw9sEM7Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2717
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
Cc: "RUAN Tingquan \(BT-FIR/ENG1-Zhu\)" <Tingquan.Ruan@cn.bosch.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> From: Leo Ruan <tingquan.ruan@cn.bosch.com>
>=20
> This commit corrects the printing of the IPU clock error percentage if it=
 is
> between -0.1% to -0.9%. For example, if the pixel clock requested is 27.2
> MHz but only 27.0 MHz can be achieved the deviation is -0.8%.
> But the fixed point math had a flaw and calculated error of 0.2%.
>=20
> Before:
>   Clocks: IPU 270000000Hz DI 24716667Hz Needed 27200000Hz
>   IPU clock can give 27000000 with divider 10, error 0.2%
>   Want 27200000Hz IPU 270000000Hz DI 24716667Hz using IPU,
> 27000000Hz
>=20
> After:
>   Clocks: IPU 270000000Hz DI 24716667Hz Needed 27200000Hz
>   IPU clock can give 27000000 with divider 10, error -0.8%
>   Want 27200000Hz IPU 270000000Hz DI 24716667Hz using IPU,
> 27000000Hz
>=20
> Signed-off-by: Leo Ruan <tingquan.ruan@cn.bosch.com>
> Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> ---
>  drivers/gpu/ipu-v3/ipu-di.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/ipu-v3/ipu-di.c b/drivers/gpu/ipu-v3/ipu-di.c in=
dex
> b4a31d506fcc..74eca68891ad 100644
> --- a/drivers/gpu/ipu-v3/ipu-di.c
> +++ b/drivers/gpu/ipu-v3/ipu-di.c
> @@ -451,8 +451,9 @@ static void ipu_di_config_clock(struct ipu_di *di,
>=20
>  		error =3D rate / (sig->mode.pixelclock / 1000);
>=20
> -		dev_dbg(di->ipu->dev, "  IPU clock can give %lu with divider
> %u, error %d.%u%%\n",
> -			rate, div, (signed)(error - 1000) / 10, error % 10);
> +		dev_dbg(di->ipu->dev, "  IPU clock can give %lu with divider
> %u, error %c%d.%d%%\n",
> +			rate, div, error < 1000 ? '-' : '+',
> +			abs(error - 1000) / 10, abs(error - 1000) % 10);
>=20
>  		/* Allow a 1% error */
>  		if (error < 1010 && error >=3D 990) {

Is there anything I can do to help getting this patch mainline?

Cheers,
Mark

Mark Jonas=20

Building Technologies, Panel Software Fire (BT-FIR/ENG1-Grb)
Bosch Sicherheitssysteme GmbH | Postfach 11 11 | 85626 Grasbrunn | GERMANY =
| www.boschsecurity.com

Sitz: Stuttgart, Registergericht: Amtsgericht Stuttgart HRB 23118
Aufsichtsratsvorsitzender: Christian Fischer; Gesch=E4ftsf=FChrung: Thomas =
Quante, Peter L=F6ffler, Henrik Siegle
