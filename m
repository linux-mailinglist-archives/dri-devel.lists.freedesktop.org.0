Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C857D901D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 09:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3EB10E94A;
	Fri, 27 Oct 2023 07:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2077.outbound.protection.outlook.com [40.107.212.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4751D10E94A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 07:44:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNAw099E5KypmeQYJSSgIGnAoqs5zuBOe3nCch3k7i/bdfI/3mOdU+itEq3beorecHN31MqKygAjR6yuhSGDmlZlfQczl1j+03XbpZE4tDN5FD5C41BNsFMD8ClfP7w/oIOjAJrXXCpqCRJcc4EAogpuXHYNKl7xmt9dYSJjizGL0lCEXKlEy+K/WWrabT9oqCVD+K7yfXMhsBQ54cNU0YdV/H9BtDCJqkUtxIQyEyMZVIyNFDNhWyEzPELoxZ8Zq7K4Gs72bl1i2wI5w8h/qgRo4h3HLXJGSrfl4x+DrzgiKbIoDTwP+Szg5aHut3Z7R9JLSMN3TCrEIfCjN0rDdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqdDz20LA5Vo1wghUfJ8+siLsyDgUfosHmZrfvEvnHU=;
 b=G7I2hvjMGL9JDpdtDsV2cE/PyJ49lDBSCqcs4wWHK7KQ/+vCIc1c4ExZ/TP0TxVymkySSsy3L42eK05doJ1CM+RyDAGgOfrulGeOV/J1JKBZLp7YN4ST1swBn0Gt+Hgoa6dbYlH7zuusOu7S2gQonBm/s//wUSWlu1+/mKL66LSnIiQLUuEYfwsBUy2rAnq8lzdvnqBIrpHKUBKvxuO6bGgFtB/R3jFe2C+9vDWquPl8PQtzomeiGZlHL4vzsycr854RQPPUvArM0HaldiS+dGhNIvn0gKskmWJRvIfLS7iead053HpEZTC09QsRUvz2iNhItNLRagYXjLW7luS4JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqdDz20LA5Vo1wghUfJ8+siLsyDgUfosHmZrfvEvnHU=;
 b=abk5V33+96UEdf/MJ6jnVvDNMKGbKtce0hkUy6VO5A8m+0Os3trZIH0ECGnx4y1JY4Wvvre+Nm3AXPycr7HCrsjCU7NWYeWJkb/zZfESB2n5AO9Gh7huLpu+Pf4YO5n/G1bvoBoGkN5SCCSCEO1DyYxANo9paKRXeYC/2sPFEX4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4183.namprd12.prod.outlook.com (2603:10b6:610:7a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.24; Fri, 27 Oct
 2023 07:44:18 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::af19:f731:8846:68ba]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::af19:f731:8846:68ba%6]) with mapi id 15.20.6907.032; Fri, 27 Oct 2023
 07:44:18 +0000
Content-Type: multipart/alternative;
 boundary="------------dMnlhcUZQ6ouYZQNeoYlc0nF"
Message-ID: <98988459-25a8-4ee0-89d4-cb816cbc5bef@amd.com>
Date: Fri, 27 Oct 2023 09:44:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow
 control
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20231026161431.5934-1-dakr@redhat.com>
 <0bc79ae3-04fe-4e85-9fd0-e8b281148390@amd.com>
 <20231027093238.2ff8172e@collabora.com>
 <ff389793-1226-49fd-b599-07dbda0b97be@amd.com>
 <20231027093943.3f0ae992@collabora.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231027093943.3f0ae992@collabora.com>
X-ClientProxiedBy: FR2P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH2PR12MB4183:EE_
X-MS-Office365-Filtering-Correlation-Id: 797d155b-cb13-4fba-7c0b-08dbd6c0866a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bw7uKT//MDReOtfdz1yj8jI6YIDpGlxi2p+EbszNd+J+Y3qx/yZ1JzoinUviQEAxAjNxPSnl47VUFyiHHDbQSQSB3JbMuzDEztXCKfp2yDENEsVWYeMXow51BLw7MB1XrinX5+m+jqPfXXtM47b6vATk3Rz+ehh8xlxs341H7/DEwCaPF4G4XD0/TqJdQQilghBEjeCJH+t7lN/GAmKbcYqkQdoiNRMamxSnQ6MUCcAx+aB1cNXObA3qQIk3eytvUhR9nhXf/MItfv6ER9RatNbaUkovemkZTEiiotZfqlglp/DFayOD87CeqcgLPypCKLtNOiX32jiTm/guUsbL6biTMPTMfoed6a3W57TxREq4PS8w3hYRl02WAiFJXQR3pU8EOG7LfbH0ST5nEEsjleivqIQUoknqlX1gNXqPEdQLUJ/LazgF4PnDK6Agj6l/cqUL69ttspFhl27Z2k9OwF7mrXgINYlJm+NASoXU+OAEEdcZtHNAEAPY+i2bPVHe15G63pWjKlIwWoVStKoL7pHPWyU4NZJfAmY9kKllQfCM0kQ4RMAN0r51VXaLq7qABrwrd+kTaPOB59nl6IMHdRMHCxfYsYj9AOyvuRlu8XvONiMqZJwzgTt9n/u7kRcVcLNl/lKcZud0OscsAVC/4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(346002)(376002)(366004)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(66574015)(6486002)(83380400001)(26005)(478600001)(6506007)(6666004)(33964004)(2616005)(6512007)(66556008)(66946007)(66476007)(6916009)(316002)(38100700002)(31686004)(86362001)(41300700001)(31696002)(5660300002)(36756003)(8676002)(8936002)(4326008)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnNCeWN2MTVrQjF2ZS9WeG9BMExUTDlyckxwZ3YxSnBaWHo0UWl5KzJzbmli?=
 =?utf-8?B?eU8vUDhIL1pCTmtWZnVobVBJM3U1dDZtdFhVdjZwczdZaXk0RitzU29ZdVdI?=
 =?utf-8?B?UzY1RE9TT1RhRzdZN1dQVDhYcHphNytCK2NKS2plaEMzOVF5SnMwTVRrZHNi?=
 =?utf-8?B?YkZJTnFma2JSeFlWaGU0SGJUSlhFajdjc0RRZ01oQmNUeEpQUWJZS1lEMkQr?=
 =?utf-8?B?bFRUVTlhcHZFZkdxWWZISFpJcVZKMnFZdGlPM3pqL0grSXdjcXJqYk11NU43?=
 =?utf-8?B?WWlTYWRSVmFSQlk4VzVCS0FkZ3FJdlBXNjlUWS90Z01tZERFNi95eDVRSGNM?=
 =?utf-8?B?NkI1cVM5REEwaVVudUg1U0dHdWJVS01vWnMwSmdQcnZpazRRNHR5TjVFc3VO?=
 =?utf-8?B?aUwycGZETzN3QnR5UVhaQnl2QVVYanRlSW55QVhiU0VpZVlYZGR1aDJLVEQy?=
 =?utf-8?B?bno5SnU4QVJwUzFFazQ5SjVKZlZHczFBbUorOFFtblBPbjhTZG1MU09TNXIv?=
 =?utf-8?B?VW5xM2tIblhtbnJoanMxYjJBNW9nN2RwdVV1YTlVL1FlNnlvbG1YUWR6RTRG?=
 =?utf-8?B?TFRDWXN6ajYrVmZ3bEsyZC9MSEZuVWJqUkMrWURFZ0x4V1A1K1lXQlJ6YUht?=
 =?utf-8?B?Z2UwdUF5cGFMckZVSFBxWXl0MEdjdjJvWkpOOW1MdisvUWV2VVJlTVRXMW5i?=
 =?utf-8?B?bVRmWmQ5ZVVoWER6T2FUOTNjTUhlMThjb1VqUWQyQml1NWxkWEFUUUFtTGV2?=
 =?utf-8?B?MExrdUxHcFdtRHRDak4yYzhiaTVwRDRTRjI2UnRJUkZqNUdkMXgwbVFvVEUz?=
 =?utf-8?B?U1RzUjVOYm5kMDFTMGxzdnZzUzd6RG1lZk1tMEFrUkhYcjhNaGxRcDNpRmk2?=
 =?utf-8?B?TTJoOENvY2tqYVBxWitlWWRtTTN4OGNxNG5vZzVCYklQZFJsOXBIWEI5azZo?=
 =?utf-8?B?aGYzRWdqTHQyTTE5OFd4aURUTHVCYkgrOG1RWWRoM21yTU8yYjk3Vm5nR0hr?=
 =?utf-8?B?QVRGbXh3QXhXZHE5SWw0RWVxTkx6K0g0b1ozNXRPbDdjQkVWWXF2WHJmaThV?=
 =?utf-8?B?RlhmUjM1RjZhUEhObjZaOTVZZTVqNElldUFCVnVyTFdKVDdUL3RqbG5IdGxw?=
 =?utf-8?B?NkpOcGxSV3djY0tjN3RaTFphcFBIWnh6MHVRL3FqR0IrdVZvS09ITThpQ3dC?=
 =?utf-8?B?UGNlSVliZXlZTk1zcndUUUlxcjJaQzJNYW5aQ0U4NWI4emlWOUlKSTRDbW5S?=
 =?utf-8?B?aFI5SkhEWlRVMENvQ0dVVVNxRHU4cENmQTAxZm55N093Wm5obmdsWnJLbUc2?=
 =?utf-8?B?Nks2dXVrRHVaSENXb2d2ZEx5eFI1UUFOc3g0U1pNQXVMdGxENXZzRmVoSS83?=
 =?utf-8?B?M1VIUzNQOXJUVFVzRzdmaWNiT0RWS3U5WWMxc1VsTVhKRmNqb3A5MU91R3ZN?=
 =?utf-8?B?cDNycUp2cng3Tmd3S0lUVnhKQ2VOenRrb081d0lyNHo0cG90ZUNLNVc4emtm?=
 =?utf-8?B?ZjhaQ1NUNG4xclo0aWNyU0xrOTBGNllHY0xocm4wRXFmbXFHVnJJUEFhUlN5?=
 =?utf-8?B?U3dqZWVLY0VxV3kxWXF1c0w0R3NXRlFxaGdRQnpkdjFLaWU4T2lUbWJSTG14?=
 =?utf-8?B?ZzQvdHlHOTE0QXdyNTcySnJsSlVOellsSVA5VWJLQ0NqcDh5eE9UT0FpdkpF?=
 =?utf-8?B?MllQQXlHUng5aE5GNTU4NU9FbE53bCtBQ2x4ZFIvVUJCSGF6V3c2YWxwSTF6?=
 =?utf-8?B?RHltRmNtYzBlN01XUko3cEV0ZjRWaWpmMElyR21vTTdwT1RjdWs5aytORnhE?=
 =?utf-8?B?Qlh1bzZuQlRNdXZXYzhNTjhUR3Q5aUl4bUphd3BTL0lKT29LU0V1SmltUWhv?=
 =?utf-8?B?VjdSdEs3Qk4rUk9PTmhyL3pzT0ZNZFkzS0p3ZEJhUlh6Y3RRU2s0Yjl1Z1dz?=
 =?utf-8?B?dDU4aGQ3REF3bTlIRTd3TXhtUVR0OTdEaHlKN2ZQeURmQ3M4OG9YdVpVQU1I?=
 =?utf-8?B?ZzRkMmgraU1VbVRvdCtSWWptcjdFeDUvbjZUa3NUQk5XNFVZdEtCYUh1N0xS?=
 =?utf-8?B?ZWkwYzB1M3ZjbnFGY0xKc1BpMERCWDlKczhhZHRzeXV3MHJrUitEYThaL013?=
 =?utf-8?Q?3uxop0drS4bluiBJldzJdPr25?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 797d155b-cb13-4fba-7c0b-08dbd6c0866a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 07:44:18.2210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2gyL6rbTjxJ+Z1XQc7SYKpQyeRRuac4SaagyGcRnqN8UpJDglkKnLb4axY+U+0HT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4183
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
Cc: matthew.brost@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net, luben.tuikov@amd.com,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------dMnlhcUZQ6ouYZQNeoYlc0nF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 27.10.23 um 09:39 schrieb Boris Brezillon:
> On Fri, 27 Oct 2023 09:35:01 +0200
> Christian König<christian.koenig@amd.com>  wrote:
>
>> Am 27.10.23 um 09:32 schrieb Boris Brezillon:
>>> On Fri, 27 Oct 2023 09:22:12 +0200
>>> Christian König<christian.koenig@amd.com>  wrote:
>>>   
>>>>> +
>>>>> +	/**
>>>>> +	 * @update_job_credits: Called once the scheduler is considering this
>>>>> +	 * job for execution.
>>>>> +	 *
>>>>> +	 * Drivers may use this to update the job's submission credits, which is
>>>>> +	 * useful to e.g. deduct the number of native fences which have been
>>>>> +	 * signaled meanwhile.
>>>>> +	 *
>>>>> +	 * The callback must either return the new number of submission credits
>>>>> +	 * for the given job, or zero if no update is required.
>>>>> +	 *
>>>>> +	 * This callback is optional.
>>>>> +	 */
>>>>> +	u32 (*update_job_credits)(struct drm_sched_job *sched_job);
>>>> Why do we need an extra callback for this?
>>>>
>>>> Just document that prepare_job() is allowed to reduce the number of
>>>> credits the job might need.
>>> ->prepare_job() is called only once if the returned fence is NULL, but
>>> we need this credit-update to happen every time a job is considered for
>>> execution by the scheduler.
>> But the job is only considered for execution once. How do you see that
>> this is called multiple times?
> Nope, it's not. If drm_sched_can_queue() returns false, the scheduler
> will go look for another entity that has a job ready for execution, and
> get back to this entity later, and test drm_sched_can_queue() again.
> Basically, any time drm_sched_can_queue() is called, the job credits
> update should happen, so we have an accurate view of how many credits
> this job needs.

Well, that is the handling which I already rejected because it creates 
unfairness between processes. When you consider the credits needed 
*before* scheduling jobs with a lower credit count are always preferred 
over jobs with a higher credit count.
What you can do is to look at the credits of a job *after* it was picked 
up for scheduling so that you can scheduler more jobs.

Regards,
Christian.
--------------dMnlhcUZQ6ouYZQNeoYlc0nF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 27.10.23 um 09:39 schrieb Boris Brezillon:<br>
    <blockquote type="cite" cite="mid:20231027093943.3f0ae992@collabora.com">
      <pre class="moz-quote-pre" wrap="">On Fri, 27 Oct 2023 09:35:01 +0200
Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 27.10.23 um 09:32 schrieb Boris Brezillon:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Fri, 27 Oct 2023 09:22:12 +0200
Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a> wrote:
 
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">+
+	/**
+	 * @update_job_credits: Called once the scheduler is considering this
+	 * job for execution.
+	 *
+	 * Drivers may use this to update the job's submission credits, which is
+	 * useful to e.g. deduct the number of native fences which have been
+	 * signaled meanwhile.
+	 *
+	 * The callback must either return the new number of submission credits
+	 * for the given job, or zero if no update is required.
+	 *
+	 * This callback is optional.
+	 */
+	u32 (*update_job_credits)(struct drm_sched_job *sched_job);  
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Why do we need an extra callback for this?

Just document that prepare_job() is allowed to reduce the number of
credits the job might need.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">-&gt;prepare_job() is called only once if the returned fence is NULL, but  
we need this credit-update to happen every time a job is considered for
execution by the scheduler.  
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
But the job is only considered for execution once. How do you see that 
this is called multiple times?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Nope, it's not. If drm_sched_can_queue() returns false, the scheduler
will go look for another entity that has a job ready for execution, and
get back to this entity later, and test drm_sched_can_queue() again.
Basically, any time drm_sched_can_queue() is called, the job credits
update should happen, so we have an accurate view of how many credits
this job needs.</pre>
    </blockquote>
    <br>
    <span style="white-space: pre-wrap">Well, that is the handling which I already rejected because it creates unfairness between processes.

When you consider the credits needed *before* scheduling jobs with a lower credit count are always preferred over jobs with a higher credit count.

</span><br>
    What you can do is to look at the credits of a job *after* it was
    picked up for scheduling so that you can scheduler more jobs.<br>
    <br>
    Regards,<br>
    Christian.<br>
  </body>
</html>

--------------dMnlhcUZQ6ouYZQNeoYlc0nF--
