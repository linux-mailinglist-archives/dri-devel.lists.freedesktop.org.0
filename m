Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8701C4B1086
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 15:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2742F10E890;
	Thu, 10 Feb 2022 14:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2083.outbound.protection.outlook.com [40.107.101.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6909910E884;
 Thu, 10 Feb 2022 14:35:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMS64oiWeHhXDniDbdJjx6dczoFkkdm4Z+6G19lY/Xaa+r5lFIoSyjNivvKtiBt3/KDh81uquFia0ZjjzWfGd8nHfoq/YLkieNijFQJyAYsF3hnPA+ESPhJSSKeH1ureNPRklKrQkugs7x2+FsI7sJhCPWR5qbsCQoUaTu4r/objhwE3RtlYEj3O2nVVay2sF1aLmWYV7s3vm3y8ZPDPmGOxUMVNXAFlcs07oHoRwrRbG+8vyeATWuorkS7TsG4LkkOfrziUBo1SIhfAdOvlvQJ7CKt/HGdetMxpJ2pv6mQ9ddJPqYyV31Gvq+b/TSPSlfW+BzWsSkspj/f4hBuZpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wKmE0N3vsosIO+v216jmTZ8V0IZpWL5+6/sAbuuPEo=;
 b=chnXKQvd4z17yymXQjR2wE7b+ykLhtLoP5J2mTh5lJahknzveuO8oW6OMsHc8sUTQYPvCT2Rub9uQ9Tai+LOn6osUaWUNX9DsOSaeYVt4FSBJbe1c5ZxhCONzmCvjCaoLEBRtk5PWmCiuRyWHXbO5z1QcIfZ/wTB0cXlG/R6asxwl/aWPmcWYoQvAIY7/8dtF+qsz/09JBYuQCO2MZszKG3XsKF4P0/n5qVzT0f278E+y1WosfGR1QsZwbmKGOfrtFpJKI5my2dub25UuERQNuPHZgWgoJhbXnelSdFnw9Hy7ISN4AOmUfB6yurcGrfKEU/eYVo1e5da5Wn9/+1JxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wKmE0N3vsosIO+v216jmTZ8V0IZpWL5+6/sAbuuPEo=;
 b=J344KEWMlVNazGKPccKkloWXLY9uLEVLXEBcf1wRuAojU4ETFEVBjR/0PNJokD+gBypCy+F+8iEDXhGM4aVNOChBTIR6dE4iWyvUBpuVkuFgGUwLB4dphIwY5OfWRzRHCr5HmU8Ruc2Grt05Zgguj0IdYczaLYFDpkFsmLxnpdE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by CH2PR12MB4247.namprd12.prod.outlook.com (2603:10b6:610:7c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.14; Thu, 10 Feb
 2022 14:34:55 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3%11]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 14:34:54 +0000
Message-ID: <1d984000-0867-6ce3-e743-cbf965fc1b96@amd.com>
Date: Thu, 10 Feb 2022 09:34:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdgpu: Fix compile error.
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220210031724.440943-1-andrey.grodzovsky@amd.com>
 <8b125a02-3fff-b3c3-0827-c31748446ce0@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <8b125a02-3fff-b3c3-0827-c31748446ce0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0415.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::30) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3b9f859-de03-460a-fa15-08d9eca28119
X-MS-TrafficTypeDiagnostic: CH2PR12MB4247:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB4247E1760E6DF04C1DC5ACEFEA2F9@CH2PR12MB4247.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TrA4VIe7xbGLQnWgfJlisIbyKlo7R4SPt8LCyJPgpZm+DLlcEbAlxbe/ypTnBngXpe3ureyIMLbPqJCLOgobt/6eQTJ7sSdOheLf2ZgcRcGdXVDtI0qlKWgLh0RThHzNDFDNTf/psJF6mzlckXOm38As4krZuIiWJL+3wqd/IOh/Wm6KWDQy7TJ1NmI5htIml0oxL5Jse7DVpg/GS3L0hH/5dCTfBkAazoOqOwcI8VE107EY/wzZFsH6jZ1/aCR4JaePI2Ir7oLgWnl4OTvvzYNPcFg9laBN/G3rAYaH8hE1epC6h5djgyJoUfL6eywUP74gF75OqupFczhBsRcMcpS3nlKRGeUY6N3phRqoNfMvVAyNenHsCUIzksuWcdwmuti/49J3kf+DSIiQpoateOGvbMq1gNBc9dIXjBwpxRa7t2yoxw1eBYHA0xunX9rLp3Zoc/42td5rrurj8khGvUdyiITGHsl0PV0kuCTOI05wTQG73Lzlur4A3h9q4mxDOSbxEkp9Q+MbR61s6KMXH/4SNSGMuq4/Cgj1fX0OwzNFSVhzW67u5/eXDBOAwPAw6qsuJCVea54ySCcfp9vt1+2TyQxLeqCTSu2hCBwp6OaVLvKvnB6WoCMSDg8OaK/ktdUTwNkZKoRoHIgOYgXNZqkM82rYT5X/QZqjfzVkg5Z37Q6FtwUen4xq1xpDbhPSFXOWhmg/W9p58r4IqbiYiclzXJvNuVmtCi/Af5COzqY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(53546011)(2616005)(316002)(6486002)(86362001)(31686004)(36756003)(31696002)(38100700002)(4326008)(6512007)(6506007)(66946007)(2906002)(66476007)(66556008)(508600001)(66574015)(44832011)(8936002)(83380400001)(8676002)(186003)(26005)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1dRQXlPeUtDSTgvZVRleHV6RTFleTg4UjluUE52d1V2Nml6a05WU1J4ZllY?=
 =?utf-8?B?UTJNMHNWSEo5RXlyU1RrSW9yVFh6L1ZUQ09mRGxpR3lxTzJLQ3luaEpUQWFQ?=
 =?utf-8?B?cnBnL1U1bTlVRDFHeDFYTXFZOXJrVlFoeHNhS1pJQ3VFZmNiRXlkb0xuREdr?=
 =?utf-8?B?SXBLZWlPdE1jUWdIdElBVDJzNE8xS3gzZ0x2Y3ZlaWQ1ZmJPR3oreVZDeGpE?=
 =?utf-8?B?SWYvTEVwa0RnVnE2WmpWTTRzZWI0d3hSNWxsNGI5ZEN5WWsyUmlxWTA1eXlT?=
 =?utf-8?B?VkVrNVRKaFBSOE1wdWNET3JqVlFBaGdNd1dTREVOK3RteGg0M2dnTWhoR25l?=
 =?utf-8?B?QjAxRWR1NXRIblVNY3YrVjJUaTNmQkxRZTB4YjBROEVkUEYwQk9RQ1ZxZEU1?=
 =?utf-8?B?V2YrbXRvWVJxaGtYQjlBZm81R3lwUnJ5N0lMcG1uY3RhUlFOZmRKbmV0aXp3?=
 =?utf-8?B?K3h2cTM5Y2liZ2JYbnhhMU8yOERTVUw5MnJJZUpJek5Va0tBQzFxNDNuOG5D?=
 =?utf-8?B?TzZFcmkwUEorV0R1cFdiTkFDakd1bzlEajVSQXFmaVlFbUxuNFpHOUxVRlRv?=
 =?utf-8?B?djZMdmhoNVhGQlJrVnpBNEhWOUkxT1ZoTTBrdGZrSUtJb3dmSDNKRjRDaWpu?=
 =?utf-8?B?N2NCc0cvSkxLQ2Vmc3U3VHl2TGhsYzZHQjM1SS9OTW1ETFhJMi9CYzB1SUJw?=
 =?utf-8?B?T2FleGx6bWRRdEh6enJHOS9sRXI5QjJoaHJ2anFRV3B3UHE1aWRJNitaWlVS?=
 =?utf-8?B?OGw0SUw2M3l3c05jUFMxclNNeXpmQUdOYU9DcVV5YnNHYWpMRGtnZHVmSXdJ?=
 =?utf-8?B?ZzBTVUZReCthVmN2eVp5VzN3NnlRcVlRNHZLa1ZmTTliSmdHZXVvUGQ3Uk8w?=
 =?utf-8?B?QjRQd1Rnc0NZZjVTL2Jmb1FMeG04TFZBRHdYZXgvQnNBVFhpdW0zRWJRc3My?=
 =?utf-8?B?Mi9uNm5GTEdld2F6YjRxNjdEQmtpNkM3aFZzdjdpSkpvTis5cnJhMkZkT3cr?=
 =?utf-8?B?ZllCWjlxbi92TUkxRFMyWGdZenhNRU1RaFdleHdCNUt5dmdJem9nR3FuVWRY?=
 =?utf-8?B?YUpYYTRITzRrL2RkT3JKcTdpQ29NNlZLNHRoczN4dUZVWGhFYzl5RURDbmVq?=
 =?utf-8?B?cE4waHFZYktNdVNaVVFzcmp4cmZnTEhYK2dHMldiWDZlQXNmWnl5YXFvYjlv?=
 =?utf-8?B?Q2RScnJlTlVkYXc5YXZ6Nll1Sm5PQjdkYzl1YUFzeGV1Znc1ZjRLeWNkM1Jo?=
 =?utf-8?B?MjJIM21QV2xDRy8yWmxIMEpjZ1NYQlhWZWdqZVRXYjgvdElDaHM2TkhWTVFl?=
 =?utf-8?B?K2JUcGtaOU1PVTJvUDdTQm9KM0pTTTVKVFladkp5eTJxd2xBeGMvd2wycjNH?=
 =?utf-8?B?NmllOTBnQUxuZHEyQWFUd09tcTIwekhOcFFRYmdTV0QwcmRSSFM1NTVGeGdK?=
 =?utf-8?B?R01JaGEwYk12dHltV1hCSGp2b3pMUE9rVG80TFRmZ0FpR2xmTWNqVE4rOFpJ?=
 =?utf-8?B?cjlxTXExMFJPSHZWRVlON21EN2tlWCthL1lnVFNLTVFuR0cyUXVKUndUbm1E?=
 =?utf-8?B?Sy9SSDkwZUIwU3doa1BqQkFHdGNnVjFpalZYeVUrMEFEMW1uczQxMm5GaENJ?=
 =?utf-8?B?ZTZXME5VTTlubVlDNkhZemx5anBDNHRaUHJKZTB4MG00ZUZvTFlxSTJiWmM4?=
 =?utf-8?B?UHdvbm5CQjVoVHc2b09FWStJYWpMMmo1MVNXbHlzNldzUjVaQ0g1YmI4TlNS?=
 =?utf-8?B?L1lsRTNkNi9yN2MwdzhXWDZlNEJyalhMMFg2QUFrN1lwTitrbmJQTkZYQ1Q1?=
 =?utf-8?B?S1k2dTlIenZyd2xPK2NzTUVWaks0SVNSLzR6enZEeUdiRjl2N1pjbkRDeWt2?=
 =?utf-8?B?U3lhaFJkQzNXTmw1WkR5RVUydU1rYWc5RERlNnp3YytwK21MOFNsRTJKNVNu?=
 =?utf-8?B?VnNsdHh6bWFKVWRNZVFMNFZ5T0VyV25ldENoRnNzdmZPUDVKTTBPQkFQZGsx?=
 =?utf-8?B?QjIyUUhCOVgwMmVQVCtvS1FEclU0ZUNWMFI5aVNoaG1WbVFEb3JHUkVSZ0R5?=
 =?utf-8?B?dmowT2pzdnQzcnJiUkdKaVZQWlg0YzJXRkgrMENDOGhiL0djVGxQTDlROEVC?=
 =?utf-8?B?eTd1eTlDbTZDMkc3RVhCMExENkQvQlM2ZkFuamRFZWJqZ0lHZTNFbDRWLzNi?=
 =?utf-8?Q?ScbDMNMUX4e/Onvk9sO+Mg4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b9f859-de03-460a-fa15-08d9eca28119
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 14:34:54.7580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yHNdydEJJ/t7FHjhwP2t7gXQmWqhQKT86sX8JVmmszJ1y4TdPearTZbOwOMlkbt05NNEvUwqZqkco5+QmKKKvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4247
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
Cc: kernel test robot <lkp@intel.com>, horace.chen@amd.com, lijo.lazar@amd.com,
 jingwech@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-02-10 02:06, Christian König wrote:
> Am 10.02.22 um 04:17 schrieb Andrey Grodzovsky:
>> Seems I forgot to add this to the relevant commit
>> when submitting.
> 
> Rebase/merge issue? Looks like it.

It looks more like I forgot to add the header file
change to the commit after updating with your comments.

Thanks for pushing it.

Andrey

> 
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> Reported-by: kernel test robot <lkp@intel.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>> index 92de3b7965a1..1949dbe28a86 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>> @@ -118,8 +118,7 @@ static inline bool 
>> amdgpu_reset_domain_schedule(struct amdgpu_reset_domain *doma
>>       return queue_work(domain->wq, work);
>>   }
>> -void amdgpu_device_lock_reset_domain(struct amdgpu_reset_domain 
>> *reset_domain,
>> -                     struct amdgpu_hive_info *hive);
>> +void amdgpu_device_lock_reset_domain(struct amdgpu_reset_domain 
>> *reset_domain);
>>   void amdgpu_device_unlock_reset_domain(struct amdgpu_reset_domain 
>> *reset_domain);
> 
