Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E72A42C71
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 20:12:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322C810E4DA;
	Mon, 24 Feb 2025 19:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YBlijEO+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3508510E4B0;
 Mon, 24 Feb 2025 19:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740424361; x=1771960361;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=df7gpVWw+Ppf5fvI2lTK3gPTWn/lebH9yEEt8j4A7D0=;
 b=YBlijEO+XY+o0xb9KdKXgGRaagI+6HPFNZfkr0SJTQ7Zj3VW+uE3bgU+
 QBZHNk0NM8GJuTciWSh93U5L0wCdOwbYZPZslRGRvBVdU/mdjkYE185SA
 /FiZk10Gvj78AUGkn08NPE63nsY1JXhI6az7GmZOvEvX3VbAF++HZ6ZWm
 sHpvtCvETFK/mYYyWynAHBw87O2lc/PR+542fsH+SHVCoWxSq9YA4H7r1
 Eh1zCoQVmcHuX/Iei87wTwDoXRN5hxKgwrR2wK9raiABVjalYA7871lgL
 NQhEp6kkwH01VyjSIGpdWiAZJt2K9GYVXw8rLU0kRme7j+7upuyu5Ihu+ A==;
X-CSE-ConnectionGUID: dfSkgHhHRtuNgz46+IVBTg==
X-CSE-MsgGUID: ZRDFlRBhRIarmQ7ofrYUkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51832302"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="51832302"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 11:12:40 -0800
X-CSE-ConnectionGUID: rmrJOoZAR3WUIkEJ7dr07g==
X-CSE-MsgGUID: iI9OCTWbSqaYc+guZf310A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="139387981"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Feb 2025 11:12:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 24 Feb 2025 11:12:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 11:12:39 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 11:12:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6CmoxIE9BTrUuJSoFgq9aIG+Drgpzpm3iXLUBoGNqaWGiD7QScRlOfem1rJlv3LGr14SCHdrgH2h9ClHqESvCiKs8IU7l1hTsaUA5OVAl5ccBo57tkVHkCW1bcKp6og1XOP2+Th4TRUiSWxFbOJTZKKGuw8hA6N5CHmjYduqKLFb04pQD2CFgNa7iWB5fl9oha6xGv7ePxhFP380rsX9JyvtqMZwBMAPk/Xq071mWObDuKxDGuJlBx8ndrMPns163grRqEk5vd2q4hniY3A+K9fMlXrmbdfPyUmP+yOLGjhmRyShX9jjeoLZu+tdeo2o4Ej2Y8LsRiHUeRZaNXRvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/s1wK3GtaNaTYahlgAjDrPU/XODyrojfDGkkMJs9gk=;
 b=GyjKG7IhIYiG86nsa97BwN19ZMNX4fNOgULZoitbqO5EfRz5vXElk7t7VZ4Zm6C4JShe71JwrQJeebBqS0rMW9rnfFXZ1IrHH4kovUJaQ00AvHn6HVVlEUbWUff86m1S/rBbbspzKweCk5nWMrcGz2YZKo//USQJ5Ok7jGCUzXAm0cR9wMzUAYdeUkYRHt7XJEsKOo3Saft8i3eu+it3O48hv8Qn9k+oOv9y8qq9Ccc98PgN6kHlenfuXFjFLKpIYPZqIgbalmZNfdUsj/pcdRos+2EGewXZca8yB69GZ2jyDAOngXfpiANUrkDhhfbbmbKdVkc25hQ27HwfhnskVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8229.namprd11.prod.outlook.com (2603:10b6:8:15e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Mon, 24 Feb
 2025 19:11:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 19:11:50 +0000
Date: Mon, 24 Feb 2025 13:11:47 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH V9] drm/xe/uapi: Use hint for guc to set GT frequency
Message-ID: <xow55bqw5z2p33fq7z2pj75fhuogweynco2j76ku4skre6axoj@t7blqywfmsqb>
References: <20250212113830.9027-1-tejas.upadhyay@intel.com>
 <zi3xuzjcih4ok6ce6znqzx4azkorwkvxyt6n45wzadzwaiialg@7fsjvbfkmdby>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <zi3xuzjcih4ok6ce6znqzx4azkorwkvxyt6n45wzadzwaiialg@7fsjvbfkmdby>
X-ClientProxiedBy: MW3PR06CA0011.namprd06.prod.outlook.com
 (2603:10b6:303:2a::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f30cb57-4778-4c69-8d9b-08dd55071790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTg0TFNZVXlKVjBvN2s4OU5STWNNRWpldGdGR1VrMHBENityRjB6cEdvMDJs?=
 =?utf-8?B?aEFNWXl2NDEvdmVET1p3NzdMR0NHMGgxWE9MOGZPcHlwa1RYcGhuMklJcjlN?=
 =?utf-8?B?WXpnZWZVUDVnMnZZTURYN1FFc29jc0lobGNDNENaeVNLaGNkdWhyZW1TbXJq?=
 =?utf-8?B?R3lLL0s1d3FqUVZER3lyVW5iMTdNZkM4MjNoaWlLckUvMGg5Qmdyc0xzY0pE?=
 =?utf-8?B?NEQ3ejRQNWFWL2xWY3NjdHlzUUQ2cFdQdERmbWVHYXRlaVV0U2diYnh1SWkr?=
 =?utf-8?B?NmNuMmlYUm9MemNQUW8vM0VNMThxU1I1WUQyYWtxVXRDZ2xxMktMMFl6eXdQ?=
 =?utf-8?B?WmVKaGtOWEJOeE1NbFd2blh1azdqMXM0dlFIZG9kNGVyeFFRZ2Q0RGNzbmZq?=
 =?utf-8?B?a0RNbW1XWXlHdWxmbTlDdlJibEhuQ0pHKzRXVWVsZldRODNwLzJnbVBzT21o?=
 =?utf-8?B?Y1AxY2dUNkUzZmVRcnZHWTQ0WTNZY2ZMbnlSa1c1dXUzK05OS1ZOV1UxQ0NX?=
 =?utf-8?B?MmNlL21YOHBaRm1SRkFVMldtSlY2YWxkVUJFRXdkbDMrR09XeWJjN1NWL2Fi?=
 =?utf-8?B?cHhvNVQwZTVsR2wzeWQ4Z0tmdEkwRi9kNHZ2RDBiQjB6RUYvbXJjSnVNbDJ6?=
 =?utf-8?B?TkIyazhJMWFEWDdTV3RTR0Zza3REeG5zY2ZGbFlpR0pnRm5ROFAzbVlPWXE5?=
 =?utf-8?B?TERvOVkxM0hPN2plRU13SEZKRjZrMGVyRW9XSFI1Mk0xTnNGZ2NKTXlwZ0kx?=
 =?utf-8?B?S2hQQnE4Ni9KZDJCYjJuTE5IdXE1b3d0bjF6bHc0MjlPcVdJbXcvK0ZVTjd1?=
 =?utf-8?B?emJrckk4MjhqU2pQL0NGelBEcktmeENoT1FZWjY1cGYrYVJFeXYxU0FZWU5s?=
 =?utf-8?B?YzNKaC9YRHBtdktjWE5rTStXV0FmaUpuaXlXSndqdlRkbDRvakxPWDRUYU4w?=
 =?utf-8?B?V25nSE96bjlXYjk5RmRkTXdWejNJYjJ6OWJSM3NZby9yVGVoeGwzVHRhdWIx?=
 =?utf-8?B?cEQ0QlhsMHV4c0V3SzVGbHM4TXNERHZzL0tGcVVJZ0tKRnppZmIwYksyRjZj?=
 =?utf-8?B?WHFlTVZUeGw2azdyY2lMaWFMVlFVQzQxS2NDUWdoUW5nY0JNUDJ2aUlicjl2?=
 =?utf-8?B?T0NnKytOTWllQUZuc2daNFlWNWM2TEhDMnltTnNQNURUMTlrYkVNN1pNMVZL?=
 =?utf-8?B?RHlkMVNvczBQMU1ZbzZhc3l3dXRFbjZ5VytxaW53MUhWU2tQZnJOQklkelVo?=
 =?utf-8?B?cDJQRFFhNSs0dHNrajc5T3Z2UGVSTGtEY2NhNnBSTkhMc2lZNjllUmZtMXFJ?=
 =?utf-8?B?OEZONmdKcEd1VmxCb0FsNkVuRklpejJBOWJOY0h3aVlHSEx0Vi92bFp0eUJl?=
 =?utf-8?B?SnRLOGxOSkhvanQwNkg2WU55am5PV0x3aFVrUSttNlZiSTJGSmNTcU5mZFhV?=
 =?utf-8?B?S2p3V0drbFlSRzcxVmpjZ2tKNjJrS3lUbUFXVGd5dURyQkxGaWRNMU5sQ3R2?=
 =?utf-8?B?Vkp4dHI0N202SGxFeHhxakF4bUZUeTJvQzkzWXkwNmhnY3NacWROWjBrYm5H?=
 =?utf-8?B?RXRPVjBSQVdoTDhmcVNVWFBKbnYvZ0dGZ2tNWTJ1OFF1TzdMaVRwUWZRdzJk?=
 =?utf-8?B?aHRhNERVMkR2YzhUMDdxTHhMUWhUWFBwQ3pjdmxyWkJqSUVONFkxeHF0RzFo?=
 =?utf-8?B?aEd5VEp2YWtIT3JkZTh2NVBuL0w4ZmFZZFFrdFhXQWtoSkpJekRyT1BUQjly?=
 =?utf-8?B?OGc5Z1d5U3FGMVN3cjlmeWI5QUdCQVNJeVJoc1lQQVNxRlJzaHVVaEl0bzVE?=
 =?utf-8?B?dE1TSDkwQ2s5VEVkQWFMQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnEyaHgzQm16UTV0VVM2Z0FXWlREKzlmMFdrZklWTHMyOTErOG1MMEVZVW1J?=
 =?utf-8?B?ck9uMElQQnZDZTh6cnAzTkJtWmxpdnYrWm0yVFNzbm1URFc5RGo5MTk0cFY0?=
 =?utf-8?B?RmRWT2k1dXlncS9GbmNGNTUyVjF0RkdVVkxUeExnRTFNSUdOYVpUNEU2d3Rp?=
 =?utf-8?B?bExUVm5EbmY5ZkRERUxRU0dYWlM5dUJNckd1VGlyclJBTHBSYTZOeGE5dzZP?=
 =?utf-8?B?ck42RHcvUTBoQy9Ja3dLYXBHRWU2NnpCN1ZOdjR1Yyt0eXJwTVl4dGVlek93?=
 =?utf-8?B?aGt6QUs4SHhsbFNwNWpWQkM4OEJKeDM0YkhoRm96TjNzbEp5VndpZGNBODRn?=
 =?utf-8?B?S3h5L0tCYXcxenpsS0JPRmM5T0dwaXY4NEhiMElHdWp1TVZ6MFFOMmpDRFFu?=
 =?utf-8?B?WW5jUUpUeTlvdlBDT2ZJcHoxOStaV2tMVXp4MitmVjY5aVg3a2Q4a3h6TUZC?=
 =?utf-8?B?U1RKMFM5aVhEVk1EZFZFaDEyRUh5dExCL1h6Y0FRUE9GYVNvU1B3M0p0Umtr?=
 =?utf-8?B?RmhUTEJNWVdwS0FzYXZEaTBCeHpocVZRSlpoUVJ4bDlBRW9NV1hSMmViQVJ2?=
 =?utf-8?B?azJpRWt2dmdmOUxpdldYTHFKV1cyV0o4SXBDQWUxNDhqeFh5OHgxZU9jL0xh?=
 =?utf-8?B?QTRvWDFPcHY1a25IOUs3RWwyVmRxRXByQjlqMkowbGQ3ckMxVzhqY1RNTzRn?=
 =?utf-8?B?dk1CQUhrR01tYi9FdXpzM0dRNEhsWnFUWjZneTRJbTZ4blBzZWNMcExKa3pt?=
 =?utf-8?B?RzlvVmFEQkRJNWxnMU1HQzlHQTBkSDlFOXJKbXlvTUpHdmt6K3RaeGdieGVV?=
 =?utf-8?B?d1hiYTd5NXRNQWpvNVRoWDczYTV2dmRXV2dvM0t1RDZCYkxnZkdIODVlNnFG?=
 =?utf-8?B?Tms4S2dkVnpyYU8rTVZNZlhLaGlwOTFQUTdINmk2bExlYWpzWkd1SUl0ZUlO?=
 =?utf-8?B?Q25nQVlxZ0NrM1h0VzJBQ1A1TDdTZURWZjRtYlpYeEdUWXFYNXdJeDNMZVI0?=
 =?utf-8?B?V2k1bVorUW9hakVpOTlTS1d0YmVRMGRHeGdEZ2Jmem5CeHhWUzY2amxhTEpy?=
 =?utf-8?B?LysxaXZ2VWJ0dlYxY1FCUGdkR3pGNFBFZGxibHZqTjA4NUwvM3Z2bUhOQUpB?=
 =?utf-8?B?UC8rS3Zxd2xmVzh6SWFNa1BpYXVKdUcyVjZqcmVHVWJaVFJuTExXcXU5eCtN?=
 =?utf-8?B?alNiWHVST3ozVldISjNXa2RiS3RDVS9UUVgrZnlscFJCNlA1VFkya2hJTHhI?=
 =?utf-8?B?WEttaW54WEo0VEdoSytncHA1SVFVcVdmc2NSYXNsd3Q4cUVBMkUrdkQxdG1i?=
 =?utf-8?B?N0NrWVppaUxkbmh2ZDFaTC8vcXZmdCtGbnovNFZWeFlGMjE2cmZMYnZ2Ujdk?=
 =?utf-8?B?WnZRTXJQRnIzWHdYVWpkNTQxRUVUTDlyVTljcDhjOFFLcDE4VHNVbkw3endu?=
 =?utf-8?B?SWQ1ZHJXTHpDVElhVHBQdUhzcEpmMEpaMFQzQ2hmbTQ1V2Y5QkpzSmZjeFZE?=
 =?utf-8?B?RWxuZFdvKzN0UlZvL3F5TzlJU3VsVStleXR0TmlqYVZFY2Z4cGNqK1JZa1VL?=
 =?utf-8?B?RGwxSHJGWVZlZlJUenJIUVJyVUVpbHZsenhMaVZLdnlDOG1kZlZETjJVSEpY?=
 =?utf-8?B?LzN2Wjk0UW5zZEJIRmpOdVJOT1RHUmF1MzN6ZVVRa3RHV1BYQzBoNFVaa0J1?=
 =?utf-8?B?bWFBZ1VWVDE2eE8zYkN2RGthOUNRbzBMK0tFTWtOdlhRT1BKS1IvcDdmd3Y0?=
 =?utf-8?B?ai9WVFN6NEV1R0lIRnd4TklMSVFyTUVDSVk4MDRUUExRSWV1ZXdkdVlTVWtY?=
 =?utf-8?B?V3pjeVdMTW0rd3dCUk9VNnI4dlV0WVIxSnM3Z3pSU1VIK2M0N1U2TjAwdGNj?=
 =?utf-8?B?M2Y2REJ0NWZPVjdvZFFRcEs5ekF1QlBGck5teEc0TzZLN1hBTmNYSmUzTG0r?=
 =?utf-8?B?Qkprd2cwL1lRbG52aXhONzc4S1Q4dStONWdzajV0RWNzMXFESzYvNXFvb1l3?=
 =?utf-8?B?SHJaeDBGbjI5TE5LaXltemozcTVyZG9VaHFoQkNEOS8vTDVxcHZqNm5uQ1hK?=
 =?utf-8?B?YXkvTjdRcnF6L1JxYnVYclVOdlN3OW9lYXd1NzNaYzAyWmI3MUFLMjB1TFdW?=
 =?utf-8?B?Q2wyeFYxQmlSMnNzamFndEEzYi9vanRSbmlnRzNhMUpIdytyWXp6NHZCVHkx?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f30cb57-4778-4c69-8d9b-08dd55071790
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 19:11:50.7748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k4iV9fdyCLzATXUMWsm8i0ho9d6g5K1on1U86oAHiSi8cqRlfaXihvDw/dgSGh5mmp1ddFtt+PApQhUwlEQndSfThO31UKM4/1Ohi7xZoDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8229
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

On Mon, Feb 24, 2025 at 09:43:09AM -0600, Lucas De Marchi wrote:
>On Wed, Feb 12, 2025 at 05:08:30PM +0530, Tejas Upadhyay wrote:
>>Allow user to provide a low latency hint. When set, KMD sends a hint
>>to GuC which results in special handling for that process. SLPC will
>>ramp the GT frequency aggressively every time it switches to this
>>process.
>>
>>We need to enable the use of SLPC Compute strategy during init, but
>>it will apply only to processes that set this bit during process
>>creation.
>>
>>Improvement with this approach as below:
>>
>>Before,
>>
>>:~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
>>Platform: Intel(R) OpenCL Graphics
>> Device: Intel(R) Graphics [0xe20b]
>>   Driver version  : 24.52.0 (Linux x64)
>>   Compute units   : 160
>>   Clock frequency : 2850 MHz
>>   Kernel launch latency : 283.16 us
>>
>>After,
>>
>>:~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
>>Platform: Intel(R) OpenCL Graphics
>> Device: Intel(R) Graphics [0xe20b]
>>   Driver version  : 24.52.0 (Linux x64)
>>   Compute units   : 160
>>   Clock frequency : 2850 MHz
>>
>>   Kernel launch latency : 63.38 us
>>
>>UMD Compute PR : https://github.com/intel/compute-runtime/pull/794
>>UMD Mesa PR :  https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33214
>>
>>v9(Vinay):
>> - remove extra line, align commit message
>>v8(Vinay):
>> - Add separate example for using low latency hint
>>v7(Jose):
>> - Update UMD PR
>> - applicable to all gpus
>>V6:
>> - init flags, remove redundant flags check (MAuld)
>>V5:
>> - Move uapi doc to documentation and GuC ABI specific change (Rodrigo)
>
>hmn... that doesn't look right.
>
>...
>
>>diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>>index b75cc9a70d1f..7337d1be45ef 100644
>>--- a/Documentation/gpu/drm-uapi.rst
>>+++ b/Documentation/gpu/drm-uapi.rst
>>@@ -583,3 +583,21 @@ dma-buf interoperability
>>
>>Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst for
>>information on how dma-buf is integrated and exposed within DRM.
>>+
>>+Low latency hint by user
>>+========================
>>+
>>+Allow users to provide a hint to kernel for cases demanding low latency
>>+profile. Please note it will have impact on power consumption. User can
>>+indicate low latency hint with flag while creating exec queue as
>>+mentioned below,
>>+
>>+     struct drm_xe_exec_queue_create exec_queue_create = {
>>+          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT,
>>+          .extensions = 0,
>>+          .vm_id = vm,
>>+          .num_bb_per_exec = 1,
>>+          .num_eng_per_bb = 1,
>>+          .instances = to_user_pointer(&instance),
>>+     };
>>+     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
>
>how does this driver-specific doc make sense in this file?

to avoid needless noise in the log, I zapped this commit from
drm-xe-next:

  + 8f78c0dfbe9d...8b4b3af869e9 drm-xe-next -> drm-xe-next (forced update)

8b4b3af o [drm-xe-next] {drm-xe/drm-xe-next} {drm-xe/HEAD} drm/xe/userptr: remove tmp_evict list
6b93cb9 o drm/xe/userptr: fix EFAULT handling
4e37e92 o drm/xe/userptr: restore invalidation list on error
8f78c0d │ o drm/xe/userptr: remove tmp_evict list
f2211aa │ o drm/xe/userptr: fix EFAULT handling
b9aaabb │ o drm/xe/userptr: restore invalidation list on error
bee37a8 │ o drm/xe/uapi: Use hint for guc to set GT frequency

this documentation is also in include/uapi/drm/xe_drm.h, so maybe the
best thing to do is probably to just drop this part that got included
in the wrong part. Once this is fixed we can add it back.

Lucas De Marchi
