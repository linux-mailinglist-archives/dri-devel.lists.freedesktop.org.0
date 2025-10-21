Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFB7BF4478
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 03:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE53710E553;
	Tue, 21 Oct 2025 01:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RHtul3RB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7839D10E049;
 Tue, 21 Oct 2025 01:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761010716; x=1792546716;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=p7l0iUjRMMCX6tNhZsmB2F+yyk1hwiRRxqOLsdB7d+o=;
 b=RHtul3RBeONgd849EVtXxeSgKsQbnFPtZLSzgx6MQoWbcn3CJ+BUViY0
 jZkXIiWhJa6Ev40N7ijHp7SZTNtcM3pAoMSGNpFOP+Z9FNjxVdcw9ehkj
 XIuFu0HceFSd897teoi6xCsUeBYIARf2ZYccjmofV8dnzmZm0qNvcBh83
 XqIerb0Dqj0asBxSRxPNoYXRv/Y46lUaQTA5rJi8bsYG07YnYHRUtS+bi
 bijSqqlKFVqqGhsXDiVFUU1HA/vXClV9q12hJP+0r6POizlVs17ZuAoJy
 TOSBLN8SGwyBGR9ODodri/Dbbd+KsLsV6V1lLjDt/SexBK6QypljZ2dh1 A==;
X-CSE-ConnectionGUID: BK84yi7KSBGLNq14hcWjjg==
X-CSE-MsgGUID: kthj05D6Q3i5K+GvQIWXEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65749700"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="65749700"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 18:38:35 -0700
X-CSE-ConnectionGUID: cdEtIv+HQyKsyEQjcCoQVA==
X-CSE-MsgGUID: 1ERR+9cvQpaYLA2csJZmbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="182665248"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 18:38:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 18:38:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 18:38:35 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.3) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 18:38:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uBEqThhJjdBDx54Pu4aenvdoNlItn2Uc0eKIRdTXIydpJkv35bpGvyKf7jKGxcEFSPXzGHkWfW3REtAS6XzCvA8uzn7w0WYYLw4nyi9XJbDGttmkV3arSAkUjsXKlPQVfyRdNNO2yzyOW3skP7AST6322T1dZITVERf132YFLDr64FoI4KnOwCJV4J+6pD2yw+Q40ChtxQDb+e4jz7Tpyb7fMXfFFSTDslXpcmBxiHPUmBB1ZLgh0fo6l7fuqUkU8AXyq8voq3TIiHBk0VbX9pxP8fsnlDPvIXEbuO6DjtvqRpHhmPq29Iyc2M6DAlWXiWtHFHfS4fKWwWIq7ULseA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NacAIQ1PsP7AGxvjhmylokMSyqdm5DOiNomvlfhyfLs=;
 b=FaGI7zaFvXRkoGYqTyqHSyO14m3+OLLiFoZaf6zKBrXL9z4/dBgfnMoQdomjjNEoDmap7kVGg9YAs7WBQgxfo/jl1A66oxtZX58Jbg3ZFp+r7LqxFtMR+kQgvc9bVYfcw+tcJgd6/keQ5aFI7wX4B5eaPXSCfQS8oJ6fsUekDL4CpqhpKwK1hQbRwZJ15PSWMn9CU9BdDcXt1zAwlQey71NKdzXHqpbI1gr2PSvYd4Uc6R5rhP/3UCNwN6SfUK1C3X4TqFHTGL5I0WkBJ9PpQhYAUHJG3+KlrTR0jfe0wE/63IntWGJUkGdct42nwbSar035gvVwCWKQWUK942V5Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 LV4PR11MB9516.namprd11.prod.outlook.com (2603:10b6:408:2dd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 01:38:28 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 01:38:28 +0000
Date: Tue, 21 Oct 2025 03:38:24 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH 25/26] drm/xe/pf: Export helpers for VFIO
Message-ID: <fx3qnizghumon6kd7pkd6ty5hqzcuk3ikw5zy45jiuhmeit7yf@b3hymq5djopj>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-26-michal.winiarski@intel.com>
 <aOv0T8o9Oi/YPqIY@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aOv0T8o9Oi/YPqIY@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: VI1PR07CA0273.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::40) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|LV4PR11MB9516:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a49bd58-8260-4aab-fc04-08de104288d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NEdsNHdseFE5QVlYeW1BVm4vOGhuUGdGSi9wUUlQU05rQzdzN1E5OC9YU2lS?=
 =?utf-8?B?N05ITFRCOGxvY3drYXBOMzljZ3BheHEyVTBDZ1dHNVZ4NkpnTDVqMVVJM3hm?=
 =?utf-8?B?aXZSeEZ3RlQ2V3BPRHY5YmhMUlhnc3pKTWxHNHZhL2ttRTBCM3ZTTE1lbFd1?=
 =?utf-8?B?Y3FNaFltekFlRkROekZyTXd6T3hvU3BFdU12eXEzR0FBTE9XTEpxU0RKSHQr?=
 =?utf-8?B?Vm9KdFd2TzluWm9kaURtbS9mUFdHcFI5U3hyNTZEeFlBbW9CSkFKMDVTSG1E?=
 =?utf-8?B?VHExOTJoWjBCajlXUU9lOFMvS2ljMVc3MjJVb1QzQ09yUGl1OFZ1Z21ZQ0dK?=
 =?utf-8?B?STBWeTZicDZ3VWpkalRVc0RTRnFSbWNRQXNmTXJuZStMMjZQbi9BTitSMmRu?=
 =?utf-8?B?OHpvYXNucGdzRUN0U3VrRFdHQTNaZlVENUlPNzEyUkEvVVNYMU0wWGt6WnRU?=
 =?utf-8?B?SHY5a1RNVWVhRVd4Wm5sWWxBNUt3QnhLYyt5bktRbkhmSjliOEY5WlBLZkJH?=
 =?utf-8?B?Y1F5Nlc5K3IyYm51U2FJOTRUOTV0WXlmd082Ly9xREJZeXB6ZjdoZkEzRHJX?=
 =?utf-8?B?TWxJeVpwZFVBTUtiL2c1VVlUbWRHdllYZFAvb3Z5b0NjVVZ5OWFHWkIzUWdu?=
 =?utf-8?B?akllYVY5c1ZYUWF0bVhYT0p0UmpMcUNWd3pycFQ3MWhTcHR4Z0g4cWdkNjRB?=
 =?utf-8?B?Z2lSVEZnZDMwQ093Z3ZWMW1hVHdNT3M3aTcxZTdObE5iR2lDQUF0b0FiR0VP?=
 =?utf-8?B?a0tJV3BKTStUK2hTK2d4eGUzRFB6b0VWTDIxcVRlbVF5bHBnZlZkbkk2Um5Y?=
 =?utf-8?B?bTR3alJzb3IydGpacTRRbzlTN1prVXYxWno1RU1NdlZwdWN0OHp6VC80Mmx4?=
 =?utf-8?B?dnpKKzZrSk1YV3Yzd21wUEo1cENSWGhtc0dIZTlTdmJoWDVkMDY5ZVFQSkZ2?=
 =?utf-8?B?N2RISGdIekRHZ2xmblYzMEpwNHh4VE5mMXJ3cVFob0xqN3YwWUU0ckRZdEpQ?=
 =?utf-8?B?bnVjNWNQTE85SjFNSDhmWkM0VS9HNHN4K051SjNWY0kyc1R1LzJSTzAwVXlF?=
 =?utf-8?B?bkNIWWw3cjJrYnlqaEhrMTRqd2dHQll1eW1YYVVaWjN4eTRsc3hTNk1JVWpZ?=
 =?utf-8?B?OWgwK3o5R0x6UmVCRG9tY0UvVGRiVVpBK0xJMSttYlNPZ1F6b3VYVDd6ak1D?=
 =?utf-8?B?L0tiU3hhOHBUVkFUY2tBL2hiY2NaZ3cyYUV6a3pyaHBoS2QyNHVpT1RDbDgv?=
 =?utf-8?B?Wm44NXNSSXBnVWNRR3U2eUI0T3Q0Lzd2V2hXZ205dU1VckJhamtDdyttS2Q2?=
 =?utf-8?B?eXJaWjRFRXhGenVLelZZN05XU2UyTXVUMWxWUzIrTTNLZ2VyKzR4OFJKTDJz?=
 =?utf-8?B?OHpZZnBnZ29kS0RqNlVLME1JMjMyRm5ma1M0bXpGLzhrSVQvalZsRGxiQWlT?=
 =?utf-8?B?ZEVQeDV0MytKOUpkc3N5Ykk2a2VPcmIzRHQzQ3NOaVVLVmRNUFRCbVBLWU43?=
 =?utf-8?B?VVRwd25ua1dXMnpsYlpEdHFnYUJObjhOblM0R1hQaUFGQlZrdnIvYzhPMFp5?=
 =?utf-8?B?Mm44N2NYbnNBdVIyU2FPSlN0VTNYcmxJNllHeFZGalJ2WjZSdHBOVXRSRzIv?=
 =?utf-8?B?SUdsTHhOS3NuSXRROHdRWmlsQndITVVsN2gwd3M5NHc5bFIxMHF6RWljL2hv?=
 =?utf-8?B?SUcyNlNBbDYyd3Q4MmdER015akRNY3hQaVlpcHVwMnMzVDFmcDExS0VpREls?=
 =?utf-8?B?Vi8xb3JMQ0lzYkJkNjQ4ZGF0cWN5YlpvSE9wcVM1cTBRSDhtU3ljRk5EaVFM?=
 =?utf-8?B?UTlyVjcwaE93K3VyQXBpM0d1aURXNUxiK1ZjUW9ZbnJBNUdhalJobno3ZHI4?=
 =?utf-8?B?eEs2bzdLNDJadDJqTXhxdmVXQTF5dXVBVE1QR0VyOWRNcTQyTkhWS1IvR084?=
 =?utf-8?Q?dnh8oJo2wX3o+AUW0mv5ouS5FmJWSYK8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1NBWFd3NWVaaksxdVpXSlo4VmFzKzcvd3Zmdk5yTjBmbGVPcDFYak5mQzFG?=
 =?utf-8?B?R3F4MTlJQU44d3ZXVGZvTGpKZTM4YmJPUitWcmZ1a1lwK0dFaDc5Vlp1RVdN?=
 =?utf-8?B?b1lmWUpXTUJJTi9YYVQ3R2JOUHQyY3FmZkpHZWVRdWk1TUE1eFcwWGY4MDJk?=
 =?utf-8?B?N3M4Q05YQnF0ekczZVJoRlBpUnV2ZDBhUVN1OTJYRFU4SE0zNmdYUjIyOEsx?=
 =?utf-8?B?MmVmdnNndGdXOFAwM3pjaXRwbnlIcXpjOEtxWEZnVE9sSm51RUxZTUNBV1Bn?=
 =?utf-8?B?T3hpNXhjV2VNbTY3bVN5Z0JhcnpFbVBiajdoSEl0UnNRTWVtL3pkZ0M3blhI?=
 =?utf-8?B?V0M4QnBUblJBYVY3ZHJ5UU9CZnhqTGt5ZlJDWHlKODdlVHNoRk45aUowZjBM?=
 =?utf-8?B?OWhIc0ljaFlKdXE5Nkt1TnM2aVlMM0ZhT3dUVlY3NjQ3S0dBVUhLNjBtUFRZ?=
 =?utf-8?B?UmtYNFpxUTNjeU1wVU5JdGZuKzM4c1Z5VmJZODdzWXpjYkMzcWt5WEwyZ3FD?=
 =?utf-8?B?RlVSK2JQbnRKWXVCbnFLWEZIaSsxS0hkN1gxMmgxblRacnFUOE03YUp6VitH?=
 =?utf-8?B?bnVjTVdsYXNHSXBlNmpLc0UwYWV4QktNaGdlRy9zMEh6R21JR3NWTGNEeFNm?=
 =?utf-8?B?cmhrOU5qdjJ1UUhmL1I5ZzU2ZkhWQWx0SDFvU2ZZQVBDbEZTYmtGU0NrK1dt?=
 =?utf-8?B?OTJIcWcwSjNVNlBCSXhjZHVlamM0WEJ4cUFlRy96R20wdjdrN2kvaVl5RU16?=
 =?utf-8?B?UWRPazMyVmU5bzh1MXlUVlhGSnpQQW1mckFhQ0MyZUVYbGd0MzN2QkkzY050?=
 =?utf-8?B?SzN1WWh0WXpaa2gzM3BXb1ZhMmgwWm9QNmNLL0VraHRSWnpuUjJOa25oRFp6?=
 =?utf-8?B?bFRQRFJ4N2Ira2tZaXRCbFNUT005TTNPQ095czYrVGFFUnExcC90dEczbGNK?=
 =?utf-8?B?b1BTMkJRUlJIVzJHY0tOZTZ4dUVKNUh6Q2pYZGxGbkNvMWdDVEt4Vm00U0Rw?=
 =?utf-8?B?ZHA2Z0JOMzRwMmVBSEVvSDk4cDBQRnppVnRFSjIrRnBvK1hFK2l4YTYwcDJh?=
 =?utf-8?B?VTlQTzc0WUttcWhleFlXUElPNy9LdFlZZzBldmd3cFJrY3lzTHUzcERqTzN6?=
 =?utf-8?B?TE5XWk5Yb1hCb0ZOTjN3ejFDeUx0ZXNPSlFrRVFxcU1RbGI4OWZOY3JWZFhM?=
 =?utf-8?B?VTRuNHNPWTF2N2FoZUcreXBGVldTeVdISTdOZ3dRam9tWWxabFZ6UVhGVGpI?=
 =?utf-8?B?UURyRU1iSmdidFNjMHg1L05qK2N1eHVRa1JyeDIwZmtuY1lwVWJhd2JqaDNk?=
 =?utf-8?B?ck1PYWxOYmIwTnZGUzJiM29XY2hEbU9jTFB1UjJ0S2k0YmsxRjYrdjN4Vmdn?=
 =?utf-8?B?RS9jNk1zNFFFYlZaSGdXb0RkZEtBTVo5S1hCL25adlVDK2gwNzZXOC9JYmJ1?=
 =?utf-8?B?dVBTVU00Z0hRQ3IyY1FmemJ3SGJWMGJkcFBrNC9GYm9ubGdIRit2cFB4alNs?=
 =?utf-8?B?TnAxZElDRnU0NXc5NDJFR3lxTytkSTdIUXdJOVNCU1JtRmUwczhRUzMrdFkw?=
 =?utf-8?B?cmxWLzFqRFhydWhwR28wOHZrSWJCL3NCdUk4VERpZzdRZHBuSEVxY3UxQ1FW?=
 =?utf-8?B?RjV0ejdLTHVuWVVrektmMHA0ajkzVzEwRm02ditLWFF4VXpveXlKc3JTSkxN?=
 =?utf-8?B?WERGaFB0bUhHOFE0dDN0eGFwTXZLY2QwZEZZNmlraWUzS2Q0NmJ3ZWJ3ZUxm?=
 =?utf-8?B?SGFsOHFLRGtNV3pldDhpNjkvWEtyMHd0YUxjRVJOVWFidFBBYTBWekdwUGVQ?=
 =?utf-8?B?SzdkdS9qYVpvU20xWWtmM2c5Y2NERTNxeS9YKzVWbWlCdi9Ta0tsVit0Qlhx?=
 =?utf-8?B?VjdGcHFFNEJqNUJVdklqNzJrdHhXQnEyaW9RRVpVL3dHaGZWRkFBUk5GejRy?=
 =?utf-8?B?OTB4YmJQK3F3NUZtdkQyTFl1RzdNRUJXK2VHdkZCYWRsTXVoL1VKSDZkLzYz?=
 =?utf-8?B?ZnlCWVhwV1hnY1kwRURoS1hwcVcxV0lJOWtFWWlOL1BtcUxtUCs3citiZ01j?=
 =?utf-8?B?SE9GVGtoaDNHQ2d4YjNpeFd4NmdrTEFidWl6K1ErUXcwRWRLYS9BL2RlRUUw?=
 =?utf-8?B?Q1MyNWNzQkdZcVZ6UGhpWVh2eHNlTTQyeklKVlhrYjRyb2xuNWlvSGJ4eVY5?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a49bd58-8260-4aab-fc04-08de104288d0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 01:38:28.4121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RlR3R8rpOurfU86jrdTQMH/TRuYeopzNaRHQOWmixtcwv8Q0p4RkVel5SfEk1bFspVLYuh8CbifVJRyOG1aF8avn/APQeMkvhk6fOKP9sIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9516
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

On Sun, Oct 12, 2025 at 11:32:47AM -0700, Matthew Brost wrote:
> On Sat, Oct 11, 2025 at 09:38:46PM +0200, Michał Winiarski wrote:
> > Vendor-specific VFIO driver for Xe will implement VF migration.
> > Export everything that's needed for migration ops.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile        |   2 +
> >  drivers/gpu/drm/xe/xe_sriov_vfio.c | 252 +++++++++++++++++++++++++++++
> >  include/drm/intel/xe_sriov_vfio.h  |  28 ++++
> >  3 files changed, 282 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vfio.c
> >  create mode 100644 include/drm/intel/xe_sriov_vfio.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index e253d65366de4..a5c5afff42aa6 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -181,6 +181,8 @@ xe-$(CONFIG_PCI_IOV) += \
> >  	xe_sriov_pf_service.o \
> >  	xe_tile_sriov_pf_debugfs.o
> >  
> > +xe-$(CONFIG_XE_VFIO_PCI) += xe_sriov_vfio.o
> > +
> >  # include helpers for tests even when XE is built-in
> >  ifdef CONFIG_DRM_XE_KUNIT_TEST
> >  xe-y += tests/xe_kunit_helpers.o
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vfio.c b/drivers/gpu/drm/xe/xe_sriov_vfio.c
> > new file mode 100644
> > index 0000000000000..a510d1bde93f0
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vfio.c
> > @@ -0,0 +1,252 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include <drm/intel/xe_sriov_vfio.h>
> > +
> > +#include "xe_pm.h"
> > +#include "xe_sriov.h"
> > +#include "xe_sriov_pf_control.h"
> > +#include "xe_sriov_pf_migration.h"
> > +#include "xe_sriov_pf_migration_data.h"
> > +
> > +/**
> > + * xe_sriov_vfio_migration_supported() - Check if migration is supported.
> > + * @pdev: PF PCI device
> > + *
> > + * Return: true if migration is supported, false otherwise.
> > + */
> > +bool xe_sriov_vfio_migration_supported(struct pci_dev *pdev)
> > +{
> > +	struct xe_device *xe = pci_get_drvdata(pdev);
> > +
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -ENODEV;
> > +
> > +	return xe_sriov_pf_migration_supported(xe);
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_migration_supported, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_wait_flr_done - Wait for VF FLR completion.
> > + * @pdev: PF PCI device
> > + * @vfid: VF identifier
> > + *
> > + * This function will wait until VF FLR is processed by PF on all tiles (or
> > + * until timeout occurs).
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vfio_wait_flr_done(struct pci_dev *pdev, unsigned int vfid)
> > +{
> > +	struct xe_device *xe = pci_get_drvdata(pdev);
> > +
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -ENODEV;
> > +
> > +	return xe_sriov_pf_control_wait_flr(xe, vfid);
> 
> Ideally I think you'd want the exported suffix to match on all these
> functions.
> 
> i.e.,
> 
> xe_sriov_vfio_SUFFIX
> xe_sriov_pf_control_SUFFIX
> 
> Maybe this doesn't sense in all cases, so take as a suggestion, not a
> blocker.

The VFIO side uses different naming than the pf control.
Pause == Stop
Stop == Error
Restore == Resume

So the translation needs to happen at some place, and I guess the
current choice is at the exports.

> 
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_wait_flr_done, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_stop - Stop VF.
> > + * @pdev: PF PCI device
> > + * @vfid: VF identifier
> > + *
> > + * This function will pause VF on all tiles/GTs.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vfio_stop(struct pci_dev *pdev, unsigned int vfid)
> > +{
> > +	struct xe_device *xe = pci_get_drvdata(pdev);
> > +	int ret;
> > +
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -ENODEV;
> > +
> > +	xe_pm_runtime_get(xe);
> 
> The PF must hold PM ref behalf of the VF' (right?) as VF's don't have
> access to the runtime PM.
> 
> So either you can assert a PM ref is held here and drop the put / get or
> use xe_pm_runtime_get_noresume here.
> 
> Exporting the waking runtime PM IMO is risky as waking runtime PM takes
> as bunch of locks which could create a problem at the caller if it is
> holding locks, best to avoid this if possible.

I'll replace it with an assert.

> 
> > +	ret = xe_sriov_pf_control_pause_vf(xe, vfid);
> > +	xe_pm_runtime_put(xe);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_run - Run VF.
> > + * @pdev: PF PCI device
> > + * @vfid: VF identifier
> > + *
> > + * This function will resume VF on all tiles.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vfio_run(struct pci_dev *pdev, unsigned int vfid)
> > +{
> > +	struct xe_device *xe = pci_get_drvdata(pdev);
> > +	int ret;
> > +
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -ENODEV;
> > +
> > +	xe_pm_runtime_get(xe);
> > +	ret = xe_sriov_pf_control_resume_vf(xe, vfid);
> > +	xe_pm_runtime_put(xe);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_run, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_stop_copy_enter - Copy VF migration data from device (while stopped).
> > + * @pdev: PF PCI device
> > + * @vfid: VF identifier
> > + *
> > + * This function will save VF migration data on all tiles.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vfio_stop_copy_enter(struct pci_dev *pdev, unsigned int vfid)
> > +{
> > +	struct xe_device *xe = pci_get_drvdata(pdev);
> > +	int ret;
> > +
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -ENODEV;
> > +
> > +	xe_pm_runtime_get(xe);
> > +	ret = xe_sriov_pf_control_save_vf(xe, vfid);
> > +	xe_pm_runtime_put(xe);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_enter, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_stop_copy_exit - Wait until VF migration data save is done.
> > + * @pdev: PF PCI device
> > + * @vfid: VF identifier
> > + *
> > + * This function will wait until VF migration data is saved on all tiles.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vfio_stop_copy_exit(struct pci_dev *pdev, unsigned int vfid)
> > +{
> > +	struct xe_device *xe = pci_get_drvdata(pdev);
> > +	int ret;
> > +
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -ENODEV;
> > +
> > +	xe_pm_runtime_get(xe);
> > +	ret = xe_sriov_pf_control_wait_save_vf(xe, vfid);
> > +	xe_pm_runtime_put(xe);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_exit, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_resume_enter - Copy VF migration data to device (while stopped).
> > + * @pdev: PF PCI device
> > + * @vfid: VF identifier
> > + *
> > + * This function will restore VF migration data on all tiles.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vfio_resume_enter(struct pci_dev *pdev, unsigned int vfid)
> > +{
> > +	struct xe_device *xe = pci_get_drvdata(pdev);
> > +	int ret;
> > +
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -ENODEV;
> > +
> > +	xe_pm_runtime_get(xe);
> > +	ret = xe_sriov_pf_control_restore_vf(xe, vfid);
> > +	xe_pm_runtime_put(xe);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_enter, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_resume_exit - Wait until VF migration data is copied to the device.
> > + * @pdev: PF PCI device
> > + * @vfid: VF identifier
> > + *
> > + * This function will wait until VF migration data is restored on all tiles.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vfio_resume_exit(struct pci_dev *pdev, unsigned int vfid)
> > +{
> > +	struct xe_device *xe = pci_get_drvdata(pdev);
> > +	int ret;
> > +
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -ENODEV;
> > +
> > +	xe_pm_runtime_get(xe);
> > +	ret = xe_sriov_pf_control_wait_restore_vf(xe, vfid);
> > +	xe_pm_runtime_put(xe);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_exit, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_error - Move VF to error state.
> > + * @pdev: PF PCI device
> > + * @vfid: VF identifier
> > + *
> > + * This function will stop VF on all tiles.
> > + * Reset is needed to move it out of error state.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vfio_error(struct pci_dev *pdev, unsigned int vfid)
> > +{
> > +	struct xe_device *xe = pci_get_drvdata(pdev);
> > +	int ret;
> > +
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -ENODEV;
> > +
> > +	xe_pm_runtime_get(xe);
> > +	ret = xe_sriov_pf_control_stop_vf(xe, vfid);
> > +	xe_pm_runtime_put(xe);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_error, "xe-vfio-pci");
> > +
> 
> Kernel doc for the below functions.

Ok.

Thanks,
-Michał

> 
> Matt
> 
> > +ssize_t xe_sriov_vfio_data_read(struct pci_dev *pdev, unsigned int vfid,
> > +				char __user *buf, size_t len)
> > +{
> > +	struct xe_device *xe = pci_get_drvdata(pdev);
> > +
> > +	return xe_sriov_pf_migration_data_read(xe, vfid, buf, len);
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_read, "xe-vfio-pci");
> > +
> > +ssize_t xe_sriov_vfio_data_write(struct pci_dev *pdev, unsigned int vfid,
> > +				 const char __user *buf, size_t len)
> > +{
> > +	struct xe_device *xe = pci_get_drvdata(pdev);
> > +
> > +	return xe_sriov_pf_migration_data_write(xe, vfid, buf, len);
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_write, "xe-vfio-pci");
> > +
> > +ssize_t xe_sriov_vfio_stop_copy_size(struct pci_dev *pdev, unsigned int vfid)
> > +{
> > +	struct xe_device *xe = pci_get_drvdata(pdev);
> > +
> > +	return xe_sriov_pf_migration_size(xe, vfid);
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_size, "xe-vfio-pci");
> > diff --git a/include/drm/intel/xe_sriov_vfio.h b/include/drm/intel/xe_sriov_vfio.h
> > new file mode 100644
> > index 0000000000000..24e272f84c0e6
> > --- /dev/null
> > +++ b/include/drm/intel/xe_sriov_vfio.h
> > @@ -0,0 +1,28 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_SRIOV_VFIO_H_
> > +#define _XE_SRIOV_VFIO_H_
> > +
> > +#include <linux/types.h>
> > +
> > +struct pci_dev;
> > +
> > +bool xe_sriov_vfio_migration_supported(struct pci_dev *pdev);
> > +int xe_sriov_vfio_wait_flr_done(struct pci_dev *pdev, unsigned int vfid);
> > +int xe_sriov_vfio_stop(struct pci_dev *pdev, unsigned int vfid);
> > +int xe_sriov_vfio_run(struct pci_dev *pdev, unsigned int vfid);
> > +int xe_sriov_vfio_stop_copy_enter(struct pci_dev *pdev, unsigned int vfid);
> > +int xe_sriov_vfio_stop_copy_exit(struct pci_dev *pdev, unsigned int vfid);
> > +int xe_sriov_vfio_resume_enter(struct pci_dev *pdev, unsigned int vfid);
> > +int xe_sriov_vfio_resume_exit(struct pci_dev *pdev, unsigned int vfid);
> > +int xe_sriov_vfio_error(struct pci_dev *pdev, unsigned int vfid);
> > +ssize_t xe_sriov_vfio_data_read(struct pci_dev *pdev, unsigned int vfid,
> > +				char __user *buf, size_t len);
> > +ssize_t xe_sriov_vfio_data_write(struct pci_dev *pdev, unsigned int vfid,
> > +				 const char __user *buf, size_t len);
> > +ssize_t xe_sriov_vfio_stop_copy_size(struct pci_dev *pdev, unsigned int vfid);
> > +
> > +#endif /* _XE_SRIOV_VFIO_H_ */
> > -- 
> > 2.50.1
> > 
