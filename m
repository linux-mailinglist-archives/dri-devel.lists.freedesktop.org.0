Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7161FC01CDB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 16:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3586710E90A;
	Thu, 23 Oct 2025 14:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KGRDS/20";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010041.outbound.protection.outlook.com
 [40.93.198.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9EA10E90A;
 Thu, 23 Oct 2025 14:35:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCoZz1STbyXWGfb+FieoHjFKUDsqpBryHjDWYvLdSZUqNPhHFfw9YewMRs9IOTpcV3l2zgf5XPbD5mZMXixKaM63ZFJlIMY58stwYtTLiwE7hGSQmTfgAbO6AZt9k835ivV7ekZtcCYu7S3FpSUTM52RZ1xXO1nR5EoOYen41Mt7J+kHXwJ2n19VCsZPB1sWnm0qRSz0F065lmlqOptOyyUdTYPGW+X76Df1/KqOV1O528/4OLMs29ntY7IXn+FaWH1JOe8rZWSl5deBAo6FSfyZTAd/FMc0NPt2R12qVR8AvQbvHA+N45vsWPWV2CxlGsuP1BnsyRzFgVmBXkViLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6IUpGrQo3D4Gzbt5RGNGuPCYQKBF1tWpk/kSDsSHJo=;
 b=E7hCPjaxX6clBJQFYNyItfpsjS6CvdL/5cDiEhYZucD9R8ik6n20Yuedny03y5SzdlRDo3tR1Has+IZfBwnrnaMB3NcJ51e5h8+E/8lf2l+8PuQWSyIwtfto8SXEU3JKHSnAF4SQwtwbsYcw5L5tCJWqkORkorLKx01Okxo9w0bWkiDFsknKUsBHIT+TLMWDkLs6YytdhbAQB8KFdGGSL9D1g89DXOk2UCQUPc8CZWd51HnXghbLwKBwCFYDggK02ANzWMFa0UMpYklqGPbN4uo5GmC5KGXyeasEmL12MH6pTswPfbnk6AwiXf/4ZLLV0wyN11cicx9wyhhm0lWMaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6IUpGrQo3D4Gzbt5RGNGuPCYQKBF1tWpk/kSDsSHJo=;
 b=KGRDS/20cg0OAGrjxMTaRAAhprbDWcasR5bxS5BJqoUC97/LLfYtn8vDAhlTZ/ZKyi8ayYl68TKYnhOQFcl+aoTBU5evT9qY2qASWG5qmIZGfcYX6fApidR7WTaZf0rR6H87g0ya9FEZ0l/ZHng9GexcY3x+4SWlGCSPUTjeBNo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by IA0PR12MB7773.namprd12.prod.outlook.com (2603:10b6:208:431::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 14:35:04 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 14:35:04 +0000
Message-ID: <f615eec1-2e7b-4a4e-ba3c-64c51bbbae98@amd.com>
Date: Thu, 23 Oct 2025 10:34:57 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/1] drm/amd: Re-introduce property to control adaptive
 backlight modulation
To: Mario Limonciello <superm1@kernel.org>, amd-gfx@lists.freedesktop.org
Cc: Simon Ser <contact@emersion.fr>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Xaver Hugl <xaver.hugl@kde.org>
References: <20250718192045.2091650-1-superm1@kernel.org>
 <20250718192045.2091650-2-superm1@kernel.org>
 <2d4cbf1e-f8f7-4f6e-9e7e-15fb05234248@amd.com>
 <da6280ad-dcb2-4550-8496-c7bf628a528e@kernel.org>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <da6280ad-dcb2-4550-8496-c7bf628a528e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0704.namprd03.prod.outlook.com
 (2603:10b6:408:ef::19) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|IA0PR12MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 49d5e2b8-9184-409c-7bc5-08de12415ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2hrbnNUZC9pR3VEYmE1czVFOW1BUktiM3BVL0pBWVZncks3eWNZaUthc3dZ?=
 =?utf-8?B?dCtNSGxBYVVYY2E4WGhQZmRyd1lTNnBvSkpTQWc2dGM4V2lLQ1pSdmdpUThN?=
 =?utf-8?B?SFkvUzBBWXUxNWd6cmZjTG5YVUZOcy9FTHpZdkszbDVYR2I0aWxaL09tTUZt?=
 =?utf-8?B?QXRxR05RWTV1QmNCbkxNZzJKY3o0QWJZV0FiMFRGL3hYTUlsaHhaVDhOODdh?=
 =?utf-8?B?TDB4OGpzSThwU1FBL09qa2QybzQzZHBXWGlLc2FtQXlUWFN5MUxmZkdoNzJN?=
 =?utf-8?B?aUZuTFBiOUVNWE93YXFEOXM0UCtEL3o3eFA1V1hndXJjZy9BNEtlMFZZNVo3?=
 =?utf-8?B?eUdmcGdZdTc3V2tvTDBQMjdBb2hTZnZWTUoyUm5tNFlzdVlhR2hneVhTckpm?=
 =?utf-8?B?T0tKaWMwS3Fqc3VpL3ZyVFd5eWdHbWRXUEFteUFtUGptTU1ncmZaci9tNnNF?=
 =?utf-8?B?OGdIejV4OE54WWNDZlUxRnV1YVd5aHMydy9JdFBrRHFtV2Q3OFBaQ2Z0cWhQ?=
 =?utf-8?B?eGtBeUF3S2lHeUpyc2dXbVJtNEF1Wm16WDU1TDU2NHdJUFYzQWR3bktLU2JX?=
 =?utf-8?B?VXBoNlQ1UkV2NUZrYjRiZEMwa0o4b1U0dUxId0dGTEpSVGpVZTA2Mi9DVEtz?=
 =?utf-8?B?VlM2Z2JJRGFpVW5EdEpzUWV0RDArZlprRTM2ZndzRENkaTRzdDlBb3BQMEZu?=
 =?utf-8?B?MnhrTnoybXpndW1ZOWErYlUvR085M3UyK21KdS9ZUWFDbEpVendQSTVBTVhH?=
 =?utf-8?B?cEpHN0pUelgvemhuVmdCd3dVeUVqZ3NkTkcrWTBUR1lVSGNHVmtyVGdlMzQx?=
 =?utf-8?B?b2RheDZDaGNVUWc3RUlOcUtPUkt1T1FvaTJ0UC9WVnVTMCtFTlY3dmRST29j?=
 =?utf-8?B?azVlK2R0YVc4STk0emNnK3hYaE9JUC9wdXphMTBCMysrRUw3N2NlMnhRd3c4?=
 =?utf-8?B?RFJmZHVaMVBxazRzMkFYd0kyRzJKM00wQ1RQQmhXK0drV2dzUHlPQzlta1hD?=
 =?utf-8?B?ZlN2N0FUZkNONENlVVNYZE9JQXA4VEN4QmJmb2pqUExXNVg2TnVkRmd5QmJW?=
 =?utf-8?B?TE1BS3k1d0gzMUpaakRhNzlSc2dpODRhMWdvck9jUFhXS01MbWlNV0kxTUhw?=
 =?utf-8?B?blFUcTdqOERMSTdSM0RvMFE1aUt2ZWUvV3dlUmdmUXFCWlR2emJSMUVVUFVs?=
 =?utf-8?B?ZGMvNmQvUWtSOU9rejNvY2dUSmlUR09pQ1ZGbDVGbDNlMnl2UWQ3dG5FZVE5?=
 =?utf-8?B?SEpRUVJldzNsbUlrcWsrczlORHdCejFINC9PeFg3MkJJV1BYdWpnbHhrRjBj?=
 =?utf-8?B?QmpTYXJZdW1XM3BTc2xCSjZlZjY2dk5mYTk3MFRWdDBoemM0M0YwUmFaSDcy?=
 =?utf-8?B?RzJHdnlqQm5wRVlKR2dOTVVrSEp3ZVFGQUUzNVVVRTBROC9mQkhTOWZSeEFm?=
 =?utf-8?B?M1pyVWlXWWNhbG5LclRieGZxTFJPNzRvZnJpYlpxVHM3Q1hUOVVsN0ltSVVK?=
 =?utf-8?B?OXFaNTJIN1czNWREaWlHZWI3dWgyQXN0MTNacnR1emNqVEluUzR6VDVDZWdo?=
 =?utf-8?B?cjJqSmp6cGljTlVNL1VXNk1YTi92MkxZU25MdlpFMTc0NUJKOTIwMzVZUUtQ?=
 =?utf-8?B?eVp5ZERSQnBwUTY0SXBkdFo0REYwZHdZc3FTNjhZQURaVWdFNXlIWWQzbE5N?=
 =?utf-8?B?N25MN0p0c3V6eHZFaE5FTTZBN1JkMm5BQnpDMmxFd2p2WnBrUE0vTGhCLzZ1?=
 =?utf-8?B?ZmxvZ0hOb3k4ckpybjJ1bFk3SkVZSUxvbXE4dlJXbVVDeXAwdC9kYldhaEN1?=
 =?utf-8?B?MkZJekVDOFVUQXdnc01CaTAyZnlZRm9tSVAzUkJ6UmkrV1JxTWs2cXJTYzFu?=
 =?utf-8?B?WVRLQmdwY2FIVmZ5NHU1c2hJNnpsNHBnTjNOekxjUm5vM2xrNEFLa0RMZXkr?=
 =?utf-8?Q?4OSNv1VKzM7zsLfePQKbJjLD+978eIZs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTBiVG1VSXRmU2VWcnFpYWF1NTExRGFrZm84Y3M2eXhTRTdjSXVZdmJMb0JJ?=
 =?utf-8?B?WUNLNklWTWNPcDEvT2swbnJmYWQ2U3orUGk5WCs2NUhmVURrVmZVUVRoNXZB?=
 =?utf-8?B?MWRqNFVxY0ZmYkRSbFFaVXBaZkhscHRtU3NsMWRuTnAxN2FhVmpMSWI0aldh?=
 =?utf-8?B?YS8wOEk2MkNsMndJRENHOHZnYjFCYVk3Uk4wYThxM01PREMxZXluMHlPUU1Y?=
 =?utf-8?B?YW1ZZUhyTXRuS1ViYU1XUHNQR05LazBDUEU2QVZiK2IyWUJTNkFweUxPWnUr?=
 =?utf-8?B?bWVjcVNXZFRTTExZVzVDaGd5M05BeHhiTVQ3RFRoZkNZT3NsSkJicWFGUlBx?=
 =?utf-8?B?YUJpQ2lHNnZhenprUk5YbkJLVmUyMC9mdVBzbjJ6c0g3RjJDQjZRNU1DV2tH?=
 =?utf-8?B?RjBWdStBcVRUV0xUZC9oZEpMS29ZL3JjQXFJeDl6dmFUT0FEdUphcE4rZ1l0?=
 =?utf-8?B?aytCanJjV1J3bURKR2Q4ZWtXc1p4ZmtJZndwYTFXSERQR2wyZVgycUJjZnJx?=
 =?utf-8?B?NjJsVXBLNFY4OW54WDB5TDZKNUNZaFJUTHJyOU13R2Uvb2RwRldOeWdDbWVw?=
 =?utf-8?B?TExEQWR5b2pveHhBN1p0MmFta2xWUWNPN1BvSGNvL3FjVjRNdENWNXNob3pL?=
 =?utf-8?B?WlFJd3J5Ry9zdXZtOXZ5aHE0WG9xMGxLd3Y0VlJBNGdLUFlPL2dqV3I4Zmp0?=
 =?utf-8?B?OHZMQm02QUxBZ01WSmxZaTlWMW9xT2s4ck9GcHBEWjczMUlJbWUwbjJvb1lB?=
 =?utf-8?B?bmhvSmJsMVpoQThvYzRFa3lRakJaeWE2ZERWT3BkdDdnVGlnODNraVNzOExi?=
 =?utf-8?B?VmRYcFZaK0NKOGFTVW13cmtRMmc3YXhCZXJKRFJQQm5OR0QrQnFiQ09NcnJQ?=
 =?utf-8?B?MGluTzdNQUVLNy93bVlBU25RZmVvdlNFZ2I3YTNmeUtYNEVVQVo4aFpmT1Bh?=
 =?utf-8?B?U0t5K3FQd2IwcU9xMFhKdStFa2hhSG82SzhpZ0J6YmRBemlKS05Xejd4azBi?=
 =?utf-8?B?S0x5ZjRGYlUvNldEQ3R2aUNDL3UySHRiN1ZDaURQeGV3NEZvT2V4MEQwSVor?=
 =?utf-8?B?SncwMnhxTmRrb1pTY3gyUk1zR1FIclZ5K0dSQVJ3T2IwQmozWkhXR1NMNmlK?=
 =?utf-8?B?bk92Vis4bjhUODdveWs5c2hzUWI0bVZtZTNvZjJtYXpsdkpuOVZRSWd0UEJF?=
 =?utf-8?B?YW01NU1kOGFHaWNXZ1V1OGg1MGozZzhMayt3VWZWMmxBVEdtVlprSm5jaEdT?=
 =?utf-8?B?aXRnZ0I4MzY1RWg1R0FUaWxTL01XQVhjMW1xQ2tieFZybmg0d3lXaStHemM2?=
 =?utf-8?B?WjcxYnA2ampYQktGVFFhS29oUUVTaG5ZMGhiQ2pIcFhOWjEveE1id0d3czJG?=
 =?utf-8?B?VlFoYnQ4MWxyTWo4ZWdNWEtoY0I3RXB3OUZtSzExcmNsaytIUVo4eWRRL3Jk?=
 =?utf-8?B?clRIWEFMWC92NkJ1OW1TaG5ZY2x1MTE5VEprWGlGc0dDdjZyWVVsQjdRdFZW?=
 =?utf-8?B?ZFJjTHErbnNDSk51azdqbnpINHdrZ1Zhak1Ec0huSWY4UkFWUm5wS1FmYTBR?=
 =?utf-8?B?dzBiN0FuOFYxNGcvNE90cWVuZU5tK2ZhQVpOYXVJd0pDMkZuU0QrUDNVd21z?=
 =?utf-8?B?OU1HTFlSeWw4Qm5xMWMvU3JRZXB2YmlUVUtaTG9XVVYvQmdiaHhXM3F0K2Yw?=
 =?utf-8?B?V0hSQ3luNGc0YzRUZFZkNVphOUtiYUI4alRKZ0ZxSmUvbWVpRkYrZFF0NE5S?=
 =?utf-8?B?SzVuOWd6a2tFdkRPd25SUHphT2FPcnhqVm1naUxQVkIwY1JWWDJ5T2xINzhY?=
 =?utf-8?B?QUVqY1pSYi8wanViUEJVM0dFZmMvbUhodDFkTlZpWDdFakFpMEdubFV3UFFz?=
 =?utf-8?B?NEc3aUM3aTdPRnpicVdsenBocE1qOXYzK3lQQUFyOGt6dXNOektPdjBnTlNE?=
 =?utf-8?B?ZVJPeUFDcHFxWVFnWHBBREZTdlQ0dGN0RnpsK1plT0RxUVkzUm1Pam9oUXRD?=
 =?utf-8?B?bkZQdDBEZEV1K2FTU2x2NDdEdmxMb2lpRGRab09qSWVPU0ZMcmxRTFZlamdq?=
 =?utf-8?B?Y3BsQ3BiVi9CN1ZNMEhGYzNTS2NJUWQrK1ozb1lkMHFMNHBsdUNKdU9wemxh?=
 =?utf-8?Q?0ccfkOJB3to8pPYoZpIIc8CPj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d5e2b8-9184-409c-7bc5-08de12415ad8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 14:35:04.1485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: okP/X0QrHvgxjhSXBAtF3dLvpsLhI9gzY3iQOZZGS+d34RUXyw0pfIrPZ+CKNUBXSlR9oWSZdIyEdMdFSmGXUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7773
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



On 2025-10-23 10:21, Mario Limonciello wrote:
> On 10/23/25 9:09 AM, Harry Wentland wrote:
>>
>>
>> On 2025-07-18 15:20, Mario Limonciello wrote:
>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>
>>> commit 0887054d14ae2 ("drm/amd: Drop abm_level property") dropped the
>>> abm level property in favor of sysfs control. Since then there have
>>> been discussions that compositors showed an interest in modifying
>>> a vendor specific property instead.
>>>
>>> So re-introduce the abm level property, but with different semantics.
>>> Rather than being an integer it's now an enum. One of the enum options
>>> is 'sysfs', and that is because there is still a sysfs file for use by
>>> userspace when the compositor doesn't support this property.
>>>
>>> If usespace has not modified this property, the default value will
>>> be for sysfs to control it. Once userspace has set the property stop
>>> allowing sysfs control.
>>>
>>> The property is only attached to non-OLED eDP panels.
>>>
>>> Cc: Xaver Hugl <xaver.hugl@kde.org>
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 60 ++++++++++++++++++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.h   |  7 +++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  2 +
>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 39 +++++++++++-
>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
>>>   5 files changed, 106 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>> index 35c778426a7c7..f061f63e31993 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>> @@ -1363,6 +1363,64 @@ static const struct drm_prop_enum_list amdgpu_dither_enum_list[] = {
>>>       { AMDGPU_FMT_DITHER_ENABLE, "on" },
>>>   };
>>>   +/**
>>> + * DOC: property for adaptive backlight modulation
>>> + *
>>> + * The 'adaptive backlight modulation' property is used for the compositor to
>>> + * directly control the adaptive backlight modulation power savings feature
>>> + * that is part of DCN hardware.
>>> + *
>>> + * The property will be attached specifically to eDP panels that support it.
>>> + *
>>> + * The property is by default set to 'sysfs' to allow the sysfs file 'panel_power_savings'
>>> + * to be able to control it.
>>> + * If set to 'off' the compositor will ensure it stays off.
>>> + * The other values 'min', 'bias min', 'bias max', and 'max' will control the
>>> + * intensity of the power savings.
>>> + *
>>> + * Modifying this value can have implications on color accuracy, so tread
>>> + * carefully.
>>> + */
>>> +static int amdgpu_display_setup_abm_prop(struct amdgpu_device *adev)
>>> +{
>>> +    const struct drm_prop_enum_list props[] = {
>>> +        { ABM_SYSFS_CONTROL, "sysfs" },
>>> +        { ABM_LEVEL_OFF, "off" },
>>> +        { ABM_LEVEL_MIN, "min" },
>>> +        { ABM_LEVEL_BIAS_MIN, "bias min" },
>>> +        { ABM_LEVEL_BIAS_MAX, "bias max" },
>>> +        { ABM_LEVEL_MAX, "max" },
>>
>> My only concern is that with these values we're locking ourselves
>> specifically to ABM. But if userspace implements support one might
>> want to use that support for other, similar panel power saving
>> features, like some OLED power saving features.
>>
>> I was thinking a range property might work better and could see
>> re-use in the future, but unfortunately it uses uints to specify
>> the range, so we couldn't designate -1 for "sysfs".
> 
> Yeah that was exactly why I landed on an enum.
> 
>>
>> Thoughts? Should we care? Can we avoid userspace needing code for
>> a set of different panel power saving features, like
>> - ABM
>> - OLED power saving
>> - <some Intel panel power saving feature>
>> - <another NVidia panel power saving feature>
>> - <other vendors panel power saving features>
>>
>> If we made it more generic we could even move this to a common DRM
>> property once other drivers have use for it.
> 
> It sounds like a flip flop between the older version (generic "panel power savings" property) and this one.
> 
> During the hackfest this year Xaver had made the point we're always going to end up with subtle nuance in different implementations of power saving technologies that the compositor may need to care about, which I tend to agree with.
>>

Fair enough.

Patch is
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

>> Harry
>>
>>> +    };
>>> +    struct drm_property *prop;
>>> +    int i;
>>> +
>>> +    if (!adev->dc_enabled)
>>> +        return 0;
>>> +
>>> +    prop = drm_property_create(adev_to_drm(adev), DRM_MODE_PROP_ENUM,
>>> +                "adaptive backlight modulation",
>>> +                6);
>>> +    if (!prop)
>>> +        return -ENOMEM;
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(props); i++) {
>>> +        int ret;
>>> +
>>> +        ret = drm_property_add_enum(prop, props[i].type,
>>> +                        props[i].name);
>>> +
>>> +        if (ret) {
>>> +            drm_property_destroy(adev_to_drm(adev), prop);
>>> +
>>> +            return ret;
>>> +        }
>>> +    }
>>> +
>>> +    adev->mode_info.abm_level_property = prop;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
>>>   {
>>>       int sz;
>>> @@ -1409,7 +1467,7 @@ int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
>>>                        "dither",
>>>                        amdgpu_dither_enum_list, sz);
>>>   -    return 0;
>>> +    return amdgpu_display_setup_abm_prop(adev);
>>>   }
>>>     void amdgpu_display_update_priority(struct amdgpu_device *adev)
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
>>> index dfa0d642ac161..2b1536a167527 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
>>> @@ -54,4 +54,11 @@ int amdgpu_display_resume_helper(struct amdgpu_device *adev);
>>>   int amdgpu_display_get_scanout_buffer(struct drm_plane *plane,
>>>                         struct drm_scanout_buffer *sb);
>>>   +#define ABM_SYSFS_CONTROL    -1
>>> +#define ABM_LEVEL_OFF        0
>>> +#define ABM_LEVEL_MIN        1
>>> +#define ABM_LEVEL_BIAS_MIN    2
>>> +#define ABM_LEVEL_BIAS_MAX    3
>>> +#define ABM_LEVEL_MAX        4
>>> +
>>>   #endif
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>>> index 6da4f946cac00..169bc667572e2 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>>> @@ -326,6 +326,8 @@ struct amdgpu_mode_info {
>>>       struct drm_property *audio_property;
>>>       /* FMT dithering */
>>>       struct drm_property *dither_property;
>>> +    /* Adaptive Backlight Modulation (power feature) */
>>> +    struct drm_property *abm_level_property;
>>>       /* hardcoded DFP edid from BIOS */
>>>       const struct drm_edid *bios_hardcoded_edid;
>>>   diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index 928f61f972a1f..4025575d2f536 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -5042,6 +5042,7 @@ static int initialize_plane(struct amdgpu_display_manager *dm,
>>>   static void setup_backlight_device(struct amdgpu_display_manager *dm,
>>>                      struct amdgpu_dm_connector *aconnector)
>>>   {
>>> +    struct amdgpu_dm_backlight_caps *caps;
>>>       struct dc_link *link = aconnector->dc_link;
>>>       int bl_idx = dm->num_of_edps;
>>>   @@ -5061,6 +5062,13 @@ static void setup_backlight_device(struct amdgpu_display_manager *dm,
>>>       dm->num_of_edps++;
>>>         update_connector_ext_caps(aconnector);
>>> +    caps = &dm->backlight_caps[aconnector->bl_idx];
>>> +
>>> +    /* Only offer ABM property when non-OLED and user didn't turn off by module parameter */
>>> +    if (!caps->ext_caps->bits.oled && amdgpu_dm_abm_level < 0)
>>> +        drm_object_attach_property(&aconnector->base.base,
>>> +                       dm->adev->mode_info.abm_level_property,
>>> +                       ABM_SYSFS_CONTROL);
>>>   }
>>>     static void amdgpu_set_panel_orientation(struct drm_connector *connector);
>>> @@ -7122,6 +7130,20 @@ int amdgpu_dm_connector_atomic_set_property(struct drm_connector *connector,
>>>       } else if (property == adev->mode_info.underscan_property) {
>>>           dm_new_state->underscan_enable = val;
>>>           ret = 0;
>>> +    } else if (property == adev->mode_info.abm_level_property) {
>>> +        switch (val) {
>>> +        case ABM_SYSFS_CONTROL:
>>> +            dm_new_state->abm_sysfs_forbidden = false;
>>> +            break;
>>> +        case ABM_LEVEL_OFF:
>>> +            dm_new_state->abm_sysfs_forbidden = true;
>>> +            dm_new_state->abm_level = ABM_LEVEL_IMMEDIATE_DISABLE;
>>> +            break;
>>> +        default:
>>> +            dm_new_state->abm_sysfs_forbidden = true;
>>> +            dm_new_state->abm_level = val;
>>> +        };
>>> +        ret = 0;
>>>       }
>>>         return ret;
>>> @@ -7164,6 +7186,13 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
>>>       } else if (property == adev->mode_info.underscan_property) {
>>>           *val = dm_state->underscan_enable;
>>>           ret = 0;
>>> +    } else if (property == adev->mode_info.abm_level_property) {
>>> +        if (!dm_state->abm_sysfs_forbidden)
>>> +            *val = ABM_SYSFS_CONTROL;
>>> +        else
>>> +            *val = (dm_state->abm_level != ABM_LEVEL_IMMEDIATE_DISABLE) ?
>>> +                dm_state->abm_level : 0;
>>> +        ret = 0;
>>>       }
>>>         return ret;
>>> @@ -7216,10 +7245,16 @@ static ssize_t panel_power_savings_store(struct device *device,
>>>           return -EINVAL;
>>>         drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
>>> -    to_dm_connector_state(connector->state)->abm_level = val ?:
>>> -        ABM_LEVEL_IMMEDIATE_DISABLE;
>>> +    if (to_dm_connector_state(connector->state)->abm_sysfs_forbidden)
>>> +        ret = -EBUSY;
>>> +    else
>>> +        to_dm_connector_state(connector->state)->abm_level = val ?:
>>> +            ABM_LEVEL_IMMEDIATE_DISABLE;
>>>       drm_modeset_unlock(&dev->mode_config.connection_mutex);
>>>   +    if (ret)
>>> +        return ret;
>>> +
>>>       drm_kms_helper_hotplug_event(dev);
>>>         return count;
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> index 0b964bfdd4a55..5a38373e054a8 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> @@ -969,6 +969,7 @@ struct dm_connector_state {
>>>       bool underscan_enable;
>>>       bool freesync_capable;
>>>       bool update_hdcp;
>>> +    bool abm_sysfs_forbidden;
>>>       uint8_t abm_level;
>>>       int vcpi_slots;
>>>       uint64_t pbn;
>>
> 

