Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE11F3933FC
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 18:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3A66F479;
	Thu, 27 May 2021 16:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0833B6F479
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 16:30:23 +0000 (UTC)
IronPort-SDR: GlbL+eIgVx4zzYRKWXARKmJ8qxuCEalM80+BLp4jZt1FR2GWxMaXPQhVuQAl49pyFGCqgCk+iW
 K3T+Haiy9zZQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="182434098"
X-IronPort-AV: E=Sophos;i="5.83,227,1616482800"; d="scan'208";a="182434098"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 09:30:22 -0700
IronPort-SDR: UoQdF0MYOZytwpBdlCPQHQ8YvUUjnfZ9dJhdfU/PtK9A4R4wZcT0g0zh6BST3zY4H1LWaE+BUD
 62eHBVOhun5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,227,1616482800"; d="scan'208";a="409804797"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga007.fm.intel.com with ESMTP; 27 May 2021 09:30:22 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 27 May 2021 09:30:21 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 27 May 2021 09:30:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Thu, 27 May 2021 09:30:21 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Thu, 27 May 2021 09:30:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+Am66WfXxBLEcE2NoJfP/PEOGZvuI1y96Vr/7D6QABKs0dUT9Sppqo0MuY7U7mzAbZV1DnJmlBO7Goauhh33bzTkIvRjdJ/AnUoMXWxWPYrnxBTeZDMC2EuaW48FoayvzlIohQ9jy8Wx8G5B3/tb4mEM61n263wZIX9QXdpcyWQYpL0Zy/+cxTdRd27aHZDURM2YcKE4koiwLTZMo/5fI89LEzRozy7r/vygs8Z4YmAZIZkPL0Lf1oiiUU1ermQROscFamwf8trT7Qt1T4JIgy+KR9pbnvk1Bqog+I8S9I52U5415k6iaAustStxfCu/YWuMGiaacwbbuHomqhwuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mM38SH85igAmxxdDHC6fmDZzUe+CHqaKUVVz5Tq18Rk=;
 b=gkL8fvYwWOjJN33q8433TF1ydm4RiucJZmC0achjBzSV8385Lh+pCSosNkjw2YLxKWzwKACjhjzGkI6tWbHCYNOJ2tpGYOEp6M60PGe5oIkXFE8raun7Jsp0VIb75gY40JRiTG0s4A0erAYk4KCXtvTnn5prmCWsThhfJNcRdGdrBhn+r1XKy/YzZYElbLkXlrOIs9zE0vqCHFtuJJY04BPXakWHcjCS+QtjhGmYhJZaICDMbq/V7n2+SKU1xCLPhWzb5O2+ammUWIcrfhQUrsLq82Mdm9JwL1SaJO+TKnNTEUcBu8jQF9YjMFwZvFOBnFj7s8hqrPG4jsfx0AZCkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mM38SH85igAmxxdDHC6fmDZzUe+CHqaKUVVz5Tq18Rk=;
 b=vWmkZxmOU2b+bIr/1LjQWjQOFoLhfClpToaqd20pBeWRJDCdFH5RZNMb3PieiqOzqq828g5B/A3GAxVf/S/BP4e3z7D0r0MACYUSMRAjGITVl1EIPv4nvHageCE9YGM7EAgNwjTwxZR7wZZk9Lat34B2S2gJeQ8hwTNP0Y2Zq3Q=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BYAPR11MB2679.namprd11.prod.outlook.com (2603:10b6:a02:c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Thu, 27 May
 2021 16:30:17 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::f071:7bd8:d502:a6eb]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::f071:7bd8:d502:a6eb%3]) with mapi id 15.20.4150.027; Thu, 27 May 2021
 16:30:17 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "Dea, Edmund J"
 <edmund.j.dea@intel.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "sam@ravnborg.org" <sam@ravnborg.org>
Subject: RE: [PATCH v2 2/2] drm/kmb: Do not report 0 (success) in case of error
Thread-Topic: [PATCH v2 2/2] drm/kmb: Do not report 0 (success) in case of
 error
Thread-Index: AQHXUr8HZVnzNXqjt021jkY4PneykKr3hXlQ
Date: Thu, 27 May 2021 16:30:16 +0000
Message-ID: <BY5PR11MB4182EAEBA97588BD24E7EE748C239@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <91d2b0417ccb8497b977e175b0b44417e47405aa.1622095610.git.christophe.jaillet@wanadoo.fr>
 <8b7f10d6373e117cc26487e1c6963e637bc01dee.1622095610.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <8b7f10d6373e117cc26487e1c6963e637bc01dee.1622095610.git.christophe.jaillet@wanadoo.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: wanadoo.fr; dkim=none (message not signed)
 header.d=none;wanadoo.fr; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.41.68.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26ed9eeb-e9d3-4806-46f3-08d9212cb659
x-ms-traffictypediagnostic: BYAPR11MB2679:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB2679FBC625FC082372C70E758C239@BYAPR11MB2679.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mRKsZB1hR6Zpxqow0sfM597y6k37nuBbFbiSBJUKwtHqH/Mfxa6yroMfgZOR3aSTSvqRYryjqlqeyB51eAX139wIerI9iIgaRUJeVw9Wm0mBfFrzVprUr6bbge/JrNxB3bt3po0uCjAVbCsRnsDY9PEI1FaSB9+AFyHQo5/RIx5DtMOW/82fNzZvmc2iwbiZzf9moiGoCztL6XLBi6Yi/3Kb7uX1EEiZ/+4zA72OLc1XwG/gJnMPkoz2wwiWKHX7OVS9h/hnCoikt11dubhfUEz5Rny2vpZ1fsqQRsxtiqTR/U4tha2FUkqMijjVHwL59lv9gCd9lQCamuKyjQIf+A19BAZInB4KnOFic0qLopPmAP4Acylr77Yck56lCrulwgl//uXVD95l/I7IuCFIEH56RzMENVDqXVfuDuXBfUSAGBkdA/s8ML3OZBhl/HWxOUCb/3+DvTFhs8KzvvRwqLOmmeAzMLks1GIDfUiEZhWMdI0+2f4o6fznw0kibIvIh5S4WVauZ7LquN1dJ6MvE/7sawhdSAw4T7Hsq2bTN43qSxn2j2VkggYKpNswmrhnlVV1oAt0QVCo8QTLm+/4exSVdWUh1gUzHp9JyhTwNh8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(39860400002)(346002)(366004)(136003)(33656002)(76116006)(66946007)(110136005)(7696005)(54906003)(186003)(6506007)(316002)(53546011)(83380400001)(66556008)(4326008)(71200400001)(9686003)(8676002)(86362001)(2906002)(66446008)(52536014)(66476007)(8936002)(478600001)(38100700002)(122000001)(64756008)(55016002)(5660300002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?5oNJV49gnZBH/0RHyIS1KIiGfaQY85oZJmU7nXDimrGO0KN2XVzWX0gtxTsd?=
 =?us-ascii?Q?rBHRtV6YbFQWvawBuad2PqBdXGB3CZcTPyohQ/doShHxI7YGU7O7HOzPhzlr?=
 =?us-ascii?Q?EWu6/Tys7Mq0MDAZd6xCdlj1MYbjpe2wrghpYAwJlshYrC7V/JUbYJq8T2Qn?=
 =?us-ascii?Q?dhTze2/Twd2hAPOiKlsgveJv3MFm+KezT3Y+OVTsxo1L4ryQu1jVzPvra0em?=
 =?us-ascii?Q?g8yIsiG4SZ0pY2JqoZEs83OJEXSDk146umUC63wgy6ftKPNPyGp/pa3iJLea?=
 =?us-ascii?Q?jqfhQEC8qMDg+4ukHnB8EEUaX/KcDjHzW62KHrvRMfmi5iYDPo06k/AlJUET?=
 =?us-ascii?Q?PzHxrWVjU2DrSDRNYO4+Qw5Jt3klWkrNvYBdEyr6SRb3NPZuN/kaEHWe/SYj?=
 =?us-ascii?Q?W6+NqUrDgFCBnI2xxk5JMAu2+KvBxBhVVkTs7g4UxUUekhLiE0I+XoaKsSDD?=
 =?us-ascii?Q?uEYEKp8tn42oACrYQ73DM+56Vrfub3rZQl5hchJb7zuU1M3NfhXBH0DzWE5B?=
 =?us-ascii?Q?O6yV9uleFv/gibAbzAJNSb0xHoieP/nb5kKQzsJXED8s/GvBqiXj3DHLxn/R?=
 =?us-ascii?Q?VR/nOGQZ+zirxYXMg8+di3hOvyryIpgdsdps4huVvqafgm8wRSZNHkqFqmWv?=
 =?us-ascii?Q?5Dxh/25MciSPAXrxrQdLBcE9hMpbvpc1OsQDGdpcYv8cIyzqq3SCCwRVn273?=
 =?us-ascii?Q?kyslcxXM5sJzrSAQJep/YyhrKj4HzqFNZrwsULEtlB7ojdRQ/Vts5YpUKqIc?=
 =?us-ascii?Q?IYfVZe1NL7eKZmGVvU5Eka3nJxbAizz8cPXleZ+dipJ67GGp0uBj+4Hn1kOn?=
 =?us-ascii?Q?+Qd6E58qT0uvsmB8hJRgKmrpHgRaVuRy5/K+d5Ci1j+39AZefnUwzEsVWd3c?=
 =?us-ascii?Q?H6iagbWGUlN+2QvlsYQR18r/9/HcbzSO7tem9zjM3Z9QInleJ7nNVE4z6fHh?=
 =?us-ascii?Q?J3onAsSmoD6RM4nrBGAgSYwX56jby7euqmBk1Jy38cDSRM3RIyj1D/tJrjli?=
 =?us-ascii?Q?i6jNOwI+v7Y0w9MgMdJTjo5SsfRCn5bxvApcXNmcZFGCOADrG14n8NnKXL0M?=
 =?us-ascii?Q?g79pPbYWnYKn1PQ5mvG8DlOdP878P/gcj1GOvZlA2NjZQaNJPrBh1B+yf6I9?=
 =?us-ascii?Q?L43Ko35+n4kxH/w7c7zLayd7ym0U0KNSVJPvb2z7TC3qzpNRL9fvv1WqXQAW?=
 =?us-ascii?Q?rUCaGVO0O5wC3KNQ0s3l1ltGmKBPRI1iqV96U0L2Y6kpcG49ciwLfc9NHPDd?=
 =?us-ascii?Q?8c8mld7wAO54H+JM3JzOYyV8LcyUlvbvy1L5oh8qd/RSn8q/rhXRwHqxtCs+?=
 =?us-ascii?Q?Hw4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ed9eeb-e9d3-4806-46f3-08d9212cb659
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2021 16:30:16.9888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +L7N0TeSZl5KhSlsUkFk7+tymhcrIVV8ihfRP/3ReC5SoV9KVOcWiSwKTk8UidOrotM9qi5EHJSTWQhomG/4UeQHU/0LQxwjgjzIDXfrViE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2679
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is already fixed in the patch from Zhen Lei.

> -----Original Message-----
> From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Sent: Wednesday, May 26, 2021 11:10 PM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>; Dea, Edmund J
> <edmund.j.dea@intel.com>; airlied@linux.ie; daniel@ffwll.ch;
> sam@ravnborg.org
> Cc: dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; kernel=
-
> janitors@vger.kernel.org; Christophe JAILLET <christophe.jaillet@wanadoo.=
fr>
> Subject: [PATCH v2 2/2] drm/kmb: Do not report 0 (success) in case of err=
or
>=20
> 'ret' is known to be 0 at this point.
> Reporting the error from the previous 'platform_get_irq()' call is likely=
,
> so add the missing assignment.
>=20
> Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> v2: New patch
> ---
>  drivers/gpu/drm/kmb/kmb_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.c
> b/drivers/gpu/drm/kmb/kmb_drv.c
> index fa28e42da460..d9e10ac9847c 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.c
> +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> @@ -138,6 +138,7 @@ static int kmb_hw_init(struct drm_device *drm,
> unsigned long flags)
>  	irq_lcd =3D platform_get_irq(pdev, 0);
>  	if (irq_lcd < 0) {
>  		drm_err(&kmb->drm, "irq_lcd not found");
> +		ret =3D irq_lcd;
>  		goto setup_fail;
>  	}
>=20
> --
> 2.30.2

