Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E344ADD00
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 16:40:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78DD10E3E0;
	Tue,  8 Feb 2022 15:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2050.outbound.protection.outlook.com [40.107.96.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98FC10E3E0;
 Tue,  8 Feb 2022 15:39:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3LnoZrS+JMWdoqvCmCopKVCo0IHhFFkNIj7d1pnNX5X9XyN8L2Kmnw40FnfnoBhka4yqR/4Xvb4/AyUM6I8VwfJ8NKsysZiZy3yKH9Nz7/blIB5sF/1EqHc9rUTHsN890RUYUjaaemMbYwJqIDlY36PMu0psYV/PR9kRoPwchqvyrOCL1c1mMjyClmuZMRvQYdHdHpeqVwYwMxZq2khS3RpOyHLb+mZ4kCKCkryp1i3ztnmErlvTnE9dWOuwnBkOi4OTbGo02PifPbQMU3vIrX3yXPKGumCjT6v6Lt/XpSGVYTWxx1t08/sPxBJsLf7W/WobzasKjr1R5ABqgvdQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C42/eF8DhR2NbGeSYQZw4eELg1dpuj6s6/6wCgkrCGE=;
 b=fS/jcRoZEPHbBEx3v2esL7LnldK7+hRPTiNMDGtb17Qy6ISfK9URvlBjVCqmCUH9kduOgLooRTp0IpskCdBzSFjlsIXD/6MtP3erfgJkSIhRK/ydpGB+Suw++531QpwV0uwM16D5ezdsWBay80fwIF0sDco25RhVd/N8TjInIsgj3f/ZeGAITTf7ehEBq98INnatloYg0+JLcqw0pV06wWrs0Ca0wMblU3Bn2zdAJwpguvpFbCrnnTOj8MMdNmYq+y5idfUGzynFjQ3J+AREUQakQRZkGJB3LIJbZu44lYgwj/Q0ymaYt9R0WotuRoivUYmtnpknDtmr8W904CSFmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C42/eF8DhR2NbGeSYQZw4eELg1dpuj6s6/6wCgkrCGE=;
 b=iLNNNznQbklCjP8e+1TfCzp0lk/AsvWikP2A7PLTkL+w2ylTmO49CpnoB223WbF4A7GiZAoAyYKjNO/l/GFo7JxKBJr0+fs+80NnR7xVZnQB8Xl4dT8deHu/M2SbWdPnCsZl3nS3M36gltQBbheJY8AhXtM6rOOMNVSAhJM6TIY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM5PR12MB1626.namprd12.prod.outlook.com (2603:10b6:4:d::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.17; Tue, 8 Feb 2022 15:39:56 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3%11]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 15:39:56 +0000
Message-ID: <91989ea6-0851-cf1d-87a0-77bd900383f0@amd.com>
Date: Tue, 8 Feb 2022 10:39:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC v3 06/12] drm/amdgpu: Drop hive->in_reset
Content-Language: en-US
To: "Lazar, Lijo" <lijo.lazar@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
 <20220125223752.200211-7-andrey.grodzovsky@amd.com>
 <36e9956b-d195-b36f-00e4-2e0100de6953@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <36e9956b-d195-b36f-00e4-2e0100de6953@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0132.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::11) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0dd39909-3908-4889-f20f-08d9eb1941aa
X-MS-TrafficTypeDiagnostic: DM5PR12MB1626:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1626E8BE5506A465E7ABC0CEEA2D9@DM5PR12MB1626.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6sFjwL8LqxWiVjsbZWo3aPBvMM5ljIdsFUu6XS0ycZPrjXFrYJTpOPzKMM9l26IvyZsWtRt3aH2xVbbWdLP760tIiyACtDTgxE8koN/e+2BbrP8nfov++pi3Qdz41jIqe5HN05IlPhsH5xB1sMl2XasP9gzTxWqwp7FDuOwzD7RpfLs+ouUAMqhrIX9WkDceOXt7Wdsuo82gFjkV0GpTzSTtDanSyxLdKC1YAsZRP9/xXQkGvmD38OJ/Lc5WsLmjM9LI4ZA7U+nIXfNWIv7Xyh0sIburKfyLOexVMlVxA1fuBPv7ypS7cl7DjHHSb9xK71/lgVCeV73DCrV3kBj5YuhllxqBt5PNOgC95D8DVB+zclhcnxsqA2zRO2IByVlSubPhyh4+kgQV9EVDUy8dY/xHSB+EX17sfctDnPwk9zLTcEIRXDvZQ/Wxiu1ci8y4d1GUKZfD2RDyEa+cHGE+XYrJq3O9T3EG+L9YZ+NO8D10JeJSIawmyHKHMNid7Rawts8fdslaGTld+Bcw9ldKXWmH8j6Ukaz+MZhhfIPjaA2/Dwz7WXC0wwcRGpjq9Vas3VRxJcadqEcpzhPLeOoOCbSyRkyUHvMie60Bb5Lm025aDrE7VCjU1E/CEeOh3WckI3Kf/eECoFklle7yiSZ8BtsdAnBn75J2ibdlp4GFLTwi0FT3KZAg1Cn8jwmNWVp+8k991JMo6oZ4gh2vT+kKfkdQbct3G5So3rKbP4nQqNjIaQUIxga484qpOuxxw8mxZj5fpLQOK28oIBIdiv8f2xcUJ0iwZ+e6R8ETC5il/u7tX9E2fmNkJfApFxvtdiH+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(31696002)(38100700002)(4326008)(316002)(83380400001)(66946007)(36756003)(66476007)(66556008)(8936002)(186003)(5660300002)(31686004)(6666004)(2906002)(86362001)(44832011)(6486002)(508600001)(6512007)(53546011)(6506007)(66574015)(2616005)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEM3RlIxSnF4QStCV1VvV0dQNXpOUDZCaHk0dnlyS3NLUkRjb3RjSFFIUW9v?=
 =?utf-8?B?QXIwL2R5bU04UDBscnlQQmhzc3N2NUs0SlIxc2R0cnJjeWNwVjJLdURYeE4w?=
 =?utf-8?B?U2d4YWtoVC9vd0YxR2J5ZWoyVi9zOXR0ZTBibFFyU2x4Y0pxdUxwSC85eTQy?=
 =?utf-8?B?a1gyWEZMSFkxL0V4d2xUVWNoNkRPckNya2s2ZUl2QTlVU0dmTmNlYWpkRkRD?=
 =?utf-8?B?b1c2UEp2NlRpS1N6aUhDdzk3bjdsUGlKYjB1WUFjRDM0eTVhQW1sVXJKaE40?=
 =?utf-8?B?TEtvQWdRMTZGN1IyNjNzTlFPelE1THdqUkg4VDdtWk9VNGFUa3BRR2tMek9P?=
 =?utf-8?B?bG1pRFZuanR0SXBjQmhUemVmaVdnbm9ZbTRPcGIyQSttMllEaGRGVU9xQXpr?=
 =?utf-8?B?MzRKNHhNV3ZHWlNTMW1DankwalVjMU9iaFhhYUhld2llUDVxTXM2cjVRUDR0?=
 =?utf-8?B?WWRWWGMra285cm9lQmpyN3BTZmU3Q2ZyWStBTVUzY0pkYWU3UVJaaFo1Z1Uv?=
 =?utf-8?B?V2xPN0c4RTROM29RcUZxcU0yNGp4ZytEOHBXaC9EREdMVlc3VlBlbnNjZ2ZI?=
 =?utf-8?B?OExuN2JPeWloQUR4eUZPNVc2aitRVS9oTDFsSzhPd3plNmxaL1BLZDVaRmFH?=
 =?utf-8?B?ci8rcFM1RTNFSENqOXJPbkc5RHJMRWF3citSMmY0QWZJMy81ME0rN0lWSUpr?=
 =?utf-8?B?cCsrOTNQRUNIVFRpek8vaW0zd1diMmYzU0kwSVRvNm1LeWNKNEJZam4yUDVu?=
 =?utf-8?B?S2RJaGxNZmxWaURzK0poaEl1TDNIaFpGQXF0MHJScjBkdktTZUcwMkREWlRa?=
 =?utf-8?B?Ky9WWStqVnlwSm9RM3ZkVW9BZUtPc04ybnpIczZvZUpsVDdhRVhjdjJmQ0FS?=
 =?utf-8?B?MmZsMHJHRTJRTWhWbTNlWldVR0RVeVJDRFE5Nm1XS0owZGYycHpUUU1QU3BY?=
 =?utf-8?B?U0pHbTNRUHhPb2RjQk1IYWVxWDN5Ynd4NXU3VHAvaExyejVVOGhjeSs2Smp4?=
 =?utf-8?B?d1ZRSmRuVmFtbktBUHFkRGRlaWRUdlM3THlQZWQzM2QreWFsdk9VY1JQd3Z3?=
 =?utf-8?B?blB2VUV3Qy9CWXUwTEFGamtqL2dkNnVXdzNLdEVpYUZHSkx4YWNNSStLWTZr?=
 =?utf-8?B?UXd6QkhZdVlVelBDeUk4d1U4Z1djRU1nS2N2SDhXWFBSb2Uxb05QMTAxcEho?=
 =?utf-8?B?a1ZaN2lWbHc4emhORzJma0JhbmVscW5DTnF2NFFnS3U0MjArYWxUR0Z5RG85?=
 =?utf-8?B?WmVhUFJnYUtwdVgxVXJPVjh3VGU1VnBaUXNJT3ZwcGh6VnltTDhrM0FXUHh5?=
 =?utf-8?B?NDVWZVBpSncyQWh2NWRjOVIwYUZFbUxiWTBhWXB6MURQYmtIbG5CNkNoMDlr?=
 =?utf-8?B?QkNWN2pCVnZ6TE1ablhESjBlVzdHbksyT1hDZGZQdURIOE9yMnhpekxBTWFk?=
 =?utf-8?B?Wlp0Q0F3MzFtM25HYjllT3dIYU5MS05ubnQ5b1JqNlZHb1BoMDVxWFhxMyt6?=
 =?utf-8?B?ZCtBdk5qUGVWakNlRVZUallHc3RJTE53eXRJVmc2S3ovM3NyeXRxQ0FpNksz?=
 =?utf-8?B?NitneFZlNlYxZXhlR2R0ZkRTQjEvcG81VUR6eXQ4SGVnVlFtanJYZGJkMGRW?=
 =?utf-8?B?WENuTE1XZ0xYY3BINHhBQ0NHeXdMZE05UkVxU0t4MTJYb3lseDZiT004dGxI?=
 =?utf-8?B?cGRoZ0tEdDR4SHY2dWxUSjJIbXNsQXBKbE0yYVBFaUhiRnhwU1JLWkF3Q2Fp?=
 =?utf-8?B?WFUzY2tjOXNJMVlWN0N1Q1hKOXRqeVQ4V0wyR3JvSUpuZ2FzVVk3ZUc4SmJL?=
 =?utf-8?B?R0R3Y1cxRk1jN0ZHNDJjTFc2ekd2L2syeW9Yc3pRbVJOQy91Ry9XSFhjUjlx?=
 =?utf-8?B?RnJsc0kzdGpETWNWWGZDVjFaU2NTaSttaXFiYlA2Y2phbU51OXM4ZGtxVnhC?=
 =?utf-8?B?ZzE3VHdzbllEU0hnSUpWeUl5ZmdTMmxvMEh3N3o3R1RVeG0vUW05NUhRQkFH?=
 =?utf-8?B?NFM0ekN5M0krem9OY0E0TWNVemJNUFZzNFRTZWlaR0lrVWVydWVwTGhTSUIv?=
 =?utf-8?B?c1BRVW5mQzlZTTdvekt2MDQzMy9PL2Zzck1rRVp4WEVTTG1UWG03UDZoam90?=
 =?utf-8?B?eW55bmk4eXFMQ21qSFl6M3ZYc0ZYSHpnQkhWcENCcmJXajhGM0RGUEVOcXAy?=
 =?utf-8?B?d3h6bFpDVy9sTFRnVHg5SWpuajFueXoyVGxjUEs2U3Z6K3JUVXE3bWNjZzlF?=
 =?utf-8?Q?epFNv1/Iit9qkT3XAYK5M6YirYQhJFAhA9rnYdo+IY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd39909-3908-4889-f20f-08d9eb1941aa
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 15:39:56.0880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bDOxIaRbnU/xoCr6SDADqNOiJDezBTl9AwpZGWzahKu4qCXoA9EEiZqN/yDd+KgUsZoTwf3SafZDGlWTy8T/pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1626
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
Cc: Monk.Liu@amd.com, horace.chen@amd.com, jingwech@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-02-08 01:33, Lazar, Lijo wrote:
>
>
> On 1/26/2022 4:07 AM, Andrey Grodzovsky wrote:
>> Since we serialize all resets no need to protect from concurrent
>> resets.
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 19 +------------------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   |  1 -
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |  1 -
>>   3 files changed, 1 insertion(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 258ec3c0b2af..107a393ebbfd 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -5013,25 +5013,9 @@ int amdgpu_device_gpu_recover_imp(struct 
>> amdgpu_device *adev,
>>       dev_info(adev->dev, "GPU %s begin!\n",
>>           need_emergency_restart ? "jobs stop":"reset");
>>   -    /*
>> -     * Here we trylock to avoid chain of resets executing from
>> -     * either trigger by jobs on different adevs in XGMI hive or 
>> jobs on
>> -     * different schedulers for same device while this TO handler is 
>> running.
>> -     * We always reset all schedulers for device and all devices for 
>> XGMI
>> -     * hive so that should take care of them too.
>> -     */
>>       hive = amdgpu_get_xgmi_hive(adev);
>> -    if (hive) {
>> -        if (atomic_cmpxchg(&hive->in_reset, 0, 1) != 0) {
>> -            DRM_INFO("Bailing on TDR for s_job:%llx, hive: %llx as 
>> another already in progress",
>> -                job ? job->base.id : -1, hive->hive_id);
>> -            amdgpu_put_xgmi_hive(hive);
>> -            if (job && job->vm)
>> -                drm_sched_increase_karma(&job->base);
>> -            return 0;
>> -        }
>
> This function in general will reset all devices in a hive.
>
> In a situation like GPU0 in hive0 gets to this function first and GPU1 
> in hive0 also hangs shortly (before GPU0 recovery process starts 
> reseting other devices in hive), we don't want to execute work queued 
> as part of GPU1's recovery also.Both GPU0 and GPU1 recovery process 
> will try to reset all the devices in hive.
>
> In short - if a reset domain is already active, probably we don't need 
> to queue another work to the domain since all devices in the domain 
> are expected to get reset shortly.
>
> Thanks,
> Lijo


No worries for this - check this part in drm_sched_stop 
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/scheduler/sched_main.c#L452
this will be called for each scheduler participating in the reset domain 
(including schedulers of GPU) and will cancel any such pending resets that
we want to avoid executing.

Andrey


>
>> +    if (hive)
>>           mutex_lock(&hive->hive_lock);
>> -    }
>>         reset_context.method = AMD_RESET_METHOD_NONE;
>>       reset_context.reset_req_dev = adev;
>> @@ -5227,7 +5211,6 @@ int amdgpu_device_gpu_recover_imp(struct 
>> amdgpu_device *adev,
>>     skip_recovery:
>>       if (hive) {
>> -        atomic_set(&hive->in_reset, 0);
>>           mutex_unlock(&hive->hive_lock);
>>           amdgpu_put_xgmi_hive(hive);
>>       }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
>> index a858e3457c5c..9ad742039ac9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
>> @@ -404,7 +404,6 @@ struct amdgpu_hive_info 
>> *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
>>       INIT_LIST_HEAD(&hive->device_list);
>>       INIT_LIST_HEAD(&hive->node);
>>       mutex_init(&hive->hive_lock);
>> -    atomic_set(&hive->in_reset, 0);
>>       atomic_set(&hive->number_devices, 0);
>>       task_barrier_init(&hive->tb);
>>       hive->pstate = AMDGPU_XGMI_PSTATE_UNKNOWN;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
>> index 6121aaa292cb..2f2ce53645a5 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
>> @@ -33,7 +33,6 @@ struct amdgpu_hive_info {
>>       struct list_head node;
>>       atomic_t number_devices;
>>       struct mutex hive_lock;
>> -    atomic_t in_reset;
>>       int hi_req_count;
>>       struct amdgpu_device *hi_req_gpu;
>>       struct task_barrier tb;
>>
