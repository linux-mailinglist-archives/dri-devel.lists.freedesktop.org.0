Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A98F244248B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 01:19:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60F46EE2B;
	Tue,  2 Nov 2021 00:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5146EE2B;
 Tue,  2 Nov 2021 00:19:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="228605862"
X-IronPort-AV: E=Sophos;i="5.87,201,1631602800"; d="scan'208";a="228605862"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 17:19:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,201,1631602800"; d="scan'208";a="449155044"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 01 Nov 2021 17:18:59 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 1 Nov 2021 17:18:59 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 1 Nov 2021 17:18:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 1 Nov 2021 17:18:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 1 Nov 2021 17:18:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DeIAxyT9kuBV6kYKxJapAN/qVE5+XIHrIo2QmRIXTANkWwgAdvplG0904tOh7cY+2AB9wG0TXzBtHjiul1Nqp6H1jrrxmcNPOSC2BGzyFw0TccO5wbVr5C2S9r5IdWhSPei3O06tqnUk/k4YpJt0PKb/eKpGtu1+RgXWGT3i3qqr0mFqBZTJzi/nHW7xmwBf2OQFYshsODn7BqYLDMfEWY+m+OuCAnfbQbKNw/lkcZXyS5G6mFZ70dkbsZO4tCOlCuGoYvkCY2M+FHNl/tQFnucZfMHFouhLoGEylEmbBdlSKrfNGqeji6Ek+t4o1+k38CF/NZf8+SNHOTEt/imITg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VjfWLF4t2j0HJO9QiKx8t+kSrsX1m9oF83caKMbtN8=;
 b=Qy2VUWbk1rCeVFVKAKMgtNlAMu4idY1+CAAiClsfmvuH5hTw4C0zTpU2A+MSGIiwYpqd9HNZiwQ+foMQuiHi4JkIyqdl09CARImgfKLMHmpwrn2pTwr+lOHNXmIveM2y0jcKIUgKi90huWj8AE7Q/q6IjRxneYbtttXCelALOm7+ODjLUIw0jfmqJyX/JofTFKVpYqO+Qwqx9FJCU6fOx+IxfSb/sLzksol1Mx9YhrlxhfbYOmP1eLJvklDFuTPnZbgt+CxcBIWd+pN3RcQxA/YhJNkVvmgza7ARTbYBvtxUL99OW0E42h5osnh3/5yeFm6STjf2BiZMDtyDFRikng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VjfWLF4t2j0HJO9QiKx8t+kSrsX1m9oF83caKMbtN8=;
 b=vl/Hz4hKEJYNfAw/jANhEtiBUW4RpSHaHfuWq8cOpxhVpj39Vx7pn+W0fVR4Jakdr2/CkTi8JSMEZC9smsXhQoWuZEAIeOCt7TI1r6ZN22of/TGo+pne+bRnSeKb5JceYg/e42BuQA/2tudcEz5sVM2T6pM1176O/M6aycRKjqE=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5619.namprd11.prod.outlook.com (2603:10b6:5:358::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 00:18:56 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::912:121e:18c9:732a]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::912:121e:18c9:732a%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 00:18:56 +0000
Message-ID: <68aa4260-064c-f2ab-d613-b31a92aed1c9@intel.com>
Date: Mon, 1 Nov 2021 17:18:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.1
Subject: Re: [PATCH v2 0/3] drm/i915/guc/slpc: Implement waitboost for SLPC
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20211101043937.35747-1-vinay.belgaumkar@intel.com>
 <87sfwf39px.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87sfwf39px.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR16CA0027.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::40) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
Received: from [192.168.86.49] (98.255.111.182) by
 BY5PR16CA0027.namprd16.prod.outlook.com (2603:10b6:a03:1a0::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 00:18:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 789f0e0b-a8ca-44eb-833c-08d99d965bef
X-MS-TrafficTypeDiagnostic: CO6PR11MB5619:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CO6PR11MB5619CC460FFB96275E324302858B9@CO6PR11MB5619.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6YbyI4pLW1kZfHfXlGQtzEEwZgNd3ceynKgba2e1VlSy89A55BNVkn0E/RnYCLoD0mtlCwq5dlWWyZ2t+y1CTxETWSdCa3zaJkj77X5MiAESZQolPhZGzMocuLnIXY2KmXOiJEKPFlq4XvD2646h68q3CIl9sMpkMpcelSRkhMJ4lYus1xIsq47BkGd+fMxIxGl4nEv07p3Hq+YiO8T6pJSfNh5pb9jr8/grMdIMyPaqoOSExdqijAZxGOXysdrN7ZH1LGAQOpovDIlUPYNzPLZn2TJe2Xjg8tK5S/1f20u0pqhEKoCYm3vVO5d3+vaPj245jgcjsS1CEWnJ7hRD1xC3GWcRjYChOtL1Gfu7QN54a8AOfCknNrnlS+qwCHPYrXHQnL26hFqdv/m7BLOU8tNQs+Cr9Gs8yeCMI6FMUAfkGk6YJNGBarYutJFMAD2AgyvsJNnC9/KxievZiCaFx8qKWIoS1wfQbcJqOiwNUfCZ55CPXXpdPMPooqCappPM+FcnT9+D4ZWlW2gvMQsmml6pzXgMdv8ElFua2pBk3C+Qj4Maz+0qNQ2SSVzhBh91sKUzskiDybJwKDYt7APbViAzIccykXu/TqITE2F3/g8vRb8JvybAkwshg3/eC3Zb0s2dkfABmPVItY9FQv+naMaDbbMrPv/JjzYBcc4Y5Pb8DvjjMXxQK30is8VAZF0noV2F1vuxQ6OWsCigE773dWOgj+Q+Qfk1cUVD8tnlFTvWA9yUU7cNO0VeXY39lxJS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(4744005)(6636002)(186003)(2906002)(82960400001)(6862004)(508600001)(36756003)(31686004)(86362001)(31696002)(54906003)(2616005)(956004)(6666004)(8676002)(66556008)(66476007)(66946007)(5660300002)(6486002)(8936002)(16576012)(53546011)(38100700002)(83380400001)(450100002)(316002)(37006003)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFhYRmpwOHJQVTRrWHZJbE52Z1NYV3dhNzVWSDF0VitmQ0YvZWtzWjBiZys5?=
 =?utf-8?B?L2FkR1A0QkRTUUtGdzErOFZEb2ljWjR5Znk4S3p2SFBVSURlSnpmT05TTk9N?=
 =?utf-8?B?VjU5ZzdFandzanQ3UjBrMXlDRVZrYWlkblZ3bW9mS3p5OWNXb1g1VFNEdXhk?=
 =?utf-8?B?a1JTcFp4Smg4NEU4Um4vc2dGUmdpZCtyV2Y0cVZyVGNyZVZxZVoxOXR4RlNP?=
 =?utf-8?B?SUNSaDhkK2d5Z3MrWUhNL0ExK3BCZ2xNV1pGcmIvWW9Qd2gvcGkzaC9oMWtV?=
 =?utf-8?B?OG1XYXR6QVg3bGZFM2kzaFpIMXlVbVU3TDRsM1pUcHNBOWVDajBBUW9iZE0z?=
 =?utf-8?B?dXBCSEwwUjRxcDA4eHJ5Vk1WNHFwWE44QmVnNVU3aWtWUmRIeE1adGNvYVRV?=
 =?utf-8?B?dlFCaFM2bkszWkN4NDdsWnhsV1JHYmZmSTVSZmhtRTNEMHQ0RU50Z1QrL2Ix?=
 =?utf-8?B?Z3YvZkUvRGNNMCs3VVZTWml6cERHS2UxS3huQjM5YThLdUs2d0VrTGtUSXRS?=
 =?utf-8?B?Wk5hRlZBK0pqRmZzdVBsM2dXRXZ6cjBiZEwrczdML0VCZnhFVTNrcU0wbitn?=
 =?utf-8?B?cGF6UFc2aGt4OHJqZjZMckpDWUpIaUZ6T08wUW4yVWJDNDJYYzkvaFZVZGlO?=
 =?utf-8?B?d3BZS2RVdm96amZKZUhScno2cnRPTFJOOVRFVVRKMWN0N1k5YzFrWERqb0ZF?=
 =?utf-8?B?STRtNHhGSEtYcTBldW9pZTJtTVZGQ00rK3p1Q0xFWTlBZ0trK1FYNGRWK0Rm?=
 =?utf-8?B?anhSdnp5TWNqSFhkVDdXbmROdzJiSW40ZWdZNTYzenlJajBZRU9sbjY2NFB5?=
 =?utf-8?B?MFhFUGhhWFg0Q2h3SjBTMEtmYTZLU1JhbnpvdE9hODhhUlJYUHJIVVdXdDVY?=
 =?utf-8?B?ekM0Y0xVUmRJeEwzV2pDdW04UEVsY3g4VldlYnNXNkVVcFNkUUdteHlSTnor?=
 =?utf-8?B?UHRzZkhCcTllL0dtaFczd2VqTUswcnpSOXo0SXAyRVpxb25PU0ZzdjJVV1FV?=
 =?utf-8?B?L3pzeFc1cklHZTVDYmlGUjBYYWVRRGcvcWYxQ3Z3TE1ZS1RGRmp1SlBEdjJu?=
 =?utf-8?B?bDFjTU1uRkg4ejFuQ3R2V2U2ajNIUlcyUDB6Y21FT2Fyc0ZBMi9seXVyV2tF?=
 =?utf-8?B?QVp1ZFhRTFU1SU1BaVVCRlh5Q0EwNWMxMGhxQ21SRTR6djVsa012MGE2ZU1O?=
 =?utf-8?B?VlRqM21WSVJjWHkxQm9MUlJvd1FmN01yZjRyRHVUL0VHRFpOWHpubVJHekcr?=
 =?utf-8?B?bUZES2VVS3RGeWQwU1JFbXg3Vm5sclZ4Znk5ZmxZUEhyWlQ3Qy9PNTZFbXRL?=
 =?utf-8?B?cjNsWWdQTjFsb2dFeDU3S09YTFZmalZnTnEyZlY1TEptVlRiekg0V3V6THp1?=
 =?utf-8?B?RjZrcjdEVUxXMmZrdG9KNG00dXZlNWhQWHFiRDVhQTFkTGFtWHc4VnFjVUpN?=
 =?utf-8?B?RHk3aXRIM01GVnBxRXVzT1N1UktlSzc0eWhpbU1xaDFaaVJoYUtmWDFFdGEy?=
 =?utf-8?B?QThiUHhkMEZJSHk0NUNpYUR3ZFpoOTZ5V2pUSGdPVmhucy9WVW9RS21oTjZU?=
 =?utf-8?B?SnVmMHVvUWN0a3ozM2dZWlBVcGhmc0xwd2JHclJ6TUpMSjNYTVQ2WUd3em1M?=
 =?utf-8?B?MERpQi9BRCtaZE80eG5aT1dQUUJXb3VuNzJ6YUJmS24wR3V0S003U3liejhK?=
 =?utf-8?B?Vm16Szd5eDVLaEp4Y2lTUEREbjdiTFJWR0JadUR0MzE4T09rS1I3MmwwNmdT?=
 =?utf-8?B?VEQ4N2w2Yms4S2ZyWTMxZWRGN3B5cy92SDQyUW1LdGRmTVN3b2VNUFZtaDNQ?=
 =?utf-8?B?RVhvU0pVQURWQnF0TGxUbmJvbGZzK1V5WU42YjE1Szl5K2V3OXBvdTRjNHZ5?=
 =?utf-8?B?SE85ZWJEdTh1YURZSkJUV1lEeEU2MnZHMjh0QlRVd0wwaHdXTUsrSHlERzlP?=
 =?utf-8?B?UGdYd3VlYitqSEYzRVFvWFhJZ1lpMXpqdmtySTZCK1prTEZtMldLMjdJV2M3?=
 =?utf-8?B?dmUwU1ZJSlJxVGxOWjVod0ZsaTQ3M2VVWHBuLzlnYmdVbGR5R1JnaGY2ZlY0?=
 =?utf-8?B?bDR2bGhib3o5b2JvT2g4b05telRkbmxNY0pUbEpmbGRpQ0NQY0JEZ0NZUURR?=
 =?utf-8?B?VFdORnd2dkt2aHJJVE5GTGFuNUs0YTFxNFNKT2ZZWXcyZlNVbk5VanNuMEQ5?=
 =?utf-8?B?VTdmQmVHeHpVdmNjSlBRbW1zdi9LZ2ZLbVhjVzdHb3BoUFh5V1BmTmJreWp1?=
 =?utf-8?Q?EGt/YEKeict83AXUxHdpiLOWYpY32TmwUkDDuxn0nM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 789f0e0b-a8ca-44eb-833c-08d99d965bef
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 00:18:56.8001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YdwRN1lmC+3DWlB2DNrNuG1LUhEudcHSvpm6LuHinaBC9zPE55Azlou1mXd61I+H4/YYHz8HaSpdVeoitk6VES6TFzeci+L/Jws9KCfI2K4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5619
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/1/2021 1:24 PM, Dixit, Ashutosh wrote:
> On Sun, 31 Oct 2021 21:39:34 -0700, Belgaumkar, Vinay wrote:
>>
>> Waitboost is a legacy feature implemented in the Host Turbo algorithm. This
>> patch set implements it for the SLPC path. A "boost" happens when user
>> calls gem_wait ioctl on a submission that has not landed on HW yet.
> 
> Afaiu user doesn't have to call gem_wait, the boost will happen whenever a
> request waits to be submitted to GuC because of an unmet depedency. This
> has to be done from i915 because GuC has not yet seen the request.
> 
> Rest of the cover letter is fine.

Ok, thanks,
Vinay.
> 
