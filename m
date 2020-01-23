Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 304031479B0
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 09:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37296FF85;
	Fri, 24 Jan 2020 08:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20721.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::721])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1206FCBE
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 13:38:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQfMylvaJ2XKbzaLGS4DNVsCbC3GR2lVrPCgrRuudCkreQ3kflS5g5fHT4KAvGrDAqowBv5QtCRI8Kt3gWthCbhKSMDXIT7qjY/Ieh/44/8N7nLSvnki3M72lo7yLX5w419aRgXIurpRphYhqdc4R2izjNFWA7aeO5l6OcogH0n+MsgrK5WdSeEfDOZjs8jejduIXjUJZYqGf0MHpBS24zQ6LnhqrUhynlgEwJTMqZ8JYD+EXczBQ6O/9YFJR9b2l5SV1qN/5xOG2yqLzJSIk2nbm76J9NxjOSOYOH1CVd1amOJ7OXay+mkPlBI+pfxND7AL/peLnoHvVHmvXaryfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2s3tlYFhgdSiLQm4ik4h3D6zxaVWhtbGDckbK+wvSM0=;
 b=GIgi963HIeAK+17YLhQ5XtY4pKmms/NsesgwiKCqMih7l1CmOI+1SlY5DOmFHEwlq0GUXOF68oolT0gnhxGqFCS0abwybIDeMFWqZpY+/DzygLriryxNWZ7ryb+Hfg3pSp86SWNDK5AT8EkJqgx1ykuPu9dbGaIz5jDqk5ll9HCXoXBfWzY/RxyuW4OF6KlhYTaaf14jLVyWR9ywbTgIAmtLHeqHgWHPs1sxgsAZRRpD9KcqDYEd8D4Ki+cbJ3LUIF0NppUHOpVtSCLnDit8aygY0nIVZbm7mcrOOcqSxE1lgIB8nDy6YHo7AvjBZikNuK0OAnJhKfligQxtROyV5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2s3tlYFhgdSiLQm4ik4h3D6zxaVWhtbGDckbK+wvSM0=;
 b=HppJfty7vx/IHeoC9B/b1wIoL0oxts4nR7Oxnn3uUeiwmnOK3ZTONNPANfP20BUvgaAL3ggxh54faqym+6EyCVWIDxJ0A8sInkqeTvESgdOygpzWkguvRvNaNR6f4MsF+2c6gHasmdCKfBnd8adk+9bD085cEJAf9lS0kzmlhF4=
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com (10.170.238.24) by
 VI1PR05MB4720.eurprd05.prod.outlook.com (20.176.6.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.22; Thu, 23 Jan 2020 13:38:48 +0000
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::c14f:4592:515f:6e52]) by VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::c14f:4592:515f:6e52%7]) with mapi id 15.20.2644.027; Thu, 23 Jan 2020
 13:38:48 +0000
Received: from mail-qk1-f175.google.com (209.85.222.175) by
 MN2PR04CA0021.namprd04.prod.outlook.com (2603:10b6:208:d4::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20 via Frontend Transport; Thu, 23 Jan 2020 13:38:48 +0000
Received: by mail-qk1-f175.google.com with SMTP id x1so3351864qkl.12 for
 <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 05:38:48 -0800 (PST)
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Marcel Ziswiler <marcel@ziswiler.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: panel-simple: add bindings for logic
 technologies displays
Thread-Topic: [PATCH v4 2/3] dt-bindings: panel-simple: add bindings for logic
 technologies displays
Thread-Index: AQHV0fGSiCgG8q+p4k6l4T/A2wrxsg==
Date: Thu, 23 Jan 2020 13:38:48 +0000
Message-ID: <CAGgjyvGJr+Yvn6D8i6k7N=uTNq7uWAqyJQv-Bn+samMn_km2BA@mail.gmail.com>
References: <20200120080100.170294-1-marcel@ziswiler.com>
 <20200120080100.170294-2-marcel@ziswiler.com>
In-Reply-To: <20200120080100.170294-2-marcel@ziswiler.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:208:d4::34) To VI1PR05MB3279.eurprd05.prod.outlook.com
 (2603:10a6:802:1c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-gm-message-state: APjAAAXpmJSXduoKDVgbKWiB+bSyGKyi3F2n87MSoPIrsLmQD+FR0Mbk
 Kr5lwkyfovTCqzlnDbYFiKViSD+dv6h+C8UNjqg=
x-google-smtp-source: APXvYqwHdoIm2gkZNB9+mft6eWjNU94wAAqcKZh4qyseww49f2rOVJB/HGbiuT0g+joW6oQL6DibWmbKodut6OB/6BM=
x-received: by 2002:ac8:1851:: with SMTP id
 n17mr16327905qtk.305.1579786367031; Thu, 23 Jan 2020 05:32:47 -0800 (PST)
x-gmail-original-message-id: <CAGgjyvGJr+Yvn6D8i6k7N=uTNq7uWAqyJQv-Bn+samMn_km2BA@mail.gmail.com>
x-originating-ip: [209.85.222.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b4f1c89-d822-4bf8-01b0-08d7a0099378
x-ms-traffictypediagnostic: VI1PR05MB4720:
x-microsoft-antispam-prvs: <VI1PR05MB472067B43FA4EA082C29CA4CF90F0@VI1PR05MB4720.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-forefront-prvs: 029174C036
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(366004)(346002)(396003)(39840400004)(376002)(199004)(189003)(54906003)(9686003)(42186006)(966005)(316002)(5660300002)(66476007)(66556008)(81166006)(81156014)(66946007)(66446008)(6862004)(4326008)(478600001)(64756008)(8676002)(55446002)(186003)(8936002)(44832011)(86362001)(71200400001)(107886003)(52116002)(26005)(53546011)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR05MB4720;
 H:VI1PR05MB3279.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h4V0UXLwcp4akS5VBqvP3JhuGNi3ROpg5S8hTS+ELeE1Oa2CPifHPlB1rGbV4MXlN1r6cVDNB/FtEFz7QxFAEij/FNE/mnp+Zg10md96jH6EN3PQIFP/uS5YmXp+aRVqF7nnMwH/Pm6HMH5vKMA7rJ2tC0xAkQOPzsKVl9xsBF37FY3gstpCsmYuBCkTz5Nw0nal/wX4Zt+8W1FeRiStEOLNL9PwvkwG2DImspS7/6epQsLn1Vg6/iXd28bcAm+iEW5UC2Z7zFSc2cADDh10lhZUeKnZZ1MAGSHuXhCDdjQISwHe1d/7xJipNipiGv2wtg08xY5YfAVjXUFbdyuak9IDTy+z3gZTQ2aHaXvN/IlUt6OI5nytDvLIRiScJfWIMi3sNTVTo5BmPNheU02jI6mZkf6jMuiw6NB4oAiPvwyLTTEv79M5ebzqpTICJQqXWwBKczVvayO+xwqDW5MqATM4a8/pgWtZ0vm8CjMWsDY=
x-ms-exchange-transport-forked: True
Content-ID: <A946DB4202CCB8418672E07C747BB701@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b4f1c89-d822-4bf8-01b0-08d7a0099378
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2020 13:38:48.7188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5smub5EFmvvTnhrBHCjkG9JtHlh7gvQ/zZxBIGOoRc6fmWHVoOoKbyLZGb3IF1ueV3/ED3NolF3GQgwqVFBCs8u7B/TNdfFm0ZDUGt1+KRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4720
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "j.bauer@endrich.com" <j.bauer@endrich.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, "info@logictechno.com" <info@logictechno.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 20, 2020 at 10:02 AM Marcel Ziswiler <marcel@ziswiler.com> wrote:
>
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>
> Add bindings for the following 3 to be added display panels manufactured
> by Logic Technologies Limited:
>
> - LT161010-2NHC e.g. as found in the Toradex Capacitive Touch Display
> 7" Parallel [1]
> - LT161010-2NHR e.g. as found in the Toradex Resistive Touch Display 7"
> Parallel [2]
> - LT170410-2WHC e.g. as found in the Toradex Capacitive Touch Display
> 10.1" LVDS [3]
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
Reviewed-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
>
> ---
>
> Changes in v4:
> - Re-ordered commits as suggested by Sam and re-worded commit message.
>
> Changes in v3:
> - Add it to recently introduced panel-simple.yaml instead as suggested
>   by Sam.
>
> Changes in v2:
> - New patch adding display panel bindings as well as suggested by Rob.
>
>  .../devicetree/bindings/display/panel/panel-simple.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 4a8064e31793..f33c5d979f96 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -41,6 +41,12 @@ properties:
>        - frida,frd350h54004
>          # GiantPlus GPM940B0 3.0" QVGA TFT LCD panel
>        - giantplus,gpm940b0
> +        # Logic Technologies LT161010-2NHC 7" WVGA TFT Cap Touch Module
> +      - logictechno,lt161010-2nhc
> +        # Logic Technologies LT161010-2NHR 7" WVGA TFT Resistive Touch Module
> +      - logictechno,lt161010-2nhr
> +        # Logic Technologies LT170410-2WHC 10.1" 1280x800 IPS TFT Cap Touch Mod.
> +      - logictechno,lt170410-2whc
>          # Satoz SAT050AT40H12R2 5.0" WVGA TFT LCD panel
>        - satoz,sat050at40h12r2
>          # Sharp LS020B1DD01D 2.0" HQVGA TFT LCD panel
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
