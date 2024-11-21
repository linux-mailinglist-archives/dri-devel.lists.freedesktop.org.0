Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0ED9D4E64
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 15:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0856910E96C;
	Thu, 21 Nov 2024 14:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IRbO21ty";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7327B10E96C;
 Thu, 21 Nov 2024 14:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732198423; x=1763734423;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=171HdvQ2dAbywpIf1Gd7ysK4zPEB2Yo3TPYjH+myX7c=;
 b=IRbO21tyzwZrSsNoWjzAIk8KCX6r/8w29/+b7nYIoZ5n46F4bXY+YOsk
 fjXieK4mcolysRVi5b10KFxA14XZpM8jXeYlYxhq61r3Oz8lSLemXWRqw
 5ygprwpcjHnISj8hU+vytoHu3DQksPO2ANdiM1mgQvWJ30Vn2jRg27loD
 cfCeLAdDD45vjSUeA/BQXjrdTkKSL95tLETDGS+Aff7Xb5ejm8TAmlQEM
 8T51yCDrurMrHyk+wfNrKU2fa6PIaD4yn+0UXt+wjeiUE3Vgx4NOuvtcn
 w4rDFErbRAincubRW6PmzBIR452Xx7x+QoVu1nYmAXY9JnDVnAMvNSKXy g==;
X-CSE-ConnectionGUID: 4Mn3j+UyRWyJ4cY9vmAIJg==
X-CSE-MsgGUID: NNX7SRP1SF+IisbVt2EIGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="35978234"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="35978234"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 06:13:43 -0800
X-CSE-ConnectionGUID: mQ9HXhFwTNGq5ByDSpNS/g==
X-CSE-MsgGUID: CNpSVDq6RiynVUkCmV6Y2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="95070158"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 06:13:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 06:13:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 06:13:42 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 06:13:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwLUuqKp7ihO1Tb+MgzGe+M9skqM1tU1Grmo2BmRX5M76H1h67SHbiUYExHdvcvLIfhpoaDnAKvbr5C6Akfsm51bTIGT5d+F9GzZOz7t3LTnLMMcyzWrNg1S5LNV7+WEw/cRg2i5w4HyC6cQGd1mYx38+Y8X8SFWolx02+OGq8UrExcDxB8w3AEZY3qjV7zunEqXFqKgEgn4zQWCLm5yhlEQdBd/+4E0Blecg/3F3WOmWBUiicHPQ7OFaNgiz2jiKC+WDA8W3FMDxiGL7WUc7USNcLgWJfKhtZLVLAhGt6GQYL8lgALlarho+KGRM10gF4g7+wnTPRs3ajR8PVZBPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5cJlM1bDi3mh/zKjKetumQehaqgAEYj0GpIRlKNQ1k=;
 b=y4MgLyxnAY6vnBg1Cpy/ogQqdNAr+WDAge9+fZkbzWlaLx7D/oNHdhsWVrGw8goxPHBu1lX1onhRR3PE/Av0k6laAgM0izYlXsvatsxk5rkmIvisZbfW6yCW28Yv/FhkwSrVebz0+1LWvyLcBOiorGyg4s5k+E0iJ68yzFnJATI3vIuG5G1EuOmOzBwrfZO9ySFw6WkdrOpZBEhgV9gDymXPBbeV6PKcTLKp+tEYVBHQwWoDpESP53+hGnQs//0JQb2cuxbRNxOvpDFtPw7t5bfQHcB4ubRdH9EPxmx/HCzH/pDJL2KY6jUeH6wtRKj7fMvm6xdqJTDA8Tsp6ThHDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DM4PR11MB6191.namprd11.prod.outlook.com (2603:10b6:8:ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Thu, 21 Nov
 2024 14:13:37 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8093.027; Thu, 21 Nov 2024
 14:13:37 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Daniel Stone <daniel@fooishbar.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 0/8] Display Global Histogram
Thread-Topic: [PATCH 0/8] Display Global Histogram
Thread-Index: AQHbPBHssuyKRGmnA0mTqaAmmIQblbLBvacAgAAHURA=
Date: Thu, 21 Nov 2024 14:13:36 +0000
Message-ID: <IA0PR11MB7307CCA5E7BD8647E2481BC7BA222@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20241121122603.736267-1-arun.r.murthy@intel.com>
 <CAPj87rMKYLe+dvwsSYYFm8BZC2X+S8XBMv-VRt0djnj1GqRgnA@mail.gmail.com>
In-Reply-To: <CAPj87rMKYLe+dvwsSYYFm8BZC2X+S8XBMv-VRt0djnj1GqRgnA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DM4PR11MB6191:EE_
x-ms-office365-filtering-correlation-id: 3265b09a-bdc7-4916-285f-08dd0a36b0eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?V+xX7z4McI3de+O2cHj4ssaxwMUS2htXYecNH0L9xK4rPe3mXe+9yD//dU+z?=
 =?us-ascii?Q?Xmob/g9MxZpW5QMloJJwLW4xo3MTwjfrJeBUwMCNOMXg6mkrMncnevvsqnmJ?=
 =?us-ascii?Q?dhSpEBgHgmgbaslE8poONe8tMQLSjAUyItJyMzz30xtujwzyRH/4nxnckX3k?=
 =?us-ascii?Q?crMSmGG1fqw2xkrgQk2iq2Mf2INsM4RkysxcXSg5uqc2hbRRX6ShUnOZmjQP?=
 =?us-ascii?Q?p4MglNOf20wGeZ8Z0gsIW+mtXlyhL0rqFc+lUbsqdGXk6XvZDAGYm1k3FcGZ?=
 =?us-ascii?Q?pm6v3TLlW6WxTs5RNeoSeCTpj7aqV9GIxXLqdfGddnncMosUhPwzHSyl0nzd?=
 =?us-ascii?Q?dOFV8ek4ubaPISSLZY55tElQlF3r2kxmMbSpBaycwYnJAm3MPKiMX8u0n8le?=
 =?us-ascii?Q?ugLGZG87jNvG3R4qZ5WYyR9CrRvFT+/vJ8UhEtBemvxija27JcY5/ChdeXbJ?=
 =?us-ascii?Q?/C7YP20jDiI2W+63QjUfjNBQFNK+k7pU8IhhhLs2KlyhaPWewWtABOCzfLIW?=
 =?us-ascii?Q?kSjfYKWINpcV0300ZYCUkT42BOVGWLqXq7z8v+0XQEk5qoFF3E0bsORduyJG?=
 =?us-ascii?Q?GeAIBDtL0P9KMfxYQcbTcYXHYBbTMG7KzWUQf9CTGeQ4hlsqcc5IJihB3ESC?=
 =?us-ascii?Q?W2aR9bLqIVDHMBlTjaVNw957eNnxjIIjuo4b4wSw1HDE2XvErK0RWT0LIvZX?=
 =?us-ascii?Q?JUiJ2zU/6HR0XLMcMvBn8OSdJjOkmyOR2w1tTP3G6mLeHnsqeJ+DbuCOWP7a?=
 =?us-ascii?Q?x8yazKn6NMfXZuQ5eo3mFYo9zRunm93n2oGpvsTqGYrw7g1TMXfdw3sFgpHs?=
 =?us-ascii?Q?K6XhGaCVU6iAdWZPEtyzi1JjQ/h0A1VGHU9VuC4wHtBQSB+spe7uvD/8ExvS?=
 =?us-ascii?Q?PxpxtqFD588Ffj5bsZXidQQZ7q1VV5xVkiyQ9TKyXDfDmNAp59o62m9WI4T3?=
 =?us-ascii?Q?Y2bfbNMpPQiaQfa3KpEvNApPsnBc8/ttt7O+VWi7e2a0O4YFpi8j8pGwZZYT?=
 =?us-ascii?Q?5geE8/R2uk49E6UlNL9sq4yWPOAA+yCRIDmnQXevIgRYnl6Aolbb78wnKRLw?=
 =?us-ascii?Q?UpcoWy6n+zZKDMCNmpZvBWA9gyBNOqWclXBEV+vo1w4O4J/7f7UOZIz9TAYu?=
 =?us-ascii?Q?iKCU1o+HZfAtH3YKm2ZZLcaQoF6mW4D9ytOyVBqsCgukxxsdWrrmRlHFiKfj?=
 =?us-ascii?Q?lGfZipmN7BG3PgkCF/n6nQ3K/Y9lcHXQSsTc36Sjqv1iGsuHudBbYoknQASW?=
 =?us-ascii?Q?5V8AolNYEhLG6Y0UECGa2mDChDxnWScaQveS69Oq6mfK3g+bELUXABQaLlQS?=
 =?us-ascii?Q?aRJjh0TrOwNVpnFR1kR6b9FV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LPcQnCAqy5hh3Y9apSaf6pseqvpM1CDzlrDJn0EVmBroh+PnuBR1foTim9dD?=
 =?us-ascii?Q?qyuvuApK3TmpzkqD3KC77dh8wwqSl/MmoPLoQZ+LABqrq2HgdjH1ySj6K03N?=
 =?us-ascii?Q?MIniq7Udr5LD0AIHjDLaO9CbOBJFYELULH/OGXzKLfnm7fBGBlssFt1eJZ7l?=
 =?us-ascii?Q?J+ybdjpiosIJlmTMeHAMCpRqax+HmsUiiG/Qn0w/K1t5EsKjnDT9uzrc8+n0?=
 =?us-ascii?Q?I15kuJ3ohq1M7sZTrLCv58ldJaWPGa4tVtMOuu0qlx/KzJy5P+rJcZqeT6PW?=
 =?us-ascii?Q?dLPERmaPUACKw0jz+5DXBhze84Uk17U8TJAYUMMUM6TnmS2Y32f0TEHwVfEk?=
 =?us-ascii?Q?vT0asWW2AQiUCfhY61Xyjo1f0adl9Dl5zHxB71Gq9f3OBPVgEp8EguR2rt5W?=
 =?us-ascii?Q?LGOQ+ACCIbGlkwGrHCLs47aaTrmQXItf6YIEQFyu3a0NGU9ldsRVarbA3miP?=
 =?us-ascii?Q?mrIi1uteNa6zDGDdCdN82yvva6/uhmJTbuPzRtwOFyz4ZeM5Py7w+BhgJyOw?=
 =?us-ascii?Q?uaYL0Kfl8sVxAP8NJFPLoDD44aOQlpvNDJWkONLjwcmvpkbWOtXHgE62TQ1y?=
 =?us-ascii?Q?3zTpX8gP55SvsHO5LMnJBAkJYaa6mPexNrrN+5tgT9MutbbzgCGR/Ug27uYp?=
 =?us-ascii?Q?xP69udtDTUssIgzUElZeVAgd+9EYmobAaXFAguAa/SExdt7u/bvteBedwyw0?=
 =?us-ascii?Q?j7g9YzixPOYfZEOGWsFePKTTNQuA8QQKdodjQEylcZRXmWdAi+MZBhjKhA7G?=
 =?us-ascii?Q?d0coO2ghflBNQ7dXAzVWeyQCD7i84W48ptVT9hvvXS/m97DxcDKZzQOyTynh?=
 =?us-ascii?Q?HDI8p5qYeouDfdeGg/vMsbk8j63jKTMAaang20q0JhyLEPgghNFFX7AkuZ10?=
 =?us-ascii?Q?nK6chWNZ8kV14ak449aXq6QE0aV3r4cErXmWDBmeWQ6fHjIJ1nwgy5iicCMg?=
 =?us-ascii?Q?KKyiOIAeM7UTat7LUmoeELsTCmAhCmGs9YkANuIc2h5sWf7UEhydv4WhqJe4?=
 =?us-ascii?Q?QI1AFopNKX7wq/cU9QZ9Z+jTqv3e7ToJjOmIepAWlw/VRURRbKWmpQ953fiv?=
 =?us-ascii?Q?VDKpYzM5onJq/CJ9Ftz9eI4Cf6WejPea1WK8TErE+K4HejJEmlt3v5PDEnIE?=
 =?us-ascii?Q?+TSeHU0pSMRK9WGEl+/hG25MVjr9BxYOc17qQcYBYu1rEMrXrv+GXChNg4x/?=
 =?us-ascii?Q?UWmguURi5RDvfaNTj7wgyxGNWiCTveIMjHY2xciEl48HWh7ns6w4A7t+5tmD?=
 =?us-ascii?Q?nW2q5YZ4RnwMoVHXEf8s1eXebRJCprCVTrhIbxdNvu1sTxtuFDVTPOXyPLZo?=
 =?us-ascii?Q?M34rdMTo8OybtxgwVGiDQrqNoRZmMb5IczdKIMxUNhelNi0tbFtSFLwBhvZr?=
 =?us-ascii?Q?aXtPs5PLs/n62YaD7C4HnYbPI53qyvLRxc4IvSWzBC6UyePovEHlfLbkyQAH?=
 =?us-ascii?Q?olBgmJZ7Jmj22IBB/B81tcTXh/nofeu4J00kLEfZy4cQr4bB8hXis/IYjkc0?=
 =?us-ascii?Q?hbxfzuu7c79AYfy5xC4G9kuCnaJno64pRHVy0OWEH6UoGowoRfjON6V9739+?=
 =?us-ascii?Q?3aKU6EAktH+FHB9CYlu7Xeh1E8bKoC/gXfw4QVOMwtg4izjSzBTJNQjk1ydc?=
 =?us-ascii?Q?8BZvYwRpZTdCav5/LuaFeD9SOV7Yk66lhUaEeDWYo2jH?=
Content-Type: multipart/mixed;
 boundary="_002_IA0PR11MB7307CCA5E7BD8647E2481BC7BA222IA0PR11MB7307namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3265b09a-bdc7-4916-285f-08dd0a36b0eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 14:13:36.8881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +S+WDyiz7moPsClkWiExMb6bzL5WDGzlbOV1Furi5BsB4Xqszgj567WgZt0B7NG6kTsbjhEw+OhXb7QrlsmPuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6191
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

--_002_IA0PR11MB7307CCA5E7BD8647E2481BC7BA222IA0PR11MB7307namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

> On Thu, 21 Nov 2024 at 12:35, Arun R Murthy <arun.r.murthy@intel.com>
> wrote:
> > The corresponding mutter changes to enable/disable histogram, read the
> > histogram data, communicate with the library and write the enhanced
> > data back to the KMD is also pushed for review at
> > https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3873
>=20
> Again, the Mutter MR which is linked does _not_ write anything back to th=
e
> KMS driver. It would be much more clear to explain in your cover letters =
that it
> currently reads the histogram values and does nothing with them, and that=
 an
> expected next step is to make it write the processed values back to the K=
MS
> driver. Even though I'm sure your intention is not to mislead anyone, wha=
t you
> are writing here is not actually true.
>=20
I am sorry for that.
I totally agree that  without writing back the enhanced data back to the KM=
D, the feature is incomplete. Will update the mutter changes so as to inclu=
de the KMD write part in a day or two.

Thanks and Regards,
Arun R Murthy
--------------------

--_002_IA0PR11MB7307CCA5E7BD8647E2481BC7BA222IA0PR11MB7307namp_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Thu, 21 Nov 2024 14:13:33 GMT";
	modification-date="Thu, 21 Nov 2024 14:13:36 GMT"

Received: from CO1PR11MB5185.namprd11.prod.outlook.com (2603:10b6:303:6e::11)
 by IA0PR11MB7307.namprd11.prod.outlook.com with HTTPS; Thu, 21 Nov 2024
 13:44:17 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by CO1PR11MB5185.namprd11.prod.outlook.com (2603:10b6:303:6e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 13:44:15 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8158.021; Thu, 21 Nov 2024
 13:44:15 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCHv5 2/8] drm/i915/histogram: Add support for histogram
Thread-Topic: [PATCHv5 2/8] drm/i915/histogram: Add support for histogram
Thread-Index: AQHbPBH6UXfbewPm/kaGyIoJSho07bLBvsMA
Date: Thu, 21 Nov 2024 13:44:14 +0000
Message-ID: <SN7PR11MB6750046B3BFA76FE597C4E57E3222@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241121122603.736267-1-arun.r.murthy@intel.com>
 <20241121122603.736267-3-arun.r.murthy@intel.com>
In-Reply-To: <20241121122603.736267-3-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Exchange-Organization-AuthMechanism: 04
X-MS-Exchange-Organization-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Has-Attach: 
X-MS-Exchange-Organization-Network-Message-Id: c7d8659f-d5c1-4496-67c3-08dd0a3296bf
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
x-ms-exchange-organization-originalserveripaddress: 2603:10b6:806:266::21
x-ms-exchange-organization-originalclientipaddress: 106.223.179.125
x-ms-publictraffictype: Email
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6750.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(41050700001);DIR:INT;
x-ms-office365-filtering-correlation-id: c7d8659f-d5c1-4496-67c3-08dd0a3296bf
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|CO1PR11MB5185:EE_|IA0PR11MB7307:EE_
x-microsoft-antispam: BCL:0;ARA:13230040|366016|41050700001;
x-ms-exchange-crosstenant-originalarrivaltime: 21 Nov 2024 13:44:15.0052 (UTC)
x-ms-exchange-crosstenant-network-message-id: c7d8659f-d5c1-4496-67c3-08dd0a3296bf
x-ms-exchange-crosstenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-transport-crosstenantheadersstamped: CO1PR11MB5185
x-ms-exchange-transport-endtoendlatency: 00:00:02.5542668
x-ms-exchange-processed-by-bccfoldering: 15.20.8093.027
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: 46zFZGeTNXPd+KfUMkCNaWrmsP8rXRcIMhQTi2vSCvdwIpPIcyoVpwvlzf3qTldTkOtd3biL6QaO6fBDDyvZWQ==
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: SN7PR11MB6750.namprd11.prod.outlook.com
X-Microsoft-Antispam-Mailbox-Delivery: rwl:1;ucf:0;jmr:0;auth:0;dest:I;ENG:(910001)(944506478)(944626604)(920097)(815096)(255002)(410001)(930097)(140003);
X-Microsoft-Antispam-Message-Info: G5JbO1RL1+XgoGkAMIlIr24L5kRRc8oEizQ11idFHWgpoakpx8L8CGYh6OKurmVHgy/Wvkujx4bXOHIotPnFdzDJs6S4oSEPBpNaFtyL0NGqo5vUPJKFyUjQ8tUpJZsNOxCEBxdjSUyJt1gJ8GAxxJjfEihCaYXigk3V/PshtvQVnYWLu+yH1gFvlpXMMbt6zu2+YpgFMEZGLO+LRyZicQb9idjxj5VqjNChZMD06P18Aq+e5z7bRDpOeIeN9bVHDWhVSRXZGfnI0oG/MQG4ynS4OXiMXqdz1aXzEtj7Fa37Cm8z1oZqHyFJnk652tofheDMLpirX4jGuGNl8XS+Oko3sbe2sy+MWFUIFqghv4vEfOb0gvrZSUvQaK/Wkmychr+Ez4zFDkaiTQ7pe/35ziixSv+PXqM5xLJu5GJVmiV3PjqmZKQ00VfQEsa1L79Ce4eUyvtpuAf9oPiCm6OgJsKAipNRTEvwHZqMzuetP/UpadjNFD8gMYgpEeWBsoU6hda7VLBx8btBn01d/8xLPFD99w4IEItdEzEls45DmiJjcc6pteg/r9lSB208vUZUeD90RMjuN4lnxGgX/qaOnKjT+IRYGCKFrcKNxDP5eFGHBrx94UMPWTWZ9wYP54jTLECONlYIfGO3BD6KEzzx6oHzra+82O+zThh7a0O8i2aDbQQsvc/BXkxR9gnPxAI+0Q6zUmdDCVf/Papi9+x8B/joOfc0lpTcX3zbehjNZEyFTnUIik75C3Bm03qOIumuTEVVDsKgW9MAL8WkT1oo8Fejq9dFuhePMm+0yVEvRbHYUsLP+QDGTXMZ23yH578pZ/i+ykznUcV2iMciSkHFMMp1GT18C/Mg7rRZEePOZxN5+oYPZHwbLE5p2TzEQ3/XXNQyK+D1DoRG+0kFQTggC5fUxagZyMSMEhPGK5rpia8=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQXJ1biBSDQo+
IE11cnRoeQ0KPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMjEsIDIwMjQgNTo1NiBQTQ0KPiBU
bzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBkcmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogTXVy
dGh5LCBBcnVuIFIgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0h2
NSAyLzhdIGRybS9pOTE1L2hpc3RvZ3JhbTogQWRkIHN1cHBvcnQgZm9yIGhpc3RvZ3JhbQ0KPg0K
PiBTdGF0aXN0aWNzIGlzIGdlbmVyYXRlZCBmcm9tIHRoZSBpbWFnZSBmcmFtZSB0aGF0IGlzIGNv
bWluZyB0byBkaXNwbGF5IGFuZCBhbg0KPiBldmVudCBpcyBzZW50IHRvIHVzZXIgYWZ0ZXIgcmVh
ZGluZyB0aGlzIGhpc3RvZ3JhbSBkYXRhLg0KPiBUaGlzIHN0YXRpc3RpY3MvaGlzdG9ncmFtIGlz
IHRoZW4gc2hhcmVkIHdpdGggdGhlIHVzZXIgdXBvbiBnZXR0aW5nIGEgcmVxdWVzdA0KPiBmcm9t
IHVzZXIuIFVzZXIgY2FuIHRoZW4gdXNlIHRoaXMgaGlzdG9ncmFtIGFuZCBnZW5lcmF0ZSBhbiBl
bmhhbmNlbWVudA0KPiBmYWN0b3IuIFRoaXMgZW5oYW5jZW1lbnQgZmFjdG9yIGNhbiBiZSBtdWx0
aXBsaWVkL2FkZGVkIHdpdGggdGhlIGluY29taW5nDQo+IHBpeGVsIGRhdGEgZnJhbWUuDQo+DQo+
IHYyOiBmb3J3YXJkIGRlY2xhcmF0aW9uIGluIGhlYWRlciBmaWxlIGFsb25nIHdpdGggZXJyb3Ig
aGFuZGxpbmcgKEphbmkpDQo+IHYzOiBSZXBsYWNlZCBpOTE1IHdpdGggaW50ZWxfZGlzcGxheSAo
U3VyYWopDQo+IHY0OiBSZW1vdmVkIGRpdGhlcmluZyBlbmFibGUvZGlzYWJsZSAoVmFuZGl0YSkN
Cj4gICAgIE5ldyBwYXRjaCBmb3IgaGlzdG9ncmFtIHJlZ2lzdGVyIGRlZmluaXRpb25zIChTdXJh
aikNCj4gdjU6IElFVCBMVVQgcGdtIGZvbGxvdyB0aGUgc2VxIGluIHNwZWMgYW5kIHJlbW92ZWQg
Y2hhbmdlIHRvIFRDIGF0IGVuZA0KPiAgICAgKFN1cmFqKQ0KPg0KDQpJIHRoaW5rIHNvbWUgY29t
bWVudHMgd2VyZSBtaXNzZWQgbmVlZCB0byBhZGRyZXNzIHRoZW0gYnV0IG5vdGhpbmcgbWFqb3IN
Cg0KPiBTaWduZWQtb2ZmLWJ5OiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGludGVsLmNv
bT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9NYWtlZmlsZSAgICAgICAgICAgICAg
ICAgfCAgIDEgKw0KPiAgLi4uL2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5o
ICAgIHwgICAyICsNCj4gIC4uLi9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oaXN0b2dyYW0u
YyAgICB8IDE5MCArKysrKysrKysrKysrKysrKysNCj4gIC4uLi9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9oaXN0b2dyYW0uaCAgICB8ICAzNSArKysrDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDIy
OCBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9oaXN0b2dyYW0uYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGlzdG9ncmFtLmgNCj4NCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
TWFrZWZpbGUNCj4gaW5kZXggZTQ2NTgyOGQ3NDhmLi45NzE0MWI0ZGVmM2IgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L01ha2VmaWxlDQo+IEBAIC0yNjcsNiArMjY3LDcgQEAgaTkxNS15ICs9IFwNCj4gICAg
ICAgZGlzcGxheS9pbnRlbF9oZGNwLm8gXA0KPiAgICAgICBkaXNwbGF5L2ludGVsX2hkY3BfZ3Nj
Lm8gXA0KPiAgICAgICBkaXNwbGF5L2ludGVsX2hkY3BfZ3NjX21lc3NhZ2UubyBcDQo+ICsgICAg
IGRpc3BsYXkvaW50ZWxfaGlzdG9ncmFtLm8gXA0KPiAgICAgICBkaXNwbGF5L2ludGVsX2hvdHBs
dWcubyBcDQo+ICAgICAgIGRpc3BsYXkvaW50ZWxfaG90cGx1Z19pcnEubyBcDQo+ICAgICAgIGRp
c3BsYXkvaW50ZWxfaHRpLm8gXA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaA0KPiBpbmRleCAzMzllNGIwZjc2OTguLjM1MTQ0
MWVmZDEwYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kaXNwbGF5X3R5cGVzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kaXNwbGF5X3R5cGVzLmgNCj4gQEAgLTE0MTQsNiArMTQxNCw4IEBAIHN0cnVjdCBpbnRl
bF9jcnRjIHsNCj4gICAgICAgLyogZm9yIGxvYWRpbmcgc2luZ2xlIGJ1ZmZlcmVkIHJlZ2lzdGVy
cyBkdXJpbmcgdmJsYW5rICovDQo+ICAgICAgIHN0cnVjdCBwbV9xb3NfcmVxdWVzdCB2Ymxhbmtf
cG1fcW9zOw0KPg0KPiArICAgICBzdHJ1Y3QgaW50ZWxfaGlzdG9ncmFtICpoaXN0b2dyYW07DQo+
ICsNCj4gICNpZmRlZiBDT05GSUdfREVCVUdfRlMNCj4gICAgICAgc3RydWN0IGludGVsX3BpcGVf
Y3JjIHBpcGVfY3JjOw0KPiAgI2VuZGlmDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2hpc3RvZ3JhbS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9oaXN0b2dyYW0uYw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRl
eCAwMDAwMDAwMDAwMDAuLmIyZGRhODhhODA5Mw0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGlzdG9ncmFtLmMNCj4gQEAgLTAsMCAr
MSwxOTAgQEANCj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQNCj4gKy8qDQo+ICsg
KiBDb3B5cmlnaHQgwqkgMjAyNCBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArICovDQo+ICsNCj4gKyNp
bmNsdWRlIDxkcm0vZHJtX2RldmljZS5oPg0KPiArI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5oPg0K
PiArI2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+DQo+ICsNCj4gKyNpbmNsdWRlICJpOTE1X3Jl
Zy5oIg0KPiArI2luY2x1ZGUgImk5MTVfZHJ2LmgiDQo+ICsjaW5jbHVkZSAiaW50ZWxfZGUuaCIN
Cj4gKyNpbmNsdWRlICJpbnRlbF9kaXNwbGF5LmgiDQo+ICsjaW5jbHVkZSAiaW50ZWxfZGlzcGxh
eV90eXBlcy5oIg0KPiArI2luY2x1ZGUgImludGVsX2hpc3RvZ3JhbS5oIg0KPiArI2luY2x1ZGUg
ImludGVsX2hpc3RvZ3JhbV9yZWdzLmgiDQo+ICsNCj4gKy8qIDMuMCUgb2YgdGhlIHBpcGUncyBj
dXJyZW50IHBpeGVsIGNvdW50LCBodyBkb2VzIHg0ICovICNkZWZpbmUNCj4gK0hJU1RPR1JBTV9H
VUFSREJBTkRfVEhSRVNIT0xEX0RFRkFVTFQgMzAwDQo+ICsvKiBQcmVjaXNpb24gZmFjdG9yIGZv
ciB0aHJlc2hvbGQgZ3VhcmRiYW5kICovICNkZWZpbmUNCj4gK0hJU1RPR1JBTV9HVUFSREJBTkRf
UFJFQ0lTSU9OX0ZBQ1RPUiAxMDAwMCAjZGVmaW5lDQo+ICtISVNUT0dSQU1fREVGQVVMVF9HVUFS
REJBTkRfREVMQVkgMHgwNA0KPiArDQo+ICtzdHJ1Y3QgaW50ZWxfaGlzdG9ncmFtIHsNCj4gKyAg
ICAgc3RydWN0IGludGVsX2NydGMgKmNydGM7DQo+ICsgICAgIHN0cnVjdCBkZWxheWVkX3dvcmsg
d29yazsNCj4gKyAgICAgYm9vbCBlbmFibGU7DQo+ICsgICAgIGJvb2wgY2FuX2VuYWJsZTsNCj4g
KyAgICAgdTMyIGJpbl9kYXRhW0hJU1RPR1JBTV9CSU5fQ09VTlRdOw0KPiArfTsNCj4gKw0KPiAr
aW50IGludGVsX2hpc3RvZ3JhbV9hdG9taWNfY2hlY2soc3RydWN0IGludGVsX2NydGMgKmludGVs
X2NydGMpIHsNCj4gKyAgICAgc3RydWN0IGludGVsX2hpc3RvZ3JhbSAqaGlzdG9ncmFtID0gaW50
ZWxfY3J0Yy0+aGlzdG9ncmFtOw0KPiArDQo+ICsgICAgIC8qIFRPRE86IFJlc3RyaWN0aW9ucyBm
b3IgZW5hYmxpbmcgaGlzdG9ncmFtICovDQo+ICsgICAgIGhpc3RvZ3JhbS0+Y2FuX2VuYWJsZSA9
IHRydWU7DQo+ICsNCj4gKyAgICAgcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQg
aW50ZWxfaGlzdG9ncmFtX2VuYWJsZShzdHJ1Y3QgaW50ZWxfY3J0YyAqaW50ZWxfY3J0Yykgew0K
PiArICAgICBzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVsX2Rpc3BsYXko
aW50ZWxfY3J0Yyk7DQo+ICsgICAgIHN0cnVjdCBpbnRlbF9oaXN0b2dyYW0gKmhpc3RvZ3JhbSA9
IGludGVsX2NydGMtPmhpc3RvZ3JhbTsNCj4gKyAgICAgaW50IHBpcGUgPSBpbnRlbF9jcnRjLT5w
aXBlOw0KPiArICAgICB1NjQgcmVzOw0KPiArICAgICB1MzIgZ2JhbmR0aHJlc2hvbGQ7DQo+ICsN
Cj4gKyAgICAgaWYgKCFoaXN0b2dyYW0pDQo+ICsgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
DQo+ICsNCj4gKyAgICAgaWYgKCFoaXN0b2dyYW0tPmNhbl9lbmFibGUpDQo+ICsgICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7DQoNCk5pdDogdGhlIGFib3ZlIHR3byBjb25kaXRpb25zIGNhbiBi
ZSBjb21iaW5lZCB3aXRoICYmDQoNCj4gKw0KPiArICAgICBpZiAoaGlzdG9ncmFtLT5lbmFibGUp
DQo+ICsgICAgICAgICAgICAgcmV0dXJuIDA7DQo+ICsNCj4gKyAgICAgIC8qIGVuYWJsZSBoaXN0
b2dyYW0sIGNsZWFyIERQU1RfQ1RMIGJpbiByZWcgZnVuYyBzZWxlY3QgdG8gVEMgKi8NCj4gKyAg
ICAgaW50ZWxfZGVfcm13KGRpc3BsYXksIERQU1RfQ1RMKHBpcGUpLA0KPiArICAgICAgICAgICAg
ICAgICAgRFBTVF9DVExfQklOX1JFR19GVU5DX1NFTCB8IERQU1RfQ1RMX0lFX0hJU1RfRU4gfA0K
PiArICAgICAgICAgICAgICAgICAgRFBTVF9DVExfSElTVF9NT0RFIHwNCj4gRFBTVF9DVExfSUVf
VEFCTEVfVkFMVUVfRk9STUFUIHwNCj4gKyAgICAgICAgICAgICAgICAgIERQU1RfQ1RMX0VOSEFO
Q0VNRU5UX01PREVfTUFTSyB8DQo+IERQU1RfQ1RMX0lFX01PRElfVEFCTEVfRU4sDQo+ICsgICAg
ICAgICAgICAgICAgICBEUFNUX0NUTF9CSU5fUkVHX0ZVTkNfVEMgfCBEUFNUX0NUTF9JRV9ISVNU
X0VOIHwNCj4gKyAgICAgICAgICAgICAgICAgIERQU1RfQ1RMX0hJU1RfTU9ERV9IU1YgfA0KPiAr
ICAgICAgICAgICAgICAgICAgRFBTVF9DVExfSUVfVEFCTEVfVkFMVUVfRk9STUFUXzFJTlRfOUZS
QUMgfA0KPiArICAgICAgICAgICAgICAgICAgRFBTVF9DVExfRU5fTVVMVElQTElDQVRJVkUgfA0K
PiBEUFNUX0NUTF9JRV9NT0RJX1RBQkxFX0VOKTsNCj4gKw0KPiArICAgICAvKiBSZS1WaXNpdDog
Y2hlY2sgaWYgd2FpdCBmb3Igb25lIHZibGFuayBpcyByZXF1aXJlZCAqLw0KPiArICAgICBkcm1f
Y3J0Y193YWl0X29uZV92YmxhbmsoJmludGVsX2NydGMtPmJhc2UpOw0KPiArDQo+ICsgICAgIC8q
IFRPRE86IFByb2dyYW0gR3VhcmRCYW5kIFRocmVzaG9sZDogVG8gYmUgbW92ZWQgdG8gbW9kZXNl
dA0KPiBwYXRoICovDQoNCkkgd2FudGVkIHRoaXMgdG8gYmUgc29tZXRoaW5nIGxpa2UgdGhpcw0K
LyogVE9ETzogUHJvZ3JhbSBHdWFyZEJhbmQgVGhyZXNob2xkIG5lZWRzIHRvIGJlIG1vdmVkIHRv
IG1vZGVzZXQgcGF0aCAqLw0KDQoNCj4gKyAgICAgcmVzID0gKGludGVsX2NydGMtPmNvbmZpZy0+
aHcuYWRqdXN0ZWRfbW9kZS52dG90YWwgKg0KPiArICAgICAgICAgICAgaW50ZWxfY3J0Yy0+Y29u
ZmlnLT5ody5hZGp1c3RlZF9tb2RlLmh0b3RhbCk7DQo+ICsNCj4gKyAgICAgZ2JhbmR0aHJlc2hv
bGQgPSAocmVzICoNCj4gICAgICAgSElTVE9HUkFNX0dVQVJEQkFORF9USFJFU0hPTERfREVGQVVM
VCkgLw0KPiArICAgICAgICAgICAgICAgICAgICAgICBISVNUT0dSQU1fR1VBUkRCQU5EX1BSRUNJ
U0lPTl9GQUNUT1I7DQo+ICsNCj4gKyAgICAgLyogRW5hYmxlIGhpc3RvZ3JhbSBpbnRlcnJ1cHQg
bW9kZSAqLw0KPiArICAgICBpbnRlbF9kZV9ybXcoZGlzcGxheSwgRFBTVF9HVUFSRChwaXBlKSwN
Cj4gKyAgICAgICAgICAgICAgICAgIERQU1RfR1VBUkRfVEhSRVNIT0xEX0dCX01BU0sgfA0KPiAr
ICAgICAgICAgICAgICAgICAgRFBTVF9HVUFSRF9JTlRFUlJVUFRfREVMQVlfTUFTSyB8DQo+IERQ
U1RfR1VBUkRfSElTVF9JTlRfRU4sDQo+ICsgICAgICAgICAgICAgICAgICBEUFNUX0dVQVJEX1RI
UkVTSE9MRF9HQihnYmFuZHRocmVzaG9sZCkgfA0KPiArDQo+IERQU1RfR1VBUkRfSU5URVJSVVBU
X0RFTEFZKEhJU1RPR1JBTV9ERUZBVUxUX0dVQVJEQkFORF9ERUxBDQo+IFkpIHwNCj4gKyAgICAg
ICAgICAgICAgICAgIERQU1RfR1VBUkRfSElTVF9JTlRfRU4pOw0KPiArDQo+ICsgICAgIC8qIENs
ZWFyIHBlbmRpbmcgaW50ZXJydXB0cyBoYXMgdG8gYmUgZG9uZSBvbiBzZXBhcmF0ZSB3cml0ZSAq
Lw0KPiArICAgICBpbnRlbF9kZV9ybXcoZGlzcGxheSwgRFBTVF9HVUFSRChwaXBlKSwNCj4gKyAg
ICAgICAgICAgICAgICAgIERQU1RfR1VBUkRfSElTVF9FVkVOVF9TVEFUVVMsIDEpOw0KPiArDQo+
ICsgICAgIGhpc3RvZ3JhbS0+ZW5hYmxlID0gdHJ1ZTsNCj4gKw0KPiArICAgICByZXR1cm4gMDsN
Cj4gK30NCj4gKw0KPiArc3RhdGljIHZvaWQgaW50ZWxfaGlzdG9ncmFtX2Rpc2FibGUoc3RydWN0
IGludGVsX2NydGMgKmludGVsX2NydGMpIHsNCj4gKyAgICAgc3RydWN0IGludGVsX2Rpc3BsYXkg
KmRpc3BsYXkgPSB0b19pbnRlbF9kaXNwbGF5KGludGVsX2NydGMpOw0KPiArICAgICBzdHJ1Y3Qg
aW50ZWxfaGlzdG9ncmFtICpoaXN0b2dyYW0gPSBpbnRlbF9jcnRjLT5oaXN0b2dyYW07DQo+ICsg
ICAgIGludCBwaXBlID0gaW50ZWxfY3J0Yy0+cGlwZTsNCj4gKw0KPiArICAgICBpZiAoIWhpc3Rv
Z3JhbSkNCj4gKyAgICAgICAgICAgICByZXR1cm47DQo+ICsNCj4gKyAgICAgLyogSWYgYWxyZWFk
eSBkaXNhYmxlZCByZXR1cm4gKi8NCj4gKyAgICAgaWYgKGhpc3RvZ3JhbS0+ZW5hYmxlKQ0KPiAr
ICAgICAgICAgICAgIHJldHVybjsNCj4gKw0KPiArICAgICAvKiBDbGVhciBwZW5kaW5nIGludGVy
cnVwdHMgYW5kIGRpc2FibGUgaW50ZXJydXB0cyAqLw0KPiArICAgICBpbnRlbF9kZV9ybXcoZGlz
cGxheSwgRFBTVF9HVUFSRChwaXBlKSwNCj4gKyAgICAgICAgICAgICAgICAgIERQU1RfR1VBUkRf
SElTVF9JTlRfRU4gfA0KPiBEUFNUX0dVQVJEX0hJU1RfRVZFTlRfU1RBVFVTLCAwKTsNCj4gKw0K
PiArICAgICAvKiBkaXNhYmxlIERQU1RfQ1RMIEhpc3RvZ3JhbSBtb2RlICovDQo+ICsgICAgIGlu
dGVsX2RlX3JtdyhkaXNwbGF5LCBEUFNUX0NUTChwaXBlKSwNCj4gKyAgICAgICAgICAgICAgICAg
IERQU1RfQ1RMX0lFX0hJU1RfRU4sIDApOw0KPiArDQo+ICsgICAgIGhpc3RvZ3JhbS0+ZW5hYmxl
ID0gZmFsc2U7DQo+ICt9DQo+ICsNCj4gK2ludCBpbnRlbF9oaXN0b2dyYW1fdXBkYXRlKHN0cnVj
dCBpbnRlbF9jcnRjICppbnRlbF9jcnRjLCBib29sIGVuYWJsZSkNCj4gK3sNCj4gKyAgICAgaWYg
KGVuYWJsZSkNCj4gKyAgICAgICAgICAgICByZXR1cm4gaW50ZWxfaGlzdG9ncmFtX2VuYWJsZShp
bnRlbF9jcnRjKTsNCj4gKw0KPiArICAgICBpbnRlbF9oaXN0b2dyYW1fZGlzYWJsZShpbnRlbF9j
cnRjKTsNCj4gKyAgICAgcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gK2ludCBpbnRlbF9oaXN0b2dy
YW1fc2V0X2lldF9sdXQoc3RydWN0IGludGVsX2NydGMgKmludGVsX2NydGMsIHUzMg0KPiArKmRh
dGEpIHsNCj4gKyAgICAgc3RydWN0IGludGVsX2hpc3RvZ3JhbSAqaGlzdG9ncmFtID0gaW50ZWxf
Y3J0Yy0+aGlzdG9ncmFtOw0KPiArICAgICBzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9
IHRvX2ludGVsX2Rpc3BsYXkoaW50ZWxfY3J0Yyk7DQo+ICsgICAgIGludCBwaXBlID0gaW50ZWxf
Y3J0Yy0+cGlwZTsNCj4gKyAgICAgaW50IGkgPSAwOw0KPiArDQo+ICsgICAgIGlmICghaGlzdG9n
cmFtKQ0KPiArICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsgICAgIGlmICgh
aGlzdG9ncmFtLT5lbmFibGUpIHsNCj4gKyAgICAgICAgICAgICBkcm1fZXJyKGRpc3BsYXktPmRy
bSwgImhpc3RvZ3JhbSBub3QgZW5hYmxlZCIpOw0KPiArICAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOw0KPiArICAgICB9DQo+ICsNCj4gKyAgICAgaWYgKCFkYXRhKSB7DQo+ICsgICAgICAgICAg
ICAgZHJtX2VycihkaXNwbGF5LT5kcm0sICJlbmhhbmNlbWVudCBMVVQgZGF0YSBpcyBOVUxMIik7
DQo+ICsgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICsgICAgIH0NCj4gKw0KPiArICAg
ICAvKiBTZXQgRFBTVF9DVEwgQmluIFJlZyBmdW5jdGlvbiBzZWxlY3QgdG8gSUUgJiB3YWl0IGZv
ciBhIHZibGFiayAqLw0KPiArICAgICBpbnRlbF9kZV9ybXcoZGlzcGxheSwgRFBTVF9DVEwocGlw
ZSksDQo+ICsgICAgICAgICAgICAgICAgICBEUFNUX0NUTF9CSU5fUkVHX0ZVTkNfU0VMLA0KPiBE
UFNUX0NUTF9CSU5fUkVHX0ZVTkNfSUUpOw0KPiArDQo+ICsgICAgIGRybV9jcnRjX3dhaXRfb25l
X3ZibGFuaygmaW50ZWxfY3J0Yy0+YmFzZSk7DQo+ICsNCj4gKyAgICAgIC8qIFNldCBEUFNUX0NU
TCBCaW4gUmVnaXN0ZXIgSW5kZXggdG8gMCAqLw0KPiArICAgICBpbnRlbF9kZV9ybXcoZGlzcGxh
eSwgRFBTVF9DVEwocGlwZSksDQo+ICsgICAgICAgICAgICAgICAgICBEUFNUX0NUTF9CSU5fUkVH
X01BU0ssIERQU1RfQ1RMX0JJTl9SRUdfQ0xFQVIpOw0KPiArDQo+ICsgICAgIGZvciAoaSA9IDA7
IGkgPCBISVNUT0dSQU1fSUVUX0xFTkdUSDsgaSsrKSB7DQo+ICsgICAgICAgICAgICAgaW50ZWxf
ZGVfcm13KGRpc3BsYXksIERQU1RfQklOKHBpcGUpLA0KPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICBEUFNUX0JJTl9EQVRBX01BU0ssIGRhdGFbaV0pOw0KPiArICAgICAgICAgICAgIGRybV9k
YmdfYXRvbWljKGRpc3BsYXktPmRybSwgImlldF9sdXRbJWRdPSV4XG4iLCBpLA0KPiBkYXRhW2ld
KTsNCj4gKyAgICAgfQ0KPiArDQo+ICsgICAgIHJldHVybiAwOw0KPiArfQ0KPiArDQo+ICt2b2lk
IGludGVsX2hpc3RvZ3JhbV9maW5pc2goc3RydWN0IGludGVsX2NydGMgKmludGVsX2NydGMpIHsN
Cj4gKyAgICAgc3RydWN0IGludGVsX2hpc3RvZ3JhbSAqaGlzdG9ncmFtID0gaW50ZWxfY3J0Yy0+
aGlzdG9ncmFtOw0KPiArDQo+ICsgICAgIGtmcmVlKGhpc3RvZ3JhbSk7DQo+ICt9DQo+ICsNCj4g
K2ludCBpbnRlbF9oaXN0b2dyYW1faW5pdChzdHJ1Y3QgaW50ZWxfY3J0YyAqaW50ZWxfY3J0Yykg
ew0KPiArICAgICBzdHJ1Y3QgaW50ZWxfaGlzdG9ncmFtICpoaXN0b2dyYW07DQo+ICsNCj4gKyAg
ICAgLyogQWxsb2NhdGUgaGlzdG9ncmFtIGludGVybmFsIHN0cnVjdCAqLw0KPiArICAgICBoaXN0
b2dyYW0gPSBremFsbG9jKHNpemVvZigqaGlzdG9ncmFtKSwgR0ZQX0tFUk5FTCk7DQo+ICsgICAg
IGlmICghaGlzdG9ncmFtKSB7DQo+ICsgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ICsg
ICAgIH0NCg0KWW91IGRvbuKAmXQgbmVlZCB0aGUge30gYnJhY2tldHMgaGVyZSBmb3IgaWYNCg0K
V2l0aCB0aGUgYWJvdmUgZml4ZWQgTEdUTQ0KUmV2aWV3ZWQtYnk6IFN1cmFqIEthbmRwYWwgPHN1
cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KDQo+ICsNCj4gKyAgICAgaW50ZWxfY3J0Yy0+aGlzdG9n
cmFtID0gaGlzdG9ncmFtOw0KPiArICAgICBoaXN0b2dyYW0tPmNydGMgPSBpbnRlbF9jcnRjOw0K
PiArICAgICBoaXN0b2dyYW0tPmNhbl9lbmFibGUgPSBmYWxzZTsNCj4gKw0KPiArICAgICByZXR1
cm4gMDsNCj4gK30NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfaGlzdG9ncmFtLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2hpc3RvZ3JhbS5oDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAw
MC4uOWQ2NjcyNGY5YzUzDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9oaXN0b2dyYW0uaA0KPiBAQCAtMCwwICsxLDM1IEBADQo+ICsv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IMKp
IDIwMjQgSW50ZWwgQ29ycG9yYXRpb24NCj4gKyAqLw0KPiArDQo+ICsjaWZuZGVmIF9fSU5URUxf
SElTVE9HUkFNX0hfXw0KPiArI2RlZmluZSBfX0lOVEVMX0hJU1RPR1JBTV9IX18NCj4gKw0KPiAr
I2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+ICsNCj4gK3N0cnVjdCBpbnRlbF9jcnRjOw0KPiAr
DQo+ICsjZGVmaW5lIEhJU1RPR1JBTV9CSU5fQ09VTlQgICAgICAgICAgICAgICAgICAgIDMyDQo+
ICsjZGVmaW5lIEhJU1RPR1JBTV9JRVRfTEVOR1RIICAgICAgICAgICAgICAgICAgIDMzDQo+ICsN
Cj4gK2VudW0gaW50ZWxfZ2xvYmFsX2hpc3Rfc3RhdHVzIHsNCj4gKyAgICAgSU5URUxfSElTVE9H
UkFNX0VOQUJMRSwNCj4gKyAgICAgSU5URUxfSElTVE9HUkFNX0RJU0FCTEUsDQo+ICt9Ow0KPiAr
DQo+ICtlbnVtIGludGVsX2dsb2JhbF9oaXN0b2dyYW0gew0KPiArICAgICBJTlRFTF9ISVNUT0dS
QU0sDQo+ICt9Ow0KPiArDQo+ICtlbnVtIGludGVsX2dsb2JhbF9oaXN0X2x1dCB7DQo+ICsgICAg
IElOVEVMX0hJU1RPR1JBTV9QSVhFTF9GQUNUT1IsDQo+ICt9Ow0KPiArDQo+ICtpbnQgaW50ZWxf
aGlzdG9ncmFtX2F0b21pY19jaGVjayhzdHJ1Y3QgaW50ZWxfY3J0YyAqaW50ZWxfY3J0Yyk7IGlu
dA0KPiAraW50ZWxfaGlzdG9ncmFtX3VwZGF0ZShzdHJ1Y3QgaW50ZWxfY3J0YyAqaW50ZWxfY3J0
YywgYm9vbCBlbmFibGUpOyBpbnQNCj4gK2ludGVsX2hpc3RvZ3JhbV9zZXRfaWV0X2x1dChzdHJ1
Y3QgaW50ZWxfY3J0YyAqaW50ZWxfY3J0YywgdTMyICpkYXRhKTsNCj4gK2ludCBpbnRlbF9oaXN0
b2dyYW1faW5pdChzdHJ1Y3QgaW50ZWxfY3J0YyAqaW50ZWxfY3J0Yyk7IHZvaWQNCj4gK2ludGVs
X2hpc3RvZ3JhbV9maW5pc2goc3RydWN0IGludGVsX2NydGMgKmludGVsX2NydGMpOw0KPiArDQo+
ICsjZW5kaWYgLyogX19JTlRFTF9ISVNUT0dSQU1fSF9fICovDQo+IC0tDQo+IDIuMjUuMQ0KDQo=

--_002_IA0PR11MB7307CCA5E7BD8647E2481BC7BA222IA0PR11MB7307namp_--
