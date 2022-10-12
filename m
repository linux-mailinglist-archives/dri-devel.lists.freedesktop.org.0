Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A535FBE95
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 02:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B87B10E0DC;
	Wed, 12 Oct 2022 00:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAED10E0DC;
 Wed, 12 Oct 2022 00:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665533041; x=1697069041;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oNa7BNtYpAQRMEwiNl6aJGL6kNEMthvtETVfAw8Y2CE=;
 b=d28ECD20BRxTwsCWZfj/bcvTfpPs1yLQ3pPOZSrKTJA0r6FR0mc1uluP
 i0jrdTevUE5LlFaypiARMHvNA7oIBsPPsZ/ZfPxoqeN5PTzKWazSqJXCR
 G3j97dOwummrx8CM0M2B+0zhRCNMyeWpKYC/+cj5rpatRwTiCppdHPYO6
 y+tnS3OeBGyzMe5O0eX+eR1Va7MyGEmy6OaZkyOOej7bcwZmhvSx8nBGd
 n41UDfrxHyK3F0G7N+OwfGSXmkWCmTAbdMnwhEh7Zt8fHCiNFtu41VWxZ
 3extzeG1ufI8Za8pxMt7eysDJ2C/SxqMHcDOpHnldnR8c1ghFnCG4eLck g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="304642874"
X-IronPort-AV: E=Sophos;i="5.95,177,1661842800"; d="scan'208";a="304642874"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 17:04:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="657562261"
X-IronPort-AV: E=Sophos;i="5.95,177,1661842800"; d="scan'208";a="657562261"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 11 Oct 2022 17:04:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 11 Oct 2022 17:04:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 11 Oct 2022 17:04:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 11 Oct 2022 17:04:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTw4aK6qErJxOi2rLHVvn1Zolu9J5z3Yxogs+1pBeZf1VieCwKmZzyBqj7L6CdqHL7p1bQ4RpYKeMrLff5tgbRUWiIc+OJaTru3M3EuWtMgXI+vnTANuwakl9PqXpfJWddVgPILBJA1ks64vMd+ahT3BS8F2ZwiSs1DhwKziWi9ieFPAfG0FVp/Zd/dU2FO/Kcr0fqwtgr56jIeuqFPExAM6CV4VOT8MgTVblZbHrUPjfJWiXPrFwA+TT6qIMSIXHGGAeugp8d0wOBoLoFikeh0AXAtnRGUvpM19yCy+RsQyf3oUUftaEKWwGGmZhuf2y8Q52Sg3DzGLTKZ5XIrdeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jbbjBcu1t5z2S5nc3ii/n3dPFA/AX0VOwlst++4jzE=;
 b=lbX67WrUBCBzknpObvkrg2xXNV+vIIe52uWQo7hEpmalOKIKfG3J46aKs2mjhNtT1HAm9B5o2Ux805UO3gYli0dtCRJgsGNs2TQN2JpE4v3UPwDDRJuHRNmW9dWL7LghQ7qboBdK374dVtN7lnzudlJl9vUGyKYZ6WG+/15m/u5IutsBh5BrgfqsYytC0Qu0pHI8MCZtJg1T8EyTrz/DFU1aX3vBcgeX1SU0TN+x1VzS2Ereqr0fnTaReKDaenAeINudK0eCEIZ422Swl224Ow34pwHlZamj7tBXfx6U/+H8EdsApGPpBsOy2+enYH//a1tfTeMgQ0E8WGyM30PboA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BL1PR11MB5320.namprd11.prod.outlook.com (2603:10b6:208:316::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 00:03:58 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5709.015; Wed, 12 Oct 2022
 00:03:58 +0000
Message-ID: <7f6a2094-d7d6-1f3b-e9b6-f7aef17cf101@intel.com>
Date: Tue, 11 Oct 2022 17:03:57 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH v2] drm/i915/huc: bump timeout for delayed load and reduce
 print verbosity
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221010184812.1576601-1-daniele.ceraolospurio@intel.com>
 <0a63f729-f2b8-4782-f21b-00f536145ab2@intel.com>
 <02f637e7-2751-995b-6039-715ebc2d3758@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <02f637e7-2751-995b-6039-715ebc2d3758@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0013.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::26) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|BL1PR11MB5320:EE_
X-MS-Office365-Filtering-Correlation-Id: beb0ae05-f63d-442e-34bf-08daabe542cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f4Sh8gJMeZ5oLfmckNcq0fFHBIV1nQ0GdgdxflXEz7AfRcHOrZRFdNU4puWBDiM5Gx19M6ocB4Q0b3SERfnEsvIffurJjdV5nCVgiHN2t7T5UiKEMeG16FtodMfJyd1QlhwyFUE1FjBbTIv/u8Jar/bVq4Xr+6whSqh2jz8v5zqTacHUBiI/dz6WKbbtfmbqsBRaNAcp+jtpLbeMCSz4oDMSpWknCO/5zN8MazRX16+FgYiN5l7QeT9xWR4L/HlMwyxlkwvEKV7KvoCh0t0XF2lEo+vVG7uU/sHp7mDkkjgg7gha2N9C9GDD6nbf2i84YUGWk+x8PofQS64dZD21Bqjq36PU1q3SdWJbP/ER5bfDVMnKQSB7zb8BjRuNMPMWMdA4q35WbYOmaZIJbHlfJqwgCIiYu5TJyHBVF5c6CKToDX2X24wJVCIpxXTLhem4a0RiPv3GZb0aEvYlhsSlWGZfZx8FWGZQMjD09x/JbO5Wawy/3EFDL3RCguawD0COhndNBe9s/4SdpXBPYCkfQaw/KCGGwWJy273tZuVpqy8AhYhkcxMGL6I/RCRpyG3KNf61SSMo+AYUXApyCnqqG87OamP02Xd+44zln40glnSskB9An5FIRCzv1cKA/fb2uZnij8p52qIlozrqP8h413dU5qGW0DGOD8+HP2ms15KdJSiuj37nsfLeDUxNk030UG32rFg1Cn2rK+KFF3CRuNYDM2SFY8iBgyNXfCb2LY7+EI4LZt1lMwmwHAX1YUY3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(346002)(39860400002)(396003)(366004)(451199015)(36756003)(4326008)(186003)(8936002)(83380400001)(2616005)(8676002)(2906002)(5660300002)(107886003)(41300700001)(66556008)(450100002)(53546011)(26005)(66946007)(66476007)(6506007)(38100700002)(82960400001)(86362001)(6512007)(31696002)(478600001)(6486002)(966005)(316002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1lUSDJrZnBsbzkrUlpGSlBiM3B5L29Gd3BJZEpGdmtyREhCWS9OcnBsa0Er?=
 =?utf-8?B?MlBTayt1OHlLalI4ZUExa09GS0s0S29mSjhuUXcxOGF5VC91VGRsZmtiN3Nm?=
 =?utf-8?B?YzlNMURJUll1T1NleVY5dVlQMzFNNTlMQzRKbXFOb3lzMkRaTzV3Q0Y1dnZJ?=
 =?utf-8?B?UHRyV0NkbEliS1Rwa1BlTVN1TWhtckt4elBEc1Q4UjdUQ3B5Y3RBZjNkS2FL?=
 =?utf-8?B?KzFpNlBrQ2tvOENNS2F1cm1vYllQODVHRjZzYUFFQTN6K0dKRXZlRDg1amhD?=
 =?utf-8?B?Mjk1NWVUU2NpM045VEpub21GQkpYTFppbHd5T21kVWIySStKQ1phY0dHbjlT?=
 =?utf-8?B?UEhXSCtCTWVueXEvR2tlQ0N3L0hFZmdYZ3kwNXVBQ0lIaFZaZnFlL3dsZDl1?=
 =?utf-8?B?NGttejkyNEVTdllDd1lUbFF6NHk2Q0FUZEVtZHAvc0JnL3ZhNkx0enU5S1d1?=
 =?utf-8?B?NTRBS2FDNGk3K0xKY0ZCOHFkSlB6a3pmMVUxdk83QU5jcUhQQWV0TStwQWRv?=
 =?utf-8?B?SDZicldhWTdITHM1NkQ0eXhBU2dNb3BTT0oxYTBDSjVuOXpYZ2VyYm9pNk5S?=
 =?utf-8?B?dGxQMmc1V3VXN1FEUUFyME5LZjlQNlB4UnJPS0YwdTNlUXoyYzJDZGw5UHRw?=
 =?utf-8?B?S1ljQzMydkRYay9TcnF5OHJLa0RET3dUajBGY3N6Mkk1NFpmNjA3MUZFbEM4?=
 =?utf-8?B?ZXJZS1hQaDZhU3cvYlhRMlppUmhubGh3R0xsZjJPcWhPeWJrd3kvMXRwZDB6?=
 =?utf-8?B?c0RLaElvNGZ5ODlBUWxSU2Vpa0ZVa0RMM3B3aVVtZEZQaXdBZklrcnRyUG1R?=
 =?utf-8?B?SGlkMDdOQnNBajFWckFQbWxLMjF1M1o0MUNnMnE0YlM4S2gxbTR2VkR0d3Jz?=
 =?utf-8?B?MTdGY2dqQW9kMUQxQmpzQUJOR29VREs3dC9URThydE9tdTFRbm90K3hYMjZ2?=
 =?utf-8?B?cGYrWGtmalRndE93WUhGV1IzM0RtMDdyN3pwZHdGSml0U0V6ZGN3R0V1T2hG?=
 =?utf-8?B?RnZvVTRtN251a0U1Y1BNMHVieGxFV0hMamNOWjQyaC96Z2x6N0Y5alNkNGR4?=
 =?utf-8?B?NVl2bFpSeERZOFd3VFY3cWljdFZyZ1loS1RhOHIxYzdZZlZNcXY4Y0lhOG5S?=
 =?utf-8?B?VHRJbDFVYlZITXdDcVo5QjdhYkIrbFNESU1pU3BhQW92aEFSd2NmMSt3ZjJr?=
 =?utf-8?B?R08zM2FraWhENXJNMUZUOXRkZHFKLzBndDNvZy93c3ZRaVlhdHNJZUxCWFla?=
 =?utf-8?B?c1VSTHJ4RmlYMnRBUUoyYTZLTU5KczBWRDNLZmxKakRDTXlMbTdYR29wM3hF?=
 =?utf-8?B?OXZqMmNkR3dPMm9mTW1KT3pQbDREcVM4WVROcDZoSTlUWjMxc0RxMDFiWE5Z?=
 =?utf-8?B?dUljY3ZSdFRGMTNLS1c2RlJ4c2ZRNDF5ZE5WMHdHOE1WK3dmTW4wWS90OW9D?=
 =?utf-8?B?RzNucU40RmRhSk1ZUHgraXRyYkxROUg3M1I4dmtrSjYxTXJRYm5pNXhVcm5G?=
 =?utf-8?B?Vnoyemh0TlpmZ0xpTlNzd2NzOHpBdlRvTEVBQjhqdENFa3RvQkZZckY1U2Ja?=
 =?utf-8?B?dmtKanpOZjh6YlBtTDFIWThxanB3RUc2TmhsQ2pxRENOdFZIUWdTQ0FBQ2xi?=
 =?utf-8?B?M2JpZUxETi85SVgvWm5Bc1ZVbjdsN1hxazRYVWlZNlJsbmxWYXNLdnhOdWpo?=
 =?utf-8?B?QVRlTmFSd0NOOXVVTFdncXpiMHIxdXJWcWloandlMWlXOWZUZnJjOWxaWCtM?=
 =?utf-8?B?ZnAySTN5dUFQRi9teisxUXpYclJKN0k3cjkvdFhIN1NzeVpVazFESlh4RERQ?=
 =?utf-8?B?Ty9EeVc4RjBJMElyRkM0WktlNTgvWEFrRnFzZkM1UDg5NnU5bVRvSWwvSHox?=
 =?utf-8?B?WEFBU3RnRy92R1RmbVJ5VjlQRktESXVTQUdObi84UjhtcUZXYjNMSGxZVmh1?=
 =?utf-8?B?blpLYWlUMTkxTHdkQ2VDajIwV2JWZ2dCWGdseDVxV3RJWGViK1VCTmxqUkZ2?=
 =?utf-8?B?S0tMaFZxZitaYUVTYmh3dnh3N2FLa2JrYjU4SzEwb0dQRUh3K3I4T0ovamM2?=
 =?utf-8?B?ZVRLZ2FsU09BUFNPWWRkeE5acXMyaWpJcjgzUkZ5c3NLU3RPdDZ5QWZqNDBq?=
 =?utf-8?B?NmdzbWR2MUUzODRsMUJiZkxITmtibnpCNDVRcWVwNjYzZUQrTklNVDM4WjJt?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: beb0ae05-f63d-442e-34bf-08daabe542cf
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 00:03:58.4332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5h06DTwMszWKZMPbofr88E0nHWMox4geA+NryyNtub+DvV3bZ607eZGr7XhbZwG80snv6xHRltKJB9/0RLyvV+0XKkYcuT8vlTjUO81Hws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5320
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
Cc: Tony Ye <tony.ye@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/10/2022 15:57, Ceraolo Spurio, Daniele wrote:
> On 10/10/2022 3:50 PM, John Harrison wrote:
>> On 10/10/2022 11:48, Daniele Ceraolo Spurio wrote:
>>> We're observing sporadic HuC delayed load timeouts in CI, due to 
>>> mei_pxp
>>> binding completing later than we expected. HuC is still loaded when the
>>> bind occurs, but in the meantime i915 has started allowing 
>>> submission to
>>> the VCS engines even if HuC is not there.
>>> In most of the cases I've observed, the timeout was due to the
>>> init/resume of another driver between i915 and mei hitting errors and
>>> thus adding an extra delay, but HuC was still loaded before userspace
>>> could submit, because the whole resume process time was increased by 
>>> the
>>> delays.
>>>
>>> Given that there is no upper bound to the delay that can be introduced
>>> by other drivers, I've reached the following compromise with the media
>>> team:
>>>
>>> 1) i915 is going to bump the timeout to 5s, to reduce the probability
>>> of reaching it. We still expect HuC to be loaded before userspace
>>> starts submitting, so increasing the timeout should have no impact on
>>> normal operations, but in case something weird happens we don't want to
>>> stall video submissions for too long.
>>>
>>> 2) The media driver will cope with the failing submissions that manage
>>> to go through between i915 init/resume complete and HuC loading, if any
>>> ever happen. This could cause a small corruption of video playback
>>> immediately after a resume (we should be safe on boot because the media
>>> driver polls the HUC_STATUS ioctl before starting submissions).
>>>
>>> Since we're accepting the timeout as a valid outcome, I'm also reducing
>>> the print verbosity from error to notice.
>>>
>>> v2: use separate prints for MEI GSC and MEI PXP init timeouts (John)
>>>
>>> References: https://gitlab.freedesktop.org/drm/intel/-/issues/7033
>>> Fixes: 27536e03271d ("drm/i915/huc: track delayed HuC load with a 
>>> fence")
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Tony Ye <tony.ye@intel.com>
>>> Cc: John Harrison <john.c.harrison@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c | 14 ++++++++++----
>>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>> index 4d1cc383b681..41c032ab34b3 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>> @@ -52,10 +52,12 @@
>>>    * guaranteed for this to happen during boot, so the big timeout 
>>> is a safety net
>>>    * that we never expect to need.
>>>    * MEI-PXP + HuC load usually takes ~300ms, but if the GSC needs 
>>> to be resumed
>>> - * and/or reset, this can take longer.
>>> + * and/or reset, this can take longer. Note that the kernel might 
>>> schedule
>>> + * other work between the i915 init/resume and the MEI one, which 
>>> can add to
>>> + * the delay.
>>>    */
>>>   #define GSC_INIT_TIMEOUT_MS 10000
>>> -#define PXP_INIT_TIMEOUT_MS 2000
>>> +#define PXP_INIT_TIMEOUT_MS 5000
>>>     static int sw_fence_dummy_notify(struct i915_sw_fence *sf,
>>>                    enum i915_sw_fence_notify state)
>>> @@ -104,8 +106,12 @@ static enum hrtimer_restart 
>>> huc_delayed_load_timer_callback(struct hrtimer *hrti
>>>       struct intel_huc *huc = container_of(hrtimer, struct 
>>> intel_huc, delayed_load.timer);
>>>         if (!intel_huc_is_authenticated(huc)) {
>>> -        drm_err(&huc_to_gt(huc)->i915->drm,
>>> -            "timed out waiting for GSC init to load HuC\n");
>>> +        if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_GSC)
>>> +            drm_notice(&huc_to_gt(huc)->i915->drm,
>>> +                   "timed out waiting for MEI GSC init to load 
>>> HuC\n");
>>> +        else if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_PXP)
>>> +            drm_notice(&huc_to_gt(huc)->i915->drm,
>>> +                   "timed out waiting for MEI PXP init to load 
>>> HuC\n");
>> Hmm. It feels wrong to assume that the status can only be GSC or PXP. 
>> Granted, it certainly should be one of those two values if we get 
>> here. But it just seems like bad practice to have a partial if/elsif 
>> ladder for an enum value instead of a switch with a default path. 
>> What I meant originally was just have a single print that says 'timed 
>> out waiting for MEI GSC/PXP to load...', maybe with the status value 
>> being printed. I don't think it is critically important to 
>> differentiate between the two, I just meant that it was wrong to 
>> explicitly state GSC when it might not be.
>
> It is guaranteed that the state is one of those 2 in this callback. 
> The only other option is an error state, which we set from the 
> __gsc_init_error() below. I can make it an unconditional else, or add 
> an else MISSING_CASE(status) if you think that works better, but given 
> the errors we've seen I'd prefer to keep the prints separate for extra 
> clarity.
I agree a third state is theoretically impossible. Currently. But yeah 
the MISSING_CASE thing works if you think two separate prints is beneficial.

John.

>
> Daniele
>
>>
>> John.
>>
>>>             __gsc_init_error(huc);
>>>       }
>>
>

