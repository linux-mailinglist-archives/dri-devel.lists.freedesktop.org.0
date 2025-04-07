Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 840BBA7D407
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 08:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F91510E1D6;
	Mon,  7 Apr 2025 06:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ic2CcY56";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690D210E176;
 Mon,  7 Apr 2025 06:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744007437; x=1775543437;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tiACsnbTov4BYWvacRLhC/ehqqCH/ZBF3mFwNvZTkd8=;
 b=ic2CcY56QoPvQgbBtNbJISknW3uraL9RVrHFCNA2xVcdehLyywLNlqZJ
 nqsT0sE/3RYZko/bLPDIDA3mhBEMo0uNGMHx6+TktIpBlvxmAyDa4lbnI
 j7vTYzPz/RytUlKKT5NrFOTft5cZRbKbhTVgxOFX4VwZQ382Q4bOfricZ
 odeFs7nRORZ5+KDgo2MMyWJdmMalxLyZ+PSQ0z6DlK1T5DV80PiVrlBFP
 GPx3Y2k8wOvXw88rjzkftWSICTvDPZ9q3EJZYjoUoODBYOaL5IpbBwxI4
 9xJJSig6MnyU0hdyJ0ECSccogVJeJ7srV83hI8X+vDvTLf6Cm42ngN2he w==;
X-CSE-ConnectionGUID: vBjszHaDQWyZ94n0jx0+Hw==
X-CSE-MsgGUID: Cb20zzujQguiMjrFvkWm3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="48090178"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="48090178"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 23:30:37 -0700
X-CSE-ConnectionGUID: OFC9MlJ/SrajQ2o0LeiK0w==
X-CSE-MsgGUID: 2xHN/d7bSD+vweKce+07/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="128723423"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 23:30:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 6 Apr 2025 23:30:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 6 Apr 2025 23:30:36 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 6 Apr 2025 23:30:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r84ibRyuKMgRZ6g/sZf5+8zn/WaEkN/8nUhY7lHtBMc3QvbrbY2Md7PpcCn+29w+5SDjgmfi/2u+aGg1+GUwMJkMGmzeMltuFZ96vsINtEnCch3IBYsCIkkJxSKcPrjz5/EHxzzo6C6t0I4K8kbTlode/3PTUzLpUsFpWsl8Bq447PHzbQZ3FSrEicrHDAQk3DB7AU+vGRWsYOJtLsDTj383B5mf4Casz8GD1OV/TzDtU4Ydik4k5UunnKN2e0Ei3RpU2duK2pZHR4ycXVjQOEd694xnhm/ZOlU6PEaUla97o9zYSPnIGepkRrz+XesFjqMy7hFcpBehOKxheQ5ogQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NefTFndFZN7qJ2C+BesaMffP1LiO5vDElVJYjwcN7H8=;
 b=i4109482Rnkcp8SXbTnxD/RcTfVMDPSupVuxn/gK9oKyq5ArtXsWCemRL+dYD3tRJpFwc5N9lxVfchDehaVIH9t2JL8yWPMiUP93GY/IXTgY8LICUvTtH0YjVcS/tYl+RlbIz3KdwulcmL9XK5oFrQj66thMo+otT7cl9M8IvYEqI8zI5xupyhkAkFaXq7+Qb2AZUJFxvarSgohuMEgvY9GSQhMVrQMDtp3ZZKDJ2g7f5YHyJmHMBysWA84jXaB7Zi6kiJzFXz+rajpzvkg5Z3AlyTBFcNp1FXPVva+2K3ZkYMiWttSKA0LHMy75pCp6m+SiRxuDZbYNHNqiwhEVWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SJ0PR11MB5101.namprd11.prod.outlook.com (2603:10b6:a03:2dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Mon, 7 Apr
 2025 06:30:16 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 06:30:16 +0000
Message-ID: <c7bc31f0-f4d0-4ace-aa68-12c2d45cef7c@intel.com>
Date: Mon, 7 Apr 2025 12:00:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] drm/i915/display: Set and get the casf config
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
References: <20250402125647.361295-1-nemesa.garg@intel.com>
 <20250402125647.361295-9-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250402125647.361295-9-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::9) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SJ0PR11MB5101:EE_
X-MS-Office365-Filtering-Correlation-Id: ebe0ee7b-33de-4c46-e8af-08dd759da8ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVVwb2FkeWN0SDcrOENVSlpseEhOS3IzbFNKSEh5OWRZRElyNnlsL1dXdHpa?=
 =?utf-8?B?WjRJSHpSUWVMUkpYd0t5aVdyWk9WdHVFVW44a2pDeDlNK0h3clpEN3gyZENk?=
 =?utf-8?B?WGo5ZGoxd2NpTTh2RmFMRXdTdWxoSy9SeHdnUlIrMGpBVXhPdEVxcE0wZGhS?=
 =?utf-8?B?Q2RKcEp3OXpkOVd4QjFJclNKTlYvcGhYZk1mRTdEZGRJOWE1NHpYMHpEYmQx?=
 =?utf-8?B?Q3QreUhKZHdoUHB2bFkyVWp3eGlqcFRBaUZpaURHV1BENUl5dG0rMW1BZDFm?=
 =?utf-8?B?Q1BEMGppRTJUY09TT2RERjE0ejh6S0RUeWJIcWdkL3J0L0xvNDRYWmdrUmQz?=
 =?utf-8?B?aTA3L2V3Z3VSd3l4ZnFoTEhqWTZ5ZTBZYXBvaW1RMFppTjBPNmNRL0JkSHBV?=
 =?utf-8?B?ZkZRay95T0JWc3QraGRydTU4OEFuWmgzTmlSb0wyWFl0MU9HeVFETnl4YWsw?=
 =?utf-8?B?MURWRVN3VzQvNWNWZnFhblRhTFlGd0doL2hQYTFxdEdUdmFydnBLZlBJNXg3?=
 =?utf-8?B?Syt2RXB6cFBDR1FkSGU5enVYYWcweWxNSmh1bkFvNmx4N3NlQ0NxMFArZ1Vw?=
 =?utf-8?B?WnprZGk1TWNqTVAxQWUwRFJ0UGRKVTh4RElDWG8wQzY1UXZIRVlibmw4MkJX?=
 =?utf-8?B?MmUxVUUxMUcvMHNqNEZ3OGkwNUJiaU9aTUNwTDFLRjl0Yk1wSm5qall2Wlh0?=
 =?utf-8?B?azJuTEhVL3VTK1BtTUMyVGdRbGRISjZkcTQyVVYzSDU1S2dyU2JOUG9BY20v?=
 =?utf-8?B?Q2tJdlZGWkRsMlJGeUpDR2FUMm5HUjV4a2lLMFUrWVlRYlBkM1c4cm1BSkpE?=
 =?utf-8?B?bERGb0JjNGN2elJ4N3A3akFQbUt0aGExaUQ2czc0TE1IdElaR0FnM0t4Wkhl?=
 =?utf-8?B?bGJHVjRrN3l4OHprYXlyWEptR3RwVzJJbnU0TTE3UW9CcG9Cb1ArSm5FVFlR?=
 =?utf-8?B?Q1kxczgvS08xS2F0RXpPdmw1ZkxSN2Jhbkw0aHhsMlhLcW80RmI5VzNtdnRz?=
 =?utf-8?B?LzI3S0NvMkphME5mbnpuSElOak5FVFVaWHVQMFhYeEhmQ0hRVHJCSGNVakFq?=
 =?utf-8?B?SmxwRnI4Y05JN1dNUVlaZk1PQ0FUVkpLNXlIQVlpNDE2cXQ3YXRBVUovSllD?=
 =?utf-8?B?SG5HbnVQNTcvZ251RkpjcHl0NTQ2NVRDa0xBVHY0eHdBNHFkRHJNcENyTXFl?=
 =?utf-8?B?bUZKR2tyeEJsTGRYWGorZ1NWVkRTTlRHR0pET3ZHRnVjdVQxa2lNWUZFdTV1?=
 =?utf-8?B?SGdmNzM3cUNQZ1NJcklqUngzWjZxUTFrd2tUNllNc2ZFVXNjSVZzdlpwaEty?=
 =?utf-8?B?ZitIdHpyUjZwVE8zUTNEdXkzeXVicS9sajRpZE1oVjI1b25GYi9PcEFza0R5?=
 =?utf-8?B?YWV5OXRRS21jR2o0bUVwV01BK1lLRWRyRVE5aXNVelp3a1psNm1RRkV0ejVj?=
 =?utf-8?B?ejhHKzZRc21wWlhNYmFTd2JKdzJuL0cydEZMOUVmWGNoQ1NBRnF5VFVFYjdp?=
 =?utf-8?B?bjc3bnowbVVBTjZTQU1aQWpCaHA3VDZaK2x0ODRWSVVvT0VuNTFaa2c1Q09Z?=
 =?utf-8?B?WXRjZ0xDNXVQdE5wSjVzZ0k2S3FrdGc2QUUvRWVpQXJYZVNZRkRDQlMxOHF6?=
 =?utf-8?B?SWZBZkJPWFpPaEJRT1hXb3h2NElldEhaTVhuNkFoREFoZng2TUFpcHdrU3NB?=
 =?utf-8?B?UXJSU2NrZllLWEpxZFZuUnVDUkJEYXN3eitIdmQwSEFKeUNtd0tET3BFQTN4?=
 =?utf-8?B?eHFwWjRMMWM2dlRoSjUrMmFkSEk3UVZtM3JVSkhzTWZ2SmhZWU9YcHE5MjMx?=
 =?utf-8?B?RzRJbHdtand3L2JkSkNOcEhzZHRSSnZMNU1USzNhWW1XZWhGS01HeVNrRmV6?=
 =?utf-8?Q?+Vgaq8IkqnNYV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmIrcnFZeXBqWFl6Yi81OW9QNUdPNHpQVHZRVGF6YjE4aSt1ZDdTWXB4ckRj?=
 =?utf-8?B?WTA5S2FIRStPdGZsQS9ZNERYSDVmUlFtaHQvRUFLa0lSUVN4VTUvVTVKeGZN?=
 =?utf-8?B?SGU4NTFWZ255VGhNaXlCcEtpVnFYZEYwbmFZQXdONmJ4ckJEZ0hZVUlvR0pv?=
 =?utf-8?B?ZXZOMVk2M0RESlRGdVE3NDIvZ21aVDdJSHRnd1B4TG1EYjV2UkxlUmlEMWJE?=
 =?utf-8?B?bkxwN1BZNktpYW1CS0FENGUzMzBTNVl0QWpwVUU4K1EwSTc5RThDTHh5WXQv?=
 =?utf-8?B?cTMyTS9hYkpOb0JYeXJROWlUekpyZ0R4cmJ1SFpBUnBoWmdhVUFlZzNFeXhT?=
 =?utf-8?B?UG5kcmZ4aVZWdktKT2FTc3dGTlVIS2dEdkswMmpjazJrWmo2ZENNR1dSYTZ4?=
 =?utf-8?B?SzR1djczaUI2T2kwWjZmNVgyZ1lzM0FmM3IyUm52cU12eXFzODFVaVg4cW9M?=
 =?utf-8?B?TVI4UFVwOHlkRzFXSEZ5VEhocGFEblU3ODhXclVsbjMrNmpYVzRma3JWK3pC?=
 =?utf-8?B?M1V1RmVKRWZIcnRHcG42TDhabktkMWxyWkhvcld2RzRsSTF6eEdudWVpRnVn?=
 =?utf-8?B?S2NUVnZaZHI4NWdXdk9UYmtWNC9RY2pVdGJ1VTNEc1MwYzhVS2MzREJYeVda?=
 =?utf-8?B?aHlDL1E0blpCSEZhcUZHVk5sQkxzQnhkcGN5UGs4cTdzbzJ3bUZSRWhWSHJ2?=
 =?utf-8?B?U0FjYTlycVR3cnlOeVYyWUJNZ0VyK1VDOEVXK0lRbnZoTmpCKzlLTG1NSG1Z?=
 =?utf-8?B?bWo3Q28wRjJlbElHK2lPQzdYMGMrdWYwUkE5eVlGZ2ExRUY5ZEF2cDJRVGdQ?=
 =?utf-8?B?MnBGVkN4V005aHQrWmUxcUlQRDkvR0VMVnlRTjJSU2xTbGFFQkpERWdSdjJy?=
 =?utf-8?B?Z1NZSmdQa3JHUlgzRDNxODdFdWNmdjhHM2FhUFAzMmRSSXFzNVFQWVdPQ0hw?=
 =?utf-8?B?cENMOFBNUTMvMmZZZGsxaHBBanZMbngrWk9iYy9FKzM0bndPYTRsdW5IZS8z?=
 =?utf-8?B?bTlXYUYyaEtzUlNWOVZxcW56MDNyYnpLSy9nWmZvVWJNSmtkUzJRc0xtL2Jv?=
 =?utf-8?B?dHpVQnlTS2NRQ3RMMVhDaElPS082dDBqL2J0TDZ5a3R6Q0dNcmkrcC9Fa01V?=
 =?utf-8?B?ZWNpM0d2Y01MYUFYZVluSzJsLzlxZWNkVnBsZ2RvQklkQnZoTGgwbVMxbi9U?=
 =?utf-8?B?ZTFXc1F0cHdkZDc4Y2lzZnJUeXVrc21WTUFYdFhEb1FhZlRnRlBIbWg2SEZS?=
 =?utf-8?B?b1R6UkRxYWJvMjJhSXMrSW95V25mZm5QcEtTUngxcXhnTXVpRWxOUHpkb2lx?=
 =?utf-8?B?MVlNRGwrNW1EV3U0SDhRbnA0YzdwWWRyQ0xRdkRzK1NnejFMYXZWL3hVRkR0?=
 =?utf-8?B?NDQzajhIQ1E1UTlFQnp3WWVUcHRWS2pPU24rYkdreWY1TCs5ZGlIUW1sTnJI?=
 =?utf-8?B?b1U1ZDdldWg5cDVLVVlkOFZtdUg3Z1BtUkZPT3QzQjE1ZzhaNjYzcGhhWElY?=
 =?utf-8?B?czRPNWNhc2VVUHl3ZnVsakhEUURYam5IWjlUc3ZrTFdtc05CcEtDaHJlb1Bx?=
 =?utf-8?B?SzY4dUpMSUdyR1h6SHVoak5BSm5TSkdDUmlueXFjQURpNEdKTE5aMVg5eWl6?=
 =?utf-8?B?WUdQZ1pQNkdDaG5ocmwzcVdvc3c4OWVpQktaNzJ6d05RbDlBdVU1cVByOUE4?=
 =?utf-8?B?enN1ZEVTUXEyZk9JQjdzSW9FNWp2R0dPR2NnTm1SMk5CUXBzN1ErVVIyQmt4?=
 =?utf-8?B?RE5HMnEzRTN3VkdJQUU0THJlZ3Bkd1VLU2JTNWc0T0dBanljZVhrcXJFNHFv?=
 =?utf-8?B?UHJCL08xeExiYkxjR2F4cWV0RlFRRzk3dEJCZmFrQzR5T2s2UWZ6Ty9xRG92?=
 =?utf-8?B?RXFhckNjUFBuU3NIUVlNSUIyb2p4YWNONDYyT0pwL0RDRUxaUjA2b0gyckFO?=
 =?utf-8?B?amNqTmtNallML2xrME9WQVFVanpsS2hmOXhZR2xFV21FaFRrUUZGR1RFbnpG?=
 =?utf-8?B?aVBnTWZUVkRJNWJ5R3BhcWNud3h1YXp5UHFLWkFCdkJ3SUtsV1dQUmFabi9F?=
 =?utf-8?B?VHFGd2p3ZzhJemJYV0ZzM0xyckd3dTlrZXRJZzFRMFA3TEtPSTU1RlBFUC9E?=
 =?utf-8?B?bFg0Si9zNWc1SnpIeUlzZzhRZklaOW9CTWdpdEszOUg4RkxQV2RmM0JRVXVJ?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe0ee7b-33de-4c46-e8af-08dd759da8ec
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 06:30:16.2110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2PMzlxhg2pfv/b/vhJfXvBaJtirosyv2MbAupanGCKgQm/GMfjiryUj3RUtu9wkF5OCGgGbc7H2vYckrxAmg5bzsJlnuHwRGcSvGXU8FuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5101
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


On 4/2/2025 6:26 PM, Nemesa Garg wrote:
> Set the configuration for CASF and capture it
> in crtc_state and get the configuration by
> reading back. Add the support to compare the
> software and hardware state of CASF.
>
> v2: Update subject[Ankit]
> v3: Add the state compare[Ankit]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

> ---
>   drivers/gpu/drm/i915/display/intel_display.c |  7 +++++++
>   drivers/gpu/drm/i915/display/skl_scaler.c    | 18 ++++++++++++------
>   2 files changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 4e84ee149fa2..db82da523323 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -4240,6 +4240,10 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
>   		return ret;
>   	}
>   
> +	ret = intel_casf_compute_config(crtc_state);
> +	if (ret)
> +		return ret;
> +
>   	if (DISPLAY_VER(display) >= 9) {
>   		if (intel_crtc_needs_modeset(crtc_state) ||
>   		    intel_crtc_needs_fastset(crtc_state) ||
> @@ -5292,6 +5296,9 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
>   
>   		PIPE_CONF_CHECK_I(scaler_state.scaler_id);
>   		PIPE_CONF_CHECK_I(pixel_rate);
> +		PIPE_CONF_CHECK_BOOL(hw.casf_params.casf_enable);
> +		PIPE_CONF_CHECK_I(hw.casf_params.win_size);
> +		PIPE_CONF_CHECK_I(hw.casf_params.strength);
>   
>   		PIPE_CONF_CHECK_X(gamma_mode);
>   		if (display->platform.cherryview)
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
> index d816dae9cec4..c22f067207af 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -961,16 +961,22 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
>   			continue;
>   
>   		id = i;
> -		crtc_state->pch_pfit.enabled = true;
> +
> +		if (HAS_CASF(display) && id == 1)
> +			intel_casf_sharpness_get_config(crtc_state);
> +
> +		if (!crtc_state->hw.casf_params.casf_enable)
> +			crtc_state->pch_pfit.enabled = true;
>   
>   		pos = intel_de_read(display, SKL_PS_WIN_POS(crtc->pipe, i));
>   		size = intel_de_read(display, SKL_PS_WIN_SZ(crtc->pipe, i));
>   
> -		drm_rect_init(&crtc_state->pch_pfit.dst,
> -			      REG_FIELD_GET(PS_WIN_XPOS_MASK, pos),
> -			      REG_FIELD_GET(PS_WIN_YPOS_MASK, pos),
> -			      REG_FIELD_GET(PS_WIN_XSIZE_MASK, size),
> -			      REG_FIELD_GET(PS_WIN_YSIZE_MASK, size));
> +		if (!crtc_state->hw.casf_params.casf_enable)
> +			drm_rect_init(&crtc_state->pch_pfit.dst,
> +				      REG_FIELD_GET(PS_WIN_XPOS_MASK, pos),
> +				      REG_FIELD_GET(PS_WIN_YPOS_MASK, pos),
> +				      REG_FIELD_GET(PS_WIN_XSIZE_MASK, size),
> +				      REG_FIELD_GET(PS_WIN_YSIZE_MASK, size));
>   
>   		scaler_state->scalers[i].in_use = true;
>   		break;
