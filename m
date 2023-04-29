Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A388A6F21A0
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 02:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D953110EE17;
	Sat, 29 Apr 2023 00:31:02 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966D010E193;
 Sat, 29 Apr 2023 00:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682728256; x=1714264256;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CjUwiNB3fdtjN/5uwCe8fjEv/mhXQDBhG3vQ7VV4QQM=;
 b=hgDzkHtsXfSFTyGfI/Am/+4sQyNxRiKDAl5tODmKlIq/grpNbbjz/B1c
 lMatWIGEWYqm0DGH+q9WIJUY1841vdPK9rjfJ/kQQIDUbTPsqhi//3LhN
 zl8W0/okoKJ1bHbiUysc7kIvH/qi9TsXJMBQ5/EoecR7cPz+GYMXAjz8M
 Pbkw5J0QuRTMiu0Z6Y+fAcdR8GjPewwCccZwyPPC3wOcjx4LcLpJd6mJB
 Xr+ff/2BztOoA7qgQBEu+6lqfFU7m5NqAwhx61mzUyCEZhG7eNEzdOE9p
 eMDuFikzFKVnH/ZWGVfHk+dbMjC7bQMIKAp9V21leg/Hk6z7wPfhbBiqq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="375894578"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="375894578"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 17:30:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="819197812"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="819197812"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 28 Apr 2023 17:30:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 17:30:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 17:30:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 28 Apr 2023 17:30:54 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 28 Apr 2023 17:30:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWmLeYtxCYXcqUfqaOtYVs7tFVtKc+w1H9xmUpMWtaZRJUOF3/zxRxQ47wWGFMzfraR633hUWBON76RvqZikDU5ppPZnzvtuS88EzaMWcPjCc+2k0jcYsIx2hb0c3YVT5kyKsTpO+RSKX+0prHPcCT9LMQA/NVxdItBqBHYaMNXk78ewOl9yMpFgQ89yWaNUlghq/8zRrrWPPthqyzrgSNUknsqAMAzW49OPQyUH2eRDYUbuiASkr9idvZJYq6Q6YyjJUntk2PDUQUh0tDewVjEg64urHLBXK7M8IpZVbKRZDsW5360Hi1eCEeab649Zm7FPSTVw5BYxoz1UuuuQGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqQpRySmCPhivwBRE4DuVlzhOg6MG7b60B907QPWLXA=;
 b=WoZ11wfck4Z0gs1nMefLTJXG3yrSfoUjFcrVwKL78Iz9ajaXfG3dfaUZf42/wKoVAVOL4uH4fHwETTd6PeQAsLjq5k7U4hvo9wh2gw4NDYFkHKCOb6iznsx07Fd6sHGUNlST1/afBLLR8G50ipfgTkaGqTrZRwakqnjZhNZvNw2+9MAU6GIg6O9HPkukE2++Ed6Eao8c8978fJuimyDTNS82YeF0GYZa6+TPS4uSWKrBf+glipMAXUNPGglQPY0CxHpjv1wClOQIdfbDUTyeGBXcbSaRjRoRH/66ZiY7puQ2Bs0gFr1PkOiEEDUj6GcEhzdRiUuEMyl+oMBAPXsR/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB3908.namprd11.prod.outlook.com (2603:10b6:405:7d::13)
 by SA1PR11MB5897.namprd11.prod.outlook.com (2603:10b6:806:228::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24; Sat, 29 Apr
 2023 00:30:51 +0000
Received: from BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::7b09:91d7:6e26:5833]) by BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::7b09:91d7:6e26:5833%2]) with mapi id 15.20.6340.025; Sat, 29 Apr 2023
 00:30:51 +0000
Message-ID: <c60473ea-2131-7312-5942-890244c5c9d4@intel.com>
Date: Fri, 28 Apr 2023 17:30:47 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.1
Subject: Re: [PATCH 4/6] drm/i915/uc: Enhancements to firmware table validation
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230421011525.3282664-1-John.C.Harrison@Intel.com>
 <20230421011525.3282664-5-John.C.Harrison@Intel.com>
 <7716eaf2-41e8-9b28-3b87-70b5ff2962a3@intel.com>
 <8540acf3-82bc-629c-1bb2-24ee377e851d@intel.com>
 <579dc07f-70d5-c444-17eb-89a5d4a38261@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <579dc07f-70d5-c444-17eb-89a5d4a38261@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0093.namprd05.prod.outlook.com
 (2603:10b6:a03:334::8) To BN6PR11MB3908.namprd11.prod.outlook.com
 (2603:10b6:405:7d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB3908:EE_|SA1PR11MB5897:EE_
X-MS-Office365-Filtering-Correlation-Id: c501339d-c45f-4752-d434-08db4848fbe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zHdK6iIu6ilH8Va7WfelDgDygp/1AgNFbakVjWwnyexRd4M6TqQGgbowqxckOUjCQhEjvUaIwmui8SGVrOS88nE6Krgcq79VhXQag4GVe0WgprsSr1t8/uGB8H7z29p3r1BvYa6IRKw6YNdSgqV3MckDCulUpUD/1YW3HaeZkrNUI3NCsLdQsIAGcA/fNuQ4sNcLQizE6p1mbfXKV+28PPa4xAUo41efLVlb97jeO0C3zy0kWhWZi3FkvoMYYr+GA3B4lcq4L2wmJT4GtyvxfF8FGIm++ZfbGSmSajF9/bohkMszoy4+ABw3vkpUbO0T15N2A9udGx56QlGq9RP6+q1B98XGOvkmqO0sDbIJozWiLPpgASNqzOxhKe1AfuvTVi9rzG6D/t6zuDm5ldAOBAvhbZXvQkh81EC3n33qHnMfZRfI2h1Ermfimmpy7G5opRGOY79eLHmVm/rBligbAmDbFI2pG3JiLzgH2XNQqRNfs9ewtzVEkRvC9WmttL0bJ7DCSpxaS0Xahu2xTRS2BLhM8estNeXjL5cS1RuhWL5RS5fvPGznCbQM7kjHe0hoKqeC6ZO7yk2KJeYzTw/BzsR/9aYVQMqTy3Ck8ReN3tmoTaYCMlR4UO6vyyBJdrdPvqM5K6M9oNa/JhNJ4yUYVH8sJoUEhPDhNI0yqW0ybJ+GCBjlrhUI0sIuTniI+yyN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB3908.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199021)(478600001)(6666004)(31686004)(6486002)(30864003)(66556008)(8936002)(8676002)(2906002)(66476007)(66946007)(450100002)(4326008)(5660300002)(6512007)(26005)(186003)(6506007)(53546011)(316002)(2616005)(41300700001)(36756003)(83380400001)(82960400001)(38100700002)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1UyNWxvYm4zek8wNTJyZ29zRmxDU0pLVS9Ialp2bjA2TEt4SXlSQkx0eUVQ?=
 =?utf-8?B?amU2RG0xcEZ0VE1SOTFNUlBXK0h2ZnhJaGdMSVE3WDlXS2M5UlRoZTIydDFH?=
 =?utf-8?B?VHd1OXpzb3pQTTFYU2x4QmRiTE9FVHppcERCeUw5REhqcGc4aEVWNzY1V3hN?=
 =?utf-8?B?enNVZk9RbHcrMWZNNHpvVWFOQ2hMeFd2WHc5V2kxWE5kT2h0RlVIdXVLekw5?=
 =?utf-8?B?SitWUFcwdk40NlQ1VzU4dXdWMGZyNllQUXFBbWxnTUhPM081TGN4c1JwRWxE?=
 =?utf-8?B?RGIzVGZ4V1RwVk9YRWx2NjdlVTkyQy9xWUp6bktFUjAvRlJ2VkVRNzY3czVo?=
 =?utf-8?B?NVVSeXp5UDMxYStWQitzVkVhZCtQVnJHN0dScWIwSEQ0WlBKdUk1N3dqWnlw?=
 =?utf-8?B?a3Z0T2Yxd3U4VGhJa2s0WnY0ZHc1NEZnMHdsSjdWWE1pZEZRdGUxSE9tV2dH?=
 =?utf-8?B?YTU1K0dWdk5XeFVwOXdzTmdScTRCLzFRS1I4d203UXZydW04bU5iSGFsWk8w?=
 =?utf-8?B?M0NFKzE5Rzk2TkdVU05JMktyMUQ0SUVLTWcwRERYdVo4QnhTblRYYUFuaFRo?=
 =?utf-8?B?RzliUnFLM0ordEdXbHdVaUEwRTNQV1BBM0ZPNFNyS21aZ2JCbzRNdlhXNUdO?=
 =?utf-8?B?UGtEUmhDNXQwSXFpZW5YQm1CVC91eW96K1NSS0cwdHJrTm5pSmtTU2ZvVmZ6?=
 =?utf-8?B?RVFRY3g4ZnhVQzF3V0prNnhROHBTSDBWdkhudXh4aytpYlJYWUc4aTh2bCtL?=
 =?utf-8?B?d1E5cFpLSFJwWmNWK2k4U2hidXBZdVNTVlhWSWhqZ2djNlV2MTdKL1Q0TERF?=
 =?utf-8?B?YkpZZFFFUFlIT3FTc2U4Yk94MnBkN3grdG1yZ2tsaUdHQ3RzY3NLbGYyYWdV?=
 =?utf-8?B?OS9TTTZOdnNUTmJtZFhGMW53cHhwRzNXSGZVNG5MU2NMTmNPVkNCczFhRDRn?=
 =?utf-8?B?QXBwMHFQcFYvcldRbncwUW5mYytSejdTK3FKOWRtalIwSHdJZjQyUmxZWS9R?=
 =?utf-8?B?NnpNTTRaTjB0bDI5eDRTWGlaYTd0L1F4OFFDQkNxZ3grRTVJQURhN1pjaWlG?=
 =?utf-8?B?ZzdUZ0dFTGliUGhPY3RhS3ZwY2s5TTZkNUV0MXJzV29xaTBrNmpTdEJHZWZa?=
 =?utf-8?B?UzJnbkpRODV0S25uWEZHcFpKejhxN1REaENPeGpESzNyK2UrSVBpQWd1UzNZ?=
 =?utf-8?B?QVBXMVo4dzY5NHU4aHU5blNMV2k4ZUQwdVdweXd1eElLcVdVemk2V0ptV2RC?=
 =?utf-8?B?MG5LNTQ5QjBML0tUK2FBc2tMM2FKckxuWVJoYU5MZWhNU2NDY0JxRHlJa3ZX?=
 =?utf-8?B?c1dBZG9KMWgxT0RLWkN5S09rUmM4WDhHZi9OTjRreHpwTUkvL0lLKy9Gbkdn?=
 =?utf-8?B?SHRUdTdRd0k2czU2dTR1eXdScU1vRit6VUViSmVSYWtsaFRoenFHN0t1K1FF?=
 =?utf-8?B?ZkdCUmNQcEh0UGFHWnNEaHFZc3l2YmgwckthSlVkUk1BN3FjWFhRVG9kYWZv?=
 =?utf-8?B?eDdHUXltQTNMbGw5b2FyaHlNd2NQQzcwek1wMllNT1B3N1BCM3FxalZpNFlO?=
 =?utf-8?B?cUl1QkVqUTJibEJIU1QzL2VMdEFQL2x1SHRQeXpMOWdLWnVPSktRMDk4MVhl?=
 =?utf-8?B?T001UzJXT09IcVBZTnIvdVB4b3ljMC9ldmhEZ1JoeUM3WUwzUHBKTllPUzdo?=
 =?utf-8?B?RWxzeTREbGhhR21kZG9kNDE5bGh2RkcvSXRIUncrSHdEUzYwZDVCb2J5TERl?=
 =?utf-8?B?cnlyd1ovVWNTUTFabTB0NGJ3a3gzMVVEc1BrSmtsOG5DaklZanZ0U3ljSkhQ?=
 =?utf-8?B?L0xjUnFPMit6TFBnQ2EwT1pGTW9YUlhjNkx3RXB0eVdxWmJrbUNnMXdNVGpj?=
 =?utf-8?B?ck5RQjF2SDF6bjhONnNEbllXeHZXb1Z0U0xJNjNHcUl4SE9sR3kxekFrblps?=
 =?utf-8?B?bEZjWDFqRE9tTC82bnJwZW5ZMzZvM1F4YUtvaVZWYzJXQTVIRDdqVitGdllQ?=
 =?utf-8?B?NisyaE16SllTMzVGZ0J5dUxCSzlHekVWRWpWbm9XSDI3SEdVU3JBaTBHdWQv?=
 =?utf-8?B?a0JaQVR2bGpjMERwMWxuaC9kN09rUytMRHp0ZFJrL0hWSUwrMW9OTlBtSVJG?=
 =?utf-8?B?MVRlclU2VVoxWkR4UEtiNDc0UHdpcnhtdGk1T20zVk1OMk1ucEJiVFptSXlJ?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c501339d-c45f-4752-d434-08db4848fbe8
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3908.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2023 00:30:50.7223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KeUvDCJJ6tAQvqD4bSm4sCykbRu1bm3Ho+t+jfwE2Cr44RhIPfIy/0QitBd+QcNeVgOkiuZEEWYMFJbKIajZqWRjVd8PXufOEgxcAkfh+tk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5897
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/28/2023 17:26, Ceraolo Spurio, Daniele wrote:
> On 4/28/2023 5:16 PM, John Harrison wrote:
>> On 4/28/2023 17:04, Ceraolo Spurio, Daniele wrote:
>>> On 4/20/2023 6:15 PM, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> The validation of the firmware table was being done inside the code
>>>> for scanning the table for the next available firmware blob. Which is
>>>> unnecessary. So pull it out into a separate function that is only
>>>> called once per blob type at init time.
>>>>
>>>> Also, drop the CONFIG_SELFTEST requirement and make errors terminal.
>>>> It was mentioned that potential issues with backports would not be
>>>> caught by regular pre-merge CI as that only occurs on tip not stable
>>>> branches. Making the validation unconditional and failing driver load
>>>> on detecting of a problem ensures that such backports will also be
>>>> validated correctly.
>>>>
>>>> v2: Change to unconditionally fail module load on a validation error
>>>> (review feedback/discussion with Daniele).
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 157 
>>>> +++++++++++++----------
>>>>   1 file changed, 92 insertions(+), 65 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>>> index c9cd9bb47577f..eb52e8db9ae0b 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>>> @@ -233,20 +233,22 @@ struct fw_blobs_by_type {
>>>>       u32 count;
>>>>   };
>>>>   +static const struct uc_fw_platform_requirement blobs_guc[] = {
>>>> +    INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, 
>>>> GUC_FW_BLOB_MMP)
>>>> +};
>>>> +
>>>> +static const struct uc_fw_platform_requirement blobs_huc[] = {
>>>> +    INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, 
>>>> HUC_FW_BLOB_MMP, HUC_FW_BLOB_GSC)
>>>> +};
>>>> +
>>>> +static const struct fw_blobs_by_type 
>>>> blobs_all[INTEL_UC_FW_NUM_TYPES] = {
>>>> +    [INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
>>>> +    [INTEL_UC_FW_TYPE_HUC] = { blobs_huc, ARRAY_SIZE(blobs_huc) },
>>>> +};
>>>> +
>>>>   static void
>>>>   __uc_fw_auto_select(struct drm_i915_private *i915, struct 
>>>> intel_uc_fw *uc_fw)
>>>>   {
>>>> -    static const struct uc_fw_platform_requirement blobs_guc[] = {
>>>> -        INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, 
>>>> GUC_FW_BLOB_MMP)
>>>> -    };
>>>> -    static const struct uc_fw_platform_requirement blobs_huc[] = {
>>>> -        INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, 
>>>> HUC_FW_BLOB_MMP, HUC_FW_BLOB_GSC)
>>>> -    };
>>>> -    static const struct fw_blobs_by_type 
>>>> blobs_all[INTEL_UC_FW_NUM_TYPES] = {
>>>> -        [INTEL_UC_FW_TYPE_GUC] = { blobs_guc, 
>>>> ARRAY_SIZE(blobs_guc) },
>>>> -        [INTEL_UC_FW_TYPE_HUC] = { blobs_huc, 
>>>> ARRAY_SIZE(blobs_huc) },
>>>> -    };
>>>> -    static bool verified[INTEL_UC_FW_NUM_TYPES];
>>>>       const struct uc_fw_platform_requirement *fw_blobs;
>>>>       enum intel_platform p = INTEL_INFO(i915)->platform;
>>>>       u32 fw_count;
>>>> @@ -286,6 +288,11 @@ __uc_fw_auto_select(struct drm_i915_private 
>>>> *i915, struct intel_uc_fw *uc_fw)
>>>>               continue;
>>>>             if (uc_fw->file_selected.path) {
>>>> +            /*
>>>> +             * Continuing an earlier search after a found blob 
>>>> failed to load.
>>>> +             * Once the previously chosen path has been found, 
>>>> clear it out
>>>> +             * and let the search continue from there.
>>>> +             */
>>>>               if (uc_fw->file_selected.path == blob->path)
>>>>                   uc_fw->file_selected.path = NULL;
>>>>   @@ -306,76 +313,91 @@ __uc_fw_auto_select(struct drm_i915_private 
>>>> *i915, struct intel_uc_fw *uc_fw)
>>>>           /* Failed to find a match for the last attempt?! */
>>>>           uc_fw->file_selected.path = NULL;
>>>>       }
>>>> +}
>>>>   -    /* make sure the list is ordered as expected */
>>>> -    if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST) && 
>>>> !verified[uc_fw->type]) {
>>>> -        verified[uc_fw->type] = true;
>>>> +static bool validate_fw_table_type(struct drm_i915_private *i915, 
>>>> enum intel_uc_fw_type type)
>>>> +{
>>>> +    const struct uc_fw_platform_requirement *fw_blobs;
>>>> +    u32 fw_count;
>>>> +    int i;
>>>>   -        for (i = 1; i < fw_count; i++) {
>>>> -            /* Next platform is good: */
>>>> -            if (fw_blobs[i].p < fw_blobs[i - 1].p)
>>>> -                continue;
>>>> +    if (type >= ARRAY_SIZE(blobs_all)) {
>>>> +        drm_err(&i915->drm, "No blob array for %s\n", 
>>>> intel_uc_fw_type_repr(type));
>>>> +        return false;
>>>> +    }
>>>>   -            /* Next platform revision is good: */
>>>> -            if (fw_blobs[i].p == fw_blobs[i - 1].p &&
>>>> -                fw_blobs[i].rev < fw_blobs[i - 1].rev)
>>>> -                continue;
>>>> +    fw_blobs = blobs_all[type].blobs;
>>>> +    fw_count = blobs_all[type].count;
>>>>   -            /* Platform/revision must be in order: */
>>>> -            if (fw_blobs[i].p != fw_blobs[i - 1].p ||
>>>> -                fw_blobs[i].rev != fw_blobs[i - 1].rev)
>>>> -                goto bad;
>>>> +    if (!fw_count)
>>>> +        return true;
>>>>   -            /* Next major version is good: */
>>>> -            if (fw_blobs[i].blob.major < fw_blobs[i - 1].blob.major)
>>>> -                continue;
>>>> +    /* make sure the list is ordered as expected */
>>>> +    for (i = 1; i < fw_count; i++) {
>>>> +        /* Next platform is good: */
>>>> +        if (fw_blobs[i].p < fw_blobs[i - 1].p)
>>>> +            continue;
>>>>   -            /* New must be before legacy: */
>>>> -            if (!fw_blobs[i].blob.legacy && fw_blobs[i - 
>>>> 1].blob.legacy)
>>>> -                goto bad;
>>>> +        /* Next platform revision is good: */
>>>> +        if (fw_blobs[i].p == fw_blobs[i - 1].p &&
>>>> +            fw_blobs[i].rev < fw_blobs[i - 1].rev)
>>>> +            continue;
>>>>   -            /* New to legacy also means 0.0 to X.Y (HuC), or X.0 
>>>> to X.Y (GuC) */
>>>> -            if (fw_blobs[i].blob.legacy && !fw_blobs[i - 
>>>> 1].blob.legacy) {
>>>> -                if (!fw_blobs[i - 1].blob.major)
>>>> -                    continue;
>>>> +        /* Platform/revision must be in order: */
>>>> +        if (fw_blobs[i].p != fw_blobs[i - 1].p ||
>>>> +            fw_blobs[i].rev != fw_blobs[i - 1].rev)
>>>> +            goto bad;
>>>>   -                if (fw_blobs[i].blob.major == fw_blobs[i - 
>>>> 1].blob.major)
>>>> -                    continue;
>>>> -            }
>>>> +        /* Next major version is good: */
>>>> +        if (fw_blobs[i].blob.major < fw_blobs[i - 1].blob.major)
>>>> +            continue;
>>>>   -            /* Major versions must be in order: */
>>>> -            if (fw_blobs[i].blob.major != fw_blobs[i - 1].blob.major)
>>>> -                goto bad;
>>>> +        /* New must be before legacy: */
>>>> +        if (!fw_blobs[i].blob.legacy && fw_blobs[i - 1].blob.legacy)
>>>> +            goto bad;
>>>>   -            /* Next minor version is good: */
>>>> -            if (fw_blobs[i].blob.minor < fw_blobs[i - 1].blob.minor)
>>>> +        /* New to legacy also means 0.0 to X.Y (HuC), or X.0 to 
>>>> X.Y (GuC) */
>>>> +        if (fw_blobs[i].blob.legacy && !fw_blobs[i - 
>>>> 1].blob.legacy) {
>>>> +            if (!fw_blobs[i - 1].blob.major)
>>>>                   continue;
>>>>   -            /* Minor versions must be in order: */
>>>> -            if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
>>>> -                goto bad;
>>>> -
>>>> -            /* Patch versions must be in order: */
>>>> -            if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
>>>> +            if (fw_blobs[i].blob.major == fw_blobs[i - 1].blob.major)
>>>>                   continue;
>>>> +        }
>>>> +
>>>> +        /* Major versions must be in order: */
>>>> +        if (fw_blobs[i].blob.major != fw_blobs[i - 1].blob.major)
>>>> +            goto bad;
>>>> +
>>>> +        /* Next minor version is good: */
>>>> +        if (fw_blobs[i].blob.minor < fw_blobs[i - 1].blob.minor)
>>>> +            continue;
>>>> +
>>>> +        /* Minor versions must be in order: */
>>>> +        if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
>>>> +            goto bad;
>>>> +
>>>> +        /* Patch versions must be in order: */
>>>> +        if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
>>>> +            continue;
>>>>     bad:
>>>> -            drm_err(&i915->drm, "Invalid %s blob order: %s r%u 
>>>> %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
>>>> -                intel_uc_fw_type_repr(uc_fw->type),
>>>> -                intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i 
>>>> - 1].rev,
>>>> -                fw_blobs[i - 1].blob.legacy ? "L" : "v",
>>>> -                fw_blobs[i - 1].blob.major,
>>>> -                fw_blobs[i - 1].blob.minor,
>>>> -                fw_blobs[i - 1].blob.patch,
>>>> -                intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
>>>> -                fw_blobs[i].blob.legacy ? "L" : "v",
>>>> -                fw_blobs[i].blob.major,
>>>> -                fw_blobs[i].blob.minor,
>>>> -                fw_blobs[i].blob.patch);
>>>> -
>>>> -            uc_fw->file_selected.path = NULL;
>>>> -        }
>>>> +        drm_err(&i915->drm, "Invalid %s blob order: %s r%u 
>>>> %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
>>>> +            intel_uc_fw_type_repr(type),
>>>> +            intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i - 
>>>> 1].rev,
>>>> +            fw_blobs[i - 1].blob.legacy ? "L" : "v",
>>>> +            fw_blobs[i - 1].blob.major,
>>>> +            fw_blobs[i - 1].blob.minor,
>>>> +            fw_blobs[i - 1].blob.patch,
>>>> +            intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
>>>> +            fw_blobs[i].blob.legacy ? "L" : "v",
>>>> +            fw_blobs[i].blob.major,
>>>> +            fw_blobs[i].blob.minor,
>>>> +            fw_blobs[i].blob.patch);
>>>> +        return false;
>>>>       }
>>>> +
>>>> +    return true;
>>>>   }
>>>>     static const char *__override_guc_firmware_path(struct 
>>>> drm_i915_private *i915)
>>>> @@ -443,6 +465,11 @@ void intel_uc_fw_init_early(struct intel_uc_fw 
>>>> *uc_fw,
>>>>       uc_fw->type = type;
>>>>         if (HAS_GT_UC(i915)) {
>>>> +        if (!validate_fw_table_type(i915, type)) {
>>>> +            intel_uc_fw_change_status(uc_fw, 
>>>> INTEL_UC_FIRMWARE_ERROR);
>>>
>>> In our hierarchy of firmware statuses, INTEL_UC_FIRMWARE_ERROR 
>>> includes the fact that the fw has been selected, which in turns 
>>> implies that file_selected.path is valid. this means that even with 
>>> enable_guc=0 the wants/uses_guc macro might end up returning true, 
>>> which is not something we want.
>>>
>>> Daniele
>> Suggestions for a better plan? Add an another status enum? Nothing 
>> earlier in the sequence seems appropriate. And the init_early stack 
>> does not support returning error codes.
>
> I think the question here is: what are you expecting to happen in case 
> of error and on what platforms? let's say we have an invalid table 
> entry for ADLP, would the expectation be that all GuC platforms won't 
> boot, or just ADLP? And is that only if we have enable_guc set to a 
> positive value, or even if enable_guc=0?
The intention is to totally break driver load on any table error.

The reason being that someone is back porting a firmware update to ADL-P 
but breaks DG2 in the process. However, the are only intending to change 
ADL-P and so don't test on DG2. They therefore don't realise that the 
driver is now broken for someone else. Whereas, if we make any table 
error a fatal load failure irrespective of tested platform, enable_guc 
or other module params, etc. then it is guaranteed to be caught no 
matter what platform they test on.

John.

>
> Daniele
>
>>
>> John.
>>
>>
>>>
>>>> +            return;
>>>> +        }
>>>> +
>>>>           __uc_fw_auto_select(i915, uc_fw);
>>>>           __uc_fw_user_override(i915, uc_fw);
>>>>       }
>>>
>>
>

