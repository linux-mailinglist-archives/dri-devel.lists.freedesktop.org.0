Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98867C3641D
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:13:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50C110E79D;
	Wed,  5 Nov 2025 15:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MAFdNoo8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54ED810E781;
 Wed,  5 Nov 2025 15:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762355577; x=1793891577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=gqMYhBmv+klQZPK/wABMsi9x1ALBGd7jPOg2Of2AQG8=;
 b=MAFdNoo8MdZ5zcBNvXbEGTyPsbPMy8CoOhpD2uoRpo9uEng3Na8f9xAp
 r3iqwMziGOOxXxToMIl57YD4eO31KPZT3RTxdUI9GgIlIFKHQLq8zCVAF
 swKmtUjlapRSp9AReUE/4cZpgggIP1Kfg2qy1MlXBKzwPnK0qDTCLCYhL
 k+VWTOmPXDokQa5h4477QHA9QQMW7ocdkV9UP0TLPxqWZsLO+3XvDk8kU
 ljHzzLmzQTK56tb0rRiy/Z4yZtp2osSVQhsY9t3E1sjhKT82cVE26YhDk
 H+mDtdlIIvvphb7fTzbq14h/WjAAH0xKAo46zkd1kE8yOSn/pVNKnKmkH Q==;
X-CSE-ConnectionGUID: dd0EwlbFRQGsaA6QmNSYSQ==
X-CSE-MsgGUID: enNHTkJ6RUuHsW9s33XakA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64506428"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="64506428"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:12:57 -0800
X-CSE-ConnectionGUID: QeRAuEUPTbWUfeI1U+aP5g==
X-CSE-MsgGUID: oQD/+QfySlG6bsv5Ehw4Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="224725885"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:12:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:12:56 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:12:56 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:12:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xs/RM0qinIw7br0AetDWdqVj0ORYAS56vDXzk0Wp6wSxE+g91ojCoY0B3QtceiMfxueuCSclNhRp0IeN58ST6z0NG8CE1MDeshWzpypZALYuuLVIuXuIezYVAj5yJUJRzc12jQUEu3ul3QjkJkuVzRAoHlZ6cCHaq2/9lt7xxe0hdr2FLuszziJu9xP+UH7Obyc6OIIhqxQc/nJF6rBK+XGP5soNv2rros0VpJp35TdG0KmVMwcE9RZPepyJUyguYZzZNZY+Rhml/jN77CxRoXddmAsRTXWI8VDjNU1i/AyXuewUS5H/93LjOzLYY461D/RXKcP3e/IF0VgLcmd8Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imPo2XSatQDeUxNeCGD+wUPJK8UqJOt8AICUEa7wLxI=;
 b=VwJD9FHh3ahwMDnFaAX8O+PBUNGtTFJONXWwO6KeIf8s2hT0+/jjicu0zOvwalbqURzCww8nZa6d9qXjipQzgK++/1Vl8gjzQ8JIIu1mhS+4QdbKTT+fJHnq7rctNcc2PKJgKvXfniXwrwnmP7PQX4Vinl4f3Ay84LIz/agUcvrWI5FVxY00K3wnK84Ym4yZdWdeJlAiOj9flWDeEGs0STjqxYPiHapRdxeBzL2K2AGVrb8vTf2WTTpUl9Ggddac6QxhPTjYtzzp1YbLexz80LHtFRxyuLvISSHcRekTNSAaWvHFzT4J6r0KzREqMaZRxrH/t3lBvky8p7hKjKTbvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.9; Wed, 5 Nov 2025 15:12:52 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:12:52 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v4 24/28] drm/xe/pf: Enable SR-IOV VF migration
Date: Wed, 5 Nov 2025 16:10:22 +0100
Message-ID: <20251105151027.540712-25-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105151027.540712-1-michal.winiarski@intel.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0495.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7e::16) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: e003879d-db1e-420b-c356-08de1c7dca19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHJtM3BVOGhrczA4c2F5Rm5sZFZBUFJiNXZGRjE2YTh3VW9yeUpUVDJxOWpC?=
 =?utf-8?B?ZTRQek5abkxvUnQ2ZUVKd1B3U3FySTU1UDhEVkw0bE1IOUNjWkpRblpqMXUz?=
 =?utf-8?B?cjZQMnBaYVJXOTE0UFRNNTV4RE1RWjdtMTVtRVVRUTRWZVJ1T3VtMzVtTWFQ?=
 =?utf-8?B?RFVpTG9PbFdmWlNaWERXamRuL3gvc1I2ZlJwMVJmVnFXNWxZaHkwN05OeUE4?=
 =?utf-8?B?bTFvUzhFbktSVUhPT2xYT3VUblVwNGU2YnZVQkNhTDg2Zy9Nd0VvNEhOcHBB?=
 =?utf-8?B?UXBkL0h6VlVyT2VSSzdBbkY5UXVoaW1ObnBLdzhPS0pTdjJSeXJ3ZUVnc2Z4?=
 =?utf-8?B?QVU5ME4vczlqWjhVclBxbExOWlQzTjJSZUUwMVA5WFhkdEJ6ZExoVGU3MzZN?=
 =?utf-8?B?YXVvK0ZWanM2aE0zemhjNFhZL3NNd2wvNElsWlY5ci9IS1lVYTMxZGI3V1pF?=
 =?utf-8?B?emlVZTRtTUhnb0M1WnM3V1djbk5Cb25HeVYzY3Vxc3B2N29kWUw4ZnR5Zm9V?=
 =?utf-8?B?d0owT2VaSmVPNmJOamQxTTJ4S2hNM0xyK3JUME5lWTU5THp4ZkJJNVQwNm9Z?=
 =?utf-8?B?VGk0OG1VUkhnRWpSNHZ2ZitIdlZnenNkQ2dreW1TSEpxeWV4eHJFRCtnTkZq?=
 =?utf-8?B?NGRSMDE0VnZBOVFTWkJpWVdFbUg4Ni9CK2RnZ2dFbTBpb2daNWF1YzFHZkgr?=
 =?utf-8?B?YWZLRnIwYURCZzM2eWQzVjI5YmFzSHZIc0J1WU1BQk9IcGlTY2dYRmxmbFB1?=
 =?utf-8?B?eWE3aHg1d0srVkM5eG9udVkrZ3RHdXFPTFIxclJYQ3pKZHhIeit3aisrenFa?=
 =?utf-8?B?eG12b1k1V05kQXVmcnhjenZxOFA0eERWU284Z0xDcjBkM2VmMTYzZWlySU9H?=
 =?utf-8?B?YW1RUlpMT2ttY1NzMVV1V0R2Z1Z6L3ZPbFk3Y2xaajRpRTNCRWIxRmJ2TTJK?=
 =?utf-8?B?VW14cEFTZ1VXSTJGeC9nd080WDhLMXRwZUhjcDJYdEEwR1U3VnlVWWVoNnVt?=
 =?utf-8?B?R2R2Yk5ld0xNYnJzalBCaEU2dlRpb2lwTVY5RzlFMEdISW5KeWVhQkFCdy84?=
 =?utf-8?B?N3lITHFhbjZMdG44WTJlNXErSHRoUDlwWGN0WldvdUl6Smk5TnFUYjBOUzl2?=
 =?utf-8?B?bUVvV20reDMrUVhmajdtcm90eWRUd1ZFRWQ2LytrODh5MzNVZW9KZFdXT0lH?=
 =?utf-8?B?cjE5UVhyckZ6NWxTTHMwUFRjNjg0NjdZN1g2Z3dNY0FmdWhIS2t3aVRPQjlB?=
 =?utf-8?B?V1I5ODFxMUxzZENJdFE2ZUVVM3pWVlhWZjVWUm1QQlZPVFRtZzIwVXBNY1Ja?=
 =?utf-8?B?eGJ1S3ZxSHpML2FmUjNmcWZsT1o5WXRpN2Z2VWUrU0xqKytaRXhsVWh3OXUr?=
 =?utf-8?B?dXUrU1EvSGxZdmtRN0liWEFNZE1BOEUyQXM5NFpWbHpZL1RjN1JsNFMybFdh?=
 =?utf-8?B?SGI1UjVyUHl0RkhZRmU4SWFRN0tuN25wdkhHTjFGVk5OdUZDSGMyQVVDdGtW?=
 =?utf-8?B?S1dMb2VrcWtJM2s0Y2V5WVhLN2oySWpFS01OOG8za1Jnc2o4Z2R0OGx1Z1h1?=
 =?utf-8?B?ckZ3RGFLVC81eC96MmlOU2d6UUppY0VHRFZJVlEzOHJENVBsSzZvSks5aHVy?=
 =?utf-8?B?MUJHRG1pRmlrZWo3WjQwYmRVK0drSnBDSWF0TytqWUQxYjIvaTNlakZjVjNZ?=
 =?utf-8?B?Mmx5ZEFIVVY2VmFLNG1oMkYraTJpUVk0Y2lGUjVLTk94ZmZZU09QdGI4QU5M?=
 =?utf-8?B?eVZkeEhnWmVmZldZTVhveWRxZXVKdGdLN2piT2NqSStyWEZtOUxvTWhkOHB6?=
 =?utf-8?B?TXVCT3NBdHBxa0QxYzVyWmxoUmp0OVRXRWNtdFhvT1ZDd3lndjJoL2lsaXl0?=
 =?utf-8?B?bjZHOFY4R294Rytsbzk2bnJEemw4VU1sWU9RdXp1MXl0Vk5FK0ljU1ZHcXNO?=
 =?utf-8?B?czEzSXVYRjRYRk8rVW9TcCtWOWFOVUlXcTF3c29GUzlJQjJhWGtnUGJ6dEZD?=
 =?utf-8?Q?Nsn5UjFCyK+K9R1R991WK2Krog35qY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NSswRGlTTm1SMmJQdlJWK2FXSEtFdDZmb0w2SnNUMGdYUlY2TiszQWdPQ1ZK?=
 =?utf-8?B?RnRpMm0raVRqS0RManBrMzdYeFVzTGZoc296SUFMa0ZTYlZkdHhPdmY2bFJE?=
 =?utf-8?B?ZTVlOVZxVXNUV3Q2VC92V1h0TTJyUTdLSG1vU2FKdFo2ZGYxSE9YeUFTRVp6?=
 =?utf-8?B?bS92dE45THVNSzZDb0RYR2gxNTdIT2VpRGxGRzl1aU9GWDRtQXJoU1BqZFBS?=
 =?utf-8?B?V3UwNDEvdk1nZU1tMnNPTmdndURTa3JHdTAwTUM4UjRSdWRsRTNqNVJtWFNG?=
 =?utf-8?B?WTlEMnp1ZTd6bFNacHQ1b2J1U0MwZXJUMWRleXRFdHRxRnQvcEc2U0JwNmtF?=
 =?utf-8?B?TkhDUlZncG9YcysxRkZCTlI4YjB0TktuSGthOTlGdmpKTlFpMnFYZ2N1aFpI?=
 =?utf-8?B?T0NXSjJWSmMvQVk4VTdMMmZyRzN1VTRTanZ1WXl1Y1g3VFBXVmpLaVdPbmdY?=
 =?utf-8?B?M0VJOVhEMS9RRnJLYWVzV0poVnFtZkxORStUS2ZiSzNEQnB6ZFBxOHNzMTg3?=
 =?utf-8?B?enIyRHdLNUJndE95bXFtanRQZFhUamtVTUJZcnNzRlNrMHh3U2xPVGFQbnhD?=
 =?utf-8?B?Wk9Da3VJVzFJeG96VHppSmVWR3ZQbDhod2J5WXJUYzk1NzNKRytRcXFHTmQx?=
 =?utf-8?B?Q1VLbVFFNWJRandKbU85Tk9seWphNW5XblR2a1VWM2x5UjhTcjNhd3hKMUZM?=
 =?utf-8?B?WWVhMUhNbk1ORldCU012bUJQWUxZN1ppbmp3eW0yLzVZRTgzR3gxNlhRTGk1?=
 =?utf-8?B?NjBMcjJmdmtxbFBmaG05V1JodHlEeWRYa3FhR1R6WUxWZ0pYcE0rZCtoNXZM?=
 =?utf-8?B?Si95NHR4d3BKUDhOZk9XK1Y3M0ZCY011bXQ0VTZuSXdaZGhSQU5GUTQxNmJM?=
 =?utf-8?B?T1JVSkFMQytsVzZCOEJTRlFjZTNBN1pCWEJoQkNyTGt0SHRTbnc5YitKRUk0?=
 =?utf-8?B?bmJnTmNMYWZDT215WDJMb3pNKzcwT3ZxcXFGbkFlNDJvdW1XOFZOLy9sbUVs?=
 =?utf-8?B?Mm5haGFTT1dJMXFaV3BXeGxuVTZKLzJaWGVpOXlhZlVoREhvaVZTRTFibGJD?=
 =?utf-8?B?MG0vUVdsY0tMWGdpbUw1VXRabW1sOUM0dTdYeWtLUDdFaHY4a2VoMzF0YnJI?=
 =?utf-8?B?YTl0ZDVjSVQvRlZmdVBXU1A5Zzc0ZHM2STVybzB1RFZ6amtEeE45NWF0UjVm?=
 =?utf-8?B?SE0zN2JHdC85N0Z1ejR0T1cwMzJiemI2Wmt4Zng2WjRrMk0wN2J6dk1GU3M3?=
 =?utf-8?B?Wk5MNEI1WVJSNG1JZGUxZXdIS3ZMamlUWVlxQ1dkd0lkRktoejl2Q0o4Vk81?=
 =?utf-8?B?cjRQaTNhbEluNnp1ekFCT0loNVFhNlJ5aHdXeUp6eWhmajZDN01YSFNndUR2?=
 =?utf-8?B?T05uWFdzRG05ZmIvY3p5MENMNld5bWZrcTdnRnJHbkhjVC90SFEvZ3dBVXFo?=
 =?utf-8?B?bEVDdWV1blJ4eVZjN1RMdDJFMUpUamFLUGhhWDNzSUpxT1FYa2FSVnBlZlhP?=
 =?utf-8?B?UWFnYXlQc0NtWjEwOUR1dnFzY2NiNSs5NmJlbTUyem84ODkxV2FmcVpWQkRS?=
 =?utf-8?B?V2RScEZ4U2JBOWlCVGJhTy96V1NuQy9sVStoZEJlTDZNWEpQWlhpNXoyWUNI?=
 =?utf-8?B?bDY1YWtDSk1Pem5ieGVRYnlTejBuOXR1RXBPeFgvb3NYOWRMSmRnT2dBTVU5?=
 =?utf-8?B?R2Uwb1dzZEtRTlpJTlRsY05mdUtNR1crWE04bDhqRjBHOGd3TElUSk5pbkJs?=
 =?utf-8?B?ak5qNy9OVTY0aXdRMUd5bTR5bW1CN1p4bEkvbHQwOWM1YXp3R3phYUFQaHF3?=
 =?utf-8?B?czVHb01vNDFNTFZDcWpkbE90QzRiMnRYNUdnRU5rcUx4OGV6V2pHazhjS1or?=
 =?utf-8?B?dlNUWE9LaHlpa1gwMld4Mmk4b2g1bFZiQ3ZqK2NBN0t1SkNwai8vUkNQNzIy?=
 =?utf-8?B?czU4MkUzS3huQytsWjdpWko2M1p3OEJYbjJZcnhhUU5wQndzTkhrd2pHcERk?=
 =?utf-8?B?UDJzdE9ZNHBJVW9mcEx0amd2REtyTUl6SE1jeHVJUXBoamVhcTBQNmMybUp3?=
 =?utf-8?B?Sy9CQ0dwYVduOW4wOFVZQUdKVVJLS2orWGhvamJpd0ErVGtIL2t0QVNhRTJE?=
 =?utf-8?B?REYvVFVZOHFjWWQ3aVNOOW1aTUdYVTdobVFpVUQxVVQ0Q3dRYVBkNG15UmVj?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e003879d-db1e-420b-c356-08de1c7dca19
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:12:52.2101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHXDTcX8bcb3O/owga4vVbdTtXZn2lopulqBRU5aEIxAIUfX1TKBcmYtkYxN2KtfmjacjaqMDOkdODu/+g7NmKQbK6OWKLNKPZ6M5WQYjTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
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

All of the necessary building blocks are now in place to support SR-IOV
VF migration.
Enable the feature without the need to pass feature enabling debug flags
for those platforms and rely on .has_memirq presence instead (like with
VF resource fixup).

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index 30bda27b0b2ab..cba7d4b8cf633 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -50,8 +50,10 @@ bool xe_sriov_pf_migration_supported(struct xe_device *xe)
 
 static bool pf_check_migration_support(struct xe_device *xe)
 {
-	/* XXX: for now this is for feature enabling only */
-	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
+	if (xe_device_has_memirq(xe))
+		return true;
+
+	return false;
 }
 
 static void pf_migration_cleanup(void *arg)
-- 
2.51.2

