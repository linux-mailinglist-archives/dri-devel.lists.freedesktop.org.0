Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E224FC12560
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 01:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD0E10E009;
	Tue, 28 Oct 2025 00:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gTCZSRoC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E6010E009;
 Tue, 28 Oct 2025 00:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761612694; x=1793148694;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Q8JIR8s5kxHLchA07az5WPQm84bRJUI3tZff+uicnyE=;
 b=gTCZSRoCHh7kqjrrhcprhHASz4kYa9d+Aku3fI6grE9wZ72Z+rvZypmz
 HOBtfIPo2u5Z6WG/in/Sq/KjpRB8657anIzTWn8ulTSn0acJrkRuKSD8k
 lV4N/biw8LSd6nV0d+GYfZEJ2wlxm0QJdjlAOaFk/eINwfOFH09QaBxsi
 HowTyRJkkgsJoQqYlynxZxHlQKRRRjpE4ic3u85tU+C0fWFrR/7sVOFvL
 G9/fyB1HBF4ztVNWh60DGiXpeHZ1z3lvFN7c2XYIZWS3jWEZfOwSdz3cC
 f4knQUSgYUKSDZdAXNCRXVn5MkjljglV7eogyef9GRGqokydzSQugO3mL A==;
X-CSE-ConnectionGUID: FOq2DkNOQWmcI3GD7yezOQ==
X-CSE-MsgGUID: q1BAMqajSIuAbSwYc1QPRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51279710"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="51279710"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 17:51:34 -0700
X-CSE-ConnectionGUID: UcgOMfMOSU6Ik0XBChTd3g==
X-CSE-MsgGUID: aMnfmrZ9RxCAxGubNNaI9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="190398766"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 17:51:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 17:51:32 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 17:51:32 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 17:51:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pomKS2Mu25w+muoTtkzgwijtbSgQCDcDnVfh8T93qHLAhSLA+PwCl8jq9TpSSQUIgzepYlbIfRpp+OCutLVP9RCiEEq4Qig4Yy8Vt9aXboy48ph5Wk2DiUTFPFqimFVwc5+PsDWNEjPce+cfSiCErcBri/QUbYlE4zlfGacYzgCUKHJevorB11X8VNKYfVUfpokFvQxKClBSMJLQip9edoJZshIXb+qo8QkuaUsW2pRhmkFK6icccfIpFfbRhZVGbI6L4XMw8Bk9j5ebNOtbb8X+qqIzuha0hJZFN/t4t7V/CqQ3lvt6c8Tbw8w7eiVgr/0eZlzAGs2hAVq0EJEAcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcwYEM6e0Amt2Iaxv0/wFOoxkwtoS9bfd1zYkXrpDtc=;
 b=Fp+Dfvi3jr8zh6+2RtJJPL7v6ea8D3VTEbImTgRLpmN7GKxAO+urUIsi5ad5OBWFlB77Fr/zro6I+P8ui/L6FzIKvDs8ckgqwwdOPVecz4EPrYqy6AccDtSI56fahDWT4MdvkvADUBUqfgcNfG9NtKlx6TpWjkUgIoolDUZnhbuF83afGaMeLrUc/kVbZMWW/3FDcivr2tyjFhJEAhWky3UKpPqpTb+98u3mc2vmMgvfV8vKhPSWYDRtIUay7/aq+s9/4qTlEPBjzo9sa8E37xDOpUnV61b5gcdzluQWAjPiY10li8iXOPer1no0sDku50X52bJQaoWOHehb4C1j1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8811.namprd11.prod.outlook.com (2603:10b6:806:467::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 00:51:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 00:51:24 +0000
Date: Mon, 27 Oct 2025 17:51:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 12/15] drm/xe/uapi: Extend the madvise functionality to
 support foreign pagemap placement for svm
Message-ID: <aQATic22rh2DWJhZ@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-13-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025120412.12262-13-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:303:2b::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: c1f3c49f-cc22-4c21-3751-08de15bc1eb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUJqNUgvK2lrRnBDZmZOaThWbHdIMWZtclFRZVFjMW16M2w3SDJlOURLRkE5?=
 =?utf-8?B?L3gvN2d2M2ZzUm5aTHFVRjk2OWh2UXdhVEhMdFpOd09hcXZzcTJxNDZVdWIz?=
 =?utf-8?B?dmRCR01YWmhPOWkxSnVOa1BjTHZDTmxaY0xyVDgzU1RqaUJPQUY5Q29heTdD?=
 =?utf-8?B?akMzekYvMUFFSmdxQjdFNktKWHhZdnFGdWtnTHB4a1Z2eWhQODVhRGxIU3ZD?=
 =?utf-8?B?NlhjcFdnR0l0RDMrNFdQV0twM1NzcGQrT3RnQkpVWEd4WXA4aDVkRUkrc1pM?=
 =?utf-8?B?WHlReWN2SUZsc3oyQ3d2T1lPOGJ5U0lqMlBXWDR3YzJnRFVUVHV0bHJCZlg3?=
 =?utf-8?B?Z3pLNWVab2txU21zQmlVTGFjeTBmU2VzVEltb3lEQmg5UkpPS21KTlBPSHI1?=
 =?utf-8?B?QWZxU3lKaytnTjhpZlhIYjVTMlcwTllJS1NHSEJtajBibU9zVkxiUlI1OFVO?=
 =?utf-8?B?WHliaElXdE5rMXV4OWQxU0pONnFFVGsrRGIyOEk1ZHlDWXAvTTArNWM2ck9P?=
 =?utf-8?B?M0JKTUgwa2hoczh6TkpUay96MitHRytmNVlaVGVqUkh3OHBwaUZqOWRBeXhB?=
 =?utf-8?B?YmNxTTBDL3NLSWtoUi95bWVUdE11MjNWV2Z6RkN3azNCb0xVSWp0NEZTTWhQ?=
 =?utf-8?B?Ung2OFFuZ3JOUFBmam4yZnptOFN1MHJnWnRxWDBmY0hJNHY1WGFLWU4wYkM3?=
 =?utf-8?B?M3AvVCtRcW5IaEJ3SUNSR0thaUd2cWJUMmsxM3dTQmp1eEswTHFhU0xTK1hm?=
 =?utf-8?B?WXVqZTNIVHZTM1F5bTRhelhKKzliR3BWSUozL3ZYRlB1Y3c2cjVZWUZYYkF6?=
 =?utf-8?B?cDlINGNYbTdhZS9EL1dnNXdxMTkxUGNpUzlRSUFxczRGa3JUSWhld3ZrK0Fr?=
 =?utf-8?B?UGR4ODd5ak1sdjdzeG5rRlMrU21BdGh4L3BQTmtPYzNCczV4bndMcUpCSEhP?=
 =?utf-8?B?Q3hWOHRKZmNhdVVkc0V5QndDZWljQjJIZVRkREZVMEE0bFZJU0NKV05RSy9L?=
 =?utf-8?B?ZjhxSDIyUXN1YXkrVEZrTGJIM051d25QNlVlWEFWcVpLTHVSWDMvN3lZUG1G?=
 =?utf-8?B?dmNrbnNtNm1NZXFvYjdyRCtFcHpoMlArK0VhY1NMUmZZa2dLcy9aSjN5S0lE?=
 =?utf-8?B?enRCZ0FkUDEzRys1VHFYaG83b1VPOGNSOC9reGNKOC9zbVNiVzBuQmlnQTBU?=
 =?utf-8?B?Y3QwRFpUU2hXRjV0VXFQYWJMQUFqOHhRazhpeTBnUEh4R2JtU2FMMTZDdHZi?=
 =?utf-8?B?Z0NaTk5WTnJKaDF2c21QZ1NXVkZNMlFvYUI3L0ZiYmxtbThLSXRLMWpNNng5?=
 =?utf-8?B?eGFPUHVrTVgySFRNd2NsYzZsRnZyOUlXdVdFbWtYdEFvWnRYMUZSdXY2NEkx?=
 =?utf-8?B?UENEcmJxOE5qOHZ6OCs0TDZ4OG5yVXZLZXhEMktnRDA5MUNHZFMxeTZ4ZDFz?=
 =?utf-8?B?Uk5KZ0JjQUxZUm40eEpNVU9JQTE2bDNFVzFTOHhBSE55M285NWVXK0NEcGx3?=
 =?utf-8?B?eC9rcDdmMXJ3Y2M1Y0NUNGhUNjh6bExZRlV4OHJpaVJmZDE1WmRUS1p3aDdU?=
 =?utf-8?B?QmI3emM2M04zWEFtOW9MYjBpQ0tWa3BUM3ZnQy80cU5FWnVVZWYweE0za202?=
 =?utf-8?B?YTNnUWJmdHZZWXhjbnA5YThkM0taYjh4TUtlSE9GampNUTdHZ0REeHd0cits?=
 =?utf-8?B?SkExUHpKcE81WUdXNDVWMUZNcjlKaklnQ3F5VnBtcFQ4VzkrbFQrMXJUUzY3?=
 =?utf-8?B?K05TcUhWbXZkTXVFUHRIUFd0bTZKRllnWk9Obk85Z0RjMWpUQllPcDl1TGla?=
 =?utf-8?B?K0ZVdUl6aVEwY1N3VlVUV0VRUGNudFdtVkY4R3loRnhyUjRzTGR5OTJhN1da?=
 =?utf-8?B?WE1Ic2tuRHlzaWZGQkRSeDZ4VjlVYnJ1SEIrMGZrK0JxNW0wVThkUlRFQUVz?=
 =?utf-8?Q?aTUWS+lYVk344+PtTY81T06uxFPF8pAq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjdrVDF5ckdwYTdnYWtzKzdZTlpyemxLUG9lTm94dGxXWDFad1U0Ny9NOU5r?=
 =?utf-8?B?OTN6dmlPWGUxc0FnL1ZoTXRkOUpWS3NJZms1QitzQzYrVmdZVjFZdTU1MTlB?=
 =?utf-8?B?QzZYTmN0MFNJUG9TOW9zZFEvNEkyZGloQllDNmt6QjE1UmVHRDEzM2J0R0tv?=
 =?utf-8?B?eUsxQ29EYjNHZVR4QXE0Z3dQQWNlM0d4ZkszVGhLeFRacnhwK0hHUnRWbE5R?=
 =?utf-8?B?REVGaTVMaFhSMUI4b0l4VXByendaaGMvbmNQU3RLWnEzcFRzVVRHZ25JaFVU?=
 =?utf-8?B?L1FWN2pYUTB2NG1neWdsNWt1eFpxazdkQTNZM1NiZ3dwamRrNHpLQ1V4WldV?=
 =?utf-8?B?VnJtdkZhQlFiTDcxd05IUWlEbndSRm8zakVNZlVBVDFGSzJ2Nzl0TlMzVlNL?=
 =?utf-8?B?YjNiT0ZEc2VhdlNQU0hlYlg4V0dLcC8zKzJpcjdpNHU1ayt6cjVZZmdQWFFk?=
 =?utf-8?B?YnhneTd3TnBaUlU5MXVSZS9ESGxIKytHMGFRRlVBV2N2YW1mcytWNUJabkRZ?=
 =?utf-8?B?Qnd3T1BSNG0zM2VUWjdDbjhSTk1nRVZSa0hxNWJHVjg0UkFYaER5czI0clU0?=
 =?utf-8?B?L0RHU3VBSWlwNEN0MEpTcGxXQ3FwN2hWRVZXdVRIYXdEZ2Nyd0FSSjgxVTJo?=
 =?utf-8?B?dG1wL2N4bXlwN3FpcDk3OVB1NDBuZWZ5a1dFVGhZU052RGhQSHJVWnN2d2dk?=
 =?utf-8?B?bG90emJuOFd5TE5FazFzR3B6K0x4bU52aWRzYnFpczV4YlJscDZEYk84TTln?=
 =?utf-8?B?Y3lRTmJkeGZoZXNESFIwRVBIRDRxbkpFTzkvQXBDNGxnWGlybmNvZWk4SDFW?=
 =?utf-8?B?aThVV3dRUEo3NHlWRStjeC9iMitaUW9zU2liVVd0dURFSWIvK1RJeUJvc2gr?=
 =?utf-8?B?NnlKT3hkdWE0UmZBM1BPR28zUkJIOGlSd0FsenVUMVUzTmc0L0VGcHZQMVJP?=
 =?utf-8?B?U2J5MHJ1YU1YMVA5NG16L0JwT29FdmJOQkhoS1k5OTVFOGg1WWFnU1N6M1Q1?=
 =?utf-8?B?ZnJGUkhFRHlJT0QyZnd4UEVMdVlWNEZrQ2FxK1VHNkFRWnNFUXlHMjBYV1dn?=
 =?utf-8?B?OUNYcDBsZzVlcmdOWENEK1U5TFRvWDJldi9HL21CUThGUE9YYmNFQjF3cEsx?=
 =?utf-8?B?NTRzK2NFMG5zM2tndzdrVW0rbVVPbHEvdFpqSVJTZ0FCNXp5WmlYL3o2WTd5?=
 =?utf-8?B?cG1iZGgzYmZoWHA0cVdqSkdxMTNpOFVwQmdJTTBWTStVZnR6VEtoUlJDMXlY?=
 =?utf-8?B?NjRvU2NaQnZyVzMydDRyd1JsalFMUHNxa1o0ZFdPellFUWp1bk1TajlXWFVW?=
 =?utf-8?B?VzNaeHlVTDRxL1JqQm5peHVmM2ZOcnEzR2E5RWhBaVVkUEFwOW1CY0g1VE83?=
 =?utf-8?B?WUlNekJIYmFJdkl4eTZLT3NpWGN1NUNiMTQvZjM3OW5PV3FWVy82dThtN0Nr?=
 =?utf-8?B?Nm4vM2hiWURtUG5UMjM5bCtCMDJmZDVydFMzVGJoeEFuaE16dXZoQ1VPTVly?=
 =?utf-8?B?R1RQdnhpWEQ4Ni9uUTBxcFY0R3VMTTNIcnZvSzFQUndkWWpZQ29XekNNRVRU?=
 =?utf-8?B?dVliM2p0SE0wcWJMOG44UGtza3d6dHBxa0dHTHJBcjUzdDIyV2FsWG1ZWkxK?=
 =?utf-8?B?VVF5R0JiWE9MMjhEU1AydG1QNnJTcDBaM2ZVMkRlK3ZqUFE3MkV3TkdDaEZt?=
 =?utf-8?B?SEk1cjRaSFE4bndSLzFmdXJ6TUJJMDRnRmJZTC9wYys1THdlQzRTdkg2Q3VI?=
 =?utf-8?B?czYybkM5VG9XWFJ4SThya1lhMzhqc1FsSmV5eDJTZGcwaEFCNmVZZTIzcW1o?=
 =?utf-8?B?amowYUdEejVjQW1ick11YjR2RkZpQXBLelpkeGdOZEo2VEtTRFAwSjBFOGpo?=
 =?utf-8?B?cEdrMkUwdjl4VzZ0aXRyREU2Sys0cHoyNzhqSC9IU0NVWFBRWUxPcElVWUdV?=
 =?utf-8?B?UTJERkNreUphOWNMbUJFT1IzSmIxYmNpQ0gwWjZQQ21qTWd6dlp4elhwekc3?=
 =?utf-8?B?S1NPcnRlWlhVLzc1cnZFUDRBV1Z0MURLNDFBUlRnZW5IbnhEZ3FPK2k2MHky?=
 =?utf-8?B?ZFA2L0pTbXVxOGwwNDBlWUlmMXRtV1NDQ3gzTW9mMlRVUFJTMnlkYzJvektB?=
 =?utf-8?B?eUZqc0xYNkpqUnBRTnhJTXpvUjlxMkRYNllvMHRnMXNTUlFjUkVEcUlhbEwz?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f3c49f-cc22-4c21-3751-08de15bc1eb8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 00:51:24.8045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YO2wMu2zSdsiS+tQ4iWAN4YRAPtC4L90y0fw9+YfyebgzCB3MdnrgAw8HKNXAm6SI0eo2oF81tyqtjIXC2/pFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8811
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

On Sat, Oct 25, 2025 at 02:04:09PM +0200, Thomas Hellström wrote:
> Use fds to represent pagemaps on foreign or local devices.
> The underlying files are opened at madvise() time and remain open
> as long as there are remaining madvises pointing to the
> foreign pagemap.
> 
> Extend the madvise preferred_location UAPI to support the region
> instance to identify the foreign placement.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c     | 14 ++++++
>  drivers/gpu/drm/xe/xe_device.h     |  2 +
>  drivers/gpu/drm/xe/xe_svm.c        | 73 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_svm.h        |  7 +++
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 72 ++++++++++++++++++++++++-----
>  include/uapi/drm/xe_drm.h          |  4 +-
>  6 files changed, 159 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index ad004aab67ce..1a7502e4fc3e 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -372,6 +372,20 @@ static const struct file_operations xe_driver_fops = {
>  	.fop_flags = FOP_UNSIGNED_OFFSET,
>  };
>  
> +/**
> + * xe_is_xe_file() - Is the file an xe device file?
> + * @file: The file.
> + *
> + * Checks whether the file is opened against
> + * an xe device.
> + *
> + * Return: %true if an xe file, %false if not.
> + */
> +bool xe_is_xe_file(const struct file *file)
> +{
> +	return file->f_op == &xe_driver_fops;
> +}
> +
>  static struct drm_driver driver = {
>  	/* Don't use MTRRs here; the Xserver or userspace app should
>  	 * deal with them for Intel hardware.
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 32cc6323b7f6..475e2245c955 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -195,6 +195,8 @@ void xe_file_put(struct xe_file *xef);
>  
>  int xe_is_injection_active(void);
>  
> +bool xe_is_xe_file(const struct file *file);
> +
>  /*
>   * Occasionally it is seen that the G2H worker starts running after a delay of more than
>   * a second even after being queued and activated by the Linux workqueue subsystem. This
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 36a6ac293e71..9dd96dad2cca 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1763,6 +1763,73 @@ int xe_pagemap_cache_create(struct xe_tile *tile)
>  	return 0;
>  }
>  
> +static struct drm_pagemap *xe_devmem_open(struct xe_device *xe, u32 region_instance)
> +{
> +	u32 tile_id = region_instance - 1;
> +	struct xe_pagemap *xpagemap;
> +	struct xe_vram_region *vr;
> +
> +	if (tile_id >= xe->info.tile_count)
> +		return ERR_PTR(-ENOENT);
> +
> +	if (!((BIT(tile_id) << 1) & xe->info.mem_region_mask))
> +		return ERR_PTR(-ENOENT);
> +
> +	vr = xe_tile_to_vr(&xe->tiles[tile_id]);
> +	xpagemap = xe_pagemap_find_or_create(xe, vr->dpagemap_cache, vr);

This is from a different patch, but I was trying to trace where the
reference drop to the drm_pagemap in xe_madvise_details_fini comes from.
I figured out it was from the function above, but I didn’t see anything
in the kernel documentation for xe_pagemap_find_or_create indicating
that it takes a reference to the drm_pagemap.

I’d suggest adding that for completeness.


> +	if (IS_ERR(xpagemap))
> +		return ERR_CAST(xpagemap);
> +
> +	return &xpagemap->dpagemap;
> +}
> +
> +/**
> + * xe_drm_pagemap_from_fd() - Return a drm_pagemap pointer from a
> + * (file_descriptor, region_instance) pair.
> + * @fd: An fd opened against an xe device.
> + * @region_instance: The region instance representing the device memory
> + * on the opened xe device.
> + *
> + * Opens a struct drm_pagemap pointer on the
> + * indicated device and region_instance.
> + *
> + * Return: A reference-counted struct drm_pagemap pointer on success,
> + * negative error pointer on failure.
> + */
> +struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_instance)
> +{
> +	struct drm_pagemap *dpagemap;
> +	struct file *file;
> +	struct drm_file *fpriv;
> +	struct drm_device *drm;
> +	int idx;
> +
> +	if (fd <= 0)
> +		return ERR_PTR(-EINVAL);
> +
> +	file = fget(fd);
> +	if (!file)
> +		return ERR_PTR(-ENOENT);
> +
> +	if (!xe_is_xe_file(file)) {
> +		dpagemap = ERR_PTR(-ENOENT);
> +		goto out;
> +	}
> +
> +	fpriv = file->private_data;
> +	drm = fpriv->minor->dev;
> +	if (!drm_dev_enter(drm, &idx)) {
> +		dpagemap = ERR_PTR(-ENODEV);
> +		goto out;
> +	}
> +
> +	dpagemap = xe_devmem_open(to_xe_device(drm), region_instance);
> +	drm_dev_exit(idx);
> +out:
> +	fput(file);
> +	return dpagemap;
> +}
> +
>  #else
>  
>  int xe_pagemap_shrinker_create(struct xe_device *xe)
> @@ -1786,6 +1853,12 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
>  {
>  	return NULL;
>  }
> +
> +struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_instance)
> +{
> +	return ERR_PTR(-ENOENT);
> +}
> +
>  #endif
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index c7027facf6e9..7cd7932f56c8 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -187,6 +187,8 @@ int xe_pagemap_shrinker_create(struct xe_device *xe);
>  
>  int xe_pagemap_cache_create(struct xe_tile *tile);
>  
> +struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_instance);
> +
>  #else
>  #include <linux/interval_tree.h>
>  #include "xe_vm.h"
> @@ -378,6 +380,11 @@ static inline int xe_pagemap_cache_create(struct xe_tile *tile)
>  	return 0;
>  }
>  
> +static inline struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_instance)
> +{
> +	return ERR_PTR(-ENOENT);
> +}
> +
>  #define xe_svm_range_has_dma_mapping(...) false
>  #endif /* CONFIG_DRM_XE_GPUSVM */
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index d6f47c8e146d..d03d052fcc44 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -22,6 +22,19 @@ struct xe_vmas_in_madvise_range {
>  	bool has_svm_userptr_vmas;
>  };
>  
> +/**
> + * struct xe_madvise_details - Argument to madvise_funcs
> + * @dpagemap: Reference-counted pointer to a struct drm_pagemap.
> + *
> + * The madvise IOCTL handler may, in addition to the user-space
> + * args, have additional info to pass into the madvise_func that
> + * handles the madvise type. Use a struct_xe_madvise_details
> + * for that and extend the struct as necessary.
> + */
> +struct xe_madvise_details {
> +	struct drm_pagemap *dpagemap;
> +};
> +
>  static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range *madvise_range)
>  {
>  	u64 addr = madvise_range->addr;
> @@ -74,7 +87,8 @@ static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range *madvise_r
>  
>  static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
>  				      struct xe_vma **vmas, int num_vmas,
> -				      struct drm_xe_madvise *op)
> +				      struct drm_xe_madvise *op,
> +				      struct xe_madvise_details *details)
>  {
>  	int i;
>  
> @@ -96,14 +110,18 @@ static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
>  			 * is of no use and can be ignored.
>  			 */
>  			loc->migration_policy = op->preferred_mem_loc.migration_policy;
> +			drm_pagemap_put(loc->dpagemap);
>  			loc->dpagemap = NULL;
> +			if (details->dpagemap)
> +				loc->dpagemap = drm_pagemap_get(details->dpagemap);
>  		}
>  	}
>  }
>  
>  static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>  			   struct xe_vma **vmas, int num_vmas,
> -			   struct drm_xe_madvise *op)
> +			   struct drm_xe_madvise *op,
> +			   struct xe_madvise_details *details)
>  {
>  	struct xe_bo *bo;
>  	int i;
> @@ -144,7 +162,8 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>  
>  static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>  			      struct xe_vma **vmas, int num_vmas,
> -			      struct drm_xe_madvise *op)
> +			      struct drm_xe_madvise *op,
> +			      struct xe_madvise_details *details)
>  {
>  	int i;
>  
> @@ -162,7 +181,8 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>  
>  typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
>  			     struct xe_vma **vmas, int num_vmas,
> -			     struct drm_xe_madvise *op);
> +			     struct drm_xe_madvise *op,
> +			     struct xe_madvise_details *details);
>  
>  static const madvise_func madvise_funcs[] = {
>  	[DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
> @@ -250,9 +270,6 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
>  				     DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES))
>  			return false;
>  
> -		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.pad))
> -			return false;
> -

Should we still reject region_instance if fd <=0 ?

>  		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.reserved))
>  			return false;
>  		break;
> @@ -296,6 +313,31 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
>  	return true;
>  }
>  
> +static int xe_madvise_details_init(struct xe_device *xe, const struct drm_xe_madvise *args,
> +				   struct xe_madvise_details *details)
> +{
> +	memset(details, 0, sizeof(*details));
> +
> +	if (args->type == DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC) {
> +		int fd = args->preferred_mem_loc.devmem_fd;
> +
> +		if (fd <= 0)
> +			return 0;
> +

I think you need to santize 'args->preferred_mem_loc.region_instance'
somewhere and reject 0 (system memory) or xe_devmem_open is blow up as
tile_id will be -1 in that function.

> +		details->dpagemap = xe_drm_pagemap_from_fd(args->preferred_mem_loc.devmem_fd,
> +							   args->preferred_mem_loc.region_instance);

You have local fd varibale here, but don't use it. Should we also have
local region_instance to avoid bigs wraps?

> +		if (XE_IOCTL_DBG(xe, IS_ERR(details->dpagemap)))
> +			return PTR_ERR(details->dpagemap);
> +	}
> +
> +	return 0;
> +}
> +
> +static void xe_madvise_details_fini(struct xe_madvise_details *details)
> +{
> +	drm_pagemap_put(details->dpagemap);
> +}
> +
>  static bool check_bo_args_are_sane(struct xe_vm *vm, struct xe_vma **vmas,
>  				   int num_vmas, u32 atomic_val)
>  {
> @@ -349,6 +391,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  	struct drm_xe_madvise *args = data;
>  	struct xe_vmas_in_madvise_range madvise_range = {.addr = args->start,
>  							 .range =  args->range, };
> +	struct xe_madvise_details details;
>  	struct xe_vm *vm;
>  	struct drm_exec exec;
>  	int err, attr_type;
> @@ -373,13 +416,17 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  		goto unlock_vm;
>  	}
>  
> -	err = xe_vm_alloc_madvise_vma(vm, args->start, args->range);
> +	err = xe_madvise_details_init(xe, args, &details);
>  	if (err)
>  		goto unlock_vm;
>  
> +	err = xe_vm_alloc_madvise_vma(vm, args->start, args->range);
> +	if (err)
> +		goto madv_fini;
> +
>  	err = get_vmas(vm, &madvise_range);
>  	if (err || !madvise_range.num_vmas)
> -		goto unlock_vm;
> +		goto madv_fini;
>  
>  	if (madvise_range.has_bo_vmas) {
>  		if (args->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
> @@ -387,7 +434,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  						    madvise_range.num_vmas,
>  						    args->atomic.val)) {
>  				err = -EINVAL;
> -				goto unlock_vm;
> +				goto madv_fini;
>  			}
>  		}
>  
> @@ -413,7 +460,8 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  	}
>  
>  	attr_type = array_index_nospec(args->type, ARRAY_SIZE(madvise_funcs));
> -	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args);
> +	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args,
> +				 &details);
>  
>  	err = xe_vm_invalidate_madvise_range(vm, args->start, args->start + args->range);
>  
> @@ -425,6 +473,8 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  		drm_exec_fini(&exec);
>  	kfree(madvise_range.vmas);
>  	madvise_range.vmas = NULL;
> +madv_fini:
> +	xe_madvise_details_fini(&details);
>  unlock_vm:
>  	up_write(&vm->lock);
>  put_vm:
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 47853659a705..c79de1019816 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -2079,8 +2079,8 @@ struct drm_xe_madvise {
>  			/** @preferred_mem_loc.migration_policy: Page migration policy */
>  			__u16 migration_policy;
>  
> -			/** @preferred_mem_loc.pad : MBZ */
> -			__u16 pad;
> +			/** @preferred_mem_loc.region_instance : Region instance */
> +			__u16 region_instance;

I'd mention here this field is only relavent if devmem_fd > 0, perhaps a
little more for its usage. Also perhaps system_memory regions are not
allowed (assuming we land on that).

Matt

>  
>  			/** @preferred_mem_loc.reserved : Reserved */
>  			__u64 reserved;
> -- 
> 2.51.0
> 
