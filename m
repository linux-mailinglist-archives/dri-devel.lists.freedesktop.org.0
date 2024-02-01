Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 582C1845848
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 13:57:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0088D10EB48;
	Thu,  1 Feb 2024 12:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TttJLign";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2066.outbound.protection.outlook.com [40.107.95.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38A910EB48;
 Thu,  1 Feb 2024 12:56:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BnpY7wbplfV6gP6z7HhTxa4oIBSFYV5JfYy1NIyuLUptZoXrpKGOC6HJJoUgvBP43YJxd/Dfj6cYYJnD0Jc1CLkSuYCujKCUYK9TbLRZFpHdxBVNAZUx8aXwwvQOlNMbqh2NLR82WdKnt6TqJ6trorYFEppb3RqrbzjQa9Mn47lGJ4X/fE/kYKc43dsNgFara4RRSUqhQEr3mwtCzzG3t4xbSTPVQKK+VZYFD31huTvdiuw2ZqzvPWJMGwvwLDsA5J4ehC2j4JtvUipy0xFs0IGjTFcaz3DNDOa+4oo/OTFGulnB4OnsgETropmmY2GNu++aDkSTJNdDQscS5t+MiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2PqbuvxLZVhCrrjblGQhlJoQzJIzi3+2stpEXTwwFc=;
 b=Q+J2hLK2KIaEIHYOd9TlUaWcHCU0ilVw5MNodbdEiXXYAr+/0GIkC2rP1D7PcWKSgKUheydrMLtJl7GWPWRbac0QbtWviuWPEshSIINg8BjUyNfTD7OUFDi2hSe4gzE5SakMA6HE7xorb1zBpjrpP9xRfD8ztP6vwnOPUAJpz9ImS/V7yjpOAd5KkwBlloDp4X/hDnzJSpVZLMqA/YPDxoQUNEWFjcmSJ8R9mEDf0V8+rCsPYSI/3OoU3UlL1UQpgWo1ZV2M7lZZ3+VOJEwQx4TfFxqPBtDOIFgTTv96tiC3pxq6RF7g96dKiWUIdFz58TKD5rT0hszWetfqZtaWGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2PqbuvxLZVhCrrjblGQhlJoQzJIzi3+2stpEXTwwFc=;
 b=TttJLign78yIc5ABl8HRjK3ckDI3Sj6MXBaHXhZtNj9X6LDE/3VpaeT5ovB1O/UvITZXvXwfrJb0TsMr+b3P7R+BltPXX+tJQdu6Tm8mYXplUfzuuAyAU59kGaNpRPBT5jjNtjVuM72AFcLdL6cf3bX4mED44tOTNqtZja72eNA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Thu, 1 Feb
 2024 12:56:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7270.009; Thu, 1 Feb 2024
 12:56:53 +0000
Message-ID: <9dac66fd-2d84-488e-93f5-3983cd13d0bd@amd.com>
Date: Thu, 1 Feb 2024 13:56:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Add Matthew Brost to maintainers
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Luben Tuikov <ltuikov89@gmail.com>, Dave Airlie <airlied@redhat.com>
References: <20240131030302.2088173-1-matthew.brost@intel.com>
 <Zbp_KUvsdcSMHsSE@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Zbp_KUvsdcSMHsSE@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB8796:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e53f9d9-99b5-4ac6-a72b-08dc23254394
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tSZ3bzOLx28YmhJ28wNlqpJ4ikqp3C6jFQdlbEDbEQo534a4/gD9c6UyR5l/O93fBWVGHlyaogLGhsFGQVUNRjM8X3RjTGkf/jTnrPd4tMPFTj7pKM/cCjmVEvuuU+mBr7xX2ygHWgNo8l9fIqL55+2as6/dJWK0mhx50K96+bX5WTm3pLLTH3meqF9xWL7fGA1+8lwKqxkVhI0dBTiGVCEAAJ+Qcb++weNSQyoBj6kzCjfq2lT0qv/co+79ZioGS9WKdL4aahwIDFgE6M+tXoT85QmcbNAPzkZ7gJC3dSl8q8xayJa49mADph61bun8S8j+kRokvQ8QIUA+zz1gkiCqc4LV4j6Zr8HX2R0ZUf7+GIn3lrZPw8/bh+vF5KZNJ1aAz9XzSycSaiEH8sPUakelKtrbMtYRG4sh0e0Ph/N3+xC9LCShuEIJrhjjrmYCdXS+/PQWPzRqsEsOml4qqDso3a1ToHhJDHtgE9MfyhwBaz9OnHcTW3ZwQ5A6WxaW2C0xIBAKr4qzuJV/NsxxvesKcb0WM4zYyXFgW4/PRQsAiareYN7ghPz519nFisIAxsGuzxOZCoHNjBtcIAv0g3CLYpmHwTPDYYPzcUJO6GIitURyZGEr6ug0MDz4xQxyjDu633m96DhA9PJO4+yJ8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(346002)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(41300700001)(31686004)(6506007)(2616005)(2906002)(26005)(110136005)(8936002)(6486002)(8676002)(66476007)(6666004)(66556008)(54906003)(66946007)(5660300002)(6512007)(4326008)(38100700002)(316002)(478600001)(36756003)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU55UnpkcVFxWGc1ZHVES1MyaklIdEc1QktHQlM1RjJNbnlPYVEwWjhRZEJV?=
 =?utf-8?B?N2xjdndKZzc3WTM5T1l0OEsrUGMyYTdhbXZaK3JLaEFjc0dPZjVnTmhYaGNi?=
 =?utf-8?B?c2d5ZVJaZjBqZnZlMEpIYnNReXR4U3lsZmQwVTRDOGFuNHZLRWl0NVhHcjln?=
 =?utf-8?B?bk9BdVFjMGhFT2tJVjV1YWpaRDBzRnVBMnh4anJ3UVkvZFZYaHowTnRwTHZK?=
 =?utf-8?B?K2pyWkJsUGc2Z3pNcnFhQm5QUjI1T3A2aFFmT3I2cjFoQnptNitpQXFCQTA2?=
 =?utf-8?B?UmhNOENBaXlJY0YzMXBlenI4eVFXMXViNUR4c1pkZmpSdlpmdUVPQ1dlaHVC?=
 =?utf-8?B?VlpnQkpLVmtzZXgrVW05ZWNiNXBrMEQydTNYakJWcUZhZUZoaTI3N2lnMHZE?=
 =?utf-8?B?WWlDU1E2L2RNNU5jQkVjKy9wWVIxTTdyZXRrKzc2aHN0NnpuQ2J2MDFIZDZP?=
 =?utf-8?B?T0JDU2gvb3AyL3pmcXEzWG16TU1KMXR2dFkvcEZ1YStrWUErMHJTZFJ5dG04?=
 =?utf-8?B?U2NtbDEvMXpqRms3c083TGExWXhtTVc4Q20rVFpnYzltS1FOemNOd0xwR1Nm?=
 =?utf-8?B?Uk1EOW1vN1BiWkpBckhQcTkyMmZoay9iVm9hSHFNOURwUW5LTHVqMXBnK0ZW?=
 =?utf-8?B?QWdYOEFONjA5dC9YR3lxSXJ2ZEtyalUwTTBtd2FzZ1BoMWdFaWw0UHZ2WDFT?=
 =?utf-8?B?bnZjOWdVUE9SMDZpUldpd1R6TnVIYXJ5YWtrYnorMXF5Q0pud3lOR3dwa0ZQ?=
 =?utf-8?B?UU5IUGZSQTZ4d1d6UGl2blZRaTRYeGUzUFBQOHNwbHZWeWo4UkdjVEhiNDBi?=
 =?utf-8?B?eXhuaVlnOEtlYW8wVXpWQ1NpaDFFZGZTc21PWkF6cmtYaVkrbndnZFV5TW5u?=
 =?utf-8?B?aHp2TjFMNWJNRkJ2TzY2QVN5dUdtdjhRWGNQTHo5L0xNclg4ZUpiVWVWN29u?=
 =?utf-8?B?WFhiTTJXVnVVOFhnY1ZXV2U5TmYyMGFHU1lPTUR0bThrZm9UUFYxeFRydlpR?=
 =?utf-8?B?N2ZFSThHeFdCUUFmSGVVek4rc2J3VGlVQSsyWlA1ODREb1djYVcwRG0zd2tn?=
 =?utf-8?B?RlRROXhVTmFvcFpqaXI1V3drbzJlQkRkUVpKUHdrVGFHRTkzVStZYmRaK2N4?=
 =?utf-8?B?QXJlaVdLSVNBUWk3dmFmb1RlcGUvT0tMSU9HWnRxb3lITklqc3djVDFUTk9l?=
 =?utf-8?B?U1NHUVdmS3V3U1ZOMXh4bVVYbUFtNEQxTGVIMkNUeW9PdysyaU5YcFoxYzZQ?=
 =?utf-8?B?aGZNOUFCZkp1S200NXR3MXNxNG5VOElSZE1DL1VvQmlkMFNDdFIxb3RHb1BJ?=
 =?utf-8?B?UmthdzBWM0JEeXQzbWIxR0tVaGpmWHNTQ3FTZjMxU05sMEZrbUVRTHV4bjdN?=
 =?utf-8?B?aXhZZkhSc1M2ay9UR3FxZGwvcVBVeDRGUWtBZ01wU1l3dlUxbGtaZ2tEcnc2?=
 =?utf-8?B?MlA4YnkxWThwU29ZOTNYU0RDUmFLTjZCZjFGY1pvdTZYUFhSVGh2dXhIb1pU?=
 =?utf-8?B?RHNTTmk0dlY1NHhUWUtVckRnMFVhMnNMVmprT2RyMkk2YnpxRUFGTXpueHhh?=
 =?utf-8?B?N2pWOWkwcVR2aWJxT2hxcFYzL2hwNjF2dDRaNWdKSTJpOVBaendwRHQrVjc1?=
 =?utf-8?B?eG9ROEJLaDRzV1M2VzlMd015TjIxYkZuN2hreU45dzV2YUduZVRjL1I5aTlT?=
 =?utf-8?B?YUV3MEVGOFZnelBKYWs5eVQxZm5HQ3V2L0p3T0F0Mlh5b0dWZ1lsci92U2ZS?=
 =?utf-8?B?NzJPcUlOcEdneERpOGE1VXloazdqOWROZEQzRW9ZUkM4RmlhZGNPa014TmFL?=
 =?utf-8?B?ZHdTMzYxNE41L05CTW50MThXZGh4WHVUd2RrMUgydWJJZElJY3dtMFlYNXZ4?=
 =?utf-8?B?KzQvem1ubFFYVlZIcWtXQlBDa0NlMUg1WHRxRFppbDZNYnNSMldzZW93em5l?=
 =?utf-8?B?Uk1idTIwN2huUWd6TUtJRjRnenM5VHFPVk9nQkMvV1Yvb2Uxbm1jQlN4V1JY?=
 =?utf-8?B?ZElYREZoMnR1TmRIWVp2OXAxN3Y0MmRMTTRKaUs2M29DUXpFdFJvSCszalhQ?=
 =?utf-8?B?K25RUmNzQmV4SVRwRXNLZnlOZlRhSkhuY08rK05SZFV3WU9LWXVoRkkycFlY?=
 =?utf-8?Q?8FwDojOpstFSguA9LxFDUGY3E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e53f9d9-99b5-4ac6-a72b-08dc23254394
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 12:56:53.7818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nK/taG7/6NBHM3Wm5mFZCs4QV5foZs9DFxxUMSg1mJ4hM7Rd9gWr6LA+bNM/5KH3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8796
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

Am 31.01.24 um 18:11 schrieb Daniel Vetter:
> On Tue, Jan 30, 2024 at 07:03:02PM -0800, Matthew Brost wrote:
>> Add Matthew Brost to DRM scheduler maintainers.
>>
>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Dave Airlie <airlied@redhat.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Definitely need more people taking care of drm/sched, so thanks for
> volunteering!
>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> I think this also needs an ack from Luben and Christian. And you also need
> drm-misc commit rights first, or it's going to be a bit tricky to take
> care of maintainer duties for merging patches. But since your sched
> patches now have landed in upstream this should be just a formality.

Ack from my side, I don't have time to look into scheduler stuff anyway.

Maybe I can get somebody from Leo's team to volunteer as another 
reviewer for scheduler related stuff.

Cheers,
Christian.

>
> Cheers, Sima
>
>> ---
>>   MAINTAINERS | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 5c00fad59e91..e968d68a96c8 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7308,6 +7308,7 @@ F:	drivers/gpu/drm/xlnx/
>>   
>>   DRM GPU SCHEDULER
>>   M:	Luben Tuikov <ltuikov89@gmail.com>
>> +M:	Matthew Brost <matthew.brost@intel.com>
>>   L:	dri-devel@lists.freedesktop.org
>>   S:	Maintained
>>   T:	git git://anongit.freedesktop.org/drm/drm-misc
>> -- 
>> 2.34.1
>>

