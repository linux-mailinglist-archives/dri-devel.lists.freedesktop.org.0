Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12769761D0C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 17:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0FD10E12C;
	Tue, 25 Jul 2023 15:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8127C10E0EC;
 Tue, 25 Jul 2023 15:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690298012; x=1721834012;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z2XviKBV4aQQsFqwY837GN78bZoWSy84MWEMTM5dL7E=;
 b=jz7qdBSK8H5FxKbFlv6yFUgWDdxWHtOjsUYzDF9Ax181K4zNIZ/kRmjn
 Y48kKVDSOn+nUU5ErRWnod1TIqmaoiXubFa5gCHIBtABYMoO9Ly91PDl0
 76cVTWo9fQJYN9L9wljkKrTLYGPQZdODxc7oRfFF3NL74hbht3ulS45nO
 THfoD78KpSQlR5jrodoG/YOhvax2aY84CQHYtpaokP9k9xZ2HJbEyFcgQ
 K9sZUDu7/EE7qz6hXvPJQdXttf3DFWwm7BWpRIcXEDYNBP4fI+O5RsW2g
 ZetGTV+4X2PXzhIhMeIKnTBkwfd7OJ0yUa6zS79R2png06hjow46OTUwN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="365219116"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="365219116"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 08:13:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="869508968"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 25 Jul 2023 08:13:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 08:13:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 08:13:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 08:13:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Opv4JowAAGwVD/3XjjbQDhnvDi5PFobXr5Q7Q2xWhlz7nCi2jDgS64R6W4jPdJgUd106g9WSS/dmHvqnnLGWMO57wwo4+1tO27BDaHA/h/nqbivsTsIk1tCg/FUlWndHC2421Qf/xbKPhnm1Tc6aca3K7OZhFSsfrW0FCUFDqRFH8ST/eZXeFEXw6uWHaQfZEubEj7dJMBlZfDnQRKAksFlpQjFajrQGIIdzd7E8IIPmaAgl3zRcUuCP0Gu+yg22w/evN06WevoH41cOMqty6+jcXkOHGjGqHDoXODlykrlij/gb1pVHrbNkqGld7wRpLFHB376yRhZ5A+FupmUVEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSWME0qBjzWfVPLe68tpHhVzzNznnAAvq7Z22XhdmuM=;
 b=Hn4uOaCS740gg2Y12AlqPtGWYdMPupX2Nva3mYBh9rRag//ujy/y874IOL/K/CbzF9dsgmp/RhKxbl5lP9WSECh8eXoYkwJ0KYH/2BUMDWgby/mG77M/fMZin7n+UsalugXfXcIANFd6trnK/oPyCNpwEfCVNqZB4qXhB9Pwaesx00Fqt6IWwZhJm3JQmuRK6tcds93chYAISs73Yf+b1vqzlWI/ytsqkRkvvHnXSu/Msb8wznS0SVZwIpbS9HqQJSx6qmS0tqlbKiAiaVsFRDQCP8bdUydhw14sARZFEqhKVmmAtwEEtmdlmbBy/iyfmpl/JBrpVH3swW6REUDcYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB7577.namprd11.prod.outlook.com (2603:10b6:8:142::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 15:13:17 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::e273:56c0:2fca:f739]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::e273:56c0:2fca:f739%7]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 15:13:17 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v7 3/3] fault-inject: Include linux/types.h by default.
Thread-Topic: [PATCH v7 3/3] fault-inject: Include linux/types.h by default.
Thread-Index: AQHZvwlisFhyfDWBfEyJmJA5NPR4mq/Klt9w
Date: Tue, 25 Jul 2023 15:13:17 +0000
Message-ID: <MW4PR11MB705648E086BDA877200141FAB303A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230725150951.3757483-1-himal.prasad.ghimiray@intel.com>
 <20230725150951.3757483-4-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230725150951.3757483-4-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|DS0PR11MB7577:EE_
x-ms-office365-filtering-correlation-id: 46db0262-6a54-40dc-123c-08db8d21ace2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dpHtIVILsf0py/AacJwdRKDpnxTR4KJyYXdcrTFJEXztcIfW1DIwEruWIewugZIVEV5oZAJk4mFbvt2BkXlFoR/yL25fLkpT35B020nNwZpLryxxeWV5SyiMe5RISZmvIE0GFdMU+kb4D7miIqZsUG0/VX8UhMrVh7vvajPcC1oB0nrhG7DfXAPS+XHPI3WMtoZyLfe7SGvIPQv8G733SGzovrYk+SdiZkYu8lVSLrRKNHjSAdExyXg+QyvHtsVjHcom5sCQVbgCDnn3Yje+YhGqEFs/57eNaPbXYjbEupj33uhgruA3rkyVpXO1XeOwquCSqaNZjie2SQ3xlmKJbERLZZ3bYrx2x/Xv2A6J9BWxG3sbOHttVGARqtgZFXioZfw2q9ZQeYm7uvDbCxdPE2YF6h1NCH9oZL0suMe2A7DNp04rwpeXVOV/s33IhQhXqsrCZfHGSBGprTTBkkj5inWx/jtNPXU69mC9SmmvGZqsFWfjaLgC1v4aJLRNeIcJnBCDhhSjth5Sn8auFOmt0D4wAdFYmUEN3bCyQ49GNALA/yg/eKb+oSoHiPY4MBrqoM996z5U3OxThb9iP0t9ZiEhoZwDWUUzekTFzl8j4IWycbTNm2S87Y6vOFjVfXj7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(136003)(346002)(396003)(376002)(451199021)(52536014)(8676002)(8936002)(5660300002)(41300700001)(316002)(2906002)(4326008)(66446008)(64756008)(450100002)(54906003)(76116006)(66556008)(66476007)(66946007)(7696005)(9686003)(26005)(71200400001)(53546011)(107886003)(186003)(478600001)(110136005)(6506007)(82960400001)(86362001)(55016003)(83380400001)(38100700002)(38070700005)(33656002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4hqrptey+Q2dKevhjV4Mcx2jye72/w93P26MASLPL2Rs+jJwf1l0CapESyMf?=
 =?us-ascii?Q?HI/nAHvGVM8rgeiSKnpryQqg52T6DpP2v4vyHU8At+MmtsWRSudCE8W4YNRK?=
 =?us-ascii?Q?Gk6vKnCJOxTpdzHxxNOGx869GJRFC1v+adCgHzYeifwQurxUEgrc0WlUa587?=
 =?us-ascii?Q?hp3SX8g/aNJzuAANOhcnkwKimkNphjHcmBki5JvlDzNdrlEGbtoYqukPdlMd?=
 =?us-ascii?Q?igUVIdif1NsopHNGamVrfEWCnR/PGMQOfXNv9aRIRe/5l+OSpUm/+tM7OAUK?=
 =?us-ascii?Q?Ed2EJyfZId+eKpjkCLV/7TMIgv/hMkfoWU/icJh5dSWvsYii7LMuNz80e9Q7?=
 =?us-ascii?Q?Tv/E8XEQTaFkuWyvvaXSRVfYjcAWsBysVzaGbQymx+YtpkcuwOsxmjtVKzoQ?=
 =?us-ascii?Q?ebw65M0MmDysBegYHcfbR2J1rBz0xJdhMHRKNqZHievqynoV/VSXH4qtSp03?=
 =?us-ascii?Q?WnshHH3SGkV2eAxV5ySu4wvtlyh5nwV8S9o97KGzZJbL1jAnCFlvUkbHMxlR?=
 =?us-ascii?Q?ety1cOZyEVLKrgq9umZlSRozaorx2C65xFXyJ/1//OWIP6hclIuGCgMS/HGx?=
 =?us-ascii?Q?U++ABvXr26dOMk6M57Y/8pB2ym81ElgMdSQDltcuPvphKLNcg3MPNz3s2Ulz?=
 =?us-ascii?Q?57Xoju+or6HGBWsr6g1Tf/P0Ze/DpsF0znpkX8cAo3pufUXa9XnTaXwTbgzP?=
 =?us-ascii?Q?C3NFsms5PrpATahRtb87/ni4ZTua9EgxNjQNQWRwFTWl3nKRQfWzi3PgwB/K?=
 =?us-ascii?Q?ytYmS+e2n94PknLwp+Glf8b11Tbw+MnYS+xiZXtMVE8Pm6EN/+EP4dktZjoR?=
 =?us-ascii?Q?SHrlg7cPHUkSKlsejM+o2IqMbTEYpnCdRsQAjWsDJaSsoJWqEg8fx4Bvvc9b?=
 =?us-ascii?Q?luooXBdA9fqVu6E598IG5eVzCh3xjihKml/6+GagFFrcq8LQ1vzqmZaxi7qW?=
 =?us-ascii?Q?lv7MbxWap6dFaeKt87I16GOIgJB0exRA7UT0e9muQ46Pzf8ukgl08kCtp+71?=
 =?us-ascii?Q?fzTm5bFthyUwJooYCdAIwYo4dq5hFbYZqOIJBriKTaXAZ5HQclLSIQNmNpsl?=
 =?us-ascii?Q?LTTq38Ehzms59bE2oD38/t9JK4CqN/qoexYig4a0KwB26K9+MM67yDGTANgs?=
 =?us-ascii?Q?sjfOdh6GjOKEkKDX/MzaaXH9G6cMyvfrrI+0qgZTGXwjILVq9A2uUAKOLKYC?=
 =?us-ascii?Q?lMnE99RQmdFiX2CHx1spx+JsaP4lfWdtMDRQKuV4b6grG3H2kHsUsrl8mtK/?=
 =?us-ascii?Q?HkOd20l4nfd4bDijTSNtqlJdwJOWRpyx4P6QcRHBG7GYfUysufo/13F19oQs?=
 =?us-ascii?Q?cJEIz+jO/OGXQ3erqE4YGkFXReSjls0Qvf/VqwC0ewT9xSAnTSFV+sZg7KMA?=
 =?us-ascii?Q?5klP6I9QU0mFRxYMOIBJF0j1HHP6bP7Mtsg4nZKq/3yyxtRSH4gf2oe9Fv2r?=
 =?us-ascii?Q?yQRSypzU1IrB1PDwefvS48kD8qgkg8WiEItX0qZIWxEP3oVT+Ip5cf5ovJqI?=
 =?us-ascii?Q?k0X2epxh5CM1VfkvqZRnnszROMUijHvrbl47y7MIfTI2s/jROGCHeVorF1V/?=
 =?us-ascii?Q?oZz+ZrXfpw/Q6AIkNvwgHUej4JHYFzlRT7bELcnD+5iy+HwQpQgB4yF7e+mV?=
 =?us-ascii?Q?oQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46db0262-6a54-40dc-123c-08db8d21ace2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2023 15:13:17.6380 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Gp1R+HIq4Xt9FPRlphQo/Je4okT2MDhtaW0QBBx1ZHU3mVD9uY7wKtq96w65aI6hn+Toskd9zq0D9mlyx77GC9Hmn2dB49g28hHkdw+pyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7577
X-OriginatorOrg: intel.com
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Sent: 25 July 2023 20:40
> To: intel-xe@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; De Marchi,
> Lucas <lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> Nilawar, Badal <badal.nilawar@intel.com>
> Subject: [PATCH v7 3/3] fault-inject: Include linux/types.h by default.
>=20
> Functions should_fail_alloc_page, should_failslab, and __should_failslab =
are
> declared irrespective of CONFIG_FAULT_INJECTION. These functions use bool
> and gfp_t types, which are treated as unknown when
> CONFIG_FAULT_INJECTION is disabled because the inclusion of linux/types.h=
 is
> missing.
>=20
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  include/linux/fault-inject.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/linux/fault-inject.h b/include/linux/fault-inject.h =
index
> 481abf530b3c..f83ab2b6cd08 100644
> --- a/include/linux/fault-inject.h
> +++ b/include/linux/fault-inject.h
> @@ -2,9 +2,10 @@
>  #ifndef _LINUX_FAULT_INJECT_H
>  #define _LINUX_FAULT_INJECT_H
>=20
> +#include <linux/types.h>
> +
>  #ifdef CONFIG_FAULT_INJECTION
>=20
> -#include <linux/types.h>
>  #include <linux/debugfs.h>
>  #include <linux/configfs.h>
>  #include <linux/ratelimit.h>
> --
> 2.25.1

