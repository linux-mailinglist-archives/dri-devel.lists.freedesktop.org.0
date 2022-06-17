Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2020E54F70F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 13:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386C611ADAC;
	Fri, 17 Jun 2022 11:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2086.outbound.protection.outlook.com [40.107.236.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA3011ADA8;
 Fri, 17 Jun 2022 11:57:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gwk0hMNTA+dc5XfWk8asbCL9BO13gzCQLY64frySKW6qz9fjUjzOTTczvXeIdwurVflPnX/KTr/L4KWt/kCziNWSu2vrDM9VzFV/9MuDMVWESqYtjvCHUqoLO3mDneCS3+ctB8ED/Z9drjmnkKiwMb5AO5WSE1Z+KTh1XZUdZHgaEPXJvNMGIW134WW7mkNdRx5vQFULzBeaL3Qy7U6syVol7vTJwXg5lesrNsF8t9zM4NPFkOR3xU5DS1zlOzfhxctE7YjatGVMUyEE5OR+kTwNpmPZyrJW2nmzHj4xii0Mj607xxAENo2xWFgK08hHFc7N6W+ErYW6gOWPnNqkpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83lHgStkCgJ0H2iEfDtCzQCtgdy7mE/6aJeYkXYKPC0=;
 b=C5mrTNbgxP0xmGrGS0KN80zYOrEHXBbY9M6G/EP/zBEdeCVxO/iu3O3xG3/nsRmisADOKtB1ZgOxyWetal63QBVHtvgwUIEFz3L7QlxRa6+SRk76lxXuPw3AjYim6pl5Y/zAzNi+auVKXUqZUz21e3L7FCHj4ZzJ5CR3bBrN/8gWMhw4P80sPp6UEoqU2zLeKVGFKcO8tc2xTaPh+bKO7EAaPjBfvRSHochstuNEmyuvOQtTyzfe8VHE215FKijgG44lVmhmnr7eQLa8K0XZRuoN8KEz6MkFDNtb8ot4pEP/UdQVFC0PpxIWO96r/I1Pv70QNynFfft4WG+I33rrtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83lHgStkCgJ0H2iEfDtCzQCtgdy7mE/6aJeYkXYKPC0=;
 b=3EAF3G/rvy4XtzW5GRzPPWJbM1NDKPQbcU46B3bOAbj7JbWAr3doDioZSWd9tz5SRNFUG/HZCr7rW4BJ+Sd4tebTQ1HtHJ8s9vnWP+k07nACh+jfX0cAe9IwBbJIMjdGFAdls/kD9Az0xI76j5Py5vJq/yv1Sb+kyDJbixktBjM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB5700.namprd12.prod.outlook.com (2603:10b6:5:36::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Fri, 17 Jun
 2022 11:57:34 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5353.016; Fri, 17 Jun 2022
 11:57:33 +0000
Message-ID: <7adf78ae-8f2d-e6bf-2054-fe61dfd4b21e@amd.com>
Date: Fri, 17 Jun 2022 13:57:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: radeon driver warning
Content-Language: en-US
To: John Garry <john.garry@huawei.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <2850bbb9-a191-d723-f878-96482e7583cb@huawei.com>
 <afd3cf7b-7afd-1d86-0c24-b4b7101e4bd5@amd.com>
 <60a97869-fe1d-08cb-3241-91377d62b739@huawei.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <60a97869-fe1d-08cb-3241-91377d62b739@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0014.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::27) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 288a9747-a0fd-46b0-facb-08da5058904c
X-MS-TrafficTypeDiagnostic: DM6PR12MB5700:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB5700D8567D2A43128C5D2DB583AF9@DM6PR12MB5700.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QsRPH9MjjhL6w5lB1qY/zYbAd5zZhhQQRxPyPKm3A488L8qjf8ECRD2YbkS5TZ8Hg6WZpp7mGik0An4GcDEvbvAuG1rdZ5Co5L7QOcKqRx9AucvdeseFhldfZzzFn9kuuhhv2NtDChCvvU2jL15Y6vESV8+tUOON9ksA2v5KIWf3Tk4jZbpnbLjagupmEY95v6BCZJ3YAppuPQHT5c+6/YXa2706Pgquuqf73pjSFTzQpzN2ud01F8lZOKJLYprdVA4rg6D62lDe+Yt+dEC/6WIC7/VqqgkoVQYlbh32txSl1wUxq80kA5VmGOft9Y1xohigtPtxkO2AW1ShVGPBj6vC482Wr+3oPECZIBoI+JJgei5UUi3vWk175BNJ81an5y2ny1EajpDt0dutn9g5l/95ILz4H0egLKnA7gSjEc6nJIO8FlqHN4ya6O4pWB6w+1o7jV9dx+QuoghpVlBVga+17edHkSC+bcMpF5DZ6iadSUjm+m73v5/EpBiTxqB7VcmcqllPy+u+J+Dj3s3DmcAc2ZFCsQzeVyXK13fxu2IaQDFYih4l5KJnx3ZwsfAYvZ0egnbXV+p48nCx/ZmJ5FUStgBrAhKoopqwGZGp/i8LbPN4GyGWjuxeNsSXPbpjJQ86H1mNFoZXA41N2aPHSLmrhnan2iSwvuXOiykABSCIs3DR/ZCdLt9K2myuhs80H1ZS/G9fv/9AhYkC/VJF1fVVrmyDWs5G/reAepo+JBQ0F37dpBi2X344ptuoLz1KyICSL+zpedMPQoltP01WHoTksASc0qAVKe5LShS+iwjAQNT6thQMUrfOwVKbX5Wk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(66946007)(6506007)(316002)(66556008)(66476007)(31696002)(8936002)(83380400001)(8676002)(186003)(31686004)(86362001)(6486002)(2906002)(6512007)(7116003)(38100700002)(3480700007)(508600001)(6666004)(45080400002)(5660300002)(36756003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTZzTW1mbGFKVGlEWWl1MnBvTGlkOGxWQmo2VVF0MEluQ2loTlJ1dUQzWUlr?=
 =?utf-8?B?a3lobEduS2F5VkNFYVJPS0Z1WHdyaVR3ZnlFZG5LSndvUUxEanFOTFN2QjMy?=
 =?utf-8?B?N0RnVWQ2M0dKcC9kbndTcVhwY2VXQ01DYUEvYlo5QndkQ0RmWHIxQTFXaFRk?=
 =?utf-8?B?NmpNU0kwRzhOcHhsdnpyN3p3Y2djSkgrU0gxVHJMbHd0Qk1DWmNVV2dWVnhM?=
 =?utf-8?B?cEU4ZDN3Q0dVbHdaZjN2anAzSm9rZFZqTG1ZMlR4TllRaEN2VHhqWVNwbUJo?=
 =?utf-8?B?UzlxUXMvR1p0ZVIwUElaT0dDcmpHdEFYamczbG5vNDNXQ1V4MndubDVnMnBj?=
 =?utf-8?B?Tm9Xb3hFbSs4VHJqcnZQNU9lTjZwR1ZtSHlrVklFaW0xVzF5M2ZHbElZWC95?=
 =?utf-8?B?Rkg2VC9lTGJIdktLb0RkdWdHbFpNMjNVUmk4b2w3bUlhS3dScHphUjcyc01K?=
 =?utf-8?B?UWpKMUJOY0kvTGR0eEo3b3poMER2SEE1aXhDMHlEdkxLRzFRZGRWeEhYUFhY?=
 =?utf-8?B?YkNBcy9NV3pRN09WQjRuSkJqVHZVUHAvZ21HMTdmaGUrQnVBZHdXOFJyV0or?=
 =?utf-8?B?amVjdzJ2OHVBamVGOGxHdGZjaUdNdk56RHdqZjAxRUI3TTZTQlR3bEtOazdL?=
 =?utf-8?B?eDNINWdacHNEZUcxSGVYR2c5NTBIMnBtR1hsT1RYaVRPYS9VVmJxRkZGK1Fv?=
 =?utf-8?B?dC9SVHZIc0R6bFgyU1JYbDh2ZlFBVG42dWxiL3hzdHVqL3Y5azhxVlJTMmN1?=
 =?utf-8?B?dHk4dG9Hd2Y3QTVmTDRUVXdQWDExOGJRWHlVaUZmVzd4T3pQWG9hUkU0ZmRt?=
 =?utf-8?B?NlB3SERkc2ZsUmQ3bDVNdXZXZUlsTnI0dGZSUXg2b1JtblBaaFFhZ0NId25l?=
 =?utf-8?B?R1F6MjIzWm13a2NpM3l5enhhcnhOU3NEWDJiYkpINzluQU1SeVNLandWeVQ2?=
 =?utf-8?B?ekVQSDVmYlp4cXorNEJZMlZSM200bytRelM4OWpLUzNQSXE3alpxUk1UbUN0?=
 =?utf-8?B?enlQZlpZUytDRnlzbG9UekZSWklpYld5SFArMENoQitFVEtkWCs0WXZJdDEx?=
 =?utf-8?B?QnpUMTdsRVpXeXdzMkVaRFVVYndQdmo4aWpJckc2Tzk0TFYxVjJwTXg2QVpj?=
 =?utf-8?B?T0o3QTFEcVdIaHNSRnd4L1Z6RlhDV1BEMVNLd3U3YzdDYncyMXRBeWIzdHBk?=
 =?utf-8?B?M09ESHJwV3Y3U0kycjJGMnhlbTV1NmViQ1ZtRjlhQmVONWNJT1ViUk01UVdo?=
 =?utf-8?B?aFVnNUM2bXNqbUsyRGUrZ3ZPWU9XY0VtbGphcnZjMzNFcE5jMGdtTklRMTBV?=
 =?utf-8?B?RGFkS3VBQTBSMGtuMjZwR1UxS0pmdDRWTm1YSWo3MkJMS01JYjV0ZEZ4ZDgw?=
 =?utf-8?B?ZHFPd01PejUwNitGTWpYbERGbHQ0ZWt1S3pXRm5LVC9nZEJIZGpCUGFzcFNJ?=
 =?utf-8?B?cWkrRzVSTWY5QXpFVkFzbHdBMTkvOGR2TUs4a1E4YWNHUWxUUGFhNVJmWDZi?=
 =?utf-8?B?WDl2SWwxYVhGcTVnb1ZLdlQ2ellQSjQwZjZIb0Y2RkVha3BFcUdtYVRzS3BM?=
 =?utf-8?B?NC9WYklNeGdvV2VYbGRDVzQ0OGdJVkVVQkxEcXAvL2JTVGZOKzJWNWRuVDFG?=
 =?utf-8?B?MGlQV0JPUjdoYzdQMlYwM3MyR0dFNE91WksrQlRicWh1TUFDaFdGb0VjNDYw?=
 =?utf-8?B?cFg3WXBIdDlnV2duWHdTN21rdEFMMXN1YnJpZ3dzK2VQSy9KdWlETmpvUURS?=
 =?utf-8?B?VWs5dUxOSm1OYkZKZlo4bUxmQlgrYXVSU1h4TngrV01ZeFZBanBURUZCUVli?=
 =?utf-8?B?STlKbUUwZ0hpZHRhUXlFTkNpTGwyOGJZb2pycjEwMWhyRjYybDRraGx0WW5T?=
 =?utf-8?B?SVNFcFordW00R0VsUGFLck90aHpuWUhNd0pGOS9JQnRSdWt1RmVYRjh5NU1t?=
 =?utf-8?B?SWt6ckc2ZWhubVFDRXQvTzhURWtReG83cjR3ZFVXRjh4SmR3VlFvcHpOcGlE?=
 =?utf-8?B?bmZ5VmdUYlA4ZHZRNnYyUHdpTGVqQW9XWXJ0VjFqMTVkSnpxT0l6eVRSVDc5?=
 =?utf-8?B?RHNwRFFScVZkS1c4VWF6QjA3eU1Nckprd0xSVmZkck5ILy9VS1dtdkVURWho?=
 =?utf-8?B?Ym1JSiszWnJGcExiWkIxQmJBWlRmQWJsalJ5a0svcTdNZzhtb1BSK0phRVlU?=
 =?utf-8?B?U05vaGpmSFpLOGNjTTBRTmJoUWtjc3N0aFovMnlBR0pVeDVwMjNIcTg2cnZv?=
 =?utf-8?B?L0JvMGkyTHZsamQ5RFE4azFCaTE0Q2xkSmNkMmNnbGY3eFdkbDBOMStiUGJY?=
 =?utf-8?B?bGgwb2ppajIySXJZVVB3UGoycVh1Y1VqUFpPbHJxZG1UUXUxUjJ6cEdNSGFi?=
 =?utf-8?Q?CkpdQQeb8S1pJAE8y8+wGHX6viSfqZJF0nVJYlGpSTdxD?=
X-MS-Exchange-AntiSpam-MessageData-1: Hvvp3lwW2fOqbA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 288a9747-a0fd-46b0-facb-08da5058904c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 11:57:33.6685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3S0Lcrn3udGSOg15FCTqRTIji9cWL1Z2OgHRswS7WldZP7QRsZaHJ3oXMaOZ3zYZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5700
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

Hi John,

Am 17.06.22 um 13:52 schrieb John Garry:
> Hi Christian,
>
>>
>> well, this warning is intentional.
>>
>> The key point is that your random config results in a very suboptimal 
>> situation where the graphics driver only barely work.
>
> ok
>
>>
>> And radeon is pointing that out with this warning. That is totally 
>> expected behavior.
>
> Sure, but I don't think that it should break the build.

well, this doesn't break the build we already have that for years.

What breaks the build now is that warnings are handled as errors.

>
> Can you add a boot-time warning message instead?

Yes, we already have that as well.

>
> And/Or compile out the warning when "warnings = errors"?

That should be doable I think.

Regards,
Christian.

>
> All the best,
> John
>
>>
>> Regards,
>> Christian.
>>
>> Am 17.06.22 um 12:57 schrieb John Garry:
>>> Hi guys,
>>>
>>> This warning in the radeon driver breaks my randconfig build on 
>>> v5.19-rc2:
>>>
>>> drivers/gpu/drm/radeon/radeon_object.c:186:2: error: #warning Please 
>>> enable CONFIG_MTRR and CONFIG_X86_PAT for better performance thanks 
>>> to write-combining 
>>> [;;https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgcc.gnu.org%2Fonl&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7Ca03d7af65a8a4a5bfe4108da5057dec9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637910635599228345%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=cRh91K85SllKnVm7pkZEK%2Bv4rbrKCzLkiT%2B9Q5mJ65I%3D&amp;reserved=0 
>>>
>>> inedocs/gcc/Warning-Options.html#index-Wcpp-Werror=cpp;;]
>>>
>>> Is anything being done to fix it? I don't see anything in -next or 
>>> on dridevel list recently which it could be.
>>>
>>> thanks,
>>> John
>>
>> .
>

