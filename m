Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD6F9F2E40
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 11:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CA710E582;
	Mon, 16 Dec 2024 10:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DJUE68EK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C8810E582;
 Mon, 16 Dec 2024 10:38:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=saAeLI8zHdbIiDMwu5uBcRNEtrWFYYLeGUGqHbpnVyXxJY9OGuO3c9B90lJ818Yx1Ck2e7fRdbgo5IGJUbto3bycWksAr9G60zG49pgvpuSs4OcnPasjEC95/saE7cCZ/krvsqaT+B9zM4oR7hwHRk2Lbnqa4FnR1NNmgC+iVijyp7PFRIuoeXa6aJ72bGKNmCH0Fnmj2FdCGHt1u5Xp91luSnwn/pkbD/93UIQA+JkG6MklAzD9eIoZEnnBOWNo0cNPdTeHqp0DffRTd5X/IyGxPV/yr9YgZtjbguAb4gYa7UgZKT/o/AjYu55gfPTLbCTuR0m5g9Iq3tPmGE/PYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Wj3k7zxKtyqfNY8hByWVe/jhgD2pNlN2gflZoA2WPo=;
 b=H1VxIm70B/oJR+mrD7oEpJlUk0TwPCyt47La0B19Vat6168Qv+mofOrI4r3eG9NQU8i9K/E0CO0j/icQgZU1zWFLPgJPBIUfr50QjZ602Q4HmfGMFY8lnwOxUQ8YNfiG2VNzNOZKIW+fmyQRAxzgRftgZsIlxn/ptP9dGb6GtQMJ8b1Z2he/Agej9vLB6CSRl1iu88HxY2JP+Sl4Bdnww+G+56sbTXbQhQCgbUAmhghh4Qm8FBs4nJcruFq0+T+1w881u8FQqv8ZTXxsilp+Al5a4R+or1KzHB9QNTuKVMe6neY86BAxtqOsKRylqhLMN05uPDYUONtINrHA2Lr1PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Wj3k7zxKtyqfNY8hByWVe/jhgD2pNlN2gflZoA2WPo=;
 b=DJUE68EKxtrcqoXfuTqCTN3TcDqZuQtfd0XiC7OOjXE+4CzcurMrbw31OICb8bJYTqKvCYuVhNymuohYrQBepjBBHWwA+DK1hPr+8nNf0tOwr4njb+zZbLUw5Lw7rvSBRd9LGSqCF0UjRnGHA4VffB+nHU9+9H5eY2X2RvPuuD8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) by
 IA0PR12MB8905.namprd12.prod.outlook.com (2603:10b6:208:484::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.20; Mon, 16 Dec 2024 10:38:21 +0000
Received: from DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290]) by DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290%7]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 10:38:20 +0000
Message-ID: <7c64746a-c1f6-46c6-a97f-cfd87e9ec3b7@amd.com>
Date: Mon, 16 Dec 2024 16:08:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/amdgpu: Use device wedged event
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Raag Jadav <raag.jadav@intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241212190909.28559-1-andrealmeid@igalia.com>
 <20241212190909.28559-2-andrealmeid@igalia.com>
 <d9f2583d-da79-4532-90fc-85028e977ceb@amd.com>
 <c7c498f0-2ee3-42f5-9b45-c87e52ffc3e4@igalia.com>
 <Z1xGe1X_XzB00J1Q@black.fi.intel.com>
 <ed83b0a1-62d1-48e5-ac7b-478be3043733@igalia.com>
 <28d7dcd8-ed3f-4e52-b7fa-c348a827085d@amd.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <28d7dcd8-ed3f-4e52-b7fa-c348a827085d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::19) To DS0PR12MB7804.namprd12.prod.outlook.com
 (2603:10b6:8:142::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7804:EE_|IA0PR12MB8905:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e276046-e5e9-4e8a-b29b-08dd1dbdc26d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmlaT2F0QlUwS3ZBM3RqR0VpaVpaVndLU2grYUJSaVNkTVB2cXkwVTBXRGhj?=
 =?utf-8?B?ejNxSHZja2d3VTZCcHd0WWp1b0V1WVdxRWJYZzhiY3UxWUFWMjAvNW1qWW5E?=
 =?utf-8?B?clZCbDlkeWpqNDJDVTFNa3pCRlV1UzBuODJFdzZDQXU1TnZuNXBqV3h4RWJ2?=
 =?utf-8?B?RWlHUUZ6dzM5bFdRLy9KeENBdHV5UFNnbjRxRkJCT1d5TDdhUlJIN0Z1WWdp?=
 =?utf-8?B?Q1JNUGZHK0xEVjRzek9obVY4UUU5d0hOdTFUWlNLUFVzZlNubjhDNEwwRW1k?=
 =?utf-8?B?L3VRajNGTzIrQ3U1Z0d3aTZzTTlwRjk4cTlRVHlBM1MwWE1tVThHUkswdmlS?=
 =?utf-8?B?WGdET25wVDczL0FJbU1MVlRtTWpnK1Yvam9ub1dRWDY0SjZ2aTNvNXRIZjlj?=
 =?utf-8?B?b1gvb0x0NDlkYVV3TGNrdE9LRGVBMHpsWnRqa05OQkZuRzZGRUdDMXFzcTdY?=
 =?utf-8?B?N013MjhTK1Qrd1Uvbmpnb1dmVERIdldaZUNoUTVTV29QRUhzSElkM3Exejgv?=
 =?utf-8?B?M3UyekVBUG5QcE9MWEk2UEVGeWpLRStzd1VhVlR3L1NLM1FHd0tGbWdla2pr?=
 =?utf-8?B?OFZIUnB5dzZtbU9iUGo3cE8vNHYwSGlDY3ljWlFvNkt1aHFyOVFENHpZN1la?=
 =?utf-8?B?eUR6bStMaXh5VmxBWjNHQjlPQVp1YnIrMW9qTGpBVUt2NkpMUSt1VmNsRjBl?=
 =?utf-8?B?YlprVkxFcW90TEJqMjJ5N2VoUllsNlBQNkV4SFE2SzUwZTBTWWhVa3c0S0VF?=
 =?utf-8?B?U2tyOXQrL3RmMjZ3VDVaWEVOMlk0MGNUbjFxRFJMSXZaaUtqenBUNDlENThX?=
 =?utf-8?B?VXY5Z09halYyZWZCckVZQUJiV0t6RkFxUXZpSjliS2JBajFScDlPYmFoRG5T?=
 =?utf-8?B?N2J1ZGtJVkExT3AxQVIzSHBnNDJyZ1kzallYR0txV2RkWmdjUkw2Y0cyazBz?=
 =?utf-8?B?SFR5aDAwYld2R3JtYXZOUWpzQU9XQWdFSitIbnhvTUpDdDh3d0NiSDhkbEsr?=
 =?utf-8?B?dFlJQ3F5UW03alZXcnhGT1VkYUV1L0RQRkJFaWZSSUdtWXZKUGhIdm4zdXRK?=
 =?utf-8?B?QTlrbzdmNUxVSmZjemR5Sk5BNjNaMXpLQVBFb0dYNzRzSzdqMHBTQlZnMEJj?=
 =?utf-8?B?ckZIUER0NGhPMThMcnlxckNNMmZWTnE1bUZDc0xMTERYVkZNN2hxZE0wOUxw?=
 =?utf-8?B?N0NsYVF5Z3JubnZKTVhLd3BkQ0MzcjgxUmZXSXpYamtEWWNLdE1jeW91MjRL?=
 =?utf-8?B?VDRyZG1BaEZoVGdLNlhuV1dNSEpzVUNSdjRkN2M4UGNGcS9Cc1JVaUtMM25T?=
 =?utf-8?B?c1k3Rml0K3dWMzhtSzU0NER6MjQwb3hOVzEwcGRsVHZSS2UrcUlNMk0wa3dJ?=
 =?utf-8?B?dzBNTDJvd1J0bXhXQVBNWnNveHFaVnB5cEZFRUhDT3paTW96ZUZnM0FQeVgw?=
 =?utf-8?B?TzlMQTk3a0FIZ3JGR2wvVnB5VHdmNk1KRy8yaFl0dVdwVUF6YnE4TXRQM0kx?=
 =?utf-8?B?MnpNai9vd3NYRzNzSkpmSFBOaU5rV1BEaCtKM2RKa3hqeHlOM1liQ1lPLzdV?=
 =?utf-8?B?QzlnbnM5NEh5Z3NXQVFsaFIvejJ4RWkrbHBiRlBoM0NuQ2JnZGtnYVZmL094?=
 =?utf-8?B?ZTRhNzlSK204MmE0KzJob1czM2M0VGJQUWNsK294NnBCbWI0di9wbk9vVXVT?=
 =?utf-8?B?NFgwYVNySEFIUlhBcUJDK1R6SFdwU3VoanluQVlITjk0NEYyMEhZZmlGNmJD?=
 =?utf-8?B?QXRyTVVJVCswTG96d2RQMUdWblhkejlhWUc3MWlDZkp2cVVkaTNoVGRkemd3?=
 =?utf-8?B?TmhkTXgrdldQdmYyWFBJWXFBNjIyaWRzTGl6SldNZmorSXpnN2JJS1hxcFdL?=
 =?utf-8?Q?xfkPS39Iu/zOu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7804.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjAyaTZyUG1FekRxMHQxS1UxbzkzMG82R09WNUJ4SDJLbU9rdlJKTkZzclk0?=
 =?utf-8?B?YVRmYnN4N2V1ckN6elgzMEZ4VUJVUGFvV3dCVVQ1amxKaStzODZZcEp4WWlV?=
 =?utf-8?B?WjR5RXJQMUNsT0J6R3BtQVFNOVdrSUlOaVNjTUtSWEovTXlwVVR3TTQwcU9W?=
 =?utf-8?B?bUM0azlNdGlsazBUakJYNTB3Rit0alZkVEl2Z1RoRlZ5YmVnUkdLL2d2QWtE?=
 =?utf-8?B?cmJMQ29YeFBmMzJOSG9tVkttcWlUVG1QOTdYTlRtbnpGeU9VU0QvdXJtQ1pO?=
 =?utf-8?B?ZDZzMVpOdFBkd3M1R0ZpVnJ1YnMxczRRaDJ5Z3IvRkVxY2dLMUZwR2NQM3Vz?=
 =?utf-8?B?ZE84Qkc5ZGtSUlVMODhyUDljdzhBcksya3NjdjEzK3ZGbGswc3lLbFdNQm01?=
 =?utf-8?B?ZGIzUHE1WWUzOGpNVGJDbWdCaHoxSlQ4Q1dZRVlXa1QxenhYT0lFREphNW5R?=
 =?utf-8?B?TFVEbzM4TUNUaFdPVjU2My9qM2pxVnFtdnRXOThSa1lDYmhZS0VZKyt6aUo5?=
 =?utf-8?B?YkF4ZmNrUzUxNmttVnVnOEhkUVRYc244WEZGc1l0aE9jZktpbVlUMTNIOUVV?=
 =?utf-8?B?dlRoektaRGdRNU5PY05NaURkRkQxVUh6bWl4UExEQnk2M1Q5WVNDNlJDenFF?=
 =?utf-8?B?V2NPNjlINHl2bWMzenZGWDR2YzNnTmEwbjFlRVZpZklEMjdpdUdKZWhmQVMr?=
 =?utf-8?B?ckFuZzRDaUpGemh5VXk4NjZxTDF5dHpyM1dHMVFXdmcrVlJ6S0hicDNrYnRa?=
 =?utf-8?B?QjB4MXBQV21yRGlQNEpzL2s0a2dUQkYyeFhQVXoxTFFNT3hGRkVJMzMwS3ow?=
 =?utf-8?B?RzFHZDBlcG5lMUxudGJVMnhDbk1HL1FNeUFhUndVQ215NjRLeHhlUDM4eE1Z?=
 =?utf-8?B?a0psTy9kZ1gwUGE3U1BEUWtRSzlRV0RiQ2loZ2dmZkJQMWlqa2pKTnd3L0Jp?=
 =?utf-8?B?UUMvN20vakhVMThkV2ppdWVOLzMxZ010TjVNK0dIVjlhUFJOQzJOSEVjZkh6?=
 =?utf-8?B?dzJjcUh6WUxTOTk5YiszL1FSU2FEMmhLTWZCNTNGTjBESGMwZjVhUGFjMjk0?=
 =?utf-8?B?a2VmY0dSdWxsaTdqNTk0TXY1ZEFSSGo5bmI1YzV2aVFzdENmaDhtVDYvQWZa?=
 =?utf-8?B?bEFFWXh3dDg0eGlicDB2ZEluZllJK3preDJqa3dPak5GMHBWRWVDV3NtWTRs?=
 =?utf-8?B?bGZCVTVWZkdORFBqS1JXelhsRE1GREdhbDZDK01XVEJQeHpsVGNrODRZSm5V?=
 =?utf-8?B?cllFMklpWEZkY1l1NWRkdStQMjNRLy9la1I1cjlIalVTK1pESGMyOXQ5cTcr?=
 =?utf-8?B?eTY1Qy9rQ1dkWnIwZDh5UW1CTDVBVEp5YUhEMG1PTGZlK0NrK3ZkYkFjODVC?=
 =?utf-8?B?Q21KeStKOHZ0S0dwNVRkZmJVZ3NBV29HZVhyOVJETDljTnI2V0FEZ1Q4Z0Jz?=
 =?utf-8?B?NHM3OWg4MFkySGVwdlBrbXZIYnl4eTBLZGVRSFFCcW5aMnVVb0lJZ08wcjV3?=
 =?utf-8?B?MC92WVIvS2pUcVdSUTlpM2RrU2tmbm5KUmxNc0N4VEhzQVhINkpnNE53dFRu?=
 =?utf-8?B?T281TkMzR0Z3U1VHVDNjRGFwQ08zdWFla3VtWnhpT0JqN0ZCcDJNZWVXaTBL?=
 =?utf-8?B?NWRDWXMyRk5oUW1KbVl6MWlTTi9BS05yQWpVMkE1UWJDeGlaNkR6U09ZYktH?=
 =?utf-8?B?YmFGWVZGdkJOUjhtMGMycURaeGZOWFptcjNBUXRTV1BrNmIzNUNJWHhwTGhJ?=
 =?utf-8?B?aEsvcUdQcGh0c3hoVFYzWGtyRGtwTzcvbzM1dXpmSXh1Y3ZIMTcxa0FuS3Nj?=
 =?utf-8?B?MkRjc1lnWGJ3NWFkOStjUFpPbU1sRURtV0VPS0RvcWE3L2FKVmlPcTVTT2Vm?=
 =?utf-8?B?aUgwbVlzaGlFelpkVWRYNU1mdU4rOSszWEljNnRPNEVXZCtJM1EzWnVBUFRW?=
 =?utf-8?B?cGxUL0N4ZmMyWm9nKzFnZXIxNVdMMytrVHM0NEJSWVRVSVppWTRiRDdXb2lP?=
 =?utf-8?B?ZWdWUFA0S1hhTkd3ZlJ5MGFxVWhRWWRjM3gxOHFSNGdlUEdNQ29BN282dXA3?=
 =?utf-8?B?dzNPZVVJa0dsdnMzeDdhVWpITnV2dnRlVlhsQ2ZIWTRnZTFPbURORFVzWUJi?=
 =?utf-8?Q?xcyuir7oTK5JXrcT/Y4VJOzNA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e276046-e5e9-4e8a-b29b-08dd1dbdc26d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 10:38:20.8498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZgLksDmO69/az6XIUiX3h/KnaWhKLW20ZH3L8U6oqjXXgErRtqtVDvKGG0wl1wC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8905
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



On 12/16/2024 3:48 PM, Christian König wrote:
> Am 13.12.24 um 16:56 schrieb André Almeida:
>> Em 13/12/2024 11:36, Raag Jadav escreveu:
>>> On Fri, Dec 13, 2024 at 11:15:31AM -0300, André Almeida wrote:
>>>> Hi Christian,
>>>>
>>>> Em 13/12/2024 04:34, Christian König escreveu:
>>>>> Am 12.12.24 um 20:09 schrieb André Almeida:
>>>>>> Use DRM's device wedged event to notify userspace that a reset had
>>>>>> happened. For now, only use `none` method meant for telemetry
>>>>>> capture.
>>>>>>
>>>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +++
>>>>>>    1 file changed, 3 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>> b/drivers/gpu/ drm/amd/amdgpu/amdgpu_device.c
>>>>>> index 96316111300a..19e1a5493778 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>> @@ -6057,6 +6057,9 @@ int amdgpu_device_gpu_recover(struct
>>>>>> amdgpu_device *adev,
>>>>>>            dev_info(adev->dev, "GPU reset end with ret = %d\n", r);
>>>>>> atomic_set(&adev->reset_domain->reset_res, r);
>>>>>> +
>>>>>> +    drm_dev_wedged_event(adev_to_drm(adev),
>>>>>> DRM_WEDGE_RECOVERY_NONE);
>>>>>
>>>>> That looks really good in general. I would just make the
>>>>> DRM_WEDGE_RECOVERY_NONE depend on the value of "r".
>>>>>
>>>>
>>>> Why depend or `r`? A reset was triggered anyway, regardless of the
>>>> success
>>>> of it, shouldn't we tell userspace?
>>>
>>> A failed reset would perhaps result in wedging, atleast that's how i915
>>> is handling it.
>>>
>>
>> Right, and I think this raises the question of what wedge recovery
>> method should I add for amdgpu... Christian?
>>
> 
> In theory a rebind should be enough to get the device going again, our
> BOCO does a bus reset on driver load anyway.
> 

The behavior varies between SOCs. In certain ones, if driver reset
fails, that means it's really in a bad state and it would need system
reboot.

I had asked earlier about the utility of this one here. If this is just
to inform userspace that driver has done a reset and recovered, it would
need some additional context also. We have a mechanism in KFD which
sends the context in which a reset has to be done. Currently, that's
restricted to compute applications, but if this is in a similar line, we
would like to pass some additional info like job timeout, RAS error etc.

Thanks,
Lijo

> Regards,
> Christian.

