Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 509552B32BB
	for <lists+dri-devel@lfdr.de>; Sun, 15 Nov 2020 07:40:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5D46E98D;
	Sun, 15 Nov 2020 06:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E1A6E98C;
 Sun, 15 Nov 2020 06:39:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzusbXH03oyaeRhk8ZRA8DEz6lFxpX9dtICjmD2yh8ThhUpv/TwQSzMCIATz7uGyt5hxPAlMvRObxJ1KRQeaLoXPdg5y9xHnOMKIh8gSBpDo2KUJ93M8qRaiHV14cTbbXY9/xtKHCdh4RKvu34zmEHMNXEKkxl0G+tFtyHILhRgEPxmCBZL/3xdsWy4hcwd9X/9Ki/7sEp5+h1Wbpb6u3G918JRKo9MPMzM356DEdHlKAX2W6V/NHUlrqtBl8tZlkBCx2JnMB/kpfpCTK+Yne62SYEzqZJZM0LjK1kv6m+g1ugid2hTNJOMibkRcyR9tveVw7jkYJoEJp8o1118b8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/TacByzDY3/Gu74hxR8yANQfgMy/gAOqqwv7MNaEVg=;
 b=boLpzCrEQWx5KqOH1UExueyjSgykRsi0HexJem1HvM3NPLsygUyvpbezsJgg/xgH3oo3n80m/UrXBzFxJRSNNm1tLdI7/MGkS3aBHMYiw9YY8bTQ5oWEd2YhSWOnM8ufSqJyzOOQ1GJ+dCjz8zJ1tfVpDGiahBgXkIYmslPTJNe/g1lCRIHc6dFhxJ5cw3snT97T4DSe0Nk2eMe8GAzmEIvOn/ukKALa6qX87IaeWz8uiXlEidQyX27AtAesaggERhxahgqASxnHRaxZk7wK5zvm8fHHEv901R8mXx5BRNIRnwXkEXmbppZLK9RvWG5DfSDfrJOcWOUoF1d8H0hL7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/TacByzDY3/Gu74hxR8yANQfgMy/gAOqqwv7MNaEVg=;
 b=fnvKRYwFkICgRkLfe1g7I5djvCUwegaOQ+asPjlMJ8kZ6S6q4IFz+Vv4qQtcS5MeLb93tLDE/Gr+8tDsQjNbwRFbWJewswpRtKnkDzRSxTRNjC/LL6dIX2xqbLlX6IAJxEOIlsmiQtMvzq+/Ux3FLBnxtuNq8GHSAulwxckl67o=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM5PR12MB2582.namprd12.prod.outlook.com (2603:10b6:4:b5::37) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21; Sun, 15 Nov 2020 06:39:51 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%7]) with mapi id 15.20.3564.025; Sun, 15 Nov 2020
 06:39:51 +0000
Subject: Re: [PATCH v2 1/8] drm: Add dummy page per device or GEM object
To: Daniel Vetter <daniel@ffwll.ch>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-2-git-send-email-andrey.grodzovsky@amd.com>
 <20200622093501.GZ20149@phenom.ffwll.local>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <9bbbfe43-f172-fafb-ddbe-8379c8f2c691@amd.com>
Date: Sun, 15 Nov 2020 01:39:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20200622093501.GZ20149@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:f4ce:fed6:ae68:7506]
X-ClientProxiedBy: YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17)
 To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:f4ce:fed6:ae68:7506]
 (2607:fea8:3edf:49b0:f4ce:fed6:ae68:7506) by
 YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.25 via Frontend Transport; Sun, 15 Nov 2020 06:39:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 80d10227-73be-4383-fee8-08d8893140d9
X-MS-TrafficTypeDiagnostic: DM5PR12MB2582:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2582DCD67F49DAC0D7ACF26EEAE40@DM5PR12MB2582.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IjoExaWHium4neXQ51lr6l7mfb+wwnuMDV2d4lX7TDifdo+Wla0rZyKmT0aZyajffaiJZgPnCnpvmwzu4C4lY1eMeHfoMk8SEC28c1pTsZvhKsFUh/gGHKtSIXLigudvxw4nYq8IRu9lisxS8ktW2yNHvQ+jNXBOnaguFE2VcKrSeItJosFBphrk0ATaoyd5/iQbgwWB4aZNb2PS5BEQRy4r8CxAGXX4Fo/7GuvTpDJ70qJ4rY60zISh5K3B39yMwQS77jYLgjsxp8KySUNsiuL3qMQ4ksH+pjkCrGRSRCvcWre+EiGKEwT6XfQRYJRSwXW82GLggzdwlnfR136fRir2Bsf5jI2MQQcPlBPXZkMaPr2hRz8jtrlh8ONPDHrBlGdBfMLjqyhPXbTT2MmwizJdD9DYz+UGJWx+Jh35JJMIUF5De9Fl0PC+bCMHCM+zxPUPIPRqAtmGc18SdcTpqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(366004)(39860400002)(346002)(2906002)(83380400001)(186003)(16526019)(8676002)(6486002)(53546011)(6916009)(31686004)(5660300002)(316002)(66946007)(966005)(66476007)(66556008)(36756003)(8936002)(2616005)(86362001)(478600001)(31696002)(52116002)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MjEzYTVhWkhWZUd2OExJbHpLZW01TE51amRYeXRRTzZiUzA5QTlmcXp4dEpq?=
 =?utf-8?B?UE5oTTNFc0pkcmVseHpQNzl2c2NZMVErVmJBYmo4ZmwybmxWSnZVNmxXY1FR?=
 =?utf-8?B?RjU1Ryt3SW11dlc0S2hoQ1Z1QU9uQmxYZlptUWxUQ3pTSmJWcytXU2d4YWhv?=
 =?utf-8?B?eTRiZFQ5SzBCaUpPazU3WVBGbGU2TXNHbjZLaVBxZmZlanRRQmF1K3FLcnRr?=
 =?utf-8?B?NTdjeGd5d3A3UkdZTHYxTEIwS05KZ283L2U3cWNiMVFFdlgycnJxVXZ0ZTVm?=
 =?utf-8?B?cVZjTlFSc3IwQ2lYTnpSN0hVcm5BMlJ1eWhsRVRINmtyRlRuOEcrY0dVOTlY?=
 =?utf-8?B?dVBMOU9yUmhtdnAycGFQZS9PR0F6RVZYdGM2cGppcE05NTJvTU9UV2dMM2xr?=
 =?utf-8?B?S3hzNjJRZ1puYXJTTFpOSVBQOVBPS2JOWHZDbU91am5PcUVFWHRLTDF1UTBR?=
 =?utf-8?B?Y2tVcG1RcWJPVVFWK3M0Q1o0aUp5WkFremZDZWtsckdQbXQwc0l4TTBocjhP?=
 =?utf-8?B?UDRkbFdCRUlKNEp6SEVDNFJHYlVqMXdKY3hmaFV5RHVZZTMxMS9MSElwQ0JG?=
 =?utf-8?B?d1ZQMVNTREdMU2U1c1hyUFRDNFZ3WkNNSitKd05vUU9mSStCdWNaeldGRlVm?=
 =?utf-8?B?UDlVbDFGZ3RNblNrR0pMUHorSTVBb0tVRDNKR1I0czd0eWN2QUlKVWdpT1Jm?=
 =?utf-8?B?ZGlVZFd1ZkZzbmpOOVpDN0xyakMycktuUE9kVFlhbHBXREl6SHBtMnJCYW1q?=
 =?utf-8?B?aUVVWm5CTzFwY21NcGloUmp1NDN2Rkp6SXhXdnFjTkN1VDkzOEJQLzh5Zm9B?=
 =?utf-8?B?dGFiZVp3MEtnbUdNQ1hrekNmZzdoc1BNRG4vVXc3bll6eGgzbFFlbjJad2tU?=
 =?utf-8?B?c2M5b2RDZ1kveC9TRU9OZktiSFNXR0x1OVZpNlRCTGVUWjA3VThkdHBJSXZl?=
 =?utf-8?B?dTY3Y21DeEUyVkJqVTVzY2NFV2lrUlc2T2ZTUk9lVXd6RmZuNU4zazUwTWor?=
 =?utf-8?B?TFdMSnF5aTAxQ0pHaUhzT1YyTU56RlJsSy9HZ3huNjVSMWJhTnNkYWcrd0VO?=
 =?utf-8?B?UktPckFkanpyU04zZTdINW5abGhTQ1FneElheHB6ZlhJR0N4dC9vRGtwZW4x?=
 =?utf-8?B?cUNsbGh0K3BXWGZVM0dlL2dyVDF2Mk5pTGQxNFFSZkhuSlJwNUpiQml1RWJv?=
 =?utf-8?B?MFlFS0ExMjZmTVU1cWxTVE10d1p4M2s4NzhtaGFsbzZ6Zm1kWXNNZUFFQkEw?=
 =?utf-8?B?S2tLaVpMdkJBNSthMEFMbmdsc3VURDIwanA4bStUOEpRdWZkUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d10227-73be-4383-fee8-08d8893140d9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2020 06:39:51.1080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xa6Zh/9luCngbA1vaAUIMNW5DSsznjcGWXOLDSUBWEnBJIcbbvZAIKewEP1+jXu5S3z0sOeVRRtr5qZyWB80Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2582
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/22/20 5:35 AM, Daniel Vetter wrote:
> On Sun, Jun 21, 2020 at 02:03:01AM -0400, Andrey Grodzovsky wrote:
>> Will be used to reroute CPU mapped BO's page faults once
>> device is removed.
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/drm_file.c  |  8 ++++++++
>>   drivers/gpu/drm/drm_prime.c | 10 ++++++++++
>>   include/drm/drm_file.h      |  2 ++
>>   include/drm/drm_gem.h       |  2 ++
>>   4 files changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index c4c704e..67c0770 100644
>> --- a/drivers/gpu/drm/drm_file.c
>> +++ b/drivers/gpu/drm/drm_file.c
>> @@ -188,6 +188,12 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>>   			goto out_prime_destroy;
>>   	}
>>   
>> +	file->dummy_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
>> +	if (!file->dummy_page) {
>> +		ret = -ENOMEM;
>> +		goto out_prime_destroy;
>> +	}
>> +
>>   	return file;
>>   
>>   out_prime_destroy:
>> @@ -284,6 +290,8 @@ void drm_file_free(struct drm_file *file)
>>   	if (dev->driver->postclose)
>>   		dev->driver->postclose(dev, file);
>>   
>> +	__free_page(file->dummy_page);
>> +
>>   	drm_prime_destroy_file_private(&file->prime);
>>   
>>   	WARN_ON(!list_empty(&file->event_list));
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>> index 1de2cde..c482e9c 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -335,6 +335,13 @@ int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>>   
>>   	ret = drm_prime_add_buf_handle(&file_priv->prime,
>>   			dma_buf, *handle);
>> +
>> +	if (!ret) {
>> +		obj->dummy_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
>> +		if (!obj->dummy_page)
>> +			ret = -ENOMEM;
>> +	}
>> +
>>   	mutex_unlock(&file_priv->prime.lock);
>>   	if (ret)
>>   		goto fail;
>> @@ -1006,6 +1013,9 @@ void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *sg)
>>   		dma_buf_unmap_attachment(attach, sg, DMA_BIDIRECTIONAL);
>>   	dma_buf = attach->dmabuf;
>>   	dma_buf_detach(attach->dmabuf, attach);
>> +
>> +	__free_page(obj->dummy_page);
>> +
>>   	/* remove the reference */
>>   	dma_buf_put(dma_buf);
>>   }
>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>> index 19df802..349a658 100644
>> --- a/include/drm/drm_file.h
>> +++ b/include/drm/drm_file.h
>> @@ -335,6 +335,8 @@ struct drm_file {
>>   	 */
>>   	struct drm_prime_file_private prime;
>>   
> Kerneldoc for these please, including why we need them and when. E.g. the
> one in gem_bo should say it's only for exported buffers, so that we're not
> colliding security spaces.
>
>> +	struct page *dummy_page;
>> +
>>   	/* private: */
>>   #if IS_ENABLED(CONFIG_DRM_LEGACY)
>>   	unsigned long lock_count; /* DRI1 legacy lock count */
>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>> index 0b37506..47460d1 100644
>> --- a/include/drm/drm_gem.h
>> +++ b/include/drm/drm_gem.h
>> @@ -310,6 +310,8 @@ struct drm_gem_object {
>>   	 *
>>   	 */
>>   	const struct drm_gem_object_funcs *funcs;
>> +
>> +	struct page *dummy_page;
>>   };
> I think amdgpu doesn't care, but everyone else still might care somewhat
> about flink. That also shares buffers, so also needs to allocate the
> per-bo dummy page.


Not familiar with FLINK so I read a bit here https://lwn.net/Articles/283798/
sections 3 and 4 about FLINK naming and later mapping, I don't see a difference
between FLINK and local BO mapping as opening by FLINK name returns handle
to the same BO as the original. Why then we need a special handling for FLINK ?

Andrey


>
> I also wonder whether we shouldn't have a helper to look up the dummy
> page, just to encode in core code how it's supposedo to cascade.
> -Daniel
>
>>   
>>   /**
>> -- 
>> 2.7.4
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
