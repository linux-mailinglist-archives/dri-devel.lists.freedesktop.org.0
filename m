Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDFAA5C053
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 13:12:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710FE10E58E;
	Tue, 11 Mar 2025 12:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/Dli8bG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CBA10E58A;
 Tue, 11 Mar 2025 12:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741695151; x=1773231151;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lhEXAci5zC3SNCxwcBLP8x6CPmvvkbStSZDLdLOjvpk=;
 b=H/Dli8bGPg2rmUqx1MmkLLxVb62CqhM6/363hdAjnp7f/Nps4UC/1dEW
 3RdRodhiHm61eW6GZIsyQKu6II1IlBoGVc6DvZSerfGIVPqP4vbHt19/E
 CJ0X4yrITPDBgAKFOMq5ivZL5lxeoHt1fVhqhBhzvQHQKybADxbq7kwoH
 fnWJkeJkUaJdjBTQw4FT6fsE0eHNK/DWxPK4I4YrMN/2ecL4XD7V0uWzT
 PwARLEi2MCdHimKGLLeEyHZyZFqM+RI9wGyZql3esWZyo2ML1rEk4Yeqi
 edlW0jxlgR+fPwXQZaUbDnGFCvcWeE4jqacMW0VfyjMCfTAR+tqaS65CC A==;
X-CSE-ConnectionGUID: SlOhDDnFTYO+OLz+W0y22g==
X-CSE-MsgGUID: aS6mcmc/RL+oZhobKfzIfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="54111407"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="54111407"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 05:12:31 -0700
X-CSE-ConnectionGUID: 6K35hNNISSq2O7iRDjFKmA==
X-CSE-MsgGUID: f66ZKukNQVO+qeVtCCAqJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="120143216"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2025 05:12:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Mar 2025 05:12:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 05:12:30 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 05:12:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIpoEK2oOswemOhQ/GClXw8jZPce2+dm4mBT8hyEgsVI4ZI0HrKCPpyd9NHY2P/oJ0E/60lJmlBI56FYsqWVTT/BNjvWG9BLQRZhRHYS9C0N3rSDlq9lFrcX5dymlxSScdP35IXAeCeFi0+f4ZDZECfjbEJDriq+1IB9EumElqi7nER7VPxw8iMYYa1Y6frXkeZ32njfl8v/SmeCGFCG1SHr+vE7BNNzHFcOCKsXX50Jlt42dPRjLjlu+QEHi7i1i8ibNIvTewYrkWHvvk+gYWnz6EaNJ8SFxDWLM65TulKkC239+ke4i2L5MZiJQoFBTlU5JpKuf7HtEP9NEJDyKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Hf4sq+j8LiGJORULZUj0n7+0LZfcb4yktqU/qBJVp0=;
 b=LR61Mb2hBSZaKogP8nlXyeSq+WAaEIsNjg3pCThjoGTI9r7DGCsK555AWEtHyMtbz99JaWRVA7TXAeqJTF0KhOQAKTfqS67OMIMk9qZsUeS1QSVUkElCmcA+8oaxsHGe6W/kx5r4v0wE28KZ46XhdgPRoyLlF2pjO86EOKyAKueCkBokPg8CjUeWGxCwujmR6xrEIg03UbdRxfh5pxEf467l+TC861VCqnbYnljamIXEmJatkUi1LKvcgtQkwRmDzLgVzp6U6sTAIJ3ZtlY13TQ6xH/ZyGgmRyDy1+ukvr44uUv990VOEJiCkiJl235HBam50lgclNjTZXCr7z7ILg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by BY1PR11MB8029.namprd11.prod.outlook.com (2603:10b6:a03:526::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 12:12:00 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8489.025; Tue, 11 Mar 2025
 12:11:59 +0000
Message-ID: <9729c9bc-90be-4b15-9f40-9ef0aa0b09d1@intel.com>
Date: Tue, 11 Mar 2025 17:41:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] drm/i915/display: Call the compute function
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250304102857.326544-1-nemesa.garg@intel.com>
 <20250304102857.326544-9-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250304102857.326544-9-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::9) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|BY1PR11MB8029:EE_
X-MS-Office365-Filtering-Correlation-Id: d847b379-1969-4f3b-d5ac-08dd6095eca7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWZsaVdIeEwxSmtkMFZmUTlLU2VzVktidW5HWllvZ0lRanBWb21COW9BOU1Y?=
 =?utf-8?B?MC9ZYnhoUkVRNVM4aGhqVjVZRzh5aVhYNFdyZXpwQU5mdXJiMHNPWjN4V3Bj?=
 =?utf-8?B?Mng1bXk4OWVRd3pseXBCSXhqbkwxb1M0ZVBiKyt6ZnhQVHZ4UFZ6R1JmZjBo?=
 =?utf-8?B?Y2l3T2pqOVQxSDhzVjdmcTVuRmQ5UVprVEEzZy9iaCtaRzEzVnJlRE4xcE5T?=
 =?utf-8?B?cSt0QVVjMkR6RlkwM2xqdlVDOE0ydVhyUHFHMS9JNGxGSFVNbHhLcGpiRHFi?=
 =?utf-8?B?SWVLSmNsazBpVmNjbkhCZWYrVjJ4d1N5U2l1UjlxZ0UrSStLTndwQjBJV2Rt?=
 =?utf-8?B?QVJOSTh1dzlQakJvTkRjT3lUTThrMTVEK2FVQkRtZFJSaUVtSUNPa21VM3c1?=
 =?utf-8?B?WWo5WmZ1eTNJRTJsQnRXaWZkaEk0NFBHWmtSaHgwT3NmTTh2RVNaWVBsVmpi?=
 =?utf-8?B?THMyMHN4L0dlbExha25vdTd6T0c0MGlCZk5YOE1IUWFQZzlZUEZ5S2MvWFFZ?=
 =?utf-8?B?MzVrNTBUMW5acldSaGJUR0F1bGxZcTJiMGFGREEyTXhpd01SaTZqNWZXUWZW?=
 =?utf-8?B?Ums5c1RxSWhBc0tod2xmOTM4WHVYQWlyODB0SGJJSkxzeVE3MjBFMmswVVF2?=
 =?utf-8?B?SklaU2Q4bmdZdHBTNWw3TFJ6VDcrdVlWVFRwcjBKU2xxeWFxem1HMHlkcWtQ?=
 =?utf-8?B?T0ZLWUtsbTZLYVRMWUF5bFFzc056U2NVMTJuWFNXZy9ESG54UE84NWVGcGwy?=
 =?utf-8?B?ampXZ004YlJBVDUxbzlOZUNyVktiSXlZUFJUVks0amVnRnhnVUdMNXQvZ05P?=
 =?utf-8?B?dFpHM1BnRUNsZFJhZTFLZ0hybzI5OHlCd2N6SW5IRVJFZ3hKZ1pKbTNuQzFV?=
 =?utf-8?B?bklPZGZBTHJYN2h6OVROeHpxN09ybTZJSUtRbmljdy9oUnYzbzJFVFJEQlhm?=
 =?utf-8?B?VWFZY2xCZUw4dG91MDg5N1dSeGZBOFVPU3lRenZJY3pHemlUQm9peUp4T2tW?=
 =?utf-8?B?ZS9JZkFuRldKNUVJZ0dkS3oxaEpQaXh4WlRSY2dVSEVrUXBxaEtyOXhIUDM0?=
 =?utf-8?B?Z1NrVHdwQjFiOVQvN3dzSVk3Tm9hWkJuMFNmMm9GdDkvRmJFeTZIYWt2VkZk?=
 =?utf-8?B?VFpBYTk1WEZ0dTk4RnZqLy8rN3o5S0RLUnZwWTJydW1KMXEzLzBZRzROUTFr?=
 =?utf-8?B?Znl4R3d6Ny9CU1F4NVBTZmpQN1ZaYjhTZ0kvZllPakVpVkVzUXUwUjIwL3lY?=
 =?utf-8?B?b1E4c0JEcGhxb0VwaGFxdFRKNVY4U2g2KzhNN25SRWdzaHh4ZDY4TWtITURM?=
 =?utf-8?B?T2FBempsUFBkbjBJRVJwYlEzOUNOb2lLSXlKM2tmaTdvQ0lVYmlTaHRxenJZ?=
 =?utf-8?B?S3UvbktkUUZUOG5Pb2hKT2lGU1BZYjgxaDNEOVJ6bXQycVBLWHd1dWJXcm1Q?=
 =?utf-8?B?aC91YUs1TzJxQmlRSW9raGFpWEY5aGs1ZVcyR2svcFBud1NHZGJxdGRQQmJN?=
 =?utf-8?B?bm5kditMMnF3VGExc0Z3aG1jMkRGYklaUTJkWE9ibnpJdmZnYU9vcXpJRlpQ?=
 =?utf-8?B?QlBlWWl1ZzE4WlQrems3NnNmYmJzcEorcHVBTXl1THc5bEVCRitaRW12UnVN?=
 =?utf-8?B?VVY4Wnd6ckJvYmlyVitsOWlwWUZqZFdhUU1HVm4yQ3ExSkVtZTRlRG9CRXdS?=
 =?utf-8?B?bGhrQ1o3U296NE9PUW5IY0UxNVBhVGNLb0dpNGg0eFFJbGcwOW1ja25RUzB6?=
 =?utf-8?B?SXpUS21kYTNrYktieUQwcXRvb3BqRFRndmU2VzQ4dkFCWk9mQnVkOHMzdzZv?=
 =?utf-8?B?eUZSNmhwcVM2M1I3QndnQ1ZpeVhPVHRQMk1oeXo0VTNLaGF1SHNSNzYyYjdJ?=
 =?utf-8?Q?9thIqK9GgfMXo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0oyY2IrWHdaQnlGQnN2dzVpVlM3M1Y1L1RCQ24vQmQxblp3VHdDc09xQ1Az?=
 =?utf-8?B?cnpLNVNiSGpEdVNwUVF6VTlTVm5oVm5DdDZTcmdvN2hKVSt2V1pmZHhkSVR0?=
 =?utf-8?B?KzZBdy9SQ0JtV2ZGQlNyZlhLNWNtUWV5YXo3bHJDTkY0bkhhSkRIc0dhS2Fn?=
 =?utf-8?B?cWZMTkdMd05ZSVg0Tk80cHZ5aW1qRWU0aUVLOHpRajJZaEFDdENVOFRuUFFE?=
 =?utf-8?B?dHQ5b0RpNU82TmY4V0t4LzZXTkdzcXBIc3k0RGdxVWpLS1J6YnpDNXpVaG1x?=
 =?utf-8?B?V3I1RUxVVHBJVDNITy83MHFKMFhEZUtMWXo5Y1dqcjZ0dEI2bXZuNW8ycUs2?=
 =?utf-8?B?OUwwRmR4S3pyRWIxaFA2SnpPZzh4c0RIdDlTTDJSRzkzVWhqU1pDMmIxYnJY?=
 =?utf-8?B?UGl1YmE1THF5WjVncUIrT0ZNeHN1ck53Yk10WlhQbndMQ0pwczBEUWpyRC9P?=
 =?utf-8?B?MThWdzhFTTA0WW5peFRMSHlxeHBkRWxiSmlrQ1A4anNHWHVFcXVENGU2SzhK?=
 =?utf-8?B?eGdrY0NNRmVZYU9XUnZQT080a1hYTUhiZHVSMElpSWdBNmVIWmU3ZUZCVnA0?=
 =?utf-8?B?cXg4bFA2M3dWSFp1OHNFemhSeFRaQThZQzFDanlzOGoraEt6OXlLQmdBQXc4?=
 =?utf-8?B?a1dUdmxmb0o5Q3pla1NaNTA1SVNUc3BUZG4yakpwbVVlczVaTW5XOHNocTdj?=
 =?utf-8?B?OVBNVXp5OUhuSWlUVzEwQ0xGdEtMSEM1Si81Y2p0T0pDUVNGRzJnNkJJaFI5?=
 =?utf-8?B?VVNValA0ZjF3KzNNUkoyZGx2bWcyOUVsTkNUNmVtSEdWWEFMK1pGeTBYeDVL?=
 =?utf-8?B?emJEaWdxZHdhQW4wek05OFZPWWFFa0gyOTZnUVIvK0NyeXlMTjEzWGpvYUZa?=
 =?utf-8?B?UDNDdmNZOGpVWnhPWWhLNjBUeXdDdHlMMUVXd0xsVHRpTnJqQmNEbzBjZlpw?=
 =?utf-8?B?ZTduN2k5V1NRZWUybUYvdlNJaVAzU3ViR3BNcXRqL0w4WHRBQ1hjOFlGZVlv?=
 =?utf-8?B?ajVGTEZScytXRVB5Z0ZsWnNuRnZ5T1RDZW9EemNyZ3dUZ2tvZTh4dzcxOVdz?=
 =?utf-8?B?QXNnK0hXbVIzaTNzTnBoWUtUdHRYbjRWcjRMT2dwUHpyWXNvYjc3VTlQaGhx?=
 =?utf-8?B?SU5NeEZXdjlaOE1QSTV2clVKU1hEemowVC9WOFVpZzhma1JoZjhFWjJiazdD?=
 =?utf-8?B?eGRrcGJPQ1lxYTcrRTMyeVlnSlIvRU5KcjR2YlBmL2h0aVoxZmp4NlhmaDBi?=
 =?utf-8?B?UXljTnd6UE95aDFScGpNakFrcmYxUVZTdW5nNjVBWjBNL3ZRUE5MUmlMYXhy?=
 =?utf-8?B?emc4VXVhSFk4YkxQYmJXVUk0ZFNxcjZPL2JpWkJSVDVoY3ZrRThDdjNnQnY1?=
 =?utf-8?B?UTl5MURyWXVZWjhRSkVmcTd2a3VtSk9rT241M1VHM3Q3KzZVMTZJSmpONzNt?=
 =?utf-8?B?RHJyNEpKTmtlSXVRbjJES093by9OcEtGTytEK3JZejlIeVpoaW9USlExSUZY?=
 =?utf-8?B?MEFoRjIzV0ZXYXZYU1o5c0tVNjN2Tml3SnMzbTMvRC9NWEN2U2dVejFxVGpu?=
 =?utf-8?B?NW4yZmk3ajRuSWR4OHhENkxpVjhzUHRLQ1psaTcrODhvekJjRDk1U0diQ1Vm?=
 =?utf-8?B?T3FnWUNKZnN1a2lsb29HYzVRUmdZcEpmZWIwZmlnWWJQbXgrUnJTalNqK2tm?=
 =?utf-8?B?dlZ0Ry9GQk1TNmJjUWM3L3JKcjhnWG16WGJSMVNhdkZ3OWFuY3BPQXNGRHhR?=
 =?utf-8?B?NHNxRDI5TG9SODJuZFJ4SXJPeDNSZjRUM3M5NVdDWFJvTUlUYzh6SXBHNk9L?=
 =?utf-8?B?ZHlGZUhmT0hKNHFFVU4zd3BOT1lndWJ3M0kzSENJQi9mVFBNRFBscnk3QVBk?=
 =?utf-8?B?S25iK2NsZkJQc1Z5YVFHd3FIVDExM0pIbXRydzVqaitZayt3RisxOGtYSDhX?=
 =?utf-8?B?MGVacTlEc1hOS3p3UEZNS21kSHFBcWlsR3A5ZTF6OE1VN25pK1N3VXE1UE9O?=
 =?utf-8?B?YXR1RXAzZy9SaDNvTkhGTmRwSzNPbGkyZ2ZQem5aQmJwTElvSlp5d0MwRXlK?=
 =?utf-8?B?U0hIUmk5WTJ3KzR1Qkc5U2h0MmlaZFhaUm1WbTFld082UDhYb3o3LzRYblda?=
 =?utf-8?B?ajlBcEEzM3RmZDcyalNKVUFLUDNwNGovMkw1c2Z2UW14L2ZxRjN0VXRwd1I3?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d847b379-1969-4f3b-d5ac-08dd6095eca7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 12:11:59.6694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dF6FhIwuFqm1EtawOrGElWcH8duFrrPHEIY8/HN0ohxXwks+tYNovm+zzk8T3NiHq9oJHAYG0OcIcbixdVIXDnlUBZVfzbFJY0ErkoHHZxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8029
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


On 3/4/2025 3:58 PM, Nemesa Garg wrote:
> Once the casf_compute config is called then the
> strength and win_size bit of sharpness ctl register
> will be set. Read back the bits in get_config.
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_casf.c    | 11 +++++++
>   drivers/gpu/drm/i915/display/intel_display.c |  4 +++
>   drivers/gpu/drm/i915/display/skl_scaler.c    | 32 +++++++++++++++-----
>   3 files changed, 40 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> index 1d9196c4d22f..9f14418dc3c9 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.c
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -97,6 +97,17 @@ static void intel_casf_compute_win_size(struct intel_crtc_state *crtc_state)
>   
>   int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
>   {
> +	struct intel_display *display = to_intel_display(crtc_state);
> +
> +	if (!HAS_CASF(display))
> +		return 0;
> +
> +	if (crtc_state->uapi.sharpness_strength == 0) {
> +		crtc_state->hw.casf_params.casf_enable = false;
> +		crtc_state->hw.casf_params.strength = 0;
> +		return 0;
> +	}
> +

All this can be part of the patch#3.


Then this function will be just calling the compute config and get 
config part.

Also the subject can be improved as the patch is calling compute_config 
and get_config for sharpening feature.

Regards,

Ankit


>   	crtc_state->hw.casf_params.casf_enable = true;
>   
>   	/*
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 03acf01cac75..a2fb68c7cf7a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -4267,6 +4267,10 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
>   			return ret;
>   	}
>   
> +	ret = intel_casf_compute_config(crtc_state);
> +	if (ret)
> +		return ret;
> +
>   	if (DISPLAY_VER(dev_priv) >= 9 ||
>   	    IS_BROADWELL(dev_priv) || IS_HASWELL(dev_priv)) {
>   		ret = hsw_compute_linetime_wm(state, crtc);
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
> index 93a847c05535..79b6749c157e 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -957,23 +957,41 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
>   
>   	/* find scaler attached to this pipe */
>   	for (i = 0; i < crtc->num_scalers; i++) {
> -		u32 ctl, pos, size;
> +		u32 ctl, pos, size, sharp;
>   
>   		ctl = intel_de_read(display, SKL_PS_CTRL(crtc->pipe, i));
>   		if ((ctl & (PS_SCALER_EN | PS_BINDING_MASK)) != (PS_SCALER_EN | PS_BINDING_PIPE))
>   			continue;
>   
>   		id = i;
> -		crtc_state->pch_pfit.enabled = true;
> +
> +		if (HAS_CASF(display) && id == 1) {
> +			sharp = intel_de_read(display, SHARPNESS_CTL(crtc->pipe));
> +			if (sharp & FILTER_EN) {
> +				if (drm_WARN_ON(display->drm,
> +						REG_FIELD_GET(FILTER_STRENGTH_MASK, sharp) < 16))
> +					crtc_state->hw.casf_params.strength = 0;
> +				else
> +					crtc_state->hw.casf_params.strength =
> +						REG_FIELD_GET(FILTER_STRENGTH_MASK, sharp) - 16;
> +				crtc_state->hw.casf_params.casf_enable = true;
> +				crtc_state->hw.casf_params.win_size =
> +					REG_FIELD_GET(FILTER_SIZE_MASK, sharp);
> +			}
> +		}
> +
> +		if (!crtc_state->hw.casf_params.casf_enable)
> +			crtc_state->pch_pfit.enabled = true;
>   
>   		pos = intel_de_read(display, SKL_PS_WIN_POS(crtc->pipe, i));
>   		size = intel_de_read(display, SKL_PS_WIN_SZ(crtc->pipe, i));
>   
> -		drm_rect_init(&crtc_state->pch_pfit.dst,
> -			      REG_FIELD_GET(PS_WIN_XPOS_MASK, pos),
> -			      REG_FIELD_GET(PS_WIN_YPOS_MASK, pos),
> -			      REG_FIELD_GET(PS_WIN_XSIZE_MASK, size),
> -			      REG_FIELD_GET(PS_WIN_YSIZE_MASK, size));
> +		if (!crtc_state->hw.casf_params.casf_enable)
> +			drm_rect_init(&crtc_state->pch_pfit.dst,
> +				      REG_FIELD_GET(PS_WIN_XPOS_MASK, pos),
> +				      REG_FIELD_GET(PS_WIN_YPOS_MASK, pos),
> +				      REG_FIELD_GET(PS_WIN_XSIZE_MASK, size),
> +				      REG_FIELD_GET(PS_WIN_YSIZE_MASK, size));
>   
>   		scaler_state->scalers[i].in_use = true;
>   		break;
