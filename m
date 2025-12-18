Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4D8CCB4F7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 11:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5FF10EC8E;
	Thu, 18 Dec 2025 10:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M9Y7UwWx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A4A10ECC8;
 Thu, 18 Dec 2025 10:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766052613; x=1797588613;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0UoNwaxjdaK4DKNKCzWAsKGcpsmtzbUVe8WfLjs0HXY=;
 b=M9Y7UwWx7Sdz3mU5hgKvLGhj8o595/VjD3jI+8GOZfSn6S2hr+zipjCj
 UOD5nbk7k81MgEQ6Ad9LcRZ++ZPfpTNboHpL24zjV/DQoWB7fWvl49lfr
 F5/e4fsxyyQLr22lSYFWoj/gtrNPNNChC32Mf9BDwa2L/E9bPdMJdswG/
 K8dOaptcAp86/oCAFnkdQC0kejTu5u7iBf5QTqhhrTheIq+2c3JUGGoDp
 +H7TtJis2BZqtFCQsScAI7B3FFss4OkkYaYNxuxeki5pkGYMhS0XY+k+o
 uwZyppGSrTppuAPJC6p9dQSBxh/GSqJUivjtM1N+aVCTzrWhWx1kyJ6U9 g==;
X-CSE-ConnectionGUID: ZC+pMLLySzS2oKL1QsItMw==
X-CSE-MsgGUID: 51/DuhLZQ/eggbAkS6BhGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="71856337"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="71856337"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:10:13 -0800
X-CSE-ConnectionGUID: nLTwhc+RSt2vqJCmiBHK/w==
X-CSE-MsgGUID: opvBwShvTe2mNPMRDS9BIA==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:10:12 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 02:10:12 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 02:10:12 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 02:10:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L03X1kqPybAd5qkcK6nZGT38qJwvWzguJ8hAi+p4aBZjNs1pjs7iDo7yphpFAvG5gKO4lgy6AyXu2QCLAOLHzLMDkfTZrNpzZW9bfge1O9voXlFVuGC3z02Q7S1egYywfqGrBwR33Bzor3a2surR/mb/aHxafE6W9mM46up9DwlabqDwK8o4hcU8+oVoep+z5DabPqU+Qxa+g9kSlUiiVOWL15eYy2pgDZVQGsX56xtrUZJU9HS1R1FXioYJyCTjdUqQXC1yxmBfSHNowTYkIg6j+6xUzcj9Z+sMjf5ML1PrMlOpzWbPnyE9+LZ9Ttn46qkQtu4sebYoO7EVhSMVmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onDpUtAVCG1wXDSe6MVfrIKqXfuH58t9ntgbF/57Ut0=;
 b=ZDL+4rZ4bIUREd6VtVrGPidrjTGJPiSLaX+WcTWUJ8ekbwcprWZt20UfWu5FWzGsHi9OYJQFkNZVr+KeJ/OTd8vJ/pOVLsUNRDJPKs+E2vjoNocnuHzUGc30BS7ANqI02hUKP3M27tfZf4eI++GXwZgrd6K2cAnrktLyYnqjk1O+k+kZedOIozJnkQtR77Tp3jWFS1vuhRbyDUwvJRJt5y4ygN9j3nNBNq67RZ5Q/ixnDXiPq9M689WaW2DHNf9pqFr9U1BYmJ2tusZ6XU3jHlVDpoHT6l4mPmT2eYTc3/26f9Fd21Sw2aDaXWIEUy91t2K2+yEyNrsuBeFAXuuE0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH3PPF67C992ECC.namprd11.prod.outlook.com
 (2603:10b6:518:1::d28) by SN7PR11MB7666.namprd11.prod.outlook.com
 (2603:10b6:806:34b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 10:10:05 +0000
Received: from PH3PPF67C992ECC.namprd11.prod.outlook.com
 ([fe80::d4f7:82d0:1ef9:7913]) by PH3PPF67C992ECC.namprd11.prod.outlook.com
 ([fe80::d4f7:82d0:1ef9:7913%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 10:10:05 +0000
Message-ID: <44ea6522-45d9-4eb7-b6c6-2656040b885e@intel.com>
Date: Thu, 18 Dec 2025 15:39:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gpusvm: Assign maintainers to the DRM GPUSVM helpers
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, David Airlie
 <airlied@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Felix Kuehling
 <felix.kuehling@amd.com>, Alistair Popple <apopple@nvidia.com>, "Dri
 Development Mailing List" <dri-devel@lists.freedesktop.org>
References: <20251216092800.199824-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20251216092800.199824-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::23) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF67C992ECC:EE_|SN7PR11MB7666:EE_
X-MS-Office365-Filtering-Correlation-Id: b93cd519-f1dd-4d05-459e-08de3e1d9c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|13003099007|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2lXSmVWNDJ6cEQwalVGQkpsWmpZaE02OFZzMUhzMXZWd1pUODBpZlhVL21w?=
 =?utf-8?B?M2xVODdzUEc0SmE1d2lURDduV2xET0k2WVlMNmI2ZVluNVVMOTgwQU1qWHRR?=
 =?utf-8?B?K2lYWDBlRmxXeDZLMWtXdy8xVitHd3lOb2o1cGdsYXNDQ1EwdUpPaU5hNWt3?=
 =?utf-8?B?aHNwTE1hS0ZvZzdZTm5TaFJldVhkTmd3QnVNTVRLbGNwQ01iMDRxUlQ5ZDND?=
 =?utf-8?B?OWRRQ3Fhb2wxMFQ0QVozOUo4U3RieHVkbHFpTmxEa0ZPL0VQeFFkY0oveGov?=
 =?utf-8?B?a2RWb2V3Y1FIWFd2SUNCWU03T0pKeFFjWEMrY2E1c1JVcFllTGZ4NDJKQWU1?=
 =?utf-8?B?NGxGTTJvN1JWVm9QYk4wLzllMlN4ZGhVODRGMFk0dDJIOHluNmdyM0NQMmxU?=
 =?utf-8?B?bmZZSGhLM3BhUHlTUlI2R2o5NlZmUEtrZGpreWRESzFPNFNkcmNLc1AzcE5K?=
 =?utf-8?B?UzlTSmlvdU1zVHgwVXIrR3k0eUlKcjdpbEwwWGJobmRBdnU5NmdYaEtkRDd6?=
 =?utf-8?B?dENTK0MwNVpuZkZKMjdxWE5reThmd2FKMEg0MG0reTNOSThsZ2RFNElJRzRk?=
 =?utf-8?B?RFpXWWpxNlhyNEswWWdkRm5pbWdxazIxNW9Mb3VDVjcyeE9SZHFHNTlqNzRp?=
 =?utf-8?B?dGlqZjhsVGROM3BKbDd6QVMwdmV5Y3l1dnJLV3Vtd2NtYlFMSFJXYmZGRWx3?=
 =?utf-8?B?OUFuTkhoUnhKZC9kUHVDYUF6d1lpYXY5ZlU3R1dVdTM0MzFML01IQk9LaDJZ?=
 =?utf-8?B?L1lBYmYwUkhqc2dQUWJKZUlwNXVyOCs1Q1dTQWFtTFpOR1lIY3NLMkF5dkgz?=
 =?utf-8?B?bDZ2K0ZreWx2dTRsNXMwNmdUYmFCTU1JTEQ2dDVWYlJ1MFVXVXlPL0hVK3J1?=
 =?utf-8?B?TTMyQkkxaEVRSkJpS2prV2l4Y2IwYnNRcEhyNHVoUkxINnhVSzJJb24ra1di?=
 =?utf-8?B?blNGK0g4Z09HQ09Kc3U1d0llaGJZV0ljVlJqdUZDVmJDWTFJQUJsWXBXRUpD?=
 =?utf-8?B?RG5heWRHbjRMbDNZSUlOSDVUL1A5R010bmlqWlY4STEvVWFvOStnTC9nZjRq?=
 =?utf-8?B?K2UrVXNvTUk2eUxjSG5wMlViU3hacVI4NmpURDBrUzVlRlBNWVNxeEgwUW1k?=
 =?utf-8?B?cjlsQXN5Q21HVkJSK2ljU3Z4Ly96RHQzTkFydGxxdFRyOVN4UFZUeGpYYUNY?=
 =?utf-8?B?MlNZK1kwYS9PaEpBVVZvNFFxdC84OVp3eWtWampXN1VDSjg5cWhZWEEvc2lx?=
 =?utf-8?B?L2V4b29vSzV5U3dlSFdqMTlpNnl3cTRrUkhkT20zd0cwaFhqUVFxamNSNFVZ?=
 =?utf-8?B?QnFQcERRZU9yZ1Z0TVdmS1hxdDlnWG42c2c1eXJxdSs0YXZNMmcvc2lkZTVF?=
 =?utf-8?B?MVNsWnZqVGMyQXkyR2FtdzVYWXFMNDdDK1BBWDhBNXFzNi8veDdOMDh3YmND?=
 =?utf-8?B?ZjFCVTNnbmk0UGxMTmVMSkJSZ0JMcDdaZkNvU1IrTElwa0xiVG1pbHY2Y01W?=
 =?utf-8?B?R0svK1VmdFpPOWNmVmF1WHlPc0VnejEvb1lrV3lodnlTV3dpd3RWbThBMFVZ?=
 =?utf-8?B?U0wrY2JoVzRWSTBZNC95cDRFaFBHTnlHWnZSU2lEdE13QlN1dGxNUWpzYTE1?=
 =?utf-8?B?d1VsdEdiS29OWVFrWXdPc3p0eGJKU3hYVXYyU2kxbHVIQnFpRGFEL2tHUTZq?=
 =?utf-8?B?R0w1NGFoSTN0SzAwZWpTM3dlM08xNnBuMEJHZ3pnSGhBR2xEY3NGblNQSjhU?=
 =?utf-8?B?N2RIa1pWQytMYXhVQW9LVlFCMWg5aFkrV0tjYXJlaE9XMEZUUW8rdzRMMVJZ?=
 =?utf-8?B?NVJoYTE0SFhMUzNSekgraXVHemxvcmJxODhkNlJSSjA0bW5tbHJ4S25HN1BL?=
 =?utf-8?B?L3dTOU1lN09ycDVxTk1HRlNGczNVdExVU2JtcUEvYWw5R3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPF67C992ECC.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFZxeWVtN2h5czJrcXpBNHlCK1NqVUZvQW5hb1RtV0I1M0ZJY3hRNHBSK1Nt?=
 =?utf-8?B?akd0ZmEvY004dVhYVUMwblR1MUNKQVZQNmplZGtsUnpjdzJoSzYwZTd4cXhx?=
 =?utf-8?B?b3JSYzNpYnR3aGsvV2pNeGZBeXB6cVNvbmRwNXFOVWliZFlQWjRmYzNqOVNy?=
 =?utf-8?B?YnNFV1dvYU14YndNcU1QTEl0eStBQ3VCK2tqeklBcEF5cENxTUhqdlBrb0t0?=
 =?utf-8?B?YVVycG1VSFlFWWVlMU1mSkNBdWxObmhUd1o2eGgwNmc2SFhqOUx2dkdHUnV5?=
 =?utf-8?B?Rm1IQVo0VW15WDM1N3hVNTUrVTdKTkplakhBejhlS0lJL2ZNR0UrVzMzRkhS?=
 =?utf-8?B?VHZudmx3VVZObGw5WkNISFZJZTBwa2xZeUJXS1NUZUYzWnc3U3h2eS9kTmtE?=
 =?utf-8?B?ZGFjRS95dENYZHcybjE1bW00cmlCcUQ3YWM4VlAyTTdxdHlqMllVOXZRMHhQ?=
 =?utf-8?B?RS9DdHQvSjdma3Joem5Kc0k5THBGYW9qcWV3Zkh3S25hTWV0MGMxVThmR05F?=
 =?utf-8?B?bndEQ3poR1Uxa0g5eEtHaC9BTVlEMzNxRFp0bWhaWkRrOEVHb3poS1F3QzRC?=
 =?utf-8?B?TmpOZFBPV3BMQklSNGhrZnlFaHByd0M5SFkxTDN0NUhpTFoxd254NDl0NlMw?=
 =?utf-8?B?cWEyQmM1SzQzc2ZpTldqQzQvNGNuZTRMaW0wa0kzZktSYm5oMTlZUUkydElI?=
 =?utf-8?B?NXlkSWtWbFJ0U25wN1FrT0g2ZUlzZmU0MGV1eXdkdEtoSHhMQzdTaFZCQk54?=
 =?utf-8?B?VFZORGtTN1o0V1dVK25udmxlaXJTSFpHYlFGcHdEdVdTUWowc1Y3cVVBR1Mz?=
 =?utf-8?B?T0hNckhTM2JTa1d1RjEwTm4zSVI0NG9XcndkamRoRmFxcC9pcklOamhIZWlW?=
 =?utf-8?B?YWw4dEtHdEIrTEFOck1UVHRJazVXVExmcG82ODVvYkY0d2hZNnpEVzM0c2RX?=
 =?utf-8?B?QXUwRmllWmFOWUdpYk95WDdNVmJoa01hVWhVK2pjTm8xZkRzOFh4K3l0SzhR?=
 =?utf-8?B?R0VyOXk3Y0wvZklVRXhvdFFFZlI3WDFSZDFHS3k4ak9HSmVCcytleU9LZEUw?=
 =?utf-8?B?WVNYbllFT2NZcndKUWFvaUlDRWd4K05BU0orMEloYjFUaWRtVVhpaHN5MkRH?=
 =?utf-8?B?U3I2VTFhdklXMFNlcHhaMG5qRHB5alp0MmRDOHA2d3A2aGN0L0hocFYydEZa?=
 =?utf-8?B?NU9CaW82dHBxWEhZRzBFVldZem0xalFKN25DcGoxREsyNmNXVEpPcmw2dFI2?=
 =?utf-8?B?ZUxySENaL0hNa093dWs3aUFwMDFiK2M5UFd2YXF2R1VTSk8reFcrSDFlWUxW?=
 =?utf-8?B?SGcvVFZIVUg0cFByTUFxbUp3SlRPOWVyT2N3c1pEWjhPenhFUFBjZzlRMlhQ?=
 =?utf-8?B?a0kwT2EzSlhyTlRhVDYreEROcmhjbkhwQzVOZklVblNTOFFlV2MveDJlbDI1?=
 =?utf-8?B?ZHVpMFZvcWNjdXl2YXhHdUJVQ2h2UktKeXhYTEVQTU5PYjk0WVhMM1V2N29G?=
 =?utf-8?B?Zll3SGRlRXdTN1QyZ05LeW5CdVdJdUNjU0Z4Z2toZC95UVowVnNDeDJnUzgz?=
 =?utf-8?B?RkJqRU5Iclg1UDRiVFVGY0pYSW91T1Q1VTF0Vmk1Vk9zYytGRjFMbytvTGJZ?=
 =?utf-8?B?OXBjZS9uV0l0NWhvK2JWVlgyT0ZxZVRJUWZOSjJ4cXd6L0lwWm5YU1R1UE5v?=
 =?utf-8?B?SlBucWlFczIxaFRYZGlxQTVMcFUxeEVXNUE1VFhvWEJLcFE4VEh4OU83bXRN?=
 =?utf-8?B?Zm1YNTJSc293MThiTVk3K3F4VUFYYkwvMlllZE9yamU0YnhOZ0JxWFNjNTNT?=
 =?utf-8?B?NUsvTElSVmFFV2grTS92b0V4VTdwMnRNOHVNaEFIRDQ3ZGJib3JNNTBIaUk0?=
 =?utf-8?B?amtHRCtmbDIzbmFDa3l3dGF0OCt3VW5nQTBQbVV6Y2Q4emdnT2hlM01rb3dH?=
 =?utf-8?B?QjMrVVN3UTh5bXlvWitUMWxieFZSOWFSR1E4L2lEZXVvY2F2WnAydUlUREJX?=
 =?utf-8?B?d01JL0ErS0gwOHdsenIwaHFHS3BEN0tNVUJlRXp4MXM3OUlGUWNZcldhMFZC?=
 =?utf-8?B?L1VkRS9MMnBYenRIeUFjMkxkd293WnJERXJqU0FDcDRwZVpYQzAwZzc1ZzlN?=
 =?utf-8?B?V21LS2ZOOFp6ZmtPckZhT1pmeGY5aDJKUDdQejFsdHV3Y21uZ0JtYlhHekVu?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b93cd519-f1dd-4d05-459e-08de3e1d9c91
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 10:10:04.9274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c04gMC+iFM8V3dhIdtltQ8NlNx2DA8Ip+JOUzloEHCnC9hdjP+OtloVY/IsE/vAPPm/0BEsPLC0jMr+LFNFRbwlCJ1rkYaPJ+TZSPtW8AjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7666
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



On 16-12-2025 14:58, Thomas Hellström wrote:
> Document maintainers and reviewers of the DRM GPUSVM helpers
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: David Airlie <airlied@redhat.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Felix Kuehling <felix.kuehling@amd.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Dri Development Mailing List <dri-devel@lists.freedesktop.org>

Acked-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   MAINTAINERS | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dd2970833dff..f6353315f216 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8714,6 +8714,18 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	drivers/gpu/drm/drm_gpuvm.c
>   F:	include/drm/drm_gpuvm.h
>   
> +DRM GPUSVM
> +M:	Matthew Brost <matthew.brost@intel.com>
> +R:	Thomas Hellström <thomas.hellstrom@linux.intel.com>
> +R:	Ghimiray Himal Prasad <himal.prasad.ghimiray@intel.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	drivers/gpu/drm/drm_gpusvm.c
> +F:	drivers/gpu/drm/drm_pagemap.c
> +F:	include/drm/drm_gpusvm.h
> +F:	include/drm/drm_pagemap.h
> +
>   DRM LOG
>   M:	Jocelyn Falempe <jfalempe@redhat.com>
>   M:	Javier Martinez Canillas <javierm@redhat.com>

