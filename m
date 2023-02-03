Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5102A68994E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 14:00:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5685110E78B;
	Fri,  3 Feb 2023 13:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5D110E78B;
 Fri,  3 Feb 2023 13:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675429232; x=1706965232;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NM3YIjlmoUCrdjVrgN0Umr/GCUpngKm9algGY/wDABQ=;
 b=aWO0nJWGz1t7Qig6ok/qnJARgekWoKWtP1bVmVLHsz3MgBPrkRVHeW0F
 +pTT09WrUTsqRjVFsZcA3WnMU7n5qwXDyC37p7RacvKna3NV33m1vm0QB
 fLGp2sZHWOmHlSAK9yIMZD/6xgKMVR9TNDQDO7/biJGGJRTSF3V5D9dkS
 z+7mGoPFl2j7u24YYW+Lzpecz8zp3971U3G05dVPSTt5cFe8FnV8bbkFX
 X42UBgZtnAa6Z1e88/XzclscClFhmaYYkW6EHAeTtRrPU0tb6U/rg/2JP
 44MOZOt9AnZV8egSAf4CvCiF5BJFyiLEaGM2aXHyvmOqvywPtJnV75Xnp A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="330873222"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="330873222"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 05:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="911143783"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="911143783"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 03 Feb 2023 05:00:31 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 05:00:30 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 05:00:30 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 05:00:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHGxsGKfXADoXsGpuu4FD/bZaHggGJuBguYZw8TN2m8y/BRh8lBuOnaEtBUid6bwLQAbyUGm8Xkh8LZ5FSZleOHecyoSeUxSfUB9vPFz3Av7TeRTuVkbQtVgmNGraQdWnPbXjTKnO4SmlCpYR2j8vMkpNieL1oid4fDe0aJNZkbUGnKxHFpz68i5QfrkkOBJInbeouLFB2QS3ca/jpdI90QCUNnjmqOs1Na63qYZpbrdEdFZD+ImlyU9cYtsZ8CxJfh4SqeNZoOXihoEYFyXBxX+6XBhKFOfRptiyMP7IOAov/N8U/BRqiC32wun1OsYZTY6o/ciaS5gkrhA2QJsDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGrkdDEN67DU1jterCXFsSsJqxv5XmfnGCzzvSdUM4s=;
 b=gh6MSoA98N+50uL8gnopUrtiQQMW/0is6JWs64tzGjl9i+BTMNO6y4/wsmwWwW/0MsQxdPPbLKgDCAxMJDQaRTZOnJp/1ag6pHTh+KcOEgJ1TMS4fhmLLCLXuc6KlLgh2M0p5qPArCbZxj9VDoTb5VTiMP3/IeQAl/TruQNpM/th56f4nGZsYwog6Kct13CA0w1J7Jd4wLWI6BPjr/xaf6kF3DX1YmPjBOFAGREjo48uzEXHUwohmgYVpGb9smbFElyFOXiofEmsPLbnYhpz/7s5WPZYPm5AQMaJfjpcM5bNr2USmW5yMi+XopKTNavihDz3zVRLABSYkokMB0ybYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by SA0PR11MB4592.namprd11.prod.outlook.com (2603:10b6:806:98::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Fri, 3 Feb
 2023 13:00:28 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::b4c4:d01f:9658:5371]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::b4c4:d01f:9658:5371%9]) with mapi id 15.20.6064.024; Fri, 3 Feb 2023
 13:00:28 +0000
Message-ID: <4802ea2f-f9cb-1601-abf9-a8ee1055fbac@intel.com>
Date: Fri, 3 Feb 2023 18:30:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH] Initialize the obj flags for shmem objects
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230203115713.4023991-1-aravind.iddamsetty@intel.com>
 <30fec9fc-8d67-519e-b2e8-25af7187b3df@linux.intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <30fec9fc-8d67-519e-b2e8-25af7187b3df@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGBP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::30)
 To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|SA0PR11MB4592:EE_
X-MS-Office365-Filtering-Correlation-Id: bd4a864b-255c-4738-0591-08db05e69f81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9367odYDYcblKdGo+YNUgaO9DTm8xNKGnfOX1zGrcDm1MG7wiNcpZ0DbRTmJ7vG2s4wXXd/XYk4gTc8FZmPLXbGBH/D+t19xugTPQ9bxRMs9582sMLvP/4/aKQ8GblfZHk11uNiL9rnq5O9NuLLN51DAC8YxxNKLE/0HCUdqSfHFUZ6PCVcSUC9YLiel6DquL2vvQ4C3BBRL9zQ82HZbNVW+98mj260uXvTygyUMCPYl9WYHmVnHcaWIyEUx5sMsIkrF++goc5ixOphYC8Mn8VMxqji+zg0wA7bTXqLW8hvJkDRFdKHbceEP27XTe9GAAJNR1dT2Zp55I2Oj3ozmSsKial+wFUDThUidOsbMYOUzp5fl2t2mKMVxbQB2qWCCX/n7O8WSzj7QEKOIAGf3EAwFDkAUUAtWD0Qdi2LP3k+alH05I3yGF5PGD/BqwzW67sukSaATrHmqAfAszNSynMSvbTOMurjrnEWA+HLlk3psTQUYPixeom02u9LpTb7f0ENW+NClmOvAEtvRkQRUZXIXkyq/vXuAfzQpsKxk6X3RdqKUY1LxjTSoPuYR29m9A14apBkTIwb8fJKXeXO+uZ23v1Kf3H6E4xSzks89QsP0kaDkZVZ0nXAKksB5vbSKy3aRkMTQIaHeICWPklOjybXe+PoH20uovGpbpe+UyAXMgqkkLw4jCChM73TN7JyqUlyZkp3HplGDdQcrZlI6I2xebAVS3eJyxoJMUz+5etY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199018)(2906002)(36756003)(6666004)(478600001)(2616005)(66946007)(186003)(6506007)(26005)(6512007)(83380400001)(53546011)(8676002)(66476007)(66556008)(4326008)(316002)(31696002)(86362001)(8936002)(5660300002)(41300700001)(82960400001)(38100700002)(6486002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NytreDdMRS9YZEVQV242OGgvQUQyK0hIRnBIdG9GOVQrZnJMeEV1UnlnazRu?=
 =?utf-8?B?S2V4WXJZcmFlWkVyTGRHRHdwZ282Z09oM3NSZEtURTR2NUhqQldML21WbS9i?=
 =?utf-8?B?S09UQ1JFVEY3UERLdnUrMkNtVFJuYWU3UGIzQ0hjNzFnTFQ0YThpR0FCeGFP?=
 =?utf-8?B?RlAxbDNScEtjT3NCRE0yODdiS2dIVjFXSW9BK0dUaDh2bkg1amFGenRlN1Jq?=
 =?utf-8?B?TXBYSXhnTWM4QTIrWWk1QVh0TGtDTG1PaUFUbHh6cVR1QVJiMGVxVjRQcTJz?=
 =?utf-8?B?VTE0b0F5OC9PaTVxZVBnbUZDRjNST09GRVgyenE2YmVUSSthaHB1UnorWDJq?=
 =?utf-8?B?eVF0YkZmelY1R2d6K3prOXQ5V0l2WmpEcWtWNUhQYXRKYUpYSStjaElKbDAv?=
 =?utf-8?B?eDVBVDdVSGdYclV1cUVxdjlrRCs5cmQvVVluQmlXMmNBSVl1ak1HNWNKeW12?=
 =?utf-8?B?MVZERms3NmNlWTIzK1NVc2kwaGJ5aENEZ000ZWtrQmFPK2Z5QzhTRER6MXps?=
 =?utf-8?B?TVNrQURoZzA5M1daSndONkZSVE5aSGw3OXBNOEs4T0ZuTXBiK3cyRWJNZ0Fa?=
 =?utf-8?B?MnJIc2YwckZzc2VRVlYrcTYycHhnN2RzNHg0WXAwalB5ZGoyUVZRb21xYTZi?=
 =?utf-8?B?K3BSN241SUQ3U00zdjIvZmlzUUdpY3JYOGwyTUNmaGVjTlhGTTdtVGsvMjZ5?=
 =?utf-8?B?UFh4M2pZbzlxOEp3bUlYYU5jZkxraVNCalRRYTJ2Yng3dEpPeG1Wb1lTQStu?=
 =?utf-8?B?MHoyaHlnTlNWRXNqSDYrTVdHT1RXbzBPbDl6QlF6OE1Ga0tHbjZFUHdobDZL?=
 =?utf-8?B?RUZTemI2bnVPbVIwQi9sYkRFaWUxKzNLRk0zUkJFL0c4OG5nbHpiMzZSNWJH?=
 =?utf-8?B?VG1Wd3dwMlV6eDBIZzNnUWNPMlNIa2dMcWFjTCtvQy9FcnRNWkhwbnJQbUFL?=
 =?utf-8?B?TDFnWFEwamFVSVJmQ05RQURaRDFkcmZWcjAvRnh5L1VQN0k0andmdDh4TVNZ?=
 =?utf-8?B?aC8rRVQ0SCt6bzZwUTIwaGhtdXZBYjA0blB0SXNHQXc2MS9wckVBUXIxL2Vm?=
 =?utf-8?B?NzBYNjV3RjYvMGJsNGJBQmFWcGVpZUNwVWJ3WThTTHVDdHMyWG1mZDZYQzEv?=
 =?utf-8?B?eURWenVvTEZtM0g0Um5JSGZqOEpBdUR0WE9LVHUybjZGa0NOTUZMUnVwS1BC?=
 =?utf-8?B?WStRMkJtU0orYmwxZGtMdmFMSVV3V0ZoMEY3cGpuQXk4a2toRy9Mb0RFT2l2?=
 =?utf-8?B?aVlVaTdQbHpFQnB2cnV1bjAweFhlNFFLZ1c2WUpLMkxwTzhiTnNJZ0k3NHhU?=
 =?utf-8?B?bW5KNnN5N3B3Sno3SkdOM1FGQjJTTVM4amluc0EybGFvQ0ZrK0Z0WEF4eUpK?=
 =?utf-8?B?N25ZKzkzUHdka2MyNU9hbXVpRVlra2Mrdk5oeHJWTS9yY0VOeUk4Vy9BNWUz?=
 =?utf-8?B?cFV1c0NwRlhuTXhmeVpzc0hCL1NDd3V1NVVVTzlDd2IveHdzTlQ2aWFtaXc1?=
 =?utf-8?B?M3dLMjVacWRmb2hicVE5SlpmdkFHdlRZYlRjTGdIaUpsdFVLQkJhZ0phcDNX?=
 =?utf-8?B?cGp4MHhBcFFPTmI5bXVQM04wdjkya0wvWk9SdUxKdXEvOHVMQWF4MlVlVDRx?=
 =?utf-8?B?Mm9zNnRMQ1U1MlFmYS9DR3hNMUZGUzFrYUxQdDVLaFJucDZnUGdURnFtRUt0?=
 =?utf-8?B?azRWTy9BeVAvYk43Q1VabGxnZjFzMzIxa3Zhc0tpdHlMQkVlV1Z5TnFmZ240?=
 =?utf-8?B?UVZSV25wTk1iZnhSWlRLODJ6dVl4MndGNWkwUXh1RzYxZ2g0aUJnNUladDFL?=
 =?utf-8?B?c0tCa0xLc3daTG9TcFZ4Zk5Ob3hwYnBQeDMwakpsQStBTFc0elJKN3RGZEpa?=
 =?utf-8?B?VVQ1cGNxYzBEbXBBenFvVHN4aUI5RHdaR2pUbkhDYk44a0lzbzVzZHUyUFFK?=
 =?utf-8?B?NkwrNitNUFcvN0E1WHhyUElxdk1ybmdVTXJNQkJoRDV4MFdYanRNN1NhY0hu?=
 =?utf-8?B?OU1WZWtXOVVudXlldWhJS042dGNoL1ZDN2lMV1hHMlRqQ0JBVkpGRU96KzVG?=
 =?utf-8?B?VTdoaU5XbXoydk1UMWZUeVlIeVViTWZ2UnNUcy83NXBxMkw1cnBEanYvcm94?=
 =?utf-8?B?MmlDTXZZR1oyMjhLOWE1RzJ6cHRUektSc1lTQXludW1VRmI0QnR5U3d6S3Rj?=
 =?utf-8?Q?ErcVZC7pGICVazEkUR8qgjo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4a864b-255c-4738-0591-08db05e69f81
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 13:00:28.3300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P3yD85HPf1o4v6x2aE+by5H3XYYN6c9yW3jHFNe997ulMUVXDfdRTjtZs1fNJtBWvyuTS5EcJCd69VXqjFunQqTCMfXL+Dl5Xco8QElV1LA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4592
X-OriginatorOrg: intel.com
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
Cc: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 03-02-2023 17:40, Tvrtko Ursulin wrote:
> 
> 
> On 03/02/2023 11:57, Aravind Iddamsetty wrote:
>> Obj flags for shmem objects is not being set correctly.
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> 
> Could even be:
> 
> Fixes: 13d29c823738 ("drm/i915/ehl: unconditionally flush the pages on
> acquire")
> Cc: <stable@vger.kernel.org> # v5.15+
> 
> ?
Thanks for the review, will resend with this.

Aravind.
> 
> Regards,
> 
> Tvrtko
> 
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> index 114443096841..37d1efcd3ca6 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> @@ -596,7 +596,7 @@ static int shmem_object_init(struct
>> intel_memory_region *mem,
>>       mapping_set_gfp_mask(mapping, mask);
>>       GEM_BUG_ON(!(mapping_gfp_mask(mapping) & __GFP_RECLAIM));
>>   -    i915_gem_object_init(obj, &i915_gem_shmem_ops, &lock_class, 0);
>> +    i915_gem_object_init(obj, &i915_gem_shmem_ops, &lock_class, flags);
>>       obj->mem_flags |= I915_BO_FLAG_STRUCT_PAGE;
>>       obj->write_domain = I915_GEM_DOMAIN_CPU;
>>       obj->read_domains = I915_GEM_DOMAIN_CPU;
