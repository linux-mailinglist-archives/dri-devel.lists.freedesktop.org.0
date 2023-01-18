Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F61671AE5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 12:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B68810E65F;
	Wed, 18 Jan 2023 11:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EA910E65F;
 Wed, 18 Jan 2023 11:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674042183; x=1705578183;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2JpYVhdaHtqCJo1Sf/VQwRoqK0NE34sd1tO4LQsXnb8=;
 b=bpljMV7PHmERHEA6oTkhvcPciU1xQQtz2N6qbOs3jlPC5em3BW7FhU9/
 JEUlk3quVpN4B/HAAmNpbc3Z1+wvSBIu/im1O7YohM6ocbESctQyo9TIy
 caHhs1gye8ToPzcR3vZ3nbjl0rWme1KGFZBZBB8iV6F+fhMs8Qlcl1LvW
 AtMOH6TjZP33n/1lA1xijv1UADDAsonytaYI7Msz5vMQkRLJlfJZ81h8R
 VEkHOM//Zixb8d/maKcEJyYgFpjbOhVT1NHvvl5CZF8dW3sX1g7HOlRC4
 Uy3pvlRL4G5DukRS/9QdfFO6rXa9qJ2Uv+UpiOfo00SVaINYfwrjryc6u w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="326234374"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="326234374"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 03:43:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="661672751"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="661672751"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 18 Jan 2023 03:43:02 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 03:43:01 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 03:43:01 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 03:43:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cijikKZiZLvrxxZq2BPNeA44BgvAnHtngutL8OkTFpLmoIKczUNzMJgege5zX4S0JUcPczrEiyOfrS3GWF1IlxLMFo6GVCnuI4T4KLfnMG2252prVm2KrMNwf42F7uF+eNzFiTT4/z+USDS684MBTJONjz13Fisq2mDQf01WJZ/SaQNetY87CsG6cLs8WB1+jFg6YyOMxRODimJhM4ekji9SRqgMP6GtpmApHinoay5tsCvx4wZFw6XGc1/fSDoyE1+AzuK4jHslg7OBeRmyfMsFNO4u8DTmSnUx/+hAkhQccqr+Dl2jBW/J2aRc3VBq9svfjBJz3Jwofahk+AhapQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2aAS4TdVBb1C4+nW8ReZ0urmo9AvroykDGGjkDicTo=;
 b=Cz2D3XP/bogZ+9Do51PHlXC2wH9WB5cRR0ZNlZfQLcXsL8djXyk3QYj+zUduBNolixgXrTZIdgYfFLSBxHvRN/WLxSqf1KgmX0zBZYyU0U8Gb2pTNLBWWztb9TW3j06RRP6nug4asiggAe/zvbe+Dr2rYGLz1div+qa66DqEEAQ6A59WPfPCafsz5EboHMwP2vrXhQewWgrra7S7mSjv9xQ41fvIHRVQMOxXJN7lRwxg9CmVUcMnwzSjr8J+1BWwhJ3Y+8FjJnDeUvTqS3JpKEG+/RvoQtZjUmNFgdYECqyxWhPtpVLug16F5h3LkxmmxMKzLRIWpPsMZfzGE6XrJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4086.namprd11.prod.outlook.com (2603:10b6:a03:187::26)
 by PH0PR11MB4774.namprd11.prod.outlook.com (2603:10b6:510:40::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 11:43:00 +0000
Received: from BY5PR11MB4086.namprd11.prod.outlook.com
 ([fe80::aaa1:ed2f:3371:a1af]) by BY5PR11MB4086.namprd11.prod.outlook.com
 ([fe80::aaa1:ed2f:3371:a1af%3]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 11:43:00 +0000
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v5 1/6] mei: mei-me: resume device in prepare
Thread-Topic: [PATCH v5 1/6] mei: mei-me: resume device in prepare
Thread-Index: AQHZJu0DmIyzZfVid0iKsXNA3aIDe66kFf0w
Date: Wed, 18 Jan 2023 11:42:59 +0000
Message-ID: <BY5PR11MB4086AC74FE1406CEEA2A5FC9E5C79@BY5PR11MB4086.namprd11.prod.outlook.com>
References: <20230113011850.1463965-1-alan.previn.teres.alexis@intel.com>
 <20230113011850.1463965-2-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230113011850.1463965-2-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4086:EE_|PH0PR11MB4774:EE_
x-ms-office365-filtering-correlation-id: 0db216c3-4520-4b7a-f627-08daf9492686
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9un7szCdYRMcZrp0NrCZtxMypAYctUekXj//hNteWHnYRy47RhgRuPMmdhYgxuKHAUSKoymTosVgo5wq4B+Kt7qWz46IMeO8U4gEcMoOQZUYDlhqZom3YcxqVPrPK2f+AZuDMqKqyDnrCr6Z0S2ALRLjlJwuWWEIOrjKujYO1+T/329eDGZHImnbCzKsGRSncVe+miispKOEUlIlbcuegvyBF01Wj5iMEe5UQ3vv06LPZvJQiUQENpXSgevv+Q+3rOgCclfeu+NqvuUvy+uTGzlctRtKgvqVrD2OcMrBcVVKpKvvV8D7B1hIX+36FbUj1bGO6r4SI+mWE7fWKm6OAhmCLcJF7jSsBtelaxPchnMcqP+iiBRSMfpMyVoz/Jk8VxZP9iOM0HA0ZUgrSfVuEt6AmzIOriNFdBwsu3z3pguS0KkMU0aooj0/rU9Ob27QCAvr64/ROYr4lj03K/yAgyWeXFysOe0TDQJqykCCkPxS1OTZzOHxDfD9N7oF5hHpDmbzfPeFHErKHkQbIhhCyVXzwHNZVXpiTpqdZ8CPF85sgUOAMW9Y8SH2Bt90kmi1rvuGDMhWccmilDy1cNU2L6LMUsHTpSAcx9876m0z6L+2h4rjzDt6apl/r0PQrzuUefyxFWb7TCUr1A35WdZEgnmLuXW5ZMdfSGzReXpcsgcT0IFx4YV7yMKVyVBOnLrtKff9B6FOuOnZqX/u3fC0bA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4086.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199015)(82960400001)(76116006)(316002)(122000001)(38100700002)(66476007)(86362001)(38070700005)(33656002)(2906002)(5660300002)(8936002)(52536014)(55016003)(66946007)(66556008)(66446008)(64756008)(4326008)(8676002)(41300700001)(26005)(9686003)(186003)(83380400001)(7696005)(71200400001)(54906003)(107886003)(110136005)(6506007)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TvWjL+At9QGyXVWWxIHgGCLbDZ9VCvjKQBqlKTFCGFeazbqwJH/qWGa8dHFb?=
 =?us-ascii?Q?ewTm5k81deJeu7JEeF69OENt+AQetZr1Py7LeXzKUscVKfUjSQdGnjOykfA7?=
 =?us-ascii?Q?+kCvm9njAsPc3i9ReXrE2hwM6mJuZscCXj4rh/J8QswDGlUzrwb79f9HCH6g?=
 =?us-ascii?Q?/4CdOPm+0MNyhDcBBkzpEjAK4kS2QlfxypUN8fRA/UdxRXO1Q5nBQ+xqwb/Q?=
 =?us-ascii?Q?V22ONbitFoz4Ea8vCHiLvilXPUUZ1ePIHWScGmEXHzTn0SWeuTFMmpOD/i+o?=
 =?us-ascii?Q?tCzz1cVT659ujqL4j2d2akHUjSivi3R+yqmqD1ow3xp8n4EbbFPxUkgXBo2I?=
 =?us-ascii?Q?hEcYkDU/BguBHl31rTFXkXumjb1ZUJ9ZNP0Z2ED/BHODnJ43YAFica5uqIAZ?=
 =?us-ascii?Q?SZuLMhyiTtr9bg/W6l96oyBE4049p7dLmHneDNguxtrkxoJe2ESsh3Yj7Wly?=
 =?us-ascii?Q?4fWUBkKmGMDc61rINVIjKuzF1C7MlWH8sKokwTmY13f+1mfoqx/66v2UVWGD?=
 =?us-ascii?Q?EatKtSH9cMj9eOnqnETLbH6vm0HBgcOwUA67iwOBAQeTg7Gwjc6QxP+LZC2E?=
 =?us-ascii?Q?tHvbyXRYr7ej59Zqh68jGvptHoCRLIL8jy3oV6hfCvhDZ3VofHqqgKulNe1x?=
 =?us-ascii?Q?cJXbC/hYDBz6TiZNawKOZEJZ5r7AHBassdTHib0xtoD+UrXMTIsHAbT6nBCW?=
 =?us-ascii?Q?Ij/C1Bf8A0JJveTKsA8IigfKOjrXeob0XDz58ULYecQTZwOtIED8PxE3dc3l?=
 =?us-ascii?Q?BwBczJAG/MY5G/lnTW8pgPMn+cO8qZDjYDmdOwWCUXwOuKzTEm71+9hUZk+r?=
 =?us-ascii?Q?AtDXZG1nFnNeS9OdKLD864zIJ3w/mkjiTsLWba2c5mIc3fd6AA3yjSOnLLmq?=
 =?us-ascii?Q?WJScO/t871SlL3Rqdk5cDCp9pR/1vTICAjdFYSZHpFP3QVzpEhMm3Dm3/VOG?=
 =?us-ascii?Q?m73o4ehp3uoWqpoV8CSPllk5rStss3MTWHcpjKystooKaSJvmbSdbPbFhWdM?=
 =?us-ascii?Q?z5OoMjtWknh9jh2vdCtRON3CiFY4oc9h9nfEbUylk2n3wcSNMK1pq/0MmMGq?=
 =?us-ascii?Q?S0GtFZWwnRwSVI9WxYVxTtY5dZg+nE6rtcIMCs1p3zG69XG+csAGmEYd5r6a?=
 =?us-ascii?Q?PlI1mgRRh52DLRkn0TfubsqgY4D/ge0DpN5EwxsztmhbJhgtq52uTZthz7uX?=
 =?us-ascii?Q?cL5DqWe6KX84GFKm4+jzP+ZAxVyAMVJuxKOJ3RE1keeMbxeOkVjNlsrRiy31?=
 =?us-ascii?Q?o2oXyt0t9uL3omwG+1K/YzeLucV+jqRLagFrp0G9wlI/IJRGofH+PV+UeVXr?=
 =?us-ascii?Q?I8W7c0PHNosHUp5uHlFpa5t2ugxaJB3dhg2qZ/uKsaltnjZofpj9osnDRZi+?=
 =?us-ascii?Q?DZqWdNFCGox0ok4lTN9m9e6a5gpwlBISrUPF3bbIRwwZ/GIFGUWpGjvdYjpF?=
 =?us-ascii?Q?gWhnvzZzouxzJ1djU1a2vXHdsXKDvv4ZlMHjH6vRNAJIqIVqMaZfhjEoTIzf?=
 =?us-ascii?Q?H3u0J9eqmZBym3ym4FdlF+lIcWYeRCbwpDkX825P5H1UbReHd+5GWm7tUcSc?=
 =?us-ascii?Q?BjiRrMYQtCTzwkpaDciZifb8cTTjQF/B1R3inIVxigbs37s3am4BbOlFOjx7?=
 =?us-ascii?Q?+w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4086.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db216c3-4520-4b7a-f627-08daf9492686
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2023 11:43:00.0029 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IBET/+Zgk7480Ghr3cwMIPKNIY3b0OCPWBGTq4Mwnttgi5L29EISliempuSh+c294GDQbd/jTO0Pat/rSQKseA==
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
> Asynchronous runtime resume is not possible while the system is
> suspending.
> The power management subsystem resumes the device only in the suspend
> phase, not in the prepare phase.
> Force resume device in prepare to allow drivers on mei bus to communicate
> in their prepare callbacks.
>=20
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Tomas Winkler <tomas.winkler@intel.com>
> ---
>  drivers/misc/mei/pci-me.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/misc/mei/pci-me.c b/drivers/misc/mei/pci-me.c index
> 704cd0caa172..9f6ff06a94fd 100644
> --- a/drivers/misc/mei/pci-me.c
> +++ b/drivers/misc/mei/pci-me.c
> @@ -340,6 +340,12 @@ static void mei_me_remove(struct pci_dev *pdev)  }
>=20
>  #ifdef CONFIG_PM_SLEEP
> +static int mei_me_pci_prepare(struct device *device) {
> +	pm_runtime_resume(device);
> +	return 0;
> +}
> +
>  static int mei_me_pci_suspend(struct device *device)  {
>  	struct pci_dev *pdev =3D to_pci_dev(device); @@ -396,7 +402,17 @@
> static int mei_me_pci_resume(struct device *device)
>=20
>  	return 0;
>  }
> -#endif /* CONFIG_PM_SLEEP */
> +
> +static void mei_me_pci_complete(struct device *device) {
> +	pm_runtime_suspend(device);
> +}
> +#else /* CONFIG_PM_SLEEP */
> +
> +#define mei_me_pci_prepare NULL
> +#define mei_me_pci_complete NULL
> +
> +#endif /* !CONFIG_PM_SLEEP */
>=20
>  #ifdef CONFIG_PM
>  static int mei_me_pm_runtime_idle(struct device *device) @@ -499,6
> +515,8 @@ static inline void mei_me_unset_pm_domain(struct mei_device
> *dev)  }
>=20
>  static const struct dev_pm_ops mei_me_pm_ops =3D {
> +	.prepare =3D mei_me_pci_prepare,
> +	.complete =3D mei_me_pci_complete,
>  	SET_SYSTEM_SLEEP_PM_OPS(mei_me_pci_suspend,
>  				mei_me_pci_resume)
>  	SET_RUNTIME_PM_OPS(
> --
> 2.39.0

