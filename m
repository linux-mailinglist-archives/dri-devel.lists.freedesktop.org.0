Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A8E51C79C
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 20:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC9410EB0E;
	Thu,  5 May 2022 18:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6964710EACC;
 Thu,  5 May 2022 18:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651775796; x=1683311796;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RTYplBESEjeauWYp7CdKZSXh/OzOqt+RmxOb9k2kaP0=;
 b=mM6rcR1j1Z+ngXGRTM9BAecgUWkmodWm+zQIjXbSbhX4nGTx7mMPbSiw
 2si6DSAlO2lZmT7tcHrmAc0tjPgsq1bNDfzxfTcOfgM9A7tMJwJN7fZ6l
 lj5GHoe04MD4bFkDZ6I0nojzpGx9JH1XW0c3TYgfTyZ8yJ5QzsDOX0DMF
 rib3+71TTdIniQKbUNkqhyXTf3fe+2zgsxwxW1hwDD+jhMXM/mbUtyhn9
 RToGpK7ggB0G/iUptfEgLn3GG3Lufn5K6S4sek4YdYss7hJ4y6SReHDL6
 1bE1X3Q/f247wlByNQfzYPbzjRsUZ+ArFlY8R/1gEmKOtVBX1zwslkmA8 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="328754303"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="328754303"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 11:36:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="694797482"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga004.jf.intel.com with ESMTP; 05 May 2022 11:36:34 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 5 May 2022 11:36:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 5 May 2022 11:36:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 5 May 2022 11:36:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qnis8suP+kI1ThA5tLhzFkwp7i6GWMTfe6i31rUZLV2novoxTSG9b00+TbRPtzXDhZ/jM2IjHn80lnyGBdYkdOeFYdJviuTbyNnlVZ42JY+8Es6F4irHpYC9k5+4X8DB95j0LLlW1/Pq19jOVH122cKqRvjIwBvy2NOpwkBJhnPOJqNbiXm4Lj5L3YAGi85/tkBkEBOXV/B1ZgWQffvTkXz4m4SlstYMlpVuVs/GDMkfVu+66JRtkAsWRhd6fubsLvD35JHjStVmPz8y0HqiORrISIWm7MlwRHCkdwYq1MJeuhJQsnSP4O0CVwTmHKQs84oaH5mHAfhQT/8O5aM9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytf4D5AC8shYRCCxUKR4gwF0D8b+qgFSo6KojP5HF2c=;
 b=d66bCJiqW8bwq/w5ql9pQA9ZYDcYWhLwMWovbEYRGM4DVYmnwjupBaIIbmL0ILq2wkQhcuahHBB05X9CZ1OChtk0cGgtg179IJF0AaN8vhU47Mpwva1kGsWJovdjSHmOnlVUkN2ng1uxc6uAxnlPBzRBlQEPAKNpYoTRMhpIAZy/dhO0zmYuL5PdYpckkSd7+xO3hqFgytzeUN+TwvVg/vvW5X5Ox5CSkZ3nBx4SIIYwBeggWHEqWvgilyrTlvDAgps1j6/c9orU5V76ZHSJhfMMr8p58W5VGMJiYdXmIlmO6Y1pm0ewa5rboY3V+EOtYn8sW8miloLjjmH3mtvCog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MWHPR1101MB2176.namprd11.prod.outlook.com (2603:10b6:301:4f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 5 May
 2022 18:36:31 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ac18:95e3:c184:f976]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ac18:95e3:c184:f976%6]) with mapi id 15.20.5186.028; Thu, 5 May 2022
 18:36:31 +0000
Message-ID: <032467b7-8794-882a-e45f-6e9d85a716df@intel.com>
Date: Thu, 5 May 2022 11:36:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Use non-blocking H2G for
 waitboost
Content-Language: en-GB
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20220505054010.21879-1-vinay.belgaumkar@intel.com>
 <de063b19-e5f6-342b-d816-c112c446a68f@linux.intel.com>
 <8c8dea74-aa2b-44c1-e1d7-1f613c05bf32@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <8c8dea74-aa2b-44c1-e1d7-1f613c05bf32@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::13) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 148c96b4-bf12-4b1a-5ad2-08da2ec62caa
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2176:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1101MB21760279CBC7A96EC2A0F2A8BDC29@MWHPR1101MB2176.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P9HgxS4W3FjtxSXWQ3xppF60mBLcyrB2jvL9TTt9QLFD7tw6sgYgGszQCWrNeoGwqU394rQ73JE+AomhRbq3Nu5sXxHmLKTqsuY9ZwUDJ/4ESFKgQPOPEn7LBQVwJn63h1pEyxPEPJpVIa1o2eAgBt02j+kErL254wFEgbzdJPr1pZr3Gpsbd/lkkGJmuDjxSuf54PZTqMmzLxlxBw22+2xCgnRsdh1TjuHTEdOlfIUw1s90GM2iaN6PC+lfclR+bW50dD3tJ3qBfjy3jf8wS8IhTCv4FyQZJA3hTaA4jeDMRgDOK/vH1jGr1HIzWwrOQhs3BC7KLlUnjQaptBgON1505EzFcW/sAXJGVz6bZFHG49l7yK9A8yIlA4Gn/0lKUReL278gG5hHbCDH1OcujzHVYAuA9jHiKr7C/qm4M1r6ZJQoxrePccr42J1U21lSD0gQCCbiJuEXthwbjImQObwFvHGSfEd+a9G1VgErKeLYFoOsngoM+PVCMWAHwFzJbYnFlztd50azqB0ayQF+AfxyId5lHRraUSPszrcyfCwkUntyjIUW4skC3s88Bz6KWHXEGm6CDTCMBZ5bLtJbFm2RxgAcM9edlDDb9Sg+wYc/HsUl3Jy1Rc/uiqWvV+lZthMz4QodvZ/vruL0LhCWcqo4MHjVKoG52lDJDmp33xuqPw3DpVNU8pQplgDEOHdQYFoQhjs82UtbY62zLDMvnjN3gAvb05YI4XP/I83kZOvpkyYaCi+L7xJOGdJ2hbW7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(53546011)(2906002)(8936002)(316002)(86362001)(2616005)(186003)(6512007)(31686004)(6506007)(26005)(5660300002)(66946007)(38100700002)(508600001)(66476007)(110136005)(36756003)(83380400001)(66556008)(8676002)(82960400001)(31696002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmZpSlJ5c29tZThVdVVyNVExMytWenUvSlA4OVJVNFJFMy9YMjVQaXVRL2hI?=
 =?utf-8?B?UStETFBSY3FTZlZpcXhSeTFOVU8xa1RBNXlnV3ZnRjBvb1ZvOWU1cnRJWVhM?=
 =?utf-8?B?aHlESjBBMGVXWE5vU0plbC96UEk1ZWJqNzFUUmplRG1WWTIwVFhkc2czMjRL?=
 =?utf-8?B?MkNXcnNhTUpxSVBwSDRjSDhlV2ZkM1hxanBDSng2V3JmV0lrbzF1aUk1dmdU?=
 =?utf-8?B?QVBiRWNqVENPT3FzeVJ1Ti90ZU9wb3lka2JUT0VoN1VKQjhPVXhON3VvNjBR?=
 =?utf-8?B?ZGNMbEFEQjliaWo1OXlYdTc5YUlON29GRENUckxUWUlyZnh3bFNEQWJ2WGZ5?=
 =?utf-8?B?bnJnMnF1MHVwaDdqU3dINVppOGtYallMMTU0QUdMeExqTEdwTHZBSlBrdzEw?=
 =?utf-8?B?SThYUWQvaUVEZ05tY25GSzJVbUc3ZVVyZEw0Wm9pZ04vbmx1NUc4Z00zWHEr?=
 =?utf-8?B?Q3BZUW4xMm00ZWJrMWhzUWQwRUdoTlFPMjFodHpNNmRwUFgvenFOM1QzQXFP?=
 =?utf-8?B?QUYwUnpRMHR2eGRXcmUwRUgxWHpTTGlMc3ZTTUt2eDREc2xxNXlEV3dUTTE3?=
 =?utf-8?B?bTNVdCswS3l4UGlXdWxsK3l4K0VIdEl1L3VFOTYyNWQ1dEIxd1Z6YnpOQWtD?=
 =?utf-8?B?ZjB2Tlg5TzlQUVVvbmo2RUVIL21wY04yL0tzRWpzb0dTOUszOXdxQUFOaEhp?=
 =?utf-8?B?ZVhjZFZQK1o5ZzhZUlZJRXpNRHBVdHN1M0NGTCtjU0RpeHQycHVpOCt3Q3ph?=
 =?utf-8?B?OXNvTEVvTzJWZHhRcEtvRS9MUW5pekdaRmd6cnYvMnNGNjU5QStINWFjd1lS?=
 =?utf-8?B?U2FVUytrRHNzWlhZaHJuNmVHWDNVTFBNd2I5cmlkMUtUSGxnV2pvYXJwN1NE?=
 =?utf-8?B?Z0txTDZwK1pDMXhwM3JOcWZlK0pESm5zVTFvbzJqUzdISGkxS1hkWWN6UjRF?=
 =?utf-8?B?Rks0aEdPTVdMNko5MElhUlprRmJHL2NPV2pQVGgzRGpzZVBDWFRXS1V0MU1y?=
 =?utf-8?B?bFFYMXkzL1hpbFRTNWhBZjE3UjhKcGtMMEhCNGUvejE5RCtkWTFoRDBoV0Uv?=
 =?utf-8?B?T2tlL0lLendDRnZ5Q1dFMjMzRjBoT0IvUDFzanltQThRb0NHdThneGhzckM2?=
 =?utf-8?B?K1p1MS8vWHRYb29FQ0FITmxUTVVLRURsT3ZoOEIybGJ5dERwRWZVVkZhckVT?=
 =?utf-8?B?UHN6cS8zSjVNa3lXbjJnMWhDcnloVVNyU2l4T01tSGZIZ0tHcHRSMVk0Ynl4?=
 =?utf-8?B?ZWc2Z2ltOGQ0Mlp6RE9wVzFnMDNUQXpudWZ3VXh4ZVU1ZXdtNjZEd0UxV2Fh?=
 =?utf-8?B?OVpWYWRyeXdpYVhOS21OZThEK2dRTDROYXpzWXIvK3lrVGF1NGs2WWhaeEFa?=
 =?utf-8?B?K2tXU1Q5UG1VcE1va0JzM1U0eDFRV1N3WkVPWUozdE1SZ1NsL3owVHdyMk9a?=
 =?utf-8?B?TXMxeHAya0dwVVVzMXBWYkY3L1JQeUdvd245MENoNlM0WThCcURwMUNkMnRB?=
 =?utf-8?B?c05lMTMvdUJ1UGxKd1lEcGYzQkYwZE5Kc1hVUjVid2ZOaDh1Y0p4WGxpUkJG?=
 =?utf-8?B?TnFiN3BkUy9CVktlbDFMN3hvMm9FenJqQlpVdmZDM2hwMENxLzFSTzlyKzBL?=
 =?utf-8?B?MnRCeEpwWVR5L2V6TDJVMWYxdG9qYmNZUHhyRkpyS0NHQ01jQlFrK3VPV1Uz?=
 =?utf-8?B?bXVTUWR3MjdtNkwvOE00L2poWlA4Tlc0UG1rYnJhNjd5dFV0U3VxM1ZheGxl?=
 =?utf-8?B?ZWt4MjhUcWFyNzRHRENrWHI4aXRPekxDWXlHeHMvU3pLNDV4RHR6S0dxeFcr?=
 =?utf-8?B?YnZlaGNYWU1UbXpIR3gzU09HWXNsVm9RWEYrYmdKUTBwSW8vUG5obUViZ0Rp?=
 =?utf-8?B?djVCWWRWTVExWGR0UHZabVR0WGh0V096Q1FiWVhrWCt5cTl1dVdXVzZqYnpr?=
 =?utf-8?B?elNEdHl3d3Q4dUZzNHpuUHFMNlppTFJkV0x1RldVQ2c1MHphODgxaUp5dHl2?=
 =?utf-8?B?ckMyZ0VRdGFFNnVmdG1UdlVDcWpScUNSSmQxZGVTRytUZXQ1N3IwOVZTMGpD?=
 =?utf-8?B?RHpOMVNSOUlOOElQMW1TVU5KcGwwU3VtcHdRa29EeWIwSXRKSzhMdWVGaXNp?=
 =?utf-8?B?SnA2dGJYdHNTNTRkbi9hNU5NejU4ZG5XWVRRcmU5QmRTNHNiZ3ZiUjh1a29w?=
 =?utf-8?B?d282WEE3MU5oNjNCTUpNYlJXdUVlS2tnUjV5Nnp4c2pmSHFVUzlzc0RxUXAy?=
 =?utf-8?B?Q21IN0N2aHpTb0h6SHJDU052Qk1yTnJ6TDU2NUdtSFpGQ1AxbnAvWi9ySWdj?=
 =?utf-8?B?dVlDdVVFZnQvMHcrbDlwVHprdXExSTZNUHBKeGFQeFBIdmRLaTczaGZiaEZL?=
 =?utf-8?Q?PJZWaO+Hzz161r1g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 148c96b4-bf12-4b1a-5ad2-08da2ec62caa
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 18:36:31.5516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MwNxqUIOWb9PKmlt95/BJMpdagnKjWPSqywRtxpkRxNLbS9UPb9yqsPYwIjL2dsNu7QxCiGYDl6lCRFnRm4IiXnDXFRPtbsCcZdRAXvkEBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2176
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/5/2022 10:21, Belgaumkar, Vinay wrote:
> On 5/5/2022 5:13 AM, Tvrtko Ursulin wrote:
>> On 05/05/2022 06:40, Vinay Belgaumkar wrote:
>>> SLPC min/max frequency updates require H2G calls. We are seeing
>>> timeouts when GuC channel is backed up and it is unable to respond
>>> in a timely fashion causing warnings and affecting CI.
>>
>> Is it the "Unable to force min freq" error? Do you have a link to the 
>> GitLab issue to add to commit message?
> We don't have a specific error for this one, but have seen similar 
> issues with other H2G which are blocking.
>>
>>> This is seen when waitboosting happens during a stress test.
>>> this patch updates the waitboost path to use a non-blocking
>>> H2G call instead, which returns as soon as the message is
>>> successfully transmitted.
>>
>> AFAIU with this approach, when CT channel is congested, you instead 
>> achieve silent dropping of the waitboost request, right?
> We are hoping it makes it, but just not waiting for it to complete.
We are not 'hoping it makes it'. We know for a fact that it will make 
it. We just don't know when. The issue is not about whether the 
waitboost request itself gets dropped/lost it is about the ack that 
comes back. The GuC will process the message and it will send an ack. 
It's just a question of whether the i915 driver has given up waiting for 
it yet. And if it has, then you get the initial 'timed out waiting for 
ack' followed by a later 'got unexpected ack' message.

Whereas, if we make the call asynchronous, there is no ack. i915 doesn't 
bother waiting and it won't get surprised later.

Also, note that this is only an issue when GuC itself is backed up. 
Normally that requires the creation/destruction of large numbers of 
contexts in rapid succession (context management is about the slowest 
thing we do with GuC). Some of the IGTs and selftests do that with 
thousands of contexts all at once. Those are generally where we see this 
kind of problem. It would be highly unlikely (but not impossible) to hit 
it in real world usage.

The general design philosophy of H2G messages is that asynchronous mode 
should be used for everything if at all possible. It is fire and forget 
and will all get processed in the order sent (same as batch buffer 
execution, really). Synchronous messages should only be used when an 
ack/status is absolutely required. E.g. start of day initialisation or 
things like TLB invalidation where we need to know that a cache has been 
cleared/flushed before updating memory from the CPU.

John.


>>
>> It sounds like a potentially important feedback from the field to 
>> lose so easily. How about you added drm_notice to the worker when it 
>> fails?
>>
>> Or simply a "one line patch" to replace i915_probe_error (!?) with 
>> drm_notice and keep the blocking behavior. (I have no idea what is 
>> the typical time to drain the CT buffer, and so to decide whether 
>> waiting or dropping makes more sense for effectiveness of waitboosting.)
>>
>> Or since the congestion /should not/ happen in production, then the 
>> argument is why complicate with more code, in which case going with 
>> one line patch is an easy way forward?
>
> Even if we soften the blow here, the actual timeout error occurs in 
> the intel_guc_ct.c code, so we cannot hide that error anyways. Making 
> this call non-blocking will achieve both things.
>
> Thanks,
>
> Vinay.
>
>>
>> Regards,
>>
>> Tvrtko
>>
>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 38 
>>> ++++++++++++++++-----
>>>   1 file changed, 30 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>> index 1db833da42df..c852f73cf521 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>> @@ -98,6 +98,30 @@ static u32 slpc_get_state(struct intel_guc_slpc 
>>> *slpc)
>>>       return data->header.global_state;
>>>   }
>>>   +static int guc_action_slpc_set_param_nb(struct intel_guc *guc, u8 
>>> id, u32 value)
>>> +{
>>> +    u32 request[] = {
>>> +        GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
>>> +        SLPC_EVENT(SLPC_EVENT_PARAMETER_SET, 2),
>>> +        id,
>>> +        value,
>>> +    };
>>> +    int ret;
>>> +
>>> +    ret = intel_guc_send_nb(guc, request, ARRAY_SIZE(request), 0);
>>> +
>>> +    return ret > 0 ? -EPROTO : ret;
>>> +}
>>> +
>>> +static int slpc_set_param_nb(struct intel_guc_slpc *slpc, u8 id, 
>>> u32 value)
>>> +{
>>> +    struct intel_guc *guc = slpc_to_guc(slpc);
>>> +
>>> +    GEM_BUG_ON(id >= SLPC_MAX_PARAM);
>>> +
>>> +    return guc_action_slpc_set_param_nb(guc, id, value);
>>> +}
>>> +
>>>   static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, 
>>> u32 value)
>>>   {
>>>       u32 request[] = {
>>> @@ -208,12 +232,10 @@ static int slpc_force_min_freq(struct 
>>> intel_guc_slpc *slpc, u32 freq)
>>>        */
>>>         with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>>> -        ret = slpc_set_param(slpc,
>>> - SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>> -                     freq);
>>> -        if (ret)
>>> -            i915_probe_error(i915, "Unable to force min freq to %u: 
>>> %d",
>>> -                     freq, ret);
>>> +        /* Non-blocking request will avoid stalls */
>>> +        ret = slpc_set_param_nb(slpc,
>>> + SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>> +                    freq);
>>>       }
>>>         return ret;
>>> @@ -231,8 +253,8 @@ static void slpc_boost_work(struct work_struct 
>>> *work)
>>>        */
>>>       mutex_lock(&slpc->lock);
>>>       if (atomic_read(&slpc->num_waiters)) {
>>> -        slpc_force_min_freq(slpc, slpc->boost_freq);
>>> -        slpc->num_boosts++;
>>> +        if (!slpc_force_min_freq(slpc, slpc->boost_freq))
>>> +            slpc->num_boosts++;
>>>       }
>>>       mutex_unlock(&slpc->lock);
>>>   }

