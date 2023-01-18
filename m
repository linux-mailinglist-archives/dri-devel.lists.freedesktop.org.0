Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FB1671AEB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 12:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C8610E71B;
	Wed, 18 Jan 2023 11:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D1710E71B;
 Wed, 18 Jan 2023 11:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674042209; x=1705578209;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ow9LInJgHpbam7zLWmr+IbuLwofMiv4bK69PWyZI5oY=;
 b=NiIFKNqxA//liukfMvXAelvEinmqtPLsBUhbqcZjiIjdxwjWovbPypWJ
 QQ8hWWVrvXz3UUBTrvLvBTPTgjOCa+zpJRcm1BROCB5URKAYvxlEEJMNr
 rg5TYyM1wjzyQ1QSCRb00pdOSzbzxho0760B6okQQUnFENc5FLlfgFF0a
 7d0drGbrd+mDgLs2/jA5UMyCou21HlDW8+gWzS5Hz+j7acYYBPJ04ZVQQ
 Ysn1hIKgQaXjPXxkOqpKXXNqOPFOs2cne7tXuc/N+Bfuk7AcTWAKqx2E3
 IXdmLikMIeSaEllV0qOa2QGVWaEqm/JgrxwDXHFMKGMbh/06wYVWNgkwd g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="325016348"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="325016348"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 03:43:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="833544339"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="833544339"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 18 Jan 2023 03:43:29 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 03:43:28 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 03:43:28 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 03:43:28 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 03:43:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knfBk6gJ0kGbBfJwMDzFKq8oWzYowrqb8g9E9v10NzM/KjHSEPqr55tdbAAvA9yG6edyeKJDVMla7FA/GVboI5462C0ilaC4rLQLOR2QszpTqGxqlwSThuHTccuzfjzrSyG9mg83ZqpqYxdJEonCU2lc+gKTv48/KB+kua5vGbcHYrV2YTqv1GtlgBnrUQ/LF9XEE7IhTgpwOOKa+PO1+pdFs8qO2NKWzV9V60putLYKWXLWTjOAfjm2e8V7AbMjw7q/LFi+L5My3hNOwU9iQ7sHebuJMTIpWMOwlWTimK154dQeMMWDwRG1kF/AHFRaGuksn5kR2JlT1OywI/HLdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCm5EHigI8q8M86rKx5ivuvIUKA1LVeCRA6OpqqkUVE=;
 b=E2XC5aBIIsVEZcQOfadBeU644xV316y1+TUsmYqcFj60UPwMammBKG6kNdtEXdpDMUwMy3L6EZ+4PFdvsq3AqJnSY8AYjoTWKfyBuBNlQTthqOv/TidlUR4umX4iWB78q21ZzszmCgn3CQopMSIjwGVKnYd8noYiAGh76VYexHTyf+3zRf90uxQXCz5+2d5nuANNk1Q3ofZfPw0mz4l367rmsK3PMJlp7L1+qJIomXxyhBP5uKWkz3/KVELOKZD9Uyj0qI0UI2ctuE5XB+XFA5I9bRpRcv7uBpIdD+G/5LOwa2D7n0A7GjF1amcCTOsQkKroO/PjebdcjBvPFKgw2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4086.namprd11.prod.outlook.com (2603:10b6:a03:187::26)
 by PH0PR11MB4774.namprd11.prod.outlook.com (2603:10b6:510:40::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 11:43:26 +0000
Received: from BY5PR11MB4086.namprd11.prod.outlook.com
 ([fe80::aaa1:ed2f:3371:a1af]) by BY5PR11MB4086.namprd11.prod.outlook.com
 ([fe80::aaa1:ed2f:3371:a1af%3]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 11:43:26 +0000
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v5 3/6] mei: clean pending read with vtag on bus
Thread-Topic: [PATCH v5 3/6] mei: clean pending read with vtag on bus
Thread-Index: AQHZJu0DLN1sBzxPQEmeCP1uR/WhtK6kFjEw
Date: Wed, 18 Jan 2023 11:43:26 +0000
Message-ID: <BY5PR11MB40865F34863C4C087BBA00B3E5C79@BY5PR11MB4086.namprd11.prod.outlook.com>
References: <20230113011850.1463965-1-alan.previn.teres.alexis@intel.com>
 <20230113011850.1463965-4-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230113011850.1463965-4-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4086:EE_|PH0PR11MB4774:EE_
x-ms-office365-filtering-correlation-id: e560881a-e2c6-40b2-50d8-08daf9493652
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dqjd8XEN2dqYMllHy/v9jWEkr5VVbkyE9VqPSo6imnYuR4qar62m295ltzyXFmtIjuTyihU/BCDpGH0SRnE5zihqx4ynSwxqITezlrtgcyzL5LeEFxRY8LywgnXAr0WBE2dTOaEPb+tbUsJegvs7nkit8iYvU15rSDeaGdLpjazu2K8D6jLcfEF/Uu+JlP+a9zZLWBeAmBM0Xvc3zuY5LoZ9pxkV3gA1j9dxz56M+5mP7NU4DhR2YHB9IESEUce0i+V/RmGiQVMg7tRPu9DhCo2l3X9gCj3xkox3GKOyM48dbDp8H034uJSmYutFQzkRwd7/A1u45ZlV4xKoGxi/BI+0PmN+NnJ/oMljEqOibzeC+9MtAveMFRCtmaJ11El01UMDgTxbdYNg7H67WEIwYjtZDZ3kmNikKjRHDGNDc+aANKMtSCavbTozit+ooK9N47rbIVNfxewqKN4onEQAO76IZYzDmRBkhzGlvYqqZZGD/ORIIcfcqR7/8lncLfhsvnGewBz90728vdtThuQp9LBzu4FHYoHUwLC36VDXvsK7DO9RrvYxDYptwql0FSqO05ah5SNBhL/UIZxWgX7hVpRQTGeMT8ok/sT6JwFktKqFduDPxczvtoVm5K5zImSbUXIPYQAPrfHGY8zh1rdfAuTlTXebT9xUD5cKax0BqLczTt+Gwj81zpHQkJmMBXs6quoJtZK8oJDOO8XopdT8xQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4086.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199015)(82960400001)(76116006)(316002)(122000001)(38100700002)(66476007)(86362001)(38070700005)(33656002)(2906002)(5660300002)(8936002)(52536014)(55016003)(66946007)(66556008)(66446008)(64756008)(4326008)(8676002)(41300700001)(26005)(9686003)(186003)(83380400001)(7696005)(71200400001)(54906003)(107886003)(110136005)(6506007)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xx3qkFEBFFbgr1JcuZuXIalGlco2HRGQ3p7+S+n9mBwtgU6ZZEK09idMfw+V?=
 =?us-ascii?Q?JkIBcliW4bsjJsGNB7adkMlYZAwHjPcyA5PMF7JMUKituCfUlWXfjlnGVA+4?=
 =?us-ascii?Q?KNYkxB8ECYCPMZCLi3dX+avN61sQ/5PtKeMnwhvZE697pWbvF8NG1nZeHAkX?=
 =?us-ascii?Q?BHZ7ncEVdSC0eSOZpYW9Me+nJuM/EjSz6udekJzinrPNJYAVu6hVraKEJpm4?=
 =?us-ascii?Q?M64tQREFBRVET3xBN5PJBOSrWBq1+TaxZfC4MylYTuzZYdeAXhMYtk96cIHx?=
 =?us-ascii?Q?dPQl2EV/EVHW606vCbaA376QLA1iybp21dtInDa04iitao3us+sXMengOfn+?=
 =?us-ascii?Q?YNb7gJ5SaEILpwi2ZTahHTTM9oSgLc+GDbT49HqpLBQPyHO5wJb+UuVYZFp/?=
 =?us-ascii?Q?tgfwFJNUO3zkW8qXFO+hvTa8Xwdw0Ahp0EhsPQgKpS4YwXQMbiqnU/1dDCwb?=
 =?us-ascii?Q?29I8zB+6R2x6roicj7kVGSBh+2aj3sg0bxIgFjcFMxfN6pCca9WJkmkBMO9G?=
 =?us-ascii?Q?chsc6OQKTOU5Y+fduQ/OSH7TggoMLtTkBjvL30scPiugErFWkdlsvw/S6O3z?=
 =?us-ascii?Q?mN9WUj0ioQ5bDGAMZX5LGSD30z2e/8QV20R4XOETz34EziCBRWDFMnBZqlH9?=
 =?us-ascii?Q?WUetgKKC2go4XghvNYN7VhDnBQwnXUeIzlY76Q6u3XNPMnAKUDqDgY6Qz2qe?=
 =?us-ascii?Q?7iAtuR20x3w2gDlbjP8WwmRe+Ssz7jAj0bZgpSiiG6QC4Y+U7aSqXlDH6t1l?=
 =?us-ascii?Q?MyYK89ZDaas27FJqlMC6o1s/UxqBhyBFOfNlCu9EHjHSSfxumms94MHa+TnU?=
 =?us-ascii?Q?Zx6RArOcWLK5R6jIZwZEohTKKxZi+Vl8wcge0QGDL2+PIDdiqRWJk5EeIlG5?=
 =?us-ascii?Q?KyybGi+QEUuUiMDT2QQLtUmyo6d8oCwDVUJsyHcIcm5NGJDjNKhQx4WngcvH?=
 =?us-ascii?Q?PQgWDeTrYFqQ+uCm1WFMSJg8cz8ti2GEY/IWj+xjv98kI6VTwjXrBN26fqfw?=
 =?us-ascii?Q?iIWMF8LZoluv7gbQOWKeXcj7W0i+fjzTxZDCOm6M+3ocPxqVe8D2hsl1iarT?=
 =?us-ascii?Q?0TmWbTDbv8np/eURbuZYy5eUccklwShhgpQT7JDptcnbmz4tg/HQYFIVmkEJ?=
 =?us-ascii?Q?3FWxbmMI/5oF6C/nF5qVT9dIwjMZThbEhnFr8/vPR4rrzAGTiyqHOMN/ynvT?=
 =?us-ascii?Q?8uiTeMv9VqgZUC1F/PCu1hc1eT4gvvfOsW1tturWw69/jvW8Ivg/NyPtr0Xz?=
 =?us-ascii?Q?gpMKHHE7jEs9OcH0UuOjdHfrj1NbpJGY1GGtH6LkV2YI5e3JBvLD0/xf04oo?=
 =?us-ascii?Q?xAGKE2ZhdoRM+siKTENSuxcrhU1VM88MG0sMZK0KBg2No8CZamDDpJb1whuN?=
 =?us-ascii?Q?YXa6SSRc3PWKSiuS76ZOnIuwL3tD+qOEKriL58jgwni9DSyQkjFJFchqO49A?=
 =?us-ascii?Q?eJekZh069KnjmurG5i6Y6T/gJN+75xQ67OjC/NmLxtX5+6us+5HaoRFcAcTo?=
 =?us-ascii?Q?RBMKzl+R2tYmb/u4Iq4F2jKMiBAwM6rfJ7h7XDQULdpGy59ZZ25vutkaGnLW?=
 =?us-ascii?Q?9CTGXCiA3TJ6f66UEljA8wo+F996faMqT4yGdh0n9sLI4eGEcGBmMhf1UQOf?=
 =?us-ascii?Q?ug=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4086.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e560881a-e2c6-40b2-50d8-08daf9493652
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2023 11:43:26.5014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: epqte0tonCNZNzix8Ta3835EmSiIvoT1oG5WLwKZm24k2Js5Up8VetZCSlpUO/Tw44egCUgNmyFuk9fF0i1msg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4774
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, Juston Li <justonli@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


>=20
> From: Alexander Usyskin <alexander.usyskin@intel.com>
>=20
> Client on bus have only one vtag map slot and should disregard the vtag
> value when cleaning pending read flag.
> Fixes read flow control message unexpectedly generated when clent on bus
> send messages with different vtags.
>=20
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Tomas Winkler <tomas.winkler@intel.com>
> ---
>  drivers/misc/mei/client.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c index
> 9ddb854b8155..5c19097266fe 100644
> --- a/drivers/misc/mei/client.c
> +++ b/drivers/misc/mei/client.c
> @@ -1343,7 +1343,9 @@ static void mei_cl_reset_read_by_vtag(const struct
> mei_cl *cl, u8 vtag)
>  	struct mei_cl_vtag *vtag_l;
>=20
>  	list_for_each_entry(vtag_l, &cl->vtag_map, list) {
> -		if (vtag_l->vtag =3D=3D vtag) {
> +		/* The client on bus has one fixed vtag map */
> +		if ((cl->cldev && mei_cldev_enabled(cl->cldev)) ||
> +		    vtag_l->vtag =3D=3D vtag) {
>  			vtag_l->pending_read =3D false;
>  			break;
>  		}
> --
> 2.39.0

