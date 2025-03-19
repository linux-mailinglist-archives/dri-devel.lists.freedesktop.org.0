Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 699CDA69A80
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 22:03:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABC010E580;
	Wed, 19 Mar 2025 21:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zmzr4dJ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C2510E314;
 Wed, 19 Mar 2025 21:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742418162; x=1773954162;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2eYuMnUbz6RGnb1qQ9b5qwOODA0p2Psdea5GeB1Zdsc=;
 b=Zmzr4dJ9zmja0nA16xlwMtCMVe/CdEJOSynHgaR7tGDQmY6y1czLa3sS
 CKjUFUHVltLZ1IT+mQ+OLWBZy2Sjt20ZIkXHEXiAlK54LQsLZQ79Ula/9
 CK+mFoTosIKPkWrSe93xUtKAgDsabf37StwwlsaO7wQd/5UUwH1bZZXao
 kZbH3mcdMJFvah52RmMYCXav1mM9YCQR2ZG8T5Bv5tBoDNBp7sfzhbuZg
 DhEc3cbaTSxFuDdBQYgyd5PjY3vfXi+QxupxmtXW3RMDUc8TIBn1AyOlW
 m1hiSO9UTWARqlMdjPq01OhV3ODXLmuUzsWg+dgkG2sLMJ/xwsxEtxu+S g==;
X-CSE-ConnectionGUID: c7laAbVrSuyaMu6lVTIC6A==
X-CSE-MsgGUID: S2aqLfeSSVCY1V278FJF5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="47404410"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="47404410"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 14:02:33 -0700
X-CSE-ConnectionGUID: hLsExb3HSpWzY3U8pifOAA==
X-CSE-MsgGUID: 2aq14ajEQpCo7c7u3sbd7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="127891053"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 14:02:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 19 Mar 2025 14:02:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Mar 2025 14:02:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Mar 2025 14:02:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GA0N3NDJqCfwL0TF07a5vW1E0m43C9LoLqy0FxKVJrv7DbjMWhRTPzTWrePPgzzkDkCZD3wXhyJmy5lUHh9rYZOW3yOf0t2VnaxydowYrMBbMbqKZC4g2seUol5bWnLBi0BUSIXXxFDcmYZHCyHt2sl+5FTv22iprCVQzifA9jMVnBs27vzwpOGFLv+LLI13/TFBvpt7DSqoPOLiCOsvAiQ9EOkqxXle3215CXrbEwLLlllrnaigTiqVPZqsCWSvb6mqi1yGwoTlxtkI+RA4sYieEpZelLjL+nT7qRA9of51X75PJMltB9eWCqxPqNfQoEr0DehSZHcp4hIlPWLS3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjroEdtJepFp5CdwlDcPqH9qmYC7IhVMChNN0rBjpSU=;
 b=Bp0+It8TA9i27M/Uio1CdzaqInIwAXgn/04hHjYSYGG9Rybr1q5Ph20pxw2I6s7C45zD7mbmKORTL30NowjVhlfAd/5KbjQ9BXCU99dGM3Dl4WXRlLG6Ngs1+dDhXMRFPw1hvcefy/foDmg16xkGIDbvk+7pyRyegcgY0LbhnGmXz9V002KqODDcb04T1yVTsuwkyNYooYRlIDxwTAZD7IbP2vIavJm5UGOOmEUUIQmu8w+7zxBTln63fSjP6AIuMd4Pgqs6fxOEgU/7Z6xVqaaRbZBNV3+IfxI1iqBSYFPerlxagHYpcbYdFJyvV/Z7pUgtxCpZYwODooOtsp9m8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20)
 by DS0PR11MB6470.namprd11.prod.outlook.com (2603:10b6:8:c2::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.33; Wed, 19 Mar 2025 21:02:13 +0000
Received: from CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62]) by CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62%3]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 21:02:12 +0000
From: "Zhang, Jianxun" <jianxun.zhang@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>
Subject: Re: [PATCH v9 3/6] drm/xe/uapi: Define drm_xe_vm_get_property
Thread-Topic: [PATCH v9 3/6] drm/xe/uapi: Define drm_xe_vm_get_property
Thread-Index: AQHbmCjcQWuDVBn3VUKlefkM13zmm7N64naAgAAEGYCAAAx4vQ==
Date: Wed, 19 Mar 2025 21:02:12 +0000
Message-ID: <CH3PR11MB8707995DFB1FAE57E0023449F4D92@CH3PR11MB8707.namprd11.prod.outlook.com>
References: <20250318171146.78571-1-jonathan.cavitt@intel.com>
 <20250318171146.78571-4-jonathan.cavitt@intel.com>
 <4f6e669c-5d80-4bf9-a7ab-eac8c0ce8000@intel.com>
 <CH0PR11MB5444600AD376DB09737B32B4E5D92@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB5444600AD376DB09737B32B4E5D92@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8707:EE_|DS0PR11MB6470:EE_
x-ms-office365-filtering-correlation-id: cbf4fb22-c487-4c0c-6061-08dd67295253
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?0HSFl9inYLa7ekWNndAS999x/ic15F/Cw57uMsKoVk2Y+kAN21zS3eA6qN?=
 =?iso-8859-1?Q?FMtEpQYkaii6nMcp0lCxCPILbnq40X/YQ4XLSdahguN32xlvGg+++6KyLw?=
 =?iso-8859-1?Q?7WCLZwx0/b4yCkIKoE2n376jugnskDOfWfgC008m4GGFrbp+nzWzdfzLjc?=
 =?iso-8859-1?Q?PNZnOS72p7xwxGD4m4whOd5/vLstsrdhn+jox7nkLRf78ScQ+PpAudPGHx?=
 =?iso-8859-1?Q?tN78Yu8q7h+Dv3YPPAeI5sXuybzF1OaZTgxZe43wf0xK5KLLkGRjWYeQOG?=
 =?iso-8859-1?Q?V0M+yYGmWfn19HZnkzRPg9jum3x54WpbAX4YRX3KTtITo2KB1UvaVZXfsI?=
 =?iso-8859-1?Q?U8N7yrxn/oPW/R/EeDlh0IDs/vewTx87p21LNMwdMPHnZAFIKkooHmTtfV?=
 =?iso-8859-1?Q?9pajMFGbGwyyTr6T1UwrLsNSoECK+77YpE6fk5m0bHNU+KNaTePIGy+3KE?=
 =?iso-8859-1?Q?Y54E6YsLp/IAdk2aMAlGa7gisAMlhdPSJSc+BGyuPOPQn8fkoBXOa3BRx4?=
 =?iso-8859-1?Q?xz7C+MQsbfYH5WkQRhhWiOpLJtOWLDlf4OTB2F4q+TTDrB/viJVUWYJIWO?=
 =?iso-8859-1?Q?paWGkAokBCE0SfLVlpaMi4F3qdo3iFz3njLa+zbmuRKA5iZo1+GUWIFP+u?=
 =?iso-8859-1?Q?Ovww/0cKTDicWrwxkEEtq0GdK4iVm4WRRZ/Aiw1iymk3bum4MTEXai/SwI?=
 =?iso-8859-1?Q?eZR4opppXaNDyQl4O5K09CJVBI9VjjnJE1z+0Xtr98pUw5fjv2c95WxXN7?=
 =?iso-8859-1?Q?K9FpsPs81vrD8G2mRvPEqbIQ2emgNf/Ag3VKlGvppL23nvj0baeURYzcgW?=
 =?iso-8859-1?Q?Uo/+FSgJB75jMxt4RSmZKQheHb1xbUqxf8Ump6uQcrLzfOylhANja5pRaX?=
 =?iso-8859-1?Q?c2fNpMKHTo3sfDs5SEjnKG+nImyP+sXZAP84nJwKWoF2emsnPMnNexWFbS?=
 =?iso-8859-1?Q?gZzxes4j+Rpjq+g0ituIW+OneKILXuvN1W5xRy0f40LG5fTHUL7RnZssLX?=
 =?iso-8859-1?Q?9l8ioGQXcrv8ho1SgnNSD2H8+6dVYKjXznVvFYNw5df0nQHtVTufbfcqGF?=
 =?iso-8859-1?Q?OYmbxwTBQ2WftwBuqJY5FSuSSKHNi2VZUoecS3j4oBJpEqCCUJn9s/lKIG?=
 =?iso-8859-1?Q?I0ayDRfZsWOIIlreAYhEjOeD9X+aQP6JVOY5DpN+SVZpEeG1ZNygZncuP3?=
 =?iso-8859-1?Q?/I/0BGoiV77yOJL10iDqTaar6nVXlyvaKgDikXQvadbreR5LZmPhEGU//+?=
 =?iso-8859-1?Q?+38k4IKhWn2JC0Uyg+NfG9wix4wux1L4yuZsvAV3ym9FICh/dVi3zoKcCJ?=
 =?iso-8859-1?Q?lJqI52lVygUDGYEy5ba1sISA4FqnA/INOSa8OiGIZgspAUyl/+ieY665mm?=
 =?iso-8859-1?Q?WL05z7YAgQ15MIPhx3fh0prJexmuZJMKjB5qbp7K4Fwu5sZYTeAih1uoW7?=
 =?iso-8859-1?Q?LRUkoe5zwK1J1MLHdgoHQXNDgvejKI66vt1hrknSVC4OZ2wmblNRkY8RCz?=
 =?iso-8859-1?Q?nEDSiq6FvDWieBfxSOts0i?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8707.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?j2NU4l6FBohJ6MJoA4HTRN8Kj6vAfALMmzUqE7bHmseoZzCxzdHna9zdJD?=
 =?iso-8859-1?Q?rlgnaAjJpqESiK6hRPww6+AjNDwBznnJICwtGA6jNefbTB0GxRT2Fpa8j2?=
 =?iso-8859-1?Q?DxNptYCFNbgsa2DMTnBUunNFe8JKO2sPbwVBtUssl9yOT76AuzGlYa+Z9t?=
 =?iso-8859-1?Q?LM8i7187MYDKYcEvzLyupB2eEeh9cDCHbCP7fEfgXUAzN6DWxIj41Y2mhl?=
 =?iso-8859-1?Q?rK/spOqjTPCJAg2wfV9/VZzvzNs9E+HvBcJXSs54hPHraPAFyfQyvsZ7el?=
 =?iso-8859-1?Q?f0C+E28A5jIQ/lLncdh8oi5J3TU7JuXht0Z/+fuGen2ZCoh0xgZmYlkq08?=
 =?iso-8859-1?Q?+0YAgOh718Ao/ec+4hVUcR6ABHFdnAME4bMBGssSISL/H4YbqUY62P/63y?=
 =?iso-8859-1?Q?xSBvFhpEHkTezwJJoFeaqfD4RIYF5asA8oYYR13f6WFGKV8FPDwNx8Tdx9?=
 =?iso-8859-1?Q?8A0v9uYX6HQLZP81AP30agCtq9wccsTsb1hoRCKBO5IZnpzGWGz5TQhx28?=
 =?iso-8859-1?Q?Bo2GVuX8uvFVrsOKB+BClQye3yXzuv4cKub3YG67rd4Kn7nZF3AoBS2PYl?=
 =?iso-8859-1?Q?/dArhVbOtpR97idfKBpha1ervYVpLhf+c8Bt63PBFbHXzuYkdMRkI+7zfs?=
 =?iso-8859-1?Q?791pak0fZ5byhKVPpwekLZ2PhgUKrLZ1R9h4tZPvq2XVSnjDjfGUoKZxy/?=
 =?iso-8859-1?Q?cEL+OuUomECuaUd1pDea+NAklFhSa936KJOQwDsDvZp1hKa9Turpj5MxLT?=
 =?iso-8859-1?Q?i4MdU70AugJluD3kaSn9F7o/MnmtfUgWxv7wbYcOLKZFFbASb5mX9KL1L6?=
 =?iso-8859-1?Q?IC4JcGONPPttHRK6z7AynstZjnJ2vnXySAIfgP9gTRXHhvqufue6/2IV6g?=
 =?iso-8859-1?Q?SpokkFAXQO9fTsu9dzerQeLXyKAtNZ/b2tRYYOX9cDI+zhtKEh+ix3NiwP?=
 =?iso-8859-1?Q?60viqfBvD8H4RnlulVLDbgZ4IoPnyXBNhgNqRR1w9mc5FlIKRLcU5eCPaO?=
 =?iso-8859-1?Q?wALLISY07Ze0EEStzzXZ2omghWHIcJn/ICCpEA5X3LYAJ1B+m1xi5AHUrc?=
 =?iso-8859-1?Q?R5ocLT8a0EsQqSRpR8CwnNFhDMyPWOOAqouF0dUuVbE7Y+lHVJyuGKEm/B?=
 =?iso-8859-1?Q?uevhrjkuc54oSWuYurRQdA4xPQpqNUpdZEoPCb920jV2IydRpeA+M00zKI?=
 =?iso-8859-1?Q?AcUmwMyS7uocvteY3t5TieYm4P5tCU7B8p5q4UkonXBS9unswM7Ycx0vFq?=
 =?iso-8859-1?Q?Zj1Qzp87hb/9afB1RLoVOUBaXwOUphqjlgetwIePnxWytdIgPCWOqTEMAI?=
 =?iso-8859-1?Q?hBWDNUFtS9Gaau1PO30SMpPciKde5PcaT6lvl32xWwR0eIsGsUih1h5KqF?=
 =?iso-8859-1?Q?YghQJUcvrMw6fFwuBiUBMnJ6JDYssNvKGtjQJqrhp1guqJEwPH4LjwCuRt?=
 =?iso-8859-1?Q?4riY7bE2rqb54Evfgn2gZ7zW5KiXfVvk00GXWwqa5LJ/ORB9vvgq/RPYH7?=
 =?iso-8859-1?Q?Xp8xIIopZxISehhOturd05WATqEJw6vrhSwfPlqskfN9cV1W37OpBd5z8d?=
 =?iso-8859-1?Q?CSoY98T1LUR4O3C3SU0pxddWNbrLb0Yc9dZlZbpDSbaTF6xv7U0m8Nj/rb?=
 =?iso-8859-1?Q?L1hGEePbC5SLb5+hepACcNalSClSPqxMfa?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8707.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf4fb22-c487-4c0c-6061-08dd67295253
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2025 21:02:12.8767 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QoeupxuMdNHMb3LKUDSWGBDNBupcFholaU4m2lQyvA2+7N5Aj0AKd9/6tQcNSZkpuyML/0hDHmI0kYm8FqDjuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6470
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

=0A=
=0A=
________________________________________=0A=
From: Cavitt, Jonathan <jonathan.cavitt@intel.com>=0A=
Sent: Wednesday, March 19, 2025 1:13 PM=0A=
To: Zhang, Jianxun; intel-xe@lists.freedesktop.org=0A=
Cc: Gupta, saurabhg; Zuo, Alex; joonas.lahtinen@linux.intel.com; Brost, Mat=
thew; Lin, Shuicheng; dri-devel@lists.freedesktop.org; Wajdeczko, Michal; M=
rozek, Michal; Cavitt, Jonathan=0A=
Subject: RE: [PATCH v9 3/6] drm/xe/uapi: Define drm_xe_vm_get_property=0A=
=0A=
-----Original Message-----=0A=
From: Zhang, Jianxun <jianxun.zhang@intel.com>=0A=
Sent: Wednesday, March 19, 2025 12:59 PM=0A=
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedeskto=
p.org=0A=
Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.c=
om>; joonas.lahtinen@linux.intel.com; Brost, Matthew <matthew.brost@intel.c=
om>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedesktop.=
org; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Mrozek, Michal <michal=
.mrozek@intel.com>=0A=
Subject: Re: [PATCH v9 3/6] drm/xe/uapi: Define drm_xe_vm_get_property=0A=
>=0A=
> On 3/18/25 10:11, Jonathan Cavitt wrote:=0A=
> > Add initial declarations for the drm_xe_vm_get_property ioctl.=0A=
> >=0A=
> > v2:=0A=
> > - Expand kernel docs for drm_xe_vm_get_property (Jianxun)=0A=
> >=0A=
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>=0A=
> > Cc: Zhang Jianxun <jianxun.zhang@intel.com>=0A=
> > ---=0A=
> >   include/uapi/drm/xe_drm.h | 80 ++++++++++++++++++++++++++++++++++++++=
+=0A=
> >   1 file changed, 80 insertions(+)=0A=
> >=0A=
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h=0A=
> > index 616916985e3f..ef335471653e 100644=0A=
> > --- a/include/uapi/drm/xe_drm.h=0A=
> > +++ b/include/uapi/drm/xe_drm.h=0A=
> > @@ -81,6 +81,7 @@ extern "C" {=0A=
> >    *  - &DRM_IOCTL_XE_EXEC=0A=
> >    *  - &DRM_IOCTL_XE_WAIT_USER_FENCE=0A=
> >    *  - &DRM_IOCTL_XE_OBSERVATION=0A=
> > + *  - &DRM_IOCTL_XE_VM_GET_PROPERTY=0A=
> >    */=0A=
> >=0A=
> >   /*=0A=
> > @@ -102,6 +103,7 @@ extern "C" {=0A=
> >   #define DRM_XE_EXEC                       0x09=0A=
> >   #define DRM_XE_WAIT_USER_FENCE            0x0a=0A=
> >   #define DRM_XE_OBSERVATION                0x0b=0A=
> > +#define DRM_XE_VM_GET_PROPERTY             0x0c=0A=
> >=0A=
> >   /* Must be kept compact -- no holes */=0A=
> >=0A=
> > @@ -117,6 +119,7 @@ extern "C" {=0A=
> >   #define DRM_IOCTL_XE_EXEC                 DRM_IOW(DRM_COMMAND_BASE + =
DRM_XE_EXEC, struct drm_xe_exec)=0A=
> >   #define DRM_IOCTL_XE_WAIT_USER_FENCE              DRM_IOWR(DRM_COMMAN=
D_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)=0A=
> >   #define DRM_IOCTL_XE_OBSERVATION          DRM_IOW(DRM_COMMAND_BASE + =
DRM_XE_OBSERVATION, struct drm_xe_observation_param)=0A=
> > +#define DRM_IOCTL_XE_VM_GET_PROPERTY       DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)=0A=
> >=0A=
> >   /**=0A=
> >    * DOC: Xe IOCTL Extensions=0A=
> > @@ -1189,6 +1192,83 @@ struct drm_xe_vm_bind {=0A=
> >     __u64 reserved[2];=0A=
> >   };=0A=
> >=0A=
> > +/** struct xe_vm_fault - Describes faults for %DRM_XE_VM_GET_PROPERTY_=
FAULTS */=0A=
> > +struct xe_vm_fault {=0A=
> > +   /** @address: Address of the fault */=0A=
> > +   __u64 address;=0A=
> > +#define DRM_XE_FAULT_ADDRESS_TYPE_NONE_EXT         0=0A=
=0A=
> Just a question, VK_DEVICE_FAULT_ADDRESS_TYPE_NONE_EXT in Vulkan spec=0A=
> specifies the address of the fault does not describe a page fault, or an=
=0A=
> instruction address. Does this NONE type in KMD mean the same thing?=0A=
=0A=
I think it means that the page that was attempted to be accessed did not ex=
ist.=0A=
Read, by comparison, means that the page existed, but that permission was=
=0A=
not granted to read the contents.  Write means the same thing for write=0A=
permissions.=0A=
=0A=
At least, that was my understanding.=0A=
=0A=
-Jonathan Cavitt=0A=
=0A=
But no matter if the page existing or not, the type of access, read, write =
or exec is always present. Make sense?=0A=
=0A=
> > +#define DRM_XE_FAULT_ADDRESS_TYPE_READ_INVALID_EXT 1=0A=
> > +#define DRM_XE_FAULT_ADDRESS_TYPE_WRITE_INVALID_EXT        2=0A=
> > +   /** @address_type: Type of address access that resulted in fault */=
=0A=
> > +   __u32 address_type;=0A=
> > +   /** @address_precision: Precision of faulted address */=0A=
> > +   __u32 address_precision;=0A=
> > +   /** @fault_level: fault level of the fault */=0A=
> > +   __u8 fault_level;=0A=
> > +   /** @engine_class: class of engine fault was reported on */=0A=
> > +   __u8 engine_class;=0A=
> > +   /** @engine_instance: instance of engine fault was reported on */=
=0A=
> > +   __u8 engine_instance;=0A=
> > +   /** @pad: MBZ */=0A=
> > +   __u8 pad[5];=0A=
> > +   /** @reserved: MBZ */=0A=
> > +   __u64 reserved[3];=0A=
> > +};=0A=
> > +=0A=
> > +/**=0A=
> > + * struct drm_xe_vm_get_property - Input of &DRM_IOCTL_XE_VM_GET_PROPE=
RTY=0A=
> > + *=0A=
> > + * The user provides a VM and a property to query among DRM_XE_VM_GET_=
PROPERTY_*,=0A=
> > + * and sets the values in the vm_id and property members, respectively=
.  This=0A=
> > + * determines both the VM to get the property of, as well as the prope=
rty to=0A=
> > + * report.=0A=
> > + *=0A=
> > + * If size is set to 0, the driver fills it with the required size for=
 the=0A=
> > + * requested property.  The user is expected here to allocate memory f=
or the=0A=
> > + * property structure and to provide a pointer to the allocated memory=
 using the=0A=
> > + * data member.  For some properties, this may be zero, in which case,=
 the=0A=
> > + * value of the property will be saved to the value member and size wi=
ll remain=0A=
> > + * zero on return.=0A=
> > + *=0A=
> > + * If size is not zero, then the IOCTL will attempt to copy the reques=
ted=0A=
> > + * property into the data member.=0A=
> > + *=0A=
> > + * The IOCTL will return -ENOENT if the VM could not be identified fro=
m the=0A=
> > + * provided VM ID, or -EINVAL if the IOCTL fails for any other reason,=
 such as=0A=
> > + * providing an invalid size for the given property or if the property=
 data=0A=
> > + * could not be copied to the memory allocated to the data member.=0A=
> > + *=0A=
> > + * The property member can be:=0A=
> > + *  - %DRM_XE_VM_GET_PROPERTY_FAULTS=0A=
> > + */=0A=
> > +struct drm_xe_vm_get_property {=0A=
> > +   /** @extensions: Pointer to the first extension struct, if any */=
=0A=
> > +   __u64 extensions;=0A=
> > +=0A=
> > +   /** @vm_id: The ID of the VM to query the properties of */=0A=
> > +   __u32 vm_id;=0A=
> > +=0A=
> > +#define DRM_XE_VM_GET_PROPERTY_FAULTS              0=0A=
> > +   /** @property: property to get */=0A=
> > +   __u32 property;=0A=
> > +=0A=
> > +   /** @size: Size to allocate for @data */=0A=
> > +   __u32 size;=0A=
> > +=0A=
> > +   /** @pad: MBZ */=0A=
> > +   __u32 pad;=0A=
> > +=0A=
> > +   union {=0A=
> > +           /** @data: Pointer to user-defined array of flexible size a=
nd type */=0A=
> > +           __u64 data;=0A=
> > +           /** @value: Return value for scalar queries */=0A=
> > +           __u64 value;=0A=
> > +   };=0A=
> > +=0A=
> > +   /** @reserved: MBZ */=0A=
> > +   __u64 reserved[3];=0A=
> > +};=0A=
> > +=0A=
> >   /**=0A=
> >    * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEU=
E_CREATE=0A=
> >    *=0A=
>=0A=
>=0A=
