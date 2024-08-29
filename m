Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C045C965054
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 21:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDC110E0E3;
	Thu, 29 Aug 2024 19:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sJeVhYuB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AC210E0E3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 19:58:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VgP+Arr1NyTuwCM1z9+Ep9nxYyGKuBefvF4bfgOWlKxXuc/SlwgOIa1/13VMZ6MBs7ZIhXtjtCRE8ZyaCkTVieFkdjTUG5fqWlx3wbHSB/jYhrzFoekWa73gm1DrpOHb+R1dVCKPZsigaFGrm9lwNdSDbHB8qBwBe8cwfE21zeX9nynZDA+ehBtUP/WzAsPx7MR3PEKpj/ha/seOxAwE3B28F7lkH9GyGDn3IEjDrKe/0gx46o1/O5o+FOB+r/+M07HVo9anm64ilXN55bJbi9nRUafRnRk7IQ0UDvukcuDV8t5jsZiBbN1fiQI4lOM4ThN8VSIAcOTzjCm36jvzIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFx0n/yF87em17i2mnjYW3LQtM+37cEMIi7hga86048=;
 b=jjjM2NtCknBWdvfXy5YYyoiyoOn6Eu5/XQabdB6vYFeXlWd9ZyurmctQVKo3VT9G4fZaB5mlNHDHnQMibObuWZpKGDAn6bibi4Kl2jnQyK1TbaJvWc8gi/q622IC5aABbGdxopgCdQSK+iPX6QJaDIzRy+gpnzflu/3FWDXT9yDDL07Vl7hmBnI8FerXavU0u8VV3tD3rIUnQL5ANVgO+9ULbHsL7oG1veF0RV6gMv1cWs1E/cwQXLOjZ0AN+jKse7D85vBHCvmldvklqplW2s9Y/VOtADv1d6LNgTOYxMcrlc7NqMFXI2oEc1/bdj3JNaYajnOwi95TbNXkyMeQmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFx0n/yF87em17i2mnjYW3LQtM+37cEMIi7hga86048=;
 b=sJeVhYuBNokZzmr4xk6SwOxv+HKyQGhPFp9etFQ1krs/Nt/dHleRVeNvjbPnSDNs/9xePIdVnC92jdFW9cUc9MK15Fo2aApQE6VF4ahZdrXTGPJywDX7yIgktg6sQ5KdWOntelJ99g9xLUEbAtUf1sS4GjBTVVqgix7sQlw9A0o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18)
 by DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23; Thu, 29 Aug
 2024 19:57:58 +0000
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::25c8:f399:b2e8:1947]) by SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::25c8:f399:b2e8:1947%4]) with mapi id 15.20.7897.021; Thu, 29 Aug 2024
 19:57:58 +0000
Message-ID: <106fdf86-9705-4ce9-ad16-b9eca164d1af@amd.com>
Date: Thu, 29 Aug 2024 15:56:46 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: register more drm device nodes
From: James Zhu <jamesz@amd.com>
To: James Zhu <James.Zhu@amd.com>, dri-devel@lists.freedesktop.org
Cc: Alexander.Deucher@amd.com, christian.koenig@amd.com,
 daniel.vetter@ffwll.ch, epilmore@gigaio.com
References: <20240530153439.4331-1-James.Zhu@amd.com>
 <6a447a16-2d81-42a7-bcdf-6a9805c92d20@amd.com>
Content-Language: en-US
Organization: AMD RTG
In-Reply-To: <6a447a16-2d81-42a7-bcdf-6a9805c92d20@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0112.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::28) To SJ0PR12MB6760.namprd12.prod.outlook.com
 (2603:10b6:a03:44c::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6760:EE_|DS7PR12MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: 22db0c3f-19f7-4759-b4b0-08dcc864e16c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzNMcjJoZzhZc1R3TnFiTlVYYXJhZVJTR1U4WkFsYU1JNzU2ZTVjVE0yQ3Rq?=
 =?utf-8?B?V21KeldrVTJHcmtXOEpGWENzVmpEWEttQlcyTGJYblg3aVNOMk03RCtZOWly?=
 =?utf-8?B?Q3N6MFpzZEY0L2p4cms5eG0vRmNwdUxKaFBwTUxqT0RpUWUydldEcXlnSDlV?=
 =?utf-8?B?L2hyQnFqNmptb2FqMDk2NFF1MGxjbzhHMFNSM2hTTzZuM1d3Q3I1L01sY2lr?=
 =?utf-8?B?azB5QVdBeXVQbTJFQW5YZlo5OGphbEVJTjlqMjhYcVdEcldSNUNFbkhsbHZl?=
 =?utf-8?B?WEoxNVNzNFdHUmRLRy9RSWRxeEYzdElrZTFKN3JKamZydTJ6c1I2KzdXdll3?=
 =?utf-8?B?TDJjYnRROXFJOW1qcW5uTmk5QkRteHpCbXYrL2dPZkxLamFCaXNHRzdUMnN5?=
 =?utf-8?B?SHFNZ2hJTXVyaWZQWU1MeXpNMjFnRW5QaEgwRmgyaUZLdUZ5eTBPL0YyWDI5?=
 =?utf-8?B?Mm1aVGYzQnBoWEJJRjdtUXA1bDJGUlBNNW0wcXg5bVhIMlk0VmthRFBXb3Bs?=
 =?utf-8?B?dUsrVHpNSmoyMmxiazJKMXRzcUdOWk8ySHVzV0d2czFUMDBEdlpsdUt3WWt2?=
 =?utf-8?B?NlZWUGU0ZGdWMUw0Sk1WNjB3Mm94RVVpek5QSEl0ekNDTUxIdzdWZjAyTGJ6?=
 =?utf-8?B?MnNKanYzL0lhUGlFRkVVMTJLbDdWZTFZbnY2WUE4QW5vTjBZTjhvT0tQL3cv?=
 =?utf-8?B?ZTB6UVBhQkNwMU42R3VnanlTWHN2RDhIKzdsNHVUQUVEeGpwaytEWEplVEVH?=
 =?utf-8?B?U0djTFNqSnAweXhkVmVGblJDUmZZWnIrNHNzUTRhUk14RFhudGNzc2NQLzFV?=
 =?utf-8?B?R1hVUG5zZ1BaNzdUVTdUd0V2Y1gybFZac2t3cHRMbVk2c3FpakljK0tyT2ha?=
 =?utf-8?B?cm1LMkJoeGJnVTVNZWY3L2loTFJzQ2tXSnM1WG5XRm1LMHVtaVk4dk9GMm8x?=
 =?utf-8?B?YzcxNHA2MHpyNDJOSFFyZi9GdFRWbjBhU1FKMGtMVUpnZTRtSXR0a29sd1By?=
 =?utf-8?B?RWFVeVU0NjYyU0V0UE1TcmJvV3V5TXVLdHRDNXFjcnRDSEcxaHJsOU5WN0cw?=
 =?utf-8?B?L2VTcWdubFlEMFZFZXpsYzkrSDlYNDZUdW1NQUJOSGQvd2lXNnRacUpKWU5P?=
 =?utf-8?B?ZkNjK1NvVUNKSDlWakplM2Z2NjVlV1ZkSzJYamJIdktQNGUwWDQxMmg1d0dJ?=
 =?utf-8?B?eUhtZzdHSHUxRTNZNThZL3d1aUw2amRlUFd2emlrc2JJYlhld3hDWmFOMElD?=
 =?utf-8?B?QjBZdVJWa0ZRamV6b09Xd3BtSXAzbE45a29hSUY5WitQb3c0U0dHVVhDdkFV?=
 =?utf-8?B?T3ZjZ3pWTEVidkswdSthOWxIOFUxYkF0b1N2WXFSbmYxSXhvRkVZVytsQkZz?=
 =?utf-8?B?bmdNcUgwMlkzU0dHeEQ3VndGZGQ4bWJ3OWEyalBESWNZZUFRMFp0VDZsWW80?=
 =?utf-8?B?czQ1WXNIUzB1VDVzOUppKzZLaGI0NUo3dUxqOWNZTnNNSE11YWtkR3dVY2dv?=
 =?utf-8?B?YXBZbHN0QlRnUEdBdGErNFhQRmI3Z0RHWWVrNG5Ha0k0bjhrVjZOMTZVcmRS?=
 =?utf-8?B?QzVxdUErUkc5UnNWV3NUSWpQTXpMRUJtUVpvdkEzQUNkWVVvR3NnaGZwekZj?=
 =?utf-8?B?elUya1ZlbDV0dlR1N05hWWxwaWpScHhqTVA0a1pUa3oycXZobFlINjNVaUxw?=
 =?utf-8?B?RWtRQmlnNlBxYlUwQWwvVUl2T0RVQXp1RE1EK2ZQbDEwS0xNWE1xZ3E4N0Uz?=
 =?utf-8?B?emlQVkJxaTJ0REl4UEphV0NaQ1NFeVAvdS9sYXZxeHpFb1cva3d1MjlVWTY2?=
 =?utf-8?B?WjVLWDg3TE4xYWhDYld6QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB6760.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlRlbVY2NzdDbHcvRUxCRnV6aEl4VzhmZTZ4SnJseU9ZaTZ0aldVNWNsZnJj?=
 =?utf-8?B?WUlHM05jVVBWcWY5YnBTRmwwYlF6RDhoeEduY3U5T2l4YWdxeUFhcGdRRnhM?=
 =?utf-8?B?SkNmbHNqWk1sM3dGTlZyMFJyd3ZqTTN0RkRNTHhCdWpHWWVDT1VvSzFzY2RT?=
 =?utf-8?B?QVc3ZnUvOElIbW1yUVV4VFVXNGMyVlh3TTZwVW1GK0FFaUgyRUwzeFpnb05t?=
 =?utf-8?B?VmdPVWhkMDhsNlVSU0pSUmlKMFRVTUpsMzlaQ1ZlcG9sVytsRWU4bTBSNzVK?=
 =?utf-8?B?L1lYRFVVSW4yTWtnSENHbGRLZzB3SWYvM0s1S0FwVnIwZ1hyL3BTR2JTaGNB?=
 =?utf-8?B?MmtBMGhjUExVWDVNd2RHZHl2aVM0QUxBNUgwMlJoS09vb0xKbDNyQVlETUFs?=
 =?utf-8?B?NjZsWndoUGQ5akFlVFN5R1FYd0hMRXR5MTVkdW9HOGNQVXY3azN0NytwbzYr?=
 =?utf-8?B?TlNpUTZuelEvVVdReXN0T3lTSmRIOFVnVFlTaWxSUG0vNlRWamxEbHMzUTFY?=
 =?utf-8?B?UUJFdUNHb3U0THBBamU3eXNTWkNUcHhVSmtxaWR1WWRIdDVKamdseEJrSHky?=
 =?utf-8?B?T05vci9xeFpZWEsyOWo2R29OQmo5QlUySFcvZkFGaWVOUVJNS29QVEN6V0NN?=
 =?utf-8?B?aXV6dE1rMDFjRnV2dGlWNDNTUkxlbmJNVXg4MmtIZ01JMUJ3KysyRnhGWXdV?=
 =?utf-8?B?QjVIVndMUDBIVzNUa3ozdW9vemt0eG1ubEIzRUpwTm5QSEw3VHZ2cURXbXZx?=
 =?utf-8?B?VTlsaFBaVmNCVTZzV1czWmczeXY5anRtNDZzYTI0Wk9lZE11ZENYbFpQUVE3?=
 =?utf-8?B?Znh0dUNreTNtQXJKS3lCT2ZSUXJGTzZIalBCTm9iUGxKZCt6WFBBNFBmR0Za?=
 =?utf-8?B?djFlTUc5UDkyZmZ3NEV5bFIyMUE0YmthbU00dzdRYUJub2lOcktIbGhWa0NS?=
 =?utf-8?B?SURycHJIZVhaRUdjaS8rdHkvcjRvNHlZV2phMEU1M3liTU1OcXBKdmJaYllx?=
 =?utf-8?B?Y1h6L1BHQzQ1WjIrZlh1OEZBZ0JCcEoxTUlQcUp0bCtpOUdzTVRMUUpTZ0pR?=
 =?utf-8?B?ZFk3VmIrbEJaT3hLME8rRmJQazNxSWZBcFQ1Y0NQYmdKWUp6VEw5eDRibkF5?=
 =?utf-8?B?VnNDcy8rR3lsSG0wWkxjc3hmcXlGMGVGR1U0VlNuc3NwZUtuNmFpWGVqeFd2?=
 =?utf-8?B?cy9ibjAyTjRua0t2Mk1pVWNyN2F3cXRqRGdWbnVKbmZGQ3ZiYStOdHFIWVZv?=
 =?utf-8?B?cnc5cGdxY3ExUmxqWWJESmRsd2dFeXVlR0FRa0F5Zm9tZEhQS244b0V4UGVa?=
 =?utf-8?B?cE1VU0JVUHNTUExDSWhXdXRYdm9GQ2p1aFdIblFGV2ZjdTNjZXZFT2x6TExL?=
 =?utf-8?B?SXpyUDN1eVVnWGVmRUE4UVRzcUwxbTFHSkNmWWVvZVA2TnljVFdoZVdxUzgw?=
 =?utf-8?B?MmtKblJQRkFZOGQzQ1llWE8zV0NiUWdkWGVlWWF5dFlUeUVNZXhJOGJGNUhU?=
 =?utf-8?B?VTM2SlVUdnoyMmNYSStoMTEwWWpTZWl2K0xHSXNGUE1QRUxHQXZBN1VFMnZ1?=
 =?utf-8?B?K1pnSmlUeWRCNlJDQ092R1Z0OGg1REd4RkZwTGk0OFR0VitIYnBjZHNzd3RR?=
 =?utf-8?B?QjRPcmhBV3VNZjhDQlI3ZzdpMDlKNEs2UkMza1Q2THU0SUp1MlJFa3dORWpw?=
 =?utf-8?B?a2U4SkpiK3BFTjJvRFY4Lzh6WEEvTG9OQis2WXpObldmSzl5OXA1QlVPeXhj?=
 =?utf-8?B?TkV2b2I2T0thWHB2UlNOanloZVR5M2cvT1dWb09FMENmdURtdjNqMDdFUzQ3?=
 =?utf-8?B?VzYwMVhibkFRTUFPYjNXSW5OZlhxTDZpVHJ4SzQ3OGttd1BwVTdwSTJEY29u?=
 =?utf-8?B?c3d4dFVBNE1URGFORllKcUJNd01tUHV4aktyQWZrbXROM1lHQUJ2YTdyaTZo?=
 =?utf-8?B?cVJhOURiTGcxb2UzN2NEamEzZy95UFBBSnRjWWZ1TFZuNWFQT0w2TWk1ZEtJ?=
 =?utf-8?B?bURCb2FwM3hRZi9nVEEwU1pCdWllaWRwTUN2aENlVnB1aklJWlVxdmRJZElr?=
 =?utf-8?B?OG1MQ2JFU3RvclgwaW96ZEVDZk90WitnMWMvL2wzQ3p5OHRCc1NHSDQwb2JD?=
 =?utf-8?Q?Fsi3MBH4TPvkGaELloj1CcZNj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22db0c3f-19f7-4759-b4b0-08dcc864e16c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6760.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 19:57:58.5790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: faemCVQA5T7iR271wkLoco2jqX9l4N07IRmMv8wdpBRrgie43Db2vujOolU7hPYK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6095
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

Please ignore this. need update unregister_chrdev in the meantime Will 
send out v2 later,

On 2024-08-29 15:51, James Zhu wrote:
> Ping ...
>
> On 2024-05-30 11:34, James Zhu wrote:
>> Since the default number 256 can't handle large modern systems
>> with large numbers of GPUs, specify a more reasonable default.
>>
>> Signed-off-by: James Zhu <James.Zhu@amd.com>
>> ---
>>   drivers/gpu/drm/drm_drv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 243cacb3575c..719ea57a70ab 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -1086,7 +1086,7 @@ static int __init drm_core_init(void)
>>         drm_debugfs_root = debugfs_create_dir("dri", NULL);
>>   -    ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
>> +    ret = __register_chrdev(DRM_MAJOR, 0, 1024, "drm", &drm_stub_fops);
>>       if (ret < 0)
>>           goto error;
