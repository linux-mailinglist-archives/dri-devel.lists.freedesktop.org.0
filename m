Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1540A17766
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 07:38:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F4110E1AD;
	Tue, 21 Jan 2025 06:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OogPja4j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC8410E1AD;
 Tue, 21 Jan 2025 06:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737441522; x=1768977522;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LKmubgsB09vf+pagemTsQgyyIhBymFAH2D+U2NNNJiM=;
 b=OogPja4jES8ZAcJsMZqQtS7fyo/0d4r2b6Fyi6dC3YdbvEU1NGxPTiOd
 hQt2EBglxIOueDrNRhNYGePne5/4/kvCbOXwe3q3fNvOsCDAw3sOQKWfL
 wlOnw0vjOfBeFolTs4HwKlP2yQ6LbQctnSa7lgPFwaWnZ57ZP2iNlzCjG
 BsD9vdgIISnL+H2lNBNZUfmhSuqjmdyyeHUoI2b2DPUamAVyql9AaYCjI
 qS208oRNYN6OvfXIrx3k3OwySpzqgGa0ZMpw3oD2bq6vf84WXXxHncTgi
 2lpcRU8kd4779+O6jLNldt0SHjvbvvMAuNaGoxZIjHdjMQnQX0uBW2+dE Q==;
X-CSE-ConnectionGUID: 8dGLDYLaQz2SN7Tk9HYsuw==
X-CSE-MsgGUID: fxh7lgaHQiOm9DiFBmRd5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="38083860"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="38083860"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 22:38:42 -0800
X-CSE-ConnectionGUID: 7Skh8ZqyTMiAjiZzFpVoIg==
X-CSE-MsgGUID: XGyAQyk1R6u6qMRPhRE0xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="111702691"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jan 2025 22:38:35 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 20 Jan 2025 22:38:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 20 Jan 2025 22:38:25 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 20 Jan 2025 22:38:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLq/Sf/4mQsGjtfPhRmMC1IG4xs3tDVGLOvVsQAu7GwNchmw1g4k6UPWKge47lKqPJWOX73a7rqoOGVhxrKPAbcRq2urh3xKmv1VF91n30CbtlYOhq/jNbobQdcxmyuUUw5V9ecng6EiLUnvd2ACWm5WIrOh6TRoYZRtDnwfpacFv07S2JGUi4jE++wcTJH8IGsDqvQDLECg09PHEV5u6Dw3j887AcDdPvz1aY2GE06wP9y3Mx+Nwe8oY8S/lFbtlfX8IMDvF5l3eDTlE3ZhucWhqVHB4dpdXBne6PN7HAAga5rEZ4G9yR1gNlfSTZggZ1h+/TDvmCIz+9ANFDUq4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEeK5cOJ0CxSz0aiYFG/myRUf4+x0K9pfpKO5V9iqOw=;
 b=pmADJhVxggW2Mcyabj9lrY8yBcwOP3U9FmloQYxP0oUkWC6OmVYskpdICX6f5+R1x6oaXrGvMUGTHgsmkYMsKvjBD9ONpGiovWHCnmCp7D3sy6zcAVuhTUjjgxzVMgoR9Ejy6ve9BJTY67X3gk9YdnFE7GTYXldWRXpAxa6k3nxrrEOMpouiSKhmZN5xwVqJycjeY9+lyAAehSvBDIyZy4pM00dw8R6vMfIS2veB7n7AzFRcuNLRUKNnctv9aZEmS9ZHb7A9e5JPE53CgbajW9Fpc4tRFsxjhCcYBaJnxxXB8TtaLWI0ZzMS1ME9NcgKYI07SIAgAzQHcc5nWFiJyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.20; Tue, 21 Jan 2025 06:37:37 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%2]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 06:37:37 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "Bhattacharjee, Susanta" <susanta.bhattacharjee@intel.com>
Subject: RE: [PATCH v7 01/14] drm: Define histogram structures exposed to user
Thread-Topic: [PATCH v7 01/14] drm: Define histogram structures exposed to user
Thread-Index: AQHbYtFCB5lsX7WJdUO11PRG7LBZALMYRh8AgACXd6CAADEQgIAAGP2AgABDagCAAADIMIAABoiAgAENmCCABlMLgA==
Date: Tue, 21 Jan 2025 06:37:37 +0000
Message-ID: <IA0PR11MB7307CFA8A6794CF839EA1C98BAE62@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
 <20250110-dpst-v7-1-605cb0271162@intel.com>
 <kwklrd2zjovabsa537jwg3bpqilvhfmxxyr4exmqbi2b35uxej@mhequ6ttibsd>
 <IA0PR11MB73079537444DAA9596F0A837BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
 <CAA8EJpojDKtcG=amuwT7B+iaU_A9EwcvpkyyQ8nupKtsF_79gg@mail.gmail.com>
 <IA0PR11MB73070AE8FD9EAF5E47A56A96BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
 <yyn35zkvqfajyyata2kuwfswfzjf3oqv4hzq5pc5rw7o2sporu@vsybecmh54ow>
 <IA0PR11MB73076D2B950535216961E209BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
 <sc52glzpdohjxjexpwayyud4mlbtygx5l4wuziw5oibqv674sf@6x2iohnm32e6>
 <IA0PR11MB730768155ADFB855C20AE3D7BA1B2@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB730768155ADFB855C20AE3D7BA1B2@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DS7PR11MB5966:EE_
x-ms-office365-filtering-correlation-id: ebdf7000-65e1-44df-3fe6-08dd39e618ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?3CWmb/h7tSWVy+bEq4S/HzvT0Y479iQHN7yH6XOCdp9/TpkSJtWh3yw2FfN9?=
 =?us-ascii?Q?fe93xiXnlatVeO9lWP0mJsFn0k8wGtUPcnw8GgMmM1+M9U3WbVX5Jr6fUjiU?=
 =?us-ascii?Q?D1yTQTlR/o5SmdK/S6wgwh4t2n3PglRWAjxPp2zT6XblL/5q5+CtTZpSAJdd?=
 =?us-ascii?Q?hHepdggJmt8qiC+3SgsFaiag7Vspeng7x0F82EbhW7ZmpiGt839dPG/Bio43?=
 =?us-ascii?Q?YN66vvWPEOn3+vRvbG1pR2piypj1yQ7nT2urlQpt8QxMiyEYqAy2QJ+lBXa0?=
 =?us-ascii?Q?Z/yt266HLVlhH8N2ygpaAFkk8qP72ltQlviRqm9Ry9WpcVvJv9sCQzvQiXv/?=
 =?us-ascii?Q?L4rhiC/laN1mXvslMT1YpjTSD87+JQeGpPNmzJrENu8BV/26Sjvny+bBmmzH?=
 =?us-ascii?Q?0O/PVld7EP3uB4QB3A+Touu4uLhB37DK99o7kx5UNMtXsHfIEDtku0ZyvMOG?=
 =?us-ascii?Q?x/ipJda/MzIiVNN3oIWc1lvnxiwKsw6euHqzT+E3OhK7ymfrEyoHl0thR+uj?=
 =?us-ascii?Q?RVJ1D6CN7tCyqwdAoSVFiBy0aoJBI69kx3V7pbp4O1glBNDg9HcqxOA1XbWi?=
 =?us-ascii?Q?+bXHhXXlVkn70ZISONYXusUZwcXOHvUseWAwjRUbkyIsxLziO9zdEOU7yxJi?=
 =?us-ascii?Q?3MS8+FAsrZd9lPg2oPm2vdSVj7GkQhLU4J/Yfyz40T7i8BxL7MoBTW1vh+UT?=
 =?us-ascii?Q?ZTgImZXLmfxIHpmNGJU1JQkNOzusR28qxAiEQN+4T2QlV8hnMTNJh5vK7RPP?=
 =?us-ascii?Q?rPK4AdvDFpFK/UYNh0XklTtiWddMaQ0t3a4Bz644pytYB8ddseM8dlkXRfGy?=
 =?us-ascii?Q?arHy0EFNhbvhRv4Lg89fqTpB/q8CpE2pnYz7JvUgcH461QOadTdyPhhFglev?=
 =?us-ascii?Q?PMkFl0A6PBUtXRgRXuB1TcF9QSGTZHRtPb5mYBHvvhd4m2nv1r8S9S32B1Zn?=
 =?us-ascii?Q?zunsNVcMBQxC7GuF6li6nDJKOI/fRNx7+Sh8wJl4LW+L2aG6TsP/30RdQnp4?=
 =?us-ascii?Q?RiVeIU7tB82ls42cqeHITTba3EUy7kpzIXBUujBu7vtvju2cP6Zxhoio/tnO?=
 =?us-ascii?Q?KQGMwhkkM/50xhnXFar3nGULrKk13LwISPQtp+ym5UYo+4xTM6d/MxxwWSIR?=
 =?us-ascii?Q?hpseMHUjMcEuhAtTuM1/lJizfTIcgrS2yt9JowMHKAllmrwN6/FsxJFuRcSe?=
 =?us-ascii?Q?L36Z0e+B8CsR9uAeih46eYxU/V+wkhl06k3YwWhMJjIydzH+7sahvGEHR90W?=
 =?us-ascii?Q?oGro18CZI+yO5lld9SBOpJn2Fwv5NLp2niEMmSdxAcdrQXIcBlMWD+aY8P0w?=
 =?us-ascii?Q?UlBasZWSZjFwThZvr90wbRy4fZfozePbER8gI7LmPx0ottIksW2CWX253IDk?=
 =?us-ascii?Q?9L0oNDJUk9AUmbrHbeOD3LEVby3vPLYyeNTcOKooUD+v5+IfmEcQKyhcgm60?=
 =?us-ascii?Q?xmhmEPV9OOH67CAasQEBbLN7fJGrcp85?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SgV5XvrCYi8qVpMjAeox2VEt4JXZyiBmfkQmd9rvIbWgvzuZ8oFefyjvckvz?=
 =?us-ascii?Q?Hg5FENkpbF2SkPeMf7BC4Z8HDdhA4XVB2ojtFqxA114juql6sffGCAymqkrH?=
 =?us-ascii?Q?+YyaX926c8MKenJMiVDopv2TZk3eiT069Si8jOohDkELyKmsPLckd/1Lw9G4?=
 =?us-ascii?Q?Y81fYN4ePw2dyg73U2Uc2medUUp1CeQrRsY4yn5o0orQjHOjMh8Tt7E2Eycz?=
 =?us-ascii?Q?sw/A+k+eKGN4mipb4prPi0SZVMd40N0l8/wNcXEA+VF46tjopto8Ff+JmJ8A?=
 =?us-ascii?Q?htASNuspe4Sq9Rikp6jUGRPnUHFieMkwxHCkkG9F36th85SItfESMv2GWjF/?=
 =?us-ascii?Q?9DYvi3vUQEmcSNTytrDSFlOnix6kzQ74Pq3J9/WeN72UuRN/v0rQwGeLnMAk?=
 =?us-ascii?Q?zbLlsjVObaePyvbt2xBQFdwLqIkwjzBGzPpgeMIDohiY6G1K8csmZiYa6zCx?=
 =?us-ascii?Q?yqpW36GHFbtnh5uUQsrY/zNXWIxMFOFYOlf0yTUGihqheG7YF3ri7W+VSogR?=
 =?us-ascii?Q?nkmZ7TJsMlV7O5WQ40xjnWKy9jP57Y+nALQfjNXCqMjSuEoKB5inTHgj1NID?=
 =?us-ascii?Q?TvVeo+27eg9qCWOt7fl3uLbsZo3OAZcctL24cxCXHYvfXX1zcvVZLJa/xfa4?=
 =?us-ascii?Q?Jr7Fx2jfuakh/3OHs8V9e7BMJndIUFDXSy12dp5K1PSqViHKYctlwfPIljoV?=
 =?us-ascii?Q?KaVcsGRsyAW5ba0ueVjUSqrgUImjTFHYHk6jKrUL71vUYB31ZBUs20u0VgM6?=
 =?us-ascii?Q?Vt4VCM3UgbLDtVARq9ii4ouQcydueu9P5f4rZb8lgb74SZ0lkPGJGR/ega5O?=
 =?us-ascii?Q?hrGV5X90v+BUYWM0GXd6k7zedUF0bE+NITLS+7r/msFB7grGqW67/jALCQy6?=
 =?us-ascii?Q?3nY/uhN66DGuGRQ/GVMP3LQ+6oLisIAiBG6IVntPLxr9oyhScpJDnGXblKm4?=
 =?us-ascii?Q?0BKdfbf3QDyY8KYKCDu49DqBLZagUd/WtHPSL3up2CjYo6WT82tPMRVrgLTf?=
 =?us-ascii?Q?EtfnKjrbkqU48TLQecbuGcX3ppHo/NFA38if1gGw/jmRE098YTzS2c32htY/?=
 =?us-ascii?Q?pv09QOneTVJ/LQBjzKaKMvMGY4PAtc7uNLEuXzhDrzw6XwF7Y5mv9Oa2C/ML?=
 =?us-ascii?Q?/0Jh+/6N3l8DN4ijmE4SRFS2QDIzWhFvMP8w4a9UZQjPy3Ig7Y27hXdVeRrD?=
 =?us-ascii?Q?xm752a3gGlc8YWAPn5Oo56ckXw/HfX0KqENAvlA2dqNeZUEyGWrJXlzAxkD8?=
 =?us-ascii?Q?8/hfyEMpyEdwDWjvjqVlDidqzxMzxTm8YwIihOHOu/k9PAU0vZefB3Q2yRPc?=
 =?us-ascii?Q?BlnhfMCE4bHSAP7X7V0M75u7tbj1V+HRGNxucKXsp82nRn1wAicC+FT6r3BI?=
 =?us-ascii?Q?bSQ2JytpY8OwcKt4ZL69vMDFZhcnCHXZ+ooZXj4TbxDDeJZubVWi/P6HKGpG?=
 =?us-ascii?Q?2FfnF8O8XvwQ8IuRudqzRdlKRzgNzjlMSla08nMMpXV2allUQzeQPEIHzQXD?=
 =?us-ascii?Q?02CGXwbYRLROIw5AsHo0LS7k0VTNbexzRZyQ+2Cotd8jPpQX1XiGeqHH7mtO?=
 =?us-ascii?Q?kAW3+wrgt010XIisctU0GcHNA/px9M7Cy0Zdwm6F?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebdf7000-65e1-44df-3fe6-08dd39e618ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 06:37:37.5712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wWRtTcgaPXFufUFgEFaK96CRG4ufFZ7W6ZJm1dS2Mb/9Je1juUZRw1EBm26+NnoWHRTZoRfe24cj9PXpWZzqng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5966
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

> > On Thu, Jan 16, 2025 at 01:33:43PM +0000, Murthy, Arun R wrote:
> > > > On Thu, Jan 16, 2025 at 12:33:20PM +0000, Murthy, Arun R wrote:
> > > > > > > > On Fri, Jan 10, 2025 at 01:15:29AM +0530, Arun R Murthy wro=
te:
> > > > > > > > > Display Histogram is an array of bins and can be
> > > > > > > > > generated in many ways referred to as modes.
> > > > > > > > > Ex: HSV max(RGB), Wighted RGB etc.
> > > > > > > > >
> > > > > > > > > Understanding the histogram data format(Ex: HSV
> > > > > > > > > max(RGB)) Histogram is just the pixel count.
> > > > > > > > > For a maximum resolution of 10k (10240 x 4320 =3D
> > > > > > > > > 44236800)
> > > > > > > > > 25 bits should be sufficient to represent this along
> > > > > > > > > with a buffer of
> > > > > > > > > 7 bits(future use) u32 is being considered.
> > > > > > > > > max(RGB) can be 255 i.e 0xFF 8 bit, considering the most
> > > > > > > > > significant 5 bits, hence 32 bins.
> > > > > > > > > Below mentioned algorithm illustrates the histogram
> > > > > > > > > generation in hardware.
> > > > > > > > >
> > > > > > > > > hist[32] =3D {0};
> > > > > > > > > for (i =3D 0; i < resolution; i++) {
> > > > > > > > >     bin =3D max(RGB[i]);
> > > > > > > > >     bin =3D bin >> 3; /* consider the most significant bi=
ts */
> > > > > > > > >     hist[bin]++;
> > > > > > > > > }
> > > > > > > > > If the entire image is Red color then max(255,0,0) is
> > > > > > > > > 255 so the pixel count of each pixels will be placed in t=
he last bin.
> > > > > > > > > Hence except hist[31] all other bins will have a value ze=
ro.
> > > > > > > > > Generated histogram in this case would be hist[32] =3D
> > > > > > > > > {0,0,....44236800}
> > > > > > > > >
> > > > > > > > > Description of the structures, properties defined are
> > > > > > > > > documented in the header file
> > > > > > > > > include/uapi/drm/drm_mode.h
> > > > > > > > >
> > > > > > > > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > > > > > > > ---
> > > > > > > > >  include/uapi/drm/drm_mode.h | 59
> > > > > > > > > +++++++++++++++++++++++++++++++++++++++++++++
> > > > > > > > >  1 file changed, 59 insertions(+)
> > > > > > > > >
> > > > > > > > > diff --git a/include/uapi/drm/drm_mode.h
> > > > > > > > > b/include/uapi/drm/drm_mode.h index
> > > > > > > > >
> > > > > > > >
> > > > > >
> > > >
> >
> c082810c08a8b234ef2672ecf54fc8c05ddc2bd3..7a7039381142bb5dba269bda
> > > > > > > > ec42
> > > > > > > > > c18be34e2d05 100644
> > > > > > > > > --- a/include/uapi/drm/drm_mode.h
> > > > > > > > > +++ b/include/uapi/drm/drm_mode.h
> > > > > > > > > @@ -1355,6 +1355,65 @@ struct drm_mode_closefb {
> > > > > > > > >     __u32 pad;
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > > +/*
> > > > > > > > > + * Maximum resolution at present 10k, 10240x4320 =3D
> > > > > > > > > +44236800
> > > > > > > > > + * can be denoted in 25bits. With an additional 7 bits
> > > > > > > > > +in buffer each bin
> > > > > > > > > + * can be a u32 value.
> > > > > > > > > + * Maximum value of max(RGB) is 255, so max 255 bins.
> > > > > > > >
> > > > > > > > HDR planes have higher max value for a component.
> > > > > > > > Likewise even in an RGB24 case there are 256 possible value=
s.
> > > > > > > > It's not clear why
> > > > > > > > 0 gets excluded.
> > > > > > > >
> > > > > > > This applies to only SDR and excludes HDR.
> > > > > >
> > > > > > Why?
> > > > > >
> > > > > We are limiting to only SDR. HDR includes a broad range of color
> > > > > and finer details, which essentially means its an enhanced image.
> > > > > We are trying to enhance the image quality of SDR with the
> > > > > support of
> > > > histogram.
> > > >
> > > > You are defining generic API. It might be broader than your existin=
g
> usecase.
> > > > Please consider supporting HDR too.
> > > >
> > > HDR image enhancement is very much complex including multiple stages
> > > such
> > as image tone mapping and image denoising.
> > > Here for SDR planes, image enhancement is done by playing around the
> > contrast and color.
> > > Maybe at this stage we can focus on SDR and can take this HDR at the
> > > next
> > stage.
> >
> > If you define max(colour) to be 255, then you can not expand it later.
> > The API will have 8 bits for colour information everywhere.
> >
> Ok will rework to consider the HDR planes as well.
>=20
This 255 is just an array count.
For HDR max(RGB) is 65535 so if for illustration considering 10k resolution=
 generated histogram would look like hist[65535] =3D {0,0,.....44236800}

So the present structure and elements should be sufficient.

Thanks and Regards,
Arun R Murthy
--------------------
