Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1069EAAE4
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 09:43:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225BB10E827;
	Tue, 10 Dec 2024 08:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vz8VAIuO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0492510E823;
 Tue, 10 Dec 2024 08:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733820234; x=1765356234;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ltdZaF6yr7v+nfOZ962MKyvK6p8DVRdPgt7x0DGTv3w=;
 b=Vz8VAIuOtcj26TBg7zSdCAOIEsB9iM+99dsS8g52md5Tm2vR0GELUklF
 IpmoezwwPeOD5EEhnXnSsuMFK2uBkQZHA78MR1JjYXT5v0GqJO7/Lc9Xf
 ky8gOLFqjQW4sq7vEkbWzTq/QFSKOdySZP3bn1IJVUVy2aSI5XcXLCYam
 emvCUa3bTpZ1BeQRxlnaBdXIqC0iK8esA7xd27q/ISRDyJPaldBEbnHyk
 tHC/vcRX1PitS0o8H1Y/SlZ278QedyxQIMUzdezd+e6qkmpg1N+BIV51D
 Y94NMGiJo0lqvRN2Lcz8pDRplHhw6zDkO8Yn6MBkQZ8MAolajnD0HIQIN Q==;
X-CSE-ConnectionGUID: QyH7EN7xSvqpy2Up5Xm5LQ==
X-CSE-MsgGUID: siT0WmJWS0Oe1AnAC3487A==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="51562116"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="51562116"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 00:43:53 -0800
X-CSE-ConnectionGUID: 86DnOe0mTea9BHpqHLdgLg==
X-CSE-MsgGUID: qyGwsozET8yTmQdveTnxmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="99820468"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Dec 2024 00:43:53 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 00:43:53 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 00:43:53 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 00:43:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQUHEds8TknU19Xg2SdTDRfrapLFqVIQvfqB8umCSYtrFvTOAZyMdPer2ZrBEkprD4eJHCA6fN42CjQpD8cFwxITxd34NCXhQwQwXGhd73V7TIOVOvEvxJwU04dQ/Crx0EkdjnRjsObLF7IEhXJxsJP4cTaCstTE1mwxi7Cjyu9wGS2qUwoEjrQJxehvWFcZuboV9u/5pmJnX5OpCH0vvJULtygFu+VlxuTRkhYruinJWv6KHu6TxgbP4wQvzV96mNXzF7W8cg2P0tU1azSkI6IAyXibV+ypY5FpqdBwg8UChjyXWN2dt5dg2gDqc4AOx9g7ZHNM/AJ3Gztu++7Kpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KY4PIDg7Dyh57tqDSgchq6l7UwOW0e82DSqrKLXgWI=;
 b=ywP8x+PMq1K3h2MPR5TLSOdSQvA1vhCiIIHzwhecbQJDkvSRKdUuQ9A16XqnBdA2G1C1UKovtHXEM8ZGiPZscYa18fYat7iXeC214lfgvGwJda6t8v+X4lZXqEKnh1y2oqfjtMbjbijzFqS4/6K6gnhO8u+toavMZRNCMudXHGrDBMh6MCcmUKOISfoocZEpPKphY0q1p7e5L7ZF4Rs6fPpS7c40K51Jz4VVQ0b+wIvOFHaDXT6+fY+SNpBwmrrABczkQlg7UZ2QrkgVLdg2DVIArN0984tRtovittnlTt7QIWVWdHjyCYzhQ5w7zfxTWluL8qANG2l/xpvZNkhtRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DS0PR11MB7682.namprd11.prod.outlook.com (2603:10b6:8:dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.14; Tue, 10 Dec
 2024 08:43:50 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8093.027; Tue, 10 Dec 2024
 08:43:50 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv10 00/10] Display Global Histogram
Thread-Topic: [PATCHv10 00/10] Display Global Histogram
Thread-Index: AQHbSlhLYylgsxA61UmnlF/A0HBVM7LeIkwAgAEIBpA=
Date: Tue, 10 Dec 2024 08:43:50 +0000
Message-ID: <IA0PR11MB73070C56B316C7FEA8C66D8FBA3D2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20241209162504.2146697-1-arun.r.murthy@intel.com>
 <20241209165756.GQ3224633@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20241209165756.GQ3224633@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DS0PR11MB7682:EE_
x-ms-office365-filtering-correlation-id: 5f5828ca-a1db-433e-d24f-08dd18f6c55d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Klq/H0Y2eOQAl6SUFkL58sLE/gp7vB8VbCZh4bxf+9rPtpQuwheqyuF/gp7g?=
 =?us-ascii?Q?4PhKQnHdpkQPLVawVXfBIV2gCY+IaHedPKxS9mXE5kg5a9+Tq+PMVHz8GAps?=
 =?us-ascii?Q?wIq7tojcMa9eENDsvi7wSFXsi9MJdpcHm4/JKStOejGkc62m2614+c1VsBNh?=
 =?us-ascii?Q?/HJQzJyLo7hDr5SpGFbD56s66uC/WJPwcNEn7pP4uzNBlI/6Xd9QRPAw2IJG?=
 =?us-ascii?Q?PTtbWtq6zbJ1sZlvX2NuS1s1otee4sV0/QXFk5iHED1n0OylC4If+6ls9Idf?=
 =?us-ascii?Q?s2n2ulIGIje//3wDRrdAzEksImEgcOC1sYfJYN5yjmNfl/xtxJmJiuLmaRlC?=
 =?us-ascii?Q?5KL+cj41TPHxaXZlfUhz8BH65+KfCkqleJHKt3txyAdr48vu0Y1hgVIhaVfG?=
 =?us-ascii?Q?YwfJ1b1LpMYjmQaCThmnOOA5kzoV4YnTTzBQNh65hIHJhHf2NoQPBXrR3nZY?=
 =?us-ascii?Q?fZfI/aBFBqTbuGBBtCnywaGq6I8mnobKU4QQ5C/Ko/PDEcTjStw4Qu02eqZV?=
 =?us-ascii?Q?QStQ9bWPjTAKqIAg6OCp450S16I5IK1dRpADaIVBwMLqiIFOUqUCanYmxNpX?=
 =?us-ascii?Q?RiwEhDi1U6m9yVw/0vB5mBJl6fL1i3wiimgOgQlCA13UMOpbpf5nkMbqC3n8?=
 =?us-ascii?Q?OgiXkjswlfqP+ifCbRGXgjsrhy4nwPppdbIZgVrXbZV8frpQYlG9d55rFC2Z?=
 =?us-ascii?Q?+LdH32DaneJTg02Jf+E7A8ZWNKEP2FCPI8IUuKvf4hzuu3RrgXZoLwpaFGGU?=
 =?us-ascii?Q?nCrCHdFOxnYrlKtX8ydMs4BnUSbWT6gvmCs26tEGsHBRB74o+ZxKkJ8hxZYj?=
 =?us-ascii?Q?asNUtUFIXJeoml6N17eTrnJVbZmiTmjKNi2XYBCHSyrKmzvxjZcWd0m4xDDl?=
 =?us-ascii?Q?97VcrdCDPVcGTaxF9kqTwwqJSthY0K/dhLOTZkhtHhvy6Fh81jyg5l1+aOWj?=
 =?us-ascii?Q?r0LL5pCoHnzbCh4jcsjx/vDpBvd8DLiPV7gBf3xazm7KJZkPzCjVcrln5RfY?=
 =?us-ascii?Q?wZWL/MXH0SeVCyJkjCwvw9wuvY0sWN8deBxK5D6p3CZJ5/0HcsS7FKI9pPti?=
 =?us-ascii?Q?+Gsx/9AzHLGK4W5gZOYeX1j+1QaqCUp6ZYenu7rKgdSEvacL6k0reR9CCo8r?=
 =?us-ascii?Q?vA1YKkIL0VWNssbAHuPSq2x0rWKvLEoI6YFJN143/A4hSed9TM5ypd3PUtu/?=
 =?us-ascii?Q?mhJ8jjjGWERz+UipbBn2n5U0UO7UMXXCWxoopsaHUQWyAmEgo7p40FWNdlKf?=
 =?us-ascii?Q?BOk208vHB1w/vpnSK8Hu286f6TRnkYgJcBJGgM5HwDWsVwoj/yW4Cya6RDdz?=
 =?us-ascii?Q?VSLzhlvNzr4m3blRw9KG/Yu/wYT/qNPYWytctwzepFD00axqvnVJDo0ZnZJe?=
 =?us-ascii?Q?5+T1Sfw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?J4P+LC9jAG2wQx+qCoBpRY5RSFk+vE3YsYtXOUjljEUyVwqvJhCQXcp9vcnr?=
 =?us-ascii?Q?mBax3XyjBFxbluhUVjUp8T+B4JEceaRQnWSL5dHoXvJY0UAAEVe0VgS7vRk9?=
 =?us-ascii?Q?BhprtGCO1Pj940uAxoAECm4UfE7DvuoUyLOkHqZEmRA+Yi2a6ZhCajPnf5UK?=
 =?us-ascii?Q?zkaQzqWGZ5EcJTpl89rAbx8PVa2tE5iJml90UCBDgejsu8HZ9xI1r4N8tNmP?=
 =?us-ascii?Q?yviQBvQveqa3ZMmysOEqnTl0yg7UQkarva6It4SEx/wjAFZpd6o7ZF974emG?=
 =?us-ascii?Q?1UFhkDxe2M73XSkh64Cd8Du21FVVsoMuo8P0mBi20/R5W1U21IcJDJ+/gNd/?=
 =?us-ascii?Q?YEdU3Mnc0TblELTcC/sC/1lZWtudcph/7vV+hnN1JlNuS325PsfjO/gfiH2J?=
 =?us-ascii?Q?UsAtbzpPwKHk9RmIkmgt1Sp7B1db857gQkRFL3VRqOKv5rnRNz9ZcX0wSHmb?=
 =?us-ascii?Q?SQAMSGX4YKWIn/1miGq7YMWn5tZ7Bd1zJa6TRq2hmB/1ETZWRbYpbdmlbYsO?=
 =?us-ascii?Q?p9cfk2oLQP1jEieF0GxoxPAalOXjeQK/ntVzMUrU94i5jakXP/VJJJ3jfL1S?=
 =?us-ascii?Q?vnquN4DIYjMie/sv2WEl2QcIJi/vKbQUlRT5cXo8xrl1yZslEvY03+33ZWUf?=
 =?us-ascii?Q?XmCxjAZyrBrrb7K5jQyFVl86cAwLiKmefjKcP3UTL8NeKcxRzxzbksvgrCbK?=
 =?us-ascii?Q?+NC3KEuFd8kOij6dbHddHrQN3X5FpLFcv/WFVLK/PzvZUfUMNzGWuSWL23RD?=
 =?us-ascii?Q?8QCGkiOVEGsXJXe33kuf7rhUEW2McTq0Q36URAIKnAC7ns1oq6b5Wi4u9HmF?=
 =?us-ascii?Q?1NFMan2gHnOj5qXC+ujCAPCtb9j7OsApG46+HYqeoesSkZNNfv4yH99O/1f+?=
 =?us-ascii?Q?3iMLO/3Pm/Sg/VVNKpOmjvZZGb8kldguHCPTpkCb1QZlJrw/c2YBJHIJP+qJ?=
 =?us-ascii?Q?yCQrQFgvDyz/TfF34zXgjJUcukR1BaPTmvQWBEGOdsomiKPCRq46E37UByLl?=
 =?us-ascii?Q?dHcJUZ5LBBoVzmaYYSRJjJASf4T7ysikiCMH4+XTeaagGldunkVMECXhj0v0?=
 =?us-ascii?Q?1u0fmPgdyf6hbmkECiNU8mx5ggnGWYSwzt2VP51WEg8N1i/7ZozTZ9AcyYZx?=
 =?us-ascii?Q?iUEWzrJNTdcpyiWEneLyLMJrCAedU38tPW4Cp3i/YO2QU++nQfanJQNZn+83?=
 =?us-ascii?Q?gnO9Ddox9uYOMcUjiRiChYsIHz+zqDbGBBiJlzucExc8no+O/hadLCMI/GsS?=
 =?us-ascii?Q?VHT5cuMFaHuDIHxqXbY9mOxnOAVkcQMFYzBV7TAn2eHrlB2mAGZ3j2oO549p?=
 =?us-ascii?Q?syjEwfhdWYstBw9uG+xpGDEYdJ+P9sw40XGcWKRFEacVoT2RPAv+frSoD0oH?=
 =?us-ascii?Q?qazvH9SFdi0fXLG1ORS7+92Bhwg/STgUWXTmGNepQQZRjS/FTywRYm/qU6Zu?=
 =?us-ascii?Q?sGdpAgXZyyvLRKRkSL2q0r/1mlcfmaxzNw52FHwuDtYftMJYZ0VYud+hM8Km?=
 =?us-ascii?Q?OFjeBT7hE1yl+x5c+W8qrfwE1TRyC3ZVIcHgO1thUT2Mcsg0730TzbSKUolL?=
 =?us-ascii?Q?Xc0S1hkAQkO0miyvEAq7m/VeOB5yHs0uNx/WkaLc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5828ca-a1db-433e-d24f-08dd18f6c55d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2024 08:43:50.8406 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OMQ2Y2i38Iy1gilgrFnveMxtl+9PXZQgTHWy5GltCfb3FQePoUK1oiZfxs1aZUWs+NNipBLfJ9dfLCQhNIaDmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7682
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

> On Mon, Dec 09, 2024 at 09:54:54PM +0530, Arun R Murthy wrote:
> > Display histogram is a hardware functionality where a statistics for 'x=
'
> > number of frames is generated to form a histogram data. This is
> > notified to the user via histogram event. Compositor will then upon
> > sensing the histogram event will read the histogram data from KMD via c=
rtc
> property.
> > A library can be developed to take this generated histogram as an
> > input and apply some algorithm to generate an Image EnhancemenT(IET).
> > This is further fed back to the KMD via crtc property. KMD will use
> > this IET as a multiplicand factor to multiply with the incoming pixels
> > at the end of the pipe which is then pushed onto the display.
> >
> > One such library Global Histogram Enhancement(GHE) will take the
> > histogram as input and applied the algorithm to enhance the density
> > and then return the enhanced factor. This library can be located @
> > https://github.com/intel/ghe
> >
> > The corresponding mutter changes to enable/disable histogram, read the
> > histogram data, communicate with the library and write the enhanced
> > data back to the KMD is also pushed for review at
> > https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3873
> > and
> > https://gitlab.gnome.org/GNOME/mutter/-
> /merge_requests/3873/diffs?comm
> > it_id=3D270808ca7c8be48513553d95b4a47541f5d40206
> > The IGT changes for validating the histogram event and reading the
> > histogram is also pushed for review at
> > https://patchwork.freedesktop.org/series/135789/
>=20
> I think other people have already asked this on previous postings of thes=
e
> patches, but please don't try to manually hack the version numbers within=
 a
> series.  What you just posted has "PATCHv10" on the cover letter, "PATCHv=
2" on
> one patch, "PATCHv3" on three patches, and the rest are unversioned "PATC=
H."
> The general expectation these days is that versioning in the subject appl=
ies to
> the series as a whole, not the individual patches, so this causes a lot o=
f
> confusion.  Posting like you did here also wrecks havoc on a lot of the t=
ools
> people use to manage and compare series like the "b4" tool.
>=20
> When generating and sending a new series, you should just do something li=
ke
> "git format-patch -v10 ..." so that the proper "v10" numbering is automat=
ically
> applied to all the patches and we don't wind up with this strange jumble.
>=20
>=20
Will use b4 in future.

Thanks and Regards,
Arun R Murthy
--------------------
