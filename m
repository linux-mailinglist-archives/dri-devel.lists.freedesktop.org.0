Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9962AA22A28
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 10:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A1E10E315;
	Thu, 30 Jan 2025 09:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hqpxYwBW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8BD310E2F6;
 Thu, 30 Jan 2025 09:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738228798; x=1769764798;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=AYSa7Dp2RRbcRF538jmZWesHQtoZEDPb2+Y3kao+CZs=;
 b=hqpxYwBWiPc8rY8sYDOy/43gn+YzIft/C7pXsmb4CQDe3rHoZIk8uNs4
 syzIrUyYftW4XbMEA8mZHCPDs3Ys23nV2h4veg0r9VrNvJyLQACwd1Vjm
 Q7h+cQuR48y4QM6nUabzU0evC78GoZZeIwK06FdzYkk7ry7JsI173QZ11
 0TaHFCXWZndswi0JIyUBfPHk9HjuQp+pGd/F+Zb+DZiKENkM0UoQf/sHg
 dB8XjWF1AlWON+8GJ2z7/nbNNpg5hquADjuxMwYKQt7BZbq5BmRHUiqdy
 6DoiYapd9uKLNwhf3S1NqMxIHokejVmkFnOOC0hLaK01E8h0EMM5L+ukE A==;
X-CSE-ConnectionGUID: LAC3C05OSUOJ4cfdCqL9pw==
X-CSE-MsgGUID: 5HMOtCKFTvq+gUyYNSgB6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38870297"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="38870297"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 01:19:58 -0800
X-CSE-ConnectionGUID: A68zN1TFSxe/Hjg7P8nvWw==
X-CSE-MsgGUID: UqExu1wsQEaW/HQZjtGjdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="114307965"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 01:19:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 01:19:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 01:19:58 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 01:19:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o08ITI7r6QyfEmJBku+ZtGU3XUoTWMONElT0O80wqxzYYj6ESI6ExwGx3MFuuqWQbpNEnA6Bg4r5kTYnv1lhAEzzo3V9atQBfSpPHjhO6mh0eNsWAvGtG7RpAMCBqDuJSXgEpeh4YXZjyLPcz7cxh9XH5ZClQMfh+A/iLvS0afqONj23TXKiExrR0rJF4uMi/QYXVmWCUCsaEhcjYWT5ZYmnxRRHv77YP/y3in53TtWWEAfbxSDp+DUv7o+Tz7zGf3EQgkFU8BZE5ljtE8vn1UkixUBNM1h4SvqswU1l2FxulxAtjNhCur7RuGeTc+6OfqcyxUqjS07L3xhXzhHnIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R40L3hqrf28IH8CEd3VNMpSnFF9nH6yUyp+OH7UoPUE=;
 b=DfjDk5Ita7aom6Q/eNICJb0gnYOf9Qo9/dmmlF+GIEzoD6uSeOLA/Y6JRlZhm0AvzWSq6SfQNfY4gW7qYD66JqIPNdf1FGM9HWTvCekux/SkUR84XyvUCwI3Bp4nwPKnxQKMzgcNp/24XBXeT23iWjFHmkkj6p8iS82qoY51HGWQZvq17LKn3z7gr6KHvrfT7G9n+lgMelKOnFbSLEDocwt5p1PahYnDDRAl7xXAuiJD03saQWTz+9rqOrqqcjzfKlbHVQRJkLkOF1rZdkaLJetPWC3BA2ryV0BVQaWaOLwFI1ChZ4lL0A7ousblLLc8RvEcWFdY5vXI/R3wJe3FkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by IA1PR11MB7342.namprd11.prod.outlook.com (2603:10b6:208:425::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 09:19:41 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 09:19:41 +0000
Date: Thu, 30 Jan 2025 09:19:31 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>, Mikolaj Wasiak
 <mikolaj.wasiak@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v3] drm/i915/selftests: avoid using uninitialized context
Message-ID: <iuaonpjc3rywmvhna6umjlvzilocn2uqsrxfxfob24e2taocbi@lkaivvfp4777>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-ClientProxiedBy: DU2PR04CA0306.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::11) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|IA1PR11MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dea4d03-f5a6-4070-db6e-08dd410f3a5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bE82NlRhbXBRWUdUUzNjSzlhTjhTTXJFNEluNnNWd0swWVd2N2ZyUWcrUnl6?=
 =?utf-8?B?bjJPdWs2b3NrSGQyZVI2d21RKzFjWkJBWWtmWUcxbllLdzE4aU1QK1gyNHhN?=
 =?utf-8?B?NStRTm9NTVRzUWFRZUFVai85WE16ZlFjUXd1K09nS2FuUXpjRzFoeHVBODF4?=
 =?utf-8?B?TS9waEVvRldCUkxndkE2SVVDK0hVL0xFekhPTExtSzZ3aWJqMEZFaXNDWWF3?=
 =?utf-8?B?SXhnbVU1UHBsOUY2dHhKcnVoak9EaGd2WnV5WmorbkIwdTZlejJFTTM4UWZt?=
 =?utf-8?B?K2ZQbDFDZFBFQ2VaQlk4dXdVUjVMTnV2YzJZQ1F2Z3VLVHMwU0Z1WnpKTEhq?=
 =?utf-8?B?YWNCajlxMjJYMU9FM1V0ZS9LZmRPTTRtYmk4ZUJ5R3BidGhZUGVrb1pQMnN6?=
 =?utf-8?B?MHA0dHVVSUtQWm03VlJEdEp1NFZ2eTYvd3E0UWh5TDkvR1NNbjZIQ2dFeUo0?=
 =?utf-8?B?QjJMSEhPNmFxV3FSYXNTZG1GYnBYcjdwbE45dzdDUUZIRkN2bk9hUngrdU54?=
 =?utf-8?B?MDhvcXZqZmxmL28xK3FUTFA5bXRhY04rU01kWVNQYll3MFVwN1ZVcHZ5VWU2?=
 =?utf-8?B?WHQ2aDNkU2poYzYyL0tsWmNFV1ZLS2xvMSswOTlMZm5pNUpCZ1MzNnlJNXV3?=
 =?utf-8?B?eFhVN2MrSVZrL2RJM0luMUZIdWQ2aE1VZDhwdHZodzVNcVhGUjBkWFhrU0xn?=
 =?utf-8?B?SlVnUDRZN2VFRU9ZdHdiNSt4QS9SUEJKMlBrZExPM1FlOXozM1lzTzN5ZVVu?=
 =?utf-8?B?UDM1Uy8vMlVUSDVJMHhuaFFqMnNlUXpCY3p4czhnblpWM1RDeWdQcC9Fbmd1?=
 =?utf-8?B?T3ljY3RkcU1BZlZ3cW1qK1JXQWkwMDROQVZDdFdXWUtHZ2RxREQxT0lqd0gz?=
 =?utf-8?B?UDdtUUd4d05mUlBYUjNWVWQvbVhwQzlxZlkyLzRkc0RRTzNyUEVxd0FBNU1z?=
 =?utf-8?B?UlZ1ZkVuRzJYTTlXUlFVMlI4MkhnRCtQQmRaOWdlMUplcDF6UmVRRjkwL0NB?=
 =?utf-8?B?Ym1wL3ZvbWVXbStWYlhMUVd6NmhwbVJITldGMHdRYUhEUWtNNUtaWWozNkoy?=
 =?utf-8?B?MklqWFhORDJMUHFSdFVQdTd0UXVOQVpGNExEUTNYZ2tLMjJ3cUwwbWlTT3Rp?=
 =?utf-8?B?WXRVd1NTcXhmMW5jbEhoY3c3dkpLVlZKU0lSZlNjR094cXJLdjNYY2RIclE0?=
 =?utf-8?B?M3h1Q2M4dWtDZFV1ZEVLUklINzMrZURPNnUxMzd6Q2VQZmhqTUk2Vm1DeEIy?=
 =?utf-8?B?UG1neklMWVNVdVY0NmtReTRhUE9sWVg4VnBFNzN2Y2VmWHRyQTJva2NQMm1G?=
 =?utf-8?B?L1VPMlI1WXlJZzZPZG95dnk2K0h1NGRKQ2hOMEJ0dm9YNFNyODFWMVhpcFBC?=
 =?utf-8?B?eTY3MDB2eUFFTGtDU29jcHVodEx2UG1kVVVNQ2h0NXdaWTVUTkNFeE1qdWNx?=
 =?utf-8?B?SlF3eWQxM0JFcUhaUlBUMnR5RnhrY0l3VmEvdWY4UktDb1NOdEpmZ2FrM1hH?=
 =?utf-8?B?ODZ3cGkvQ04wNmJNQjhYM2YwaGpQMHlmeVcwQng4bVlMSklYRmRZa1M5eGlM?=
 =?utf-8?B?bHNrMUt1ZzhFTytYVXRkaWpCUHUzaVZuYW95UCtlekl3U3ZmallORytEMG5r?=
 =?utf-8?B?MW5CckNlNmFDQjlvVkZQK0gvdUNyZnlSQUZ1ODJ2aDU4bnZOSVh3cW1aaEtT?=
 =?utf-8?B?dHo1NnRzb3BTTWkzcFJjUXBBajd5KzdJNFQzTVVCTWY0Qy85ZEhiT2ZzSTBS?=
 =?utf-8?B?UU5IR1Z3RlBrdVcvT2g2cTlhV0Z0NE55b1RreVJxNkZDc2dOTjQ0NDVqZUNh?=
 =?utf-8?B?VEQ3S2JMY0VKeXVhUm00MTA0NnB0VE1MSEtIZWsrc3h1R1pvK0NvWi9sdHRv?=
 =?utf-8?Q?hxmNho32WT3uO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDEyM3RLSVlGRXB2TXJmUlhaVHlYeWJJRGIrMDJUQnJLZ215N2ZUQndkRGxE?=
 =?utf-8?B?RE9pNTRWY2RQc1ExdGlGVnJpSWtidmpaZzVQT2s2M2lDY0cyV0lmVjdSWXBr?=
 =?utf-8?B?MWVqTzQwcHpqeXFqS1Y0b3Z6aHoraW0zMGN3K2NyS2pBVUdYbzN2eko1c0VB?=
 =?utf-8?B?Y0U5bk92Nzd4SGJiM1k2TGVyVUpja1UrSFZLYkRXUWFhRkw1cTB6Zjl1OUo1?=
 =?utf-8?B?ZVkyOFNZdDlnVS9saTVITUFZbEpzVmsyblVraTB4YUsvSFA5TFViQ1cvUll4?=
 =?utf-8?B?NVhKU2liejZnUDZOS0lOUndxNzBUSUcxd0RERzFDVUF5WHRhVW9ITjhsbEo5?=
 =?utf-8?B?bDNGMVJsTkpXUEtoT2pSYlRPRFQzU3lwY3l5a0ZhRzJkNEl0K3BlWUQ2cGYv?=
 =?utf-8?B?T3NvblVvZWhrSkNPNXd3dlJLYURYZW1aR0FCTHFPdU5NbVordXo2TFNtZmVH?=
 =?utf-8?B?RlFDbzlPeEMreTcwR3ZBTm1VS1J5YWI2Q0kxTjZqVW56WjZpc2dDTno2akY5?=
 =?utf-8?B?OHJnS2YwTmEzaWEvTjczZE1tZlFuQ0VYaHplWmJuMG5oZW1QVzVRMnBVQVRM?=
 =?utf-8?B?a1ZPcHV0Q3JJNFdYU1FxQUlCcHRDR1RpYmN0b1BwM295TUNDNVh5RkNSTVhV?=
 =?utf-8?B?ZFZqdUlHdnk0V3k3YktPN1M5ZVlFTGQvQVV3Qk9SaUtlU1BQU3pGMHkxMXhD?=
 =?utf-8?B?cWZGeExpSkJaQjVPck8rc0FKZm4rSWpLRmYzcG9xWS9XbWxKSkNhVkxKOUhV?=
 =?utf-8?B?S2g4T3BmYzFjYmFveTcyWk1MSEh4a1JuUTJsNGNiVjNOKzBla1BVQVIxV2lR?=
 =?utf-8?B?YlQ1V3RLSEJ2V3pzR3QyUkF0bDVwcjM5OGVuV1RUWEFZd0lkcjJPeEJUdUFk?=
 =?utf-8?B?dzFaakxlVnZwbVhHQnFTdTRpVlhhWkE0MXRJUGhwd3pxM3RnaTkxa0hZcHdE?=
 =?utf-8?B?TUtmaVRYbThkZkE5QVdHRnJ2blJUV3dObFFWTUZYYXJGY1pGOXMxaVBpUkpi?=
 =?utf-8?B?aGVwM3k0TlRwL2NSTzBXQVFEKzhSK1FIM3Y1Skg4K1ZjTlorVFRlUHg2M1U1?=
 =?utf-8?B?cTQ3V0RUNU5ydDRuVHQ2bXFxbnFmTTZPaFQwRTQwQ0RpWE9xSWYzS2VqR3o2?=
 =?utf-8?B?VWNOZEd2TlBhSDNDOFlldmo4TTFnSzdwSGlVUDcwWUdtUTBSZzdQTlZ5Lzk1?=
 =?utf-8?B?ZkFmWGxvVWVDQW5oSGhDMmZpZnB4L0lCOC9BZHZ6R1VjZEtKMlZPRGhoL0Vw?=
 =?utf-8?B?N0Z1Q3hVbjlBN21IVE1oazN4bXF2dHp1YWhZYzdQOUtuMHlod1NoT3kxR2FB?=
 =?utf-8?B?L2UxWVNKNTlsOFVNY1lmVVp3elRUV0VzeGhITGRlSDNSOFZXMHRxUmRvQ3JG?=
 =?utf-8?B?d3h6clZmWFR0Yml6TDhIYXRzem8ybFVxNHd4bExnanE1NTFyNzZSUVBYNFg0?=
 =?utf-8?B?bG93REZhZXphaE1xa1BSbEpNUHMvK25tUFk5KzdwVXM4cnpodVdVZ2dTWkk5?=
 =?utf-8?B?bnFGelMwQ2IveEtlL3JCdmdqVDZvODAyWEtneUZXS2lqR3FhM1hlb3hBRS9J?=
 =?utf-8?B?MEFORmlsQ1o0djRJaHVYNWhIdi9NTmtJMExWdFVxd0VGelhSTGljYXV2VzY2?=
 =?utf-8?B?RUFDUHJkcXJpWjRWSVBiSC8xdEJRU2JEdWFRc2d0Szhyd0Npb0tMaWNYZnJ5?=
 =?utf-8?B?N0NxeGxCaXpFZVE1QTdrVCtnWS9OTndKNER0RVdlWFpDbEJ5NWF2VmxiMUhL?=
 =?utf-8?B?V1dMQzRtZGtMaTFqYjcyR2pnKzl0b2RjZTl1TmdTTEZ6T2hIYkY3V01nS3FF?=
 =?utf-8?B?SVgzdC90NHlndG1FT2s4S1hqaDQzOWN2ekZsWVJTT002Z2ZyV0JuTHFDeXFq?=
 =?utf-8?B?eGlJNXdLenU2SjVjMmxUd1kvNUovWW9BazV4bkpqTGlFc1h1Wk9oL21kTy9m?=
 =?utf-8?B?QUFnYkdrRGJtWDFiaWZiQnhCUFBndTVQeXU0UVZNTWcrVklWZ1c3MVUwKzVr?=
 =?utf-8?B?ZjJOR0VZVXJrdDVweklKN0QrL0dDcUdBN1JOQ250d0hORm1aSlJVZ2tQUUVu?=
 =?utf-8?B?SU9icFQyUzMxYVd5RGdWdWRyZ1JCNHprMXYwd2tDSEprcmxOWkRxNll2YWtE?=
 =?utf-8?B?MFh2bEoyRmRDVHZEc3lMak1BT1pYOTZtdmQzLy9aWU15Z0dTNEdRSHRBem9m?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dea4d03-f5a6-4070-db6e-08dd410f3a5a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 09:19:41.6994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IMXHnLVfXyUZUZ1fabeYnfR4KQfGP0sOXc658O+SAUEXkHVYYmKUNFqlKyKmiEYnEOTUqlyQDHYdOI8dlUkl0hWt3pHlo73lnwByZwZek4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7342
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

There is an error path in igt_ppgtt_alloc(), which leads
to ww object being passed down to i915_gem_ww_ctx_fini() without
initialization. Correct that by only putting ppgtt->vm and
returning early.

Fixes: 480ae79537b2 ("drm/i915/selftests: Prepare gtt tests for obj->mm.lock removal")
Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
Reviewed-by: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
---
Changelog:
 * v1 -> v2:
        Avoid calling i915_gem_ww_ctx_fini() with zeroed context
        by returning early (Sebastian).

 * v2 -> v3:
        Use an additional label for clenup path (Mikolaj).

 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index 5816d515203a..7ab4c4e60264 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -168,7 +168,7 @@ static int igt_ppgtt_alloc(void *arg)
 		return PTR_ERR(ppgtt);
 
 	if (!ppgtt->vm.allocate_va_range)
-		goto err_ppgtt_cleanup;
+		goto ppgtt_vm_put;
 
 	/*
 	 * While we only allocate the page tables here and so we could
@@ -236,7 +236,7 @@ static int igt_ppgtt_alloc(void *arg)
 			goto retry;
 	}
 	i915_gem_ww_ctx_fini(&ww);
-
+ppgtt_vm_put:
 	i915_vm_put(&ppgtt->vm);
 	return err;
 }
-- 
2.43.0

