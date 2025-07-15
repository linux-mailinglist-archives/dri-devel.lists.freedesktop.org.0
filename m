Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65536B06481
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 18:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E0A10E547;
	Tue, 15 Jul 2025 16:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nKnSyZTz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A1B10E22C;
 Tue, 15 Jul 2025 16:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752597581; x=1784133581;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dTxkUuseNumnfWCWKLZDi7X01TNewlwJmpveVu9D7Bw=;
 b=nKnSyZTzq+LDUjIQ+fC8GFKRUNHGUfKflj53jqCU9IfhHTcft4+ehdFO
 oLLVhWKSKF3guxaZNXbOVKPC7NCwsKJC4Y/ohcgcsekuny+m1tSFiEzsY
 5MMKx+NzcaXfO5S2G8VNWVp+sgDkST1ewNH/xJ/ua18wHROIv+dnxxLxN
 LATSg3t43jbeJuXXYveYs3mVI24og40mVSW7xQ/YpNoD6xdy20xydJNrn
 9bZKu8q60LOhyXxA66LXvoeJaKVt5DQ0UapflIiiKBI03PudxTLmg4sn3
 8qXUENQ0ErFmpngBM1rwX+/U5kilUhHF0f9xOZNTzsHTWC1CNrBSf9ws9 w==;
X-CSE-ConnectionGUID: lprrQUERRhuYLE0xXd7LUA==
X-CSE-MsgGUID: wMPoc6zoS+++1iCyEbey7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="42455212"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="42455212"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 09:39:40 -0700
X-CSE-ConnectionGUID: thnZUZrWTJ6krGFZfIIm/A==
X-CSE-MsgGUID: S2aVjMVkSnqe2xbry9Uo4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="180960589"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 09:39:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 09:39:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 09:39:39 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.43)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 09:39:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGyAzdJN1fhB2zvTo9YT+KaXsgwBbsw2s9v/ADDxzcbhGKFVwPoZEzEBIkXoxEnFlOgKjPrbIrjpqZATpOAm8Cx2DLRbASS03OBsbR2T01bMYIpvfQGOAlF5dwq9U6hhHLBhMZCTvrMXVA0A30NEbVm5Kd6/qFPbPzMV54ERjGGYfDgSIajwkorm2tSZJ+C3esjhFqV6/rughnBtPHDuGalWKYd2ZiouUzr4gMy0CGU2hh2pTBDJEtirFA0laedUkC71LONlWFj4ikjxtRoVBa3uIiwGyIp2Nd2HjW/Lx6E6aPpPTzG+6uKs3hxS+xixb/ssjXtUGSbLoIXcACHrlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jN8ij0vvq5DUJ0zFdopwfJgQKQy9N/3BvlZyn3cNs+o=;
 b=cOpeLMB+mURYTnb7p55Bw8aQz0a7C2P5spZ/9rqHdfHMLKsJDfRoAR8/yX/rCVpoD+O6EKS4JGScCqzyQxXRl15psR779rNPWcNJBRCN/cPNtZVDjv4x62MaJtp5/tgJm8E2xqOWnnEArg/DhU/762vaehVlMWROZB0qShWbZmlzbj8pgdzAZDebAuZxxRzCO4Ys8FtDhX1S0KgPvMxX1DJU6UhjhNH5pJmX/PpZmEVb30y5c3Jkmb0QJ7XHSAiVHG4gf3J965YpzKMDL8rmyJN3lS22sSBLS+q0melDbrdGIc/zjAhAg5TKVP7ksuyGb4MEImMqHpisjpI5lPuvNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM3PPF5EA507B64.namprd11.prod.outlook.com (2603:10b6:f:fc00::f25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 16:39:35 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8901.033; Tue, 15 Jul 2025
 16:39:35 +0000
Message-ID: <8a0d8ff3-c790-4dc7-8f2c-99390a6f5691@intel.com>
Date: Tue, 15 Jul 2025 22:09:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 9/9] drm/xe/xe_hw_error: Add fault injection to trigger
 csc error handler
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>, "Jadav, Raag"
 <raag.jadav@intel.com>, "Anirban, Sk" <sk.anirban@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Scarbrough, Frank" <frank.scarbrough@intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
References: <20250715104730.2109506-1-riana.tauro@intel.com>
 <20250715104730.2109506-10-riana.tauro@intel.com>
 <e1d33079c2213534ce33df56a2381604f570960e.camel@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <e1d33079c2213534ce33df56a2381604f570960e.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM3PPF5EA507B64:EE_
X-MS-Office365-Filtering-Correlation-Id: aafbf629-0098-4867-e70e-08ddc3be2ec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NERRMDZHVVFYZFE4U1R1WTFBalhwZy9BdktCQi90Nms0Y1lWWWN4MEY1R056?=
 =?utf-8?B?MzlGb01GMUZaYkg5RzFhSjc3cEx1UU1NeVBnanJBdmJqRUR6YjJpNDkwNnNs?=
 =?utf-8?B?SDJUbGRYa0NlR2JEeGxwUzJvTmZlOCttS1VaYXdobEJZRUxtU0I4S1Y2eERP?=
 =?utf-8?B?UXhtd2sxaXBIMXBkZUhndTNxR2dhVW9hL295bTg5ak5sYXdLTXhkZ0FsbEpq?=
 =?utf-8?B?M2luRlVJWk9icU14WHJaTnJYZHZ2WFNFTDBZSVhVdmtWemVWMVFwT01pQWxJ?=
 =?utf-8?B?N1lqblBNS2M5SFd3bFNSVGszRXVRU0RRdUtOa280aGJMMkFiM0d3YUpyQ0xu?=
 =?utf-8?B?RFREaXIvY253RTd6d09QdkRVdkJMRlg1TGN4alVCSXkzUEpIVjJzL0lCNGJy?=
 =?utf-8?B?alB0cEE3ZXpzeUxJTGRiYVlmQTBtTEVYS1Y3cFJkQ2grTGtTMEl0OUVzdG5W?=
 =?utf-8?B?bkNNK3U0MUhqQzRYYUkxaTNNME54YUFCY1hoV1NGWm9ER3hzcGFyUTlySXFm?=
 =?utf-8?B?cmhWZ2o2VkYrcjZ5MngrNTVVVkNlSkx1QUc3bXZsekJXUFR2NTdNSEhTNGR4?=
 =?utf-8?B?S2tuK2J0Zm1rL1hQZUVGUVRwUnExdzlBMXU4N2F0NDFVTnpKRmZIVDhBekZ3?=
 =?utf-8?B?VzJMbW1XcTVaYVg0TEJQZU1wS0plTE5FU2tBN1UvNDIwaXh2cC9VKzBOcHVO?=
 =?utf-8?B?eFlRL1pZMko2N2JDZGh6ZjEvUzNvaXFJeFk1M3F5Rk9WclN5dGhuMklJelRI?=
 =?utf-8?B?QThBemNDVE1GWW1FWDVHL1lrNjh5ejNLM1duUkRSbnZTQ2MrVVJRNCtzYTZX?=
 =?utf-8?B?bEt2enlrNEtabVdwTUZFTjhNajdmWUVCUkRqemhhL0pzdWpoMnpkcW5UOE1G?=
 =?utf-8?B?K3ZLb0RhM293MXdaSkhKaG5GcGlWemVkOTg1VFVFcnhYVWIxZCs1S0t1UWZo?=
 =?utf-8?B?QUdEbktrb2MxNGYyclVHWHJQK1orR3JxczFGRy8yQ2VkbjlWWkdjeXdOS2ha?=
 =?utf-8?B?QmVTdzA5WkwvVE16Z09qNDZmY3NiT05mejljQnQ4ZExsQTRWUG5zekFPalgw?=
 =?utf-8?B?bmxOdDN5MTArWHd3bEZzTU1Hd1BMbGpxOXZTMitockhBcFM4U29HM3NQT3FE?=
 =?utf-8?B?bzQ4RXpoZTRVZFd1Uk0yQVRnaWI3NkRxSm43azI0Y25TOEZrcFdndFJjSzZW?=
 =?utf-8?B?QXNYM2YxaHN6TWx1Ym5zcUhSK1E2SnkvbU4rRkREby9uT2U5akRiZDh2enpp?=
 =?utf-8?B?MUNITFJWc1hlV2RKaDR5Tmk2alUwU2NIQmNqaW81dkEvMkVtUUZ3c040ZW1p?=
 =?utf-8?B?WVEzanA2M1NrT25acGt6NGFZdXRMSzdJM29VTGFJM3owSWJraHN6WVEvUWhG?=
 =?utf-8?B?a0pIVlBIeTVEbmxKZWtmSmNnOUxQMUhiRXVkc1E0YzhJTFBMZ2FuTHlIV1ky?=
 =?utf-8?B?b09kRkVtM2lhTmNLZWMxcmRmN216ZGNFY3VFRWNhRCtQYXR0WjIyODVMdi9Q?=
 =?utf-8?B?RnB5RTIyZE5iNEM3cno5R0crV0hjMGdZdHpYaXN4dGkvOVMzbmFNZHNBdlJU?=
 =?utf-8?B?WmdLWHozZmZrYjY3OWtFZzZRSDVHdlBDZXRRVEFyVzFOblF2eUJJQ1NIZlVq?=
 =?utf-8?B?cFgyb05rcFBaVGtxZ2tyeGdWcFdUY1FVRmkvMjBOZ3JHRjI1OTh1L2V4MDlp?=
 =?utf-8?B?T1l2MVJuWUZIMGF6MW04V0F5TnlNVkQyaVQrUkREMlZoR29MYzRhSWRJNDRO?=
 =?utf-8?B?TFdVc3ltWGVrbGprT1ZUWmE3UmloeFUxcUkxb05KS0ZhUzRFa1NhNFcvcXg1?=
 =?utf-8?B?bVZVR1VFdll4MER3L1NyaTZWejVrQ0NaZFVVSUR5dXdveGxiSFZWL3FvdjVp?=
 =?utf-8?B?Wk5hd1lUQUxlcUVKRjVkRlpMaTVkdHhJK2FtMGtxVWtrbTNoWlZpcGlUdFRI?=
 =?utf-8?Q?5IFt5jITaCQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFF3bVFzVk90RE0xYWNja1RtU1FsYlZ1RzV0QUFpNjZySkhiVUlXSi9raUhz?=
 =?utf-8?B?ZmxvM2tGNVVqMzhFQzk5Y3Y1alJNR0R6ZmhKR3V6U2picnNieEQ0aDZZclZz?=
 =?utf-8?B?UjJpNEFxMHJyUVBYeG13Mkw3QkdINEFxbnBvT1p2V21BemRFOVBpYUdxSEM3?=
 =?utf-8?B?bEhndmdteXp1TjRadjBKREE4WGRjeVl0TGIwcHFjdURHaGhtTUJ0aGE4VDdj?=
 =?utf-8?B?TUk3bWFNVnV6OEZKQSt3RFVBTElPbDZxUVBSSHR3WS92VER3YzZ2c0FubG9V?=
 =?utf-8?B?RmJwMkZvS2VjSjZmbDdXL3hDT2lVUDladEEvR2ZWNDFzVDNlVFBrTFk0YmJm?=
 =?utf-8?B?aXdnUVpZalVpWkU4L0dLbGlSdXNMNERyQkIxUU45M0wzMDJRc1plUXBYRjha?=
 =?utf-8?B?ck45TmxYb21ka3lQUm10RzB2WlFXeGZIYlRFd0RmTXhEQ05YZFhGcWJETk0w?=
 =?utf-8?B?SkV0V1pNei9nOCtiTmwvc1YyRi94R2E0Zk1MOTdQbDRiZVl5VUJLQ0pVVUNZ?=
 =?utf-8?B?QzlsTzBkV29peVA4Y29HZUNnZmN0ZmlOSW1KclpTYUNVVlcvb2tmTjFINTNh?=
 =?utf-8?B?eFZQVnRkR2kyMkwvMjFicWV6RndSTzIxcGFNUjY2UDRjOVoyRlNOUVlRU2VZ?=
 =?utf-8?B?TzBmNWxoWTJXakVBS1RUZ2xSWTR5OVFETnRtQnBZSHpLb1BnODlJSmZxQ3hT?=
 =?utf-8?B?VEUwd09LTzRQYU5tUjlsWDlYc3pHZ3hMZ0tudThPaitFb1ZsVlF1dHdsSUhv?=
 =?utf-8?B?T2h2V2hCQ0dzVGFHam1DZGZyV2ZIYnZqZW5EOFlEVWsycHBlRW80cy9yRVFT?=
 =?utf-8?B?OUFieGkwYW1YTUt5OCtNb0FOUU1xYy95MGtsSUNsMGlFRXR0UGdJRkRvQk4r?=
 =?utf-8?B?MEl2N3V5OXA2Uzd2SWtLNSs5WXpwTTY5L0VycE4yUnp2Mmo5dXRoYzV5Y2oy?=
 =?utf-8?B?NzcrL1hJT3VqYW41dVBoeFpVamtzZkZPOU13UmR1N1R6aFQ0OUNnL0NCVkpm?=
 =?utf-8?B?UW5ZQW1Ta0k1d29taGpkV0xlbTAwWFhMbXpGTFRpeWVaaWVDcVNmR2VTZHFs?=
 =?utf-8?B?ZVBEMGNTTFBRK2NpbEhBZk1OQTUveGF4bkJVRXhxUlpCa3ZzbGZRUTNMWWwy?=
 =?utf-8?B?OEwvK21NZWlhUDdpZnYvejhQNnlNRkIyZFNjaHkzUGdmVXU1TzRWMEtITVY0?=
 =?utf-8?B?MmFEZ3psTjNQTTMyZTVrcGdvSFUvWGZQQ25LV29uSXBEMzBHa3lqck1TbnNi?=
 =?utf-8?B?Wk9WbUxDTHBYVS9XVk5zVzQyaE95OUJMQUNlRUxsa2V5L1hFQWtHR1J6QkNs?=
 =?utf-8?B?eFM4clNPdVk1Mkp5bUZ4K0ZZRlFVTVlkeWN1Q1FybnBSRlpUd3lGaWd4cHIv?=
 =?utf-8?B?L1k5TUpITWlxS2tVTmlXcUgvcVJscXdveXg2N1A0WmxqT1NwcUZ4eURiOCt6?=
 =?utf-8?B?ZWhoRlBsRnkzMXgvdkpoM0wwc00vWUpMTHAxMnpPU1FQdDBoU0ZubndQLzN4?=
 =?utf-8?B?WXllOTMvdFNaWE52VmlYVStJY1V6M1JQM3J1ME1MQ3o1QTQ2aEtjamhlRWFR?=
 =?utf-8?B?MXNqRkdLQjc5ZW1rVy9GaHZPeDdoWndtcWM4VDFjRHA4TlkybVhxTmtjYnpZ?=
 =?utf-8?B?WVJJc0ZEdHdLYWtYamEzSEU2cGU0RlQzQ1lzSVdZb2xrbDB3OHN0ZUFtRzRk?=
 =?utf-8?B?L1REeEt2c3BuUnpYYkZMcVRPdnA1RXYvT24rSXZEY1dvSE81VW45WUlXWHMx?=
 =?utf-8?B?TGlTTzZRcWo1emdackhLMHRmekcxWWRVZ1RHdXowMHdvTnhMZ2VReThqVFNH?=
 =?utf-8?B?aUtnNGhMMWw4SS9oTHN6YW4xRDBoYmkwZTh3amx2UGl2bVpmbi9GZkZxaGJM?=
 =?utf-8?B?anVyTzArV2w1aUlsdjFESGFMNEJRSGcvZW5QUHF5aW95c2djVVprZE5ZZ3Z4?=
 =?utf-8?B?TjQ5MWdYTGdiaGNZTFhLaC84WUZienlqZDFWQWRoc1Y2S3lFYkkvdGdIWXlU?=
 =?utf-8?B?VXBhNFJEY3p5NFdIYlo2ZFlEd2h4cjgrejE2UXBuSGwvcFRpeWg1T2haZ0pQ?=
 =?utf-8?B?MU9Gbk0yeFZ5VzlTOXNHRzIzYXVIdTZtd2pYc2xETWNWQmpOcTZDL1BBYzN0?=
 =?utf-8?Q?J0LTRu+9H77/e9AtYcWK/fnhd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aafbf629-0098-4867-e70e-08ddc3be2ec0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 16:39:35.6359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFafbW841VRytUIEmZLuLi6FzluMMEKJUwWLKJFa3pGQ9NjZMT6CdnYUKPF56MgeMmLz9gwjKTkhaSW6Xa8WOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF5EA507B64
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

Hi Stuart

On 7/15/2025 7:40 PM, Summers, Stuart wrote:
> On Tue, 2025-07-15 at 16:17 +0530, Riana Tauro wrote:
>> Add a debugfs fault handler to trigger csc error handler that
>> wedges the device and sends drm uevent
>>
>> v2: add debugfs only for bmg (Umesh)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_debugfs.c  |  3 +++
>>   drivers/gpu/drm/xe/xe_hw_error.c | 11 +++++++++++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
>> b/drivers/gpu/drm/xe/xe_debugfs.c
>> index 26e9d146ccbf..95057c04a022 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -31,6 +31,7 @@
>>   #endif
>>   
>>   DECLARE_FAULT_ATTR(gt_reset_failure);
>> +DECLARE_FAULT_ATTR(inject_csc_hw_error);
>>   
>>   static struct xe_device *node_to_xe(struct drm_info_node *node)
>>   {
>> @@ -294,6 +295,8 @@ void xe_debugfs_register(struct xe_device *xe)
>>          xe_pxp_debugfs_register(xe->pxp);
>>   
>>          fault_create_debugfs_attr("fail_gt_reset", root,
>> &gt_reset_failure);
>> +       if (xe->info.platform == XE_BATTLEMAGE)
> 
> I'm still not clear why we need to limit this to BMG.

CSC errors are only applicable for BMG. This bit is not in prior 
products. Adding a fault injection and testing flow will make sense
only for supported products

Thanks
Riana
> 
> -Stuart
> 
>> +               fault_create_debugfs_attr("inject_csc_hw_error",
>> root, &inject_csc_hw_error);
>>   
>>          if (IS_SRIOV_PF(xe))
>>                  xe_sriov_pf_debugfs_register(xe, root);
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c
>> b/drivers/gpu/drm/xe/xe_hw_error.c
>> index c5b3e8c207fa..db7417c390ff 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -3,6 +3,8 @@
>>    * Copyright © 2025 Intel Corporation
>>    */
>>   
>> +#include <linux/fault-inject.h>
>> +
>>   #include "regs/xe_gsc_regs.h"
>>   #include "regs/xe_hw_error_regs.h"
>>   #include "regs/xe_irq_regs.h"
>> @@ -13,6 +15,7 @@
>>   #include "xe_survivability_mode.h"
>>   
>>   #define  HEC_UNCORR_FW_ERR_BITS 4
>> +extern struct fault_attr inject_csc_hw_error;
>>   
>>   /* Error categories reported by hardware */
>>   enum hardware_error {
>> @@ -43,6 +46,11 @@ static const char *hw_error_to_str(const enum
>> hardware_error hw_err)
>>          }
>>   }
>>   
>> +static bool fault_inject_csc_hw_error(void)
>> +{
>> +       return should_fail(&inject_csc_hw_error, 1);
>> +}
>> +
>>   static void csc_hw_error_work(struct work_struct *work)
>>   {
>>          struct xe_tile *tile = container_of(work, typeof(*tile),
>> csc_hw_error_work);
>> @@ -130,6 +138,9 @@ void xe_hw_error_irq_handler(struct xe_tile
>> *tile, const u32 master_ctl)
>>   {
>>          enum hardware_error hw_err;
>>   
>> +       if (fault_inject_csc_hw_error())
>> +               schedule_work(&tile->csc_hw_error_work);
>> +
>>          for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++)
>>                  if (master_ctl & ERROR_IRQ(hw_err))
>>                          hw_error_source_handler(tile, hw_err);
> 


