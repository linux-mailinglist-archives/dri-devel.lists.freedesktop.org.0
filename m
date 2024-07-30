Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D83940631
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 06:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5218710E1C1;
	Tue, 30 Jul 2024 04:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ermiyhw1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5EA10E154;
 Tue, 30 Jul 2024 04:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722312456; x=1753848456;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lym7ZDzQ2GaYQu8TBY7kyIV+G6NJ25v0wph+ucPY2Fs=;
 b=Ermiyhw1AFhRYvF20lHBDW7q2VaYwwsaHl9eKurXlTG+v81R7a4/X2mL
 IkNwAUw9fLnhSCYvIhOaBeZY8yvT+LDPJfeksR7yycoOABsOy/XqTPoZZ
 wsbsxitfPHXx2wF/gmO7k55duddGFc6sFUHqOI+n2+2mJjat9O/ke2WeM
 F8ddie3Wd80PLDs0GOdoQW6iXa81pr3X8RNpvo7JSAyyd7l1/B06h48u0
 UAoDcZPpeUECa6UfDFbkEksAsiAEbibHyB3na0qLrlSgaZXb0DP4vHe4+
 qVaoCnZ7zlIPF6llAdDtzOXztugnaovLE1qEMCe/FS6NkFFz0Kb8x+NgR A==;
X-CSE-ConnectionGUID: zlCJmUapTamGXYxhe+dF5g==
X-CSE-MsgGUID: ltFgsV+wSRGWitXfouMkDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23862806"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="23862806"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 21:07:36 -0700
X-CSE-ConnectionGUID: 9Nz58XpWRjuxzRroJRHwQA==
X-CSE-MsgGUID: oJxYC4C8Q8axRKmlP8fM1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="85142788"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 21:07:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 21:07:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 21:07:35 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 21:07:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grq6ALaxp0ZzffbstI0cAMXUCSO791n5y1kFqstd7Am1r1GrmlMn6dpGCFboR+DV5h+pVNkwhMNGBVbrRhqsljhvSnrmz4IUA5VKUB78dLcS7MijSnDBQ4wJG1UKqHlyyv+wS0kzL+QOX+uUyclYjMMSTiAX67Ei6MYLAI1D84jpyOzrBa8pOjbgJP6fmGq9aLOF0DhB74T4GTbwMZF7yExJHrVIl9/bqD7uPheLIU8YjxInni9hEOyy3bV7oUD8zS3Q0bU+g8h3gdkfSCnZxFt9tqPQsy8zKWIYKbK94l85IgEQVPyyKQFFZP2J8uJf+gZPuVpe8o24t5bglPQvrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHXXQKL3iMjqq+o9l/SxHvW/jRhy/iY7rMCztZQnCOA=;
 b=nCpjyWWE3FMqnBUHYLNbJJNLmC0eWaMs9eodQnORKeu1JJvAE3iqwhnrwzK2ELIM0KK1egN263aeoMP0+ZGCKMyYck7pbJr55x2lLmInLux0/SwU1XcV4aT+g5j5MvDuRHUMcSczHFqb2eiGcBom6N74jK2aiAyshi4h7oAJ1aBDiOWu0tOSo1Q7VUALKnVxXvJpnH8Injv7TUMeigpqld5jvSUBs8GIGBVvUE40bKe+j6zUP6rfuFgAVSXRIdLy78vitzb4Os1CQl8oBGVKiaVfsvkHAlvu8JX7B20VAqw642TMR3CmuHkxS1a4KoF3DhS1m77o/xHl/uv9ksKbIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7300.namprd11.prod.outlook.com (2603:10b6:610:150::21)
 by BL1PR11MB5270.namprd11.prod.outlook.com (2603:10b6:208:313::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 04:07:32 +0000
Received: from CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::cfdc:6323:1353:350d]) by CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::cfdc:6323:1353:350d%6]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 04:07:32 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] RFC: drm/drm_plane: Expose the plane capability and
 interoperability
Thread-Topic: [PATCH] RFC: drm/drm_plane: Expose the plane capability and
 interoperability
Thread-Index: AQHa0dWUAPOk7QcYUEWdXvrZAsOcWbINRD1wgAErt4CAAFgZkA==
Date: Tue, 30 Jul 2024 04:07:32 +0000
Message-ID: <CH3PR11MB7300ABE65A3E3DCD3CE90DDCBAB02@CH3PR11MB7300.namprd11.prod.outlook.com>
References: <20240709074656.1389387-1-arun.r.murthy@intel.com>
 <IA0PR11MB7307E4F207A125F53A23342BBAB72@IA0PR11MB7307.namprd11.prod.outlook.com>
 <jsrh2xyopzcmsi7uardklw2gfzmseq4pldj6bt6ozezhx5qqbs@epk6y7hg6ihv>
In-Reply-To: <jsrh2xyopzcmsi7uardklw2gfzmseq4pldj6bt6ozezhx5qqbs@epk6y7hg6ihv>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7300:EE_|BL1PR11MB5270:EE_
x-ms-office365-filtering-correlation-id: 6d0b2065-e01f-47ec-25e9-08dcb04d22d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?RMG4n/dvEhc0BeFWZTZk2xGCEEOoSCli0BuvB5cP/LKUu/cstYleogFyINXp?=
 =?us-ascii?Q?Vugo0bVL8xqZ/n60CQC3yuHW29wIMwiWAjBnH4rGT9b5JROLUgeVw9xJa4pR?=
 =?us-ascii?Q?RdkNXAb5OhK5y6DhaXynzbPMr3ETlgeQAQZVcqIqye1nSUFUbgg2hxN4n6zb?=
 =?us-ascii?Q?U5MC3J6x0MYzEQyCjbK/cALuIqWZ5UvRIFXc2paeRmSURIz1wQarhQfcNTEi?=
 =?us-ascii?Q?nC7T5u3EIoPdJkLk8MhvLTwYnN1wHYHfJvlt4n/EcNuAX8/CC9TGcMf/TH5w?=
 =?us-ascii?Q?rPd3PaKMsAS1AqathxVx7/Acp7hSg0/GJuMOQnw4XNLa3LYmiMgn84kdk1mm?=
 =?us-ascii?Q?vOgC888m54nTWUsrSwiB6ZW3g3ReDyitpIWNif7bqUOwEUtIks5NC7sjbZ+s?=
 =?us-ascii?Q?5tNDwaH3IrikVEyOVhseyZhT7lP/4aw8fNFrsTAwt/BkxX65B9IS6SquepQR?=
 =?us-ascii?Q?VSFooyxrfMnbUzelIKlMFyRCYqMhC167Hbl/cQDb0jYJQHDWcNNCUKGPLE5g?=
 =?us-ascii?Q?22YdylB7ZKtZEmZrnfgWsZJMkU1ykMyPVE8G/qe0GwFzx/HcO7bSbH16pfk0?=
 =?us-ascii?Q?/q9gO349RrdqPyeXT6bXM8xQHEj1YoA+jYnfBO8HrIDRo4htQI+5qyrdzfvr?=
 =?us-ascii?Q?anJrjMmuQSGEE01A3doRPS3MxAoHLnFhlNg2hhzCmByPOIZVTYaoGkWO9aeO?=
 =?us-ascii?Q?M5H9TIroRWQC1sRTX/rxkCsY0C6OH4MyIKzZKE3BRvKVb8oPbi7YyK9HJtp1?=
 =?us-ascii?Q?NkteL/SUELoKdP2qpttePbqP0OB6K37QUDOediHnj+uP2460Zk1uyAdy6brU?=
 =?us-ascii?Q?YbTZ7jTZoxy8HcMtM46Ukki/57raCO+GbaOr1ByXDuiSxSw7j3HX5vzs3YGI?=
 =?us-ascii?Q?tutboWW/gEnKVlGDeXud1i5669JdhujFeV39uEOkSw/v4Cygfq7rkZedsxQX?=
 =?us-ascii?Q?wXE2U39oy/uh6ltGz7MKk2EBct010gGP768lj2Zbo2og30lHfLriFDQ8Bg5m?=
 =?us-ascii?Q?UAe2ePzWj7bqmqLoR6v12TWEvmHUHaCPGHlVt3ltED7YgsfImDnXtBzF5LeA?=
 =?us-ascii?Q?Ssi5LixtwlrqDgulhsJQK9NbpPpYQE07mot4T32K5rEiPJ2hj8FkmeW+x4Zv?=
 =?us-ascii?Q?72bNqHgC6j2L3Lg2L042oGmH1FsnekpVCkQG385tmgbf/vIBFJ8FxQDJLNHo?=
 =?us-ascii?Q?V4BXcvgvF14ST1HnwKMbJsKg3ysMXV+3MT6soa51FMwh/+Lysw7cZPgeGY5y?=
 =?us-ascii?Q?s7W3xagKzZF/OtJC5+4JWh7xFxtsVgjZ9K9SOEITOVrps6RROd2UxiJTJOUK?=
 =?us-ascii?Q?1SqcuPIG2un9zlStwuxScP3qfU8589FNI585fnwS6fi52951bVmeQj/7eMKc?=
 =?us-ascii?Q?S4YftrU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7300.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A42H2xUps/nvA5YZPfrMPU2Wztr6vrXo7qxCxwL/5tpxYfoon1oP+W/0eNig?=
 =?us-ascii?Q?QQrGEay7rWW8GNKlXYuYZJBq540yZxtoWaWlgB6hlfqxYimEkLLVKkGxAY3r?=
 =?us-ascii?Q?L2dd3XrAewogDcC10u9xXpa4C0R8jN6IQ1DuxUgywTf+Ck2rfUfN2nEr8JKO?=
 =?us-ascii?Q?f5S2LJqNYIA/7cMnsh38/yqKZoR5zgCE/YLkLSXadEDZFXpWdAHpHODNT8J3?=
 =?us-ascii?Q?KE/mAu1w0tY5ynFVrlwxNa51bzggCDnd2uDEZMJt0C0pMl0hMv6v2u2svmYU?=
 =?us-ascii?Q?x/hP7qV/qRx7pvA9WIO5Jj8cpTDuVlYqB1c4vJsAZ9Oc5n1D8SR65nsPf5zh?=
 =?us-ascii?Q?mpiQNtAND2GVzXnIDXAauNm44rgugaVFNNqgnxsTmBvjtAbsaNKm/peXENkO?=
 =?us-ascii?Q?+bWhlv1dG6bHTsYssHxWSeZm41kgUCCB8dvFAdwjg6NNEqCW4kltjGST0Fbr?=
 =?us-ascii?Q?HeB6vbuwudkxQR/3qzfDs8pYPx9WUZKI5wc791IojMegbx0Qdr/UhdrMcaSO?=
 =?us-ascii?Q?EOsrMlOhTR4ynLJ1w0OmqcnJRZ9PrjmPjE0biWvnnOXttPyxvmdEV8EOa43r?=
 =?us-ascii?Q?7S28IXSvjUUUxQ7r8h7E9Drf8M9l3bzXy39aEwqClCBcednBKWsHU617U4mI?=
 =?us-ascii?Q?KinryA4B5diOwKpA/Dy1yUjXsAJDnJO46tUocfjuOAU9dHByt5iKgcdnTp+K?=
 =?us-ascii?Q?2J8TtG+SLeNqN9kszDeYb2KGLBKGY+1RoxWCsSl2PTeK5QIx/aaUxrzRXet+?=
 =?us-ascii?Q?nv4HY60U+9iERGMvpVhSDxnA2IkycJ+1woz0+ZrxEXH+C+vqkMrm9jPFB6aB?=
 =?us-ascii?Q?O1ENT9MW2NYps84En0olelm5fbQAMxqz6UvH/NKiLdwEK9dkwSrAbaRbxFpc?=
 =?us-ascii?Q?yQY6hApdDizox6jdC6T7mvVCEuXJ+MUOwLpkUrzq0Lu2Cgg0tevVgbRWD44h?=
 =?us-ascii?Q?u7Aq1ypPleZ4qItpBi/Krjpj78jWDAKcVZMXJcIruuAJb0DnYk0SB0YnmtTp?=
 =?us-ascii?Q?4aoN5ZoNTrlEDo2itncxbiv5RRKtz3CIPFUPrr3vRe1FoNAADKHx6WnL84WE?=
 =?us-ascii?Q?fzuVvPzeVoA/KGncl9BkVa4tajNR4kD1yg+hbovB4JIEWqOy/RaRwl5UIx5r?=
 =?us-ascii?Q?gLV4TlAU9xaTZwL2+9EdynTT6P/5wZgZAy22KpdCbFUV9TzZng+Yda5IF6tl?=
 =?us-ascii?Q?wK8LAQzPDjJTLJsbNa3rVrkhQnctSecPDdsLbOJkD6jSxDdzqptQhxqwm8jk?=
 =?us-ascii?Q?6oNOrdcUaXZgujDZmRcgGhFbapcBQUSrirhLlOP5l+NTXb8/UOkAwwVmUczQ?=
 =?us-ascii?Q?VcCxoqpaOCeWV7GYq/KezbnWByBiY2b8T2KCQyGxpBYmh0Au3nuEBuyukeSA?=
 =?us-ascii?Q?M0lbkVbz/6104Uw/0XtvTjxaM4DznYVxvE7855imfKB0CwjnbmfRFEhowhmz?=
 =?us-ascii?Q?CGLeYpKFbZvzSRLlqeqPo1TM2Gt1UR6zM220HwwdkRFdN7JUtPQ+oN91nkak?=
 =?us-ascii?Q?jz70P8+lg1AxGctaKNoxAYkmZwDFm+hoC/NxXZnmwlF6sJbTkEOAO04gbfgV?=
 =?us-ascii?Q?2X6GmY7+V0kAw4LExWWIl4UAegPspk5/NMMFcI96?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7300.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d0b2065-e01f-47ec-25e9-08dcb04d22d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2024 04:07:32.2612 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+tXzq8r7ONwnohBsxDpiMBtkkJmh2WTSGCPl69ZYQmeSmOnIPn/m2lCgmyX8FmFuKS3OcxPsUKNzNTV+w1yQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5270
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

> -----Original Message-----
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Sent: Tuesday, July 30, 2024 4:21 AM
> To: Murthy, Arun R <arun.r.murthy@intel.com>
> Cc: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Subject: Re: [PATCH] RFC: drm/drm_plane: Expose the plane capability and
> interoperability
>=20
> On Mon, Jul 29, 2024 at 04:59:14AM GMT, Murthy, Arun R wrote:
> > Gentle Reminder!
> > Any comments?
>=20
> First of all, the format is underdocumented. Second, there is a usual
> requirement for new uAPI: please provide a pointer to IGT patch and to th=
e
> userspace utilising the property.
There are some discussions on using this in UMD. https://gitlab.freedesktop=
.org/mesa/mesa/-/merge_requests/29618#note_2487123

Thanks and Regards,
Arun R Murthy
--------------------
>=20
> >
> > Thanks and Regards,
> > Arun R Murthy
> > --------------------
> >
> > > -----Original Message-----
> > > From: Murthy, Arun R <arun.r.murthy@intel.com>
> > > Sent: Tuesday, July 9, 2024 1:17 PM
> > > To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > > Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> > > Subject: [PATCH] RFC: drm/drm_plane: Expose the plane capability and
> > > interoperability
> > >
> > > Each plane has its own capability or interoperability based on the
> > > harware restrictions. If this is exposed to the user, then user can
> > > read it once on boot and store this. Later can be used as a lookup
> > > table to check a corresponding capability is supported by plane then
> > > only go ahead with the framebuffer creation/calling atomic_ioctl.
> > >
> > > For Ex: There are few restiction as to async flip doesnt support all
> > > the formats/modifiers. Similar restrictions on scaling. With the
> > > availabililty of this info to user, failures in atomic_check can be
> > > avoided as these are more the hardware capabilities.
> > >
> > > There are two options on how this can be acheived.
> > > Option 1:
> > >
> > > Add a new element to struct drm_mode_get_plane that holds the addr
> > > to the array of a new struct. This new struct consists of the
> > > formats supported and the corresponding plane capabilities.
> > >
> > > Option 2:
> > >
> > > These can be exposed to user as a plane property so that the user
> > > can get to know the limitation ahead and avoid failures in atomic_che=
ck.
> > >
> > > Usually atomic_get_property is controlled over the state struct for
> > > the parameters/elements that can change. But here these capabilities
> > > or the interoperabilities are rather hardware restrictions and wont c=
hange
> over flips.
> > > Hence having as a plane_property may not make much sense.
> > > On the other hand, Option 1 include changes in the uapi struct
> > > drm_mode_get_plane. Shouldnt have impact on backward compatibility,
> > > but if userspace has some implementation so as to check the size of
> > > the struct, then it might a challenge.
> > >
> > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_atomic_uapi.c |  3 +++
> > >  include/drm/drm_plane.h           |  8 ++++++++
> > >  include/uapi/drm/drm_mode.h       | 20 ++++++++++++++++++++
> > >  3 files changed, 31 insertions(+)
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DOption 2=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
> > > b/drivers/gpu/drm/drm_atomic_uapi.c
> > > index 22bbb2d83e30..b46177d5fc8c 100644
> > > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > > @@ -631,6 +631,9 @@ drm_atomic_plane_get_property(struct drm_plane
> > > *plane,
> > >  		*val =3D state->hotspot_x;
> > >  	} else if (property =3D=3D plane->hotspot_y_property) {
> > >  		*val =3D state->hotspot_y;
> > > +	} else if (property =3D=3D config->prop_plane_caps) {
> > > +		*val =3D (state->plane_caps) ?
> > > +			state->plane_caps->base.id : 0;
> > >  	} else {
> > >  		drm_dbg_atomic(dev,
> > >  			       "[PLANE:%d:%s] unknown property
> [PROP:%d:%s]\n", diff
> > > --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h index
> > > dd718c62ac31..dfe931677d0a 100644
> > > --- a/include/drm/drm_plane.h
> > > +++ b/include/drm/drm_plane.h
> > > @@ -260,6 +260,14 @@ struct drm_plane_state {
> > >  	 * flow.
> > >  	 */
> > >  	bool color_mgmt_changed : 1;
> > > +
> > > +	/**
> > > +	 * @plane_caps:
> > > +	 *
> > > +	 * Blob representing plane capcabilites and interoperability.
> > > +	 * This element is a pointer to the array of struct drm_format_blob=
.
> > > +	 */
> > > +	struct drm_property_blob *plane_caps;
> > >  };
> > >
> > >  static inline struct drm_rect
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DOption 1=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > > diff --git a/include/uapi/drm/drm_mode.h
> > > b/include/uapi/drm/drm_mode.h index d390011b89b4..0b5c1b65ef63
> > > 100644
> > > --- a/include/uapi/drm/drm_mode.h
> > > +++ b/include/uapi/drm/drm_mode.h
> > > @@ -312,6 +312,20 @@ struct drm_mode_set_plane {
> > >  	__u32 src_w;
> > >  };
> > >
> > > +#define DRM_FORMAT_PLANE_CAP_LINEAR_TILE	BIT(0)
> > > +#define DRM_FORMAT_PLANE_CAP_X_TILE		BIT(1)
> > > +#define DRM_FORMAT_PLANE_CAP_Y_TILE		BIT(2)
> > > +#define DRM_FORMAT_PLANE_CAP_Yf_TILE		BIT(3)
> > > +#define DRM_FORMAT_PLANE_CAP_ASYNC_FLIP		BIT(4)
> > > +#define DRM_FORMAT_PLANE_CAP_FBC		BIT(5)
> > > +#define DRM_FORMAT_PLANE_CAP_RC			BIT(6)
> > > +
> > > +struct drm_format_blob {
> > > +	__u64 modifier;
> > > +	__u32 plane_caps;
> > > +
> > > +};
> > > +
> > >  /**
> > >   * struct drm_mode_get_plane - Get plane metadata.
> > >   *
> > > @@ -355,6 +369,12 @@ struct drm_mode_get_plane {
> > >  	 * supported by the plane. These formats do not require modifiers.
> > >  	 */
> > >  	__u64 format_type_ptr;
> > > +	/**
> > > +	 * @ format_blob_ptr: Pointer to the array of struct drm_format_blo=
b.
> > > +	 * Specify the plane capabilites/restrictions w.r.t tiling/sync-asy=
nc
> > > +	 * flips etc
> > > +	 */
> > > +	__u64 format_blob_ptr;
> > >  };
> > >
> > >  struct drm_mode_get_plane_res {
> > > --
> > > 2.25.1
> >
>=20
> --
> With best wishes
> Dmitry
