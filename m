Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1198E6D20FF
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 14:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2677310F22B;
	Fri, 31 Mar 2023 12:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13D210E0F4
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 12:57:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjfj45tHCG5IESc81gRo94mLvH/0w6u5kRkj9vad1FD5CaFsolFS4gU1w7aO3nrJK/SeMm14U0LyRdJlB8epKOjgHc3aoo4mDwZVuZN2OF8VcsK48YEUCWaF0UOoKhgc0jcZaVHQ82tP5x6bX5Rjd19u2FLrBM6lZxTHZYsb7h9gsFWxLFy2rYiBPvaisn6ZrsgQ0eX9qMDEgpMUiRjdmWJFq+vrR9I6Pi8LyOF2+tnG+VCWWzPd0uYG2WaC4DrtJZ+1znVPZh5kJBhSVtSpgqSaLQkdJZB6NRG//yfzpaUpDK2vhLfnL5/Fe9V2Vt1ecPup66QrntuHeCR5IL6yWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Er8zkLty/WZlRO5iE71cC3M0P9Guua595sajWzw6q6M=;
 b=WnMFaMRYLFbwh9hOX7i5zqWGPJR8AUzwrXNx4CmVaMpyr3da0FQnRs5mBJ0zpbdZmwTVV2II5kLyX0/+8JPsaWpJWwiRhW2s5zRxrF5BhZICW28v/IpgK8EG1MtA2oMxjzueJkQ8aDljQkKucmPRlTaTRE6qu77IufueZ3XYyPfBZlGx/DyCMM1P7DY+s03LsKIqhOydAzeqEvhz49ZtEqkusuXYJmHgcS8QCmfafOfy0M0Sb56fd53OkyEJeaMmxB9mKXQ+2o4QiPAFEKcaO4M8Ii4JtBQb9DQbEGgPuSiG4+Wv4qFNtpq8YM2vtTSS/kZKZe4QwMZrEpQZsvKxCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Er8zkLty/WZlRO5iE71cC3M0P9Guua595sajWzw6q6M=;
 b=4PYO/pbPGpYpfOqRibLpe6Ze0uDACuE2OZL78ZyVycKlrurja5XJ6BytW+hg+vl34P5whi4injxl5P9+dHuEA+28YwzjN1HlT12pNDcNTRAbwxl0A68ztPrhGIZpcH6WITBFl2frosVpYGHqMjyXp+TxPQJMhDnh47xhMm6SG70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH7PR12MB6763.namprd12.prod.outlook.com (2603:10b6:510:1ad::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.23; Fri, 31 Mar 2023 12:57:47 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80%5]) with mapi id 15.20.6254.022; Fri, 31 Mar 2023
 12:57:47 +0000
Message-ID: <3098ac42-6a1a-d931-3299-54c5d17d6b93@amd.com>
Date: Fri, 31 Mar 2023 08:57:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 l.stach@pengutronix.de, "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
References: <20230331000622.4156-1-dakr@redhat.com>
 <6ad72a7f-302f-4be1-0d53-00ff9dc37ef7@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH] drm/scheduler: set entity to NULL in
 drm_sched_entity_pop_job()
In-Reply-To: <6ad72a7f-302f-4be1-0d53-00ff9dc37ef7@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0345.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fc::26) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH7PR12MB6763:EE_
X-MS-Office365-Filtering-Correlation-Id: 2998eb9e-7fc4-420b-ddc4-08db31e786c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jzIctNA7Viwmm9w8ckADLZ3CGSmdcGd++qO30oOkWQFWep85hJ6W2y267GqvrBmoTgWSOfE4WA3/JcqEwSsB1oX+rxuTHjKQk0XX6Q1guPwtlBPQ5fMDiFMp/E3LnhDfE8FgGApx7cyhCZjHWFiNYvmMAJqCSORPlcHdGtCDkGJK3+23d6CxNvGEKVBPfl+zkRxhc3Ro9xgzB8A0i1dVUlu3lQEcJbKe16aLhEKsmR2NfXWLz5QMRC2z1pEdxDIJcKcE9S2E7UPiiE8S1AsoH2ofys92pZ6qOUeY2QaNQyLoX2qyZIeRg0wsp6vhwDitdwdOTIXV0/jlKiH39EKbP+BiuafvX7fMaywP5aS6qrWOQklPLpCJhKkS4rfWYQEbZpsPHXYx7iyBnnjYCTSkguIWyc7unRwo4cwqP1XwLN32m9mWryRi4bRD57Kz+mMh/9BtI8kzhF0GwpROyLFv0yrmVNCYA1PKVDOZAT1Mm5wcIGtl5UhJ+LbzeVjH5cJar0422sWhmlU5thDqJI13dgSECmRvH/gp/hXXdlBB/rg5Pm5Vl+/W7VIAPychHIlnDqsDj+mCJ5CaMYLo39GNg5LNOh8iASzUt5aMRCovn7BvS+SRehYUmbtjJI8X+R8Ep981G97i8vLOUVJhCT+WEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199021)(478600001)(6636002)(31686004)(83380400001)(2616005)(31696002)(26005)(6512007)(6666004)(6506007)(6486002)(4326008)(8676002)(66476007)(66556008)(316002)(110136005)(66946007)(53546011)(55236004)(66574015)(186003)(5660300002)(41300700001)(44832011)(8936002)(38100700002)(2906002)(86362001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjYxV3NlcUdXcXlEQWFMdG5ELyswa25laG1tazg0cm40V2lINU9Pc0pGdzU3?=
 =?utf-8?B?R1VlNG9EOHAzdDJRZ2twMkNmZW5ycXhaS01DU0k1c2FURzRoY0ZMZzQrM1Ns?=
 =?utf-8?B?SGFKbC9UbjQrZEgrQXFrTG9GYnJ4UVlHL0dCdVpMNUpSWjJwcEdKZXdtaDhz?=
 =?utf-8?B?K1BGbmE3UWNsZ3F1Nk5mbTJ6enEwNzVzeHNXakFMTDdZdlFnaVVqTGlycmRk?=
 =?utf-8?B?Sm9jaHFGNmZDV0pJQlRzd2c5dms5Uy9qSmV1THZNRk9zYndPRFBqQ0NaWXZh?=
 =?utf-8?B?Q3RtSTg4SXJ0ay9KSDVXcC93amR0SzlhUDJtaVcwZUV4UmtqYTM0SkRsN0Y2?=
 =?utf-8?B?eEk1SVJ3S0I1dXM1ZWI4aEFGZXVIaTRaVnV4S2xFUDRWUGpTMGdHMFhTdURD?=
 =?utf-8?B?TndPWWhmWjZNVkRGK0ZTTlk5ZUlvVzNhbCtRM0lzd3NscnljYkNidWd3VVFp?=
 =?utf-8?B?TE9MVFAzSW1Qalg4RmZkR1RiYjhqVFVXcmdKbEFjQ1dLLzVOL3FiU0ljWHFF?=
 =?utf-8?B?WUJKKzkwMlhybFlNWko5MjZTK3ZMbWZyQUNvbUc4UGRPczFpdXJCNDRGdk5k?=
 =?utf-8?B?ZkJMZ2ovVVJiUDJGUXJRR3hsYm4vSWFaTzJIMzVYNzJlMjEwYis2c0JyQ3Rs?=
 =?utf-8?B?Wm1IcDRHa2gwVlFrR2t2eUlTRk5NdFAvYUJ5M1hCRU9VZnN3d1dXam1yNkk2?=
 =?utf-8?B?QTAyaUVWdDdYYXFwWWp5R2dDVmVhWVhYVXZLRGFORjNkY0tvM012c1Q5Q1NO?=
 =?utf-8?B?WUFidkJYcVgxNEUvMzdaWWJMVUpnT0VpWmNGMks5ckhEVjNsYzFnaGNwVDdi?=
 =?utf-8?B?RFhjeHozZmpFMzRjUlNNYXRvNVNLc3R5ck5rRzhzbVJDTGJObTNOWWUyUFZ1?=
 =?utf-8?B?UjQ5Y2ltM1FoL2ZyMVk2VnBhb0lXamswQmQrUTVpMDZRSys0Y2JPNE1xNFYx?=
 =?utf-8?B?T1RhSTRPeXdZRE81UGxMVnhURzNPeHNIMjg0aDhKdXpMZjJ5Q0ZHVjcyUjVv?=
 =?utf-8?B?Yko2SDI3ZjhuMmJKUXpONnV2ZE1Wdys4SWJHdFRNK3ZaUEZwc1ZKUjdRV1l6?=
 =?utf-8?B?MVNmZU11WDJmc2FSR0hUNjFqMjg4amxUKytqL3JTOTVHN3VQQVpmcmxFZTFW?=
 =?utf-8?B?aUo3cWt2OGt0TmV5NjZLUVZ4bWVRNGdzMjBhNHBzejRvS3VyZ3I2U2ZMK081?=
 =?utf-8?B?cE5kdlpOTHZXVEdmTFJhNEQyejVsVlFJOGYwS2Z0K3lMblhMQXlJNlpjVzVD?=
 =?utf-8?B?MnF5a2FHdGZWMkZvNGZ2cDY3eGpPQUhoeTR2OWJxcXk3T3FLeWMyS2I0V21p?=
 =?utf-8?B?WVN0YkpVazgycE5kbVVGK2xLNzMzWFRyNncyeTQ2aWxRaEdneGNVSWY0ZFpy?=
 =?utf-8?B?UkZVNFhJNkM2VkJOcVpna3I5T1hLT0wrM2xWMDF2QXpydWtKS1JpY3BuVHBZ?=
 =?utf-8?B?MDFmc1lkdDl5M1pxblpDcHpiSGFEVFArTldaTm5tSTQ0V3RRMXNqUmlYVzd6?=
 =?utf-8?B?Z3lpOW42aUxTdVZibGJ4N21nWnE1MUdXWkVpNjFvYnlLTncvNENjWjd3a21W?=
 =?utf-8?B?SVJyejdLV3pCZG13T3hiMzBOV2JNYW1WTnBFS0JRYWRWN2p5RktWdmZUREsw?=
 =?utf-8?B?N2pPb0JDa3pBVkFiNDFmSVdLZmczMDRiSkFPWGxpbklBTFhudkowY3JXSXQ2?=
 =?utf-8?B?SWNVRlhUb0k2VkhOSjlXM21zUjQ2R1Vhc0N1VkV6SnFjdWhyVzZIemMyaFE3?=
 =?utf-8?B?ZUhjQkFZQ21HOVQ0Vll0Y2QwZ2J0aUpYd2syQ3AzUThDM3NsV2lqS1NZbEJN?=
 =?utf-8?B?aHE2RHlKaUZTNVo1bGxla0Z4Q2FPd3VURUNGZnhhZ3NpT3c0cUsybVJiRTFk?=
 =?utf-8?B?NnNoS1BVMDIvbTFRTG9OajlRMjRhYlR6RXhNZWJBa1BKMmlBRnFRN1lwTDlH?=
 =?utf-8?B?UlA2a2xZNjNmZXp0aU5heWRIWjR2dmFQbEpNbnpKOHp0RFFlUlMzU29TOUI5?=
 =?utf-8?B?MG1yTWFCcVovdGVGZmxObmJDMmg2K0RSSXRqdnNiV0J2VmFjYml1QW9MTWN4?=
 =?utf-8?B?K2xyZC93Y0plMnEwdC92eHk4N2w3VGJRZjErTDh4SUFNOGo5RUZwSzI1dXRl?=
 =?utf-8?Q?gBO/WGY1D6yeMm8k40/+BrIwz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2998eb9e-7fc4-420b-ddc4-08db31e786c5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 12:57:47.3348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljKsYbFSxOSHNOnnFDWnadMcEbH1Xj5etCem3if39uKSyKDw2kkSUh7/pd0q5QKN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6763
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-03-31 01:59, Christian König wrote:
> Am 31.03.23 um 02:06 schrieb Danilo Krummrich:
>> It already happend a few times that patches slipped through which
>> implemented access to an entity through a job that was already removed
>> from the entities queue. Since jobs and entities might have different
>> lifecycles, this can potentially cause UAF bugs.
>>
>> In order to make it obvious that a jobs entity pointer shouldn't be
>> accessed after drm_sched_entity_pop_job() was called successfully, set
>> the jobs entity pointer to NULL once the job is removed from the entity
>> queue.
>>
>> Moreover, debugging a potential NULL pointer dereference is way easier
>> than potentially corrupted memory through a UAF.
>>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> 
> In general "YES PLEASE!", but I fear that this will break amdgpus reset 
> sequence.
> 
> On the other hand when amdgpu still relies on that pointer it's clearly 
> a bug (which I pointed out tons of times before).
> 
> Luben any opinion on that? Could you drive cleaning that up as well?

Hi Christian,

No worries, yes, I'll take a look at this after breakfast.

> 
> Thanks,
> Christian.
> 
>> ---
>> I'm aware that drivers could already use job->entity in arbitrary places, since
>> they in control of when the entity is actually freed. A quick grep didn't give
>> me any results where this would actually be the case, however maybe I also just
>> didn't catch it.
>>
>> If, therefore, we don't want to set job->entity to NULL I think we should at
>> least add a comment somewhere.

I agree with the sentiment of this patch. I'll have to take a closer look at this
because there was some indirect pointer dependency due to the way the FIFO was implemented,
and I review the code every 3-6 months to remind me of that--maybe it's related, maybe
not. But this looks like a something we can delve into and at best come up with a comment
explaining what's going on and why.

We haven't seen any oopses so far the way this is, and any new patches which evoke
an oops, may be doing something they shouldn't. I'll take a look.

Any indication of what these new patches were doing?

Regards,
Luben

>> ---
>>
>>   drivers/gpu/drm/scheduler/sched_entity.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 15d04a0ec623..a9c6118e534b 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -448,6 +448,12 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>   			drm_sched_rq_update_fifo(entity, next->submit_ts);
>>   	}
>>   
>> +	/* Jobs and entities might have different lifecycles. Since we're
>> +	 * removing the job from the entities queue, set the jobs entity pointer
>> +	 * to NULL to prevent any future access of the entity through this job.
>> +	 */
>> +	sched_job->entity = NULL;
>> +
>>   	return sched_job;
>>   }
>>   
> 

