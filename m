Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 850951292B5
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:11:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE6C6E1B9;
	Mon, 23 Dec 2019 08:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400100.outbound.protection.outlook.com [40.107.140.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316BD89E2B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:40:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVnG+ookIgNfDGVqB622mj5G8gAR0Exacq8zkNtBS+XFFQPA/1Gz7QjAPujM17Oke0roYWLpyPSHuvyi84neLL/HWOH1M/t1DsuJuirjmQOvYUqCkJ4qv47mE89uLMoEyHsGAqLwwe05M4LTcJ5Fn8EQVAEJniNgw3fDZXxwNp2fUBZ+99B/AQBGcRhsEoKdoaQB9+04alYXnHSLF/eEPmCAgnjs4igZcoU9qogmr9Bx0phNMJbWMvqlXQaJjj1zjPhEcePqXAHZbIwA/Vo2IjDRiUIErRIXZUGwtEh8Zzebrw5ZEZGlK8ieeLZCPzcw0iD5T6+GXpi7Vkv43L5z5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SQoodr3lYou437+muwBIQctWwsA6LyjO23aI82REP0=;
 b=Xi+c9LDCrRCwFnjP2fMlawmdLv78wad3Bv08DciJPXhz+AWvuYo7zLYFocpVCtvlOWv3erueuzC0/JDrzCmMCfm3xE4ihHM1McL8LANXV/c4Zh4U/IjQjKBAc+wdrrt2UDCeHCFqZ24AsZv9VH0OwmyvSv2DXI7VCF6lxQP3/4BSkm8VOqTXbrDxREy+wfm/iWdHd8qDzM2mmCT+uIfZ0oJunWhcP+zPB4sV4KtELg2so3Ne9IkO6LFKKc3/uX6OwlikLuZe1nr0uWDlBo9EMK32vowFiyEV4K8zbYpOCpuFOwueJlRa1m2IczQFSTJ+5wFjYfDjGkzW4x6pndpijw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SQoodr3lYou437+muwBIQctWwsA6LyjO23aI82REP0=;
 b=lSo5l0ZtktCXFyALH8YJ8H2fSmlgJ+t6Fph/SRna5I6qnmCTaxDVp21ig8p7oqp0CjpAiPDVSsZmbT+PoE+OH51YbDclhk+nCss6q1F+CWC1hmuEudQXbxoCA7Ru6PxeEv6tGxbl0U+H8HvwccGs2L+EltsbPX0OQK05SF2AtY0=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1610.jpnprd01.prod.outlook.com (52.133.162.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16; Thu, 19 Dec 2019 10:40:18 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2559.015; Thu, 19 Dec 2019
 10:40:18 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm: of: Fix linking when CONFIG_OF is not set
Thread-Topic: [PATCH] drm: of: Fix linking when CONFIG_OF is not set
Thread-Index: AQHVtlhNm+TehEeGeEe4UIivY369eKfBRFHg
Date: Thu, 19 Dec 2019 10:40:17 +0000
Message-ID: <TY1PR01MB17700AEB5772F373FAD8255EC0520@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <20191219103703.8547-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20191219103703.8547-1-laurent.pinchart+renesas@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 02bb2d7f-9c53-4724-9d5d-08d7846fd714
x-ms-traffictypediagnostic: TY1PR01MB1610:|TY1PR01MB1610:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB16109A4DC611EAE547A35821C0520@TY1PR01MB1610.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0256C18696
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(189003)(199004)(76116006)(66476007)(2906002)(186003)(33656002)(86362001)(9686003)(478600001)(110136005)(66946007)(53546011)(107886003)(44832011)(81156014)(6506007)(55016002)(81166006)(54906003)(66446008)(71200400001)(64756008)(66556008)(52536014)(5660300002)(4326008)(26005)(316002)(8936002)(8676002)(7696005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1610;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: luJ8oMEzB2RK64dMiWLXe5K2iI8vII0I8sW4JgjMT+9Ug/vGHsjntyLaqxRkd3bj8GMsZtOHURObcQGsq85fp/N+9INja0LHmGNdervXGQw1t+cZfpL3H721NrXJzP+1VkfZEQ8RRlKuMKRmht0uaPHveGBfoJHjjyyW7ZxMj7dcITITvwI9mqAt2QqMhJtulEzCmm7qlvn5WKe50EkOZcR5OoRNYGiUhhEItkFNFs+XYE8NaTzwVhX03OF7hytyB2ni+L7pEvkIK/kPIrh3h94bhK81DNMWRBaEfW6lckNfEyXEqNWDm08vtuvBLsr/gc3eTGmdkcKCgK1/gWARy0fo5gx8t0zCfWYBxpNjjmcl/WtkH1Jogx260+KsLCt99AH3qPPTAJAGUmjXdHTYHEnFwmuktM3R9tsuQgp/47DKQrBo9TC/7hvmwRAma25x
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02bb2d7f-9c53-4724-9d5d-08d7846fd714
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2019 10:40:17.9554 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YgxMPufwXsx33+Jwl3IQXLK3YeDsxCaAYZcsokZvZyVesqN21RabHCD/UOebDgEWbDvJ2qsxuzPIFG6Pjn/rDs1UrA651dr7d/HjM5vjG3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1610
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Sent: 19 December 2019 10:37
> To: dri-devel@lists.freedesktop.org
> Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>; Daniel Vetter <daniel@ffwll.ch>; Dave Airlie <airlied@gmail.com>
> Subject: [PATCH] drm: of: Fix linking when CONFIG_OF is not set
> 
> The new helper drm_of_lvds_get_dual_link_pixel_order() introduced in
> commit 6529007522de has a fallback stub when CONFIG_OF is not set, but
> the stub is declared in drm_of.h without a static inline. This causes
> multiple definitions of the function to be linked when the CONFIG_OF
> option isn't set. Fix it by making the stub static inline.
> 
> Fixes: 6529007522de ("drm: of: Add drm_of_lvds_get_dual_link_pixel_order")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thank you for fixing this, I came to the same conclusion, therefore

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
> This fixes a link error in drm-next. Daniel, Dave, would you like to
> apply the patch directly ?
> 
>  include/drm/drm_of.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
> index 8ec7ca6d2369..b9b093add92e 100644
> --- a/include/drm/drm_of.h
> +++ b/include/drm/drm_of.h
> @@ -92,8 +92,9 @@ static inline int drm_of_find_panel_or_bridge(const struct device_node *np,
>  	return -EINVAL;
>  }
> 
> -int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
> -					  const struct device_node *port2)
> +static inline int
> +drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
> +				      const struct device_node *port2)
>  {
>  	return -EINVAL;
>  }
> --
> Regards,
> 
> Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
