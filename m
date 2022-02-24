Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 033224C217C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 03:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7CF10E7EA;
	Thu, 24 Feb 2022 02:03:38 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C120710E7E7;
 Thu, 24 Feb 2022 02:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645668216; x=1677204216;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2ExR/Xfm51hnG9KFOmlN3Yay8Zps7ucd3rDkAD+abFU=;
 b=DrmUK88b3nRLNwZlrgqdd2owr+c5YqUaK0c/YNBhE/c+Inq3CbdPckGy
 wiy15DvGT5nZJhZGdwuIXpexPKJSPLxYI3fyS5Z5eXpowcS39pCKL592c
 G9u+/AR2EaHwOemx8bmZOS7BG70AENjKBFxcGsRPcbNa3zrtez3ZovXA5
 +uLmmzWBtl5EJEJt79UfjRRS7Q4w4z9P2ipOtI1ygGIp3jGs0atCJSUlK
 OKkEYNI2dP5/PUfw5Z6ny6zquXzhXoTnLtO46qAMlRonvvo55UZMXqvnL
 VymwOX8JqtMFP4B3dvRPmevWSa22D0VMGGRmaO//qnFJlY+Oxo+5gCxB7 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="249710065"
X-IronPort-AV: E=Sophos;i="5.88,392,1635231600"; d="scan'208";a="249710065"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 18:03:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,392,1635231600"; d="scan'208";a="591925932"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 23 Feb 2022 18:03:35 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 23 Feb 2022 18:03:34 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 23 Feb 2022 18:03:34 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 23 Feb 2022 18:03:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZBSHou3ZubQboOOtLD1sKWaAvhMjgwhjPOpx6JbX2C1gdSB02zNi0SZZY1gNPgfb+dQkP7CRhBpaQudAzzcLjG9e4hhXC7A/MN/RxbcsaBACcIMMFLylO5db9sQbhDbO37DP1BqS9H/FtNgC19kZ3rN1YTtIxvfZmwgBV67N8bNZAXl5C+kuK2n2RYBV9A8rHjUJ/XHj4BIR/2Z0sLE6zvQr6pBfQPnhV7rDhJudickbHD0RfHmLCPaMPkjCfCzkI+0cn1yUCc+IH0T+WHzQIuNStC3WxdK3Jjp/KvTpBIjvDiN5LO/QHGFqApZos0JwGTW5HzHqQWdV9/PoR3Kag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyKOhaX/DIdyxbCXdgo7lfc3Su0Lvl7OHvPOAVm/DDU=;
 b=VLet+YFfUf2wlwBEHlyyL6uVMWzO0xagyHktj0zyxUpEApKBVmUnO+LPeH+EqE67FigXYCns9xLtkBYn/3fdBaXT6pYw/K/FDCJhg83BxKZ7jQaXdF1Pkzzi76mdxurDsevpPM1I3Ti98t1Fd7olTvQrmbnA/SHtdvok7IpsAuLJq1CRWmUb56lfUo6NMUCda5dv3NnROMO6JZQ/49ouYlGmsLo+9AELAexG4yveGeuB+pX7o4fpgtfiARi+FR+JcWQi6F1xbnvfqwUMXdTGSSQMqg6X+naxvqDBY7RJGG2vLK3MiEZrroQ8wtC98AyyT8xV9Q2gUXwpLCnX9Cv62g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB2555.namprd11.prod.outlook.com (2603:10b6:5:c5::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.17; Thu, 24 Feb 2022 02:03:32 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869%4]) with mapi id 15.20.4995.027; Thu, 24 Feb 2022
 02:03:32 +0000
Message-ID: <0cd43952-3a0d-60ec-5702-fb0e395025fa@intel.com>
Date: Wed, 23 Feb 2022 18:03:24 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [Intel-gfx] [PATCH 5/8] drm/i915/guc: Move lrc desc setup to
 where it is needed
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220217235207.930153-1-John.C.Harrison@Intel.com>
 <20220217235207.930153-6-John.C.Harrison@Intel.com>
 <cc5b20ac-86b4-2d8a-8d53-c4b870213b10@intel.com>
 <0b971744-b456-9a92-818f-1f038669da7f@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <0b971744-b456-9a92-818f-1f038669da7f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0134.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::19) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f8ecc90-c249-4a13-6df6-08d9f739dba5
X-MS-TrafficTypeDiagnostic: DM6PR11MB2555:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB2555E17386D7D9ED54EDDFEBF43D9@DM6PR11MB2555.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NLWeP1rnyypTvSAlytKFtugwMOS5jzAS+JTJoR7vMiex1mCQjygqH6TQFJKTWmgRPGIbJ23s6wAaDHkSthHvya+UyF/Wj8ZNbb2XGXKtGquKq88nH0+cLNKsyiTGlxlgyXy5uK84yOAEJMXCjmxYWPWGXNep4VGke3jxiNvUSZjLxPptxVYU8gEtMpRt7CPByyuIoYKv9DBCkwOWHl6AFny+MGwKKsB1XAlbuxiPt7wJcb5G22btQfOByo82vlJ2C/BoKG8qbnTkVDhdZ4d5uwAv6BuVT5zcbUllb36WB7Rdd4XioZjKyH08S64oXhw0I0Fv2O97p/7YM5JNbMgqFlPUgoxa6qwpeAO/ZvzIVXP1RTmWeipWBTK/Mh+CzJrUIzfgSC9CURUinl1jdbDRacL53Nj/0LYGIJl6wCybKhS+B+353s3YAro1rUGg62HD+eJdCIijkbfpRbMc7DqJRsd7QJDD4VnE2XVHloALoRYMlW7kVn5njwwHFiNuuKKP6F650IgVKvhelt6tNtGYcRC30u9/Ekk0JINJ1YW3L0TX9zYDKcZqp9oaRysml2SCssUlQ5RFhV/OSif9e2p1vZMW2PJ05hXrOtdAwu6nYVPCqec9ifxjZCS/fkBdJoyzuBDo4h3XlXiqGyTct4fqZcHQRBAEK8M5FuSzO5+sVZK8bRXk2B6HmDKUbojujOjyCUwf8Eg3xtmWaHxuMWYlVpYYYsJ0jTTfwmXSSBU+p7C+o5DX37K/WhiiEFP3+AWB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(36756003)(86362001)(186003)(6506007)(508600001)(6512007)(2616005)(8936002)(31686004)(6666004)(8676002)(31696002)(2906002)(82960400001)(26005)(53546011)(4326008)(66556008)(66946007)(38100700002)(6486002)(5660300002)(83380400001)(450100002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXFxS2ZZLzIraHE2Q01NU1NXclpEQ25CbUR5UzZtd3hVUmxnZm96NnEwdWt0?=
 =?utf-8?B?Njl4U25tQjgzVTR0MmNFUE8xSjRuN2E1b09zanc1bTYyZnJJUzg3MGU1aFdp?=
 =?utf-8?B?eDRqQ2NkVWp1cGJ2S00wbmdrMUQyelFMVDd2QXZqUDM1dStSR2M3WDJiVWcy?=
 =?utf-8?B?dmY2UmI1aTZvaTVKeE96OVMwd3A1c2x4WUFEQVFna1JTc1dkSkJZb1NOZDVy?=
 =?utf-8?B?RWU0cFk3L0FnMkFtQkhiUXUwVUwxeGQrQkVrWHdJQjVyYnRvdEc3cWZ3SUJ1?=
 =?utf-8?B?VHlhNStDbGsydDgyWmVJNXRzS3NSWTFJM3F4Y3RYUzJxRkRXSE1TVGJvNzg2?=
 =?utf-8?B?cUVMMWZJTHFvS2VXcUJTY1pGK0dpNGRsQ0FqbXRXa29ZRXU5MmltQkhvSnhi?=
 =?utf-8?B?alZpcEZOQkdwM3c0WFl6SXhSN0dZNW1NbmI2QnkvZzk2SEduVWZUOWJNS0F1?=
 =?utf-8?B?QlVURVhpcTM1bTNGRVVWdkszTEVUemFORUZBNHhiNmE4K3kra2FqTDJTV2o3?=
 =?utf-8?B?VVl6eHMzT3E3d0pXekdabXdNd2tyYlFsM3Q0Ri9NeGgyQ2E1cUV2K3M0aGYw?=
 =?utf-8?B?NEkzVDlrR1pWeWxUTzhWa2kxOUpIT0JmV21nUkx5UnVrOTA0YkYxSDJ1eW1q?=
 =?utf-8?B?UGhhYmR6bWFzRFJ3eXBZWGRhd09GMkVZWG4xYVhCR3NpT0NsZDZDK0VieEVZ?=
 =?utf-8?B?ZEhRNFZCeXRGNm05Q2t3QzBwTm81SEFXTm9XTGdmVVhvOGUyWW5UbFlvSHlJ?=
 =?utf-8?B?ZmVaNUdaOWRjbm02TEgySHBkcHlJTU1rWnNEYWhoMG5LZkJoKzZRdHB4SVc3?=
 =?utf-8?B?aGZ6VWQxMGwwOSs2TTZWcnVZMmZDakFOLzE5dXY1cDYzUFlGbmdzMGwvZzJQ?=
 =?utf-8?B?WGg3RkwwVGhhVExtL1Rnd2tYOGJQWEMvRTkzUnZrWDkzSDE4QklwNXhIdGQx?=
 =?utf-8?B?bHdwS1d3Y2l3WFBua3JEN25naklxK3lJZmN5bmZ6UFFJM2grSDd2ZXdGdnZl?=
 =?utf-8?B?NFY4aThEYlhvNXBEUkN1UjA1Y0V5aHNRNyszbEp6OGVQRTB4Zm9ybVBsZ1A2?=
 =?utf-8?B?RkZFbTFGVmZQUVdtN1oyWng1MElQeXkwZytYeWNVNGxUd3kxK3lzUmVPeG4w?=
 =?utf-8?B?UGRaaHBUak43ZWVVVndha1k2ZmJSdU5FYk1kZ1A1NWtJYjVvblJ5aDVuamgr?=
 =?utf-8?B?aFRMRlI3ZXdub1lMUWg4WnZaZFEyVnZVRWlrMll2Qy9sMzJVRWxiMnU1RFJP?=
 =?utf-8?B?Y1FOVjlvOFZ1a2g2QXY0NDdsRDFsa0dpT25kYm44Q3pldEJvS0xFK2hTbFlE?=
 =?utf-8?B?ZkZQaFd2Uys0UHBabWFVSmduU2FEUWlBbWprMjFCSVJGSS9hVk40Q2dacGcw?=
 =?utf-8?B?MTBSelZpY3NHRWZXeVdEckdrR2FDL2FlWDBpV2JsOWczUTl6ODRod3IzaldW?=
 =?utf-8?B?SUhyU2VzbFdaTTlpbC9NSTZqbENvaWVUUUNyV0dyNzhSUDRmUHRpem1zN0dt?=
 =?utf-8?B?by9pSmFGUnphU2xKVzIreGwxcGIvcDRNbEEwMUpQZTZSM2JxTWwrcWlTQldj?=
 =?utf-8?B?bjV4Zk1NUnoxeVFFMHJxS0IwT255bU5IK3NXdHJYbUFRQ3pHeFlreFFzMGlO?=
 =?utf-8?B?aXkxVmdRSUYrTElDbG5sZ0sxcnFsSVBTMzZROXRBKy93ODRHdnFDUFRGZ21X?=
 =?utf-8?B?T0pCQ0NydlZrdUJ1eWVBV0JuWS9yZ0huSEhuaUxVYkJJcXk0Sm0wS1ZRKzZC?=
 =?utf-8?B?eDU1Skd3UlZEQWhNdkd3anAvM2N2M2wrUEc2clZtMG92Tkl4dVBKUkhBTTVv?=
 =?utf-8?B?RDdtMVh2SEFlUnVRdTFzRHdLNW0zVitURTVjb2duUG0zS2dTSktHRE1GWUhE?=
 =?utf-8?B?d2Z3R2taV1lsUzRJU05PNzFaQUVjZlRveldBT0R6YUR0bkxrWnNhYVFQZTF5?=
 =?utf-8?B?U1Q1QjVxdXNIdk5IRkZSNkYyY3JsN1hTSlNUVmhHdy91ZEkxMm1FVkNmZnda?=
 =?utf-8?B?cHRlMUl3QTVpWGsvYkRlT3FYd3dSbFhGT0xOU1o2VnRQMXg3VjRpVk5ydWhP?=
 =?utf-8?B?aThBOWpCM0lINHNkM25uT1pzdmt2NGxkZERBS1FGUXZJRXdRZ05mYmlNcUpW?=
 =?utf-8?B?U2lUeVd6Z3B4Tzc3Z0IweUg3eElaWUNUYlNTRVI2bGh4RHk2aVdxT3lUUlQ5?=
 =?utf-8?B?MjZSSjE2L2tyK2NzNVV0bjBpQnJxajhuYS8yOVlRSE9KaysxNzlhdW5EUFdP?=
 =?utf-8?B?Q3JIckZLYkJwWWozY1dJMXR1d3pnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8ecc90-c249-4a13-6df6-08d9f739dba5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 02:03:32.1134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1JJGx7q7bmHhE7yUWRsND+PsFyUQNgFeYwRChegKQUzZK98u/JbXlp6WYA4n2Nnk5uQHphCtgV3pguNijIYoYyAb3GApP3ULjynLPXHys/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2555
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



On 2/23/2022 12:23 PM, John Harrison wrote:
> On 2/22/2022 17:12, Ceraolo Spurio, Daniele wrote:
>> On 2/17/2022 3:52 PM, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> The LRC descriptor was being initialised early on in the context
>>> registration sequence. It could then be determined that the actual
>>> registration needs to be delayed and the descriptor would be wiped
>>> out. This is inefficient, so move the setup to later in the process
>>> after the point of no return.
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 11 +++++++++--
>>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index 0ab2d1a24bf6..aa74ec74194a 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -2153,6 +2153,8 @@ static int 
>>> __guc_action_register_context(struct intel_guc *guc,
>>>                            0, loop);
>>>   }
>>>   +static void prepare_context_registration_info(struct 
>>> intel_context *ce);
>>> +
>>>   static int register_context(struct intel_context *ce, bool loop)
>>>   {
>>>       struct intel_guc *guc = ce_to_guc(ce);
>>> @@ -2163,6 +2165,8 @@ static int register_context(struct 
>>> intel_context *ce, bool loop)
>>>       GEM_BUG_ON(intel_context_is_child(ce));
>>>       trace_intel_context_register(ce);
>>>   +    prepare_context_registration_info(ce);
>>> +
>>>       if (intel_context_is_parent(ce))
>>>           ret = __guc_action_register_multi_lrc(guc, ce, ce->guc_id.id,
>>>                                 offset, loop);
>>> @@ -2246,7 +2250,6 @@ static void 
>>> prepare_context_registration_info(struct intel_context *ce)
>>>       struct intel_context *child;
>>>         GEM_BUG_ON(!engine->mask);
>>> -    GEM_BUG_ON(!sched_state_is_init(ce));
>>>         /*
>>>        * Ensure LRC + CT vmas are is same region as write barrier is 
>>> done
>>> @@ -2314,9 +2317,13 @@ static int try_context_registration(struct 
>>> intel_context *ce, bool loop)
>>>       bool context_registered;
>>>       int ret = 0;
>>>   +    GEM_BUG_ON(!sched_state_is_init(ce));
>>> +
>>>       context_registered = ctx_id_mapped(guc, desc_idx);
>>>   -    prepare_context_registration_info(ce);
>>> +    if (context_registered)
>>> +        clr_ctx_id_mapping(guc, desc_idx);
>>> +    set_ctx_id_mapping(guc, desc_idx, ce);
>>
>> I think we can do the clr unconditionally. Also, should we drop the 
>> clr/set pair in prepare_context_registration_info? it shouldn't be 
>> needed, unless I'm missing a path where we don;t pass through here.
>>
>> Daniele
> I don't believe so.
>
> The point is that the context id might have changed (it got stolen, 
> re-used, etc. - all the state machine code below can cause aborts and 
> retries and such like if something is pending and the register needs 
> to be delayed). So we need to clear out the old mapping and add a new 
> one to be safe. Also, I'm not sure if it is safe to do a xa_store to 
> an already used entry as an update or if you are supposed to clear it 
> first? But that's what the code did before and I'm trying to not 
> change any actual behaviour here.

I was comparing with previous behavior. before this patch, we only do 
the setting of the ctx_id here (inside 
prepare_context_registration_info) and you're not changing any of the 
abort/retry behavior, so if it was enough before it should be enough now.

Regarding the xa ops, we did an unconditional clear before, so it should 
be ok to just do the same and have the clear and set back to back 
without checking if the context ID was already in use or not.

Daniele

>
> John.
>
>>
>>>         /*
>>>        * The context_lookup xarray is used to determine if the hardware
>>
>

