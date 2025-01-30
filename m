Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0414CA22DA8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 14:24:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6924810E95F;
	Thu, 30 Jan 2025 13:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jKuIvJWJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CD710E95E;
 Thu, 30 Jan 2025 13:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738243478; x=1769779478;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9NJbJ9N2PxQ37zFNf/6k4rvUBdMk+NkxsXntDmlSO3E=;
 b=jKuIvJWJd814aV1MvdD5zrLC5g5VAEMpvOR5jA5QnR5p3LdwuKRn6TFO
 Wu2874k2zEzOOXALHpQvTNZha8+yMhdVBBftNlLqBWSWm7trzBsxvFUE6
 LcdcxPch61zKPww4wFyRV00wif/upy7o2YQXzpRbrwTJINTsXieTk2b6y
 juJTEjJ/HaI5ElhksauBfo1UKPOqJFw809X6/GGMQWd0FOwURwPFXe3+Z
 h8DkfVMAxA5MlQj11nT1e5FoDXYA6QBPcm9uTjL9bLr6eWHrpgldX4gJQ
 zAw2MWi3eFjFayfJAu+C7IIJ5MyRztiHUqEAR6mWS/I35sVm1a5DfkWWP w==;
X-CSE-ConnectionGUID: FnLQij7vRQWOFCWXOOhIqA==
X-CSE-MsgGUID: x9sOnELoQ2a75FBERotqTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50205935"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50205935"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 05:24:37 -0800
X-CSE-ConnectionGUID: rsi+C9pDS+KUU7//cwuoIg==
X-CSE-MsgGUID: ECLOpLnUQ2uJxjTdrPIhMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="140208497"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 05:24:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 05:24:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 05:24:36 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 05:24:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0At5dzCV6XqMoguiMvsL5eUfaGrfNf7ICrr991a+kQ8Bm3XcWT7gag+79eEF+sdvswuVskNUmDdBWK6WTvCic9bwnk9VONLP6kTwJQTi4+FxaRUcQrHzzg8Nggsp4RjDWU6roJaOLepPjG8eZuJWfINSXyjlQToAy//DrS5WkpzGSJR203Y3bSCra0BFvh+F2ZGVpzvahdnySQVBP5QtdtK+9IF9dr69F1f+WugeBG9E/6VmJZ4dC4SKXXIg3nlHKel2JaT+vefxgm0lT0sv99zCgBpd8MYNTJPnzUqj82YpNXjiBncegJST8Uh2/DDMf21BTuu4kbNF1+wUUp6sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Is8QtYPZHQdUS63tiEc/onihkjIBH6CSrHFe01xs6+c=;
 b=AsTGmb8Qm5dyaxV6QYRRa88S2oxK3ykzYwFUpzkJz53uixVIv7GzJdDiszU/MicxgVSsuTE1PvUYd/ebyB5/JEcfF8+zfeDqEuVqwGW5APPBPHrcDErvj2sfkibsHFeH36uK+HMjNga6yeyYvojuUAEpi55fqo3WUMMiGW4QkIHvACGDqey6IapHCHFaZi/CqU1NSeQ33KysHwEpU1fyCDmBDe3IogmT8vDNKZbdbL4h863vmtN+NPPRw7kTxOKcUL3xJgSowfVkTrJ7B5APg+QOKjp+rF/zIEUyXJNQ1JXx3BgIlgBeVFpmXjgQwNETAHKZz2CJaIIxqlTPvd/jSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 PH7PR11MB5984.namprd11.prod.outlook.com (2603:10b6:510:1e3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Thu, 30 Jan
 2025 13:24:34 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%4]) with mapi id 15.20.8377.021; Thu, 30 Jan 2025
 13:24:34 +0000
Message-ID: <0e325482-ab21-4fac-a916-5809bcc39b40@intel.com>
Date: Thu, 30 Jan 2025 15:24:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/33] drm/xe: Add drm_pagemap ops to SVM
To: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>,
 <airlied@gmail.com>, <thomas.hellstrom@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-24-matthew.brost@intel.com>
 <9851fe89-e2f6-4153-bbc0-7e1358155e9d@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <9851fe89-e2f6-4153-bbc0-7e1358155e9d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0186.eurprd09.prod.outlook.com
 (2603:10a6:800:120::40) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|PH7PR11MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: e30d741e-9546-4179-02b6-08dd41316fb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkQ2dmtBRFphSFFvSG5XQm5kSXJTOTgxR2RvVS9DZEVmbVc1NFBxejAreTZo?=
 =?utf-8?B?endpZnFHamxKcWxyeVFzRFlYRjM2cEFwRUxrc201VEhMWDBsdDhxNE9LVGQx?=
 =?utf-8?B?Y1lHajlkaHN5T1ppdVRVRnVNWFZ5WGZ5YW1paEtYVkgvdlRnSnBpN0o0TkF0?=
 =?utf-8?B?QWlnNml0NVp2dW5zOWdBeXlXZUd0RGI1cTdraXpoWk05UVVIOVFxdjNsNVk3?=
 =?utf-8?B?NUcyR0tMdXRWZ293Y2c3QTVqbjRnOWY2R1FMWVFWNXZqcHZVYzZhRW95MDI4?=
 =?utf-8?B?eDI0cEtBcjZTMU90QldzZDdpMyswWjE3MWFCRnFWR3ZQQUxsQXJ2cWxJbFQ3?=
 =?utf-8?B?UGZwVmZ4UGhBeHduenJHbDI5d2V3YVBzM1VqSERRVklLZXU2c1kvUDJFQXlH?=
 =?utf-8?B?VTBSd0QvTXJ4ME5OYVhzTG9Temg3cTd4Z2lFQkprM2tKajdEbElpNlN5a2xQ?=
 =?utf-8?B?bVIzRXNCakFtL0JFNEJwS3luRGEyYkJXVVpDWVNhdkJHUGNURHl6bXZsUEFH?=
 =?utf-8?B?MXFXQzIvYSszUVF2dDRjeWxBczVQZEtBWjdrd1UydFVFMXBBbVJLckp5UDY4?=
 =?utf-8?B?bldhYjErSmIzZ2R2a3JxajZmU1JhSHBLMEM4dnVKVXdLSW42aXNUdDdWcHVX?=
 =?utf-8?B?TnpxMGpZWmV3ME9WZVBzdjYrYVZVZG1uTDVlcFB2Y29GZFhHQzk1d2laTU9O?=
 =?utf-8?B?UEJrMkxraURYWHJWc3VUWmxUeHByblNTdWp0cmhKRGxYMkRJQUh6dzFLbVFR?=
 =?utf-8?B?SDREYk8xWHNqZlZWNGp1Umt6cWZsN1hiRXFBbTVWcDFjQnBIZGRRUHFzRmc2?=
 =?utf-8?B?Ris5L3NKY0R3aHJjUjV2NWlaQXVGOStjaDNvWStFSlNrS3g2T3VnRUJyc1BF?=
 =?utf-8?B?VER6VXFrZ0V4YmVUREk5dmxYdjRWZUJmbEpURTVRWGQvV242Qkw2bVFkYmw2?=
 =?utf-8?B?V1pqblk4b2F2MTBwOFJXQnBxdjRqczJrMzdiN21HWlN1OUMzQmUydzlzTE5T?=
 =?utf-8?B?aE5kTkpVRnZ3ZGJKL3JiSWFBTzFBbWpVM1MzVHlIVXEwTkN3YnBCY3l4VnJZ?=
 =?utf-8?B?SE9zQmhPSEpZT1Y0UC9Ja2lyOW44VU9KRkRaUjBBV2Q2SCs5L1BTb0tmY1FU?=
 =?utf-8?B?VW5RNTkwYUkvMWZnSnJJcmFOVFNubFNUOEdnV0YxZXc1ckJPOUlJNnYzaTlz?=
 =?utf-8?B?Mk1mOU5NRFdTRjJJL0NHVkxLRDFzQlM2Sk5UemlRSURaZVNGelRPR2ZEUUti?=
 =?utf-8?B?dm1vQzVjV2xKSFV0Slh4SkN2TTVaQ3N4RVY1ajhUM0hoSS9salArMkZwVkph?=
 =?utf-8?B?OUVaSkt5Vy9nRVdhNUFpVFllQmV3UG5QcHh4MnBEdU5PcXZBZmNQMTMvSmR5?=
 =?utf-8?B?b05jTEVpWFliY2pOSEdZVGdsOGdBcUdXRm1mb0l1VFROYmpBM0I0M1BBVFhp?=
 =?utf-8?B?UHk3dWVyREVHVE5VV2x6NWZ4VncrWFd2UUpUUkNnQ0tqakNucHhlS0xyMXk2?=
 =?utf-8?B?T21vLy9PN3lPRzk1emFIaG5vRUxNUUh6elMrenJVYUJuNjFwc0dOZCt4azY3?=
 =?utf-8?B?czdLVGhLemtONHlvNng4R3NQSklkbXJ0SGhHdFgySHd4bTM1RWxBZngrVUhr?=
 =?utf-8?B?ektIUk5YeDZtdEk3amh6QWdEdHFvbkNlTjBFa1RnMHA4TThLVTNNTGFXYkx1?=
 =?utf-8?B?b05nbGgvNFk1V1ZtZUh2aDJHYVlXK0VjNlpVSWhIYU5TZ2Q1QisvQ0I3dFJz?=
 =?utf-8?B?K1U3SGc0aHBVSVZRdXA2L1JBU21mT2kvTzdoRXcrWEUrUVllTDM0QXpKTkN2?=
 =?utf-8?B?aUJSMW5OZ3dqTzUwL0dValFnc3JMZzBvVU9OeXlpcE5VbEhjQmk4QzUxbEFB?=
 =?utf-8?Q?qVzcrHwjR4ByD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGxITEVjRXFkd3N1TDVZZ2xseVJWd3pkbUhuSWgzOWxPMzAvVjExbE90WmtZ?=
 =?utf-8?B?M3FDU1JQZUNnc09BbUcrUVQ2TVZCSjYyRGpsZmxXeXZMckV1TFJEcElrRHpz?=
 =?utf-8?B?VGNOWHI0NTFva2x2ZkFFc1ZQM3gwYy90YnRnVkxJdXg0cm1FZCtyVnJ1UEJ3?=
 =?utf-8?B?NDludW1aTHk1czFuOHNESS9TUy9iZWpoNUlSbFB5VVhORS9BRlNkS004QXJT?=
 =?utf-8?B?by95MEQ3YjJubDZLRUplRzdydEl6ZWxibE9YdDNtOWUyMDdvRHNQTWViYU5W?=
 =?utf-8?B?NGtMVS9Ec1ZEYmhpZ2xqNE9UQ3lIV1NocUJoY3hqclM4SEJyYkdBc2NTdnda?=
 =?utf-8?B?TVp2UXlYbEhDNExOR1ZUWEN5cXBERk40Sm5uN1dsbkdmZ1JCU0dqc2tvMGRO?=
 =?utf-8?B?TUVjc0lkTExTclFEcUFvc09QeUZkTzh6bEF6VVUrb2tBdTNsSFkzTDJpbGlT?=
 =?utf-8?B?WTV4QmQycXVTSDI1aFBOc01sbnJacnh3QmdjelE0ZDVlbGlBZmFsREVFT0FN?=
 =?utf-8?B?ekIyR25BeGt1YUxYbG1OOHdXYmx0bjJCejBGaHU4TjN4QkpuL0tpV09hSG1i?=
 =?utf-8?B?MCtNY3hYSW85ZTdETXc4eVl2M05wLzEvT1hVYzd5bDg3S0F6STdsbDc1NzZo?=
 =?utf-8?B?SEdOVnBmZGpoandYelRTTUtnZWNsallMMk9yblZsYkl4U3VzM3lUNmNvSE9U?=
 =?utf-8?B?bDFrZXk5UGptR1cvTjkzdVNDd05oL3MzMktJNmVWSFhkZGYyS2RKRjNOb0di?=
 =?utf-8?B?SEFzd2pHWnJDMFdjYmk5N2U5Y2VwTTVoWGZQSURHWDZ0MG8xNHg5MmhVakVS?=
 =?utf-8?B?dUJFSzlXSGhXMk9PaEZsQmU3eDNmZmJvTWhJNGFYZTJ6SHhabktDd283MTZr?=
 =?utf-8?B?VlI2bjJGeHNxOVdGNWt2aDZhbXdBSHcxVUFQS1hnclRLT0NQVG43MVVUS1BC?=
 =?utf-8?B?YzZGb3htSjdMUzZoSEZkVE5KMkkzNW56N0hrRGduTHV5bmJVZWdyMGR6cHlO?=
 =?utf-8?B?dHE4eXRUSzM5NThhN3A5eW53a1Bpakd3NXFWMHU5RmVTR2FsWlgybVBnQVZn?=
 =?utf-8?B?ZFdpOW9kWjJGeVFTNVlZeTdPL1lmcDJHc1VpN3pxY0tic0dBN29QQi9WRnJM?=
 =?utf-8?B?UG10ZkdXdmpscG5HWitJK3NnaEgyYjJqc2d5dTBpK0xMRGRCenUrNFlscEFY?=
 =?utf-8?B?TTdGbjJiYW9sclhqRFdZVjcySUZqTUZMS09YSnpvazU2SEtLN3VidDZSNUFJ?=
 =?utf-8?B?dkdESEg0M3ZTY1pDN0owS3l3bWIxa25CaXEwMkFabzVrZUhYMXNScU5mc1Fy?=
 =?utf-8?B?RTBKcHhReUpEbUpCeHliblArUFF6Sm5ndWVTVmhaY3BXWjRxY0pnRGNXVmJs?=
 =?utf-8?B?ZlhQOEdIa3hxUXZiSWl2UVVOTVBuMWlZdkdVQ3hwS3dObVpzeUpCbUhtN3Bl?=
 =?utf-8?B?dnQ2d1dsRk1lWXRJNWloa3dVeCsxRThHZG9kL0ZxZEFVbWQ4RmxySzFDNm42?=
 =?utf-8?B?Q2hMbXBtUjVrOFd4YXFKNHJuU004UFU0Ri90VjVOYUxYejlsOFhPOU5Zb0Ex?=
 =?utf-8?B?OHVqaTFMOGFXK1EwUDZ5bFE3R0tjUmo5SS92RmdMZmcvdldneW1xL1JJTGha?=
 =?utf-8?B?UEtzZ0dIc1dMVXIzZW01NENadHhVcVc0TDdBUlkyYkd2R3gzU00xbTJxQXVn?=
 =?utf-8?B?NEVjbllIbUxTOGU2djZSUXFLeXFjYkFMcVJRNW1pTTlsMkJxdnlESk9pOTRX?=
 =?utf-8?B?VDlMSExBZEtmUEpsL1A0WFVTQjdhaFJmeGFGT1VWdStjbjNKc2R1Z3NId2or?=
 =?utf-8?B?NW82WmNBdDJ5cVpVbVRlZ25hd1FGRjEvcnJpRFE2ZGJXVGkvSDc3UnJySU0x?=
 =?utf-8?B?WFVnSDFBQUhwa0VVd053VGREN01sNjNmbW1rdG1QbVo2UnAxS0w5LzhRY3lt?=
 =?utf-8?B?Mnd6Ujc0azF5QURUbHgxNGVZMkhSRUw5dE05eXdlYWpDQzVzY2RtVG9laFRK?=
 =?utf-8?B?TVpwV2lrWEZabUVMQ1NEL2tUV240bXQwNDFpMncwY3ZOaEJLaWp6dlZCbGlT?=
 =?utf-8?B?RGd0bGphVGlqNVd4R1JCeVROL0hsNmlyS3dxVEZaOHNBMzJlMDFFbHl6bmZt?=
 =?utf-8?B?RUI1UlFLTkZTUTlrRExXNVN4TTFtR0crb1Z3RmZ4UmEremR3Qk1FK1ZmQ0Vm?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e30d741e-9546-4179-02b6-08dd41316fb8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 13:24:34.4129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XByognb1kZXQPhfHvlWIgXp/kyWh7ocxXD3o9TURiYjM9qJlAhosUCcUscnrVS5US5VOuzpJQikncsIDUTMGtv9D+MdgwPS6XWsDnD0m84c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5984
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



On 1/30/25 12:54 PM, Matthew Auld wrote:
> On 29/01/2025 19:52, Matthew Brost wrote:
>> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>
>> Add support for mapping device pages to Xe SVM by attaching drm_pagemap
>> to a memory region, which is then linked to a GPU SVM devmem allocation.
>> This enables GPU SVM to derive the device page address.
>>
>> v3:
>>   - Better commit message (Thomas)
>>   - New drm_pagemap.h location
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
>>   drivers/gpu/drm/xe/xe_svm.c          | 31 ++++++++++++++++++++++++++++
>>   2 files changed, 37 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/ 
>> xe/xe_device_types.h
>> index da5bf145324b..eb3702db5c17 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -10,6 +10,7 @@
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_file.h>
>> +#include <drm/drm_pagemap.h>
>>   #include <drm/ttm/ttm_device.h>
>>   #include "xe_devcoredump_types.h"
>> @@ -106,6 +107,11 @@ struct xe_mem_region {
>>       void __iomem *mapping;
>>       /** @pagemap: Used to remap device memory as ZONE_DEVICE */
>>       struct dev_pagemap pagemap;
>> +    /**
>> +     * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
>> +     * pages of this tile.
>> +     */
>> +    struct drm_pagemap dpagemap;
>>       /**
>>        * @hpa_base: base host physical address
>>        *
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index 985ac20c5b07..869a155fc9f7 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -450,6 +450,33 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 
>> start, u64 end)
>>   }
>>   #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
>> +static struct drm_pagemap_dma_addr
>> +xe_drm_pagemap_map_dma(struct drm_pagemap *dpagemap,
>> +               struct device *dev,
>> +               struct page *page,
>> +               unsigned int order,
>> +               enum dma_data_direction dir)
>> +{
>> +    struct device *pgmap_dev = dpagemap->dev;
>> +    enum drm_interconnect_protocol prot;
>> +    dma_addr_t addr;
>> +
>> +    if (pgmap_dev == dev) {
>> +        addr = xe_mem_region_page_to_dpa(page_to_mr(page), page);
>> +        prot = XE_INTERCONNECT_VRAM;
>> +    } else {
>> +        addr = DMA_MAPPING_ERROR;
>> +        prot = 0;
>> +    }
>> +
>> +    return drm_pagemap_dma_addr_encode(addr, prot, order, dir);
>> +}
>> +
>> +static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
>> +    .map_dma = xe_drm_pagemap_map_dma,
>> +};
>> +
>> +>>>>>>> 133db8ade5f0 (drm/xe: Add drm_pagemap ops to SVM)
> 
> Some leftover rebase damage here?
> 
FYI, when applying this series to the latest drm-tip for testing, the 
line did not cause problems for auto-merging on my side. I applied the 
patch with “git am -3 ”.
>>   /**
>>    * xe_devm_add: Remap and provide memmap backing for device memory
>>    * @tile: tile that the memory region belongs to
>> @@ -482,6 +509,10 @@ int xe_devm_add(struct xe_tile *tile, struct 
>> xe_mem_region *mr)
>>       mr->pagemap.ops = drm_gpusvm_pagemap_ops_get();
>>       mr->pagemap.owner = xe_svm_devm_owner(xe);
>>       addr = devm_memremap_pages(dev, &mr->pagemap);
>> +
>> +    mr->dpagemap.dev = dev;
>> +    mr->dpagemap.ops = &xe_drm_pagemap_ops;
>> +
>>       if (IS_ERR(addr)) {
>>           devm_release_mem_region(dev, res->start, resource_size(res));
>>           ret = PTR_ERR(addr);
> 

