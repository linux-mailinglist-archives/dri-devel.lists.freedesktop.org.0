Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 184EDA20ACB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 13:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB5810E0E5;
	Tue, 28 Jan 2025 12:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="beyaTxny";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311C810E0CE;
 Tue, 28 Jan 2025 12:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738068851; x=1769604851;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=o08hf8/Nw0KZFXdHGovm3v0BEopg1fP2colhiK+6jZ4=;
 b=beyaTxny5PDo5rElOPvLhaA77qPS3ruJVYD97lV0pAKPRbIc+cOOYeTQ
 Y8u/MeYGr2VCrJXNQNwn+gta14u1U39SaMMyPLt00UUna8HCgMbVu1tna
 V8PmxQFthGYRElzNLKjduMaFtMWqfAyYscNvPKr9Om26ohK6KgHHjZKeX
 fQuUCU7aDdGJRoOBzzBze4tL8pQEFehFqcGdqpIPRaGjse4PdpYRhWN/w
 bA0cSweRytjn6VYo3C4lpirj4HbIJagHFNhVNDRmR3PE5LSpWdtVaN5Sa
 7xZKVsdSp4r02XG/pRDMuYDEfyelYyh8SJJNBrCzAhuq4LbMlAkKeUI1a g==;
X-CSE-ConnectionGUID: SbUXqDVeRVup2K3YEwLMzA==
X-CSE-MsgGUID: nvrbc5bVRhWSB3mvuCT7YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="61020669"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="61020669"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 04:54:11 -0800
X-CSE-ConnectionGUID: JHCoareOTmCvYj2XJCbpqQ==
X-CSE-MsgGUID: 8XNZRDIYRkSRHxZ4pgIncg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="108838269"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 04:54:11 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 04:54:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 04:54:10 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 04:54:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3r1QKvNBpLOLMW3kewlqAw46SbIRrr1wksLOyChcme7KRGJ+sngdnPZowWd+3WhKK7LW8T9+TEqu+uQVphUASuanUUg6YdI13f7f5FwE67KLAFO9KJFfTS4DUqogHlizCD2JDQp/kYAcWUS2nleh7BLZdliv7d65j+YPa/clZOnh3wZr9OyYvurb0N++iiJXYGzKh+ldOAANo63wjGfZ+MLsLNuWs9e5liiYSv/6A0fOwhOCtvjeZx5Y6P4uSiz7THhUrT3sLFiCxZ9YKiT5eJBmb/mXrPYJYqI7brnIjLBvMpRuGMFNhRlwJZ89npY1AzD+vqpBgI7TRgCuNr8cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EamrNWWxrI60G3X9IvDDLEQdZzBPdtfC0nipFGMuzLw=;
 b=d5W+EOGFPr9K1yxc+GS7js0PLlG2eP2vT9imzAeEPutA1RFcHBzy/eZHzX6acqpOrcZIoR1e1VmmemoL2JJ807w+bUY7ghVmcX5bD5sUQv8NblCFyv+QvwGj1xDt8xCLpeQMA3nEQp0UblvFYVi6U8BUH6qXB+96lO4ozlQ/oMIY+lsXHOfU7Hbb5QaLKCqAp2pHpTxO0apMZ/0/2RHotpJUQxjIxrsnraVko2ElXCJi6iC5JraWj9r2ahMF1SwSGCaP1tKysVWI67cVq+POs6aweCNyOkpJYTQ/t25h63bs1/asrA/3OpmvRi0VtAMld9WZiK+imarIVvTxNKTSew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by IA1PR11MB7317.namprd11.prod.outlook.com (2603:10b6:208:427::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 12:53:53 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8398.014; Tue, 28 Jan 2025
 12:53:53 +0000
Date: Tue, 28 Jan 2025 12:53:44 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2] drm/i915/selftests: avoid using uninitialized context
Message-ID: <seffzgr3ptmwyrk4rmq4hn5lx5lljm6zoan4w752dovrai4ajg@slooah72lixx>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-ClientProxiedBy: VI1PR0502CA0010.eurprd05.prod.outlook.com
 (2603:10a6:803:1::23) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|IA1PR11MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: 50e3f09a-f10a-40bb-c867-08dd3f9ad1ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzhYL2xmYlJVWGxCTERIUFlFanFRaHQ1SVRsWWhNb0kwV2xkNm4yZmcrODQ2?=
 =?utf-8?B?RVVmSWtERlF2NEFpS3pUZHhMcXdHWGpXTmJkLzJJMGYxVDF2TzIvV1JXazR5?=
 =?utf-8?B?Tlc1Qk5mbjNqSDd6WTBObFVTRDNKLzlwNjFubVZNemVOWHFGVjhpajNOalRl?=
 =?utf-8?B?MFZRZ294WkIxdG94RU1NZkJrZGN6b3RvNno0a2ZpTkwzMnpFZnNRK3lrbmE5?=
 =?utf-8?B?cC81NU9kSzl2ajMzdmU1OTIwNUpwcnFBd1lGR1BMR1M2NkJWOWxlcktsSUdO?=
 =?utf-8?B?ejNvbGJoSU9HYXJSVDVBTTR6YWM4bWtyZWxJNml0S0k4TFIzYXNjY01KR1RG?=
 =?utf-8?B?ZFB2ZnJVRVZuZ3JlV1VLRGxXOGtIVVJwNVhOd2RtelhiZEFSU3BNbGNHVXNU?=
 =?utf-8?B?SGV1SzZQOGNqdGZKODBVL1FORE5kUnlrU3NPcmw3bVMrSnkzUFFKT1QvWTAx?=
 =?utf-8?B?eG1ER216SVltOGRhRzNCc3V3U1Jwa21zb0pWRXdCQm85aE54ZzYwSXFFYU9Z?=
 =?utf-8?B?WlBIZlJOcm9taDRWTDh2cGFTNFZ3QXcxOEI5TjhpOVlOemJXR3NMUzNZZVE0?=
 =?utf-8?B?Y1ZpYVpyYmFtdm5EMERsWmg4NDdxcGZnR1g1VmlBWFNQQm5jbGZoV2sxWFlW?=
 =?utf-8?B?N29XOEV4ckN4Z01jNjlzTzRYUEpsenBnRTJLNkpjSzg5OFVHMFJwN21LSS9a?=
 =?utf-8?B?eG1JemRCSUhHRTI5ZXFEMHZDRmQ5ZUl0TW9yWHpVaDdkMEFmUCtDaFByeEtW?=
 =?utf-8?B?R0tpWDBsSysxL1JtanRYRURoNVY2YTJ5ZVVMcjhIU2ZRVzF4Yy85MHhNSmlY?=
 =?utf-8?B?YzB3bEpaazI4cVRobysrZ05seTFDdmFrcmluVFdNeGI0ZlAyb21iblhJaFdl?=
 =?utf-8?B?b0JlWVcwSWkzeVZCeU1VWVlOejBiTUVTbThPRGR1L2hXN3doV3dVRmFkekts?=
 =?utf-8?B?UlhTRkl3ZUVvQ29sdUdBSElhdHRKN2NKQm03SCs1SG5JeDd5dzBFd0x2Sk9Q?=
 =?utf-8?B?aVUwV0l1VnQ4RXFXaDM1anFQRXVkNUhtcXFOMzhGU0tCTE9JM2kyU3lDeWJs?=
 =?utf-8?B?MVJkVVk2bUM3bm5SYkZKeTN1UDExb3NWSCtBNWhkM2Jwa2FpTzRpZlBCdU5p?=
 =?utf-8?B?dW0zMkNrVzVieC9kZVB0NU5nOUx2b1ZCZEtGYSt3d1N1OHlmOWR1M1Y1Njg3?=
 =?utf-8?B?dmV0MTI1aFZHdTJzZ0Z0UHduQ1hzQ0JWU2xYOEYvVzFpK2tUV3orSXpSL1c0?=
 =?utf-8?B?L29vamkxWWs2TjZQRTJ2dFFxa0F0UklZZDdUY1I3c3o1Mkh4dGgxelg0bzVV?=
 =?utf-8?B?QlduSGNkcGVYM1lJTFMzUUtiNmJpU2JzQW5RS1dvY1JEMVZ2ZE42YkszczBB?=
 =?utf-8?B?aE1jWm9wYjJZNmJ3NnF6N3VPWHQzNGxJT1ppeEp1U3dDK2Z1cStlRW5QVEZq?=
 =?utf-8?B?Z3hDRDQyQjBjaGVoR1dRMlp1Z1lnaTVPMEVNakkyZ0o2N3ArRDMrZFBUNFVX?=
 =?utf-8?B?ZjBaMmNWbHNGbDlzS0s2cXN3c0p3a2xTZmVXc0hZZS83QVl1UFFpUzZ6S0Qw?=
 =?utf-8?B?UXVKU1B6N2xsemRlQlkyZldIL0VMcnh5bnlITFhtbzV0M1R0Nng5UVlXTXJ3?=
 =?utf-8?B?aTE1SkJGcjZzVGV6VWt3bEJ2bkpubWxHd1h5M2VraTMzRVFFQ2pHb2hTMWZz?=
 =?utf-8?B?SmsyRmoyWGZaOUxCcEZtR05kUk9qTjNkUDBNZ0pvYk5TeTUwdlArUS9FNDJh?=
 =?utf-8?B?alJ5QWV6RlRWbk1DSVc1NmpMODYrb3RBWkt3TWxFZzJBQkpQSVA4K1htczhX?=
 =?utf-8?B?N1VHVzJxSitxMjJZOXRMTE1BSmZYZzkwMkZhK2JFOG9Jc0YyVmJzNmFDZlhy?=
 =?utf-8?Q?3UugbJ5teI6zT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djlJbXpKNi9lS1RPWXlkNEtibkZ1aTVZb3hGMy9nYVljK1luLzNuTmNjK0hx?=
 =?utf-8?B?cENtRTJDUkQ4MnhYMCtoQ1o3RHlXVFZIejNUNmFXMmFRN1B2NlNMUmxYSVNW?=
 =?utf-8?B?eDJpK0hhSTNvQ1JRNlhORzBiVW52QzZUQkMra1pQYUY2bkRlWU8rU2U1QmZl?=
 =?utf-8?B?eHA1UWNaUTU3VmJHdFA5YWVqNUtHckhqbGtnTXhySkVrUDEvMjBFS3RuNnFM?=
 =?utf-8?B?NEprZFpRQmJNYUx0NkdmSURoc3pVcnc3b3hIQkE0cndPVmVORkczRW9TM0cv?=
 =?utf-8?B?eTlBUkptTU1HVjgvLzcvWDlQUWFWVlZZVWx0NFJFTnNNYjlDaHhxb1BBd2hD?=
 =?utf-8?B?MlFtSFJYeGpyd0lhZEs1OFJLMDVQQnNnc2ZmN1ZtZzFKaFpFNUtnelJsMXFV?=
 =?utf-8?B?MkFDTHJDM2JBTVBZdWlvUDVJYVQ2dEVwVis2RDJlZTY3ejc3aXcxRm5Ca085?=
 =?utf-8?B?WTN3RW5wVThCa3dvRjI1OWpjVEhhejdncjBQNldTU3hiV05rWHIrMzVTNG52?=
 =?utf-8?B?YVc2MGlTSTQ5VGhjUGZURVl0czdCM3diQjM1MGZBc0dlakxTdWp1bGw3S3ZD?=
 =?utf-8?B?SVFEZTlJTm53UXRKd3Byb2lGcW1xb0VTdUJxYUR0SE9QMWVmYVpLaXlBV1lP?=
 =?utf-8?B?QzhWcmtQcm5ycnI1MDNZRHhTRk4xZzlZeXFjbVBrQmFJdktoNjR2b0RlZXph?=
 =?utf-8?B?OEVpdUpydE16TUlFQXhKRnVtclFRYWhmREtvU1pTUkdwUmR0SXcvclRqR0Vi?=
 =?utf-8?B?MnBtUUZncGVrYUNYeVpiWnFPS1JOTmxoOTRWUk9SN24xZDJuSzJ5Syt3SGdk?=
 =?utf-8?B?OGZpNWllYXRaSEdjSm5sWmpEMThQcXkvRDg3RVZTbnNKQjZ1UUVtV3BScmVo?=
 =?utf-8?B?RUxUbm83NzFnRVJSM01qMEI2SDBPUk5sZGhENmtyeGJheC8xYms1cThFcEdN?=
 =?utf-8?B?NkhiRXl1STl4aGw1ZjV5Q1lDSmJNMHRjbXAxSWs1LzA4UUV5U0c2ZEEyclF1?=
 =?utf-8?B?d2U4NVpjNHp4QzBTQzgyN3YrMkNFQW9JNE9WbEZGeUY0Z2IrZm15ZjVlR1B0?=
 =?utf-8?B?K0dERC9oVnhtYXBkbUtISXJmLy9Ocml5OExyVEc2V0sxL1FkUU1pSVI2Y0pI?=
 =?utf-8?B?cmsyRXFidm5kNHhBSUYyVUlpT3RmZHB4MEVEYVJ3ZTlNbmhVUlZhRDZIcjZN?=
 =?utf-8?B?VGRGQjl5dFRpVGZ1L2RRTmlTK0RmNWFQS0l4RnhXV2VPRklWM3ZMd0JWaEY4?=
 =?utf-8?B?aHlpVC9WMkhYSWNaS2U0QXlaSE1VcDZoOWRSRDl1NzRoRmp2aWRDRFNJVjNo?=
 =?utf-8?B?d3VIbUxQWDNUb1BxSkttUkdhRVR5UmdFdkM5VkVvN1Q3VGFYOUtRNmlpMFds?=
 =?utf-8?B?MmswRm5abDl1b0FsOXhPMXF5U3R6alRUeUVmeDJ2d3lURlVxUFQrVDVQY1BB?=
 =?utf-8?B?STN6a2hFQUJUdHYwQXMxdTRvU2M2d3FUQS9JMzI2TzdqZXU0VFVuemp4cXJ1?=
 =?utf-8?B?Z2dTbllsL0tCdWhmbW5NWkY0Z0lpRFpwaUREK0U4Kzl5Y0JobkdhK2U0S2lS?=
 =?utf-8?B?VnRBQ2hVdTV0R2dSVTBBVTJuamZncjdMWUpPTWxOM0hxRVR6M2lzZzlEWEg0?=
 =?utf-8?B?djg1TWNTQSsxZEpSNmFORERRZkUxQlhHQ1dRa0Rabm12MWIxYXVSd3lOU1Ns?=
 =?utf-8?B?WGF6aU5FUFlFcGloRFF1cFNqemNZd3NsZVVaL3h1WTluRzcrT1pURlNVMEc4?=
 =?utf-8?B?RC9TeWtIaUprc3lCcDFEbXZXNnVVcm9iQVdIc3EzWXBYTmpYbjRzc01NODhS?=
 =?utf-8?B?TTFFNG4yMC9leEcrU1Y2dmYrZ3o4blNFK1c0c28vVlZPaTFXMlB3QUR6WGxL?=
 =?utf-8?B?ZEl6ZHV2djY0VGdVS2QwM3dvTWFhTklUMnBDNFIzdVZtQU5LVmptR2Q0ZUFG?=
 =?utf-8?B?S0lZa1FWWjhwdHhjS0gzNmFMajRpNmRzd2RmUnpjSW5mR0ZOWmF6d1FLMFZV?=
 =?utf-8?B?VnBYbmRaMXN2S0FjZnlSeFp2UUJLVUR1czQ2Mm51RUdXNjNHczYrNzV5TXBX?=
 =?utf-8?B?MjNvOE5XeE9KVUVxSUx1T2FCQzB1cDIrMk5IOC9vbkRMeURmWG9VaEpyS2NT?=
 =?utf-8?B?YkNqOFdROFJ6NUR4eUFsR2YxUUNBOE82SUdzay9PbnNiSllFdTVMRks4TlF2?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e3f09a-f10a-40bb-c867-08dd3f9ad1ba
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 12:53:53.4144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIsZWwP7EYrFXcfgawVb0n92h1il0UiZxL+Bu41nmBIVkbFveMf1Xs+OpE8emrrvfmLii0UAfZeA6IEcjFpOZOHRES9e836mpCInW5aR7+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7317
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

There is an error path in igt_ppgtt_alloc(), which leads to ww
object being passed down to i915_gem_ww_ctx_fini() without
initialization. Correct that by putting ppgtt->vm and returning
early.

Fixes: 480ae79537b2 ("drm/i915/selftests: Prepare gtt tests for obj->mm.lock removal")
Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
Changelog:
* v1 -> v2:
	Avoid calling i915_gem_ww_ctx_fini() with zeroed context
	by returning early (Sebastian).

 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index 5816d515203a..d94a5b88f442 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -167,8 +167,10 @@ static int igt_ppgtt_alloc(void *arg)
 	if (IS_ERR(ppgtt))
 		return PTR_ERR(ppgtt);
 
-	if (!ppgtt->vm.allocate_va_range)
-		goto err_ppgtt_cleanup;
+	if (!ppgtt->vm.allocate_va_range) {
+	        i915_vm_put(&ppgtt->vm);
+	        return 0;
+	}
 
 	/*
 	 * While we only allocate the page tables here and so we could
-- 
2.43.0

