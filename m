Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 090B04AF612
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 17:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B3C10E302;
	Wed,  9 Feb 2022 16:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E8310E302;
 Wed,  9 Feb 2022 16:08:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nabASvw3wKSD1azYRw+vQfzPzBpu5hgan31SVYx9xjNAVrxV6bzQ2hNYVvQhQUg6ezWPi4py+6M6d4N9Ar38UpAq/0a5DF0VTCAsso3jtTeSbj743GCepmbfZpN8OUd+Jp9h1JI6BsVIgErSXcEKLdilg/UP0ohCZORBVV0Bye4NfV2Jrq1eqPeunRm+LBNlvmGuoOk7gaj8LVPga5xP1599uqDkRU3vZ/5MuuXK1Gf9CYWQiTXfQO1FwgRZZA2lz3TTgJOU4UtAJZGikpzPWd6WgFOxGDzdXbgNDe+gUNR7rfNh+ozShaeUnYsDahayE8dJBp0UsEtH7XblJicJsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFSLpJlthlVxjSiFz+QxYMxlntwuMWm8vH3vPnFcO1k=;
 b=btVsgSNnYZtrKCn1ZkYdRTuRFZ83XhzwGXuN6pyEcHvby4ZTJqkoCpy+e2kOXxaaBYMmbvay8pKVvmFIwbaDKCYmfXwnWFzoP2AAuXoDPDHJ4szQ8cIkPi5uOLIfK0WptRSmcXH8QlPfO1a5m7QPnaXAL0rGZ6cgGUaE5CtmEF6aLPlqNQ4hTo//OZ7S8bgNCYWdYP56IvlWNDH4X19FchauKIX1+Kq8+yqQ1ku3yI/nWiFANSPiD4ImjMuT6LRhx489PJ4WfPNyEhZ2++/inr3k9lHC66vjetOVPisWwbHPGoEtkEF8VNn9Oj3bH4p7kNFZTYITNoI0TJmWrWG+lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFSLpJlthlVxjSiFz+QxYMxlntwuMWm8vH3vPnFcO1k=;
 b=2ACSsqoLQ0BvVrt5qur06sjrPgdZP8kmac+N8qJTKTZNAzhgNOeFNEzYYwatg620PNfGNSPKpX6NDLXes37gRTmonkjQxEc5b92/bzhyZQCrY6WGZcA4sjby6nA09Kg6o/29qSMrHdEFCAQseH/qUfY8DAWENxiictY/E7Unubw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BN6PR12MB1667.namprd12.prod.outlook.com (2603:10b6:405:4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 16:08:32 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3%11]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 16:08:32 +0000
Message-ID: <02b162c0-3d75-7665-2028-80d5d61ed25e@amd.com>
Date: Wed, 9 Feb 2022 11:08:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC v3 00/12] Define and use reset domain for GPU recovery in
 amdgpu
Content-Language: en-US
To: JingWen Chen <jingwech@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
 <22cc504b-8f40-2c11-c783-ed4548e092b2@amd.com>
 <630601d7-b409-ec99-732f-dd961f737b0b@amd.com>
 <6be81743-3e4b-c5cd-fd5c-2e1e98960948@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <6be81743-3e4b-c5cd-fd5c-2e1e98960948@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0250.namprd03.prod.outlook.com
 (2603:10b6:610:e5::15) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66eefeee-803f-411b-0bc8-08d9ebe66b28
X-MS-TrafficTypeDiagnostic: BN6PR12MB1667:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB16678DBE9DCEED8A5D91A31CEA2E9@BN6PR12MB1667.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TpIugLstyTfeOStcslJMS+RQWaCdmpwdAr/WoMYcY/XQe/SWeZqjGxsEAeV1qD2/vJZUB46+HyO73hZCuyF1mcfE47ThbZ8ZyqLfc2GawImlnsbJbNDoBI74RPtW9lagSC1LClC+kmbed8TpUjtCmTkjmBnDFmXMaHwz8aKyg8osp4BD2SkFjDVQfbA68VpijGPTFyD6I/BMCeLR/3+1n27LXyyUtUov0z5ZitvxT8Cgl5Mhrt0TVYjaJCvUv1Q7fsNmDEmzyUNQXaLGuD2fKivB+PTifLflXE2KtIFpElRPQYTp7lWf9jAtf9Wjs478pQm1PF0UpxGXv/eq/hQ+Vdx/C89lqwLfO219kWutvsbIgFuPdhvVW5BdRbKLLMh8b8/TAS//OLVOI4IqhRoJXKuj39yNW23z2Q7INbHV1wOKJK4b3JYrk/fKqfbehNAz01f494lBVMk3aC2SQLzZhgscLUHSX8MchcoyrPtzkNjX/cWFizdaPwacblFvLZZ8uEEYv5xJlXj7wgsl0rrykTjI8BQzOmfHgb5DEdmZ46N4PRLeYnD/vmTN7wVNAftQlyIcxKybDJ27F3TkEL0rcpJCNDrT9EpbUJCI8OWkQGpqdTumr2Ox8ULKY30KpqFXNu3z6evglxascD4gctD+YpInMAyqygEYm7qWTMXF9BysI6je8Pn0f0/nK4Htk6u2hFZeGR9SEzZIPWUVxLs8HMe5kL2BbZBZiQlpK3LqebS6f4If0r2lRufUNtzWx1qmftIsltnNJBzCIelis6lq4ET0QnMUZi0JPFjOOjqlzCRI+VjvW66WiWuz/pc1GkhP0/UEZi3yTAJWdKruCbI44LiI3kd5NQ/KIJ1HOiNVX4c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(2616005)(36756003)(53546011)(6512007)(316002)(6506007)(966005)(6486002)(31686004)(508600001)(8676002)(31696002)(83380400001)(86362001)(5660300002)(186003)(4326008)(66476007)(66556008)(66946007)(44832011)(2906002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3NzZmZtbEZ3M3NvUTg4MGdtUTMyY2hDRkNPSklCWWZoMGRTUnduSC8wcmpJ?=
 =?utf-8?B?aTNvM0NQZ3VXV2l6U1lHMjJoV1Y1RGtLeHJkL0hGMGpIQndlVTZTdlpGQmtG?=
 =?utf-8?B?NmpnckcyOFBCakNrNVRacXlNMTRWUThzc3RZeWpvYTBJQW1UMWFwRUFORS9D?=
 =?utf-8?B?THlMbzBQN1FObVNiOEpRekpPQUxZOCtlUGV3Q2xCMERrRU01R1dnK2dPMFBC?=
 =?utf-8?B?d2E3OXczNE9JclY1ekNTelFMQ0ZqVmxjbjh2UldGMDVwdElxNkF2TUxISDNw?=
 =?utf-8?B?bUNxU2ROOW8wU3RxUTliOUxpS2tEV1VzTGdnaXArNHdiYk5MNG14RnZmdHdx?=
 =?utf-8?B?Y3NBeTZjVmovcVBwd2RETHR2KzdqSWxNOWR5TmtySGg5QWcxMEVlWk1GR3B3?=
 =?utf-8?B?MElvNUlWdTNHM1BpUW1JclFsRzVGUGtVOTVKcjRlT2tPVlpaR3MwVU9YVlQr?=
 =?utf-8?B?Y1kyUEJsNitBNXh1cXpCbU15YVFxMzlPL25LeVRabHNxTWdKT0kvVTVPc3Zv?=
 =?utf-8?B?Q0tWaTJOOVNZdG1VS0dVeUVWcFpKRExiTnpValBqeWl1bU9CNEkyTy9ScDRF?=
 =?utf-8?B?N0g3dFAyZDZkUEI5TDF5UGptZzhMUk1hd1RWUnRObC9uQnAyc3ZyRmx5Y1RE?=
 =?utf-8?B?UXhFT2hHMXowbHRad2syTGJTaUFWN1ZmZ0ZJMFpYMVF0RGtHZUg4Mnd2SHJm?=
 =?utf-8?B?cGNUWFlBdnFJRnlBSGN6ak5LZ3pXUGJGZytMK21ON0VLazVBUUlZNU5SeWxQ?=
 =?utf-8?B?Q3BvNEpoOWhDR0FDcDVjY3UwWDRoZE5pb1ZDSldXOWw3ekhmd0dIdkdPRFF5?=
 =?utf-8?B?d2Ezc1BnSVdJOU9meGNZVCt3ZGZFdE54ZTA1clM0NzBMdE8zNkZGcHg3OGFk?=
 =?utf-8?B?bjE3aDBuZm9NMWM2RXhBR2h5VU1FOG1uSFpmWk1IeUk0Q2V3YmwrK0I4Ti9H?=
 =?utf-8?B?Y1pYa3RrbnBER3g1anBNS0o4Q3hwaUQ2eU9rQmxYbmRaeWMxR3QvZCtPTHJ0?=
 =?utf-8?B?NzVkZ0cySndpUjNVVVUyT1FlSXc2M01RM0lNQ0hpODYxNnoxL0lNMkp0VnA4?=
 =?utf-8?B?S2Q0WEZ3YlpqYS9PMFJ1ZUlsbGR2aVh4Z2paMlZQYTNVa3UvT1hoOUFKTVVF?=
 =?utf-8?B?ZjlWelRlMWk5biszVjJmNytZOVRrL1RtV0pkUXZwVk9NeTRnVk9rQWZjTm82?=
 =?utf-8?B?QlFoWTFEdG1Uajh3U2wvcWZGVXF1SGlCVXpiNG82NWttZWkxRDV3Z1JwTDBz?=
 =?utf-8?B?MGhIekttSlEwanZaRjBLRlNLekhEKzMvendkc0xzeXhTdEJsd0l5UnZvUmRa?=
 =?utf-8?B?c3lNZVlpRmtMcnhHYjN6ZHBaYnFnZkdkbnUySzdEb2pwZFhRQy9RNTJvUTM5?=
 =?utf-8?B?SjZWWUpBaEpBUjgvZEtQQWx1SkRBWjdSdzV4TE9jSEVLekJYMGtDUG5Ob2tV?=
 =?utf-8?B?L29zYVd1NHJMazBBYnBkYnBSVTAxL0xxZVF2RDNDU2phVEgrc2V2SUNYaDg2?=
 =?utf-8?B?dDV1VVR3aVJJNlNzdHhnVysvbFhkNXh2Qmg1cGduYzRJYUxvVTV0c1JuSnEv?=
 =?utf-8?B?Zy8zWmRaeHlzTlFYTzY3M0JMeTFUVkc3QjVURzZPbTRwQzVlejlkb1AwM0Jh?=
 =?utf-8?B?U095dVg3RDhqOWJNRW1Id0o5REcwU2xKSVk3YzVMUTVHRndTaDJZUWxVdjVy?=
 =?utf-8?B?b29pZ3lMbmNzNFd6dUdnYnJHY3o3S1VPaGYzS0ZIZ1JGd01PMjNIS3RXM3Ix?=
 =?utf-8?B?T0JXZXN6Z1FjZ2JzLzJXQ2crVGVscUpBT0VNZjlJOGJraXJqb0NaVDNoTnBG?=
 =?utf-8?B?WFNNOUpOSFlDdjF5c2tFY2FaNVhObDhzK21wMUdTSGxHbHgrUDVGWHZ0Z3Fr?=
 =?utf-8?B?MXlMSi9Nc1c5OXNpd09ramZyY3FkM3pkOU9nanYxNjRSSHJsWjkvZzlYN3pp?=
 =?utf-8?B?ZzViTDRxdXMwZjhFTEF3SFhDS3lIdWtJSXc3S0F0NkhaZHgwSlNxbFRaall6?=
 =?utf-8?B?a3JqYlE1SXlVdVYyb3UyR09Oczd1V2NUbzZNcWorb3NJaHF0bU9ubkdUTUVJ?=
 =?utf-8?B?eVRFakhTNGZHbTg5UWZZZC9jejRPd09lQmptYzc3VmZKUFIwRGlkVTRUV1hm?=
 =?utf-8?B?K0NqUGkrVzQyVm5wQXh2R1dLNWRlMkdnRmJMaUhhT055RDBTK2oxMlVqSVJY?=
 =?utf-8?B?WW4yZUNqTkxOZStQTGlOeEtDSnFQSVpRcUI5c3ZEaXlRMU9iMGdndExJUHFU?=
 =?utf-8?Q?3gwKbrn1Kqh4NXHvd2dmAaqRYREKWfnKQfu639ZwpA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66eefeee-803f-411b-0bc8-08d9ebe66b28
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 16:08:32.5083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vHw5EajrZ9QOS8a5ODDtDnYInv178zJh/vTUnHxqjKGByPas+1nLHJMTLcMOG+Ez4quZ0YJQ28PRiTEJVEWN5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1667
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
Cc: Monk.Liu@amd.com, horace.chen@amd.com, lijo.lazar@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks a lot!

Andrey

On 2022-02-09 01:06, JingWen Chen wrote:
> Hi Andrey,
>
> I have been testing your patch and it seems fine till now.
>
> Best Regards,
>
> Jingwen Chen
>
> On 2022/2/3 上午2:57, Andrey Grodzovsky wrote:
>> Just another ping, with Shyun's help I was able to do some smoke testing on XGMI SRIOV system (booting and triggering hive reset)
>> and for now looks good.
>>
>> Andrey
>>
>> On 2022-01-28 14:36, Andrey Grodzovsky wrote:
>>> Just a gentle ping if people have more comments on this patch set ? Especially last 5 patches
>>> as first 7 are exact same as V2 and we already went over them mostly.
>>>
>>> Andrey
>>>
>>> On 2022-01-25 17:37, Andrey Grodzovsky wrote:
>>>> This patchset is based on earlier work by Boris[1] that allowed to have an
>>>> ordered workqueue at the driver level that will be used by the different
>>>> schedulers to queue their timeout work. On top of that I also serialized
>>>> any GPU reset we trigger from within amdgpu code to also go through the same
>>>> ordered wq and in this way simplify somewhat our GPU reset code so we don't need
>>>> to protect from concurrency by multiple GPU reset triggeres such as TDR on one
>>>> hand and sysfs trigger or RAS trigger on the other hand.
>>>>
>>>> As advised by Christian and Daniel I defined a reset_domain struct such that
>>>> all the entities that go through reset together will be serialized one against
>>>> another.
>>>>
>>>> TDR triggered by multiple entities within the same domain due to the same reason will not
>>>> be triggered as the first such reset will cancel all the pending resets. This is
>>>> relevant only to TDR timers and not to triggered resets coming from RAS or SYSFS,
>>>> those will still happen after the in flight resets finishes.
>>>>
>>>> v2:
>>>> Add handling on SRIOV configuration, the reset notify coming from host
>>>> and driver already trigger a work queue to handle the reset so drop this
>>>> intermediate wq and send directly to timeout wq. (Shaoyun)
>>>>
>>>> v3:
>>>> Lijo suggested puting 'adev->in_gpu_reset' in amdgpu_reset_domain struct.
>>>> I followed his advise and also moved adev->reset_sem into same place. This
>>>> in turn caused to do some follow-up refactor of the original patches
>>>> where i decoupled amdgpu_reset_domain life cycle frolm XGMI hive because hive is destroyed and
>>>> reconstructed for the case of reset the devices in the XGMI hive during probe for SRIOV See [2]
>>>> while we need the reset sem and gpu_reset flag to always be present. This was attained
>>>> by adding refcount to amdgpu_reset_domain so each device can safely point to it as long as
>>>> it needs.
>>>>
>>>>
>>>> [1] https://patchwork.kernel.org/project/dri-devel/patch/20210629073510.2764391-3-boris.brezillon@collabora.com/
>>>> [2] https://www.spinics.net/lists/amd-gfx/msg58836.html
>>>>
>>>> P.S Going through drm-misc-next and not amd-staging-drm-next as Boris work hasn't landed yet there.
>>>>
>>>> P.P.S Patches 8-12 are the refactor on top of the original V2 patchset.
>>>>
>>>> P.P.P.S I wasn't able yet to test the reworked code on XGMI SRIOV system because drm-misc-next fails to load there.
>>>> Would appriciate if maybe jingwech can try it on his system like he tested V2.
>>>>
>>>> Andrey Grodzovsky (12):
>>>>     drm/amdgpu: Introduce reset domain
>>>>     drm/amdgpu: Move scheduler init to after XGMI is ready
>>>>     drm/amdgpu: Fix crash on modprobe
>>>>     drm/amdgpu: Serialize non TDR gpu recovery with TDRs
>>>>     drm/amd/virt: For SRIOV send GPU reset directly to TDR queue.
>>>>     drm/amdgpu: Drop hive->in_reset
>>>>     drm/amdgpu: Drop concurrent GPU reset protection for device
>>>>     drm/amdgpu: Rework reset domain to be refcounted.
>>>>     drm/amdgpu: Move reset sem into reset_domain
>>>>     drm/amdgpu: Move in_gpu_reset into reset_domain
>>>>     drm/amdgpu: Rework amdgpu_device_lock_adev
>>>>     Revert 'drm/amdgpu: annotate a false positive recursive locking'
>>>>
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  15 +-
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  10 +-
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 275 ++++++++++--------
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |  43 +--
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   2 +-
>>>>    .../gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c    |  18 +-
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c     |  39 +++
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h     |  12 +
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h      |   2 +
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c      |  24 +-
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h      |   3 +-
>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c        |   6 +-
>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c         |  14 +-
>>>>    drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c         |  19 +-
>>>>    drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c         |  19 +-
>>>>    drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c         |  11 +-
>>>>    16 files changed, 313 insertions(+), 199 deletions(-)
>>>>
