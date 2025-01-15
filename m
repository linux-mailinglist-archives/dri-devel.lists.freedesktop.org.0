Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C658DA128BF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 17:34:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046DA10E50E;
	Wed, 15 Jan 2025 16:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3uf9PvAb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8417C10E771
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 16:34:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7qJab/3pcZVws5Ut3+bsilZPqB4MT+jAydZjzeZdlq08TEZgcCDKn/tMPAoVKtlB1hug4bit5asg/MsHNwTmaNb801MQBGIhRiNJQbG9aDcFNtaM4rmOH3k1I0xmlMIwdLTutDrETGUiGB3pSzm8HV5mPiDNgMMoWqA3dlaWhssTK21vmDWxuRjZ1zS7RFEjXVR0B9HajcmyBXueVI3gE05stC6xR8C577ATofJ9fXB0LO0Uf85BW93WNsALT7rltom7ccfDmxodp0gnvwgz9jEPk05Sr1GwPnCHj9mtBa/mfW4oNKZh0hmBHRW3Jkzl0Sr56FGmmBIxocsChkXvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHfJqdnS+xPdfx358wIT+t3AYYxgRIYP9/2k55QoNIk=;
 b=RWkpTB1EdkvIa2l+61FG1PvAIIG6gI37ufnMOsB1GR5xpYN8OSqXzfa2yTm1x2hBSaOBpgu8tSS9Mu8UOjSJP3mbdY9M/59PDxREgAtHEdt/drA/cbu84lTf5ls+h4gsPbkCv9RMrVjhpy+xH0gdnUnBjzGfMMUnEH7E1UWOg6yhiD0+vvw6CTusmnM11j9wqoLGSYs+6kiUUdjj7LGObMzV7crNS22GNIkodQG7Cvup1vEVYVzrI4ydn8wxN+e+CYtpNr4mYZmoqtSCov+8/JVIaccIXyzytW9SyX/rBw/L/Fek+iur/avQVxNnnofsDZ7vRj/nw3MAuZ1Rs6gK9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHfJqdnS+xPdfx358wIT+t3AYYxgRIYP9/2k55QoNIk=;
 b=3uf9PvAbC1dhCx9KAsC8druwDdbt89STlVF+2HTRwiCph+BaDxhaQ/0OJElJ6u0ffGpwuhYIjxGKncUY6wGHwJYGr5ShIPGvUgJhjEbwhg5XgL+PVJW6aR/yVsMnmV6gJVwgwur+xADDZmE5A38dqhPWD2FPBSEDWjbCd3P+Bi4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 16:34:32 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 16:34:32 +0000
Content-Type: multipart/alternative;
 boundary="------------hK0g69PaoqCkq408583AMHwR"
Message-ID: <6f7a14aa-f607-45f9-9e15-759e26079dec@amd.com>
Date: Wed, 15 Jan 2025 17:34:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
References: <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
 <c823f70c-9b70-441c-b046-71058c315857@amd.com>
 <20250110205454.GM5556@nvidia.com>
 <d213eee7-0501-4a63-9dfe-b431408c4c37@amd.com>
 <20250115133821.GO5556@nvidia.com>
 <f6c2524f-5ef5-4c2c-a464-a7b195e0bf6c@amd.com>
 <1afd5049-d1d4-4fd6-8259-e7a5454e6a1d@amd.com>
 <20250115141458.GP5556@nvidia.com>
 <c86cfee1-063a-4972-a343-ea0eff2141c9@amd.com>
 <86afb69a-79bd-4719-898e-c6c2e62103f7@amd.com>
 <20250115151056.GS5556@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250115151056.GS5556@nvidia.com>
X-ClientProxiedBy: FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: e3075483-3019-47ae-09dc-08dd35827d2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0tCRGQ5cFhSL05IdHExNkhwODZzN0hLWitoMmE0SElmK3FEaEFhZDhFYkE4?=
 =?utf-8?B?ZFZXVW1qTDl3UHZuNDlBdngzRHNmWkRZdmozV3VhYXFDeVpRYWtWZGhINGxr?=
 =?utf-8?B?dW1IdlR3bTd4ckNsQUwwcld3bTNaQUJvNWRHRGV4UFVCMDF3QTFFTVovUHNX?=
 =?utf-8?B?M0FFV052WXFIZjJSTTdtdWsrL0dBNmd6bldKcElUcmRhclY5eFhYeU1xYXBM?=
 =?utf-8?B?eE1iRmJad3ZSYXUyUCt3Ny9KV0NPNkpiNGwxejNyK2ZOL0pXT1RiemNsZSsy?=
 =?utf-8?B?U0ZJY3RyWTF6N1lkU0VjTk01S0t4bTZHbFRQUWttcnFtTng0UENkeExXbDdJ?=
 =?utf-8?B?TXU0MUF0QzZQYVY4U1ZQYW03R0FWb0pBL1NlR2w0bEZOeWdaYkJSa0dhN1l3?=
 =?utf-8?B?RHNUSUw2QmF6dGhSU1VZZFU0YmtENUYrL2d4elByenlTeENqSUtZMFFjS2xz?=
 =?utf-8?B?KytiUytSOWZPTFBjaTVKT0lBamZOR0JkQlh6U25HMzc2TGdhWXVUdU5kYTRD?=
 =?utf-8?B?a0N0WlJXV21ySVNHVkdjRTRYMitOaUkxS0YyV1hFUEZMcjN6c2JtK3BHN2I4?=
 =?utf-8?B?aU5yYjNHV3dUbnA0cnU4ZnZNRGpGOEh2SUc0c3phdi95Q0o1VFpoS3E4R1hG?=
 =?utf-8?B?Mk9nclJPc0NlNG5KRlYwRTVib09sQ1M4RlRkSmR3YlhmQy8vajQva1lUWXhH?=
 =?utf-8?B?Q0RkSCtwdmkySUJJSk5wd0dRU3ZqS2h4aWl5SkZFUko0ZkI4VmNZaUo3b2xL?=
 =?utf-8?B?Rmt1RXJwQnY3aG80MGU0a2J1dmFyU1Y1QjdXVGJMN085OVZGcS9KNFN3OHNl?=
 =?utf-8?B?eEdFU056ZFRLRGxlZUF3bFJrdGo1dERyeDg0c2xzdDlCdzZTajhUclhiSjNS?=
 =?utf-8?B?RERyVEFmaFBXM1hrRGY1cm85QVVPckU4MWk1V3V4M3lJNzdIMXl6QjhuQ0E0?=
 =?utf-8?B?aTNhUm1OTlA3TnROZGprZ1RnaXZWVlk5aHcrS0xvQldlS0RTOE9JSmNybVd0?=
 =?utf-8?B?VVk4dzRGVjZGUmhFWWk0bTZ6Y3Bybzk3OFE3WWFUQktLTXl0ZHdTU2FGVWEv?=
 =?utf-8?B?RmwzR01rOS9VR1lEbDBMZXBCNGxWZTJoN2NIalVCK3ZZSEcvWDFWdlVBb1Rp?=
 =?utf-8?B?Z0JTU2MvMlA5YUpkR2wwdmpiRE1tbEJtRzBhTTBKZmxmcXVVU1hUdWRVMnky?=
 =?utf-8?B?b2hsd0ZHTXlTOHUzdldPZDdHS1ZsMjl4MUc5VFYzQmVFL2RhQnZETFJvYTgw?=
 =?utf-8?B?YURTcjFzdXpPZHRTNWQ2MWNVaVFudXhvUXptTjJibHZhNUdMOUlFem0vVTFs?=
 =?utf-8?B?aFFTTDZkdk52Z051WFdER3BsQXJLUE9mRnh4WHFqb09ZaG8rMGhXRGJIakZy?=
 =?utf-8?B?LzhIaWNkUTBsT0VXSXhFaWZXR2Fvd2F3Y3hqR0dsc3BaaFZCZU9EWFhEUGFC?=
 =?utf-8?B?ZHpMNG9RZ3VEUkl1R1lBdTNIU1BUVnM2WmxTbzlLNnFMUlpiZkc2bkM0Snl0?=
 =?utf-8?B?TzQyTVk4UHRGc3JkU3R4Z2xIbFhraVhOWnZPZDQxbXdNREZRQTN3Vld4WlUw?=
 =?utf-8?B?d3JIVk1CZUxNbDZURFpCTGEwbk40RHhHNHVGNFlrUFFaZXV1QTBDajZNNDhi?=
 =?utf-8?B?c1IvVVlpK2NGVmg4dDBwQ2Q2M0J1OEVxQmxKRkljeHZ5WkxrZkgyUHBVdmxn?=
 =?utf-8?B?dzg2ZnhMVFk2cE11RWx0UjVSeEpvZzVyOE5xc2FyY013bUlXQ0RwNUswaTJD?=
 =?utf-8?B?blliV3h1emFpK1NYV3dGRE96NWdBZGJlSHUrL0VScUdTdVBDU2MxNlJQcjJH?=
 =?utf-8?B?QzNaNW8zaDFuTnJiR3B6blg5cE5lc2xnSWFQVmtobzQ5M204N3pvcWkxZ1ZO?=
 =?utf-8?Q?BbMIDcFgFtpXm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2RBU01zNjhrMW4xOHg2TFNzcUg1VmkrMEdrbHgweHNldUJWbWxjdS9vbXNR?=
 =?utf-8?B?WHVFQXJNTHdnYlVPOWtBMXBrdnBqb0hqSU8wT0Nua09VT094VWs2V2lhMXV4?=
 =?utf-8?B?ZnYvMmFOTGxMOVJSNmNQbWJReExLNnhXdHhjNnBWKzZNOG1acjU4dnNuUno4?=
 =?utf-8?B?NXp3UmUwZ2kyN1VWdFY2dXJOWE80U2NnVzMwYTZxeFJVUVdaNTBmSXV4bkxq?=
 =?utf-8?B?QTUrWDltdUF0ZHQ0QWRjRUp4M0ZkYWlzbUxZem91MGdGeUxDVzNzSGo4U3pQ?=
 =?utf-8?B?MUs3d0NkcGIwTTVZY055VHNWK09ub3lZcVpoRW5LOE1ha0FEWXlpeENYaTdt?=
 =?utf-8?B?cVlkT1VLVzRNOE9OQjZraVFhLzYzOE1iZ2ZabjlWelZ1NEVQeng3Z2hXRzc0?=
 =?utf-8?B?UzQ4N0x6ZU4zTTl2cDNNOHUxN0RucEZ1S1E4enZYMVRZa1VOUkVkOVZhd3ZC?=
 =?utf-8?B?ODhpQnFRZG9RVzM1eUZHRG5ZU3V6QWlpbGh4aDVaWWh1S1pzRCtqUGd4YmdB?=
 =?utf-8?B?RVd5Vi9HaFRFdjNKdjdIaVM1NlNlY3g3RmNJcU1rbUJUVEhuR2Z6cW4wOVF0?=
 =?utf-8?B?R3BneXRUSGZ4TkZNUVd1akpUcmFJSG9Fc3lRR3FkbUpqSU1PaXJiS1dpcUZN?=
 =?utf-8?B?eW14WTh3MFhHV0haa1Z5MVc0OXNXbkNPTVRseWJWOXRpZEZ4R1dPN0pMbmQz?=
 =?utf-8?B?M3hHbEJPRkdFbGNRY0x5VmF0MFhJeUVudGJQcmNjMzQvTUdZT20xdUV6b2xn?=
 =?utf-8?B?Qm9ocmpFOXFVMC9YZUxkZUR6RUp1RUR3OEFVdXpmNFNreGRpSDVxZ0tpNmhY?=
 =?utf-8?B?bHRQQlVNeDFTY2hCWlp1bjAwdnV6eUk2bWdoMXgwMU91UFBCaCszckw5TEkz?=
 =?utf-8?B?aXh4SlMrREhwRHF5NC9xSTU4cGxNWFd5Sm5oL0Z3SEppYUgydk1ZVTFGWUZC?=
 =?utf-8?B?VVZyNEdrQU4vaGlEUnJFUHY1TkZXaFVxNFova1FrbjArZU40cld0RHFUSGxU?=
 =?utf-8?B?T2RlSVhYTVc3aFhKUU82dUk4T3A5em5kRGpFWXJUcTdSVkRqMTM2ODNWdE1u?=
 =?utf-8?B?eUJGVVV0dk15cWprMkNwaVFOdWZMV05NdmdCSVFWdWFzZVMyTG1tdUhlOW93?=
 =?utf-8?B?UUJCQ1Jjam94bFpsbmlLMFBYd285aVlXODFVMDBlVkdMdTNMVXMxQlEwdWJs?=
 =?utf-8?B?bWYxeitXMVlHWSt3aUNkbWRUa1VWakxmNlk1aDErOXVlTmJCYVhZelhBalEr?=
 =?utf-8?B?eVkyd2dvekp5VG9OTkdTcGwvMnpLenpIelBUNUEyVEpMTDd6ZWlkdHN1ZFJn?=
 =?utf-8?B?OGtacHg5TFZoam1OaCtmV1VOY0txSC9FNVN3K00xaktQdUxTNGdWTDRqdXF6?=
 =?utf-8?B?ZTZyTWtSL1Bhck9DVmxzaUhNdk5ocWU0cnltYitGWW5KMlJudzRRTU5zdFVt?=
 =?utf-8?B?WFlCTzNzbW0xYnlMZjdqVEYyd0lkMUZiMWpRQ3ZROGJ6bEF5ZENvNk1aOFE4?=
 =?utf-8?B?Mi9UdytVV21DWmlSakRyUmtmS2M4S3lpalJMMXMrek5OMlV4dUllNFNjM3E5?=
 =?utf-8?B?Y0cxK2llTzFvSVNiUFlzc0IwUXR6WFRVcktHa3U0bGlsc1dOMnQ5MWVuMWtQ?=
 =?utf-8?B?YU84UGUvVTcxYnE2KzhROXA1elVqbWlZSVViT3pVY0U3M3BsTHdybXpISnJy?=
 =?utf-8?B?U2NnYVpsMVhNMjNacktIOWZGWGJnTCtNNXJXYXJBZW93L3FLYTB5bU1HdVBk?=
 =?utf-8?B?dGpxWGRjVUFFbHppT1FJOWVyZ0wxQmlYeElkbmlXUm1naTEyck5yU2tzeU96?=
 =?utf-8?B?VVViRzUzT3FjZUtmR0pUaW1mVEdxbXFhM3V1ZzdwTWVZZnBYN3Y4QkpNZFdl?=
 =?utf-8?B?cVozSGpaT0lETjdCMVh4ZG5rUmZubVIreXVzZWlKa2NDbHdIdFlwZHduWm9F?=
 =?utf-8?B?VGdHbzhPb3dwU1JQcXV2azZhUDdsamV2STFwUG5zWExYTlNHcHBtRUxiRnFL?=
 =?utf-8?B?WUJRV2NQYlRwSzZ2YmZtTE9ENWpGMzF6aUFjUituS1hWeTNqTWF3WG9hd016?=
 =?utf-8?B?NkZNbHBBeFlEeExQek5GbUg4Y1hjbHFuTFlnVkdxZEt1dGh3dWtwcXlkTXNB?=
 =?utf-8?Q?b0sVGsuiMFzrT4bqWbsp+R208?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3075483-3019-47ae-09dc-08dd35827d2a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 16:34:31.9755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MSCJloL90gI47kgDdpAdLcLUVeoj85ErdBIQKf7EH3C16+fP1CeXLH7Kc/m7R4w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8412
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

--------------hK0g69PaoqCkq408583AMHwR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 15.01.25 um 16:10 schrieb Jason Gunthorpe:
> On Wed, Jan 15, 2025 at 03:30:47PM +0100, Christian König wrote:
>
>>> Those rules are not something we cam up with because of some limitation
>>> of the DMA-API, but rather from experience working with different device
>>> driver and especially their developers.
> I would say it stems from the use of scatter list. You do not have
> enough information exchanged between exporter and importer to
> implement something sane and correct. At that point being restrictive
> is a reasonable path.
>
> Because of scatterlist developers don't have APIs that correctly solve
> the problems they want to solve, so of course things get into a mess.

Well I completely agree that scatterlists have many many problems. And 
at least some of the stuff you note here sounds like a good idea to 
tackle those problems.

But I'm trying to explain the restrictions and requirements we 
previously found necessary. And I strongly think that any new approach 
needs to respect those restrictions as well or otherwise we will just 
repeat history.

>>> Applying and enforcing those restrictions is absolutely mandatory must
>>> have for extending DMA-buf.
> You said to come to the maintainers with the problems, here are the
> problems. Your answer is don't use dmabuf.
>
> That doesn't make the problems go away :(

Yeah, that's why I'm desperately trying to understand your use case.

>>>> I really don't want to make a dmabuf2 - everyone would have to
>>>> implement it, including all the GPU drivers if they want to work with
>>>> RDMA. I don't think this makes any sense compared to incrementally
>>>> evolving dmabuf with more optional capabilities.
>>> The point is that a dmabuf2 would most likely be rejected as well or
>>> otherwise run into the same issues we have seen before.
> You'd need to be much more concrete and technical in your objections
> to cause a rejection. "We tried something else before and it didn't
> work" won't cut it.

Granted, let me try to improve this.

Here is a real world example of one of the issues we ran into and why 
CPU mappings of importers are redirected to the exporter.

We have a good bunch of different exporters who track the CPU mappings 
of their backing store using address_space objects in one way or another 
and then uses unmap_mapping_range() to invalidate those CPU mappings.

But when importers get the PFNs of the backing store they can look 
behind the curtain and directly insert this PFN into the CPU page tables.

We had literally tons of cases like this where drivers developers cause 
access after free issues because the importer created a CPU mappings on 
their own without the exporter knowing about it.

This is just one example of what we ran into. Additional to that 
basically the whole synchronization between drivers was overhauled as 
well because we found that we can't trust importers to always do the 
right thing.

> There is a very simple problem statement here, we need a FD handle for
> various kinds of memory, with a lifetime model that fits a couple of
> different use cases. The exporter and importer need to understand what
> type of memory it is and what rules apply to working with it. The
> required importers are more general that just simple PCI DMA.
>
> I feel like this is already exactly DMABUF's mission.
>
> Besides, you have been saying to go do this in TEE or whatever, how is
> that any different from dmabuf2?

You can already turn both a TEE allocated buffer as well as a memfd into 
a DMA-buf. So basically TEE and memfd already provides different 
interfaces which go beyond what DMA-buf does and allows.

In other words if you want to do things like direct I/O to block or 
network devices you can mmap() your memfd and do this while at the same 
time send your memfd as DMA-buf to your GPU, V4L or neural accelerator.

Would this be a way you could work with as well? E.g. you have your 
separate file descriptor representing the private MMIO which iommufd and 
KVM uses but you can turn it into a DMA-buf whenever you need to give it 
to a DMA-buf importer?

>>>>>>>> That sounds more something for the TEE driver instead of anything DMA-buf
>>>>>>>> should be dealing with.
>>>>>>> Has nothing to do with TEE.
>>>>>> Why?
>>>> The Linux TEE framework is not used as part of confidential compute.
>>>>
>>>> CC already has guest memfd for holding it's private CPU memory.
>>> Where is that coming from and how it is used?
> What do you mean? guest memfd is the result of years of negotiation in
> the mm and x86 arch subsystems :( It is used like a normal memfd, and
> we now have APIs in KVM and iommufd to directly intake and map from a
> memfd. I expect guestmemfd will soon grow some more generic
> dmabuf-like lifetime callbacks to avoid pinning - it already has some
> KVM specific APIs IIRC.
>
> But it is 100% exclusively focused on CPU memory and nothing else.

I have seen patches for that flying by on mailing lists and have a high 
level understand of what's supposed to do, but never really looked more 
deeply into the code.

>>>> This is about confidential MMIO memory.
>>> Who is the exporter and who is the importer of the DMA-buf in this use
>>> case?
> In this case Xu is exporting MMIO from VFIO and importing to KVM and
> iommufd.

So basically a portion of a PCIe BAR is imported into iommufd?

>>> This is also not just about the KVM side, the VM side also has issues
>>> with DMABUF and CC - only co-operating devices can interact with the
>>> VM side "encrypted" memory and there needs to be a negotiation as part
>>> of all buffer setup what the mutual capability is. :\ swiotlb hides
>>> some of this some times, but confidential P2P is currently unsolved.
>> Yes and it is documented by now how that is supposed to happen with
>> DMA-buf.
> I doubt that. It is complex and not fully solved in the core code
> today. Many scenarios do not work correctly, devices don't even exist
> yet that can exercise the hard paths. This is a future problem :(

Let's just say that both the ARM guys as well as the GPU people already 
have some pretty "interesting" ways of doing digital rights management 
and content protection.

Regards,
Christian.

>
> Jason

--------------hK0g69PaoqCkq408583AMHwR
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 15.01.25 um 16:10 schrieb Jason Gunthorpe:<br>
    <blockquote type="cite" cite="mid:20250115151056.GS5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">On Wed, Jan 15, 2025 at 03:30:47PM +0100, Christian König wrote:

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Those rules are not something we cam up with because of some limitation
of the DMA-API, but rather from experience working with different device
driver and especially their developers.
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I would say it stems from the use of scatter list. You do not have
enough information exchanged between exporter and importer to
implement something sane and correct. At that point being restrictive
is a reasonable path.

Because of scatterlist developers don't have APIs that correctly solve
the problems they want to solve, so of course things get into a mess.</pre>
    </blockquote>
    <br>
    Well I completely agree that scatterlists have many many problems.
    And at least some of the stuff you note here sounds like a good idea
    to tackle those problems.<br>
    <br>
    But I'm trying to explain the restrictions and requirements we
    previously found necessary. And I strongly think that any new
    approach needs to respect those restrictions as well or otherwise we
    will just repeat history.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250115151056.GS5556@nvidia.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Applying and enforcing those restrictions is absolutely mandatory must
have for extending DMA-buf.
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You said to come to the maintainers with the problems, here are the
problems. Your answer is don't use dmabuf.

That doesn't make the problems go away :(</pre>
    </blockquote>
    <br>
    Yeah, that's why I'm desperately trying to understand your use case.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250115151056.GS5556@nvidia.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">I really don't want to make a dmabuf2 - everyone would have to
implement it, including all the GPU drivers if they want to work with
RDMA. I don't think this makes any sense compared to incrementally
evolving dmabuf with more optional capabilities.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
The point is that a dmabuf2 would most likely be rejected as well or
otherwise run into the same issues we have seen before.
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You'd need to be much more concrete and technical in your objections
to cause a rejection. &quot;We tried something else before and it didn't
work&quot; won't cut it.</pre>
    </blockquote>
    <br>
    Granted, let me try to improve this.<br>
    <br>
    Here is a real world example of one of the issues we ran into and
    why CPU mappings of importers are redirected to the exporter.<br>
    <br>
    We have a good bunch of different exporters who track the CPU
    mappings of their backing store using address_space objects in one
    way or another and then uses unmap_mapping_range() to invalidate
    those CPU mappings.<br>
    <br>
    But when importers get the PFNs of the backing store they can look
    behind the curtain and directly insert this PFN into the CPU page
    tables.<br>
    <br>
    We had literally tons of cases like this where drivers developers
    cause access after free issues because the importer created a CPU
    mappings on their own without the exporter knowing about it.<br>
    <br>
    This is just one example of what we ran into. Additional to that
    basically the whole synchronization between drivers was overhauled
    as well because we found that we can't trust importers to always do
    the right thing.<br>
    <br>
    <blockquote type="cite" cite="mid:20250115151056.GS5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">There is a very simple problem statement here, we need a FD handle for
various kinds of memory, with a lifetime model that fits a couple of
different use cases. The exporter and importer need to understand what
type of memory it is and what rules apply to working with it. The
required importers are more general that just simple PCI DMA.

I feel like this is already exactly DMABUF's mission.

Besides, you have been saying to go do this in TEE or whatever, how is
that any different from dmabuf2?</pre>
    </blockquote>
    <br>
    You can already turn both a TEE allocated buffer as well as a memfd
    into a DMA-buf. So basically TEE and memfd already provides
    different interfaces which go beyond what DMA-buf does and allows.<br>
    <br>
    In other words if you want to do things like direct I/O to block or
    network devices you can mmap() your memfd and do this while at the
    same time send your memfd as DMA-buf to your GPU, V4L or neural
    accelerator.<br>
    <br>
    Would this be a way you could work with as well? E.g. you have your
    separate file descriptor representing the private MMIO which iommufd
    and KVM uses but you can turn it into a DMA-buf whenever you need to
    give it to a DMA-buf importer?<br>
    &nbsp;<br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250115151056.GS5556@nvidia.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">That sounds more something for the TEE driver instead of anything DMA-buf
should be dealing with.
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">Has nothing to do with TEE.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">Why?
</pre>
              </blockquote>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">The Linux TEE framework is not used as part of confidential compute.

CC already has guest memfd for holding it's private CPU memory.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Where is that coming from and how it is used?
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What do you mean? guest memfd is the result of years of negotiation in
the mm and x86 arch subsystems :( It is used like a normal memfd, and
we now have APIs in KVM and iommufd to directly intake and map from a
memfd. I expect guestmemfd will soon grow some more generic
dmabuf-like lifetime callbacks to avoid pinning - it already has some
KVM specific APIs IIRC.

But it is 100% exclusively focused on CPU memory and nothing else.</pre>
    </blockquote>
    <br>
    I have seen patches for that flying by on mailing lists and have a
    high level understand of what's supposed to do, but never really
    looked more deeply into the code.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250115151056.GS5556@nvidia.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">This is about confidential MMIO memory.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Who is the exporter and who is the importer of the DMA-buf in this use
case?
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
In this case Xu is exporting MMIO from VFIO and importing to KVM and
iommufd.</pre>
    </blockquote>
    <br>
    So basically a portion of a PCIe BAR is imported into iommufd?<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250115151056.GS5556@nvidia.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">This is also not just about the KVM side, the VM side also has issues
with DMABUF and CC - only co-operating devices can interact with the
VM side &quot;encrypted&quot; memory and there needs to be a negotiation as part
of all buffer setup what the mutual capability is. :\ swiotlb hides
some of this some times, but confidential P2P is currently unsolved.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yes and it is documented by now how that is supposed to happen with
DMA-buf.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I doubt that. It is complex and not fully solved in the core code
today. Many scenarios do not work correctly, devices don't even exist
yet that can exercise the hard paths. This is a future problem :(</pre>
    </blockquote>
    <br>
    Let's just say that both the ARM guys as well as the GPU people
    already have some pretty &quot;interesting&quot; ways of doing digital rights
    management and content protection.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:20250115151056.GS5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">

Jason
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------hK0g69PaoqCkq408583AMHwR--
