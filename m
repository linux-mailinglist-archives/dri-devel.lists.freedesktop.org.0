Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D638FA79A4E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 05:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E9910E8ED;
	Thu,  3 Apr 2025 03:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gFA1nR4a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 016C210E8ED;
 Thu,  3 Apr 2025 03:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743649601; x=1775185601;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XNDujCAvUU7E0YOycmmrYxl00jrGZY7A7xCyrkZDQUU=;
 b=gFA1nR4a8l2o0SZYFyf0NjjxzgsMjUr8nKixs3s29eYuv8zg5jmEnUGO
 KBaImxgcysJTApgSl4ZWznauLKDLOD83nK0vLIS/yIVLvcvgAZvXFgvBg
 ZfsB9w5yOpB7NjNpvIDpVKa81yVWn4R1470CdnZLkkTdXkn+dgFaxCD7R
 4mLtEhyNjXCfhdSLLEEquruOWouD1iTA5po0Gc1aHCV08GIIvfbuzO9nM
 LDWzx9mIxYXAMJG9N8As3HWVAi/T9YgalzNw/zhyHoOAqsrxCChw0yOL1
 pt992USKBkxUdxCESC8eV5GKUEnmzjjVceYSJrsQBZpdFju1tCLv0TAV5 Q==;
X-CSE-ConnectionGUID: jOGPlJqYSpaHWRGtqOGNwA==
X-CSE-MsgGUID: /URmc1gNQniWYU6bwj3qbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="45214364"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="45214364"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 20:06:40 -0700
X-CSE-ConnectionGUID: TAQh9oC6QRWs6S25NiD97A==
X-CSE-MsgGUID: uZAT5j7pQ0Kln9f3dblENg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="126691186"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 20:06:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 2 Apr 2025 20:06:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 20:06:33 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 20:06:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U77iKpBAiMt85Cm1fUUx6cONKxZjQq2dO/hecBp3GsjDjL+6cSVGpPiqyVT4h+p+cCLRBO17TOpTLvUX7K/7zDxfm5rjge57pxGwMIoNYeFvwfVVb1U4rtjVcu0hXliKGUaItRWjOgzJ+p+u9yPO846vwd+XY6AYpknx2gk3Q5vHYMNO9bgPBiWWw5jPhq+UnOuYw+uvWmADQT9mQGn40xQvvYkU4VymzxMgopJOIqgyS7eeyVN+sDVFir959xaCJpdVLiNVYMSNWaV0A08unI7KV6fl8NBmLJgsG9NNedpNZlVOJq+Ey9coFFN7jX/voon6svMJHtkk5tau45FKow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J92wSPJG+MU//bhbi2F+qnyzJNbALQ3rr82YJzf3zVE=;
 b=ENsgcrYde91exAalZuqHWUwUWsTIzDCwNZDztsf4pCWV5VWtfv2SH4R7QdJwIMcoZ9HMEpFFyaafnl/Rat7YO5FdiXwmMqCuWon2Vl8/i4D8IkR5zpAMZ4E1twLhaKPPxLCU0bx5MySG1eTuV34edJt3uRvDV4Ed+s8eV1UIlTkQcG9XpLhGI9cryY6RReCxEyJfx2SqbW3CPqN9Xt9bMZPE79XBaBp/7DRoRl4xapTjlFPQ1ZpTUK4sHy5AKx/yt8ez0SiC25gMJpMtch1BXmbdde4TWo1+v9g8I01WorfoJMQM07hrE1OVuNXLJms6icahFVssqEDJvGkhwZdVHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20)
 by IA1PR11MB8223.namprd11.prod.outlook.com (2603:10b6:208:450::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 03:06:30 +0000
Received: from CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62]) by CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62%5]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 03:06:30 +0000
Message-ID: <fffd351c-8eb3-49b3-99f1-a349371b42bd@intel.com>
Date: Wed, 2 Apr 2025 20:06:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
From: Jianxun Zhang <jianxun.zhang@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <matthew.brost@intel.com>,
 <shuicheng.lin@intel.com>, <dri-devel@lists.freedesktop.org>,
 <Michal.Wajdeczko@intel.com>, <michal.mrozek@intel.com>,
 <raag.jadav@intel.com>, <john.c.harrison@intel.com>, <ivan.briano@intel.com>
References: <20250401222657.78545-1-jonathan.cavitt@intel.com>
 <20250401222657.78545-4-jonathan.cavitt@intel.com>
 <9070c25f-3640-4bf1-94fb-d333cccf1f26@intel.com>
Content-Language: en-US
In-Reply-To: <9070c25f-3640-4bf1-94fb-d333cccf1f26@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::35) To CH3PR11MB8707.namprd11.prod.outlook.com
 (2603:10b6:610:1bf::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8707:EE_|IA1PR11MB8223:EE_
X-MS-Office365-Filtering-Correlation-Id: c301a70c-8c84-4bad-bec9-08dd725c880c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUlEWHJlS3czRFQ5a0xTZXhEQm9QdnlaSWNSTnJrQU1TTVFzVEJ3V0RKSmRh?=
 =?utf-8?B?SUp3QVZWeElwTFpwNENHTkk3eGVtT0w1ZFlvbEtCWTdseklZTmVrQkhiOEtr?=
 =?utf-8?B?blMwM3JsREJjY2puOFdTVkgrdXVYL2p2QmNyMG9uQkJaWE1zeXJpTDhTNnNQ?=
 =?utf-8?B?QlZRdHl4Y2JmbGFMamx0dTIrU3FxWWsxaUNaMFh4RnNNL2ZTN0NpL3NKVWNx?=
 =?utf-8?B?Q2h5dUJEUWlkUlpoaDlkOW9Xc3dIQmxCaCtTZ3BxNmgwTnNIdzlweTJRaWFB?=
 =?utf-8?B?cFlCTEk5Y3FrM00zcE1pdzB0dXFkYVM1NzlaYUM4NkxJQUNaU2cxOWg2NHg0?=
 =?utf-8?B?ZkE4WVY5aWhWc2lRVU1VSlRQSlIrSHJGMzQ0ODVXa3ZlU09SYkJPdTlTbENF?=
 =?utf-8?B?UytWM3JjZTEvVThsK0JIUFpGYmFoZWxLZ1MyaVJEbHl3aUFPMU9vdHJFT3Nx?=
 =?utf-8?B?ZG51YzFCdy9LYXd1eWhMSmhjR1dtbEQ2L1pGNTVsZVNmT0RtNmdrM1duSUlG?=
 =?utf-8?B?ZmNHbVdoZFRTS3I1MGNtZ1RoYjlMc2pRNGp4TjZzTFVLcWlhZFNRU0R4bDZR?=
 =?utf-8?B?SzBVc1ErVXhPaU9tVFdlYUlPSU91VGJveDluOG1NMWtPcGpFZlhaR3ZvTUJK?=
 =?utf-8?B?dmFVQkx5OSsxQ0dSbU9VcnArL0dBd2MrakZNaUhDSjFua0QyOTdDN3phMUxD?=
 =?utf-8?B?L3RaT2w1NTBPbDdOQUFrTlBveXE5eFNYTkdDV1Q2Ky82ME8wOUg2L3hjS2Rn?=
 =?utf-8?B?THowL2g0T004aHl1K2ZHZVRpMUpaelpmQVcrRXphS3N4WlZtSlhwVFpCZHk3?=
 =?utf-8?B?Y20vbFhoUGlLRElzdSthcVBsMExIRTVINThVYnZZN3g0aFZPdTZjWWdsSytx?=
 =?utf-8?B?ZTFkb2kvemhwKzNrUGZkWldSdUlxZWRjNmgzcHFUb3RwRW9zQVRmdXIxenY5?=
 =?utf-8?B?MXBTTkZjYWUyQ3krMzJHQnFydEs3QWxiTklpTk0vY0ZnbTFDWEIzNWhzRk9D?=
 =?utf-8?B?Uk1CLzdFMlh5SmlqSDgzdDlRSlczRldlMnpBN0h2V2RKNTBGd3hUenZqVG9r?=
 =?utf-8?B?a1VkRW5sRVp6T3d0SzFkZGtsY2poM0JhVDJ3S1pnVDdoaEk3TEtUK0M5S2lK?=
 =?utf-8?B?TC9icWloRjJsS3p0cyszd0M2bXYyZGlKcVVWWWRJbENyc2JGL1RUbjNuMjVi?=
 =?utf-8?B?MmI2YjhkY0lJdWp4c3VaQTM5a0F2aG9YZThHUUdtNnA2SXAzZUdqL3YyYjFj?=
 =?utf-8?B?eGJoNTY3RERDQUx3c1NTN05BS0x2NnpZQjFGbjU1RU9udGFVeVR3VlNjcEF2?=
 =?utf-8?B?WDhEU1k5TkEvM1BENU1sTTk3UWdjMDFub3FDMGdCamhNcTZNckdDZHVuWGVk?=
 =?utf-8?B?ekM2SHZCRVUwR1owaEs2L2FtYmJjTW9VeFdXRUp2SFk1Q1FmeXFtcHVQbk1x?=
 =?utf-8?B?UEh0dlpCcnlJMFg2anNIWHZ1WEF3bm4yQlBrU2dOMzB4RHBlTmVFWjE1L3ZC?=
 =?utf-8?B?REVMOERCZ3p2YnlOM2NUc3BobFZieUQ3dlZzejVZOTdnNzdQT3R3dWNjL3BS?=
 =?utf-8?B?cWl0TTZNeXFJb3kvdUpFc1lXWC95ejRGa2RsRWFYK1BUTkR2ZE1xTWhxblEx?=
 =?utf-8?B?bnJKQ0k0c0ZZTjlXWnh0dmdlSk4vT1JYVXdkWTdZOHM1RnJhZ2d2bTRyamNy?=
 =?utf-8?B?Q3B3b0dqUFRqdElGc095RHFRN0xyREpFemdaMzhxYVFXd0E1Rk5tOEZWbGNn?=
 =?utf-8?B?VlRSVytVK05YSVRjcnZwNFdPTHZQbkJ1MERPaHc0UUg3SllMcVhwVkRjQklR?=
 =?utf-8?B?UGtHMWwxbmFURUsyOTROOUc4WjZza1RiVy9MOGFGV1hNNWsrcy9CYTJsWTM0?=
 =?utf-8?Q?ciFC0asOwM7qc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8707.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGViVDdXSnVJakQrT0xiVGpxTG0yRnVKYk1ieENkdHNMRnZ1Z2JvOTVVK2xN?=
 =?utf-8?B?VWFCS2dKN3d5dE9SWW9pYWJJRk1RU1gwakZISlNDTHNtNmFrVnZLNGhHT01u?=
 =?utf-8?B?TXlITTRZTzJoMDNTZUROTWRQK1JINnRmY1pIUTlFdjY5RHBUTlhTa2VBM1Rk?=
 =?utf-8?B?KzI1Q2JKbVJpRDgvQWVoOFFvV2dmWVJzc1R6b3FCTk0vaVlIeVJJOE9tVHNR?=
 =?utf-8?B?M0xDRSs1NWs3ZmhuUkM1OGl4LzhMQytoN3JLYXo1RXBldmprc3k3dFYvemMv?=
 =?utf-8?B?bTZrTUd6SHVoZlVVY0JXTTZERm9HbW4zQnJ6enQzVW0wSUJDcXVyVDRYNEtM?=
 =?utf-8?B?V2JLcE9qbVcvRlVIMXFJVWtKMnY1Tmg0V0d6dHptWmpZL0VVWUFSRnFoaDJV?=
 =?utf-8?B?Q3g4ZDJkOHZvN2QzdVlQWXJUREFuM2lCbjh4S25zdWprS0VuZVJMaHpYdWJZ?=
 =?utf-8?B?dkh2Z3c0d3ZqTGFqRzgyU1ZLbStKd1FVVWhMVG9hVjZnd0gvaW03aWxqd25T?=
 =?utf-8?B?OHNERTBVQWFRR0tjUUdMV1ErM2NyQzRGcGU4SlpZKzdxbTkxby9QREFqMks2?=
 =?utf-8?B?ZkxZSnJQb0J4OXBOWGNDdjJpUWF1UUE1Y2ZuMEoyd3dBWHg4OVhjNC9YV0Rr?=
 =?utf-8?B?amNraC9GQi9hYmdDODlELyt5N2VlWEhhVEo1YUdvcnhQcEtRSWpuOWVqbE5H?=
 =?utf-8?B?VW5YdGxsb2tPeXlyUGRCaTl4R3ppRjM5TzdpRTBaL1JJR0Q4UktwYWUwUFVr?=
 =?utf-8?B?MHJsUmVsRFNqdVJQdVNaKzJxWjhIWWEzUzYwOFIyQXRFalBEZDVXY1NxVkFx?=
 =?utf-8?B?cU5mZlVtSFA2MjQzbGR4bG1NZXNOaW9LeWVaYW5GWXVZeVJDWHZqLytIaU9h?=
 =?utf-8?B?aVJvNm96dGxQRFk5RzhKbGNPckRRV2lkUlJ1QU1QWUFYdDM4YVNMc3JhaURm?=
 =?utf-8?B?NEo2cDhXRy9lUTV0T0dhZkVNcUhLc0F3Ly83ei9tQjZlbHM3QnJ6R3JQRDRt?=
 =?utf-8?B?dEdEdjV1MHpMY3pRTnAyZGlLbU00bDVIbzdZcDFPN1piaEk1V05ZSUhQSDBE?=
 =?utf-8?B?RmRXSncvY2hzQ1F1SWZoOXFWL3RMcjh2ZTV0UUVaQjFyTEdWQmtFMVdKUXo3?=
 =?utf-8?B?SzRXT2VMM1RPV1lPVXRocURJQjJUZDJUaHRxUDVUMjdlNTVaV29yN3I4VXNZ?=
 =?utf-8?B?RGF5SHdXcHJ4QzVYNTBmNFRpRzRtRWhPcGdEU0xhdGdrY0xBRWtkMUtWVVlm?=
 =?utf-8?B?NHZTT3pVbDhVdDhZNVFhL2dEcS9sOC82OWUwQVRFWWZIM2hTQi9ySlAxNUds?=
 =?utf-8?B?bWNRa2c2OHdMU1BQbGVEbGl0S0dBYlpYVnB2d2R1dDM4eUJCQWZQcGIwOGg5?=
 =?utf-8?B?LzcxaXRBR0c3dXkzV0E0Q0NjTWNOUGRWM29HYnY0MTFKbnJ6M0RmdTZPZjNw?=
 =?utf-8?B?NklxekxxbG1lQ1RpWFpHVGxhTkYvVDhWNzNiMHgwNEg1QlNrNjhWamwrYlZO?=
 =?utf-8?B?QWxxdW5rYzRDcnc0eVZGTnFoMmxIZWFiUE9jWVV5eDgydG96WUwzQUd0REQ4?=
 =?utf-8?B?dk9ZSndhNkJLMHEyMW4xWTU4eXNoWHkveERBdGltQXZza3dobCtwdTVQa3d3?=
 =?utf-8?B?RXNaWWo0MXk3enNmSzNkSnJGeWlWQnQ4VTRJTytOUHkvNHZDdU5Vb1h6WWEx?=
 =?utf-8?B?VUd3YzVnb0lDMEM1R2R5MVM2OGMvaWhEUW9Ic1V2cFhrVEFYcjRUQnc1UXNI?=
 =?utf-8?B?NEcrQXBOU3JabnpIY1JZRU9VaGdoMjdIbTJlVXlaelVoWS9FSlp2cDBadlFx?=
 =?utf-8?B?RDhnbVJndlZRbDZBM3o1N0hrVGJNQjJzWElkdXlOdGh0dnZDa0JSeXJpVXht?=
 =?utf-8?B?Wlh5aW1yakJjRFNiNDVFeWlPYUhCWGpVUk1KUDdvZXBtSGlodnViakRVMFdL?=
 =?utf-8?B?Ymtkc2xnWWpaNDlEZXBXUFpWcTdGamtlU2dMRm5MdGpZZmo3NXpEbXhmQjJo?=
 =?utf-8?B?UmhOeUFGZHVFV0dPU2hZaWpqRGJJYy9pMEhrTmdNRk5NZlpHMzAybGFiM3kx?=
 =?utf-8?B?b1J4UlZ2enQ2SGptM2krczFKbU5KalloMlZqOVBvZmwxSWhJSThwYnJzUS9r?=
 =?utf-8?B?dVZHUGpUWkdYWFYvRWJmblpuZGVFcEh4cXhybEhrdEdrbzdBT1FXOHNiOS8z?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c301a70c-8c84-4bad-bec9-08dd725c880c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8707.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 03:06:30.3394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3pqf7tZy+f6cftpy6JasE0mYopOpkjwJu/9NO6Nug/JR2aa9BXQ2y+5Y+FWzV+Gv1+2BL7Bp1Vqw2ZQIUuJjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8223
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



On 4/2/25 18:19, Jianxun Zhang wrote:
> 
> 
> On 4/1/25 15:26, Jonathan Cavitt wrote:
>> Add initial declarations for the drm_xe_vm_get_property ioctl.
>>
>> v2:
>> - Expand kernel docs for drm_xe_vm_get_property (Jianxun)
>>
>> v3:
>> - Remove address type external definitions (Jianxun)
>> - Add fault type to xe_drm_fault struct (Jianxun)
>>
>> v4:
>> - Remove engine class and instance (Ivan)
>>
>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Cc: Zhang Jianxun <jianxun.zhang@intel.com>
>> Cc: Ivan Briano <ivan.briano@intel.com>
>> ---
>>   include/uapi/drm/xe_drm.h | 75 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 75 insertions(+)
>>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 616916985e3f..45f7560879cb 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -81,6 +81,7 @@ extern "C" {
>>    *  - &DRM_IOCTL_XE_EXEC
>>    *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>>    *  - &DRM_IOCTL_XE_OBSERVATION
>> + *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
>>    */
>>   /*
>> @@ -102,6 +103,7 @@ extern "C" {
>>   #define DRM_XE_EXEC            0x09
>>   #define DRM_XE_WAIT_USER_FENCE        0x0a
>>   #define DRM_XE_OBSERVATION        0x0b
>> +#define DRM_XE_VM_GET_PROPERTY        0x0c
>>   /* Must be kept compact -- no holes */
>> @@ -117,6 +119,7 @@ extern "C" {
>>   #define DRM_IOCTL_XE_EXEC            DRM_IOW(DRM_COMMAND_BASE + 
>> DRM_XE_EXEC, struct drm_xe_exec)
>>   #define DRM_IOCTL_XE_WAIT_USER_FENCE        
>> DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct 
>> drm_xe_wait_user_fence)
>>   #define DRM_IOCTL_XE_OBSERVATION        DRM_IOW(DRM_COMMAND_BASE + 
>> DRM_XE_OBSERVATION, struct drm_xe_observation_param)
>> +#define DRM_IOCTL_XE_VM_GET_PROPERTY    DRM_IOWR(DRM_COMMAND_BASE + 
>> DRM_XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)
>>   /**
>>    * DOC: Xe IOCTL Extensions
>> @@ -1189,6 +1192,78 @@ struct drm_xe_vm_bind {
>>       __u64 reserved[2];
>>   };
>> +/** struct xe_vm_fault - Describes faults for 
>> %DRM_XE_VM_GET_PROPERTY_FAULTS */
>> +struct xe_vm_fault {
>> +    /** @address: Address of the fault */
>> +    __u64 address;
>> +    /** @address_precision: Precision of faulted address */
>> +    __u32 address_precision;
>> +    /** @access_type: Type of address access that resulted in fault */
>> +    __u8 access_type;
>> +    /** @fault_type: Type of fault reported */
>> +    __u8 fault_type;
>> +    /** @fault_level: fault level of the fault */
>> +    __u8 fault_level;
>> +    /** @pad: MBZ */
>> +    __u8 pad;
>> +    /** @reserved: MBZ */
>> +    __u64 reserved[4];
> Why are engine class and instance gone? I think we got agreement on not 
> reporting class 0x4, but the rest should be kept. If KMD can have these 
> in dmesg, why can't we report these in VK report?
Never mind. I just caught up with the offline traffic. I have no opinion 
on this.

Thanks.

>> +};
>> +
>> +/**
>> + * struct drm_xe_vm_get_property - Input of 
>> &DRM_IOCTL_XE_VM_GET_PROPERTY
>> + *
>> + * The user provides a VM and a property to query among 
>> DRM_XE_VM_GET_PROPERTY_*,
>> + * and sets the values in the vm_id and property members, 
>> respectively.  This
>> + * determines both the VM to get the property of, as well as the 
>> property to
>> + * report.
>> + *
>> + * If size is set to 0, the driver fills it with the required size 
>> for the
>> + * requested property.  The user is expected here to allocate memory 
>> for the
>> + * property structure and to provide a pointer to the allocated 
>> memory using the
>> + * data member.  For some properties, this may be zero, in which 
>> case, the
>> + * value of the property will be saved to the value member and size 
>> will remain
>> + * zero on return.
>> + *
>> + * If size is not zero, then the IOCTL will attempt to copy the 
>> requested
>> + * property into the data member.
>> + *
>> + * The IOCTL will return -ENOENT if the VM could not be identified 
>> from the
>> + * provided VM ID, or -EINVAL if the IOCTL fails for any other 
>> reason, such as
>> + * providing an invalid size for the given property or if the 
>> property data
>> + * could not be copied to the memory allocated to the data member.
>> + *
>> + * The property member can be:
>> + *  - %DRM_XE_VM_GET_PROPERTY_FAULTS
>> + */
>> +struct drm_xe_vm_get_property {
>> +    /** @extensions: Pointer to the first extension struct, if any */
>> +    __u64 extensions;
>> +
>> +    /** @vm_id: The ID of the VM to query the properties of */
>> +    __u32 vm_id;
>> +
>> +#define DRM_XE_VM_GET_PROPERTY_FAULTS        0
>> +    /** @property: property to get */
>> +    __u32 property;
>> +
>> +    /** @size: Size to allocate for @data */
>> +    __u32 size;
>> +
>> +    /** @pad: MBZ */
>> +    __u32 pad;
>> +
>> +    union {
>> +        /** @data: Pointer to user-defined array of flexible size and 
>> type */
>> +        __u64 data;
>> +        /** @value: Return value for scalar queries */
>> +        __u64 value;
>> +    };
>> +
>> +    /** @reserved: MBZ */
>> +    __u64 reserved[3];
>> +};
>> +
>>   /**
>>    * struct drm_xe_exec_queue_create - Input of 
>> &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
>>    *
> 

