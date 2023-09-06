Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBD6794337
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 20:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA9910E6F4;
	Wed,  6 Sep 2023 18:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30C010E6F4;
 Wed,  6 Sep 2023 18:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694025653; x=1725561653;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FhiW0ISKP4HmdCYajRdAxB/zlpnCLlR89JmSSlKJ8Vc=;
 b=YVp/yvuk4iuRaNiordU69ZYfFh9BMSy5dx7OHSAM6b5wv4sYAnfhKAGI
 K23JBR46jnWY1u3sANM1onw5/cT2E01A+gf/JZaOv0sQvlcp89O8IGCPx
 4cFMdiCA2/MWJyARMT812/b+Vlk8xIL/wl51MkMAMQHdF5a7pUTrFOMMJ
 C+xBkLXDJHX3j35OOC9prTAXPH52l/SUxXgA7K+y6DK+lw3nB13Ps+F7w
 7kr5lBa4DeVSo2c50LhB19BrYDSahDbZVaEqSKQmrWJLZef0vaA8Pqhx/
 yZnLd+N85oRLRKTAfQl1QCbqtyVJuVi+2IxXY2ERShPWIFd9Fflht7PWV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="379862399"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="379862399"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 11:40:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741664774"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="741664774"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 11:40:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 11:40:52 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 6 Sep 2023 11:40:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 6 Sep 2023 11:40:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 11:40:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MK/SdMEJ0j6pYOHuw114NHqGZN/owOVmT4e5b9YoGt0Db616FIUOO0NjEVNyWRLbLbjPmMxDTl0LS/T7gxSi7knqU+uvlHl9YRYevWfCFZ0sqJ81Q38gL5zzb5GqW9ykKFL+DJwWfogWxEWnDu6prBf/bIi2K8CB3WiL+fEnj8guih2orCqul7cqSrvWFuu1NpXXZrv3QbM3yJJG2n2iZuy/CEH8deaFihpV874/PPRyCMzjhifcgrYHSO9uV6yUZguPA6oGcRWsZHp+uQWm0LFqBD+nylXSJwscVN3AKoQm6643CfdmBdPp0gvnduhdUGBIB+pglhLRMCPQSe9Uew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwyWD7eLX5yVPcbjB+HeJurbyPU/L47R4PxLrSJwXTo=;
 b=Vv2+yRjKrojgpwH4CzD2k0qlXEqquX/RoaYX8tn7Id9kXdJ/SdMDuQs5B87ebV4AVxIp4w6F7CfeU0KtxThV2dWutpGDQJx29vxFdaDngG/xVla69Q1xCSy0YD4E+4eNM5lIFUJUjzPvO6UvO+tDq6zTH545Kpy3KsQHbiGcrc2KRiOxJjGJqL0VN7ysWXWvokO5ZzIXB1J1HhGDZ4qIs053cgNISCuicF6TUpVTO8oUniS4L1kvcu/WP6Hu88D1f7QROXfaNgDowmGwpqSzOjXORcjxZeBe1hxPRMdaad+zSewBjMTUWIuFr+k2KZDfI2zSTGUJqFENHba24NYvDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM4PR11MB8203.namprd11.prod.outlook.com (2603:10b6:8:187::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 18:40:49 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 18:40:49 +0000
Message-ID: <fba1a239-fe30-de96-903e-06b527bea6b8@intel.com>
Date: Wed, 6 Sep 2023 11:40:47 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Subject: Re: [Intel-gfx] [PATCH v5] drm/i915: Avoid circular locking
 dependency when flush delayed work on gt reset
Content-Language: en-GB
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230811182011.546026-1-zhanjun.dong@intel.com>
 <3a745c83-e7cf-6a24-5556-8c0c019adfec@intel.com>
 <ZOYtNyqfvqJPeqq2@phenom.ffwll.local>
 <e31b1f49-88cd-d6e4-abbe-51f27712ff83@intel.com>
 <2bd0fb41-58d5-9862-143e-34e31f6f791f@intel.com>
 <ZPghG6GmhO4j/9qV@phenom.ffwll.local>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZPghG6GmhO4j/9qV@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0291.namprd04.prod.outlook.com
 (2603:10b6:303:89::26) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM4PR11MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a2e49e8-8d62-4b17-6327-08dbaf08ca58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mw850iRux4Lo+uYmi9mb+K+gwRUJaGH4B709rFi/yYCBgOqxf2T4yD1Nuf8pd6fHa3aGhAkrtLgYA3jxM5YNHbXH1Kz87JrYnjQ1X0TG1f7hhRXrQ8QOGQN5oiTBI5zRcof69LJASu6ABoVrp9hC8HvdExhRI9v7cos8uaG9tWEh32fm4l84+wd/NxpGHkB8hW9AZfxm+90kIPrnIBnokzuY2I0XtE1FnUVC6Sff+CnhoTH01kg7g3b+YVvKWa/Ko11ZGAAS/ot3vxVDZrtfF+1XZtxipwLW3okDZHSTMAg1NBeQ08xdi9TAq6SgRM0Zm4gQ8rtWIZbsQiKWB8ZfeSla6CsHegToANYu9KvvOD5XYwAF/9QiVM8M3YXMqoKM/phBPiVpA4wEwbmCh2CdINrF2Jvc+CdgSLaKA4/qx0oFdFLXyNY0R9IrwTxsDEl6NOjVtY54KWxhJZnE6hH8rktbz3yPbLAusJd1vjHLKPlM29V8BYhxwP+k5EKO5tZ/jT3D4Lm2ukwsPY+UXvVuDhxvwVtehRmIho5/ZQ9HbH9PnrDC7KBOxwyGaX5NFdJzaQdkIb3z0rsycUBiRnd0Vzh7lVIqaqxGdlAfoRcJhea9SM2YjRACtxCRg+FbrlkeZwvbAERhLirT5vynFVtEqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(366004)(396003)(376002)(346002)(1800799009)(186009)(451199024)(6486002)(6506007)(53546011)(6512007)(83380400001)(2616005)(26005)(2906002)(478600001)(6916009)(316002)(66476007)(66946007)(66556008)(41300700001)(4326008)(36756003)(8936002)(8676002)(5660300002)(82960400001)(38100700002)(31696002)(86362001)(31686004)(66899024)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1hXa2ZIV0dmQ3FwOFp0eW9IUU92RXE4Vzh5ajhobkt0N2hsRWx3dWZoMVdl?=
 =?utf-8?B?MTVlTFJ0dGw3VFVpays1ZkRPd2RlODFia3pIR1VUckVyRDhWN0MwNmdzRlNh?=
 =?utf-8?B?MXo5aU5TZzBkTkxEQlhMM280RnZjYWxBeUpzME5mMTBZQ2VEa25wOVEyZk4w?=
 =?utf-8?B?dE9rNkoxb1dSMlNLNW5HMEc4OVBMMVhhMUNXOWRhc3AxZUlOdjNSbFM0aVdK?=
 =?utf-8?B?NXFFL3JEY1NLSGFnalhSdzExZVJuVkJoUk5RT2pkSE9TNWtFMFREUitCbm5E?=
 =?utf-8?B?VW1JelNaZFNqVjlYaEgzVFFKZWVoMDF4VjlkSWl5OENaT1ZveERpZzI1VUV3?=
 =?utf-8?B?Z1huQXQyZVNqRy9JUnNOdDZmU2ZqSDJ1T1B6RmY1VEZoWmhsNkFuZTh5bVNB?=
 =?utf-8?B?cFJLNEdOb2M3ZFVPZDhzSDRZVlhXWlRETHZaRDlWTkYwR3pQVDBVYmk5R2Q4?=
 =?utf-8?B?MGZ4bUZYV3RXYzJhUERuSE9nUGxBQldUamx2TlNxd3pwak1aeHdlN1FzZFR2?=
 =?utf-8?B?aE14WkkrVFA3TDBiOUp2c1JsR1dYc3NuTi9KaWUxenB1VUdWdkdSRmtnRVcr?=
 =?utf-8?B?L1QxV2VPUXhEQzhRMnB2akx4RXJSWEEwY3BEQkl2RVJ5K0tWejhtSnljNVBi?=
 =?utf-8?B?T2U4SEN4dEUyR0hXVG0zMWVZL1VWRTI5QndWV3dxQzFVdkUyc2duQ25SeUtq?=
 =?utf-8?B?TVl2YWowUmRkSzZPREhGV2pWM2ZvdmxBOUNnZ1M2VzN0QnlrQzRiZ1lreUds?=
 =?utf-8?B?dVJGTWViS2FHZURwYzRmUmIyUTdSalRJaTNkWG52UGJzR3BVUmZEckkzR2NR?=
 =?utf-8?B?WFlYQm9CVzZPelpjc0daQ2ludlR6MEY2Z2NqVXc3dlJLN3k3azl3dWFEV293?=
 =?utf-8?B?dGozNzFlbkNMRWhBN2FvcWtocVBidkowNlpJOEd3Sk1mcGZJbGNkelV6NVUz?=
 =?utf-8?B?MEJZUjVOL3lIbFlxc1RmVGsrWXIzVHFOQXRTOFNWNTdDOWpuemdydkw4Q2VB?=
 =?utf-8?B?VlpPb0J4UzdHV2ZLR0lqeEw2amNjQmtpeUlXMSt1dk1lZVBtaU5RdTVjMFNN?=
 =?utf-8?B?VmVsTE9aWnFRUCtpZ0NRV0dFUW04SDhKZzRVZ0xvYnQxYkVVdGRCdGZaVFo0?=
 =?utf-8?B?U1NZYUNGMlJkQ21uRW5uYmZadm1vMmY2NHhRUTRUUmJxUDZVdURhU0o1aHU4?=
 =?utf-8?B?MWNEa0lEdFhUa1MrLzg0R1ZnRWhPa0dGbkJiSzZnSDBwOFdCbTFXRHgzTlZ5?=
 =?utf-8?B?V1Z1MGNJTzJvZlRqekQxODRmQi92Uk9lalk4dVN4b00rQ1ZOTjZNWFVvcU1O?=
 =?utf-8?B?YUlkNFpBMVJqeVJMaDJHK2xrYytZSnNkVEQyNFB5SHJZNW53QjNPcVoxelR4?=
 =?utf-8?B?QnhoQSs4QXZrMzlFYnNXZlI2d3hkN3RaZ25yZXF5Z0RneXlOWDlaM1ZuY0w4?=
 =?utf-8?B?WDdKWDVuaE40R3BGUWx3aGtheS9mYkRvRlIwMFpzSnpSeUFrMXJCZGxqVFZG?=
 =?utf-8?B?NVgyS09DdENPZVo1R1JkZ1VadFZNR25DWVhkSlJtL3o0eXFXSnZIZVRWSGNp?=
 =?utf-8?B?ODlLbDVsRHBnbGZ0blR2VEZvQzN3cFVMTXJHRnM5U3htcmUwNTlVN0lHeElC?=
 =?utf-8?B?UGs0NmExUnd1dTdqUXFvQVhSa0VuZjUxOFV1YndIYjQ0ckJHS0FsdUs2UFM4?=
 =?utf-8?B?dUJTb04vQ0M2NlVvN3BvSVN4dGxMQjM1WVZZLytqWlVwa1BaVGhXRnM5azgz?=
 =?utf-8?B?LzBtSktUTlJpM3d1TmZGSzZhV1EyaDBwOGlSMVN6d1pZM05JYlAxQldhckk4?=
 =?utf-8?B?cnJ5bGtEZVpIdUpEVVNrMW9WTXZ3Z3ZKSkcvUkMwM2E2cU1vZHg2MmJnL0FT?=
 =?utf-8?B?aHJpMDAvNTdwV0tQM1VvV3Bkck9HZmx1b0l6Mzc2SE9zQ1d2d20zNWtqOElk?=
 =?utf-8?B?MmJVYTZERm5QMGJqZDhJNUdaTjc0ZlVyUVkwb2wwYkhUTkFNWlprK1l0cEtY?=
 =?utf-8?B?bGs0ZUgyOEdjOUhxRFhia3NDS1ZGZndZVUc5VkVPZVFQMVNsY1lGNGZuTWNa?=
 =?utf-8?B?eWJZZkcwMm5xSmdPa085eG9xaWt6NzZPRjhVSzVOenl6NGRkeUw0akttMktQ?=
 =?utf-8?B?S1Q2VE9hRHdZQlhUQ1RDUSsyeG41YWhZN25NT0ZhQjFRdEpIeDVqa1FTQXZM?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a2e49e8-8d62-4b17-6327-08dbaf08ca58
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 18:40:49.4028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PFs7ZT83YrhuHrIBJ9/duj3LSsXxty0ncJTjJlfK5pt1VhY1pZLupuk/QmlQoz2sL1hrwRSXiNWJMOtP5HxlmcS3dxWCG35Ve9kZr5wrXB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8203
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/5/2023 23:50, Daniel Vetter wrote:
> On Mon, Aug 28, 2023 at 04:01:38PM -0700, John Harrison wrote:
>> On 8/23/2023 10:37, John Harrison wrote:
>>> On 8/23/2023 09:00, Daniel Vetter wrote:
>>>> On Tue, Aug 22, 2023 at 11:53:24AM -0700, John Harrison wrote:
>>>>> On 8/11/2023 11:20, Zhanjun Dong wrote:
>>>>>> This attempts to avoid circular locking dependency between
>>>>>> flush delayed
>>>>>> work and intel_gt_reset.
>>>>>> When intel_gt_reset was called, task will hold a lock.
>>>>>> To cacel delayed work here, the _sync version will also
>>>>>> acquire a lock,
>>>>>> which might trigger the possible cirular locking dependency warning.
>>>>>> When intel_gt_reset called, reset_in_progress flag will be
>>>>>> set, add code
>>>>>> to check the flag, call async verion if reset is in progress.
>>>>>>
>>>>>> Signed-off-by: Zhanjun Dong<zhanjun.dong@intel.com>
>>>>>> Cc: John Harrison<John.C.Harrison@Intel.com>
>>>>>> Cc: Andi Shyti<andi.shyti@linux.intel.com>
>>>>>> Cc: Daniel Vetter<daniel@ffwll.ch>
>>>>>> ---
>>>>>>     drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 11 ++++++++++-
>>>>>>     1 file changed, 10 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git
>>>>>> a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>> index a0e3ef1c65d2..600388c849f7 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>> @@ -1359,7 +1359,16 @@ static void
>>>>>> guc_enable_busyness_worker(struct intel_guc *guc)
>>>>>>     static void guc_cancel_busyness_worker(struct intel_guc *guc)
>>>>>>     {
>>>>>> -    cancel_delayed_work_sync(&guc->timestamp.work);
>>>>>> +    /*
>>>>>> +     * When intel_gt_reset was called, task will hold a lock.
>>>>>> +     * To cacel delayed work here, the _sync version will
>>>>>> also acquire a lock, which might
>>>>>> +     * trigger the possible cirular locking dependency warning.
>>>>>> +     * Check the reset_in_progress flag, call async verion
>>>>>> if reset is in progress.
>>>>>> +     */
>>>>> This needs to explain in much more detail what is going on and
>>>>> why it is not
>>>>> a problem. E.g.:
>>>>>
>>>>>      The busyness worker needs to be cancelled. In general that means
>>>>>      using the synchronous cancel version to ensure that an in-progress
>>>>>      worker will not keep executing beyond whatever is happening that
>>>>>      needs the cancel. E.g. suspend, driver unload, etc. However, in the
>>>>>      case of a reset, the synchronous version is not required and can
>>>>>      trigger a false deadlock detection warning.
>>>>>
>>>>>      The business worker takes the reset mutex to protect against resets
>>>>>      interfering with it. However, it does a trylock and bails
>>>>> out if the
>>>>>      reset lock is already acquired. Thus there is no actual deadlock or
>>>>>      other concern with the worker running concurrently with a reset. So
>>>>>      an asynchronous cancel is safe in the case of a reset rather than a
>>>>>      driver unload or suspend type operation. On the other hand, if the
>>>>>      cancel_sync version is used when a reset is in progress then the
>>>>>      mutex deadlock detection sees the mutex being acquired through
>>>>>      multiple paths and complains.
>>>>>
>>>>>      So just don't bother. That keeps the detection code happy and is
>>>>>      safe because of the trylock code described above.
>>>> So why do we even need to cancel anything if it doesn't do anything
>>>> while
>>>> the reset is in progress?
>>> It still needs to be cancelled. The worker only aborts if it is actively
>>> executing concurrently with the reset. It might not start to execute
>>> until after the reset has completed. And there is presumably a reason
>>> why the cancel is being called, a reason not necessarily related to
>>> resets at all. Leaving the worker to run arbitrarily after the driver is
>>> expecting it to be stopped will lead to much worse things than a fake
>>> lockdep splat, e.g. a use after free pointer deref.
>>>
>>> John.
>> @Daniel Vetter - ping? Is this explanation sufficient? Are you okay with
>> this change now?
> Sorry for the late reply, I'm constantly behind on mails :-/ Ping me on
> irc next time around if I don't reply, that's quicker.
>
> "presumably" isn't good enough for locking design. Either you know, and
> can prove it all, or you shouldn't touch the code and its locking design
> before you've figured this out.
>
> Again, either this is a deadlock, race condition, or the cancel isn't
> necessary. And this argument works in full generality. All this patch does
> it replace the dealock with one of the other two, and that's not good
> enough if you don't even know which one it is.
>
> - if you need the cancel, you have a race condition
>
> - if you don't have a race condition, you don't need the cancel
In the case of a reset in progress, we do not strictly need the cancel. 
The worker thread will take care of avoiding a deadlock by itself. But 
it is more efficient to do the cancel and avoid unnecessary code 
execution if possible. It is also more logically correct - the worker is 
being stopped, therefore we should cancel any pending execution of the 
worker.

In the case of a reset not being in progress, we absolutely do need the 
cancel as there are multiple race conditions.

>
> - currently you have the deadlock
No, we do not. There is no deadlock.

The worker thread explicitly does a trylock and reschedules itself for 
later if it could not get the lock. Lockdep does not understand the back 
off semantics of the trylock and reports a false failure.

As explained in the above code comment, if a reset is in progress then 
the synchronous cancel is not required because the trylock will take 
care of it. An asynchronous cancel is still better than no cancel 
because it at least tries to stop the worker from running. It's not a 
problem if the worker does run, but there is no advantage to running it 
so why not attempt to cancel it and prevent unnecessary code execution? 
If a reset is not in progress then we do want the synchronous cancel 
because the disable is potentially part of a driver unload or similar 
operation that requires the worker to be stopped first. Otherwise, the 
worker will attempt to reference pointers that might no longer exist at 
the time it runs. Clearly, that is not the situation if a reset is in 
progress. The driver cannot be unloading if it is in the middle of a 
reset operation.

>
> "presumably" and "maybe" aint enoug for locking design.
Bad choice of words. I simply meant that the low level helper does not 
know the exact call stack it was called with. It can trivially determine 
if a reset is in progress or not, and that is all it really needs to 
know about. There are multiple other paths to this helper, none of which 
involve resets and some of which require a synchronous cancel.

A previous version of this patch attempted to have two separate helpers 
- one synchronous and one asynchronous. The intention being that any 
call stack involving reset would call the async version and any stack 
requiring the sync version would call that. However, the i915 reset 
design is hideously complex and those changes were much more intrusive 
and fragile. Simply testing the reset flag at the lowest level is 
significantly simpler and safer.

John.

>
> Cheers, Daniel
>
>> John.
>>
>>>> Just remove the cancel from the reset path as uneeded instead, and
>>>> explain
>>>> why that's ok? Because that's defacto what the cancel_work with a
>>>> potential deadlock scenario for cancel_work_sync does, you either don't
>>>> need it at all, or the replacement creates a bug.
>>>> -Daniel
>>>>
>>>>> John.
>>>>>
>>>>>
>>>>>> +    if (guc_to_gt(guc)->uc.reset_in_progress)
>>>>>> +        cancel_delayed_work(&guc->timestamp.work);
>>>>>> +    else
>>>>>> + cancel_delayed_work_sync(&guc->timestamp.work);
>>>>>>     }
>>>>>>     static void __reset_guc_busyness_stats(struct intel_guc *guc)

