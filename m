Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CCACAE0A6
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 20:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A8610E3DD;
	Mon,  8 Dec 2025 19:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hUIFn1aM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0CF10E3DD;
 Mon,  8 Dec 2025 19:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765220559; x=1796756559;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=31zkZZ8nOsOyurvU74gU97D/Xucn3ZEQxyDWvS1e2m4=;
 b=hUIFn1aMZt9t5jWvqHrIGtIrbEfzZWm4s2l4D7QaPnzAaaAP/jmoY9T+
 GgQfKAgL5+FOEiE+7V/HSNO4i2wNiMy3+jnsQvXrP+wfF7HTv45kZbCh2
 8rOFc5uT6Q5uDv3mMX3kr08ualMmd6OOuY4wGCl6DXlujBkvQqBqycOxv
 iTyPtHqA7tlv9DBDD61bYuX1BCAujK2ZgtjSoE3qq/kakPjGFGoCe2U4k
 Tm8dw1agEfAML4XwgCthzGUEwUskbnZsy41SeoJRTde/Pt1tsc1zB/KA1
 OOYNX1b207i9c0S6Pdnp3SXVEr00u0AIHyTd6UI+qlS/+8jKmPzmMaZhG g==;
X-CSE-ConnectionGUID: R9kIIBRqQfm8/NLxQ0NUWQ==
X-CSE-MsgGUID: 6Ie8CymKQ0uAehmgzJqvRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="66352812"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="66352812"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 11:02:27 -0800
X-CSE-ConnectionGUID: GN/jDiggR66+kmur61bvow==
X-CSE-MsgGUID: lGQKjlSWSTGqaNzyiEEiwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="196063240"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 11:02:24 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 11:02:23 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 11:02:23 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 11:02:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5W6nqiUnBxPFU0hkkqA9mg2EOtzyn4q2bXULPcWHx2x7oa10yJXqUnQehK8K79ZQryl6yRZ7juPZ2YzWpdknUSA33nUZKJ/GUMI/MSaJfNyRc3P3S4X6tOi0MTYz0wPytL3VTx/WHPkNhSbJSeFu27GccFyDcEBmLHQuKGPDeUdGGv3+el2EFFbtUlJazxsjesZnqHDa+GIRjHSKT2iXvwTc9rE/yF5MQyG0K/ny5qEhd/h/blb3yGewxdj5S/y4B/QlLkdEJjW2XLcj3LBWnRJ18ZmPQYecu3gpn8PaOMXmSmkeifbze6Px1nn71SvjphTqycfl033Sh4nvj7PdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpUwNq+OuxbGCtJqlD+8xgQeydTb/+9qiAOi+fcD3bU=;
 b=dth2Hc/Em0+X44Yh4Xg1KIDu8yoCDYNHzODRcKZfmOqNLLoSmzj3Y6xFYSjQ6VfT+x8bZjRpVaKnAXhC5yRMlaG2az/yCneVj3fSwDBI9apnKnF1iBGkeQjzOlZ/qgAK7S6syEbvGnTrckSRPPihlXjDAK7+TkZOFLtjTx78CDC4+iBsOBl8215YNKbSTW8NpjypjLv3X6V6s4uZuBB3D7VJ8jK6BDINmdSWGNNxYKqlCVOAy81w4x9uNhQPs7AgGevYAMmewLgFYTHaZLhh3GomT5L1O44kyQAAMQPiC03ihxIxUyWaRVTMjMVho+FDaCcs/nB2d8gY1on1poQ3XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7642.namprd11.prod.outlook.com (2603:10b6:510:27d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 19:02:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 19:02:20 +0000
Date: Mon, 8 Dec 2025 11:02:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <phasta@kernel.org>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <vitaly.prosyak@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>,
 <dakr@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, "Lucas
 Stach" <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
Message-ID: <aTcguvAQCZ07xD/C@lstrano-desk.jf.intel.com>
References: <20251128182235.47912-1-vitaly.prosyak@amd.com>
 <cdecd1e2-de0d-466f-b98b-927b2f364f79@amd.com>
 <c56ecd19d7ddc1f1ed4e7e9e13388c647de855b1.camel@mailbox.org>
 <49de5988-ea47-4d36-ba25-8773b9e364e2@amd.com>
 <aTMW0UCGQuE+MXLk@lstrano-desk.jf.intel.com>
 <21699026216379f294d6597ed6febd187229ffb9.camel@mailbox.org>
 <aTcf4o0huubgUPIQ@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aTcf4o0huubgUPIQ@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0212.namprd04.prod.outlook.com
 (2603:10b6:303:87::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: ef2f201b-a769-4620-b542-08de368c507e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWZQWHhTNE0xQW1hVmZTaC93ZlJVL1BKRWlaeTFZc1RZRDh1VDBzanBrcTdy?=
 =?utf-8?B?L294NmNmcGFrSkRwcGY5R1RjVFB2Z0pWMldOenYyOFBCZW0zNkppL2dNZWFW?=
 =?utf-8?B?dFlGVU8wZnJEYUFleWRneVk2ZWVSb0dCdHpRSHJWSmdLWUhyY0twek1hNEhK?=
 =?utf-8?B?azRiWmRMaThJYzZMdVBobFdGZDFwOVRwQ2Z0Vis5dFF2QjdYQXdZNmZsKzlj?=
 =?utf-8?B?UVdlcVNqWTh1R3lFYUljRkxRUUJZb242Ujd2c2xUN3l4K0t4SzRWMnFvSGhJ?=
 =?utf-8?B?aDhMeS8vUzV2L0tNS2tCWEo1VG51bGxSMVY4WWJVVjNmS2ZBbE1nWHpZb2JM?=
 =?utf-8?B?THlWRzkzZDM3eHNUQXc2b21SR04rTTNtNWs0dUE4Q3ozWkppZW42b2JJMXF3?=
 =?utf-8?B?UXVBZDIxOVdQUUE5L05KaERKcWdOREMyUStPVGY0Q05OajRIVVN6UTdqckxo?=
 =?utf-8?B?UnBQV3VuYWNBRW4zb1dzRUFyNlNIRkV5Z2VuckZPY3Y5N3I2aUdWbE5lWFdY?=
 =?utf-8?B?bVJEWHBVRmlwa0pRcXVYeEMvdzJxNERBYWNXMCtJTVkwd0J4OTBOMXYxakRB?=
 =?utf-8?B?WnJSdHhiT2pKV2hjSktkUjErak9BTENpbWgwNmlVcjE5OGdxdFQ5SmdaUE5K?=
 =?utf-8?B?K0VjcjFhR01iL29RVHppdlFKYzFhZmN6dVJnbVRQVXNjZlhpTWJiY0ZHWHNK?=
 =?utf-8?B?NDJkNWNuVzhTTjZaUTBKZ3FuWUtqdVlERUtRUnpvWDVyMnVGamg2azh5a0l3?=
 =?utf-8?B?OXdoTExOUHV0Zi9qQXlsRzJsYnJrbmhJSnlLeXFOanRBNW9FQ25KSThZTHJN?=
 =?utf-8?B?RldVOWVOOUl1ZDdqc3NzNGV4UlhpU2VpeWhxYnU1T2hzQWpvSHZhWGh0T0JI?=
 =?utf-8?B?dEgvTm5KZ0ZNSEp4VVcycDZ4cVZqaDVOK1loY05uM3FuRmh6eGlndFFMeHlJ?=
 =?utf-8?B?eVR6c0QzYzUrZkV5Q1ZQVVBYUXh2WVdOUzQvSWEyUE9yNW9hUy9CWm80QTBO?=
 =?utf-8?B?K3ZqWWkrNmFWL1RDTWw3LzdtTys5dHVFTnVORDl3emE2UWcrQWVnMnhOeHNy?=
 =?utf-8?B?WUpXK25ESi9WY0hWZERiTzRaei9vMFBwM3JKNWZxWXhIQk16SU81V042ZWlC?=
 =?utf-8?B?czRlUXliVExQVDVYY2xING00emhFQ2FLYW0yOXVhMVBLQ2JPRS9icFJwcDNK?=
 =?utf-8?B?Q1NIWWhlOTY1TjY2SHpjNjRBMDlCZHJqMmVMVnV2QW9Vai9CUE1CSnFzM3lu?=
 =?utf-8?B?dnN3RTl0dFJSbHdwS29iS1BkeXlUNDlCWDkwbEpKQTJFa3JBRmpLNVBhWEMv?=
 =?utf-8?B?NlNBdmN3YllvekI5QnV5QmR5cHMyVTBkV0xGM0J1TStXaHRCMHRiNHhjSlJR?=
 =?utf-8?B?VHFHbkdpNTRxRGRrYjBzK1lXM3poREJacURrUXZrdVJRanJpbzl3bE85bFRn?=
 =?utf-8?B?QTI3dnpKWFh6My9YemJwZGRoODRYK3g0Rlk3TTRGUlpia0FXakhFSXpLTTFp?=
 =?utf-8?B?ZVdhSTVDQVdmTHNXb1NqdThhb0dGQko0eGRPZ0VEbjRib3puS2l6M1NMWEZt?=
 =?utf-8?B?VjlDcHlQenJIZTMzTFBEblN2Tlk5ZEVBaEJGOWVxbm81Z0lDVDd2Qk1iaHpY?=
 =?utf-8?B?RmlxeTdQbmVIbm5CbkxxTm1BVjVXUytnbHpKNm5UNXY3L3FOVXB6NlFLWlJ0?=
 =?utf-8?B?SE11RWxLSEFjYjRLKysxUnFIMlpVbHFVemZiZ0RmL3ZYVWpld1hVWEEvbmR0?=
 =?utf-8?B?cWdHR08rUlFwRWNjb2tobUNSWjZTNXVvQ2FZanowdmVPandRMnIwYnhuTTRH?=
 =?utf-8?B?SXBZVlZRdVJjSXpmTXJsTEhuTVZXaFZZZit2ZUNOdkZBWVhDeEFqK2p2UkFB?=
 =?utf-8?B?VXUrTm5YanFoa0dyd0J6cUYxcTBOYmRJOHdaZ2ZScUsyVzd5OFQveW8zQVJh?=
 =?utf-8?Q?avdFjw34KEQRZ/0I6xXzCR0sgGwHmU/d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEhXTUk1aEE0VVdzZ2ViQXp4SGthNjdGV0lWRXhRc1puZE8vNmEzQlViK3ZD?=
 =?utf-8?B?ZitSMGx2Z3JTVnpFRDRybXhsbDB6b3huNjkxV0hsZ1IzRkNhcmhkMUk4bGQ1?=
 =?utf-8?B?bVo0c0lCdDJPN2hrcnlneUlHWEsvQUpMWit1WERqL0RDQXlPQ2NZMFJTOXM4?=
 =?utf-8?B?RXFFaTJaTGdMdUNoYk1oQnZXalFhMEZrdGFBdVVFWTlFd0Z0bHJqaTNKZUw4?=
 =?utf-8?B?QmZVajJaeCs0RXpvV1pQV2Z4UEZrUnlpaEZyU1lPcW9teE5SVmVXbGlZa0sr?=
 =?utf-8?B?OVFtS1gvOXVZVFYwRTVPUmk1d3NhTW9iMzdVeDUwd29QbVlOU3NyekFNaTB4?=
 =?utf-8?B?N1AzcW0wN1YrZkNlS0JTMDZ2NHY5Zkc2eDVMSmJjOUxSUENad1NuVG03Tkxn?=
 =?utf-8?B?akdkRGIrVkNLeWVBYVZVWFl2VVpMbG9KYmk2N3RoMVVMZ0sxZC9nQjZhR0tz?=
 =?utf-8?B?VGtGSXRDM3ZtTHdtOUdxdVk3L3E5eHcwZ2pxZlhlMHFpQXE0bzFDTlhQWWFS?=
 =?utf-8?B?SjJoaENkY2lqMko2T0NkL25NUkl4TFJLK1NvckFBTzhoOUlIMnA0MEk0K2dn?=
 =?utf-8?B?bW5tWUQ3V0NDQ1phcXowR2ZZMStTdUhtU3NPOUJRRUNwaStSK3Q1YkNjYnRi?=
 =?utf-8?B?Njc0djkyN0ROVWVRUnlIMFN2OFdCMWdTaDFDK1ZGSWZwblM5RXFqb0VOWDFL?=
 =?utf-8?B?NnNRVmNwYWRRd2p0eE9uR1BjUHdGamZONjMyNHJBQTBhdWtyVHJCTmdkNXdi?=
 =?utf-8?B?amsreGJQY014SDVLLzFGUnhWWmNUKzNaNHRvSC96RGpHMDFJeXFaMDJuM3E2?=
 =?utf-8?B?UjJndldXUGpEaVZiZHhTMGtGY043aFYvR09aY21EdHF6d2NCSi9FYldrazZ3?=
 =?utf-8?B?ejJ4ZjcvM0pNdWdWd2dhQ0xqeGk5WldENDR1ZVJvVWRadG8xU2RQKzBpdGNk?=
 =?utf-8?B?MUpLL2lSdHJjN1VkVEVzTFcxRWZDLzMzNEFVd0pmYjhDSmZYY0NXYmRZM2ty?=
 =?utf-8?B?ZXNyNFNyenJqWlRxbzR2THN1UUFjaGpzaExDNkZUWFYyZTZPODhlOUVxdThP?=
 =?utf-8?B?UTZaSDc1UXFNdno2TGJkK3FneElodzlGSjVkZ1NwY0p3OU11bFRBdms1NC8v?=
 =?utf-8?B?TTJRNzZJeEw4d2pia0ZaZFZWQ05mWW5zdVdaT2l6MFRiOVpUU1hVZ2N6L3Nv?=
 =?utf-8?B?OTlTUGdRaTJwZlp0Rlc1dE1KWEdheVdFcElMdlRiNXZXTDRTcndHdXp4cCtw?=
 =?utf-8?B?ayswaUJxZExDQWs5ZjFnTVN2bDFsNEhqVnF3WE5yejJvSmhpelhzUlYwdVRK?=
 =?utf-8?B?ZjVDak1vb29KeDRhQnJQYlgxVHNsUlhZdkQ0bnA1UUN0M1pYTGx3R2hHMGU2?=
 =?utf-8?B?ZEZhMmVrYURXNm1FMS9Iall5bWJQRzllOEFrUEVZSGU2VVdhU1VzL2ZMRjNH?=
 =?utf-8?B?LzhZVEQ5Tm1FallBOC9MWkhWTkZnNFdZZUhIaVFqdUQ0ZWcrb2tmbWtveEh4?=
 =?utf-8?B?TmNYY2NUbE9GR2I2WFcyN1Q5OVZwVHpBRGlLZVE1a2ZkRk0rZGVLOHpUa2Y0?=
 =?utf-8?B?and2djFYbTg2RHp6aTIyV2R4QTYvT2FzYlFIaGQvaVhJVWl2eTVlTkhRYkYv?=
 =?utf-8?B?dEplL29JL1FHN3haUmY2K2lIc1JyR3RULzhZQjlpamgvZ3ZwTzM5S1htNFRx?=
 =?utf-8?B?VnhBaTMvc3ZiZnozdkorWGsvaU1WRyttRzhuVVVnbVFTSlZOVXN2M3ZNRnZE?=
 =?utf-8?B?K2dIOWFMSzNKSHhBdC9XKzdzNFFBQnZtVnh4cHVGajY4dFJHQUJCazB6ZW5p?=
 =?utf-8?B?Q1p6dFpwVTl2UDdha20zNEY5VEFYd05ncGt0RVhCZWhSd0psblQ3Tnc2ZWRQ?=
 =?utf-8?B?QndYRWF4KzNuYVJWR0xWL2VabUNaa01UcGRYQmMwdUhjaXpMdHBkN2J5MjNL?=
 =?utf-8?B?cXBMV0tqVFpwZ3YxWkpVQUhRcmdYZTcvQjRPSXY3MEFiS2dLV1dXLzlPNHZQ?=
 =?utf-8?B?amRCNDFta2N1N2MrWGFWelRuVlVRT2xzQWhKR1ZNeFFxeDhyWW1Iek5oaUVx?=
 =?utf-8?B?dzVtTGIyMTVKRWZKK0xZeUVkYWdsRFJIYkVMMUhWWi9ZdFZ4NDl2ZGJ3WjUz?=
 =?utf-8?B?S2hSZ2VySjFxMjR3bllWOXVuRjE2Q3Fwd3VLT1dlWFc4RUh3TG1VVGlydE95?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2f201b-a769-4620-b542-08de368c507e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 19:02:20.7968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 73ilLFbXBaezhNohTkKkYW9TmeJPMBnyBKApEDax86ScS3lOKLF+/kN5xcUGAsLsw6DeYnGCOCq+h/jM43YNsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7642
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

On Mon, Dec 08, 2025 at 10:58:42AM -0800, Matthew Brost wrote:
> On Mon, Dec 08, 2025 at 11:35:33AM +0100, Philipp Stanner wrote:
> > On Fri, 2025-12-05 at 09:30 -0800, Matthew Brost wrote:
> > > On Fri, Dec 05, 2025 at 11:18:21AM +0100, Christian König wrote:
> > > > On 12/1/25 10:04, Philipp Stanner wrote:
> > > > > 
> > 
> > […]
> > 
> > > > > It eliminates such a race *in amdgpu*. Other drivers might not have
> > > > > that problem. I think Intel/Xe is refcounting jobs? Matthew?
> > > > > 
> > > 
> > > We schedule device resets on the same work queue as the job timeout
> > > queue, as well as operations like VF migrations, since conceptually they
> > > are quite similar to device resets. In both cases, we have the
> > > capability to stop all schedulers on the device and prevent any future
> > > schedules from being created while these processes are ongoing.
> > > 
> > > Putting it all together: when either of these device-wide operations is
> > > running, we know that no job timeouts will occur and no scheduler
> > > operations (e.g., run_job, free_job, etc.) will race. I suggest that all
> > > other drivers requiring device-wide operations follow this approach, as
> > > it seems to work quite well. In other words, even if free_job is moved
> > > to the timeout work queue, I’m fairly certain you would still schedule
> > > device-wide operations on the timeout work queue and still stop all
> > > schedulers before any device operation touches scheduler or queue state.
> > 
> > Thx for the explanation.
> > 
> > As far as I'm aware, everyone concerned already follows the (by now
> > officially documented) approach of stopping drm_sched on reset.
> > 
> > We have never really documented very well when and why one should share
> > the timeout_wq, though.
> > 
> 
> I'm not sure if it's documented. When I started working on Xe, Boris had
> recently added the timedout_wq, which, from my understanding, was
> intended to schedule all reset-type events (I believe Sima suggested
> this to me).
> 
> A lot of the things I did early in Xe weren’t the best from an upstream
> community perspective. To be honest, I really didn’t know what I was
> doing and typed a lot.
> 
> > Someone who thinks he understands that really well should document that
> > in drm_sched_init_args.
> > 
> 
> I can take a pass at this. Did you documentation ever land? Building
> upon that would be good.
> 
> > > 
> > > Therefore, I don’t believe Xe actually has a problem here.
> > > 
> > > > > > > - Matches the logical model: timeout selects guilty job and recovery,
> > > > > > >   including freeing, is handled on one queue.
> > > > > > > 
> > > > > > > Cons / considerations:
> > > > > > > - For users that don’t provide timeout_wq, free_job moves from the
> > > > > > >   per-sched ordered queue to system_wq, which slightly changes
> > > 
> > > s/system_wq/system_percpu_wq
> > > 
> > > Ok, the system_percpu_wq doesn't actually for timeout_wq as that work
> > > queue is reclaim unsafe. We probably should just remove that fallback in
> > > the scheduler.
> > 
> > Which one, exactly?
> > 
> 
> System work queues don’t work for either timedout_wq or submit_wq. In
> both cases, we need the workqueue marked with WQ_RECLAIM and must ensure
> that no GFP_KERNEL allocations are performed by any work item scheduled
> on the workqueue, which is impossible to guarantee with any current
> system workqueue.
> 
> > > 
> > > > > > >   scheduling behaviour but keeps correctness.
> > > > > > 
> > > > > > We should probably avoid that and use a single ordered wq for submit, timeout, free when the driver doesn't provide one.
> > > 
> > > Ah, yes agree. I typed the same thing above before reading this.
> > 
> > Why do we even provide a submit_wq?
> > 
> > The timeout_wq I still understand somewhat, since it can help ordering
> > racing timeouts. But submit?
> > 
> 
> We could probably get rid of submit_wq, but I don’t see a significant
> upside in doing so.
> 
> > 
> > > 
> > 
> > […]
> > 
> > > > > 
> > > > > I'm not convinced that this is the right path forward.
> > > > > 
> > > > > The fundamental issue here is the gross design problem within drm/sched
> > > > > that drivers *create* jobs, but the scheduler *frees* them at an
> > > > > unpredictable point in time.
> > > > 
> > > > Yeah, can't agree more!
> > > > 
> > > 
> > > The scheduler doesn’t free jobs; it simply drops a reference count.
> > 
> > In our discussions, it is astonishing me at times with what naturalness
> > you make that statement.
> > 
> > Who has ever defined, who has ever documented that this is how the
> > scheduler is supposed to be used?
> > 
> > Let's look at the docu:
> > 
> >  /** * @free_job: Called once the job's finished fence has been signaled * and it's time to clean it up. */ void (*free_job)(struct drm_sched_job *sched_job);
> > 
> > "it's time to clean it up"
> > 
> 
> Again, this is definitely not documented. I quickly found that if you
> directly free jobs in free_job(), and the job pusher touches it after
> the push, things can explode with the right race condition. Thus, I
> reasoned that jobs need to be reference-counted. Pretty much every
> driver actually does this, with AMD being a notable exception, perhaps a
> few others.
> 
> > 
> > > free_job should be renamed, in my opinion, to reflect this. Once that
> > > misnomer is fixed, the design actually makes sense.
> > > 
> > 
> > How do you know that this is the design idea? Since when do you know?
> > Why was it never documented? It's kind of important.
> > 
> 
> See above—I reasoned this one on my own and wasn’t a great upstream
> citizen with respect to cleaning up DRM scheduler code or documenting
> it.
> 
> > >  The scheduler holds
> > > a reference to the job until its fence signals and until it is removed
> > > from internal tracking.
> > > 
> > 
> > Let's look at tho documentation for drm_sched_job:
> > 
> >  * @entity: the entity to which this job belongs.
> >  * @cb: the callback for the parent fence in s_fence.
> >  *
> >  * A job is created by the driver using drm_sched_job_init(), and
> >  * should call drm_sched_entity_push_job() once it wants the scheduler
> >  * to schedule the job.
> >  */
> > 
> > Do you see any clue anywhere at all that jobs are supposed to be
> > refcounted? Where is the scheduler's reference (refcount++) taken? That
> > could maybe even be taken race-free by drm_sched (likely in
> > drm_sched_entity_push_job()), but I strongly suspect that what you're
> > hinting at is that the driver (i.e., Xe) takes and frees the refcount
> > for drm_sched.
> > 
> 
> No, agree this should documented something like this:
> 
> A job is created by the driver using drm_sched_job_init() and should
> call drm_sched_entity_push_job() when it wants the scheduler to schedule
> the job. Once drm_sched_entity_push_job() is called, the DRM scheduler
> owns a driver-side reference to the job, which is released in the
> put_job() driver callback.
> 
> The above is akin to the fence returned from run_job() transferring a
> reference to the DRM scheduler, which it releases when the scheduler
> fence is done with the parent. So, the concept was understood—albeit one
> that wasn’t documented for a very long time.
> 
> > 
> > >  Transferring ownership via reference counting is
> > > actually quite common and well understood. The scheduler takes ownership
> > > of a ref when the job is pushed to the scheduler.
> > 
> > s/takes/should take
> > 
> > Don't get me wrong, I *think* that your design suggestion to refcount
> > jobs is probably (considering the circumstances we got ourselves into)
> > correct. I think I would support porting drm_sched to refcounting jobs.
> > 
> > But your way to formulate it as an absolute truth is plainly wrong. It
> > is not the design reality, many drivers don't just drop a refcount in
> > free_job; and it's not documented.
> > 
> 
> If it’s coming off as the absolute truth—that’s not my intent. I’m
> trying to help make sense of the DRM scheduler design so that it works
> for everyone.
> 
> > Moreover, I think if refcounting jobs were a reality free_job() could
> > just be deleted very easily, since the scheduler could drop its
> > refcount whenever it pleases, without calling back into the driver.
> > 
> 
> Right now, all the reference counting of jobs is embedded in the
> driver-side job objects. However, if we moved the reference count into
> the base DRM scheduler object, this would work. Of course, drivers would
> need an option to override the destruction function, as the final put on
> the object could have other side effects—for example in Xe, putting
> other objects and dropping the RPM reference. So, we’d need a vfunc
> somewhere, and I’m unsure if surgery across subsystems and drivers is
> worth it.
> 
> > > 
> > > > > This entire fix idea seems to circle around the concept of relying yet
> > > > > again on the scheduler's internal behavior (i.e., when it schedules the
> > > > > call to free_job()).
> > > > > 
> > > > > I think we discussed that at XDC, but how I see it if drivers have
> > > > > strange job life time requirements where a job shall outlive
> > > > > drm_sched's free_job() call, they must solve that with a proper
> > > > > synchronization mechanism.
> > > > 
> > > > Well that is not correct as far as I can see.
> > > > 
> > > > The problem here is rather that the scheduler gives the job as parameter to the timedout_job() callback, but doesn't guarantee that ->free_job() callback isn't called while timedout_job() runs.
> > > > 
> > > > This should be prevented by removing the job in question from the pending list (see drm_sched_job_timedout), but for some reason that doesn't seem to work correctly.
> > > > 
> > > 
> > > Are you sure this is happening? It doesn’t seem possible, nor have I
> > > observed it.
> > 
> > It's impossible, isn't it?
> > 
> > static void drm_sched_job_timedout(struct work_struct *work) { struct drm_gpu_scheduler *sched; struct drm_sched_job *job; enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_RESET; sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work); /* Protects against concurrent deletion in drm_sched_get_finished_job */ spin_lock(&sched->job_list_lock); job = list_first_entry_or_null(&sched->pending_list, struct drm_sched_job, list); if (job) { /* * Remove the bad job so it cannot be freed by a concurrent * &struct drm_sched_backend_ops.free_job. It will be * reinserted after the scheduler's work items have been * cancelled, at which point it's safe. */ list_del_init(&job->list); spin_unlock(&sched->job_list_lock); status = job->sched->ops->timedout_job(job);
> > 
> > 
> >    1. scheduler takes list lock
> >    2. removes job from list
> >    3. unlocks
> >    4. calls timedout_job callback
> > 
> > 
> > How can free_job_work, through drm_sched_get_finished_job(), get and
> > free the same job?
> > 
> 
> It can't.
> 
> > The pending_list is probably the one place where we actually lock
> > consistently and sanely.
> > 
> > I think this needs to be debugged more intensively, Christian.
> > 
> > 
> > > 
> > > What actually looks like a problem is that in drm_sched_job_timedout,
> > > free_job can be called. Look at [2]—if you’re using free_guilty (Xe
> > > isn’t, but [2] was Xe trying to do the same thing), this is actually
> > > unsafe. The free_guilty code should likely be removed as that definitely
> > > can explode under the right conditions.
> > 
> > I'm right now not even sure why free_guilty exists, but I don't see how
> 
> I'm sure why free_guilty exists either. If the fence is signaled in
> timedout job free_job will get scheduled on another work_item.
> 
> > it's illegal for drm_sched to call free_job in drm_sched_job_timedout?
> > 
> > free_job can be called at any point in time, drivers must expect that.
> > No lock is being held, and timedout_job already ran. So what's the
> > problem?
> > 
> > For drivers with additional refcounting it would be even less of a
> > problem.
> > 
> 
> No, the scheduler can still reference the job.
> 
> 1265         fence = sched->ops->run_job(sched_job);
> 1266         complete_all(&entity->entity_idle);
> 1267         drm_sched_fence_scheduled(s_fence, fence);
> 1268
> 1269         if (!IS_ERR_OR_NULL(fence)) {
> 1270                 r = dma_fence_add_callback(fence, &sched_job->cb,
> 1271                                            drm_sched_job_done_cb);
> 1272                 if (r == -ENOENT)
> 1273                         drm_sched_job_done(sched_job, fence->error);
> 1274                 else if (r)
> 1275                         DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> 1276
> 1277                 dma_fence_put(fence);
> 1278         } else {
> 1279                 drm_sched_job_done(sched_job, IS_ERR(fence) ?
> 1280                                    PTR_ERR(fence) : 0);
> 1281         }
> 1282
> 1283         wake_up(&sched->job_scheduled);
> 1284         drm_sched_run_job_queue(sched);
> 
> At line 1269, the run_job work item is interrupted. Timed-out jobs run,
> call free_job, which performs the final put. Then the run_job work item
> resumes—and boom, UAF. Using the same reasoning, I think moving free_job
> to the timed-out work queue could also cause issues.
> 
> If run_job work item took a reference to the job before adding it to the
> pending list and dropped it after it was done touching it in this
> function, then yes, that would be safe. This is an argument for moving
> reference counting into the base DRM scheduler class, it would make

typo: s/DRM scheduler class/DRM job class

Matt

> ownership clear rather than relying on ordered work queues to keep
> everything safe.
> 
> > > 
> > > [2] git format-patch -1 ea2f6a77d0c40
> > > 
> > > > > The first question would be: what does amdgpu need the job for after
> > > > > free_job() ran? What do you even need a job for still after there was a
> > > > > timeout?
> > > > 
> > > > No, we just need the job structure alive as long as the timedout_job() callback is running.
> > > > 
> > > 
> > > Yes, I agree.
> > 
> > As far as I can see that's how it's already implemented? No one can
> > free that job while timedout_job() is running in
> > drm_sched_job_timedout().
> >
> 
> See above, free guility is still problematic.
>  
> > > 
> > > > > And if you really still need its contents, can't you memcpy() the job
> > > > > or something?
> > > > > 
> > > > > Assuming that it really needs it and that that cannot easily be solved,
> > > > > I suppose the obvious answer for differing memory life times is
> > > > > refcounting. So amdgpu could just let drm_sched drop its reference in
> > > > > free_job(), and from then onward it's amdgpu's problem.
> > > > > 
> > > > > I hope Matthew can educate us on how Xe does it.
> > > > 
> > > > We discussed this on XDC and it was Matthew who brought up that this can be solved by running timeout and free worker on the same single threaded wq.
> > > > 
> > > 
> > > No, see my explainations above. This is not my suggestion.
> > > 
> > > > > 
> > > > > AFAIK Nouveau doesn't have that problem, because on timeout we just
> > > > > terminate the channel.
> > > > > 
> > > > > Would also be interesting to hear whether other driver folks have the
> > > > > problem of free_job() being racy.
> > > > 
> > > > I think that this is still a general problem with the drm scheduler and not driver specific at all.
> > > > 
> > > 
> > > Maybe the free_guilty is likely a scheduler problem but I'm not seeing
> > > an issue aside from that.
> > 
> > I also can't see the bug. I fail to see how drm_sched can free a job
> > that's currently in use in timedout_job(). If that can happen,
> > Christian, Vitaly, please point us to where and how. Only then can we
> > decide on how to fix it properly.
> > 
> 
> Again see above.
> 
> Matt
> 
> > 
> > P.
> > 
> > 
