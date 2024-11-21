Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3E89D4CB6
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 13:22:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7538210E8FC;
	Thu, 21 Nov 2024 12:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gX78s60G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974A510E8F8;
 Thu, 21 Nov 2024 12:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732191749; x=1763727749;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=aD0FzdDKfoDOx7SGgYdlR2BUVrw+qHAV40S9qLDbyV4=;
 b=gX78s60GPgK6u2JcEh+nnXpBI8ABueHQCj4lFHVYey0QGAKMUhlxeHVp
 O7tycUOs/oTGXEr2YO4V4bgiBX5O49JR8iuEckeQS7Iy00WkDbjgtuIwV
 tyrpan9LMSqSZ/Z3Z6l4EVWFMLNica5LR0rlijw65jBVxN54GpJBb5PRX
 x0vViUwElTtckRK4+LQo8nT4WObjC6xNNd/b/mXydkLmEZ/+9PNjDIUNN
 HDMFvr/apXkN1B8oyuDCTKb1Y11ljQsot+mwwydMiQ0KzertRx0T9hizX
 a+sza0qlUem3PG0DJs9wD+/vVGKptjXN57uZb5akHlXtTLk/KBpFlWFZB g==;
X-CSE-ConnectionGUID: PWjMcy1jR2OkQDjidJpLAQ==
X-CSE-MsgGUID: E+PWXQyyTkGsg/K2UE34qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54800202"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="54800202"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:22:29 -0800
X-CSE-ConnectionGUID: 8yJpCldKSHe+dl5GT0CNxw==
X-CSE-MsgGUID: +UPfLLVxSdCg0ocJr3b0AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="95303910"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 04:22:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 04:22:28 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 04:22:28 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 04:22:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvouDSnHVcy2mlK0rHO41dVW2bNnCmMckyasRSWRdvnerBn/PojTfvz4TJyPw/BarMKQz3bxmnW3qCyu5uqNsE2UABwtpUB2f2sxNDGhGSAHO3mAojg6yJCFU8ipC1Y3MHfVURWPnJBH8KNY8GL79+I7Un9CD27p4H+RSKmEENgxe65rBTO3mfSmB8wfMa625kntnFoRzbReoeovSbagG4OoWrrm7SPFk9IDvglR5oNTu1DG9ZJ/Zz3yFylujXzAFPzfERGdM3TgCIxt6UM8E9uh+i1SEA/meDNZZpzHL0VTAoeX2XzJrIhcOC6aQjRnbHS7Ijs42Pe29bQ6lCJTLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aD0FzdDKfoDOx7SGgYdlR2BUVrw+qHAV40S9qLDbyV4=;
 b=BYz8peaYp5gehSi/vtm2Ykek6u3UrrQ0qONhpxBf2/DJbPPDUs7LXJdG4rmGojxT2+YtT7LMWa15zvMpQA4iu2ebQ1QMdnqw+/0+TlEU+LzoPncKR0fhUXgv4lqdE+fJnZwo3Oh8yIM4AcQVPZyh1vYQ8aCLGKnsn2K7YOQYmCa7TmtyiIlvZsUgW+lgpH8kqQpVXmLkT2zlI9ejOSWm9rzd8EHCsQ1WKh1fyOkD09pyikB1CO60NzXKvfvwA+BBXUiFg2rsKIcFA87Ik6RVe0iCT1TnekNIfYw9d7wa5IoFxp9uFD6JNnvnst5jySRu/5ouqA6VGjH/ZTZ7XebfnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SA0PR11MB4621.namprd11.prod.outlook.com (2603:10b6:806:72::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Thu, 21 Nov
 2024 12:22:20 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8093.027; Thu, 21 Nov 2024
 12:22:20 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 8/8] drm/i915/histogram: Enable pipe dithering
Thread-Topic: [PATCH 8/8] drm/i915/histogram: Enable pipe dithering
Thread-Index: AQHbOnGIGe4hhOmSc02RFcUqasDhPLK/5AMAgAHG7gA=
Date: Thu, 21 Nov 2024 12:22:20 +0000
Message-ID: <IA0PR11MB7307C063F3EE346EF5EA3A71BA222@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20241119104521.575377-1-arun.r.murthy@intel.com>
 <20241119104521.575377-9-arun.r.murthy@intel.com>
 <SN7PR11MB6750C5F2230C61D4F35273FBE3212@SN7PR11MB6750.namprd11.prod.outlook.com>
In-Reply-To: <SN7PR11MB6750C5F2230C61D4F35273FBE3212@SN7PR11MB6750.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SA0PR11MB4621:EE_
x-ms-office365-filtering-correlation-id: 87a5ceea-45d9-4078-4213-08dd0a272584
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|10070799003|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?mrvCfOglkexdiKk3x7ilcRDaOAWmG1LeN1sAnn12AGKaSK64uyHzVjWACZ5p?=
 =?us-ascii?Q?aWAx8sJiaHFo2w9r4lwRwl49zDd/ZQevDTqj56vFQ/SZxqyL3IG3W0h7s6QS?=
 =?us-ascii?Q?1huvNGByPTmmZpPLPs1LqKbFqf8ArVN+l2CH2beiZ4x3qdH/INSA9nVTjQJz?=
 =?us-ascii?Q?2E1Z0Fee9sfwSoSTRTDJJcOYWFGaOA5KZ6MjI01ew62Sz9aUpTYGetFwp4Op?=
 =?us-ascii?Q?lECBZN+4WhBwvsPCyGgKeS9I9dfgMQ5v9Dlx3Fw4HsYGyCdpXO4HJ8LwHEBd?=
 =?us-ascii?Q?SOHveaWLOINqyLwK3VzFlrAnC0RDWSI/b1v1FA1GWpbJEYMm1sCBGyjVrXkH?=
 =?us-ascii?Q?ojfSuL5uBKavNZ+i6ahpjeAXHBvHutxUve1UJp6tYRLfTX3+1x02qKRTIqj1?=
 =?us-ascii?Q?zzbt4jxm/HKz8bHazjd5qix2VEQgWcVAQ51k0h+czfDEVPfuGSOCXCBIK2lV?=
 =?us-ascii?Q?FGIQtiTWQ9XduSyknPlfk+cUCj7+jdsisuhiEm9IlLIGqG5KbE6VDL7LKf48?=
 =?us-ascii?Q?vdwAbFUiJAQ4vLpSH4UGQpttyqp0OkTQP+xoV8HHQ08fln7xZHGI6y0Nh24l?=
 =?us-ascii?Q?2HAeKn4jBtYmWzQFTc5wQwSB8nKtLkhYydzdNFBQylX0PvaTTjFLL0HqF6m0?=
 =?us-ascii?Q?dKwV2EM0kN8WajzpHci7c72v5C7yuV5t6Q8AVHnnu56zLp1DE3CmQ85yz4LM?=
 =?us-ascii?Q?aDqa1wbYx7G0Re2GyF0i7Jn4VIl4ffMVeRmxbzPt8kmrCJHmugzjBgBVCMzG?=
 =?us-ascii?Q?pXJ55oYX9IqVZjan5JiwkLrIlNi91ZQsWkjPt7Jp3BMnLxWG/ZF1TbGDK9GU?=
 =?us-ascii?Q?/YpQMzxQEMyM8S3Vg+FX1Sak7YkX9WXnacp8Hi2dEmXbSIsl5ikXly1GpTCz?=
 =?us-ascii?Q?YGin1I3p0sto0k6NbSjRJDw3jzyDzk/1nuYF1UWbyQpB+BwIyAjCGCVKL49N?=
 =?us-ascii?Q?zzEQCyPw56hW5qk/hLx1g/y7ZPBkn4V9vZcngu10LSpM9gEGNRFtEBqdzFS8?=
 =?us-ascii?Q?A3QfHk9Lspd6LUe1OKp88/1Drt0Cp+wY0umoxWjc6m3OgTPJ3+MKAnWd67lk?=
 =?us-ascii?Q?/4MdTk2Lyrq/KApzXTdLdJ3DEUz3h2HOtKhRjbYCVGb+iHlSYCH98m9xFe8Q?=
 =?us-ascii?Q?24880NXR+3kOvbAGsvigmNmAmt8f+2LkpbcnKiLMd0TET3zocqupN701cPA5?=
 =?us-ascii?Q?k/bbYxo/OVCZbdLRqlEv7WrLJVO0iud57qcTiMRoxDFgqile4OZlpuElFBV0?=
 =?us-ascii?Q?n8E1yP/P7NrKljNiH/4ki8qL4xNPYsr5FWS1AnAheoOg1IeVdun2XtOuzvQf?=
 =?us-ascii?Q?54WayztWyKuJFpHN9ilz2z2c4Kh9a7w//OVY1Wwf+v8BI7f9Owt0Uw5nlwWq?=
 =?us-ascii?Q?GkLt+Uc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HIdmbiy4/lZ+WYnZiYwZ0WS9YgbGgyUYRT/q9ERh9xLixPPDR7L4hWQvfX/u?=
 =?us-ascii?Q?3BHvVw0UdvMWc4w4PUtYNejDNZtCfi6fnaJlszSJL/5XHUEC0zY1fJq5zZ7Y?=
 =?us-ascii?Q?BcahEYTTy35Gz/9V/vyV76xhMWrTE5hnvwxkzXxADyg4dlcbsgj1w7WfUN4H?=
 =?us-ascii?Q?Ch0zqxJ0L4Ktf5AFrVi29MxfWkh9a2dxzuD/cU5sK2JE/gmF8GvEgtDGTWhr?=
 =?us-ascii?Q?MYs5pWHEujy0uabEf6sipsCZUl20AYp7Zqtgd4Cx6ixatF+BbgpPtucCd7qv?=
 =?us-ascii?Q?hlY8BuROiOZGAlAeSKQ/n3bxpVsPA593z/wbjbJ/YLw84yPkFxHf5op+Pr8x?=
 =?us-ascii?Q?30UXAbt5bAVdUb+k2rp5AlxxMzcsQa9q2kbq4cqW8fPduEc7ph4uzPD/Xng8?=
 =?us-ascii?Q?6guoBPiwJMzsa6aAnTLp2cUvvDkeBwCPK7Tr7WC50DmjaY7sLHUd5N8Zr1ZS?=
 =?us-ascii?Q?3VgYfw2josaOl//Kkkn9AWn2zZLBVExi5f5SvbPhrSuln5SUEHiW+ZbZeIp7?=
 =?us-ascii?Q?VTvuk40SNC1VMm2eAnjGDSyVe/86tKJpU8JfMp7TVf/y8+OqWHAh019KhEu/?=
 =?us-ascii?Q?KPzp0GqMhvNC7WNmLPw/3QkXag3njcNIl35rKAEq9Agln4ERGH2IlGgiPYr+?=
 =?us-ascii?Q?nLdcpibcK9LGhsCgt8o7I8o/q+eMtPZCl2UIoQIv9RtY7xPM4ywMHGq3T2bg?=
 =?us-ascii?Q?cL4awGdixm2kZIAkD5+uGq0fycScth6tSmo62reNXZ5tmhaYiqB9n4yemuFc?=
 =?us-ascii?Q?ZsKo7BP0XnbpuUZY5FLItNJxuhi8V0x7s2Gzlae1Blp6Kx9K9yqxwhtZvyFd?=
 =?us-ascii?Q?eHwvxCx8X6BzvADjOJ4e2kcBJzZ/r+7NwfbeszPQxH6KmdRSrrpaIL26YxiR?=
 =?us-ascii?Q?G3WR2VDkxhqgk/CEvLg3Ui8lAU1iKhV69oqR9rmMeUBlzRMTq3QJH7JoFKgr?=
 =?us-ascii?Q?y4s5YVaKFgYKl+/XlIohHWW0LOP+E9SITBTYfs3yGe3CcDpuARYD/SMgn3KM?=
 =?us-ascii?Q?z723QE835xwU28qW5diMmYgNJNWl7uzI3Gh5DUIoKg7YVwap4VN2IKz2oZYW?=
 =?us-ascii?Q?12lFSECIt1QDhbjAvrPYN3JdmZOYAPj4m15PY6NsaqeLSPliPUl6xPXq4dIl?=
 =?us-ascii?Q?LnJBjurAJ0JEWdNtxvVTZqZbsM3z2HZnmzPn4+dBNUlXXRKWGjyOcrDKxciv?=
 =?us-ascii?Q?qXaOsbE1Hmw879p+duOj02mG8HFW7A8UMgRAiYDIDyV7nOnLaFgfz/IHSh98?=
 =?us-ascii?Q?T+ZdVsTbQhLJaZbnojCHSCFi5dX7fh3hV749IBMVvez9RIjNM4vrgyVxsJir?=
 =?us-ascii?Q?C+tCzdSHssuGQ6oxVCRbZy4VhzNgyJb6QffiXS41+mqB+a4T+KA+4ffp/ZRl?=
 =?us-ascii?Q?uJRRtsJ6ZoPv8+ExP5i8xJm3fC5xw20CzcL8joqblzfhNv7PhSDJL9DNrhZS?=
 =?us-ascii?Q?jZWkkU4h5mAMKkK8pBoHaxFz7mzoS+IVJAsmoZTMecp7z9e0+rtVsS4Nnm9E?=
 =?us-ascii?Q?61I301OSWkc5SJSo2nbt1GSefF9h55rVEwUazEXgMugbxwKAxyPuT7b4B846?=
 =?us-ascii?Q?uoC0DLHHdQsh3S+4+0ioW/W17sAh3aabE4sk8DgQVjVSPoZqLYtInmQdvSe+?=
 =?us-ascii?Q?y6PEdP0cbShwfWQDkBHqyJGEVUAd+I/e7IM4FD8umv0H?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a5ceea-45d9-4078-4213-08dd0a272584
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 12:22:20.5849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i/RvZ4rWdnh4GYd3rY97GhZ6Wh9CG3bHuAryj7ru0eNg/QJfsz9VESoAiLIQdfnwZq3+QtMu6ur3+5uaoAX8UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4621
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > -----Original Message-----
> > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> > Arun R Murthy
> > Sent: Tuesday, November 19, 2024 4:15 PM
> > To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org;
> > dri- devel@lists.freedesktop.org
> > Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> > Subject: [PATCH 8/8] drm/i915/histogram: Enable pipe dithering
> >
> > Enable pipe dithering while enabling histogram to overcome some
> > atrifacts seen on the screen.
>=20
> Where does it say this. I don't see it in the bspec.
> Is this from testing that this was concluded in that case we perhaps need=
 to
> make sure that the bspec captures this
>=20
Will check on updating the spec

Thanks and Regards,
Arun R Murthy
--------------------
