Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3756A67DF8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 21:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A45710E2DC;
	Tue, 18 Mar 2025 20:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gAbPPyUy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815A110E2DC;
 Tue, 18 Mar 2025 20:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742329426; x=1773865426;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X2e+hCpuKVVx0THiS32GY6d3t5iYw1Cqec0KyGPPQd4=;
 b=gAbPPyUyqC8FFKYdJOV+koVAxIX+uIrjvjV617Fzt/NvU92GRP1siFcC
 53oIhFAE56DDtRGPunJcroNuGw2mzQjv4QvIFdZs/nSMZMhRBJL3Dnl7n
 ox1s3gQbV2Hnd5dqQ8YTrRJkey1yoVnX6rMLNURfLSQvkLxxJLo6Hsygi
 EgASaiA9VUXL1iJQcT9etZAXGzJXGc5nsUDSLIMnDVS7I5PbqgeOSblGS
 KAnerQH/lR+osH6L6MsOjaio1d/eK4vu796DS9xlV8NKNFi+JpgACAT9B
 TnU9jvgGC//9FqAFZE0LRcmKhcEM4fOwFcpe2Ww199hwZ3e+LIVH2OxU1 w==;
X-CSE-ConnectionGUID: UdfJxujiQqCKWei12iEopA==
X-CSE-MsgGUID: uhgC34NGRP26NZqkxkHG8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="68844842"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; d="scan'208";a="68844842"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 13:23:38 -0700
X-CSE-ConnectionGUID: IUjUEYfURPGeHlDJBcnOmw==
X-CSE-MsgGUID: exzSE0w5Twm/R+sBb3ha7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; d="scan'208";a="153366814"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2025 13:22:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 18 Mar 2025 13:22:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Mar 2025 13:22:24 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Mar 2025 13:22:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DqKOck4Hb4qw2aLCx1pti/CPuYBH3paYq4gaTkov5UMdxWUAprpyVczRT9kYZ3bG8cGIdD21aD8PLa3DxuJEIlRdaIngGmIDqWbO1gXQn8BAjdMIcl8ik6O0aakAT8hqeQiAugEM0Kk62e3DGUnAlimV7TSdzGq60bogb75kjmNq447GBP+bBIJKXVVu+CoK6MlU9m6p8yQxDe1OvXWpRNFyQ800P7NFD4SybyrkUEIKA+Q6kbX98LjVG5WSMZtbniKAilmnNdNbn2XRF2Te0IS8/GMVf6FWxpOt8DGTE6WOR1/F6MF0OnysfEGyoykuRfQ9cdbJk2CBJKCfO195Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmIbaGV9wnoquyzZyaSSojkV2OinNCDIJZpgriS2yng=;
 b=WiZpDe5BUoQae6/AHDZ1CMi4+p6dgA9bGHyzhcEWnEJzB8VwY18RSjs1IBpZAyh8XjX/HEO4AaQAyW0i2Kb9kfFv+82LOZhYGAUR2EtgyBe1VzZIGMsmSzs6Wb2QJ6Mzf4ps8Fyd3hBGQFQyJnYhB5dpeRdgbvdEk6Y6f83JFgmV72ujp7WgrVFxaL9tuvXri8e8eKQdNf6j2WkfN+Vpn9spZv3ohhO13NU6dDFk90V0V3JJCw60aCbDmlzGWLRQK9JI4ksHFLbrRXwPZ6y9F0G7I5SU8e8S++rz9f+epcXfb2qNCA+15JNqSpkRifbgNmVu0hkxtWM3vGFZdZC55w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20)
 by SA1PR11MB6808.namprd11.prod.outlook.com (2603:10b6:806:24f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 18 Mar
 2025 20:21:40 +0000
Received: from CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62]) by CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62%3]) with mapi id 15.20.8534.034; Tue, 18 Mar 2025
 20:21:40 +0000
Message-ID: <c1fa3db3-662e-446f-8e37-f2f637536b44@intel.com>
Date: Tue, 18 Mar 2025 13:21:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "michal.mzorek@intel.com"
 <michal.mzorek@intel.com>
References: <20250313183415.133863-1-jonathan.cavitt@intel.com>
 <20250313183415.133863-7-jonathan.cavitt@intel.com>
 <a8eaeaa7-ba27-4d57-b20b-caf36b1d9fee@intel.com>
 <CH0PR11MB54448F266357E1D5C1B34108E5DE2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Jianxun Zhang <jianxun.zhang@intel.com>
In-Reply-To: <CH0PR11MB54448F266357E1D5C1B34108E5DE2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0050.namprd11.prod.outlook.com
 (2603:10b6:a03:80::27) To CH3PR11MB8707.namprd11.prod.outlook.com
 (2603:10b6:610:1bf::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8707:EE_|SA1PR11MB6808:EE_
X-MS-Office365-Filtering-Correlation-Id: b074b09b-ffe8-47f4-025e-08dd665a7dc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mm15MXU4L2VOakZnaXB1N1Z2UGVHQTlFU3lJU3R0ckdDN04wMmdZTngwa2FT?=
 =?utf-8?B?OFIycXR2TklEQ1BTMm1ibmVKYktyNmJFVEhsUDRNbnFQb0pyTDdUTVBLYWtv?=
 =?utf-8?B?Q1ZOcVFzbFRBYUVBeElYT1FNSlMwVFBpNVdHcG4vaXhmUjlhd0pscHhwa1Vw?=
 =?utf-8?B?UXg5N2Z0eDFlcTBMbkdoakZJYnZweXJkYWxETzZUT3lTRUF2OWpIT0xrRHJ5?=
 =?utf-8?B?eDdDeEJRckFUcUxTMDBINXdSL0xldkp0eWNuQms2RngxTkZOZlBBM2k2c245?=
 =?utf-8?B?MEdiWGd1RXBmY0pxTFJHK3FwQ3JETmFDMXBPcnhrYXFzK0FLbytvRWhIMlVv?=
 =?utf-8?B?cktLdnRTRGptbU5PQTFCUUpnVW1wdTFhVkEvVTNlRWVuM3NHYnpkYTQvZVJT?=
 =?utf-8?B?b1BZRnJLNVIrWnF0Qk9uMkZVajdxQS9rVmFqZ2c3STRwWlhIWTkvS0FkV2Fu?=
 =?utf-8?B?eUl1TmkvT2VVRjNKSC9pU0RadCtFYko3dE9rMjJSRTJUQ2pzZklvcDkyMzl6?=
 =?utf-8?B?VEVFa2Z3d05wY2puNDBmVEk3UnhqV0dMTWJiUDlPTHpQMGNRU2Y3emhQRW8z?=
 =?utf-8?B?UThjenBrUnRzQndtMW9leitjNDZYMFBGM3VQMytBRkNUOW5HblhIK2MzUWFw?=
 =?utf-8?B?UTI3NmNWRjFRVzFQaEFraVgyQkZDQWE2Q2tIb0h1K2t0WDJTWE0xNUR4NGFC?=
 =?utf-8?B?djdrUm1ZYkRQSmkrdVNJcjl4WnlsQm5UaDFXcUsrNVZuUzdZeVRDSDhFTVgr?=
 =?utf-8?B?VDRXT3VuWCtsbUxqZ1hKVDJjeWJTR2h3RFI2NGVjdGNmcHI0N2wrVXhPMVp4?=
 =?utf-8?B?ak9Pa3BHWnhpdERpbGVYQUxZREIvZ3JUVVBKOGRRZmpjZUlsTUlDREF1RmpR?=
 =?utf-8?B?N1lsM2E3aEc3ZjBoZDZ5d2Q4N0ZkQlFDLy9tenJGTGdYOHdDd1pBelhDTkZD?=
 =?utf-8?B?djBFWWFXakYvU2JkYzJKTUNQbDZwWWdCK0crMUNIaS9RQmg5dUI5a2NGam8z?=
 =?utf-8?B?dFB5SHRRZjgvbjNCY1dlcTRBS2ZycjBlaW54MlFVZjJCa01mQ3gxNFhPQTJr?=
 =?utf-8?B?eE9FK2NPYmZybllucHFOVkpJU2ZIQmc2S2l6L3FSSXRmaENZcVFaZzBqTVN4?=
 =?utf-8?B?bUp1LzJ5bHRlSjQ0bVJGd3lEMVlzMWdOVjVSUmdVRXBMNk5jcS80ZEtRTHRV?=
 =?utf-8?B?QjlZUWRMYmc1U0diQ3RxNU9kZlp5Q1FQc2h6OUZKWEI5djJ4YWRRMUduNmhw?=
 =?utf-8?B?YWZMaERZMjlSQWtCZFRMT2JQUHR0MWtLM2I3T09TNzNyRHFpbysvTC9aWHUx?=
 =?utf-8?B?eitrdnZoOUlCRkp4TXpleDh1VjN0a1BLbkVxcHA1Z1VscEh0c3JOWFNwS3ll?=
 =?utf-8?B?Slp5eVFDc3VmRm5DS0Z5REVnNXJGampuTUZmait5TjVrMUo5U2lNTmNZM1hM?=
 =?utf-8?B?SENaR1NGZG1VZ3F5WHNIMkJyNW01NGlNeDlkWHdFMWFkaVhNV0JxRDVxd2ZC?=
 =?utf-8?B?UWw3VEw1Y1hCUjBMcGxEblA3M1Q1bUpzYjBSRnM0TVdhVGN3WUJqY3Y5bjJJ?=
 =?utf-8?B?WFFLSnppUElOZ2hzQ2VrckJqYUtqSlo3WENQK1hmV0ZpYjFtYzQ1emY0SGZX?=
 =?utf-8?B?aHFVc1RIVWJTUi9SMWhIaFlDb0pHRTNHVDZRckJDT251ck5CUU9BRlcwSFdz?=
 =?utf-8?B?Z1VNT2JyNHVaL1VWd2JEbmREQXpWallPaytmYUZGR2pmRGFabUszSm5QZ0N5?=
 =?utf-8?B?b2dDRXpjdDRlUFVzeTVCT2lCMXB1QTY4RUo0SElyd2JIUXBkK3g0a2ZjMmQw?=
 =?utf-8?B?QXUzU3ZJUWNucllUaC9scEdPdnVJL3g4K3p1cU9DU3RINmtoQVlseVlWYnFr?=
 =?utf-8?Q?paB8r6dAZxTwA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8707.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDFxTmxGMCtRTHJiVzhiSkNZVU05cGk0cWpxblNXMS82SzdBTWNna29lQ0NO?=
 =?utf-8?B?Y2o0YWo3dFVhMTNQNzFNRVRNKzBYTTBWbE9lOUhXRG1jbXdyeUJHZnFVNVJP?=
 =?utf-8?B?cTlrSFBwWktjNkdrd2dEbVdrdGt3OTVPVzQ4V2hUVW1IK2lRMUNYZ1VWUEEx?=
 =?utf-8?B?YnNlZkZvL3ZTOTRCOURjTW5FWkVDcWFDdTRveHhBbDVQcHU1clR1VzFKcEo2?=
 =?utf-8?B?QTIxV3J3Slkrd0Y1RjF2UzNIV3NHZ0F5RTFxaEE2THFpQm1zM0pqLyt6Y2pV?=
 =?utf-8?B?U3hNRG5MeDYyaXh6MDhxSllkdU9YQzNBMW9lcWtkSGVOcnowQVdZWVJXT25w?=
 =?utf-8?B?T053TzFMNi9vSXFQdGM4cHcrd29HN0x0bE8yNlV3MGEybUxJQ3JqTXBDNUUv?=
 =?utf-8?B?STA3ODQ2SU1kRHhWZmkxNnJQVE8zYWlwS2NDaUVKK3BFWkFtNHlOak1DdU9O?=
 =?utf-8?B?S0NDalpWbEp0T1I5RDh6bWN2N3llVzJhM0pySTAwdkMvSUpkR2JpYUE0aTIr?=
 =?utf-8?B?WEdiYkw5NXVoMDZiVk1TalZROUZwK0Z0M2Z0Z0ZBMmEwcW1PeCtuaGQySGhk?=
 =?utf-8?B?U3RsZ1FHaGpSbVVMQ0Y0U1ZNYVkrT1A4MUZxRUpDdnZRR3lzdkY3TWllV3hx?=
 =?utf-8?B?REp6UTdsZUdIa1FGVkVjZGh4UWlMY1VFWktLZStvM0lFeFQyR3FwR0JBdU1l?=
 =?utf-8?B?Ti9ic2dYUDFBaG9OaUZQbENPUXNXaVdpZWVzQzhDSmxnS2xnMVBQaitscWJV?=
 =?utf-8?B?TUo2OE83Z285bk5Xc0RBSzBRTFpLOGwyZXA2ZHlXdTNpYmVsS3FmeEpCL0pT?=
 =?utf-8?B?c1FpWXRZczlBTzdRMFdXb0RxOXFzRDJTQS80bGMyRk8zTDVlT2JBMXRNdG4x?=
 =?utf-8?B?VUtjVEs3ZG4wVjhXKzFmQzByNzZscEltY3dEM0l2K21tWGRNdGlpeTBTSXBt?=
 =?utf-8?B?UmZ4SXpDSzI5dXJBVGZGckgrTW9JY1hqbWlGYVBkNUVRQkptQ1A2REhFeFRx?=
 =?utf-8?B?ZkVzTjM4WXZPS1hweEEvRFlTS0lLYWoxWm5SUXA4WVQzYlBOMVdkbVZMSnA2?=
 =?utf-8?B?Nm9QazA5SXRPT0ZmakkxMGw1OEszTTV0YXZPRFpzWnY2RlRnVTVVWTRwN0Z2?=
 =?utf-8?B?cVMzVzQ5WC9idUM3R1pxL0h5MGZLUkNtR2NFZE5mcytlUVUrUkVxMFZZeFdw?=
 =?utf-8?B?bWg5K3pYTzh3Yis0WWVPcHhKOWtITDZwY2V2Z0JuNERLOFlwVlhMVEZNMXF1?=
 =?utf-8?B?U0FKMHpCSFR6ZVBXREtBYmZUR0JKZFBvWmVFMnpaRU1BOHp1c3VvM3hSa0Js?=
 =?utf-8?B?UEd6ZktaUlJrZGcxMUhMMjF4bmJBRzJodkZtck1COWZhREhycWV3dmNiTktE?=
 =?utf-8?B?RjBtUUR1ODRDUUpOUzk1VjdKWG1EUGIrVXVsRHhZZjBGVTdyN29ad2JRaXlw?=
 =?utf-8?B?VmwxaXByVWtiQmsxbDhhcmhSZDBOOHZUeWREb1M0UlVXQ3FWZk1lQ3BQcVB6?=
 =?utf-8?B?cE9TZlVpblJSWC9KbFNuV2JCQnc2SjFWbmc1R0lLWHcyT05rZEhob1NXcUI0?=
 =?utf-8?B?Z1NUVjFiNVNTd0pWUzl0T1VZSGRmWTMzZGlpc0FvU2JNcFBSc2JqRURpMUJS?=
 =?utf-8?B?aUlwNjUyQkxtY1JyZjdESU1mVWRtaHJwMkNzSDczZ29aRjRVT3c5NjhXVlZ0?=
 =?utf-8?B?bFVvRG9VcXo0bzdyNThGckpUTURQVzlGUHBRS0gxQjAwcjhnMmRMNHlIeDlr?=
 =?utf-8?B?RVp5Nk41WEJEUnFrblE1NC8vbW0yNHBZWWp5RWlmUk44WW9CbFM5VkJxK0V0?=
 =?utf-8?B?eGRkMmVGZnZhTWtLdXpLdnBEcVhNVWEzMWVKUmkyM3dBOXVJNlkyQThLL3hh?=
 =?utf-8?B?cjFPcFUwYVNwSTd5VXRZWVFkYVllUU9aWlBQRmRsUDc2ejE3bmRDQkJHZHNJ?=
 =?utf-8?B?ejRoaGprY0VNdlA1UFUwTmcwYU1KQ1c1b3RWOXlQdXdVR1FodWNpWFpiNXBv?=
 =?utf-8?B?ZklGOCtRN3NWNTVaWGRGNGpXZlV3OGJ5eDl3WnEreVhpdTc4bVZ3dEFmWWFF?=
 =?utf-8?B?dkFtby9lUUhPK0tYeEpnUkhTTTJxK2tQRkJxTjZCcFpzaHB6UndmNHRwZmRI?=
 =?utf-8?B?Z280eHZvcDRkd1ZhZG5yNE1kQ1lVTFpWcFYzSTVqNTVKL2xrdEx6b3hHRGkx?=
 =?utf-8?B?VGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b074b09b-ffe8-47f4-025e-08dd665a7dc7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8707.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 20:21:40.1569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BshPYebAQzmBSeKKNabL3zTZ2Zo9eRyeIf8GWweFacYTvB5jaGJJiuoxTgwwlcVngKmmWATqTIqVroNQV+vMGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6808
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



On 3/18/25 11:12, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Zhang, Jianxun <jianxun.zhang@intel.com>
> Sent: Tuesday, March 18, 2025 10:48 AM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedesktop.org
> Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Brost, Matthew <matthew.brost@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedesktop.org; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; michal.mzorek@intel.com
> Subject: Re: [PATCH v8 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
>>
>> On 3/13/25 11:34, Jonathan Cavitt wrote:
>>> Add support for userspace to request a list of observed faults
>>> from a specified VM.
>>>
>>> v2:
>>> - Only allow querying of failed pagefaults (Matt Brost)
>>>
>>> v3:
>>> - Remove unnecessary size parameter from helper function, as it
>>>     is a property of the arguments. (jcavitt)
>>> - Remove unnecessary copy_from_user (Jainxun)
>>> - Set address_precision to 1 (Jainxun)
>>> - Report max size instead of dynamic size for memory allocation
>>>     purposes.  Total memory usage is reported separately.
>>>
>>> v4:
>>> - Return int from xe_vm_get_property_size (Shuicheng)
>>> - Fix memory leak (Shuicheng)
>>> - Remove unnecessary size variable (jcavitt)
>>>
>>> v5:
>>> - Rename ioctl to xe_vm_get_faults_ioctl (jcavitt)
>>> - Update fill_property_pfs to eliminate need for kzalloc (Jianxun)
>>>
>>> v6:
>>> - Repair and move fill_faults break condition (Dan Carpenter)
>>> - Free vm after use (jcavitt)
>>> - Combine assertions (jcavitt)
>>> - Expand size check in xe_vm_get_faults_ioctl (jcavitt)
>>> - Remove return mask from fill_faults, as return is already -EFAULT or 0
>>>     (jcavitt)
>>>
>>> v7:
>>> - Revert back to using xe_vm_get_property_ioctl
>>> - Apply better copy_to_user logic (jcavitt)
>>>
>>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Jainxun Zhang <jianxun.zhang@intel.com>
>>> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_device.c |   3 +
>>>    drivers/gpu/drm/xe/xe_vm.c     | 134 +++++++++++++++++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_vm.h     |   2 +
>>>    3 files changed, 139 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>> index b2f656b2a563..74e510cb0e47 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -194,6 +194,9 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>>>    	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>>>    			  DRM_RENDER_ALLOW),
>>>    	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
>>> +	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY, xe_vm_get_property_ioctl,
>>> +			  DRM_RENDER_ALLOW),
>>> +
>>>    };
>>>    
>>>    static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index 067a9cedcad9..521f0032d9e2 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -42,6 +42,14 @@
>>>    #include "xe_wa.h"
>>>    #include "xe_hmm.h"
>>>    
>>> +static const u16 xe_to_user_engine_class[] = {
>>> +	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
>>> +	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
>>> +	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
>>> +	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
>>> +	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
>>> +};
>>> +
>>>    static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>>>    {
>>>    	return vm->gpuvm.r_obj;
>>> @@ -3551,6 +3559,132 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>>    	return err;
>>>    }
>>>    
>>> +static int xe_vm_get_property_size(struct xe_vm *vm, u32 property)
>>> +{
>>> +	int size = -EINVAL;
>>> +
>>> +	switch (property) {
>>> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
>>> +		spin_lock(&vm->faults.lock);
>>> +		size = vm->faults.len * sizeof(struct xe_vm_fault);
>>> +		spin_unlock(&vm->faults.lock);
>>> +		break;
>>> +	default:
>>> +		break;
>>> +	}
>>> +	return size;
>>> +}
>>> +
>>> +static int xe_vm_get_property_verify_size(struct xe_vm *vm, u32 property,
>>> +					  int expected, int actual)
>>> +{
>>> +	switch (property) {
>>> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
>>> +		/*
>>> +		 * Number of faults may increase between calls to
>>> +		 * xe_vm_get_property_ioctl, so just report the
>>> +		 * number of faults the user requests if it's less
>>> +		 * than or equal to the number of faults in the VM
>>> +		 * fault array.
>>> +		 */
>>> +		if (actual < expected)
>>> +			return -EINVAL;
>> Application should be allowed to provide more memory than the needed. In
>> return, the driver should update the arg->size with number of bytes
>> actually written to the memory.
> 
> In an earlier discussion, we had decided that we should allow for the args->size
> value to be less than the actual size value, since it would be impossible to prevent
> additional faults from filling the fault list between calls to the get property ioctl.
> And in such a case, we would only return in total the faults that could be stored
> in the memory of said size.  In a sense, we had agreed that args->size would
> express how many faults the user expects to read.
> 
> So, if the args->size is greater than the total size of the fault array, then user is
> requesting more faults than there are faults available to be returned.  This
> request cannot be satisfied, so we return -EINVAL.

Yes. You are correct. We catpured this in 4) in the section "Execution 
Flow" in the design doc. There shouldn't be a valid case for UMD to 
query more than what from the first query on size, considering the fault 
list in KMD can only be increased and a query on size is always issued 
by UMD before fetching.

> 
> -Jonathan Cavitt
> 
>>> +		break;
>>> +	default:
>>> +		if (actual != expected)
>>> +			return -EINVAL;
>>> +		break;
>>> +	}
>>> +	return 0;
>>> +}
>>> +
>>> +static int fill_faults(struct xe_vm *vm,
>>> +		       struct drm_xe_vm_get_property *args)
>>> +{
>>> +	struct xe_vm_fault __user *usr_ptr = u64_to_user_ptr(args->data);
>>> +	struct xe_vm_fault store = { 0 };
>>> +	struct xe_vm_fault_entry *entry;
>>> +	int ret = 0, i = 0, count;
>>> +
>>> +	count = args->size / sizeof(struct xe_vm_fault);
>>> +
>>> +	spin_lock(&vm->faults.lock);
>>> +	list_for_each_entry(entry, &vm->faults.list, list) {
>>> +		if (i++ == count)
>>> +			break;
>>> +
>>> +		memset(&store, 0, sizeof(struct xe_vm_fault));
>>> +
>>> +		store.address = entry->address;
>>> +		store.address_type = entry->address_type;
>>> +		store.address_precision = entry->address_precision;
>>> +		store.fault_level = entry->fault_level;
>>> +		store.engine_class = xe_to_user_engine_class[entry->engine_class];
>>> +		store.engine_instance = entry->engine_instance;
>>> +
>>> +		ret = copy_to_user(usr_ptr, &store, sizeof(struct xe_vm_fault));
>>> +		if (ret)
>>> +			break;
>>> +
>>> +		usr_ptr++;
>>> +	}
>>> +	spin_unlock(&vm->faults.lock);
>>> +
>> Update the args->size with the amount of the written. Refer to my
>> another comment above. Also document this in the comment of the interface.
>>> +	return ret;
>>> +}
>>> +
>>> +static int xe_vm_get_property_fill_data(struct xe_vm *vm,
>>> +					struct drm_xe_vm_get_property *args)
>>> +{
>>> +	switch (args->property) {
>>> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
>>> +		return fill_faults(vm, args);
>>> +	default:
>>> +		break;
>>> +	}
>>> +	return -EINVAL;
>>> +}
>>> +
>>> +int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
>>> +			     struct drm_file *file)
>>> +{
>>> +	struct xe_device *xe = to_xe_device(drm);
>>> +	struct xe_file *xef = to_xe_file(file);
>>> +	struct drm_xe_vm_get_property *args = data;
>>> +	struct xe_vm *vm;
>>> +	int size, ret = 0;
>>> +
>>> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>>> +		return -EINVAL;
>>> +
>>> +	vm = xe_vm_lookup(xef, args->vm_id);
>>> +	if (XE_IOCTL_DBG(xe, !vm))
>>> +		return -ENOENT;
>>> +
>>> +	size = xe_vm_get_property_size(vm, args->property);
>>> +
>>> +	if (size < 0) {
>>> +		ret = size;
>>> +		goto put_vm;
>>> +	} else if (!args->size) {
>>> +		args->size = size;
>>> +		goto put_vm;
>>> +	}
>>> +
>>> +	ret = xe_vm_get_property_verify_size(vm, args->property,
>>> +					     args->size, size);
>>> +	if (XE_IOCTL_DBG(xe, ret)) {
>>> +		ret = -EINVAL;
>>> +		goto put_vm;
>>> +	}
>>> +
>>> +	ret = xe_vm_get_property_fill_data(vm, args);
>>> +
>>> +put_vm:
>>> +	xe_vm_put(vm);
>>> +	return ret;
>>> +}
>>> +
>>>    /**
>>>     * xe_vm_bind_kernel_bo - bind a kernel BO to a VM
>>>     * @vm: VM to bind the BO to
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>>> index 9bd7e93824da..63ec22458e04 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.h
>>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>>> @@ -196,6 +196,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>>>    			struct drm_file *file);
>>>    int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>>>    		     struct drm_file *file);
>>> +int xe_vm_get_property_ioctl(struct drm_device *dev, void *data,
>>> +			     struct drm_file *file);
>>>    
>>>    void xe_vm_close_and_put(struct xe_vm *vm);
>>>    
>>
>>

