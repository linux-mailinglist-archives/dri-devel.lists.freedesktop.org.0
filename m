Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BB2D0A91A
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 15:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E6010E326;
	Fri,  9 Jan 2026 14:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Naq0EHPG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7020610E215;
 Fri,  9 Jan 2026 14:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767968021; x=1799504021;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xzkXjfMKttnJSkEhe+Betx6ie2ioZxtxf+lUh5ujLRw=;
 b=Naq0EHPGs3bmTlCrKlyvBnIbgirGGxQUvmDsSihXrIuZHWfiFrnA8rVs
 mCjJff/2VBPlqqmRw7AovPopY73nMjd5PXTVilEEvRrCSeKtnhfZOj3NY
 Sz94Py6Al1agrlh2gnWDrm61nIbg8DlbD55ERuqN0JoufrLCwyuy9eXgx
 bxukBamcQdrI7vYdrfAOV6uC7NciBdwMypzJMpqwZrXE8Io4Vrj+dRSlL
 LXzeZS0y41og1Gzib0jGPGKyFR3JklHH8nqu07LX/40JPV/nx+8JdIwm6
 SF0/cRRyK89eFLTMZJgzuZD1rzBhOcRFcQfFYq/k4gjZXqxZFkrLJUfN+ g==;
X-CSE-ConnectionGUID: 92YmdiJtSUuaLz+tsRq0Mg==
X-CSE-MsgGUID: kyioxuXITCuyJnN4U4HUYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="73206470"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="73206470"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 06:13:41 -0800
X-CSE-ConnectionGUID: VpmpXBo6QLmcrUdDRPh3Sw==
X-CSE-MsgGUID: xRrEFAUKTu6J5Mj2DcGMbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="208535739"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 06:13:40 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 06:13:39 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 06:13:39 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 06:13:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIZhIDyODk1iuuDy1SPgibQ+XlDkJrbJA0LUjwlyZ1xB43m+9UgMH5f/TAQ+a91Er9P2aDCNwFD0szOb4qoAb1tSE5ysrPukQGSaxPAMtwcTjzVVz5ASykB6M3mdwThFS1cr9xmVCkIa1+x1RP25sV1EYK13py7ZdorBu8rF8h6ep5zoW4HwvDAiVVW34zotmKnzWcogdNUaZ4V/nCGMZI6qEht3nq1k9qo5gXKKxbzgpGYDG8StFLodJHrEugyF1b0jHcm7bBkVT7x0za5W/rPeAfygS8AHtSh2wzB115WsSWcez3ubS1jmIvMqphLj8owhNGWcZrL828XZR2Tn6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MedG/2rf39+LDgh5pmifr0z5Kn2VMv/9UQF0ZeiN70=;
 b=wDMXCiDNRTBY9GoKBwC4IR35GSrFylEFmwflOnn2ju96ECF1kOOQEqjCjFdVic93TKhB9J3kcPJ6o88o3+pOq5G5xbxcmg1P7XGb35Nn3AZitC5CRI0LBgUk8WbMVIAOXC2VN8DiaBpWBZ+KRSMxj8mZd8s+roBpF5UHrqg6O0sOtsTeUC0nux8OVRFPlY3dm6s3CDeRG3m+CdHNU1FQXOqi9MCVVSqJMcTxbxxJTxM3mE3uxswUkhkQFMWuu/A0UfKUwjUPdV1yVBSFTtL2B1fnr8kBND4nPV9X9ID+eAGy04PmhPDCgmJ4kA0/01Qo1j8Dm8t9zHUL6dkU6fCrPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA2PR11MB5019.namprd11.prod.outlook.com (2603:10b6:806:f8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 14:13:38 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 14:13:38 +0000
Date: Fri, 9 Jan 2026 09:13:31 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <aravind.iddamsetty@linux.intel.com>,
 <anshuman.gupta@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <airlied@gmail.com>, <pratik.bari@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <ashwin.kumar.kulkarni@intel.com>,
 <shubham.kumar@intel.com>
Subject: Re: [PATCH v3 2/4] drm/xe/xe_drm_ras: Add support for drm ras
Message-ID: <aWENCzpkeI4OaZqa@intel.com>
References: <20251205083934.3602030-6-riana.tauro@intel.com>
 <20251205083934.3602030-8-riana.tauro@intel.com>
 <aTfcV5nb_vBOOBvP@black.igk.intel.com>
 <ac78c819-51ce-4a6b-a5c8-1f327d1d8a7e@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac78c819-51ce-4a6b-a5c8-1f327d1d8a7e@intel.com>
X-ClientProxiedBy: SJ0PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::6) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA2PR11MB5019:EE_
X-MS-Office365-Filtering-Correlation-Id: e494047e-d801-4034-cc3c-08de4f894870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?C+njF92yjlpzyof3ZiGWFS/UDPpbbQgbwbduN0bDgfRt+rEwylg8znJF8s?=
 =?iso-8859-1?Q?MzZqZGuGTzsgzsk9c58JJHBv5HNpdSPmb8eNm3M7cNHp6oJHaQWOowM5Wf?=
 =?iso-8859-1?Q?iJV2GuKEwHHyW5N28+C8X4uAyHB6iHTjPIl2woecC55QYW/JXq+gU6Ppbt?=
 =?iso-8859-1?Q?MqAwprTefnNl68gPhesAxqInHH2MHT/YPffHinkoII6AAMbdIlpw7daoxx?=
 =?iso-8859-1?Q?ySZ3vveQEjSkFoD0S8vWhSMpIA9F7JeYUyel1VcYaL+Hwuf0dt++uiAZFY?=
 =?iso-8859-1?Q?LjnBBFAFEvPZRo6+R13QhGlDBRLu0RN2p2HBgcJAl7sy1ovI9ntNmlUJwq?=
 =?iso-8859-1?Q?PoXQCppCgZqZ0ptNEEY09IORQmxKtqGpzZevwkJqIIsmf3GwIzfN20R8PH?=
 =?iso-8859-1?Q?vVDCXZI5jpbx5v0B+r/DOMVotLPISplTl7FAvXD10jqdrSW9QT+7UGgXQ2?=
 =?iso-8859-1?Q?/7cmEOK2iSYY4fXytfV208OxPuTF+r/7acJWpo+u3htVcbMAhnUEe1lEIl?=
 =?iso-8859-1?Q?jQKgyHeiOPVLw7NLmzoWa1gDJAcBUgBP3hjk13VIClRgTAggkHcq0nyr5J?=
 =?iso-8859-1?Q?9lVYBG67WZ0ZvyeDzKYlXaxCwJEMeF9mmCp7G3Kb4avkxTdShuZuZ2jSol?=
 =?iso-8859-1?Q?a+00GRJvJjo69OnKn+BmIhPEmzDM/QA3Zs25w6r3RtNNujiFiHoahoNPtc?=
 =?iso-8859-1?Q?Pcw/vgrko5+2GmhzRZ+tdb3tj4c6NN62cf3ONzZo1WPM5TL/Wwe1gQ4lp9?=
 =?iso-8859-1?Q?+VwS3B4jhfelkfZUhU7tKvdc1mz4TT9wXYYZw/BJCCd85eqBYXxF8Zl6XD?=
 =?iso-8859-1?Q?WKur/4GldV/fV97hrMzazSnHoY1xwzA3FGaMlkQb5sm5gmVeebt2qXG1Qw?=
 =?iso-8859-1?Q?JZXb0GHaI3LOZQLUx1UtCWDdH9R6dONBAVpwLOwS05KHqHrkf3jYW3Xlv+?=
 =?iso-8859-1?Q?PVyAsX39/Eq6XH83tOkGM3lcF+JC1gTaeXedKo5FL04JQWXDUzkLkfDgbR?=
 =?iso-8859-1?Q?ezhMhNrRqlecQKCpFgYEeqX5hUh5Dwa5zWdBtgbh5Im8M8eA8iwFh/WFug?=
 =?iso-8859-1?Q?VqFTk22IsQvsScUlIxQREkPqocrvNQpF7fVuZkEawqmP5pjZ4y0yLvxn2t?=
 =?iso-8859-1?Q?l2ToNTr9eBJaTqHUlvRWtD9v1coSPUj390HhoPsRT3xFP6/XIb7JfI8XYP?=
 =?iso-8859-1?Q?At8A5q5BVFOSfmCVM+tYcwkgQ4qO7zv83ROy66oPoVhSM4p1EZRKUQfbJ1?=
 =?iso-8859-1?Q?3raguSe/NP68HkZup2dzm59GbxD80cNudxHEHXoJvzWCaThV/kJAphtKc+?=
 =?iso-8859-1?Q?bK7OFV4O2zn+64i9tkiHLz84litnZoARKaPAEzcHeMOgbVGCHw0YRYPptL?=
 =?iso-8859-1?Q?lZJELdQ3VQ2q+mqbCsTK/AWuY99fLCUMVBtLHr1+EhKxzc036R7tMtvKxF?=
 =?iso-8859-1?Q?HY3KbJwqdybyawozNMpBckiZg4WVHUOS66JFcLUH6a52i5QAjuBYl0WzfN?=
 =?iso-8859-1?Q?MuOVZTwzZO0OiIfhWwrs+H?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?V8B5X2Jezj9GaO9cFHx2EiSsd+g4LKd1UhHPdxl4yM94GMZie1GUwm6FAF?=
 =?iso-8859-1?Q?Zj+ry0nDZaZHap1FyFXl9Pt21CgcFusaE5s+TD1rWxpzQnbL1+0CpOtSQz?=
 =?iso-8859-1?Q?sTsj9dNzto63sPPVTKVzj/7pEEctR8N6jJmHo/HHAE4g0b7Vi1vnSRa9rw?=
 =?iso-8859-1?Q?udymbTLAmin0mStixFSY1ENcYvjCOi1zDRdWAKbCvpjaiP/xXi7ufUAhHk?=
 =?iso-8859-1?Q?7ORORvEfAo/V6JsZWUZB07cezWnjxGA74MWBu1DJ4C9+tvKENWzfzlPkEv?=
 =?iso-8859-1?Q?wMC8OfmmW9csobCC72/Pfds2OJwVTCBaBFV5+NyruAjCLlRXNWtjbRsCHw?=
 =?iso-8859-1?Q?A/XGTKoNdhEH6Wb4A7smkTa79BvQ3wUydECyebUQGV5LmGPxnHZ8daIDzv?=
 =?iso-8859-1?Q?F4S10jDvIXddYYDhbxTqa9ft01mR6jDVmlqfkBUwkNH6vR7BCO0a/ZjAyn?=
 =?iso-8859-1?Q?EWS7KlS5F7LUVJtYH4svluBVlLSwEmXCDVzQcZfA0lHCFNmUQNcL+Qfwt2?=
 =?iso-8859-1?Q?F2kt0soyrfF5DNdSfjEjWDHMM9PUD4qet/5YZGoSs1xTXonP+z+1LBj/cV?=
 =?iso-8859-1?Q?o5IPgWuXJqPBWfeqgvk/5HVJhux52EXHqbvCgVF2pxRXsTaH4xv3UL8CwN?=
 =?iso-8859-1?Q?Dr4+DfMjg2Ut4YgT75QONzZ36LzHo64FuyzztwB0PfmSOwC9/NOkzPUwLR?=
 =?iso-8859-1?Q?d6Q07g9FhvJ/OclMwPAa75dIoPuQ5zzPWNcZmvkyMYczzz9xF5S95Lqdme?=
 =?iso-8859-1?Q?+vebAr9DLrTIcfca5e5MP3kqU7usIyA0/VAeN9LcuGSNVsLzb4R1okfXxZ?=
 =?iso-8859-1?Q?Ni3xGE/88O83l94Wsti7e+j62vyXE/Xh4mj/pop6wvc2KHcoJQD5Hc2q16?=
 =?iso-8859-1?Q?Bf0ZpuB33OWYfciDxsbk00Vu32JDnQ9hb/cq6OrsxTNBBGCUzlee88fCYj?=
 =?iso-8859-1?Q?YkSuAffulIJepzeu2brrmlpXNEulb4dMR2NPiWdbgaXZfBfeo7ax4CKtl6?=
 =?iso-8859-1?Q?lyvu5lXTerc+FII+6LhFevS2PYwqfbLdeV3Oo0h34A85dgrDll9NxHiMf6?=
 =?iso-8859-1?Q?7WEtpTOEvgCzo7+DhnVnMyN2LqWTW5Z+WBkY4qhKa/vPB5hlYMmimyy0QW?=
 =?iso-8859-1?Q?wAo8emdPOocpXYXOstlCZmVCral1YyB9MXIxfbz7YgYztkdIgHWG+QRElt?=
 =?iso-8859-1?Q?Ep3qw9krLHWuRkbMIvttf3NNZAy0Wo2hCY7XN3srtW91jlLKw1+lMxEObQ?=
 =?iso-8859-1?Q?3eRqC2THyQ7znPHUZRTTn9CG+2zrxf2WZbuWBcXWw0z6RsMGWIfI/Nue+8?=
 =?iso-8859-1?Q?VPuh1s1chEpkQUE1p+U4wiBsm2kcGynBUVXs85qA2DCUBb3DU//R/RQVdh?=
 =?iso-8859-1?Q?TzzeZfatG5VXgZgQEI4HGBhpJE+l6uREmZFP3U51ox4/SFoXMLZkepCIZI?=
 =?iso-8859-1?Q?Yd+b0WvHQZwUutkCHF5P6ntxoWA7YPdll1Hf1Fjqe0zHBi9FLEFmqXSpt6?=
 =?iso-8859-1?Q?ToFII3Ng9rgpKlaAgqO5eL+RAObSEZ39ltVBA4kMsyrSiQ61gSctc6yNHO?=
 =?iso-8859-1?Q?Qj14yaH4UE+MRe7rySzIWzCqJL8nzUBfqv8pskD5VjWf/3L85/4dHaQrv2?=
 =?iso-8859-1?Q?Zg8/AJAaSVDQLVWR3mDRf8xsMPckSM+T5yyudlDe9X7KURReKFMumEabQT?=
 =?iso-8859-1?Q?3c0wL3tmwhU8Gd9Zewf6tJ0nBLrcs0N5T5d7Fd5rjtMopkc7gKCv43HrOr?=
 =?iso-8859-1?Q?b8nfBKZrojDNXVZUy1cM8Unl7C97kenFa9CtfkSNNAXs5Iyjpbeg1C5G3K?=
 =?iso-8859-1?Q?wPqUub+FfA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e494047e-d801-4034-cc3c-08de4f894870
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 14:13:38.0062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1wYFVJ43E6G07AY31e3QzBdsdKXNBgDjn7v/Nrc7/TPIoPKCzUwPQ0DvCJRJpu2AbV1vXhiJtveOT/wXCpb3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5019
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

On Fri, Jan 09, 2026 at 01:38:44PM +0530, Riana Tauro wrote:
> Hi Raag
> 
> Thank you for the review
> 
> On 12/9/2025 1:52 PM, Raag Jadav wrote:
> > On Fri, Dec 05, 2025 at 02:09:34PM +0530, Riana Tauro wrote:
> > > Allocate correctable, nonfatal and fatal nodes per xe device.
> > > Each node contains error classes, counters and respective
> > > query counter functions.
> > > 
> > > Add basic functionality to create and register drm nodes.
> > > Below operations can be performed using Generic netlink DRM RAS interface
> > > 
> > > List Nodes:
> > > 
> > > $ sudo ynl --family drm_ras  --dump list-nodes
> > > [{'device-name': '0000:03:00.0',
> > >    'node-id': 0,
> > >    'node-name': 'correctable-errors',
> > >    'node-type': 'error-counter'},
> > >   {'device-name': '0000:03:00.0',
> > >    'node-id': 1,
> > >    'node-name': 'nonfatal-errors',
> > >    'node-type': 'error-counter'},
> > >   {'device-name': '0000:03:00.0',
> > >    'node-id': 2,
> > >    'node-name': 'fatal-errors',
> > >    'node-type': 'error-counter'}]
> > > 
> > > Get Error counters:
> > > 
> > > $ sudo ynl --family drm_ras  --dump get-error-counters --json '{"node-id":1}'
> > > [{'error-id': 1, 'error-name': 'Core Compute Error', 'error-value': 0},
> > >   {'error-id': 2, 'error-name': 'SOC Internal Error', 'error-value': 0}]
> > 
> > Minor bikeshedding: Is there anything like 'SOC External'? If not, perhaps
> > simply 'SOC' would be sufficient.
> 
> Agree. SoC should be sufficient
> 
> > 
> > > Query Error counter:
> > > 
> > > $ sudo ynl --family drm_ras --do query-error-counter  --json '{"node-id":1, "error-id":1}'
> > > {'error-id': 1, 'error-name': 'Core Compute Error', 'error-value': 0}
> > 
> > One more (sorry): So this means graphics will be a different id? Or do they
> > overlap? How does it work?
> > 
> 
> Did not get this question.
> 
> > 
> > Also,
> > 
> > [*] I'm not much informed about the history here but the 'error' term
> > seems slapped onto almost everything. We already know it's RAS so perhaps
> > we add it only where make sense and try to simplify some of the naming?
> 
> Let's keep the errors in the node-names. Removing it from error-name should
> be okay. Wil fix ths
> 
> 
> > 
> > ...
> > 
> > > diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
> > > new file mode 100644
> > > index 000000000000..764b14b1edf8
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> > > @@ -0,0 +1,199 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2025 Intel Corporation
> > > + */
> > > +
> > > +#include <drm/drm_managed.h>
> > > +#include <drm/drm_ras.h>
> > > +#include <linux/bitmap.h>
> > > +
> > > +#include "xe_device.h"
> > 
> > This inherits some of the debt that should not be there, so let's try to
> > get away with xe_device_types.h where possible. But please double check.
> > 
> > > +#include "xe_drm_ras.h"
> > 
> > ...
> > 
> > > +static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *xe,
> > > +							     int count)
> > > +{
> > > +	struct xe_drm_ras_counter *counter;
> > > +	int i;
> > > +
> > > +	counter = drmm_kzalloc(&xe->drm, count * sizeof(struct xe_drm_ras_counter), GFP_KERNEL);
> > 
> > Why not drmm_kcalloc()? We get a bonus overflow protection.
> 
> Will check
> 
> > 
> > > +	if (!counter)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	for (i = 0; i < count; i++) {
> > > +		if (!errors[i])
> > > +			continue;
> > > +
> > > +		counter[i].name = errors[i];
> > > +		atomic64_set(&counter[i].counter, 0);
> > > +	}
> > > +
> > > +	return counter;
> > > +}
> > > +
> > > +static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
> > > +			      const enum drm_xe_ras_error_severity severity)
> > > +{
> > > +	struct xe_drm_ras *ras = &xe->ras;
> > > +	int count = 0, ret = 0;
> > 
> > Redundant initializations, also why do we need them?
> 
> redundant code from previous rev. Will remove
> 
> > 
> > > +	count = DRM_XE_RAS_ERROR_CLASS_MAX;
> > > +	node->error_counter_range.first = DRM_XE_RAS_ERROR_CORE_COMPUTE;
> > > +	node->error_counter_range.last = DRM_XE_RAS_ERROR_CLASS_MAX - 1;
> > > +
> > > +	ras->info[severity] = allocate_and_copy_counters(xe, count);
> > 
> > This looks like count should be derived from first and last, or did I
> > miss something?
> 
> assigned it directly. Can be done
> 
> > 
> > > +	if (IS_ERR(ras->info[severity]))
> > > +		return PTR_ERR(ras->info[severity]);
> > > +
> > > +	switch (severity) {
> > > +	case DRM_XE_RAS_ERROR_CORRECTABLE:
> > > +		node->query_error_counter = query_correctable_error_counters;
> > > +		break;
> > > +	case DRM_XE_RAS_ERROR_NONFATAL:
> > > +		node->query_error_counter = query_non_fatal_error_counters;
> > > +		break;
> > > +	case DRM_XE_RAS_ERROR_FATAL:
> > > +		node->query_error_counter = query_fatal_error_counters;
> > > +		break;
> > > +	default:
> > 
> > Do we need this?
> 
> yes.
> 
> > 
> > > +		break;
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int register_nodes(struct xe_device *xe)
> > > +{
> > > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > > +	struct xe_drm_ras *ras = &xe->ras;
> > > +	const char *device_name;
> > > +	int i = 0, ret;
> > 
> > Redundant initialization. Also, ret belongs to the loop below.
> > 
> > > +	device_name = kasprintf(GFP_KERNEL, "%04x:%02x:%02x.%d",
> > > +				pci_domain_nr(pdev->bus), pdev->bus->number,
> > > +				PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
> > > +
> > > +	for (i = 0; i < DRM_XE_RAS_ERROR_SEVERITY_MAX; i++) {
> > 
> > We could potentially have a nice for_each_error_severity() now ;)
> 
> Sure. Will check. If its used in multiple places then its worth having a
> helper
> 
> > 
> > > +		struct drm_ras_node *node = &ras->node[i];
> > > +
> > > +		node->device_name = device_name;
> > > +		node->node_name = error_severity[i];
> > > +		node->type = DRM_RAS_NODE_TYPE_ERROR_COUNTER;
> > > +		node->priv = xe;
> > > +
> > > +		ret = assign_node_params(xe, node, i);
> > > +		if (ret)
> > > +			return ret;
> > > +
> > > +		ret = drm_ras_node_register(node);
> > > +		if (ret) {
> > > +			drm_err(&xe->drm, "Failed to register drm ras tile node\n");
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > 
> > ...
> > 
> > > +int xe_drm_ras_allocate_nodes(struct xe_device *xe)
> > > +{
> > > +	struct xe_drm_ras *ras = &xe->ras;
> > > +	struct drm_ras_node *node;
> > > +	int err;
> > > +
> > > +	node = drmm_kzalloc(&xe->drm, DRM_XE_RAS_ERROR_SEVERITY_MAX * sizeof(struct drm_ras_node),
> > > +			    GFP_KERNEL);
> > 
> > Ditto for drmm_kcalloc().
> > 
> > > +	if (!node)
> > > +		return -ENOMEM;
> > > +
> > > +	ras->node = node;
> > > +
> > > +	err = register_nodes(xe);
> > > +	if (err) {
> > > +		drm_err(&xe->drm, "Failed to register drm ras node\n");
> > 
> > You wanted to call drm_err_probe(), didn't you ...?
> > 
> > Ah, not upstream yet :(
> > But perhaps an opportunity worth considering.
> > 
> > > +		return err;
> > > +	}
> > > +
> > > +	err = devm_add_action_or_reset(xe->drm.dev, xe_drm_ras_unregister_nodes, xe);
> > > +	if (err) {
> > > +		drm_err(&xe->drm, "Failed to add action for xe drm_ras\n");
> > 
> > Ditto.
> > 
> > > +		return err;
> > > +	}
> > > +
> > > +	return 0;
> > 
> > ...
> > 
> > > +/**
> > > + * struct xe_drm_ras_counter - xe ras counter
> > > + *
> > > + * This structure contains error class and counter information
> > > + */
> > > +struct xe_drm_ras_counter {
> > > +	/** @name: error class name */
> > > +	const char *name;
> > > +	/** @counter: count of error */
> > > +	atomic64_t counter;
> > > +};
> > > +
> > > +/**
> > > + * struct xe_drm_ras - xe drm ras structure
> > > + *
> > > + * This structure has details of error counters
> > > + */
> > > +struct xe_drm_ras {
> > > +	/** @node: DRM RAS node */
> > > +	struct drm_ras_node *node;
> > > +
> > > +	/** @info: info array for all types of errors */
> > > +	struct xe_drm_ras_counter *info[DRM_XE_RAS_ERROR_SEVERITY_MAX];
> > > +
> > > +};
> > 
> > Either separate the members with blank lines or don't, but let's be
> > consistent.
> 
> Will fix
> 
> > 
> > ...
> > 
> > >   void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
> > >   {
> > > -	enum hardware_error hw_err;
> > > +	u32 hw_err;
> > >   	if (fault_inject_csc_hw_error())
> > >   		schedule_work(&tile->csc_hw_error_work);
> > > -	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++)
> > > +	for (hw_err = 0; hw_err < DRM_XE_RAS_ERROR_SEVERITY_MAX; hw_err++)
> > 
> > for_each_error_severity()
> > 
> > >   		if (master_ctl & ERROR_IRQ(hw_err))
> > >   			hw_error_source_handler(tile, hw_err);
> > >   }
> > 
> > ...
> > 
> > > +/**
> > > + * enum drm_xe_ras_error_severity - Supported drm ras error severity.
> > > + */
> > > +enum drm_xe_ras_error_severity {
> > > +	/** @DRM_XE_RAS_ERROR_CORRECTABLE: Correctable Error */
> > > +	DRM_XE_RAS_ERROR_CORRECTABLE = 0,
> > > +	/** @DRM_XE_RAS_ERROR_NONFATAL: Non fatal Error */
> > > +	DRM_XE_RAS_ERROR_NONFATAL,
> > > +	/** @DRM_XE_RAS_ERROR_FATAL: Fatal error */
> > > +	DRM_XE_RAS_ERROR_FATAL,
> > > +	/** @DRM_XE_RAS_ERROR_SEVERITY_MAX: Max severity */
> > > +	DRM_XE_RAS_ERROR_SEVERITY_MAX, /* non-ABI */
> > 
> > This is guaranteed last member, so redundant comma.
> 
> ok
> 
> > 
> > > +};
> > > +
> > > +/**
> > > + * enum drm_xe_ras_error_class - Supported drm ras error classes.
> > > + */
> > > +enum drm_xe_ras_error_class {
> > > +	/** @DRM_XE_RAS_ERROR_CORE_COMPUTE: GT and Media Error */
> > > +	DRM_XE_RAS_ERROR_CORE_COMPUTE = 1,
> > > +	/** @DRM_XE_RAS_ERROR_SOC_INTERNAL: SOC Error */
> > > +	DRM_XE_RAS_ERROR_SOC_INTERNAL,
> > > +	/** @DRM_XE_RAS_ERROR_CLASS_MAX: Max Error */
> > > +	DRM_XE_RAS_ERROR_CLASS_MAX,	/* non-ABI */
> > 
> > Ditto.
> > 
> > > +};
> > 
> > Also, all of the enums share the same DRM_XE_RAS_ERROR_* prefix, so let's try
> > to have distinguishable naming. Perhaps [*] would be useful here as well ;)
> 
> DRM_XE_RAS_ERROR_SEVERITY_* will cause longer names. Any suggestions?

Try this full version first and see how the outcome looks like...
if we are still respecting the line limits without ugly cuts, then let's go with it.
otherwise try something shorter ERR_SEV_ ... or something like that...

> 
> Thanks
> Riana
> 
> > 
> > Raag
> 
