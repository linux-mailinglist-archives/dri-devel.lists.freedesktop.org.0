Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 456E5A71054
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 07:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E896010E555;
	Wed, 26 Mar 2025 06:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fh2KNIUP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2653010E2B9;
 Wed, 26 Mar 2025 06:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742969012; x=1774505012;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zZhoIwFCz8Y8qD+98i0XcbZEN3clk7vmMNx0gatLmcA=;
 b=fh2KNIUPcRjKnC9IKTVeQkUYvfCgI8iCVEn+YP9KrLlnxk+L58qKK172
 waqdIpyjaaWg9gppu16/ZyftFCd4MijqYapHTKcEfapbpRryDBhHqAypE
 M2jxkwIHp2rb+M2r7E7aqeMpwwVDNqgib90N2V8qqLXSUEPU/BUfmPq8l
 qzNlBWto9FkjPVrmCx3NQmSF2sBX59w+s3vTvt8nBHenwu1/OVhlMMkfe
 GHifmgC0cU+MQbUw+foF/Cz89QxZuF5rs6ICdE9L8h5QghcY/C+xdpDUG
 0Q+EDIvGuvPYROzTkID54vu1kzOLlG4lvmRs3wNBdU83QgJS51uYL49GK Q==;
X-CSE-ConnectionGUID: gdyS148hTGuGc6sAgylKew==
X-CSE-MsgGUID: U8SrEYEwTfG+kahfr2ggIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44119256"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="44119256"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 23:03:31 -0700
X-CSE-ConnectionGUID: zrrQFT/SSWSpdfL5f2MFCg==
X-CSE-MsgGUID: BMUZD87dSqi85hVXIos2gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="125175535"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 23:03:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 23:03:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 23:03:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 23:03:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYzDhmHFBz3V40HsDaI3zGW+1wveS9u4tzy0XZZt7OMH1b63w0fenahXH8UCjzKiNFe80pZ4GhDK2sUe3BqaMP6YZXMhyxYVHW1DMvOlwCcuy91naDN33aNlF4WTE7ehs0H8PLawgBI+EptS8RFlfUQtq4EUyJTug4/Whc5mgmGZLNkXjO9S3Dl3+f90V9uTVJkIWFncqEXUI0AUMfFOTUuceOA02Y8+q8tu9Kp9fqXMMtHky3WlFh1j3BQML9Mhg/xY3YVUXiWPF3MGb0vsMtA4xi/NpgZwyrRzmNcxYL+c1sJeoGlIT+KA8Rnql4L0bKFtJdxwjp+KGHMCSnKQrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMbQ9/HR+yfwQWbdH50p4oyiiseKQQCvJKf8JBFH3yw=;
 b=qJsj3sMT7BUpXujT0SXWYOYfDF1no04MZRJVJTr8KukgjvFbTxlN5n2BxEuFPEoTeXVKvz+fH630X84Dxw3azWRNs83VZSqvIKciVmkDzP0ZMOoDmnCY31wznSmLpvXnp1bKXGJBSPX3KG7ERKGBgJazReh7bE08rRGvvk/vjzuMtqHZhJKwCuFAqkyj7FeQCZ33FGyRGQuC3OW65tKKKRDFFrcCklvyTgfbQPjfUTI2o9HR963fgxkeKBtOHWAEeIBCSUhSPike63sPxXYBfme2twqmF2kLJ2GPKvUsT2jRE1l1XbbgaiJa62QYYNe02HvGIzATm6sOt8eMOvl2oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by LV2PR11MB5973.namprd11.prod.outlook.com (2603:10b6:408:14e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 06:03:27 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8534.042; Wed, 26 Mar 2025
 06:03:27 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "alex.hung@amd.com" <alex.hung@amd.com>
Subject: RE: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Thread-Topic: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Thread-Index: AQHbcZ6G7w9j1lfJu02jbAwOIME0fLNLZHIAgAFIb4CAALFTgIAAw7qAgAJZP4CAEMRZAIAAGCkAgBlP9DCAAWiDgIAJMiMA
Date: Wed, 26 Mar 2025 06:03:27 +0000
Message-ID: <IA0PR11MB73070374E14C44DA1C7EDFA3BAA62@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-1-871b94d777f8@intel.com>	<20250217120808.708b9b4d@eldfell>
 <c423efcb-5ab8-41c2-af0a-621007c6175d@intel.com>
 <20250218181819.11ca41ab@eldfell>
 <cd095fd7-3043-402a-9e21-c0c85c53f8e3@intel.com>
 <20250220175047.412ee8d4@eldfell>
 <95a3e35d-2c5e-4861-b7bf-f38815a44e14@intel.com>
 <20250303112010.469b9685@eldfell>
 <IA0PR11MB7307CCBB82AF958121A6B3A9BAD92@IA0PR11MB7307.namprd11.prod.outlook.com>
 <20250320112309.1d9c3e09@eldfell>
In-Reply-To: <20250320112309.1d9c3e09@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|LV2PR11MB5973:EE_
x-ms-office365-filtering-correlation-id: 53748491-a233-4149-80eb-08dd6c2bed1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?XGx8e4CVmX55/rpzKs9pXpBYr7RFFRenbIOpzB5ujOdRgwy8Igygejuzof6M?=
 =?us-ascii?Q?TwHDkLT3GZmEeAXaUfMwVMNRS+D+LAqssvYD8OK3md5vfQUgF4efnGxaAyJK?=
 =?us-ascii?Q?sxlSjwMTA4UrCqDfn0Lcj1cUTMnLE6jp0QdjKttXMg7qAffdjGn9sqZnrkt4?=
 =?us-ascii?Q?HbZpPFyLlpJTgSqnr9A6cv4UzCBnzQYvm8v1LZUy6SzNockH2dz8KkeHGb8L?=
 =?us-ascii?Q?Fl8ughPXD2y/YhjMiEV+SmwnacHPV856F70WfiQzJUYM3MLWZTyQyChRWApe?=
 =?us-ascii?Q?iVQ1DM51k6G9Ei1TISFFG+xiUCd+hots0HMYunQHxGd77+2Q94xFCR1ZQnMd?=
 =?us-ascii?Q?JwDYjDgeMsk12f0xBnHJFM8hvYwzWOxNGoMjxJ6Kxa+8+rOh/IFNv/qIXIgA?=
 =?us-ascii?Q?ZLLrXfhk3lbOc+PvkJqF8TdyC8SHXpxSjJ05QZthrrc8+Ag0uxHuQ3Uw6A41?=
 =?us-ascii?Q?M0nGz70p18F4OSLFdnd/IuuAID79tf+3+Q/YulW1mbE94isJf5CuS0orhoQd?=
 =?us-ascii?Q?NjlG12+pL5SWxydTCcWqvvCfMrnqtrLPDfaj4fa7XeCtJGzKvK6x/welIZvg?=
 =?us-ascii?Q?xKVwLSv5cD3umHkJDd3DAeZ8hcDtKOftVRG5Z0kDGU9kXXDeNGGPpgL5DKjv?=
 =?us-ascii?Q?2uBuCeCUtG/xFsCw89y7522FVuhtGigAsogwqFTL+hIo9ahcfpDrzolT/QRo?=
 =?us-ascii?Q?uQV3G1CKYT8PmgCPhNtusHqWmKp988KLT7YbxHw2BeteMeMXw0GSN0sqW10V?=
 =?us-ascii?Q?u6iGR36jA0e1H8/wWBqdS1LFsgxGVoaU49CegxAcpuTGnP4gPrgiaMgEGFoa?=
 =?us-ascii?Q?mMuV9yFrMGWB7jiKFBwomjLuzEazmMmcImartaRjIx/2I6zZpmrFCTaJcNyG?=
 =?us-ascii?Q?ujSjyQOTBjnb0ebuQw/bexLIta4JaACbSHJf8dpN+8HePk7ZnF2IHFY0bbvR?=
 =?us-ascii?Q?waLY38Tg6hdl6C3PMkOCDKaf7csRqglrY4LoSHjd+2iB9yR0JfW1aslEtRPI?=
 =?us-ascii?Q?dw6yJWDaIv+VnAwGeN9ZHRFw4b4XZtOUB+i8Z569IhdgJw5FGunR8K5o6xt8?=
 =?us-ascii?Q?8rZw0xy0b91GLC7qCtoEzjNQq/646ysjhI/PyPN4l3QLDzh+cHvuGJOUjicm?=
 =?us-ascii?Q?OAVurO4QKHXPULtOOWtIQNS6l2Z28clGMp0B3M6VSsk6b7qOiFOFtyNYzuET?=
 =?us-ascii?Q?WekEzwo4lQ8MgOaRjLtE84XRlGQ+bLdjBD5v8V2NxSySFTdWycL4OGF/6PZX?=
 =?us-ascii?Q?AgMwIwpjcKPEVuPSB2qmuLck5N9K6xGsdhf+DYX4fXEFWVVj/2JVuY68rgYp?=
 =?us-ascii?Q?Pn+B++v2R/JIXgh8X1n6RnVVloN+HV2nGDLW35QnsrMxcgpV+g4jQNlp3QXP?=
 =?us-ascii?Q?sCbqzWAqxxLwGvoUOSsgSMiSOm8uzPXNose/QisYyGh5ZhUBkn4q8cQIeBnI?=
 =?us-ascii?Q?sGtoudI52FT9LTSzIUChIiqLc5M5B9Wb?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nzjq8Fr2BBXXGJB4+HB+A+9+n8SnYqMHm+/8kwNBHHETbo/3JK2YmYVFnSJ8?=
 =?us-ascii?Q?LnuDzDqXPb7kgeGomMSN2o1rM3K7OsjsrPKwarmAfrZSQ8a6f/V93/MUoVmx?=
 =?us-ascii?Q?T3n9g6EWyPVCmQkVFMQ8zDtwxE8e6hLllB7q2+sHQv95WflDHrR5yc8zDIOj?=
 =?us-ascii?Q?mGokfY/ubAZeGCcJn+BFLBhIT3H1C1mK62w3OlXU0ARfa7h1aARRqC9r8A01?=
 =?us-ascii?Q?waYdEKOhbPofl7+On3Vvk9t2LeE9n5xcva5/WKklEO47NusO08M0VVCgKi3Y?=
 =?us-ascii?Q?G/vqXQWCARRHrSP2S8bPisYYP2QinFdD2G+55b5fJqV5G1ANtmcfYibAyTHU?=
 =?us-ascii?Q?1IXJZTnR31BGBF/6No2XKyG+ZKPt0i/tmfV/a/l/VtHnVE6ZUsd6Wz3yYFJ/?=
 =?us-ascii?Q?qW9SGL2C9DoFI/8O/ItzBk4+Mvi39NtjFH2SL6Cb2d08bYYWeMbcZKbJ9AzN?=
 =?us-ascii?Q?2sixSy5gYlZiJvT3Ll558vOVvUCD7AqsCoPfHmV63zA+ABBPKNrSeXvZSA4M?=
 =?us-ascii?Q?SU33u3Nt3UdwSAYk5DLzoLOlGFWo/WIpBDswVfLwPg6Q8RVQpfRiZsnF3sBF?=
 =?us-ascii?Q?VqqKHeHEqPF05YCeo1hijgsS8n1OUPMTBrQaT/wwwEebN+obrRltL84+PpRJ?=
 =?us-ascii?Q?o1p5p+rwBoaSMXIID1sSqHinyBjZ1r9VkZqoG3BJalW5b6Ul/XcDwuKyeURp?=
 =?us-ascii?Q?Xf53hJAsaCXVwnDMlk6ldhxQCBFUmng0Y+vBF4l3oj6uBG7t+aDGvYn9kVGP?=
 =?us-ascii?Q?6AKamI307y+/JRaqRQI16wL202UMMDqVcCHzEI8EbIy2E+8My+u5GPzANHyv?=
 =?us-ascii?Q?yaqsIcNj8v2g8IyvBMgAC6YxRMA9VWt+yi+radd+V566M77qnIYvve+ZiZfn?=
 =?us-ascii?Q?UnOCbzIX55oLdNbas/L1z5YPJG33HhwF9J42f9FgVpABmsrIg/f1iE4KDY2A?=
 =?us-ascii?Q?HzuKf9thmU9AM0svCXAEqAwvLgECH4HDggL5qrnticKf31RtabLdEJZu0X/m?=
 =?us-ascii?Q?yXEWTJNJEhACMCrCI7vgMbVYZgtv9FQYE++Wxf4vuQSeNFNUtt0VQyQbe3zx?=
 =?us-ascii?Q?7G8i4ttXmCKl/fY4if88DTw36qFukKR6rXCOg0Wj8Th3f93XqQcfZ3jh+hnp?=
 =?us-ascii?Q?IYkTgBY90sCIzuQnor7+is21W3/p5A/PoiCxfB8Owc9t19dn1aTDDuiTxx9n?=
 =?us-ascii?Q?fnU+pm29J++e6rQH4tNAu1TL/IzwNknBleeIjGsESEOisZ88ztBWjP35R3bf?=
 =?us-ascii?Q?4dxcConQ8Diud8LIkzqEdMBnRLQY4lwJg7/6Vm4I/gnqy+IdSZ0OVmRYpSSJ?=
 =?us-ascii?Q?dduBMawt4PTGoHtcBBNwBDUY468kovbA0ueSiaIrS1HPPoG562Nmj5+ljw/G?=
 =?us-ascii?Q?WUA8/jw60vzE+P5s7KxpRt64LHkA8L7f8GA1629ES2QBluzF031CH1SIgwL3?=
 =?us-ascii?Q?6TDADWQpeOLc+o/Blg66Ttx363kiB3ayreM++MvAMXg63vR5J4nBylbcSjWE?=
 =?us-ascii?Q?vRbAOnYZC03ZISFwilfEbHVv4VWfYn5e5i/JhAYKeK1xJvpj+K63BWEDGU98?=
 =?us-ascii?Q?2R3LTOhzzVW3QNTrrrdwEsK2EWg0NG0Vf76hcxv+j1KPD+2hbrmiUQViorY1?=
 =?us-ascii?Q?/KPyJCksus/0iXO/z6j9QJMiVo0fVWqdmN2MFv3q5oRA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53748491-a233-4149-80eb-08dd6c2bed1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 06:03:27.3507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jqjIb6XQmxBFLaBlMIYaIoNBV0lP4+eoWcrCn7f5bz5yxh1Ehg2Yhsmlv0xvu7JX8vORHzEfDtZ9NWlobou6VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5973
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

> On Wed, 19 Mar 2025 12:08:15 +0000
> "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
>=20
> > > On Mon, 3 Mar 2025 13:23:42 +0530
> > > "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
> > >
> > > > On 20-02-2025 21:20, Pekka Paalanen wrote:
> > > > > On Wed, 19 Feb 2025 09:28:51 +0530 "Murthy, Arun R"
> > > > > <arun.r.murthy@intel.com> wrote:
>=20
> ...
>=20
> > > > Hi Pekka,
> > > > Sorry got getting back late on this.
> > > > I totally agree that the UAPI should not be any hardware specific
> > > > and have taken care to get rid of such if any.
> > > > Here we are just exposing the histogram data and what point is the
> > > > histogram generated is out of the scope.
> > >
> > > It's not out of scope. Understanding exactly at what point the
> > > histogram is generated in the KMS pixel pipeline is paramount to
> > > being able to use the results correctly - how it relates to the frame=
buffers'
> > > contents and KMS pixel pipeline configuration.
> > >
> >
> > While working around this comment, it looks to be quite challenging to
> > address this comment and agree that this will have to be addressed and
> > is important for the user to know at which point in the pixel pipeline
> > configuration the histogram is generated.
> > I can think of 2 options on addressing this.
> >
> > 1.  Have this documented in the driver. Since this can vary on each
> > vendor hardware, can have this documented in the drivers or ReST docume=
nt.
> >
>=20
> Hi Arun,
>=20
> this is not acceptable in KMS, because it requires userspace to have code=
 that
> depends on the hardware revision or identity. When new hardware appears, =
it
> will not be enough to update the drivers, one will also need to update
> userspace. There currently is no userspace "standard KMS library" to abst=
ract
> all drivers further, like there is libcamera and Mesa.
>=20
> > 2. Maybe have a bitmapping like we have it for histogram_mode. Define
> > user readable macros for that.
> > Ex: CC1_DEGAMMA_HIST_CC2
> > In this case histogram is between the two color conversion hardware
> > block in the pixel pipeline.
> > This macro will have to be defined on need basis and define a u32
> > variable for this bit manipulation.
>=20
> This one still has problems in that some hardware may not have all the no=
n-
> HIST elements or not in the same order. It's a better abstraction than op=
tion 1,
> but it's still weak.
>=20
> I can see one solid solution, but it won't be usable for quite some time =
I
> suppose:
>=20
> https://lore.kernel.org/dri-devel/20241220043410.416867-5-
> alex.hung@amd.com/
>=20
> The current work on the color pipelines UAPI is concentrated on the per-p=
lane
> operations. The idea is that once those are hashed out, the same design i=
s
> applied to CRTCs as well, deprecating all existing CRTC color processing
> properties. A histogram processing element could be exposed as a colorop
> object, and its position in a CRTC color pipeline represents the point wh=
ere the
> histogram is collected.
>=20
> That would be the best possible UAPI design on current knowledge in my
> opinion.
>=20
Yes this would be the best design, but looking into the timeline for this C=
RTC=20
color pipeline can we proceed with this as in interim solution.
Once we have the CRTC color pipeline in drm, will rebase this histogram to
make use of the pipeline.
We can also take up the crtc color pipeline and will also start contributin=
g
to get things faster but since there is not timeline defined for that activ=
ity,
would it be viable to go ahead with option2 as in interim solution?

Thanks and Regards,
Arun R Murthy
-------------------
> Btw. this applies also to the image enhancement processing element you ar=
e
> proposing.
>=20
>=20
> Thanks,
> pq
