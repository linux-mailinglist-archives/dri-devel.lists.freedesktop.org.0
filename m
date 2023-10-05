Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F04987B9C8E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 12:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4495810E1E0;
	Thu,  5 Oct 2023 10:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B0910E1E0;
 Thu,  5 Oct 2023 10:44:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKXREEOuRL0czhJgz+esbPeOMW4oVmbuSjUsSC2tyIa6ErJ9ftjUdckW7ixb/wEsiKpfS8p7iijZq19Zjo+4DDwljgCCqs8SCKjBzp4SDeOthP/CF0Pz/ozESTYOfFL5UdbyoZLN+CDshoy+HoCoFESnT5VP5L1OtcDfxpU58s1UrzrWDLm5ckbXtumefpvvH2cMh0ffFJozA8vcJPd2jVvxw5LEnbqXs7focIp+0i13fH0KgswtMgtugJkyBcERpHwwSfzrzkbRvUor8V4OpNxjaQ/mnMvLdW4wYpcKqI8MRhsMgECrSKFOsSaXeeoVONuscvElqY2nbAzplLIcIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1bEIOOoXak8fovAn29LGWdhExBhEKzAvs/HoCfyjNQ=;
 b=OnIcM1zrZuMUzNN6y03ExohbwQ1jt3rqcEF4QDcFgRkj4ldFaWk+ToM9p+yrCB9jqWoVWkS3zO1rdGxJxetXjkBVhEo9VnGQN31haVR5peKFFqG3dbwLehHhFePKKTZQ1vb8IvgrklTbmu+h/r2H5zWLzHHZCGrRNjeZ3MYJecBLitCAoaNMITGm3gbFhp6zL9ji/RXU4+Q+xzAEY8Lb0BTBCS3Q7CfqBNhbfQUVP6reo8x5fO8F6yxT45bxbBEM+iBgq4zNfPkJy8HMQL/tNseN1YT0TcbDHDL/WdjsArBTfENZwCCMqzunsFADlhYL98ypsqVVJIo0phPMQGJSBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1bEIOOoXak8fovAn29LGWdhExBhEKzAvs/HoCfyjNQ=;
 b=kwj1C+y4lyRlIa3CGFCDouMVrbQshSfT2nFdOLWbdJji+ZjYFFN3n5/7XJ7YRnKfDlAy4eQrDWR143laAJtO8lenyorS9JZFZqnrbz4vJihWjtnrYeuwmpyPkhv101UHaMNRJth/+eLRjJ6q3tfk/+lkqw95xZvMV5JklBgVGV8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB8348.namprd12.prod.outlook.com (2603:10b6:8:e5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Thu, 5 Oct
 2023 10:44:37 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6838.027; Thu, 5 Oct 2023
 10:44:37 +0000
Message-ID: <c1f9e3a1-ac73-4758-b358-a6148b3853e3@amd.com>
Date: Thu, 5 Oct 2023 12:44:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: bulk_move in ttm_resource manager
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Zeng, Oak" <oak.zeng@intel.com>
References: <SA1PR11MB69918FBD6B32447AEB6E0F6A92CBA@SA1PR11MB6991.namprd11.prod.outlook.com>
 <d29ad7b31b39e95280cc96ad93613967467721bb.camel@linux.intel.com>
 <a657c5d1-e5ef-446b-9481-c55f2c59c20b@amd.com>
 <fbc3e29ed30e327f6702750a1e4c6a2529fa2f33.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <fbc3e29ed30e327f6702750a1e4c6a2529fa2f33.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS7PR12MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 6696db4c-4606-4d51-20ed-08dbc5901208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NCj+QeCI8WxbgtavcvfQUNuRJnZOb1BH2tMetQlQfuZsjTM9k6200qFVvNIp6FKg0h6+J87Md4KjSgR1FhNmjisDtUAS1kZHQyHZLUdIf3EmFUL821sjqNgRVnJ7GbSGBI4R+oNW6SuUjtH5BnsoV6XhE19O8ukuC0iMgsgJ33mQFh9w0C/4DJH1FBsDpagGWiq0GWUIZHzu6MkaEVnMUCWE3i7svs55I9t3XnUCVSBTzCF3clZKS0JHNfs0QQeh0ki+gYcRbP9ZBKWG84jIH7By16MVRDF19RN4j05JCQcBdn+WxYEa2EX5VeITEXmlYFD8dUUq9LWWz8kN9Z8ZC+cjkzNHYn7Pl2bDrHWCAzNknoMuv84woWafCJjeUGA1OU1+/OI2hYuy9bJRlzMm3l+cHkPdAGz+Ggj3Qv2fs2DyPZLNZP5VfGMfVt9sKKO9aDtii+AVBWIa2ojrvs5DuuMHq92orJ8U3SadQspcIKVhXtIWGe/vkFOyKZPt8TvHgad84qbR6zcfZ8LcX92iDWlY8IQGDwDSCqHRfE8p9oadpQ6eNmMw37NdaXbq1+LXrXM17HMeO9RxdutlmViCPzzKE8DEJpTW9TcSPFr1QsUwBqoNY0aatNgihNi2L6Cz5iXbx2rnj/4dUZJBiKOZFv9baDcQ2N8obzVQ0rHCR4A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(39860400002)(136003)(366004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(6512007)(66476007)(66556008)(26005)(54906003)(110136005)(66946007)(66574015)(2616005)(83380400001)(6666004)(86362001)(38100700002)(36756003)(6506007)(31696002)(966005)(478600001)(6486002)(2906002)(31686004)(8676002)(8936002)(316002)(4326008)(41300700001)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEdaUERIZ0J0SjV1c3NpcUM3bkZIcStrZS94djUxaXVsdmM0cW4yak45bVBu?=
 =?utf-8?B?dUFZVktncU8wUm1CakxnR0Zuc3A1U0F6RjM5VlVPOXE2M01UYk9Od296SzhH?=
 =?utf-8?B?ZGhUOW9aWEprQkhWekg0SWdrYTRPRmxqM3cwV0FCS3NwWkx5QjNmK2MvZ2Zj?=
 =?utf-8?B?eVl2ZnBrWllab1VWc0MyVktVcFlKYndoV2dQTW9WclNJWHYyWS9aalVRNFhm?=
 =?utf-8?B?dW1EYTNwYXJvSjUzMGR3UlAwTlBzeVoyczI4dmNJL2k1SmtBTzNvTFd3eHVu?=
 =?utf-8?B?Y09NSFBLMkQ2dnBRTk9aSUtPZHJMRVh3KytlbHlMQ2xwNUdiOEpWMjRrLzB3?=
 =?utf-8?B?TGxtS0dWMFh6Q2lwUG5PUWpuU01sZFM0R09IMTMrOUJ4Vmk5b3Z3UW9ZRjZk?=
 =?utf-8?B?NXgzT1ZJaC84d29GVzZ3VlRDaUhwbVVsTFhwb0hXY0ErZGRNRytmYUpxRkVh?=
 =?utf-8?B?bnlITWMxQTRBVVVTMXJRT01ZclJ0VkVCblVBQlgyTlU4b1grSEJKMEMyY0Zu?=
 =?utf-8?B?cDBEVUVWVUhHclBiM0doSnQwR2xwRnErZ1R5UnRyOVNtVCtMRHpiaGlSMTNP?=
 =?utf-8?B?SW0rMWZuWGtIZUZNZW5HajBVZXh3K29jSTNBZTNUbmxGeHFaN09OVnhmUU8z?=
 =?utf-8?B?cWg2bW44UDByQ2poWURiTzl5VVNxd2pSWmZsVHVTaWxldjNWZTdTVDR6OGto?=
 =?utf-8?B?WVBoaUt4SVVNMVpVUjJVVUZsY3J2KzBWWFBTQ1ZEVktWd0tRUmFQSEhoN2tk?=
 =?utf-8?B?S2RJRUJCVVBURG1oNmIrVU9Jd2FDUW1sV2dVeGVuZDN2R2Q4QXg2ajFaa0Z5?=
 =?utf-8?B?QzJONjhWUllocTNsNHVVUUx1bms1YStlUkF3cHZRV3NNTUxNdUJIR2FKNGdw?=
 =?utf-8?B?d2NXam85SlhVaUhUb3Z3T1VUSVdHbHVXZlFSRkZIQ1d4UHlTUXFaZzBjNHVi?=
 =?utf-8?B?MVk0M0FRYWY1Sk15NDVGbXhNbmg0dGx6OEpiWlowQmIxTWRMODR1UkJDMERX?=
 =?utf-8?B?Q0pxV1l5UTUybHFOdUlaWEJNL2pTUjAwZW1uQXdRdE9teTloTkVjR1hyTnND?=
 =?utf-8?B?MkZkTTNIK1ZqMytiVGhWM213dkZaZ0VWWjZJZEJIK1pHYVBTdW53bFhnM0FB?=
 =?utf-8?B?VWN2SU81VHhycUxLcEl3UGJlVitRbXBLWVNOd3ZiZTBjR3FCTkdyTTAxRkpU?=
 =?utf-8?B?dG45S0xhRE16ZkR6VEI5a2xSdTU4WTJVZUVNc0FGY1NaUmZrcTBPMVFUZ3Qr?=
 =?utf-8?B?Nkp4TmNGRXR6U01mSnNJRTE5dTZpaWJhampLQXZ2TldVUTk4Y0d6OUUyU1Vi?=
 =?utf-8?B?bEZtM3grNytlK1hwcFo4YVpsZHIybTZHZkdDQ3RqN29tWjA5RW1JMWtoZ09N?=
 =?utf-8?B?OW5EYS8vbUlyV3IweGo4V05BcW5xeHNmTUFOT29xaEFiT3dqdHNoalkrZU5B?=
 =?utf-8?B?VDlzU2p3d29lalNBckYxdlhUUFJ1cm1EUU9hRzVuY25oSStXUmVmMkJPMGln?=
 =?utf-8?B?c0p3NStob1dodmRxYlZnN0JIaVFPVmM4dG56VW01clFrUUozT0JzSm8yVWJD?=
 =?utf-8?B?dFY4ZWovQjdVMUU5cUplTFU2RTRKSDZxZnM5SXA0bEVVNzRSVWdmRmh3ZlUw?=
 =?utf-8?B?Vmw0c0xhUXBZN1VJRU9zNmg2SU55RVFReWZ1UnNjNWFFZEZjcEt0SzVvMjdQ?=
 =?utf-8?B?dnZuT3RRaGdIMXZDL01yT1Bvc2QzWVcxNk1rVXdKaWZyQjNiMTRTY0V6eS8z?=
 =?utf-8?B?eFJVYXd5ZHQ0cUNlRTRwUWgvU3ZWbE9DT21zdzBNVmxBQzkrTWhBcWlEYjRE?=
 =?utf-8?B?OG1VY3lod1FJTTNPMUQ1bXZyb291ajR2ZkNDYTcrS040QjIzZ01pVDRmZi84?=
 =?utf-8?B?RVdyNXVJSHdnR2JOSjJrTExUdmJxemtYcnNLOGg4VUJyV3BBeXV5QTEwVDRy?=
 =?utf-8?B?aEZYV2NraFV3YU9ZekQvUHpZRmt2enJCWEw4a2NuUVRHME5zWTRVdFBtNlhR?=
 =?utf-8?B?SldXc0g2cHR1TEVkSXNzSmwrbjZCeUFrNnFtQWFoR0V2M0FsRlBaUldOdkJR?=
 =?utf-8?B?UUowb1M2ZUJna1B1ZWNoV1hmSkh0RmZlNkgzZzVOTENVUHY5OXFsMTV6QWdR?=
 =?utf-8?Q?T6Rw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6696db4c-4606-4d51-20ed-08dbc5901208
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 10:44:37.3685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: buBq+XqdX0sw/FME1FkMw6Cs9dTZpoAdvDfDW6cnCYnDTi6KTHmvJo0dj3FZov8Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8348
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.10.23 um 10:36 schrieb Thomas Hellström:
> On Wed, 2023-10-04 at 14:44 +0200, Christian König wrote:
>> Am 04.10.23 um 09:17 schrieb Thomas Hellström:
>>> On Wed, 2023-10-04 at 03:52 +0000, Zeng, Oak wrote:
>>>> Hi Christian,
>>>>    
>>>> As a follow up to this thread:
>>>> https://www.spinics.net/lists/dri-devel/msg410740.html, I started
>>>> the
>>>> work of moving the lru out of ttm_resource_manager and make it a
>>>> common library for both ttm and svm. While look into the details
>>>> of
>>>> the bulk_move in ttm resource manager, I found a potential
>>>> problem:
>>>>    
>>>> For simplicity, let’s say we only have one memory type and one
>>>> priority, so ttm resource manager only maintains one global lru
>>>> list.
>>>> Let’s say this list has 10 nodes, node1 to node10.
>>>>    
>>>> But the lru_bulk_move is per vm. Let’s say vm1 has a bulk_move
>>>> covering node range [node4, node7] and vm2 has a bulk_move
>>>> covering
>>>> node range [node6, node9]. Notice those two range has an overlap.
>>>> Since two vm can simultaneously add nodes to lru, I think this
>>>> scenario can happen.
>> That can't happen. See what ttm_resource_move_to_lru_tail() does when
>> the BO has a bulk move associated with it.
>>
>>>>    
>>>> Now if we perform a bulk move for vm1, moving [node4, node7] to
>>>> the
>>>> tail of the lru list. The lru after this bulk move will be:
>>>> node1,
>>>> node2, node3,node8,node9, node10, node4, node5, node6, node7. Now
>>>> notice that for vm2’s bulk_move, the first pointer  (pointing to
>>>> node6) is actually after the last pointer (pointing to node9),
>>>> which
>>>> doesn’t make sense.
>>>>    
>>>> Is this a real problem? As I understand it, with this issue, we
>>>> only
>>>> mess up the lru list order, but there won’t be any functional
>>>> problem. If it is a real problem, should we make the bulk_move
>>>> global
>>>> instead of per vm based?
>>>>    
>>>> Thanks,
>>>> Oak
>>>>    
>>> FWIW I have a patch set that converts the TTM bulk move code to
>>> using
>>> sublists; a list item is either a resource or a sublist, and when
>>> performing a bulk move essentially the sublist is moved. Bumping
>>> resource LRU within a VM would touch only the sublist.
>> That sounds like my very first attempt at bulk moves which we
>> abandoned
>> for various reasons.
>>
>> That's easily >5years ago, but the history of that should still be on
>> the mailing list if I'm not completely mistaken.
> This here?
>
> https://lists.freedesktop.org/archives/amd-gfx/2018-August/025016.html
>
> No, in that case it's very different. Or is it an even earlier version?

No, that was even earlier. Basically the first version I discussed with 
Chunming.

The issue was simple that when you have a hierarchically LRU you also 
need a multi layer cursor and make sure that you have a single lock for 
everything.

This is multi layer cursor is complicated to implement and contradicts 
the idea that we want to walk the LRU with anchors and dropping locks in 
between (not that we ever implemented that, but it would still be nice 
to have).

In general when you use some hierarchical LRU you just move the 
complexity from the insert function to the walk function. And I don't 
think we would win much with that.

Regards,
Christian.

>
> /Thomas
>
>
>> Regards,
>> Christian.
>>
>>> Currently functionality and TTM API is essentially the same but
>>> when
>>> experimenting with LRU traversal for exhaustive WW-locking eviction
>>> this concept was easier to use. Also hopefully this would reduce
>>> fragility and improve understanding since a scenario like the above
>>> could really never happen...
>>>
>>> Let me know if I should send it out as an RFC.
>>>
>>> Code is here:
>>> https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/351/commits
>>>
>>> /Thomas
>>>
>>>
>>>
>>>
>>>

