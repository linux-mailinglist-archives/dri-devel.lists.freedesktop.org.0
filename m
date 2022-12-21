Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E05CB6533A5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 16:52:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EFDB10E129;
	Wed, 21 Dec 2022 15:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4031210E125;
 Wed, 21 Dec 2022 15:52:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahwIRyd/aKw7E+vFk9FRt4R+jWzrJpzMvv/fBAoPsfOaepHVWdpLHLBW4Acxsb0VYUChwhHXxXXEdcNzJL/6cgDhipCdCNk/lkygkjYn3d38HrS7uaiq7MigMNRQ3cmwo586PnyZF9ZrIs0Tr7bf1MmckYcypO1Nxc+/UCyjPlsMYfNrUbrh5Kcfruz0aOGbBt8+LItCdNqFwjidr+8ejnFBSCskzmg0AxRKUNRh98X5S5RzttWaNMDLL9n52sKzFkLkQ2OM3TV0OUj9YDsVSqqDEmxEOMNLjE8p0w5mUSjzwVIDFs+RzbQQh5VkTSsrI3002T1aG3BK9dCLshrLRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6D6F1uxNm3V6x1QWFdCAKMhg1EzQgnKH1OTGZvxSZs=;
 b=gmZVfQJ/toLByeeCFgaXMCmGNT9Wr82m0XXiriacgoXU9N6b0udwjBn3EzTqFjGc2ls3Bb/TASP7GSovblpBfWhURybPVcUXctuDP1ceKqI2bTCHi/kugcOwf8qcQGx+MDDGteAv1HVDDhk108PHdifshD/TQMvwZlsD2J07uvxwpe8k7imrG3n4D8M+k3mBdSfOKWggxl/YuoCCa+FiY7PIRFMnZHDQAYTQQDVrDO8IWrUWpp8vkzEfXqb9y9WgNnY+CDk+cLnvqRunaXFzjEm2H322ccc8Ow9OcXMj4FuzD8Acsk4KqRJ5GVa8zfH46i6WEo2g8v9x4LrCueY61Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6D6F1uxNm3V6x1QWFdCAKMhg1EzQgnKH1OTGZvxSZs=;
 b=T3LPbALeH0HmYPkexuNHuJLtWZvWLhhzYOlMG49HIctSnU14ZmBIXQ50XMzTrBAHxfZgfW2A2vUYjOYwsHq2ye2wUtYKuP1OjITPV8ORxNLpYU0igfkSahpfI2f9fpqbg7SNHGIrwD8y2oY8OAg5HWo+3D2Ln9YzjIUgJfLxkds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CY5PR12MB6249.namprd12.prod.outlook.com (2603:10b6:930:23::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Wed, 21 Dec 2022 15:52:04 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::2fd1:bdaf:af05:e178]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::2fd1:bdaf:af05:e178%3]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 15:52:03 +0000
Message-ID: <2ce4ce81-d345-4e6d-edf4-d3133aece267@amd.com>
Date: Wed, 21 Dec 2022 10:52:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-CA
To: Mike Lothian <mike@fireburn.co.uk>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20221014084641.128280-1-christian.koenig@amd.com>
 <20221014084641.128280-11-christian.koenig@amd.com>
 <CAHbf0-GPVQ4tRgtOLUkP8TW4T9+XGuQQQ70h-DoW9GhspWCa=w@mail.gmail.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH 10/13] drm/amdgpu: use scheduler depenencies for CS
In-Reply-To: <CAHbf0-GPVQ4tRgtOLUkP8TW4T9+XGuQQQ70h-DoW9GhspWCa=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0095.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::11) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|CY5PR12MB6249:EE_
X-MS-Office365-Filtering-Correlation-Id: 36a469fd-6ef6-4146-03b0-08dae36b4e19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3WTlJgM+67+hO5TnjYTO2j3jrZd3hDId0R7QqhLEdfVxAFYWctmOEupz/xDiDyTQATI+fwrJwyYulUMSD8M/j0ojKLN+chO7mElaGJ36ooWR+gBRITIv+MdpAUCt3Q6Bs+b3cOvdXx8jiF6I31fGxgLVeNWe4Z/D6AdWKtlYWpR8cbhSE9skLPiundLt5DoZ45QeOS2UxRoEFMMXaa0BnFX4r9Dx7qPaVg4SGCed5kM2p7swEmADsgI6qtdZyJUapeSco9+kaUNMtS2UXFCPxAdpzjZ08uGyUBu/04FXCBVbcnI/FXvtjsO/fNhDTvesubjvWvwqVVlZjClrZl/+Os7yZBuuCBeXm7/Nc2gVw3GuaJ+X2tVmvLWhyqdgu/vFlQLFyBay8Q/84rKo9UutipmDCnjYECOQMXX3TVP/CKXP5PHxco6t0IB4yQrQBX71rAJ2Nnb/L2BJAtcmSvRTuYsHTSu/hU/uIP1MBd4KUZmjj/LQMRDV8zIIUOx3dJAO0jpwifMcss2ZV+dAQ0bvkyUHNEojoNpXqen02VJwlbzMrLKM9vkX0VivgQgrQWYZ4jrN9VB9clBx24mZP9IT7i5FSkEIS/n/LcT0zlBlRd84sy5LehfLkSKMrtiC+VZM+XBevFOI62JYrhhMp8Oyeljrbstj0FRwwwEqd8cDqisL3ReOjbjnZXQLji8ROsx79IbRldCxPePk6EXIreCnDoOWYO6r+e+tYryDV5G4H7kq6AgBPmkCFS6RzSB4RObPfELuW3I6p+WXlqZlluXlYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199015)(4326008)(31686004)(6486002)(2616005)(45080400002)(110136005)(316002)(478600001)(966005)(66574015)(26005)(66556008)(83380400001)(53546011)(6506007)(8676002)(41300700001)(8936002)(6512007)(44832011)(5660300002)(186003)(66476007)(66946007)(36756003)(4001150100001)(2906002)(86362001)(38100700002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0praFl2UGd4TDhLMXZaRFI5aTN1T0oyaXFmd2o3Ri9MdE1LdjRGYVlMczc0?=
 =?utf-8?B?bWcrOU9qdFdiY3ZYYWl2S3hZbFhSd3A4eWx2dEJPY1VPaTA4ZEdGbWNGcUw0?=
 =?utf-8?B?VGF4L1F6aXdCSkQ0YUV5NHpMZnZYcytibmpNUUJuVlk1TzJwTmZyR0FmNUNS?=
 =?utf-8?B?dTZZNUdnK3R4aGwweTFGeVNvcEhUUkdsMVRzZjJZSlgvNlR4Ti9OTmo2bU9X?=
 =?utf-8?B?c3hQSXZ3WG9tRjNrR3IrMXlrQXJJVEluMHNURnhxSzdEYWhRY0ZuRjRhWE9q?=
 =?utf-8?B?MlVIUFVEYWVnMlpXck9YUmZ1UHNILyt1dVkwNWxlVllPajIzc094bDFGaFky?=
 =?utf-8?B?T3BObzNtRnJvU0kxbG9jenAyRjlqb3VOckpzeHgvZGg1ZCswRENRNG8xTWhh?=
 =?utf-8?B?bnVNWXYyVjV2YmJ0TFJvOVgyQVhRcU0xaEtDK3owRm5PNGxvUHNBZkdscVcz?=
 =?utf-8?B?NXJ1VElQOTBhUnhhTi9yZy9QYVQxYi9UWXM2TGtGc2FkTlVOWndRSGFzRDlz?=
 =?utf-8?B?RzRKYlNqaFdBWXBRZUVOZjNod2l3L0l6Sjh5Zk85T2d5c1JORUdjdXBxK0ZU?=
 =?utf-8?B?RkxhVm5YcGVVZ2gyUzQyWTQ2VExUQWRLeWlHWFlYekVwdTFTOXJGY0Ricysy?=
 =?utf-8?B?SVlyZ0paMTd5MEpRa1dvQTlIaGxtT251c3FBcHJCV3A0cXVQS1pHSjJTR1NT?=
 =?utf-8?B?LytLbjVOdG96M085dG1GZGpMcGYvdUlOWHNyNU1BSWhGSm02TlJjUi93S1l5?=
 =?utf-8?B?enQ0NUlhL1orVGd5am9Nd1RYQ1l4ODBwNm9VUXo0bXpvWjdsRGpLVC9ZZHJV?=
 =?utf-8?B?RjM1aDdjL3hTcmVYK2R6WTZpWmF6bXRJWFBZZWd1MmxSdmVxYi9LWGNYZXk4?=
 =?utf-8?B?K003Y3hlRGVobnV0ZWhzaUMxK2ZzT3NFV2FWSVFRWTFCWEdzRDZsUEdmV01Y?=
 =?utf-8?B?L0djSkJOV2liMUwwSTFjYTVHVmxMa0FQblhnODBBOG1saTZzQW9CbVFBRDR3?=
 =?utf-8?B?U1NMaEdQUjBneFFVZWNMTDFndHNpUmpocGRGS3llQVptWjdsVVZSM1RLMTU4?=
 =?utf-8?B?SUo2Qzk2SUp4Q2RodUs2ODVPcGdCTXVPalZNQjdXbStoRjl0c0lqSU00anU5?=
 =?utf-8?B?ZG1meHNqWFdKWFZNQm1PVUdiblVnb3NmWDVKQWhIVlhkVThlV2NqT1k5REdz?=
 =?utf-8?B?eGMwWXJZOGVSOXZGR2l2ZHhnYzlsbUgvd3FDbWdZTTM2MTh0MUtOUk9KR2g4?=
 =?utf-8?B?OTZzaHU5bDFlbFBiY3JtQUFTN2Y3T1FsNG8vRUtSb0pCWGZhMlhrekhsN01X?=
 =?utf-8?B?UnkyTWNaVTZDdzFMSGE1ZUFJYnJiZHhHRWViODB3cDJEVHFhckZEZ0R1Y3FJ?=
 =?utf-8?B?QzBaUWo1YkR5bnRhT2ZFU2tTT1hEUmRkZlZiTTVSWjVUMGhLcWowTjgzNjBj?=
 =?utf-8?B?d2ovRmYyRUpoMGZiUzZMelZxRDNNYmJ0aDYyVXVFRzNNM2g0N1Y5RWIrWnVa?=
 =?utf-8?B?eXRUUEM4bElVYkhzaTZuUUNQQ0dNSWxUVDdqaXg5YWw2UzJMbU1rUGgvQ0xm?=
 =?utf-8?B?cTltNmlCRkx4eWtUVVZVWUxVNksrVzh5QmVKTStSYTFSaitjRHFFZlhIWVVm?=
 =?utf-8?B?bXdpa1A4OVMvMkR0cjdtNzdOY2ZnZEl3VFlWK1Rzc3ZFcStWSnlrSTByeDVZ?=
 =?utf-8?B?UEVKM0tZUVpLa3hCVDEyMTk2aXlFMlJtMGRpTWREbGYxNEI4WkxlUGhERHdx?=
 =?utf-8?B?cmkrcHpWUVlMWEZnZTFSWXpTR3gyeGRIWFBacmtENzJHN0dpZmsxY0RUWUhv?=
 =?utf-8?B?dGRHc2p2OHp4Q1RqYlQvREpsTWh3Q0E5UmJtV0tHK3V4c3c0c0xZcWhGS1A0?=
 =?utf-8?B?cUkvS0kvdDMrMGx2aGhBUGp5QS9PT3pJWndtcVBYVmhkaUUveU1PeDJTMWZT?=
 =?utf-8?B?UlZseTNrTHB2K0g2b1N3cUNGNWpZVG13UkZMK1hJdHl2YlByTVEvMmNaMlF6?=
 =?utf-8?B?eHlWYzF6ZHpCYjBUUjNxZ3RuZkU3aHdaSzlyRTlLR0p2KzFlQTNENmlNN0dl?=
 =?utf-8?B?Zjl6NnhXWU1KTXhlK3lZeEFNcHJ2WHFENnEvTzRJa3puZ0RiaGs1OEo3dzVi?=
 =?utf-8?Q?hIlFFLXGow+fKAGPedbl1bU4/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a469fd-6ef6-4146-03b0-08dae36b4e19
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 15:52:03.9020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lmlKei28xd17n6SHQy/ZjZy+r45tJ5ZTYxJU069cmTIiC68Xe2lvjDCfHGo3ULdL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6249
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-12-21 10:34, Mike Lothian wrote:
> On Fri, 14 Oct 2022 at 09:47, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>>
>> Entirely remove the sync obj in the job.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  | 21 ++++++++++-----------
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h  |  2 ++
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c |  9 +--------
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.h |  1 -
>>  4 files changed, 13 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> index d45b86bcf7fa..0528c2b1db6e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> @@ -426,7 +426,7 @@ static int amdgpu_cs_p2_dependencies(struct amdgpu_cs_parser *p,
>>                         dma_fence_put(old);
>>                 }
>>
>> -               r = amdgpu_sync_fence(&p->gang_leader->sync, fence);
>> +               r = amdgpu_sync_fence(&p->sync, fence);
>>                 dma_fence_put(fence);
>>                 if (r)
>>                         return r;
>> @@ -448,7 +448,7 @@ static int amdgpu_syncobj_lookup_and_add(struct amdgpu_cs_parser *p,
>>                 return r;
>>         }
>>
>> -       r = amdgpu_sync_fence(&p->gang_leader->sync, fence);
>> +       r = amdgpu_sync_fence(&p->sync, fence);
>>         if (r)
>>                 goto error;
>>
>> @@ -1108,7 +1108,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>>         if (r)
>>                 return r;
>>
>> -       r = amdgpu_sync_fence(&job->sync, fpriv->prt_va->last_pt_update);
>> +       r = amdgpu_sync_fence(&p->sync, fpriv->prt_va->last_pt_update);
>>         if (r)
>>                 return r;
>>
>> @@ -1119,7 +1119,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>>                 if (r)
>>                         return r;
>>
>> -               r = amdgpu_sync_fence(&job->sync, bo_va->last_pt_update);
>> +               r = amdgpu_sync_fence(&p->sync, bo_va->last_pt_update);
>>                 if (r)
>>                         return r;
>>         }
>> @@ -1138,7 +1138,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>>                 if (r)
>>                         return r;
>>
>> -               r = amdgpu_sync_fence(&job->sync, bo_va->last_pt_update);
>> +               r = amdgpu_sync_fence(&p->sync, bo_va->last_pt_update);
>>                 if (r)
>>                         return r;
>>         }
>> @@ -1151,7 +1151,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>>         if (r)
>>                 return r;
>>
>> -       r = amdgpu_sync_fence(&job->sync, vm->last_update);
>> +       r = amdgpu_sync_fence(&p->sync, vm->last_update);
>>         if (r)
>>                 return r;
>>
>> @@ -1183,7 +1183,6 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>>  static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
>>  {
>>         struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
>> -       struct amdgpu_job *leader = p->gang_leader;
>>         struct amdgpu_bo_list_entry *e;
>>         unsigned int i;
>>         int r;
>> @@ -1195,14 +1194,14 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
>>
>>                 sync_mode = amdgpu_bo_explicit_sync(bo) ?
>>                         AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
>> -               r = amdgpu_sync_resv(p->adev, &leader->sync, resv, sync_mode,
>> +               r = amdgpu_sync_resv(p->adev, &p->sync, resv, sync_mode,
>>                                      &fpriv->vm);
>>                 if (r)
>>                         return r;
>>         }
>>
>> -       for (i = 0; i < p->gang_size - 1; ++i) {
>> -               r = amdgpu_sync_clone(&leader->sync, &p->jobs[i]->sync);
>> +       for (i = 0; i < p->gang_size; ++i) {
>> +               r = amdgpu_sync_push_to_job(&p->sync, p->jobs[i]);
>>                 if (r)
>>                         return r;
>>         }
>> @@ -1248,7 +1247,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>>                 struct dma_fence *fence;
>>
>>                 fence = &p->jobs[i]->base.s_fence->scheduled;
>> -               r = amdgpu_sync_fence(&leader->sync, fence);
>> +               r = drm_sched_job_add_dependency(&leader->base, fence);
>>                 if (r)
>>                         goto error_cleanup;
>>         }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
>> index cbaa19b2b8a3..207e801c24ed 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
>> @@ -75,6 +75,8 @@ struct amdgpu_cs_parser {
>>
>>         unsigned                        num_post_deps;
>>         struct amdgpu_cs_post_dep       *post_deps;
>> +
>> +       struct amdgpu_sync              sync;
>>  };
>>
>>  int amdgpu_cs_find_mapping(struct amdgpu_cs_parser *parser,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> index ba98d65835b4..b8494c3b3b8a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> @@ -106,7 +106,6 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>         (*job)->base.sched = &adev->rings[0]->sched;
>>         (*job)->vm = vm;
>>
>> -       amdgpu_sync_create(&(*job)->sync);
>>         amdgpu_sync_create(&(*job)->explicit_sync);
>>         (*job)->vram_lost_counter = atomic_read(&adev->vram_lost_counter);
>>         (*job)->vm_pd_addr = AMDGPU_BO_INVALID_OFFSET;
>> @@ -174,9 +173,7 @@ static void amdgpu_job_free_cb(struct drm_sched_job *s_job)
>>
>>         drm_sched_job_cleanup(s_job);
>>
>> -       amdgpu_sync_free(&job->sync);
>>         amdgpu_sync_free(&job->explicit_sync);
>> -
>>         dma_fence_put(&job->hw_fence);
>>  }
>>
>> @@ -202,7 +199,6 @@ void amdgpu_job_free(struct amdgpu_job *job)
>>                 drm_sched_job_cleanup(&job->base);
>>
>>         amdgpu_job_free_resources(job);
>> -       amdgpu_sync_free(&job->sync);
>>         amdgpu_sync_free(&job->explicit_sync);
>>         if (job->gang_submit != &job->base.s_fence->scheduled)
>>                 dma_fence_put(job->gang_submit);
>> @@ -246,10 +242,9 @@ amdgpu_job_dependency(struct drm_sched_job *sched_job,
>>  {
>>         struct amdgpu_ring *ring = to_amdgpu_ring(s_entity->rq->sched);
>>         struct amdgpu_job *job = to_amdgpu_job(sched_job);
>> -       struct dma_fence *fence;
>> +       struct dma_fence *fence = NULL;
>>         int r;
>>
>> -       fence = amdgpu_sync_get_fence(&job->sync);
>>         while (fence == NULL && job->vm && !job->vmid) {
>>                 r = amdgpu_vmid_grab(job->vm, ring, job, &fence);
>>                 if (r)
>> @@ -273,8 +268,6 @@ static struct dma_fence *amdgpu_job_run(struct drm_sched_job *sched_job)
>>         job = to_amdgpu_job(sched_job);
>>         finished = &job->base.s_fence->finished;
>>
>> -       BUG_ON(amdgpu_sync_peek_fence(&job->sync, NULL));
>> -
>>         trace_amdgpu_sched_run_job(job);
>>
>>         /* Skip job if VRAM is lost and never resubmit gangs */
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
>> index 9c10b9bd0084..6558839fda03 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
>> @@ -47,7 +47,6 @@ enum amdgpu_ib_pool_type;
>>  struct amdgpu_job {
>>         struct drm_sched_job    base;
>>         struct amdgpu_vm        *vm;
>> -       struct amdgpu_sync      sync;
>>         struct amdgpu_sync      explicit_sync;
>>         struct dma_fence        hw_fence;
>>         struct dma_fence        *gang_submit;
>> --
>> 2.25.1
>>
> 
> Hi, I've been testing the Mesh shader benchmark in GravityMark and
> I've bisected my laptop freezing up and rebooting, to this commit
> 
> 1728baa7e4e60054bf13dd9b1212d133cbd53b3f is the first bad commit
> commit 1728baa7e4e60054bf13dd9b1212d133cbd53b3f
> Author: Christian König <christian.koenig@amd.com>
> Date:   Thu Sep 29 14:04:01 2022 +0200
> 
>    drm/amdgpu: use scheduler dependencies for CS
> 
>    Entirely remove the sync obj in the job.
> 
>    Signed-off-by: Christian König <christian.koenig@amd.com>
>    Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
>    Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2Fmsgid%2F20221014084641.128280-11-christian.koenig%40amd.com&data=05%7C01%7Cluben.tuikov%40amd.com%7C89490e3fad4843fd789308dae368e10a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638072336848708258%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=yinQfgx3pcqZjCzafxTysYlhb4RUwJN8t8cb2VjOOes%3D&reserved=0
> 
> drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  | 21 ++++++++++-----------
> drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h  |  2 ++
> drivers/gpu/drm/amd/amdgpu/amdgpu_job.c |  9 +--------
> drivers/gpu/drm/amd/amdgpu/amdgpu_job.h |  1 -
> 4 files changed, 13 insertions(+), 20 deletions(-)
> 
> This is on a prime system 6800M with the latest mesa
> 
> I tried reverting this patch however it didn't revert cleanly, and my
> attempt doesn't work and only partially freezes up the system
> 
> Would you like me to open a bug for this on
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues&data=05%7C01%7Cluben.tuikov%40amd.com%7C89490e3fad4843fd789308dae368e10a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638072336848708258%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=M8d6vBXgByuQCRm9844a9jYtIDfuDy7efv3NM03Bmho%3D&reserved=0 ?
> 

Hi Mike,

Could you try this patch:

https://lore.kernel.org/all/20221219104718.21677-1-christian.koenig@amd.com/

Regards,
Luben


