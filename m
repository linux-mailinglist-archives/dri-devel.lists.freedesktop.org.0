Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D89489D5862
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 03:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B356810EAAF;
	Fri, 22 Nov 2024 02:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K/UFrGJi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA31910EAAC;
 Fri, 22 Nov 2024 02:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732242890; x=1763778890;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8GyF1vzc6AOriQiLf23CyqUqxSOMdha34tVB4Bo/9kw=;
 b=K/UFrGJih6FTt9MGKy25KQHvdy151zAYSGiF+TAKbapKaNbsAzvupkT9
 uL37iLTNu+6s08/t5CVcNbGtvojUT/rIn6DsKub1NWrS5PCbBpx87kp8y
 SzsOm2/p0VThquzW3ZFzAAluukaTYpEzvrtjLWp4K8s8qiPOuVvgCy3Rr
 MSwQuCCgeZFymm1dYsxLxHUAgdYB3X79E7VMBu11H1ctgxpHDsRuDWEQO
 usrYd00xGAt1i6VQdthgXL2ORU6lg/hNLwbuAjY1QmmVVVALOU3uA7kEe
 ixpbAoXK24vn7eAoP3DOWhlynDeVxs0OggcEscFGuhOeYwrkWGqCnzv6v g==;
X-CSE-ConnectionGUID: qkG4ftxCTAKJDz48HdUQwg==
X-CSE-MsgGUID: TsKQpBLNRVeFlury8AlrQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="42900268"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="42900268"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 18:34:50 -0800
X-CSE-ConnectionGUID: qtfWKjIbTo2NCKEIc3r2wQ==
X-CSE-MsgGUID: LTYGBBGFS6y6zFFzIkSymQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="90239992"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 18:34:49 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 18:34:48 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 18:34:48 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 18:34:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqky4XzYbHvDbaYtgXGaseFVZzK+fZkhe5Z6WVmVSGT2NB85Qz85Sr3qiW4MFn+uskGvX3FDGLenb3QlQgbSbpDq3jlNQUcHo1fhV/j5/OBHq9BAP8fcSTE7Ou8b2nhl+z0Vbw6tt43LzF8LQKKjrlcDUHiOTO6uZigd9LWwDbLLfSiT9afNhlJng5Z3tkf8TA84jPbb1vK9azI3pZaKgkS3vBFgxCnnXgn5XieKXJdqRfLDmW2GijlLAGOFxLOEBs9QQubKkWvrxfatEjEL0kc6lFcHc/Yt/zSxiNJC+NPnOLUUrbtni5dr8V1JWSrEyY8j4WMUUtyoBnYTcEtbtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFcpqiriXnAfartNGDyS6QbnvQ9OGGAw9xbqltibOMQ=;
 b=djj4Csw4ieB2nxBHC4hp7OqVBjNym2qNh+vYXVGDFbRMgG68cT+7XKkVgNqVqn8+yTzwxyLYJ3SRJHDsZ/Vd5r7WPhYe5YmBIGp9j7TvYU6lZgVSSvjdngbXxGnW/oiN9YmNLtiS6PjtY2VCUIgchxPww1coPJKUogcJLHiVz07zH4/2D0zNOgVcb1fyY7hQ8FbZPv3oAiR+gpscvStnDpq37xVgLBp+6ImhG3XBGTDUPJIhBe4593X6UUhGjcQ2DKxRzsR7iUoEwj3PoXUZl4gtCfy+UxxzBNGYKMSe0xEwGAnr1m280yKpm3JrVSjBAjAAkzGc2QxNGK0sziGKRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PR11MB8684.namprd11.prod.outlook.com (2603:10b6:0:4a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Fri, 22 Nov
 2024 02:34:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 02:34:42 +0000
Date: Thu, 21 Nov 2024 18:35:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <kenneth.w.graunke@intel.com>, <lionel.g.landwerlin@intel.com>,
 <jose.souza@intel.com>, <simona.vetter@ffwll.ch>,
 <thomas.hellstrom@linux.intel.com>, <boris.brezillon@collabora.com>,
 <airlied@gmail.com>, <mihail.atanassov@arm.com>, <steven.price@arm.com>,
 <shashank.sharma@amd.com>
Subject: Re: [RFC PATCH 02/29] dma-fence: Add dma_fence_user_fence
Message-ID: <Zz/t5pp9rCg9b7lw@lstrano-desk.jf.intel.com>
References: <20241118233757.2374041-1-matthew.brost@intel.com>
 <20241118233757.2374041-3-matthew.brost@intel.com>
 <f802caa1-85a7-4a5f-ae92-9b1c0f4c500e@amd.com>
 <Zz5nrl3H2wAagwgE@lstrano-desk.jf.intel.com>
 <01678a48-828a-400f-b989-51c497845340@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01678a48-828a-400f-b989-51c497845340@amd.com>
X-ClientProxiedBy: MW4PR03CA0082.namprd03.prod.outlook.com
 (2603:10b6:303:b6::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PR11MB8684:EE_
X-MS-Office365-Filtering-Correlation-Id: e74ef4b2-cbf7-4a3c-1123-08dd0a9e3879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Um9jR2I5OXFxWmEraDkwYWpZWDNIY2xQdk9YWWptdElVdW02blhZYkJaS1du?=
 =?utf-8?B?ZHh5L05ITTNiM1pvaXV4RGFQZWtoYmR0anVEcWdCYjllck5jcVZ2Q3M4SEtn?=
 =?utf-8?B?OGpUV3J1KzFEMWQ2cjBibmR0dThlMFhrM3ZRUTZZL1Mxbmg0SlNyTTRxMjIv?=
 =?utf-8?B?aEZUVzNma2xEcmd1RHhaNVNDZ1dpVDVORGpPVDVLV0hmaEhUUlFuRTVWeXMw?=
 =?utf-8?B?UnBZY0RIOWlWY0tvc2ZiWmJ0RGRsVHlsQ3U3bWFlMG94WVo2Z2NtU0RLcVNK?=
 =?utf-8?B?aUFMNDEvSFZrVkUvdkREU2JYd1h4NWpEWEx2ZDVyaGdKTTJrT2dYSHJkRTZp?=
 =?utf-8?B?ajFFWXFMQ2hzazBEWDNqQi9EMDJudDN5SnlnYXVISjVpN3R1OThjZVJ5OGs0?=
 =?utf-8?B?WlpMRmVma0pqNFAvNjk0YUhhSlY0cGJEaHFZYk9TbVUxUDB5UExZNjNiRTJz?=
 =?utf-8?B?Q2RnL2VLcVdKaEFBUnJ0WXhBeFYyZWYraWcraktaS1BCQ3BLd0dUdUM3L3p0?=
 =?utf-8?B?T1ZWcnFBVGdZWDFYcWJhbHBqVjRVaFhIYndNM1REZHVFV2x3ZTFWaWxONHNH?=
 =?utf-8?B?eUpjZVcxWmgydnFKaDM4L0Nad1JubzlQWndteXlpN2VrYkJhZnhaNURqRWFx?=
 =?utf-8?B?dVE2NFk4MUFScDB0ejNzKy91dmpaWENCMXNJL0FQQ1U3TFR0ZHR1UXBiYWVM?=
 =?utf-8?B?QjN1NEg2RnlXdFB5SXZrOC83WkdONFJXMXFnaVR5V1paUlZSWVZlb2JiZlQz?=
 =?utf-8?B?eFRpKzI2eDZLWndyT2ExTkt6d3piMGdISzAzenN3ZWZpWlh5TnVUM3lzaTlZ?=
 =?utf-8?B?ai84R1MzZlg3eGVCSDhXR21VVG84VENyTUd1MG50dzFqaDU5YzR1M1YzQ28r?=
 =?utf-8?B?NHZkYkhVaHVpajRISFROTUdtYUpvbUQ0YnNyMVhFQWV2Q0VJbnVQMmFhSzc4?=
 =?utf-8?B?T1NDRXk3QkhUWUtIeE5oNlpxcHQ4VFZqYWRORzZ6ZExMYnhMMnJFYWdyODRE?=
 =?utf-8?B?dVk5dXhFS2FDVyt3ZHRXNWR6SHlVSFhsN3ZJOUZFT2tFK2JqR2s0VCs1N1NR?=
 =?utf-8?B?VUttelovVzkyelI4R1pjK3RkYytBZlI4a2dEcStGSUJIWldCbW0ra201ZEJO?=
 =?utf-8?B?a2VMN0RwRkdLMUZPUkZoVjh4YTJOSHdtUkxRS1MxTnRQYVVOeSswL2kxZkFr?=
 =?utf-8?B?cjFHdkxDU2VpSjdIV2tMRmdJYmJWV21xVjl1K1haQXUwOGtwWWE1aWdqNWZR?=
 =?utf-8?B?SjVDUmJnUXVWSUwwclJKRkY5VzNTN1NQLzZ4V3J5RWdMT2JoNm5QeHByUFd0?=
 =?utf-8?B?RkVtUVNGUUhVWUpaTHNUNXJBSzJmUkdUTzJNVzc1Wks3bkhrYjdLRmgxY3JB?=
 =?utf-8?B?NWR6aVNnZXUrQ2FDSm9XTHViUHZ4UHBQY1RtK24zQkJISjhOMml5MlZNQlMr?=
 =?utf-8?B?dWpmWk9kRkcrWXMreTU0WVNDc1dONmZ4d2MvMFB0eFkzcG5XanNtQjI2RHQz?=
 =?utf-8?B?cHNwMUJyekRId1h5TFV2UCtSaTFjeDV5QUEyNExuQ2RxeUVSbzBoS1QwdzVP?=
 =?utf-8?B?cm1SZWdoYjAwNk1oSjBzai81YlRjTnFOMkg3S0hvaE5Uc0VrMERqMlhIRFRw?=
 =?utf-8?B?Z0FwQ1UrclRabHlCOUhGOVJheGxqYTdScndSbFhFSGx4WnNQT0hmWG9OZmRw?=
 =?utf-8?B?bE56WTlFd004NHRrTzh5YWxWVDd0cG1HaDhEY2g1SXZocTN6bFR4YmlhcVlp?=
 =?utf-8?Q?yv09OV4gKAq/WfDznXvy36Kv27n5HBQfud/CivR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1dlTldMbHU5YXEwQ0dIWUkzNS9sNzEyOTM3eGJCN2lKZ3BMaHpxNHBrZU13?=
 =?utf-8?B?bGh6cnErUDZKN0F4aUgzQkdicFhHd2w1WGdhRU1FbTVTOVMvUVQvb1BLRVcx?=
 =?utf-8?B?ekllT29RdVBLQWRhYkpBVGRXVk4xbEhNRkV2VzV3eHMxV2xJMUFielVYNzdT?=
 =?utf-8?B?dzN4UjljL2VLazlHN3IwOUJwVTJFWVhiQ3d5bm9QMW1FbTJUWThOVGdlWnha?=
 =?utf-8?B?aDNVWlVHZy9VdktTdDRXQU1BbitPWG5XcldCMjJBRnhhcENYQnpIdTVPdlNy?=
 =?utf-8?B?TGJZM2taelJlSzhxYXR3R2NGeVRrcUlxbU9sdGVYUmJJUnpBWWFHWXNSUlVE?=
 =?utf-8?B?UUM4SzVSZ1pZWFlCaUNBVGlaeEZkZ0NvemUwcUZNdExkbWZYOVhyYk85cG9Q?=
 =?utf-8?B?UEY5b2liK2laTVFkekN4bEhmQmFIbTd2bUtyaXROZzRzdUppb2RGOStWSm9K?=
 =?utf-8?B?by84VDNoRjcrcEpVYUJPcS9xV0YrWHRyT1VnQ1BZRFdaSVg5ak40akNGZFli?=
 =?utf-8?B?YTZwLy8vYS9ya2tydVhlOTNLbUtuV3BxNExsbDhKUWtHQ3lveG9jWlFGV1pQ?=
 =?utf-8?B?c3FxRWt0WCtkQUFCbjIwT095YjNCWmE5TEU3Vnd1SGlFRm82N012SE1hWWJZ?=
 =?utf-8?B?NFZDZi9LT3k2L3l5ZkRZb21yK2p1ZHJPUklpVnZwbTB3Y0cyV283azNJUXdQ?=
 =?utf-8?B?YkZQZ21IR0RoUE1yVy9pOG5SalNIT0V4bG1sTnlFVm1tam9xU0RlbFdWLzA4?=
 =?utf-8?B?Mm1pN0NKc0RwYTJiQUFwZDJQTGN5UDVTMG1EOFdPQjRyNnJUWG5uUEoxWEZX?=
 =?utf-8?B?VGxMdkdDMldYa3NoeHhmNnF2OXlTcU1hLyt5S2JQSXE4RmlqaVAremxTUWRX?=
 =?utf-8?B?Nm9ScHRxN2srT2loZGxKeFo4dzQzNk9TZ28vbW9jdERnUXV1RU11bkhhMTBr?=
 =?utf-8?B?NjBVbUNTWVgycy96TUZpSmU5WDZFQkVONjdoMnc0dUR2YnNBY2xKZFIwSENJ?=
 =?utf-8?B?Rlo4Z1hWSUVmT1pNVTRUNG52eEF5YTYxcEZLUHJaVzAzYnNpd0tlcEc1Mm9z?=
 =?utf-8?B?cVNnNlJNNFUwZmFnS0kyaFhjeUhkSzhtRFdCaFRLVU1iekdEcUdJUWtreVQ2?=
 =?utf-8?B?aGVSdkxJNk1VZkhFeXlDR3VCcHdES0FmQ1h2NXZXR09hd2tsOVNScG9KQ1dT?=
 =?utf-8?B?Z2NRWDI5MDdSL2VIblhkVFViVHNqYWU1WG5CSllBQmxVbjRaZWJYcUttVGxs?=
 =?utf-8?B?WXVJZDlBZzQ1N1QrK2FwRkhma0V5L2VsQXpIcDJ4ZFc3VkpUQkUvemQ1SFJJ?=
 =?utf-8?B?T2pWVGpjdzVYSFYzTnRjaUlHTU5QNWVMcmU3bWVNZDBvRmtURmJTb2Z5UzI4?=
 =?utf-8?B?UFBGZStDckE3Wk5sdkR1NlRocXVUR2hoVnpGQ01aMnJsUjlGMFRnZEkzQjFl?=
 =?utf-8?B?Yit2SEJyMDJqVG0xMDJHV0JlTXVPWjdoL0V0TDM3TkFoV3huUy93SU9scmlW?=
 =?utf-8?B?NklEcEdpbTlvVERyRXZyR2orUS9WZTZTN2d0VkdCR0xxRVNqQWRXRGxsMXlC?=
 =?utf-8?B?UXB4ZEg3NnBSUERROVk2WHBLNkZ5VGE5Z0xJc1RkbDhtbjZsNG5sLzlGRG40?=
 =?utf-8?B?ZEVEODNMTHdxRUwxcHZ6MjV1ZHZhdzJaVURydUFCaGYzbVRUaTVtTDh0UWll?=
 =?utf-8?B?LzBnenZLZ1IvcU1qOTNCWVc5QTkwOVNpbFVoU0JFdHAvOHZKV1c4Y0JrcW5x?=
 =?utf-8?B?Z1VFZEpQaXZMNjUrUytqT0xtV0hzbUFXdlN2ZW5ndUppU2FQRDRWc0RFL3ox?=
 =?utf-8?B?MkN0b2dOS0ZsZ01Tbm5wOGFjY0ZVSTlhaG1hZjVydStXWS95Z1l4cy84L0Vm?=
 =?utf-8?B?M243NkpRdDk4bWVlMFZPYWZXSkNLcS9hZGJGbVBFUEdWNm5oQ3ZnR0h5dUtN?=
 =?utf-8?B?TDVaWkZtemdRM1pTZnRlbDJ5K2FiVmZPQi9ITlQ4RFFwWlc2R20raGxtNVBN?=
 =?utf-8?B?OXVHdENUNEoxcEpTUkZnVFFhUGQyY1lOTThVUVFWRkM2U3VHSXh4M0dGSElJ?=
 =?utf-8?B?V0VaWFJzdXNRUUVFYTM2SDd3WUlvT1VER3hya3hIMDZ0Wk93eGN1VnRMMEt2?=
 =?utf-8?B?WmZHbDdIVzZhQ1IvRU1nUkI4YXRNSHl0ZkEvWDBwa3g0VlZrRExwYlNnaktv?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e74ef4b2-cbf7-4a3c-1123-08dd0a9e3879
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 02:34:42.6829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JI7Gv6/udSj0giWHip3SbUOPWbF3QGyYC/+ukMGTGQ+6oj2NM/T6eKguBJU0YIH57oJY+gP5eoOqU6kydtwxyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8684
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

On Thu, Nov 21, 2024 at 10:31:16AM +0100, Christian König wrote:
> Am 20.11.24 um 23:50 schrieb Matthew Brost:
> > On Wed, Nov 20, 2024 at 02:38:49PM +0100, Christian König wrote:
> > > Am 19.11.24 um 00:37 schrieb Matthew Brost:
> > > > Normalize user fence attachment to a DMA fence. A user fence is a simple
> > > > seqno write to memory, implemented by attaching a DMA fence callback
> > > > that writes out the seqno. Intended use case is importing a dma-fence
> > > > into kernel and exporting a user fence.
> > > > 
> > > > Helpers added to allocate, attach, and free a dma_fence_user_fence.
> > > > 
> > > > Cc: Dave Airlie <airlied@redhat.com>
> > > > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > > > Cc: Christian Koenig <christian.koenig@amd.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >    drivers/dma-buf/Makefile               |  2 +-
> > > >    drivers/dma-buf/dma-fence-user-fence.c | 73 ++++++++++++++++++++++++++
> > > >    include/linux/dma-fence-user-fence.h   | 31 +++++++++++
> > > >    3 files changed, 105 insertions(+), 1 deletion(-)
> > > >    create mode 100644 drivers/dma-buf/dma-fence-user-fence.c
> > > >    create mode 100644 include/linux/dma-fence-user-fence.h
> > > > 
> > > > diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> > > > index c25500bb38b5..ba9ba339319e 100644
> > > > --- a/drivers/dma-buf/Makefile
> > > > +++ b/drivers/dma-buf/Makefile
> > > > @@ -1,6 +1,6 @@
> > > >    # SPDX-License-Identifier: GPL-2.0-only
> > > >    obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
> > > > -	 dma-fence-preempt.o dma-fence-unwrap.o dma-resv.o
> > > > +	 dma-fence-preempt.o dma-fence-unwrap.o dma-fence-user-fence.o dma-resv.o
> > > >    obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
> > > >    obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
> > > >    obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
> > > > diff --git a/drivers/dma-buf/dma-fence-user-fence.c b/drivers/dma-buf/dma-fence-user-fence.c
> > > > new file mode 100644
> > > > index 000000000000..5a4b289bacb8
> > > > --- /dev/null
> > > > +++ b/drivers/dma-buf/dma-fence-user-fence.c
> > > > @@ -0,0 +1,73 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright © 2024 Intel Corporation
> > > > + */
> > > > +
> > > > +#include <linux/dma-fence-user-fence.h>
> > > > +#include <linux/slab.h>
> > > > +
> > > > +static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
> > > > +{
> > > > +	struct dma_fence_user_fence *user_fence =
> > > > +		container_of(cb, struct dma_fence_user_fence, cb);
> > > > +
> > > > +	if (user_fence->map.is_iomem)
> > > > +		writeq(user_fence->seqno, user_fence->map.vaddr_iomem);
> > > > +	else
> > > > +		*(u64 *)user_fence->map.vaddr = user_fence->seqno;
> > > > +
> > > > +	dma_fence_user_fence_free(user_fence);
> > > > +}
> > > > +
> > > > +/**
> > > > + * dma_fence_user_fence_alloc() - Allocate user fence
> > > > + *
> > > > + * Return: Allocated struct dma_fence_user_fence on Success, NULL on failure
> > > > + */
> > > > +struct dma_fence_user_fence *dma_fence_user_fence_alloc(void)
> > > > +{
> > > > +	return kmalloc(sizeof(struct dma_fence_user_fence), GFP_KERNEL);
> > > > +}
> > > > +EXPORT_SYMBOL(dma_fence_user_fence_alloc);
> > > > +
> > > > +/**
> > > > + * dma_fence_user_fence_free() - Free user fence
> > > > + *
> > > > + * Free user fence. Should only be called on a user fence if
> > > > + * dma_fence_user_fence_attach is not called to cleanup original allocation from
> > > > + * dma_fence_user_fence_alloc.
> > > > + */
> > > > +void dma_fence_user_fence_free(struct dma_fence_user_fence *user_fence)
> > > > +{
> > > > +	kfree(user_fence);
> > > We need to give that child a different name, e.g. something like
> > > dma_fence_seq_write or something like that.
> > > 
> > Yea, I didn't like this name either. dma_fence_seq_write seems better.
> > 
> > > I was just about to complain that all dma_fence implementations need to be
> > > RCU save and only then saw that this isn't a dma_fence implementation.
> > > 
> > Nope, just a helper to back a value which user space can find when a
> > dma-fence signals.
> > 
> > > Question: Why is that useful in the first place? At least AMD HW can write
> > > to basically all memory locations and even registers when a fence finishes?
> > > 
> > This could be used in a few places.
> > 
> > 1. VM bind completion a seqno is written which user jobs can then wait
> > on via ring instructions. We have something similar to this is Xe for LR
> > VMs already but I don't really like that interface - it is user address
> > + write value. This would be based on a BO + offset which I think makes
> > a bit more sense and should perform quite a better too. I haven't wired
> > this up in this series but plan to doing this.
> > 
> > 2. Convert an input dma-fence into seqno writeback when the dma-fence
> > signals. Again this seqno is something the user can wiat on via ring
> > instructions.
> > 
> > The flow here would be, a user job needs to wait on external dma-fence
> > in a syncobj, syncfile, etc..., call the convert dma-fence to user fence
> > IOCTL before the submission (patch 22, 28 in this series), program the
> > wait via ring instructions, and then do the user submission. This would
> > avoid blocking on external dma-fences in the submission path.
> > 
> > I think this makes sense and having a light weight helper to normalize
> > this flow across drivers makes a bit sense too.
> 
> Well we have pretty much the same concept, but all writes are done by the
> hardware and not go by a round-trip through the CPU.
> 

Hmm, I'm curious how that works on your end. Doesn't the DMA fence
signaling have to go through the kernel?

Yes, of course, in Xe we program seqno writes through the GPU when we
can, but our bind code currently opportunistically bypasses the GPU.
Eventually, I think it will become a 100% CPU operation for various
reasons. Likewise, if a fence is coming from an external process, there
is no GPU job to write the seqno. Of course, we could issue a GPU job to
write the seqno, but this would add latency. In the case of VM bind, we
really want to completely decouple that from the GPU for various reasons
(I can explain why if needed, but it's kind of off-topic).

> We have a read only mapped seq64 area in the kernel reserved part of the VM
> address space.
> 
> Through this area the queues can see each others fence progress and we can
> say things like BO mapping and TLB flush are finished when this seq64
> increases please suspend further processing until you see that.
> 
> Could be that this is useful for more than XE, but at least for AMD I
> currently don't see that.
> 

Ok, we have no other current users, and if you feel it is better to
carry this in Xe in a way that it can be moved to the common layer
later, there’s no issue with that. We have several other components like
this in Xe that are generic but currently live in Xe.

Matt

> Regards,
> Christian.
> 
> > 
> > Matt
> > 
> > > Regards,
> > > Christian.
> > > 
> > > > +}
> > > > +EXPORT_SYMBOL(dma_fence_user_fence_free);
> > > > +
> > > > +/**
> > > > + * dma_fence_user_fence_attach() - Attach user fence to dma-fence
> > > > + *
> > > > + * @fence: fence
> > > > + * @user_fence user fence
> > > > + * @map: IOSYS map to write seqno to
> > > > + * @seqno: seqno to write to IOSYS map
> > > > + *
> > > > + * Attach a user fence, which is a seqno write to an IOSYS map, to a DMA fence.
> > > > + * The caller must guarantee that the memory in the IOSYS map doesn't move
> > > > + * before the fence signals. This is typically done by installing the DMA fence
> > > > + * into the BO's DMA reservation bookkeeping slot from which the IOSYS was
> > > > + * derived.
> > > > + */
> > > > +void dma_fence_user_fence_attach(struct dma_fence *fence,
> > > > +				 struct dma_fence_user_fence *user_fence,
> > > > +				 struct iosys_map *map, u64 seqno)
> > > > +{
> > > > +	int err;
> > > > +
> > > > +	user_fence->map = *map;
> > > > +	user_fence->seqno = seqno;
> > > > +
> > > > +	err = dma_fence_add_callback(fence, &user_fence->cb, user_fence_cb);
> > > > +	if (err == -ENOENT)
> > > > +		user_fence_cb(NULL, &user_fence->cb);
> > > > +}
> > > > +EXPORT_SYMBOL(dma_fence_user_fence_attach);
> > > > diff --git a/include/linux/dma-fence-user-fence.h b/include/linux/dma-fence-user-fence.h
> > > > new file mode 100644
> > > > index 000000000000..8678129c7d56
> > > > --- /dev/null
> > > > +++ b/include/linux/dma-fence-user-fence.h
> > > > @@ -0,0 +1,31 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright © 2024 Intel Corporation
> > > > + */
> > > > +
> > > > +#ifndef __LINUX_DMA_FENCE_USER_FENCE_H
> > > > +#define __LINUX_DMA_FENCE_USER_FENCE_H
> > > > +
> > > > +#include <linux/dma-fence.h>
> > > > +#include <linux/iosys-map.h>
> > > > +
> > > > +/** struct dma_fence_user_fence - User fence */
> > > > +struct dma_fence_user_fence {
> > > > +	/** @cb: dma-fence callback used to attach user fence to dma-fence */
> > > > +	struct dma_fence_cb cb;
> > > > +	/** @map: IOSYS map to write seqno to */
> > > > +	struct iosys_map map;
> > > > +	/** @seqno: seqno to write to IOSYS map */
> > > > +	u64 seqno;
> > > > +};
> > > > +
> > > > +struct dma_fence_user_fence *dma_fence_user_fence_alloc(void);
> > > > +
> > > > +void dma_fence_user_fence_free(struct dma_fence_user_fence *user_fence);
> > > > +
> > > > +void dma_fence_user_fence_attach(struct dma_fence *fence,
> > > > +				 struct dma_fence_user_fence *user_fence,
> > > > +				 struct iosys_map *map,
> > > > +				 u64 seqno);
> > > > +
> > > > +#endif
> 
