Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PcvIsoGhmkRJQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 16:20:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA09FFABF
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 16:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D72210E0C1;
	Fri,  6 Feb 2026 15:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Jdw2KJ9M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012022.outbound.protection.outlook.com
 [40.107.200.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCFD10E0C1
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 15:20:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WEIn9kh8UtGyiCKF47KTp1aiGoMqhoq9kPk+ir7gc8bbo3wVx6M8i8wkLatY9aCuLWDerOoQvczoyKQ5R2bV2NcKLLS5ZQPaXsoHA2B5XWJVcYk4GakvKuZkNTdDqk67vLZjdZPm7/wCnszzbJW7n71ANaZ4xzIcJRSJVv+4svuNToycpjuRnDUNIxze/8MBpe9uLcH5/5fL2DLO0WJlc8p3htfodHvrnQRkij6/pXGoIwY024sc0VacTYH33JFMg68gse1lbNVB8Zf67A2QCvCwijBF4XL0dXSOwii9VV7o0elNYQicyCUEqa6QWpIBvX6zce9nRFlC98hjup7y2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ugv3A81EK3MR/niPRost/GDugJO5X6cYtqEj58OpWk=;
 b=vmzE+weTawl8ZL0+jQK/9ThMRThy3TW3nRWPCEo8iblNAEQPXQuy2IeSllrVndaw/cJSJ36OM3KDzO21p3Zo5hIKaot9CainHD3+OE0FM3fqnF+1n8Vq1RelX9M7wqprtHeIMd1PFdxMNi+RDNkDWf5mW9TO6KjWoMuHqw06OTBqou1sPzJbAUAOhkiuuQHvvAUkH4P6yPMhZVP9oZVzliaJIfE1CFEurnVVNPTPJMMU45VDzzFIofHccfA0w9SUDNzxlA2fmImxy3N1K0lYaIBRMclhvxLMlPK5RHW7v4vDbicILFKu5F3HziS64vkm5/ZUfV4/gbuCxD33YN6nLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ugv3A81EK3MR/niPRost/GDugJO5X6cYtqEj58OpWk=;
 b=Jdw2KJ9MvJj8RVWGoF/IFOEH2dGkt0swCZPfH1WmBXoLOSKcc5pXPaRS6bVG4/V/Y6asKsomLICSFCYgh+bo2CkuBezlt01XoLXffvj2sSplxLGHTH3F9TbMhwaKCpPHAZpdZ6LtgUjrnnX6BsYKNmCUMk88f9BC60Ci8y1hFOU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA0PR12MB7506.namprd12.prod.outlook.com (2603:10b6:208:442::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 15:20:34 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 15:20:34 +0000
Message-ID: <f07f8ed2-aa0d-401b-a6e6-dd55cdcc075e@amd.com>
Date: Fri, 6 Feb 2026 09:20:31 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Remove buffer size check when creating
 command BO
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260206060237.4050492-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260206060237.4050492-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR14CA0038.namprd14.prod.outlook.com
 (2603:10b6:610:56::18) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA0PR12MB7506:EE_
X-MS-Office365-Filtering-Correlation-Id: decb8d3b-d830-45fe-1f6d-08de6593460b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmxZUXdIeGpqSm4xV0pnblVLYmhEakxveStLaFZ3Q0FVdy9vM1owNEgyVHZn?=
 =?utf-8?B?VXVqTkpDZlZDSEs1blppL0w4Sm43TUorcEQzbE5vZFRiUm1sSHNzZ2VyR2tT?=
 =?utf-8?B?ek8rdDgwNEVCVEpmd0dMaXVsbS9peVZ5UG16TGFjWEZla1VtanR1QXVRQlRC?=
 =?utf-8?B?ekJTUmR2K3UxNjlJRWlQQ21wMS9lRmp0cFdweVJQTUloNElkK2xTU0Fnd21V?=
 =?utf-8?B?bG5hSWNqNXdMS2piWFRxOFRSQjdZbGlFQi9FNGl2SVVrZmFkZGtqd1FaVitI?=
 =?utf-8?B?NjdqY1FkVVVsQWVvb3liaHJ1eHJCWG16TENSVjBaZWxVQS90dlh4dmdVTVlo?=
 =?utf-8?B?VjJ0T3ZxYk90VHdpcUh3cktHQWp4VURVeEQxdW93UEM1d3phOU54TWZEYlln?=
 =?utf-8?B?MURFWDd3eURYanVJZmNRVjVBVkRtdzVOVlRhZFNHanNKaENRM3BIbmdmSWFS?=
 =?utf-8?B?dHc4MWJieGNaMFowSUkxeFh3N1AxN2dXVVVZUndzd0FsZkZxZngvVVo3Q3ox?=
 =?utf-8?B?am5mV2VtMGQ4djcvbDdBOEhvcFFPaXA0OFhPSUNFZlFHbFZZeGdhbmFQSXFV?=
 =?utf-8?B?MzhzMmU2TEF1eCtRVmxjYmVkRFZ0TWZnMVlsT1FGbWFLMGV1Q3dFNFBZcXNz?=
 =?utf-8?B?cEs1K0kvUDZIamdOeklSTXNmYlFDMlRRK204d3cxNnNpemtuYkxSK2IyT09K?=
 =?utf-8?B?WVZOUVp6bmxBaGZmR2taZlprWkUvN3A5dHhQV0hDL2ErSTdhTERGYlNEbGFK?=
 =?utf-8?B?Uzllem85ZEx5NVZPTU1tc1pKODJHNVZBa0FPY05nRmsrMXJyWnh5eDFScVAv?=
 =?utf-8?B?dHRtU2J3bmNoT3R0NG1NTWdleTdobXJFSXdNeXhtMXhRYkVwU0R5QTNxU1kz?=
 =?utf-8?B?Q1hpZnpnS2pyRXFFcGF1WWhUa1Y1eXAxaHlZOTdKeExWejcyZHRmVGliZzgv?=
 =?utf-8?B?VEwzdTlUWjBVTW1KUVFJc04veHY1SHRja2FYWk9zdW1BV3EvVnNwZXlSa0FX?=
 =?utf-8?B?dDljSGl1TEZVMkZ1d3VlM2FhdGc4VmhXRFhCRGIwNFNxaHhNQ1B5bkxEZ2pC?=
 =?utf-8?B?SEY4N2hLZU5nTzRnM2VIR1Q4QllhSE96czhmZVlnWndZeG9kdUJ0alR0ZS8v?=
 =?utf-8?B?NHFZQlJhZWNjZkY2bVNCcE45aTl0RXFTMW1XbFQwRVRYY1E5b05MNS9GWVEr?=
 =?utf-8?B?OGRNOUhoUWtwSkRSQjlmR1QzV2FKZGhWTVJlZWN6dlRGaVZLaXdLYktVL0Na?=
 =?utf-8?B?U0xXZXNkM1FCaVlESWdTWEwrbFVUajhFYURXcDBWUGVMa1BCaThXdlNyamNH?=
 =?utf-8?B?anBWQWxpd0grUTAxNHZ4dU4zSGtibEZJRmJCUURPR3R6OFJlRHdDZUFSOEVM?=
 =?utf-8?B?em1pWFdXSmpvbnRQak9TdTRIUVZEdktPV2FPUHdVSTYyY1hBa25UQTNlUzc5?=
 =?utf-8?B?Ris3QS9xZVU1RC95blg0SFA0QW9IY3E0VHl4R3VlcGgzQ3hnRU1ETGhnNFp6?=
 =?utf-8?B?T0JXUTdGMkVXZDlWeFZrZUVkQzc3emFnL3BhNFlkRVovQmZVdVVXWTkxQmVh?=
 =?utf-8?B?RkE5M0QrZ1U0UFlDMzFVNFY4NnpQQ1BzUUZmM3RNZUUxS1Q5cC9ZbzlEYk5E?=
 =?utf-8?B?MVFzMEZ6RUpxa1V4K3puZnMrYUVFelliajlyNXc1M0plT3VjbjNFV0xKajky?=
 =?utf-8?B?Zzh3RGJCSjVReUh2ekFHOEN0cnBJMTVtYXhwSWE3Q0ZaVWphaHBqL25nUVZC?=
 =?utf-8?B?cHhxT3QySVVkcGVOUUJxRnZ6QlUxUmF6a2tpMTlESGpYTXFoODZheHpNaE5T?=
 =?utf-8?B?dVFPK1crRnhXRkFScm5hYWRJZEdUZkpVTzRhdFYzM0tmMjF6UGQ2Yk5aNTVm?=
 =?utf-8?B?Y1hLZHdyVjdJR0lKNWI4bkhwdnJMR2h3cnptYVJoRUpHbmgvOU5vNE8wUHBq?=
 =?utf-8?B?MFZIckVqZkN0V3RSUXo4ME1QSk9UNXZackZVNm8xVTdhN0xwMWZpTEFYV3NW?=
 =?utf-8?B?VUpwNWtuTmVoTFJ0S0dZOWlmMnFob1dqWkVSVjFQd3dyUXc3ZFVIZGduU3BP?=
 =?utf-8?B?dDhKSi9EMmVRMzhQdjJqKzFNQUg0UWJpSjUySnJOQllOdFg0ZmQ5QVdlQlRD?=
 =?utf-8?Q?S7Lw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGR1UzJMb2NRVWFwWTVaUVZmOUxWUmJHUjN0aWhRVWRJK3oxT0o5aEJrUUFv?=
 =?utf-8?B?Z0RWb3VUWnc4WW1YODI0dGROUDgrWGdYNDFkUnZudmVNRElYRG11M05WOWxs?=
 =?utf-8?B?ZlhsOEo3TTRRcUV1Rnp0ZkM1c2puSDQ2Um45UHNXWlZ0K2VqcU1aYzUrN2JX?=
 =?utf-8?B?K2xncVBoTVFRaENEVzR4K0l0T29TYzZwOUkyTlVVVUgxQmFPVHY0L05kc29F?=
 =?utf-8?B?d1laY044bHd5emFBazZJOWh1YVZrbnh4c3I4MXFQMmUzSGhGRXpaOWw2eDA0?=
 =?utf-8?B?UURST1E0M2Z1ZVEyaFVKVExIYlAyNU5HdGZzZ0lYejZTUEJuSHpBTUltUVd0?=
 =?utf-8?B?d21ReEtuWHBqLzRqNlE4RExVeGtSYlp4N2RzTWFUY0pSMjFyaVpkVUpUWVVU?=
 =?utf-8?B?S1JxMVFZdWpHR25MSFg3YWZocDJaeGxmQTBocE84NVh5WFVuUGZGVENxMUFn?=
 =?utf-8?B?clhyS0xZV2JjVW5xNnZHRnpzZ3ArWHJpVWJITVh4KzhWQVMrSmM1ZTBBWE1N?=
 =?utf-8?B?UkRYaUt3aDBWSXpHYS9aOUV0MFlDaGdKc2N3WlZkcUozVkE1VmowYjd0ZHAr?=
 =?utf-8?B?TWhDblFLQ1hDYStST043NWN6MUUzQ1Y1WmVCNnUzMlh3cFhHcEZTdlkxclhw?=
 =?utf-8?B?VksvUklramZoeEdFYzk5Q0phTU8vMEkvTkc1eVEvclpXemhmRm1mTjFjQitr?=
 =?utf-8?B?ZFJyWkwvR09IMDdmamZ2Z1ZhS2VMWVM0N0gweEZBRzkvVmxIWmtseUl4LzBR?=
 =?utf-8?B?dk1HTElWOTdFc1YvYkdHcmk0M1poR3hpYVI2YjBTRHRUcTBOVzc0R0x2V1o1?=
 =?utf-8?B?L05ZYXJvOTNNNzMwOTJKcW1aMVpNMkp6U2tiUGVEMFowMkoxeS8ydEpvRjZB?=
 =?utf-8?B?OXVZQVJMUStuS25Lc2ZnVEtOTGY4MllyNmRDUW5FRFlyc1pkd3JMM0NvYW1w?=
 =?utf-8?B?ZllGeklyekxvSTVxSzRWN0dUcFMwUldHN0psMzYzdEV3YWNiZlVldG8yZldI?=
 =?utf-8?B?cU54ZnpZRXpzT3RYYXExLy8yUVB4T21EYlMvT2w2WDhiM282eEJsSEpHSkxv?=
 =?utf-8?B?cXFmeDVXMzRIWE1LUWlsR0JnRjI3emJiYklRdW9YNzIxaEQ1QnFOVlhTRVY2?=
 =?utf-8?B?VCtweE10Q0h3cEhsVVhmcFFzWktrdkdIbjhnV3A1bGd4aG1rTGg5UUUvSEg1?=
 =?utf-8?B?UGw4RythVFBEYUFDblROVnpSNkhQTnZRTHVFY2k0R0ZMSm13RlozS2M0NFla?=
 =?utf-8?B?VWcwRytOdUtZYWUvQ3ZLV3JMakpXa29RTTNXSkoxNWpLYzBtVy84SFcvYzJy?=
 =?utf-8?B?dDBvMGlHbFBrbmNScXBIUmlJWkFjSmR0SjJWYlhwMXd6RkhBVHlyNzcyMDNE?=
 =?utf-8?B?MGJQaXBZN09jWitsZVUxZVR2VFpITEV2bXdKZDRYcFRuUVA5ckZ6SitjNjlM?=
 =?utf-8?B?d01rQk9OYVZLZ0ExbGY4ZXZyc2FTRE1jYlpITTEwMjlkKzZnOVBlSmFqU2kr?=
 =?utf-8?B?ZmhJRzdNblJkYk05ZWJBOHFOc3o0bGtEQWs2YUFCd1RpWm9IOThKWEJnakxG?=
 =?utf-8?B?WHl1Sm5QZVVPeERmUXNvL3Rpc0xBeWhIcldmU1MrQmFJNFhQS0RFVXk4U1g2?=
 =?utf-8?B?czJidlRYUlNkWDUxekF2azBwdUw5R1F2dkNsclBjK3ZoYlozQk85c1FyQTJh?=
 =?utf-8?B?WjBES0hYc1RJcVhLdDRmNW1LNkZLMDhkaDYwNmFHSnJOZFNoOFVLbVJ1aXhK?=
 =?utf-8?B?V21nbHJkdG4xc1NrYWdBdXdoQkRpa2xEL21Jam1kaDdjS1VvODhUa1lHaGlC?=
 =?utf-8?B?Q3BhNGl4VWFyaGVKclFTNitlYWNET29TZlhWdWRFOVRDM1JwT2hQazhKN1hG?=
 =?utf-8?B?OXZOK0dhL2pTUU1kY1UxZWVLZi9XbytZbE14NkwraXFNR0phOUc4OWJRczJw?=
 =?utf-8?B?RGM2OHRObmRhb1ZMSmVFNzZ4NWg4VDdGdWFMRG95UXloZFRLOW9XejhWeUVa?=
 =?utf-8?B?QXlDR1l4QzczNC90WHZ3aDVLVmFramxpc25xVkEzZ3h4VnllaDdMZy81bi91?=
 =?utf-8?B?R2tab1BIY0J6Y3JkZjg2d2lmL3oxQXQ5L09CbHBuUDdOc1A3Mi9YaUtheTNT?=
 =?utf-8?B?T1JsbmdQUzU0Z2JmSjBWK0ZRWUlPN091MXBCL1RZOXF3ZmNGZHVUVFloK2xa?=
 =?utf-8?B?OW9Vd2NPZ0QwVkw0T0s2bzM5YndES21aS3Y2UHR3Yk13NTFwRzIvUktyQVN1?=
 =?utf-8?B?QWVVYlJMc242Y0Mwc3BmTEJydzNxRFZjYldETEYyMThrYTF4ZWZLZG5Tb0Rl?=
 =?utf-8?B?eTErS1NLYjBQcy9rcVhONzFyK25DY2xDS0lkOGlzcHcxSmRYMmdVUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: decb8d3b-d830-45fe-1f6d-08de6593460b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 15:20:34.4424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qc9sCt42XzNwQ32108uuznyFUQgX/otX44d4EL/aiceGSvQYEYkjebFvJPQyKk5xt6wcWPdqJA/wr73bK2AqMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7506
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: DBA09FFABF
X-Rspamd-Action: no action



On 2/6/2026 12:02 AM, Lizhi Hou wrote:
> Large command buffers may be used, and they do not always need to be
> mapped or accessed by the driver. Performing a size check at command BO
> creation time unnecessarily rejects valid use cases.
> 
> Remove the buffer size check from command BO creation, and defer vmap
> and size validation to the paths where the driver actually needs to map
> and access the command buffer.
> 
> Fixes: ac49797c1815 ("accel/amdxdna: Add GEM buffer object management")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/accel/amdxdna/amdxdna_gem.c | 38 ++++++++++++++---------------
>   1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
> index dfa916eeb2d9..56341b7668b1 100644
> --- a/drivers/accel/amdxdna/amdxdna_gem.c
> +++ b/drivers/accel/amdxdna/amdxdna_gem.c
> @@ -21,8 +21,6 @@
>   #include "amdxdna_pci_drv.h"
>   #include "amdxdna_ubuf.h"
>   
> -#define XDNA_MAX_CMD_BO_SIZE	SZ_32K
> -
>   MODULE_IMPORT_NS("DMA_BUF");
>   
>   static int
> @@ -746,12 +744,6 @@ amdxdna_drm_create_cmd_bo(struct drm_device *dev,
>   {
>   	struct amdxdna_dev *xdna = to_xdna_dev(dev);
>   	struct amdxdna_gem_obj *abo;
> -	int ret;
> -
> -	if (args->size > XDNA_MAX_CMD_BO_SIZE) {
> -		XDNA_ERR(xdna, "Command bo size 0x%llx too large", args->size);
> -		return ERR_PTR(-EINVAL);
> -	}
>   
>   	if (args->size < sizeof(struct amdxdna_cmd)) {
>   		XDNA_DBG(xdna, "Command BO size 0x%llx too small", args->size);
> @@ -765,17 +757,7 @@ amdxdna_drm_create_cmd_bo(struct drm_device *dev,
>   	abo->type = AMDXDNA_BO_CMD;
>   	abo->client = filp->driver_priv;
>   
> -	ret = amdxdna_gem_obj_vmap(abo, &abo->mem.kva);
> -	if (ret) {
> -		XDNA_ERR(xdna, "Vmap cmd bo failed, ret %d", ret);
> -		goto release_obj;
> -	}
> -
>   	return abo;
> -
> -release_obj:
> -	drm_gem_object_put(to_gobj(abo));
> -	return ERR_PTR(ret);
>   }
>   
>   int amdxdna_drm_create_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
> @@ -872,6 +854,7 @@ struct amdxdna_gem_obj *amdxdna_gem_get_obj(struct amdxdna_client *client,
>   	struct amdxdna_dev *xdna = client->xdna;
>   	struct amdxdna_gem_obj *abo;
>   	struct drm_gem_object *gobj;
> +	int ret;
>   
>   	gobj = drm_gem_object_lookup(client->filp, bo_hdl);
>   	if (!gobj) {
> @@ -880,9 +863,26 @@ struct amdxdna_gem_obj *amdxdna_gem_get_obj(struct amdxdna_client *client,
>   	}
>   
>   	abo = to_xdna_obj(gobj);
> -	if (bo_type == AMDXDNA_BO_INVALID || abo->type == bo_type)
> +	if (bo_type != AMDXDNA_BO_INVALID && abo->type != bo_type)
> +		goto put_obj;
> +
> +	if (bo_type != AMDXDNA_BO_CMD || abo->mem.kva)
>   		return abo;
>   
> +	if (abo->mem.size > SZ_32K) {
> +		XDNA_ERR(xdna, "Cmd bo is too big %ld", abo->mem.size);
> +		goto put_obj;
> +	}
> +
> +	ret = amdxdna_gem_obj_vmap(abo, &abo->mem.kva);
> +	if (ret) {
> +		XDNA_ERR(xdna, "Vmap cmd bo failed, ret %d", ret);
> +		goto put_obj;
> +	}
> +
> +	return abo;
> +
> +put_obj:
>   	drm_gem_object_put(gobj);
>   	return NULL;
>   }

