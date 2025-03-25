Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E22A708EC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 19:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8FD10E286;
	Tue, 25 Mar 2025 18:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QGM1PtOn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0464A10E286;
 Tue, 25 Mar 2025 18:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742926219; x=1774462219;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y1njecfPCRye2/nwfuhlk8QCMZjJV4dFrHlchhzmdmQ=;
 b=QGM1PtOnbgy48/kKAwJktYj3W5XgMeGEoZjvWOrvzYEcHMTXI0psfgGC
 5ZAldD4dUdHE2C1h8UPWHUxBuPFaTtc/dNFUC0ctPV1+M19hvHoLClxi4
 BKK+yhVteehFIZETytAN8M10BctKUynjfwJYuEBizuo6K0sG2nAX03t/u
 W9X7d8msoNwB7hSS9JSI3P2OtCtZYazlAnoUbMaI/w78woNrT3PEUrOQk
 NswcM1IjnOfANKomjkQ11NQR2LBc8oxNNo1QEIQGp74mJ0kHM8NI0eA1E
 yHqPpc1VkEIyYZ1vPwXg4FPkHTQZ62kLh7jVKD+AeCfbQZbm4RfdVWenj A==;
X-CSE-ConnectionGUID: t9fgtgHzTMWWuL2mRoNFCQ==
X-CSE-MsgGUID: hZs+QkYDScGmRJAl9juSFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44292924"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="44292924"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 11:10:18 -0700
X-CSE-ConnectionGUID: sVW2Cop8ROmFcn/jJ4ZOpA==
X-CSE-MsgGUID: uF/EFfJOS7OBrnzlhSQAJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="124928273"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2025 11:10:17 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 11:10:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Mar 2025 11:10:16 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 11:10:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qtzN2yBe/Su0mTde9Yf7EJx5kYdU3wKpAkYegwtKkm1cetJqlLoewggGfFBa9nwPTF/M8BgMRm0LcS1WT/R6NIXHnKe9Cf47z37vx7sFQNn0WjQChLkClvHdv2qk5MdAXOUTwUyRFsvp+lgWnq2hTLt9VULvMu3pJv6776aCazTolakvYY2gri+hddjVh6zNoqCPmAdebe4F2tK/r6lOMJ5d9ivVQJfv/vZ+tzosAqNMxKTZ4ngj9jUpEokxpPh+F293JByZ9gfGs9879tbWChV+XTXLlcbSZCGOnnW5qbmBEnE7QfVWDFZfTnK8bWutHDLyL3dvhFsVNSlqvsw8tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNkRccoyFBNbcGqXTkjttkUnGxd4TQSz0av3toBAnNg=;
 b=k3mF9wC97hhMa00sS4IxuXER+j5tZ4x07gjzsNuaCuD5jmqQFU2J1QsKnWtZXPZoDbxvWyc6NWxCQZnCWI8DwpZnZXlHU6xUM0mIS0f74BC9A0ExpGaDSKhq+l5Zbapl1xSlvLi53MvZD4oqX1yHJ3udgHHFu7cdauqvlouh2HQ/UmHCiZkdhw7OHBlQYkYKrdNu5WtH9TbyQ7UK01Gt6HPtvpiiNoKLzfpRUmU4P3Sg0nIboA591Wm8a7Gmn7mhPnArpjLC8OrMCVA/cedQw/9MBmepZzF8H/V/vytWkA6lxDcr4QU+AhWGvLyglLclMeIsCtTBcyu7lCR8L11mKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20)
 by SN7PR11MB7996.namprd11.prod.outlook.com (2603:10b6:806:2e3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 18:09:59 +0000
Received: from CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62]) by CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62%5]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 18:09:59 +0000
Message-ID: <00c9a761-b66f-4cf9-83b3-8b3b1a6d1fa1@intel.com>
Date: Tue, 25 Mar 2025 11:09:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <matthew.brost@intel.com>,
 <shuicheng.lin@intel.com>, <dri-devel@lists.freedesktop.org>,
 <Michal.Wajdeczko@intel.com>, <michal.mrozek@intel.com>,
 <raag.jadav@intel.com>
References: <20250324230931.63840-1-jonathan.cavitt@intel.com>
 <20250324230931.63840-6-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Jianxun Zhang <jianxun.zhang@intel.com>
In-Reply-To: <20250324230931.63840-6-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0027.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::40) To CH3PR11MB8707.namprd11.prod.outlook.com
 (2603:10b6:610:1bf::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8707:EE_|SN7PR11MB7996:EE_
X-MS-Office365-Filtering-Correlation-Id: 933275d4-fb55-4e4c-e7b2-08dd6bc84175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHBZWGNKWDBRREE0VU9adXRtcUNFaWxRZ0lsMm9WNEd3cE04RzYzRkZ3Q0VL?=
 =?utf-8?B?OFFQYndnRk9HRlVWTTkwSTNZV096WlpqTmNzNHFDL0VsRWtCZ0ZUbmxEUzU4?=
 =?utf-8?B?dkEvQm1GdGJKcjNBZDZuOHlVK2Jmc1lHd1d0bFdUYkVPMUkvdGM0QzByTVhl?=
 =?utf-8?B?S0FrK0VxZDY2YlZsM0UwUy9PcmVldGZ3cDJJMGNMdWVrc2pxRXRHT2hGYmlv?=
 =?utf-8?B?b2VoVjZ5K3dPMjloYmI2UGlqNUVjbTJRVWU2OWI4RFpPUVBUNlpleWk4cFps?=
 =?utf-8?B?WDkvQkQvYmx5c0k2R0hFTjlnSG9RdHV0d1ZKaG80bWZZNkVabXljQ0tMQ1Q2?=
 =?utf-8?B?eHRYWGRCTlZMZWN6TDBCMFkvcko0eWZBWXFBNWpzTjVwWC96L2M4b2tyVmhl?=
 =?utf-8?B?bDRqenNsV3kxc2Vobk0xSEFLZ3RTMGJrL3NKeXZOUCsvZXZXbmYwalNGVjJj?=
 =?utf-8?B?b2c1TEFHR2RZOXN1MWt3T1pzOTVpOWhuZUJlM2VyOEhmQ3dRMWZKRVNXbDAx?=
 =?utf-8?B?Z2MvcEtSTGMwQ0Z6MXFGa1ZXZ2IvNHppeWZzdUpyOE41dlMvRUFHNUFnbzQz?=
 =?utf-8?B?anpDMGQ4ekhJd2F6aWRNWDBqbEh3UTl4NWNab2YzcXR4NXBPZGRHSWNaRHZW?=
 =?utf-8?B?NllnWVRSQ0Y1M052eGE0WTYvS3dwZzNGK04wdmxYRFRQSWMrOGZFODRleUgx?=
 =?utf-8?B?VTErN1l5T0ZMYlhKVVhwNERCdk5KN3J4MUhqSXpwMnk1VU8yTFFmeWJSYkVn?=
 =?utf-8?B?WjdFa2FHUGN5N25CNkZydUZZaDBnSkw4Mm1wWEc0Zy9UZGE2ZDZhNy9ickR0?=
 =?utf-8?B?R3JGelorYmlWUEJvT0VMTXBNZnNSN212anVaZkhHNXB6WktUVU9yVzltVy9l?=
 =?utf-8?B?V0E5cGhoSTl1TVUwb2tzVDhhWklaWTFMTDFxemJSeWpWQmRDOGtJV0xPV1pa?=
 =?utf-8?B?a0F6VXNmaFZ1NFpsTE1ZU3hoUVlLeTVSbXIxaEorcGY3bEtzZmViRkdlSVJk?=
 =?utf-8?B?TytaRjF3M1hPaFpaVDUvYWljWUhDVEVtd3I4WGhUZWZQNk0zNzZHaUZ2VHRt?=
 =?utf-8?B?c2NJdi9FTEdJWm1OcVZKZUZTTDUzNk04Zk9HOW9lUjRjbTFiWEZsWS9HR2Fr?=
 =?utf-8?B?MjVrV2wvMUZtZnFsQ2RnOGVXSXB1b3lnQStPRlpkdTZjd081aGN3Y2h3QXVE?=
 =?utf-8?B?TEE3Qm1ra29jRTRsM254ZnpYL09kZTllRzRwa3VlNzlzN2wyTlNqcjBJWEl4?=
 =?utf-8?B?Vk8rL3QrbTlrTEprTjYwVHMrZXAvNC83R0JJbTBZSXV1M3U0MjlpSGVNL0tE?=
 =?utf-8?B?Unl3alVDRXBOYWJENVpRSFdzcnR6czVnN3p2MXdjMGI1ckdiZlZ4YS9Idksv?=
 =?utf-8?B?ZytaL3NIN1Nnak9mZVNMQlptVHkza25IR3Q1eC91VWpGY3Ntdjd1d0UzRTg1?=
 =?utf-8?B?TE10TWhQRi81L0s5RUsxVFJPZy9PMFpZUTRldzNGaDE0emRtZnp5dlFPUitR?=
 =?utf-8?B?ZjdjQmpLbUVMd3U4d1docU5SRUdnL29SMGpoTnd5SDFmNHUvaFlSQm94QWc3?=
 =?utf-8?B?OTczTS9UcXlXWTB6Vm9QelN6OEFETnl2VWVMZFFoZWkxUmxtOTZZUkVFcUNS?=
 =?utf-8?B?ZmNyT3lzSTM2Z2FlVTJLbmVkZ3NmRGRtL3BXeC9KVXR6a1pGamtHbGVZYXZQ?=
 =?utf-8?B?UENXQTBxcUF6OEJueWVTZTN0SHdHRkU4U1Z3Z01zcnRmWU4reHIySU9CaWlo?=
 =?utf-8?B?cEpZTGRXVlBBQzlEeTd0SzdlUTlQKzA3RnFhUFhRT0JBUHNOUW9kSkUzQzh5?=
 =?utf-8?B?ampQRGNvdW5ycmdqRENpYWtEMUFGZmxsakNoMTRPNEpKZnMrVXVoTENUK1Zs?=
 =?utf-8?Q?wFzBUpB/zMdgB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8707.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXNKL1ZkNHd6VHo3ajZjbnc1Q09CcC81bTc1M1RWN2FTSkhsZDgzWWVnMUN1?=
 =?utf-8?B?QjYxZnJwMmNyTFlTYnh2TXM2OVcyeU1BekZFd2hpbU4yNEZPRTR5aFV1Kzgz?=
 =?utf-8?B?MWQ1TWtld1NDRDJCU0xSYmZnWE5xQ0Q3TmcyQjU2U0NuNkpMOWk4Zi9qRW5w?=
 =?utf-8?B?ajRUT3kzSjMwZk5YbHZ3YnYvRzJQSVVBd1ZsaS9YR0tXMVgwZkJ6UVRpTTJU?=
 =?utf-8?B?d2FsUEh2aHd6L0lWT1l2SzNLNnl5dVpQNG1IOXVmS2tndTNraDZ3UHk5NS9B?=
 =?utf-8?B?N0NzVHZVZVBjeVlpa2pEYTk3WTlWa29oUEQ5SnpQRkF3T01lTXJ3T2RDaDFT?=
 =?utf-8?B?ZnRqVUJZbkRFSTNkeC9EYmhEcmdPa1Exb1NiUUNvRFhuSDNqQkI4Y2M0aDZw?=
 =?utf-8?B?UW5Ga1dPK0t2WEFiVW5pWjFZSlFpVFRnMS9oU1pJdGV6TmEvendQY3R4MVRC?=
 =?utf-8?B?Z1lEN0dsR08rcjlIZHRwYmlCZXF1V2k2OE53UFRkazlielB2MDY4eW1EbU5P?=
 =?utf-8?B?aUtWc3JTblZlTkxVcEs4YU0rWThvRmNZWEdHdkV5cXR2VHdZMEhJd2RMNWpt?=
 =?utf-8?B?T2dFWnpkUzFtZE5MY1FOTTlGZjZiVU1DbTlLaFdPcU9oV3lVR0g2VnJyQ3Nx?=
 =?utf-8?B?ckY5R044MWVqdnpFSGpmWVBOc3I1MW5MU1R2eEJ2VVdkN3Y0ZS9nM2s4Vmgw?=
 =?utf-8?B?VUVqUXdsZnVNWnFramVMREhnNUJ2VWVvdDQxdUdjaU9wTXFFcFhLcG1UMng2?=
 =?utf-8?B?QU5UV2lLSXZlcmQrWFFGVnUyakgxTE5QMHhmOU5velYyUVhJSktZZm03ZHRi?=
 =?utf-8?B?ZWFaWlpnc2VuWXNtY2l4SnZYTUtJZEU3ZC9JUUdWWlRJZENMYXpacjM2MUoy?=
 =?utf-8?B?WWM2c0tYMDNYTURNTVdTQ3h2Z0ZGVTZEajJ1eUd5bFNrbDg3cEJmZVhTdFFL?=
 =?utf-8?B?OFhxMUxWVXRrMmprcklJRGhhbjFHaDNsVmMrNGFpUWlGUXYrUGJ1c1BTWUUw?=
 =?utf-8?B?Ykt2L1NLQnJBazAxcXRmUGM1TVZoQzY3YWU3MzZUc1BYaEFnUWFuVCtKczJY?=
 =?utf-8?B?dTRkSEVQRkdSZE1VWWlTQVRWT01jUk1VOWNUNzdTZStKeitna1ZHTXJOMU5R?=
 =?utf-8?B?MmI1SlRsVGJPMm5zaVgyM3RZcWNoRkxoWWFpckN5VE81ZUpqNitHMlF0YlJM?=
 =?utf-8?B?dUtyTVJSU2xzRDR1NFhTbWthQzgyZWMwRDV6ZlZXN1hZMXI5Y0NIUDdoLy9n?=
 =?utf-8?B?MlNqV3B6VU1sb1NaVzdBUFdiaFlHdmYyRC9zYmhZNlc1Nkt0aW9FM2JKb25Q?=
 =?utf-8?B?WXR2OEhTcmY1eHpVd3dVSGNSeW12Z2RPUFI0N2pHUXdDaGQ1SkpKdFQyLzJ3?=
 =?utf-8?B?enNSUXY5dHg5SnYxbWJCVG90TGRZSVhod1dFWU5QMEk0UWxvcHpQenhMelkw?=
 =?utf-8?B?Tm1PcnBhanZVRTIrWTVMZlpIankvSHEzQW9tcktxMzBJdDJ3QzdYeHdVZEp4?=
 =?utf-8?B?QTRuOS94RTJOUGFCVGtuNjdTMVR5OW84dm5CdldEREh6bStaYTdJY0h4QjlP?=
 =?utf-8?B?YmF5TG5iblp4eC9rTU03RE5sNDlyTWpMQ3NnZFUwZDdUb253b2ZlUFhTYVdP?=
 =?utf-8?B?MStaOC8yMjB2dWdjUUk3R0xLclRwZE1qNmFCZ0JHRGtHanFHRk9ZWEZwbUZj?=
 =?utf-8?B?empSZ05kR0RJT2MxVDZYWjRDbHRjUHd5SUliU2pWNVhaSlRqcGRkdGRWYkIy?=
 =?utf-8?B?dElIVVR3RUxsL0wvUXlqUFF6VjBFMExBTlBwTWhUNERZMnJMR0dwakszeGM3?=
 =?utf-8?B?cGFmeWUvb3R4WEkyY0RrTVNXdDl2YkI2Z2hzTE5tUXdaVnhBaEVCR2J1MlNG?=
 =?utf-8?B?MUVMZjVwVGJRVzU2Zk5vNU8vOEEreHorMUJsZXRscW9nZGRUQ0g4OENoOUN2?=
 =?utf-8?B?amZTeG5OY3k4ZEM4QXkwN05OYmdWek5oRVdEcXphQUI4UERYVnk4WUFnOG4w?=
 =?utf-8?B?Qk43YlpSSlFmNTdYSlFsWUU0L0RCWHM5V000VnhCM1NhOHhkZVhDV3ZNMkhD?=
 =?utf-8?B?U09kbVhCSHRINFJWZEpvd3l6RTF5cnFlTlhuWmZyZ1p4K2U2SzMxb05Ha29E?=
 =?utf-8?B?eTdSNzhZOGlNWDVIRkcraFZuL2NzY1pxNUdHVTVWd294T0s0V1BjT0NSNVBn?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 933275d4-fb55-4e4c-e7b2-08dd6bc84175
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8707.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 18:09:59.5234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDHclpoIuutJb2kPz6zFKS9rCR737KC138YigQ16za6bpsoZ2S0qjAcJvBAHPCW+K4621jL+ND4E/nbuCzVAVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7996
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



On 3/24/25 16:09, Jonathan Cavitt wrote:
> Add support for userspace to request a list of observed faults
> from a specified VM.
> 
> v2:
> - Only allow querying of failed pagefaults (Matt Brost)
> 
> v3:
> - Remove unnecessary size parameter from helper function, as it
>    is a property of the arguments. (jcavitt)
> - Remove unnecessary copy_from_user (Jainxun)
> - Set address_precision to 1 (Jainxun)
> - Report max size instead of dynamic size for memory allocation
>    purposes.  Total memory usage is reported separately.
> 
> v4:
> - Return int from xe_vm_get_property_size (Shuicheng)
> - Fix memory leak (Shuicheng)
> - Remove unnecessary size variable (jcavitt)
> 
> v5:
> - Rename ioctl to xe_vm_get_faults_ioctl (jcavitt)
> - Update fill_property_pfs to eliminate need for kzalloc (Jianxun)
> 
> v6:
> - Repair and move fill_faults break condition (Dan Carpenter)
> - Free vm after use (jcavitt)
> - Combine assertions (jcavitt)
> - Expand size check in xe_vm_get_faults_ioctl (jcavitt)
> - Remove return mask from fill_faults, as return is already -EFAULT or 0
>    (jcavitt)
> 
> v7:
> - Revert back to using xe_vm_get_property_ioctl
> - Apply better copy_to_user logic (jcavitt)
> 
> v8:
> - Fix and clean up error value handling in ioctl (jcavitt)
> - Reapply return mask for fill_faults (jcavitt)
> 
> v9:
> - Future-proof size logic for zero-size properties (jcavitt)
> - Add access and fault types (Jianxun)
> - Remove address type (Jianxun)
> 
> v10:
> - Remove unnecessary switch case logic (Raag)
> - Compress size get, size validation, and property fill functions into a
>    single helper function (jcavitt)
> - Assert valid size (jcavitt)
> 
> v11:
> - Remove unnecessary else condition
> - Correct backwards helper function size logic (jcavitt)
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Jainxun Zhang <jianxun.zhang@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c |  3 ++
>   drivers/gpu/drm/xe/xe_vm.c     | 96 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_vm.h     |  2 +
>   3 files changed, 101 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 1ffb7d1f6be6..02f84a855502 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -195,6 +195,9 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>   	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>   			  DRM_RENDER_ALLOW),
>   	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY, xe_vm_get_property_ioctl,
> +			  DRM_RENDER_ALLOW),
> +
>   };
>   
>   static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 9a627ba17f55..3ed50d6f1f42 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -43,6 +43,14 @@
>   #include "xe_wa.h"
>   #include "xe_hmm.h"
>   
> +static const u16 xe_to_user_engine_class[] = {
> +	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
> +	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
> +	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
> +	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
> +	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
Unless we can completely rule it out, page faults can come from other 
sources (engine class 0x4),so we should have it in the mapping.

But once it is added, the mapping would very likely be a completed 1:1 
translation, so it becomes unnecessary and can be replaced by just 
reporting the raw value to UMD. If we want to keep both KMD and UMD at 
the same page and aligned with the spec (we shoud), we can define an 
enum or a group of macros as identifiers used in both sides to make 
things clear.

Of course, KMD may want to have such mapping internally for some other 
places. But from the perspective of the interface, the above is my argument.
> +
>   static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>   {
>   	return vm->gpuvm.r_obj;
> @@ -3553,6 +3561,94 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	return err;
>   }
>   
> +static int fill_faults(struct xe_vm *vm,
> +		       struct drm_xe_vm_get_property *args)
> +{
> +	struct xe_vm_fault __user *usr_ptr = u64_to_user_ptr(args->data);
> +	struct xe_vm_fault store = { 0 };
> +	struct xe_vm_fault_entry *entry;
> +	int ret = 0, i = 0, count, entry_size;
> +
> +	entry_size = sizeof(struct xe_vm_fault);
> +	count = args->size / entry_size;
> +
> +	spin_lock(&vm->faults.lock);
> +	list_for_each_entry(entry, &vm->faults.list, list) {
> +		if (i++ == count)
> +			break;
> +
> +		memset(&store, 0, entry_size);
> +
> +		store.address = entry->address;
> +		store.address_precision = entry->address_precision;
> +		store.access_type = entry->access_type;
> +		store.fault_type = entry->fault_type;
> +		store.fault_level = entry->fault_level;
> +		store.engine_class = xe_to_user_engine_class[entry->engine_class];
> +		store.engine_instance = entry->engine_instance;
> +
> +		ret = copy_to_user(usr_ptr, &store, entry_size);
> +		if (ret)
> +			break;
> +
> +		usr_ptr++;
> +	}
> +	spin_unlock(&vm->faults.lock);
> +
> +	return ret ? -EFAULT : 0;
> +}
> +
> +static int xe_vm_get_property_helper(struct xe_vm *vm,
> +				     struct drm_xe_vm_get_property *args)
> +{
> +	int size;
> +
> +	switch (args->property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		spin_lock(&vm->faults.lock);
> +		size = size_mul(sizeof(struct xe_vm_fault), vm->faults.len);
> +		spin_unlock(&vm->faults.lock);
> +
> +		if (args->size)
> +			/*
> +			 * Number of faults may increase between calls to
> +			 * xe_vm_get_property_ioctl, so just report the
> +			 * number of faults the user requests if it's less
> +			 * than or equal to the number of faults in the VM
> +			 * fault array.
> +			 */
> +			return args->size <= size ? fill_faults(vm, args) : -EINVAL;
> +
> +		args->size = size;
> +		return 0;
> +	}
> +	return -EINVAL;
> +}
> +
> +int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
> +			     struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(drm);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_vm_get_property *args = data;
> +	struct xe_vm *vm;
> +	int ret = 0;
> +
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> +		return -EINVAL;
> +	if (XE_IOCTL_DBG(xe, args->size < 0))
> +		return -EINVAL;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -ENOENT;
> +
> +	ret = xe_vm_get_property_helper(vm, args);
> +
> +	xe_vm_put(vm);
> +	return ret;
> +}
> +
>   /**
>    * xe_vm_bind_kernel_bo - bind a kernel BO to a VM
>    * @vm: VM to bind the BO to
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 9bd7e93824da..63ec22458e04 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -196,6 +196,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>   			struct drm_file *file);
>   int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>   		     struct drm_file *file);
> +int xe_vm_get_property_ioctl(struct drm_device *dev, void *data,
> +			     struct drm_file *file);
>   
>   void xe_vm_close_and_put(struct xe_vm *vm);
>   

