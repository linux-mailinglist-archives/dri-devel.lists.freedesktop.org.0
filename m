Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B86D7CEB0D0
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 03:25:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE68010E404;
	Wed, 31 Dec 2025 02:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G6i0Bphc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3855410E0F7;
 Wed, 31 Dec 2025 02:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767147907; x=1798683907;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GF/RT5mJLwmdxHGBsRQj8XSnvmKavgFAO7QjseVqs9o=;
 b=G6i0BphcYMUO42g22VkyhfSLCMtYe2J0NSPx+UWqEa+ts7r5SzeBljJp
 UERrUu127Ppe9I3AF/GKPTnvoIe0BF2iWxwGtnQMHQ3vH1LrYTw5D8LIj
 izVl/GxU/t/1mFjnA8I889pxlIj5lAwlJOTMwP+rJEsqwWyi9Wi3DJDnO
 0J+rLsJq+X4O++H8EMIHRE5o9vOQatmwfRitHIug+9K1vST/0T9B+ZTMZ
 OQFavEMt2SOzNdMA1zzFXPLMIqMTKiEd9j5Y7pTa5U6EhBecXXdhjn+XB
 8FHjCYej1buDYcMOsYVqZAvmOCSOZzK8JkwrfpzIhkNLYLh7H7ez+R/gy A==;
X-CSE-ConnectionGUID: RS/m4yZGR96xvq1/JnnT0g==
X-CSE-MsgGUID: Bo/xhg17SbeYU+OkEuFLLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="94193935"
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; d="scan'208";a="94193935"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 18:25:06 -0800
X-CSE-ConnectionGUID: qrfPRtdISjeNj1e77rhX9w==
X-CSE-MsgGUID: PzDO5FYsRsKVpsOm5Ir8tg==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 18:25:06 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 30 Dec 2025 18:25:05 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 30 Dec 2025 18:25:05 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 30 Dec 2025 18:25:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbeJtNDk2379IUVtdFKDyXA+vo0DUfk7oKrrvwWEEYDXrp4CfCFO2aJllLlrq8XMLEgXU/p3oeoAtdL4wBnVHj8d8ZL1eG+0qlOQDTeWxIZo8Lhjoznr4+Qj6EwzaDD+wBfe7AELER6FU7+HQE25M1FEfunN5NIsb3RPz+mGRGMQjmVy1mbG3MWTfOS9rz2EJmXpjChMCt9YB7iriwcUe0CPqqZXZiupnLFu1tGW3f0WYCLxULCItXGhzpQzWYqpUdRzU9hIAI+PCnFuFNVgdgMDVzhySFohRujuwVefciAIvLoanubmWnqDaRaT7IMf9y1+CmaZVK28fsK6DaImPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7tV+6xTD4CfiSXL++MXkYAOOkQGhFxQZ9AZ51F+qnw=;
 b=yYYyIPADXK60WlQXhEG1iwoCypfcvEgOAOvxS1U2UAngbve46XmHk25NJseCvbcC8OaNiX956w+7HznzksFZ0ujG30GUBLGF8fshuN74mU2I8vJbbHOg5xI21upqMhoHNBfvXxrkefMqbYOnRSuaSh6svk/65HxZhAFxy9ZojXSmYS9f1dRAFQ8212xBjoK/T87d4dJzHwDQ9CEDhddspNi7+LI4BKKZ7mQgPRmRHsOcbWyhrD/wskPptoyAWRnu2Jkw3vubwpmPDTvjBUGtYoMGeLviEZeMaOBzpXvNjHmUGOqivLwm9DwDcrpmvFrSye2vVgKEBwBog5P2SqRFVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4903.namprd11.prod.outlook.com (2603:10b6:510:36::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 31 Dec
 2025 02:25:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.013; Wed, 31 Dec 2025
 02:25:03 +0000
Date: Tue, 30 Dec 2025 18:25:00 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
CC: <linux-kernel@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko
 <mhocko@suse.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Thomas
 Hellstrom" <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Subject: Re: [PATCH] drm/xe: Replace use of system_wq with system_percpu_wq
Message-ID: <aVSJfKkE0SiKrPDz@lstrano-desk.jf.intel.com>
References: <20251224160026.124106-1-marco.crivellari@suse.com>
 <aUwwunqiFw3YdKUo@lstrano-desk.jf.intel.com>
 <CAAofZF7H_sPKh=oG7C=fN-mtevZjZ038DjOL0rwDVuOib9p4Dw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAofZF7H_sPKh=oG7C=fN-mtevZjZ038DjOL0rwDVuOib9p4Dw@mail.gmail.com>
X-ClientProxiedBy: MW4PR04CA0219.namprd04.prod.outlook.com
 (2603:10b6:303:87::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4903:EE_
X-MS-Office365-Filtering-Correlation-Id: 472cde22-7463-47f5-f99e-08de4813cdec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXpCdkVqUW1qbjJMTThzazlUcUdHMUtZVk1NK2RaOUNhSk04bEpyK1dTczVo?=
 =?utf-8?B?TjZVR1AwaGg2eFRjZzUwaVZkOGphUnF1OGJLSERYSkh2bU5xSCtwdFVxcEwx?=
 =?utf-8?B?QTNxcERMWWFaT1BqREt3cmtudWxNYkdzSjFtMnQ5S1RUdjh5Rlp3dExWUSta?=
 =?utf-8?B?UmU0YW5sQ24rekRRY3RBZHFhUXorQ2ZWd3hwZ2grSHFGeUN4bjhJNGk0MXVS?=
 =?utf-8?B?OEFMQkpFVGtyc2E5eWRHMithSWZJUTVwWU1XNDVZTGxBQW9iWnRlTTNBWmps?=
 =?utf-8?B?UWlZRkFYeXd1YThyQ1BrS01qd0pnN1M3anN0K2g4Yi9HQnRVckllM21OMHVL?=
 =?utf-8?B?RzVSaXFPQ3QxcFRoY1lrbkVkK3FiemVaQmtnVnpSbmRxemdHZWVpTy9hc2Nu?=
 =?utf-8?B?VVVtd1ZUVFRwUm45Q3dMcGlkeXdJUUdNMGlIS2ZWU3BhSmpDbFQ2c2dnM1kv?=
 =?utf-8?B?UUdOYjE5N0l1WDdvdkhLUGxGUm9NQ0lDdEtPS2p1TktxSmFtZng1VFhOMWlZ?=
 =?utf-8?B?K0FGeGtZN3p0RitDS3NuNFhWTDVCUnlhOHlybWEyNWkzNkFJT0JpUWVTUFRs?=
 =?utf-8?B?QUFZTlJEeUxjVzRJa2J5OFprbTg5bjVwWS8wbE11eGpNNFpnSGxsbGJQeFUx?=
 =?utf-8?B?Rk9PbkJkQ1JHZ0VKVFYrV0JhcEF6RmtCTE0xVE1QSmJEa05IWG5nSzFNdVRC?=
 =?utf-8?B?TFFBZkhIVHRwaHVEZnlIQ1FGQm1yaHlRdGJvM0VVRGhaWTFBN3hMdnBHelRp?=
 =?utf-8?B?TEE1SzA2bTJJQXB4bzcwRVloUVFiYmtLLzlpdVY3Z2NVNnRBaVRabHN1SFZH?=
 =?utf-8?B?KzhQL2NuUzlHMmpOM08wSHBWdkFvOFRETmpCUEV2c3JudklQdjY0eWM3cjRa?=
 =?utf-8?B?Z1lxZldONEp4akVGWUlrRXM1Ui9PR0swd1RkeU5Hc0RaSFh1dTF5Qll4WFZl?=
 =?utf-8?B?Q0h6L3pqT3VEWFpBYlFkSkE3Q3V1cnh4V3l5WWlFWlZPVzl0dUNPZ3l5bEp2?=
 =?utf-8?B?N3RVRjZ0bjQzYW1rNStXT0R3bUJjVDlNUmVmRkVvRmxuWWpoNGd4RVJLemNR?=
 =?utf-8?B?RjczekVNYnZhYUd3WDFGdVVncGZvWDV2L3MreTFWNmFiWE5DYkZ5VDNtVWs2?=
 =?utf-8?B?TFI0bFg3WWt2dHVidWx4TmRCQkpuVTY5b0RFS1pEUVlZWVRLMC9DNTJqQ2w3?=
 =?utf-8?B?dE9HS2x6NHVOTzJBdkRIVGV2YWxSMFovaytmY3c1SEp6MWtDZnVITWtNb0F5?=
 =?utf-8?B?M05VY1lKcUFHWVJwSmpWLzJSanh3d3J4OTBRTGNPVXNmQU5KQnZWSm84dFEy?=
 =?utf-8?B?R2ZXZnJ3bjJJaGdyTzNTQldITERWcGpINGxvajFvRXgwS25YaC9RVW9yVzg5?=
 =?utf-8?B?ZlV4VExBcElFWWJNWHJhaDZjZWJvbEV1QjNHbDRwOUdIQXpsUWNIM0I0K1NU?=
 =?utf-8?B?di8yRE1jL0JwcUhuZ2Q2Sk44b0x0bXo2RmlDeUFna2pRVWVLZUJVYVRSL2tR?=
 =?utf-8?B?OCtZdGRQVWRGY0c5R0JMd3pOWUw2ajZSZGh1enJTT1lvekxrbC9ZbHVVNmU4?=
 =?utf-8?B?UmVUNm9rZU1yUVJwcC9aTDFZV0ZRZGhPNVRPZUtRMVcyT0xtc3FlV1JUUnJJ?=
 =?utf-8?B?MTYzUjd6M0JNNkhNNDdrR2pDNHZkUzJhR3NYbkt0YzRTbEtEVjdtZVdWSmMr?=
 =?utf-8?B?WmRQZGtJdG90VU1lTkhKa1JUd1lINGxZRkY1d0tJejI1VXhBbm5uMXBHbW5T?=
 =?utf-8?B?Zm9OYStGaVhPSnk0VitpTGhBRkxRMHNKM0VPUHh0dzZuUjBGR3JlNnBPZ0tO?=
 =?utf-8?B?U1N4azU5RXlpSm95YXRJdEFpeTZzK1VjZndhZXd3U2V1L2h2UXp6c1hnU2F6?=
 =?utf-8?B?Z0NWaUFnTEp5TnlGcnAwbjJFYUhicHpLdzJTeHJVZDE0RmoyZFhFaThkbFRF?=
 =?utf-8?Q?7V4f3kBjWyRQsmJitr/dSCKdkn7tcJy1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzRQdzRMeDg3U1FtOWVwSktaVW5tNS91QUtHaWN1YnlxUG1WYUlqSnlWcUVM?=
 =?utf-8?B?Z2Z6K2cxUTY4QlBCRkVId3hLVE1MRHJMVDl1VDZCdzhVOWVwL1NyTTc4c0Ji?=
 =?utf-8?B?WlFaZzZQNFZGaW5yRjJkdk5FRjBpajJQbkJjcnJON0RqM1dyTTdOTTl4Q2Nh?=
 =?utf-8?B?RUs1U3ZpM1hXUVNBUHBtYkJ4dkxxVzVacFRYUmVOOEtPdE9ta3NCRjhNMVpv?=
 =?utf-8?B?SHJQS0dRYmU4UzlxWkpXMnFDbEZpZjU2UVBjOHpnL3FWMFF5aUlJc2h6Umta?=
 =?utf-8?B?QWZxRVlrbVBSRWZGL2hndE95Qmp0WndOSEZ4QmtSSWMzVS9kK3BhRlBSUkpw?=
 =?utf-8?B?RUFMb0V2TEhrQ2p4Wk4veXo2c2pPSHNBRGJldll0dHdwMWFOV3JLZGJ0OHVw?=
 =?utf-8?B?blNKVTNHVE5WVnF0WTJ5bDk0SzU1MDhGcEgwN0pzQzA2VjlJTkppRlNiT3NH?=
 =?utf-8?B?YStWY1J2aU9GUTFhOXRkZDU4RWhFaEc4MEhqOTUzNFB2TWFCOHI5VFl4eDV5?=
 =?utf-8?B?T0xJN2tFYmxGNUtJbVlWbk81eFBUR0J0V2ltL0FBclF6MldyVG9DZHJJZ0xp?=
 =?utf-8?B?cnd1ZjRRdHhzbjBxYm1QSFRIVmNqWjZiMUwxSFU3UEJ6OXBBMFBoR2tzdHM5?=
 =?utf-8?B?UStzdkZiVS9Pdy8xN1hPekZxQzl2VHhyZHNXQTNWM1MreXM5aHVnUWFWSDZQ?=
 =?utf-8?B?UGtTZ1dMd1NITUVaeW9ZR1hIajdhcUd5ZldxOFgvd2M2V0xLWG9vekRZSXRU?=
 =?utf-8?B?MzVwWkQ3YUZPNXpZZ1JLN1JuVHhoSHBtZmo3MXdwMVhTWmNTRTMxWHVibHVV?=
 =?utf-8?B?L1RSU2JDc1RROVhWTGpnZjBtZFdBMFZBSGk2dDgxNS9RQjVHbmEzOWV4WlhR?=
 =?utf-8?B?d1o0bUpEMTAyQmcweVpDd3BOTUdoNjdCMExlbU5IbXYzV2piRjhvdUgrL3dl?=
 =?utf-8?B?UG43djVJZERVRHVJcEVpY1lxc2lZM2dlN1E5M0tMdEovRXBsaEtER0Z3Mml6?=
 =?utf-8?B?VTVtNXgyOVVkdEFtT3NlcUg0K1F1Nk1aNnNwdHlRNEdzNThkUGE2T3hySG9N?=
 =?utf-8?B?Y3hsRjB5WXJwRDYvVDl5azdFN3ZGMG80NXZqOWJQQ0krQWI1eFg2VzkxVUtm?=
 =?utf-8?B?RUxGR25hb1ZDUlREZERzSkN3cDJ1Si9aWGI4WW9pUTk4aDVUdlR3Q1dCTnhK?=
 =?utf-8?B?NVQ0d0Z0TWRPMWNPZy9DVWRLbEpuTFpjbWMxWWNHbG50blhJREtnc0NuaU44?=
 =?utf-8?B?R2NHNHY2UXIvSTF6eFhZTjhjUWFwSXNQcS9aOWhycldReFpuZEdEcDlYMGJj?=
 =?utf-8?B?a3M2NW1sRWFZNWlhNk5hM3ZKMnFmViswVWlYQWNKdnUzMG5OWFpWaFlRc3Uy?=
 =?utf-8?B?YlhBZGRQR1gweGRoYWZZNkV6aXRvbmZSVU12V2NVOE8xdW5rdldzUEZ2RHJP?=
 =?utf-8?B?Z2NZbmNwSWtyaGNjSlBFSy9OYzhkMS9vRlB4aW9sM0NhNnRrRHFMaWdzODd1?=
 =?utf-8?B?T3p5YVdsSWJmMEFnU2J5cjFoTXR6V2tHTFRJRjQyRlh0c1BJZlJGK0VtSEVX?=
 =?utf-8?B?SmRlOGsybUt3WGtaM2V2WVpqZ1NoTXllaERFaXpqOEY0RGI2cmxVTVZkMFNi?=
 =?utf-8?B?N0ZSVjAyMHFhQzR5Z1hSYktwTjBlTmJDSWVlbkdhNjhHbHllZ25qSkRJcy9p?=
 =?utf-8?B?ZmZkKzRFVnpuaGgxZ3NtWVFpM1NmVExNVHFUZ0hudXZ4TmlwcGs0encvQ29w?=
 =?utf-8?B?SWkraUs4QTFpcUN2dGFjSEZIV3ZNUElVT2FwNWlKVHlSa3N3VndWZmhIWmNB?=
 =?utf-8?B?OElrK2ZEQzl6ZCt3emt4M1ZFL0lHM0taeFVWRkdlMWYxV3d3WUFhWTNuNXdN?=
 =?utf-8?B?K1pKZURkM2VGYVU0NmlZOEFzU1M4V2RIWGF3a1VHbSt1ME5ZaE9tOGo4YTBO?=
 =?utf-8?B?SUM2WTVSeTFWbTdXcVVzVHdEdXdIYjhjMDdVZ2I2WWltZHRIaEw2UjFVcVFK?=
 =?utf-8?B?QTZ1T2ZJYTg2eDNOdldCVllBSUVqY1BpQVd1TmQyRWFxK0FOdERSbk9yWEVy?=
 =?utf-8?B?M2x2bVVkMEw4SDVHdmNManI1NWFZK3VoVE1LdzZlTEQ0QzExckpGRGljejdt?=
 =?utf-8?B?NThwOUJUUERoNlhYU1RHbnJYR2pvMHJvRktOR3NiMEFSblpsVUcrakhJV2hw?=
 =?utf-8?B?SHRweGRHRDV5RGh4R3dkeWJ3aHhXQ3liUTh2cjNDVDNTS2FMQU1acFgvTzAz?=
 =?utf-8?B?VzNvZmhUVkhVQkNkUzJ0d1NtYUtqUHVvQ3VjTkdUenZNOXU1YlBBalR2VjUx?=
 =?utf-8?B?NVYvaFBoM2ZKUW5XWm4zZmNMMGhRd0luQ1MxVU5qdjU1YkpUZUc4QT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 472cde22-7463-47f5-f99e-08de4813cdec
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 02:25:03.1687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0Q1i/Q4ZXwmkuaL9qY9GLcBVkoyFtX2Eelbdabjsi3FfEWeXBuBSpcvKYe3lZuM0jpaaEq0hH+Qs1jbMoCiLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4903
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

On Tue, Dec 30, 2025 at 04:42:51PM +0100, Marco Crivellari wrote:
> On Wed, Dec 24, 2025 at 7:28 PM Matthew Brost <matthew.brost@intel.com> wrote:
> > [...]
> > >  drivers/gpu/drm/xe/xe_tlb_inval.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > > index 918a59e686ea..b2cf6e17fbc5 100644
> > > --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > > @@ -94,7 +94,7 @@ static void xe_tlb_inval_fence_timeout(struct work_struct *work)
> > >               xe_tlb_inval_fence_signal(fence);
> > >       }
> > >       if (!list_empty(&tlb_inval->pending_fences))
> > > -             queue_delayed_work(system_wq, &tlb_inval->fence_tdr,
> > > +             queue_delayed_work(system_percpu_wq, &tlb_inval->fence_tdr,
> >
> > Actually system_wq or system_percpu_wq doesn't work here as this is the
> > fence signaling path. We should use one Xe's ordered work queues which
> > is properly setup to be reclaim same.
> 
> Hi,
> 
> So only for this specific workqueue we should use for example this, instead:
> 
> 462     /** @ordered_wq: used to serialize compute mode resume */
> 463     struct workqueue_struct *ordered_wq;
> 
> I noticed this has been allocated using:
> 
>  490     xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
> 
> Using alloc_ordered_workqueue() makes this workqueue to be unbound.
> 
> 569 #define alloc_ordered_workqueue(fmt, flags, args...)            \
> 570     alloc_workqueue(fmt, WQ_UNBOUND | __WQ_ORDERED | (flags), 1, ##args)
> 
> So this patch should be split in 2:
> - 1 patch with Xe's ordered workqueue, changing the behavior to
> unbound "implicitly"
> - 1 patch changing system_wq with the new per-cpu wq (system_percpu_wq).
> 
> To keep this workqueue per-cpu we can use xe->unordered_wq, that makes use of
> alloc_workqueue() without specifying flags (eg. WQ_UNBOUND or the new
> WQ_PERCPU),
> making this workqueue per-cpu.
> 
> Would this sound reasonable to you?
> 

What I'd probably do here is store a WQ pointer in 'struct
xe_tlb_inval' and update all calls in xe_tlb_inval to use that work
queue.

Since these are tied to a GT currently - see xe_gt_tlb_inval_init_early,
I'd set the WQ pointer in 'struct xe_tlb_inval' to 'gt->ordered_wq'.
'gt->ordered_wq' is the per-GT WQ for resets, jobs timeouts, VF
migrations (all operations in reclaim path), so this seems to fit here
as well.

Matt

> Thanks!
> -- 
> 
> Marco Crivellari
> 
> L3 Support Engineer
