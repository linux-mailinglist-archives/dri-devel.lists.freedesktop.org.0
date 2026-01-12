Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B96DCD107F1
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 04:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C7E10E206;
	Mon, 12 Jan 2026 03:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ndmwWeiO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E76810E1A1;
 Mon, 12 Jan 2026 03:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768189286; x=1799725286;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n5wy5vf/Yi8lRImAwym7CY5tRxoxZ9zL1zdBgPD4y20=;
 b=ndmwWeiOlFtC8B15Rk5h5sX2XB4al296E2rXbkqTQhK3o5mYHqstt1Yv
 VjP7d2h2U/y9xPi5lN4jYY2BA5fzaUyXIubm8wwNQxFUx6ORs328d9DBT
 9EFPVONN+zGpA3LQK7NEJHBQeZS836QcFmnG323dK0JM+k0rPqfehcY9R
 xchb+66rT5HaOJMQhSaV7n0ja98twIOkI0gznSS1txvyY+kq6WJFcBDN7
 8sBSsmFd7zHXsKesaV+brAiAwYX1Y0+B4XWUyrHVOwDifYqzkFCcQXyFr
 tqIh/eUNv9DY4RwXVHNx3Y7mEBQgPCxWRdxa6tYdBB7TeYidnL4SVYJQ1 A==;
X-CSE-ConnectionGUID: ZgWXqpo2QQmPtXe1UkgD3w==
X-CSE-MsgGUID: LnlNY286TRSzvYnT0qiLBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="68668148"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="68668148"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 19:41:24 -0800
X-CSE-ConnectionGUID: 7AcNu6rdQtGsG8fdLaB6Ug==
X-CSE-MsgGUID: vAgaNrrjQc2eP49v8iepbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="234686292"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 19:41:24 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 19:41:23 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 11 Jan 2026 19:41:23 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.34)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 19:41:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kH0h/8xnux1vcOza/2+LVP3Dzl21NXWROlvJvAtnu25d311a4Hebl0wFFfTwvp9b7/7PGgAQh0+ZNEuhx+FO2UE3a1l54aL72sJZjIG+SGfhyNwwCylFZVuwTbDDySOHG2hnlqUBQrHb8xqAKM4YTR/CyrVmyXJ6OnMRXmmToutVBUCMTNiK7CvYRKoBktY/Df7gZuEy4VkdebOwLias5KZoVe1R65t4LO/xi++IzahDURzQReX472DS8x1umzHAqPMvvKTbiZ7ToqXg/xBZ8Ceajt3TCKAd+X96K9HMnLW6PMnbfBcftKWnLg43UIz59USUWCW99veHr7G4hnVZ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPmekQtaUQ9PbL7vHghmVT6uyiRoYRkkFNwRV/9LYxc=;
 b=hvUKATsiQXVfXWfzx9LUn3Oo8KoRSG5MObUyd/PipH7IlicH6h+GXiYVxsbklJC2k9qF0Wb02VVkVjsfwunyvDeMdtLqP+H2/0qZi3cF8lNFgfrjaI6a+r9G95DSxa7bnQUkD+P5JdaeiDgWUKNv7zRAKDFC8fGcIZUNhHaL/V4hIn0sISyT08cGxzNqnbYgds0T45wMqDozLgaMRDdIvzXlWzmZmO5EALKoVnUDL6pBeyjaY2qB3dIrXWCkYUo5Tu/cUmhlP7WznxHx2PxIAXtzmLkdBKo1N8m0y58J+Pntrp0IZGUwJC5pVAdFrYdNW7u/pKFc2OARJlNeAl2yMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB7496.namprd11.prod.outlook.com (2603:10b6:510:280::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 03:41:16 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 03:41:16 +0000
Message-ID: <1f77c982-6b83-4a0b-8844-e1ab2137fcff@intel.com>
Date: Mon, 12 Jan 2026 09:11:05 +0530
User-Agent: Mozilla Thunderbird
From: Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH v3 3/4] drm/xe/xe_hw_error: Add support for GT hardware
 errors
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <airlied@gmail.com>, <pratik.bari@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <ashwin.kumar.kulkarni@intel.com>,
 <shubham.kumar@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
References: <20251205083934.3602030-6-riana.tauro@intel.com>
 <20251205083934.3602030-9-riana.tauro@intel.com>
 <aTm5W6ibEn3XPZ3o@black.igk.intel.com>
Content-Language: en-US
In-Reply-To: <aTm5W6ibEn3XPZ3o@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB7496:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d1dce2-5d97-4e65-5f50-08de518c7074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWx1K3Q0QS9oUVkxZ0s0a2V6OWJWczhUVE00cWNzWHdMWitBMS90N0pxalEy?=
 =?utf-8?B?MGxDZGZnZ3hzWXltZTRENlcvdlFDNExWNUJST1hzQUdYblNJaEZvcWRUTlZl?=
 =?utf-8?B?bHZrYkFmSWR1U1FGaFZPUnFXWlk3YUc5cWJiV3JvZTR5N1VCU1BOZ0FjR05E?=
 =?utf-8?B?R1pIRVNEWHdrTS83dnd5b0lLK1lsajgybTd0YU9IR3d2NVhoQ3ZCYXJITGhD?=
 =?utf-8?B?djFRQVZob0QwY01tUjRPVFBZdHFpcjY5QlpheTdCdFJydGJIQjE5WmJxaW9s?=
 =?utf-8?B?Q0VYaXE5OU5yNEtYMTNqYWx3VDhFNUZpR0oxT0lQSlp2aWJrcVRSU0ZhU1NU?=
 =?utf-8?B?bDB2Z1BOWDVrSlFlaEdOeHg1djFsWElGL1VoN0xVYUdXTWhHd1p1Vm5OZ08r?=
 =?utf-8?B?MGhZUmcwbnY2VC9TVVkraXp2d1ljd2ZsWTZ1d2VEa1MxSDNRMDdzcXBoMjFG?=
 =?utf-8?B?NDBVM0lOUHVNMlNvcFE0WDh4K3BrRFJpQ01lNE5vRXhZZk05TDZEbkcveElk?=
 =?utf-8?B?WXFESndzd295NHZDVk4rUVVyVUtKcE1LM3h0ZFpGUmlET1Z4SE5IL3dQSFdh?=
 =?utf-8?B?R0lPbE1VbURlSmMzT2FDU0JFWUlzbUFDcklydm0rTnFWZXdETGxIbnp6cTVQ?=
 =?utf-8?B?N1ZXK0pRT0NaVUljQWRXbFA2YUkyZUIxb2lUM3c2T2RqMGptajRoNDdUOEJQ?=
 =?utf-8?B?dXJiT1k3OE9lNDJCNzMvbEJVVzd2KzNqQW1vL0w5VktwTlVaVHFiRm5Sd0cv?=
 =?utf-8?B?c1lDSUN2NTZSVjF2ZkFVVWxQL3pPZDVwV0ZsK2VpWTJ6UTBvZUI2c1o0MDh3?=
 =?utf-8?B?TGxFME5NNkt5dVM3K3NQMDhhdS9wYzZDdGlBMUI4MUc3eTVxNW91b0NNYjBr?=
 =?utf-8?B?R3NiVXV0QjB3ZGRJVW1EcnlSQUdOdGNQWU0wZFBwdjF0NG9GbEcwL21LelhL?=
 =?utf-8?B?YTAyQUU3a0dXTW1Fb2twQ1YvU2JNWTlIWllZY1dqY09BVnJXUmtQZlUwbmtw?=
 =?utf-8?B?bWRITUlFbmtVRFpJUnZWVDZkUS83Y0pGUEFDT3FUdkxCNFEwMVNBNG1QM3NB?=
 =?utf-8?B?TWRGNkdLOFV6bVhNYWxPK200RHNVSXJFbk1ycWhndzZ3OFUxWm1GbjVoaE5n?=
 =?utf-8?B?VXF0cDNxSnBMdmZzUXBZbUtqUHc4bG1Ka3NsRUU3KzNCYTVZdVRRdEtLZzcx?=
 =?utf-8?B?Z3hsT3V0TlVnNzJlV2l3SjZYckZiYjJsTjdpbVczbXkyWFE3YzFiNmFkWlpq?=
 =?utf-8?B?TzMxVzhkSFVrWlU0bHAxbS9uaGpuRDMxZmRQcFpmNTNYRldXcHZzeEU3Wmly?=
 =?utf-8?B?SG9vdkc0WjNnYXBtU0UrSU40U2ppU2hHSlBOY2VhTUh1K25PVWNhblNHWEVN?=
 =?utf-8?B?SzZYdVNGQVFVaTBoQkNQWlN6UnBhYWJqR1ZwbVpRV1g4byt3OEpDRm9NajA4?=
 =?utf-8?B?VEpna3RvY2pNK2c5V0VNaFNkNWxoZ0RrQW9hNldOTVJkN3ljL3kzUzl1b204?=
 =?utf-8?B?M3haQi9qb0JQZndxL0pjamxhYWxJNjUvODRvVU05WUszc0xpMzRGVGxkWkFr?=
 =?utf-8?B?bVQ2YnNxYUltK09rcVRjSS9hNzJwNWkxeWpTYXRTOWdjQWZBTEtvU2RoVEtF?=
 =?utf-8?B?bWpmc2gxbEVTU0VPSlVYNnNwVGhYMEtJOUhvb2lwaWhSSEFFMWVrQjVGZEs0?=
 =?utf-8?B?Q2lubW5LK0c3UGxFN05ZLzVIa3hvdVAzRWVhUU0rSjVDWVFRd1g4MHBEZ29E?=
 =?utf-8?B?UUJ0TkMvYVBPaWF5SUlNT1pzaXY5dCtEVjMxUVlSQzE5V09vVk5laXhKMTNV?=
 =?utf-8?B?NE0wL0NBZDVpNVB0T1Faa2FkRllIQmczYVRzUGZJLzJuNjA1UzZPaW51OXJO?=
 =?utf-8?B?T05HRGYrbC9LV2dTbVVUa29lcmN5Q2s1QXBqT01CcFdFQ2o1VWpteFI1elQ1?=
 =?utf-8?B?Z2ZFRXVuQTg3K01XbGdZa1FYTkxuWnBoaEVobW1hZm9vYm9WQ09VL2thMzZj?=
 =?utf-8?B?M1orWWZhc3VnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Snk4cVpWTUVnc2xLcGo2Um9va0lGK3ovL0ZST1RpYmhDZWFIS3JmK2dSNHFH?=
 =?utf-8?B?VDF5aUVMZFBwbklpNHRXZUZHY3FXaUNFaE5NZ3diQlJtWldtcW93aGVvR0Vt?=
 =?utf-8?B?V2lUM1FEYjVuMXhJRVNrNmVsVThhTTJjK0JTRDRFZ3hVTm9qeTI3eVd4MkYv?=
 =?utf-8?B?aEF1L3REem5tbHlvSWVFQUUrQnJpVmNEbitFcG1ZdmlZVjNMN1ZIUFBjOUhm?=
 =?utf-8?B?N3pNdXhkUVRsRTMwbktLR0xjYzVORWFiQzUwQmtWOGN1eDV0OWNsYjU0cE5z?=
 =?utf-8?B?blpveXVPYk03QkM5Y25hVi9CSytrMFZwLzNJaXhhcG80aXlDVm9sbFJFMURT?=
 =?utf-8?B?emdtNVU2TE1BdmN4Qit2MFZ4aE1kTng1d1hIZy9vRUJXSTVWOVlFSEN6a1RE?=
 =?utf-8?B?QWlJSjU1ZHhpN1FOTWpsVWJsNWRndXVyVG5qZG5QZjM5VmpWWkZ4RWJMbjJG?=
 =?utf-8?B?d1RUQ0xBTkJLK0g4dXBnVmpCSFh3TDdKM1FTd1dwZUQ0L24yRlJlNUZhZG9L?=
 =?utf-8?B?YXE4SGFhSlhtNHZIZXlVNTVJL2xpTVoyT1VnaWh6bFR6VWI5aURaeDFKQzJH?=
 =?utf-8?B?d2RxVFA3Y2tQRzEwS3BndmRiRVUwV3VtWjBMSzFIQnk1UVhrOUZwL3BsMWdw?=
 =?utf-8?B?SE9VOGY4WFB5S3lHeW9kMW9oRlpQUkR6aENqUGEwMXJZNzNVVXJDMXdhTnVs?=
 =?utf-8?B?TzRFRVJLaGJydEFhckNqdmh4cU1EL3g4Rm9GV2ticlVsYmJVNnN2REpkUnV5?=
 =?utf-8?B?My9kS0Q5QzU0MStzM1NHOS9mMnhqejFDKy9QV0t1Y2d4RlVSWHB6VzNKTUpY?=
 =?utf-8?B?aDdPWUdUK1JDUXZPeGFrb3RwVFV6dGpGQ3F5cXdkTEl6YzNRWFkxeGd5emtG?=
 =?utf-8?B?T0VnSHoyeDJEclFFY3JaN1U3ai8wcWRqcDBSVUNYSjF2ZkZaODlEWlFCS2xY?=
 =?utf-8?B?UEEvYmk4blg0a3BZRXlEUk00Mi9tSDIrVkF3dHR4SjdzSlFjR3lCWGhhTDl1?=
 =?utf-8?B?YVozeEV6dDgxM0FQeTdkd3I4dlpoTUVmeEM5TG05eEVHQ2Nkb0JjVFFQR2dm?=
 =?utf-8?B?WDJsZG9Rb3VGRHU2VXR2Zmhzd2h6VHFYV0JKTlZDRVRJcCt5Tjc0aUoySHlG?=
 =?utf-8?B?RHBZS3pqQXVHbE5hTWNQK2U0OG5JV2ptUzArTERBdzlrTHYveWZDWGlkeDda?=
 =?utf-8?B?WXlZcW1oYUZtMDhSd1dZUWFxZVVlNnd4Rk5GRVR2NXBQZFd2Ly83U2N1QWg0?=
 =?utf-8?B?KzJlUERuNVoyTENCeG0reDh4cTNzWHE1dXcwWE1JclVsN0Zma2I1V1Nxa3J3?=
 =?utf-8?B?UzBxTDFsUkk3dzQ5K21xM056cnZack50TmRyek8rRk5UYitjQ28rMHV3WWhj?=
 =?utf-8?B?YUFBNVNKOTVHNU8xeFc1QkpwU25HZXo5M2lnQUVNMTNUMFFvbW43WVVCVnFp?=
 =?utf-8?B?TXBpanlrZWpielpNQ1c2eVJUdFpyeDg3QjdpN3VkWkZqSkNaSmw1bFFacmxn?=
 =?utf-8?B?ZjZGUkRiU00xZ0lXUWRwUVNmKy9LamNvcG1EWHBXUUUvdDM1NWVpRjg4U09L?=
 =?utf-8?B?cWxSUUZJYVdvSEZVSXNaOVFKZENzK2xDaThHeFBGVXZiRE8xUGFmNDkxOUQx?=
 =?utf-8?B?OWZvQWlXYk1qZkNMVVdLUXYrVUQvMHpOdXd1cFdJSkpkdUVWVGVCYTRrQWxn?=
 =?utf-8?B?eHluS3EyUnhFZzlLbkpNcWpzVkcxMWQwZzRhNXFkTDFEUENzOXJyOHVwSHJR?=
 =?utf-8?B?anI1cG0xRk9rSkcxQU4wSHFhZnFPcVNBTFMzV296MEpIQ09RdGZQcXlmYlFF?=
 =?utf-8?B?Q24vQ1NTV1ZJck1UaHVLSkFNKzdyM3FmUEthRUFOYjBWZTQzaXJkcWZTMG5q?=
 =?utf-8?B?bUJ5UEg0MXFla0dIWTZnN0V5Ri9ud2NhaDJDUkJ2cy9McjJFZHFkcTZtODVZ?=
 =?utf-8?B?c25TUEp4cVVURmdrSWpLQUtaZmNzb0NFOTRVbmFNem56V1VLUDdGdTdkN2dp?=
 =?utf-8?B?Si9Wa2tIdW5KY0IxVFdIaW52MHZ1ZVJjMnU2endjRysvVHQyNXZRZndNYmsy?=
 =?utf-8?B?VElWVVBUamJVRVp2dHJ2OEZXZERiaXFDOSs1RnJpT0hwWDd4WWFiVU1ZeEdI?=
 =?utf-8?B?M3NJdmgwMllxYlZuZ1pScXg4dFEvVDlOdlRHUG9qek9wVmpRcWVpWVl4eTlQ?=
 =?utf-8?B?bDBmMndMMkpsUTZGWW5jNlNpNlRhdGF4VXhQODVNczZ4ZXRBSWh5VUtvQVBT?=
 =?utf-8?B?ZXYzUEVWalBGd2RuNHQzM1hCcU5UYlNoQmM3SHBscGdqRkJwOXM5Ni9iZ0FD?=
 =?utf-8?B?Z1k0OGdoVlM4LzRuUEdoQTQ3QmYyRE1jc0VPMlhkWDJPekZhbWRkQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d1dce2-5d97-4e65-5f50-08de518c7074
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 03:41:16.0538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MGXpJMYEJuWdsgQ+aARo5D7/0oSu9Cb5X3yeqohemSy8PTyP1saaMoiY35t3Yr+efFkDAApE7MSfAzFbXYUZJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7496
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

Hi Raag

On 12/10/2025 11:48 PM, Raag Jadav wrote:
> On Fri, Dec 05, 2025 at 02:09:35PM +0530, Riana Tauro wrote:
>> PVC supports GT error reporting via vector registers along with
>> error status register. Add support to report these errors and
>> update respective counters. Incase of Subslice error reported
>> by vector register, process the error status register
>> for applicable bits.
>>
>> Incorporate the counter inside the driver itself and start
>> using the drm_ras generic netlink to report them.
> 
> ...
> 
>> +#define ERR_STAT_GT_COR				0x100160
>> +#define ERR_STAT_GT_NONFATAL			0x100164
>> +#define ERR_STAT_GT_FATAL			0x100168
>> +#define ERR_STAT_GT_REG(x)			XE_REG(_PICK_EVEN((x), \
>> +								 ERR_STAT_GT_COR, \
> 
> Align with braces.

This is aligned with the braces.

> 
>> +								 ERR_STAT_GT_NONFATAL))
>> +
>> +#define  GT_HW_ERROR_MAX_ERR_BITS		16
>> +#define  EU_GRF_ERR				(15)
>> +#define  EU_IC_ERR				(14)
>> +#define  SLM_ERR				(13)
> 
> Nit: I know this consolidates the duplication but separate bits followed
> by their mask would be relatively easier to read IMHO.
> 

Hmm.. okay. Was trying to avoid multiple declarations for the same bit


>> +#define  GUC_COR_ERR				(1)
>> +
>> +#define  GUC_FAT_ERR				(6)
>> +#define  FPU_FAT_ERR				(3)
>> +
>> +#define PVC_COR_ERR_MASK			(BIT(GUC_COR_ERR) | BIT(SLM_ERR) | \
>> +						 BIT(EU_IC_ERR) | BIT(EU_GRF_ERR))
>> +
>> +#define PVC_FAT_ERR_MASK			(BIT(FPU_FAT_ERR) | BIT(GUC_FAT_ERR) | \
>> +						 BIT(EU_GRF_ERR) | BIT(SLM_ERR))
> 
> I had an impression that we used REG_BIT(), or did things change?

I took the previous patch directly. Thanks for catching this. Will fix

> 
>>   #define DEV_ERR_STAT_NONFATAL			0x100178
>>   #define DEV_ERR_STAT_CORRECTABLE		0x10017c
>>   #define DEV_ERR_STAT_REG(x)			XE_REG(_PICK_EVEN((x), \
>>   								  DEV_ERR_STAT_CORRECTABLE, \
>>   								  DEV_ERR_STAT_NONFATAL))
>> +
>>   #define   XE_CSC_ERROR				BIT(17)
>> +#define   XE_GT_ERROR				BIT(0)
>> +
>> +#define  ERR_STAT_GT_FATAL_VECTOR_0		0x100260
>> +#define  ERR_STAT_GT_FATAL_VECTOR_1		0x100264
>> +
>> +#define  ERR_STAT_GT_FATAL_VECTOR_REG(x)	XE_REG(_PICK_EVEN((x), \
>> +								  ERR_STAT_GT_FATAL_VECTOR_0, \
>> +								  ERR_STAT_GT_FATAL_VECTOR_1))
>> +
>> +#define  ERR_STAT_GT_COR_VECTOR_LEN		(4)
>> +#define  ERR_STAT_GT_COR_VECTOR_0		0x1002a0
>> +#define  ERR_STAT_GT_COR_VECTOR_1		0x1002a4
>> +
>> +#define  ERR_STAT_GT_COR_VECTOR_REG(x)		XE_REG(_PICK_EVEN((x), \
>> +								 ERR_STAT_GT_COR_VECTOR_0,\
> 
> Ditto for alignment. Also, the convention here seems like an empty space
> before the backslash so let's be consistent.

Alignment is proper here too.  It's patchwork :(

> 
>> +								 ERR_STAT_GT_COR_VECTOR_1))
>> +
>> +#define ERR_STAT_GT_VECTOR_REG(hw_err, x)	(hw_err == DRM_XE_RAS_ERROR_CORRECTABLE ? \
>> +						 ERR_STAT_GT_COR_VECTOR_REG(x) : \
>> +						 ERR_STAT_GT_FATAL_VECTOR_REG(x))
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index d63078d00b56..77c90f1b06fd 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -3,6 +3,7 @@
>>    * Copyright © 2025 Intel Corporation
>>    */
>>   
>> +#include <linux/bitmap.h>
>>   #include <linux/fault-inject.h>
>>   
>>   #include "regs/xe_gsc_regs.h"
>> @@ -16,6 +17,8 @@
>>   #include "xe_survivability_mode.h"
>>   
>>   #define  HEC_UNCORR_FW_ERR_BITS 4
>> +#define XE_RAS_REG_SIZE 32
> 
> Alignment please! (including the values)
> 
>>   extern struct fault_attr inject_csc_hw_error;
>>   static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>>   
>> @@ -26,6 +29,25 @@ static const char * const hec_uncorrected_fw_errors[] = {
>>   	"Data Corruption"
>>   };
>>   
>> +#define ERR_INDEX(_bit, index) \
>> +	[__ffs(_bit)] = index
> 
> Does this guarantee compile time evaluation for all archs? We might risk
> breaking other builds where the compiler can't figure it out.

Thanks for pointing this out. Will fix this

> 
>> +static const unsigned long xe_hw_error_map[] = {
>> +	ERR_INDEX(XE_GT_ERROR, DRM_XE_RAS_ERROR_CORE_COMPUTE),
>> +};
>> +
>> +enum gt_vector_regs {
>> +	ERR_STAT_GT_VECTOR0 = 0,
>> +	ERR_STAT_GT_VECTOR1,
>> +	ERR_STAT_GT_VECTOR2,
>> +	ERR_STAT_GT_VECTOR3,
>> +	ERR_STAT_GT_VECTOR4,
>> +	ERR_STAT_GT_VECTOR5,
>> +	ERR_STAT_GT_VECTOR6,
>> +	ERR_STAT_GT_VECTOR7,
>> +	ERR_STAT_GT_VECTOR_MAX,
>> +};
>> +
>>   static bool fault_inject_csc_hw_error(void)
>>   {
>>   	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
>> @@ -78,14 +100,136 @@ static void csc_hw_error_handler(struct xe_tile *tile,
>>   	xe_mmio_write32(mmio, HEC_UNCORR_ERR_STATUS(base), err_src);
>>   }
>>   
>> +static void log_hw_error(struct xe_tile *tile, const char *name,
>> +			 const enum drm_xe_ras_error_severity severity)
>> +{
>> +	const char *severity_str = error_severity[severity];
>> +	struct xe_device *xe = tile_to_xe(tile);
>> +
>> +	if (severity == DRM_XE_RAS_ERROR_FATAL)
>> +		drm_err_ratelimited(&xe->drm, "%s %s error detected\n", name, severity_str);
> 
> Adding to my earlier bikeshed[*] about 'error', it's either as part of
> severity_str or message but let's not spam it.
> 
> [*] https://lore.kernel.org/intel-xe/aTfcV5nb_vBOOBvP@black.igk.intel.com/

fixing this

> 
>> +	else
>> +		drm_warn(&xe->drm, "%s %s error detected\n", name, severity_str);
> 
> Ditto.
> 
>> +}
>> +
>> +static void
>> +log_gt_err(struct xe_tile *tile, const char *name, int i, u32 err,
> 
> Could be a single line. Also, 'i' could be unsigned.

okay

> 
>> +	   const enum drm_xe_ras_error_severity severity)
>> +{
>> +	const char *severity_str = error_severity[severity];
>> +	struct xe_device *xe = tile_to_xe(tile);
>> +
>> +	if (severity == DRM_XE_RAS_ERROR_FATAL)
>> +		drm_err_ratelimited(&xe->drm, "%s %s error detected, ERROR_STAT_GT_VECTOR%d:0x%08x\n",
> 
> Same as above.

This is actually the type of GT error so it will not print extra error.
Used here

log_gt_err(tile, "TLB", i, vector, severity);
log_gt_err(tile, "Subslice", i, vector, severity);


> 
>> +				    name, severity_str, i, err);
>> +	else
>> +		drm_warn(&xe->drm, "%s %s error detected, ERROR_STAT_GT_VECTOR%d:0x%08x\n",
> 
> Ditto.
> 
>> +			 name, severity_str, i, err);
>> +}
>> +
>> +static void gt_handle_errors(struct xe_tile *tile,
>> +			     const enum drm_xe_ras_error_severity severity, u32 error_id)
>> +{
>> +	struct xe_device *xe = tile_to_xe(tile);
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras_counter *info = ras->info[severity];
>> +	struct xe_mmio *mmio = &tile->mmio;
>> +	unsigned long err_stat = 0;
>> +	int i;
>> +
>> +	if (xe->info.platform != XE_PVC)
>> +		return;
>> +
>> +	for (i = 0; i < ERR_STAT_GT_VECTOR_MAX; i++) {
>> +		u32 vector, val;
>> +
>> +		if (severity == DRM_XE_RAS_ERROR_CORRECTABLE && i >= ERR_STAT_GT_COR_VECTOR_LEN)
> 
> This can be a temp variable which you can use as a for loop condition,
> but please use explicit length per severity so we don't come back
> questioning things.
> 

okay


>> +			break;
>> +
>> +		vector = xe_mmio_read32(mmio, ERR_STAT_GT_VECTOR_REG(severity, i));
>> +		if (!vector)
>> +			continue;
>> +
>> +		switch (i) {
>> +		case ERR_STAT_GT_VECTOR0:
>> +		case ERR_STAT_GT_VECTOR1:
>> +			u32 errbit;
>> +
>> +			val = hweight32(vector);
>> +			atomic64_add(val, &info[error_id].counter);
>> +			log_gt_err(tile, "Subslice", i, vector, severity);
>> +
>> +			if (err_stat)
>> +				break;
> 
> So we won't ever be getting past this point, is that right?

err stat will be read only once. The first time we will not hit this.


> 
>> +			err_stat = xe_mmio_read32(mmio, ERR_STAT_GT_REG(severity));
>> +			for_each_set_bit(errbit, &err_stat, GT_HW_ERROR_MAX_ERR_BITS) {
>> +				if (severity == DRM_XE_RAS_ERROR_CORRECTABLE &&
>> +				    (BIT(errbit) & PVC_COR_ERR_MASK))
>> +					atomic64_inc(&info[error_id].counter);
>> +				if (severity == DRM_XE_RAS_ERROR_FATAL &&
>> +				    (BIT(errbit) & PVC_FAT_ERR_MASK))
>> +					atomic64_inc(&info[error_id].counter);
>> +			}
>> +			if (err_stat)
>> +				xe_mmio_write32(mmio, ERR_STAT_GT_REG(severity), err_stat);
>> +			break;
>> +		case ERR_STAT_GT_VECTOR2:
>> +		case ERR_STAT_GT_VECTOR3:
>> +			val = hweight32(vector);
>> +			atomic64_add(val, &info[error_id].counter);
>> +			log_gt_err(tile, "L3 BANK", i, vector, severity);
>> +			break;
>> +		case ERR_STAT_GT_VECTOR6:
>> +			val = hweight32(vector);
>> +			atomic64_add(val, &info[error_id].counter);
>> +			log_gt_err(tile, "TLB", i, vector, severity);
>> +			break;
>> +		case ERR_STAT_GT_VECTOR7:
>> +			val = hweight32(vector);
>> +			atomic64_add(val, &info[error_id].counter);
>> +			break;
>> +		default:
>> +			log_gt_err(tile, "Undefined", i, vector, severity);
>> +		}
>> +
>> +		xe_mmio_write32(mmio, ERR_STAT_GT_VECTOR_REG(severity, i), vector);
>> +	}
>> +}
>> +
>> +static void gt_hw_error_handler(struct xe_tile *tile,
>> +				const enum drm_xe_ras_error_severity severity, u32 error_id)
> 
> This entire function can be just an explicit NONFATAL case at the top of
> gt_handle_errors().

okay

> 
>> +{
>> +	struct xe_device *xe = tile_to_xe(tile);
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras_counter *info = ras->info[severity];
>> +
>> +	switch (severity) {
>> +	case DRM_XE_RAS_ERROR_CORRECTABLE:
>> +		gt_handle_errors(tile, severity, error_id);
>> +		break;
>> +	case DRM_XE_RAS_ERROR_NONFATAL:
>> +		atomic64_inc(&info[error_id].counter);
>> +		log_hw_error(tile, "GT", severity);
>> +		break;
>> +	case DRM_XE_RAS_ERROR_FATAL:
>> +		gt_handle_errors(tile, severity, error_id);
>> +		break;
>> +	default:
>> +		drm_warn(&xe->drm, "Undefined error detected\n");
>> +	}
>> +}
>> +
>>   static void hw_error_source_handler(struct xe_tile *tile, enum drm_xe_ras_error_severity severity)
> 
> Perhaps severity can be const now?

yeah it can be const here. Will add

> 
>>   {
>>   	const char *severity_str = error_severity[severity];
>>   	struct xe_device *xe = tile_to_xe(tile);
>> -	unsigned long flags;
>> -	u32 err_src;
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras_counter *info = ras->info[severity];
>> +	unsigned long flags, err_src;
>> +	u32 err_bit;
>>   
>> -	if (xe->info.platform != XE_BATTLEMAGE)
>> +	if (!IS_DGFX(xe))
>>   		return;
>>   
>>   	spin_lock_irqsave(&xe->irq.lock, flags);
> 
> Isn't this IRQ context only? What am I missing?

This is right

> 
>> @@ -96,11 +240,39 @@ static void hw_error_source_handler(struct xe_tile *tile, enum drm_xe_ras_error_
>>   		goto unlock;
>>   	}
>>   
>> -	if (err_src & XE_CSC_ERROR)
>> +	if (err_src & XE_CSC_ERROR) {
> 
> Shouldn't this be inside the loop below?

We do not have a separate type for CSC. And once we get a CSC error, the 
driver will be wedged and only way to recover is firmware flash.

So there is no point of keeping count or checking other bits.


> 
>>   		csc_hw_error_handler(tile, severity);
>> +		goto clear_reg;
> 
> If no, should we not check for other bits before bailing?
> 
>> +	}
>>   
>> -	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(severity), err_src);
>> +	if (!info) {
>> +		drm_err_ratelimited(&xe->drm, HW_ERR "Errors undefined\n");
>> +		goto clear_reg;
>> +	}
>> +
>> +	for_each_set_bit(err_bit, &err_src, XE_RAS_REG_SIZE) {
>> +		u32 error_id = xe_hw_error_map[err_bit];
>> +		const char *name;
>> +
>> +		name = info[error_id].name;
>> +		if (!name)
>> +			goto clear_reg;
>>   
>> +		if (severity == DRM_XE_RAS_ERROR_FATAL) {
>> +			drm_err_ratelimited(&xe->drm, HW_ERR
>> +					    "TILE%d reported %s %s error, bit[%d] is set\n",
>> +					    tile->id, name, severity_str, err_bit);
>> +		} else {
>> +			drm_warn(&xe->drm, HW_ERR
>> +				 "TILE%d reported %s %s error, bit[%d] is set\n",
>> +				 tile->id, name, severity_str, err_bit);
>> +		}
>> +		if (BIT(err_bit) & XE_GT_ERROR)
> 
> Shouldn't this be compare?

This also won't give an error. But yeah removing ffs so will change this

Thanks
Riana

> 
> Raag
> 
>> +			gt_hw_error_handler(tile, severity, error_id);
>> +	}
>> +
>> +clear_reg:
>> +	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(severity), err_src);
>>   unlock:
>>   	spin_unlock_irqrestore(&xe->irq.lock, flags);
>>   }
>> -- 
>> 2.47.1
>>

