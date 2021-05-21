Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4EC38C0E5
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 09:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD8C6F5C8;
	Fri, 21 May 2021 07:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE9F6E497;
 Fri, 21 May 2021 07:44:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5fkDKUEOL7tKgvwLrUDAodWK6i0oAceCiyj/0qpAPWslTszexbx8CHyq5soh9JyMnT+x14YUoxwxTRbscOkdLt2MpFGbbqKK79k3oPwRxXVnka2RiFVl5IXdYPvsdTJmaiIjxrynTb5HIeXEgAUKC8YeMzkMxo2U3MLWZvH71hpo0zhq0SQKqlDhkFzKuxbMUDii4K6kbFaka5PJJrYtXQvEoT/Sa6Yl5QlBsmERunobtrhB9m0n8Z2mqA2gda0Of6XEsGxIgTmhZ5j/BV6xyc8rcDdu+kcZlo31zPjXGCioz305TfMBzmgLovHodItDb2SCrMMrbs9ERLdn136HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4A4220F3xNGpXnaMd6VZUUXnC7fLpru2FRZe2UmD/YQ=;
 b=MaqKBxcX7gCnTcuCkv/9W+dYte8pNrPKp6kCbm8H7WQ8KVI/tnzav2RfJZzf28vEl1ETU4jWKdXdUxjW2LbWIgidsZfHXbgUV2PV72EIvvxSARafemQIebsBYPwMrWMreJ0VYoROffY3if2jgZpSI6mfobLX/2le7ARdHmcUaMkdaSL4+ubY7LTYsOtTp9YLp+JnCQLpb1rW50iawTW9+rHGGS+yIYIgtGBbPPSRbtOU7K+kIDR4Cz8FGeqNTAxNDE8+Fu3f3EhXzLjhLnMhNggQSZgzU2ufU95GQhy+R1+Ncsz5QrAQx+fb+vMtSm23STTYn5pdjCsxmyiFKSR7sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4A4220F3xNGpXnaMd6VZUUXnC7fLpru2FRZe2UmD/YQ=;
 b=1yf+q/LEuYGKsaWeOBIe7E2MMSDB9Ug/b5MmUiU+Jb2bFoNnvcOmPErl0Ys4vrKBcQ6w1p1rC9YCf/D55HqVZEJ6xEQckE5ZEIWFk7VFlqe5vi0fnalyScvVVjQy4wWu10mdMxA4p0VjDBEaWHH4/19VRJzVsJxCaA0/k4de9II=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Fri, 21 May
 2021 07:44:05 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.023; Fri, 21 May 2021
 07:44:04 +0000
Subject: Re: [Linaro-mm-sig] [RFC 1/3] dma-fence: Add boost fence op
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210519183855.1523927-1-robdclark@gmail.com>
 <20210519183855.1523927-2-robdclark@gmail.com>
 <8dcdc8d5-176c-f0ad-0d54-6466e9e68a0a@amd.com>
 <CAF6AEGtg_VnxYrj94AfbAfViK1v8U0ZJyfJjS4taVLMF=YVy+w@mail.gmail.com>
 <d65acf46-4c3b-4903-6222-0b81915d355d@amd.com>
 <CAF6AEGvm1tFwpfyJrX1bTGoHg_wzKKLQvSk2qLHf3XeqvEzDPA@mail.gmail.com>
 <e8f3d71c-7025-deab-4dd7-14f3fa6a8810@gmail.com>
 <YKaPf3VLfjoZJRw7@phenom.ffwll.local>
 <4244879a-e2b8-7994-e3fb-f63c0e115a2c@amd.com>
 <CAKMK7uHROqWzTaG-JDzd343WJJiJCbzEOCZ++oCmKrQJAQgo7A@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <17f7e755-fce2-b7cf-dd6f-0a0dec618bba@amd.com>
Date: Fri, 21 May 2021 09:43:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAKMK7uHROqWzTaG-JDzd343WJJiJCbzEOCZ++oCmKrQJAQgo7A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d]
X-ClientProxiedBy: AM8P191CA0026.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::31) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d]
 (2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d) by
 AM8P191CA0026.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Fri, 21 May 2021 07:44:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 404b7a21-126d-4a34-09d4-08d91c2c3526
X-MS-TrafficTypeDiagnostic: MN2PR12MB4357:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43577D07E67D86E09A3571BB83299@MN2PR12MB4357.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ePlJVFSI+MkCe72g2wyRk7VzUi3V9UTf7IR6idii2jRds78LL9AjoLhOjl7adTs9zTjKvhfE9lGTLWhwkDY8bv9ry56ABXF/Mj264abPCidZtA5ToOLsT/veA7/Jc39T8ngK4brHnnA1q1D/pFREwO4s3svcOKRTrGxeNkypt2pRseN88QiUQdqoBz3iB/0Tig1uUUKjwleNRr2GaHr7AZpWkcGofYBso6mph/vFJLuPDqD1f3nNG81Xmsvdlj9tJ+i/tKkmkalvjYUbWWl0kRbbwbQqGZFPgF2fexFyubDfnQZXdha2yFArPVy3NkFsRo6n6rREJvRWDlk5dtOryyJ+9SSpi7F/CxKajMG5wstZI4lgC4Rm4V9W1cu7GdG7wPNTLZcHE+723AZx1WScJ1nM/gw7O+99a0UUTBoHCXaX8arwiGelXDqpCeErPzZydiHdVaXruPa5NuKerEcFtc8CQ3qjxukDA8whMygzc7DhQSdbxX9LePIv4GCqAJUpMvVDTpTnGV4R9E+4rsvHrkBLeMSYFMXzWE2CpZprfPMxXwsm3A+fOLuwe7mdaEF2DFRHsM79KkX1uLiT3jRIooU+wPft5KvhmpAYPXkDe5+eycqbO7O2+Hrx7p3seNt0q7OB24gHTj3u15Zy9nGqyXEmFPmIhMavkWzw2ie6D15MCn2P1kK4tTRu1vqpjI6+Hh4UwPccTZbv+FQoMA/cWZxIV0CEg3d333quCHkp1BPSUyvHc8bG6Yd+Z77CAmDfYJyTmhsL0qEAeVpJWoiit2UUkZjon+ytMoJrWwuovNE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(36756003)(31696002)(966005)(31686004)(2906002)(86362001)(38100700002)(2616005)(8936002)(45080400002)(478600001)(6486002)(54906003)(186003)(5660300002)(6666004)(7416002)(6916009)(4326008)(66946007)(66556008)(52116002)(83380400001)(16526019)(8676002)(66476007)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Zk1nNXUzblFZQTNTbDR1aFRMaElQbHlhNHA5VllCeldpRzlqNi9LZkJSSWVR?=
 =?utf-8?B?VWpBWDFZTVJMSXliS1U5S3dNNmxFNEJWYXFsUEwyUndEMTBWSnJrSjIvNG5y?=
 =?utf-8?B?R1VQUElTTlhLK2VvNUJKWUdUVWg2RDhmUFBDWWpwaGs5VGRVNXl1T3BmejVq?=
 =?utf-8?B?Vk9IaGVyRklIbUR0RStUdFlJSkFUZVJldkJxdEY5L2xyUXhBTUd1K0l0Sm90?=
 =?utf-8?B?Tm5iVldXNStVRnNsN0FxVjYxZjRNTDlwa1hPR0d3YmNFSGN3SWRpSlJpVW9Z?=
 =?utf-8?B?KzBzV2pmYVMwV3lhN09Nb1E0WVArK09Gclc2RExJOTBDTUlTeTdEWHhpRndL?=
 =?utf-8?B?cHJCd21YeVFYSFVZODhyb2xuZjRzME5xdzRPSW12ZExKaE40YXVaRWpyODVh?=
 =?utf-8?B?b1dRbGtpZ3dWN0tsYXBrMnJ3cDlEYVZuUWdNTGVkYmI5a1E1SEtrWllIU3Ex?=
 =?utf-8?B?dG1nMno1Sjl3ZUJWZVh5SWJxN0RVTWhJMTUyOGluUzRYTmU3bU5mTm9JTkMv?=
 =?utf-8?B?dTRabmd6V0Q3dEZidmlnTThxdUZnbDZEa0xzemkwT0hxR2dhSy9tWmpUTy9h?=
 =?utf-8?B?QnN5d1k0NWpLUk1pNXF1S216Vm9HZmYxNjltd2tNUk9QaXFqelRPQjhaeVRs?=
 =?utf-8?B?N2pnRlNqT0tLQWVRRmF2QUJkN0VabVlSVVZxZXljZG9WRVRIcFJxUTMrNGpJ?=
 =?utf-8?B?dlFjL2lVb211UDA0ai9mck9rc0NyZzd3QUZ6Q0xRWFN4TE50U3lkM3VRc3Rr?=
 =?utf-8?B?WlRtbTVTQTh0RGZmTHo0dDl1VXViRmhJTldqSlZJd1Fxc09kbzkzNTNvc0s1?=
 =?utf-8?B?bFJ1enRYNTlCa2dZektkTUV1b242Mzh2UENxcHVVWGx2R3FkV3dDc20rRzNo?=
 =?utf-8?B?bng5S0hqbDhGNC9YTko5ZW1KeURuWkVFRzQ5V2JBd2NlbUM2ZkRvT2JhUUow?=
 =?utf-8?B?cUJ2WEo0dnEybG5uSGgvTVc1bE94RzdmWkdZMDg2ajV0RjUwdzE3SVNGNy9a?=
 =?utf-8?B?UEthRjhhYnZGdGVzNFhBL25yZ2hvSjdyemVWc2RJd3JkWXF1d0JJbFdTNDVU?=
 =?utf-8?B?anIzOEhJTWdVdS9qajdtNC9DdVlLM3dNeDc4bDJNUzJEaGU2cHBHNFlDQWFt?=
 =?utf-8?B?dFF3SlVGb1hzTkVNeGxJdTdQQVdmMko0TXByQUVkaEFsQW9HNmM3NnJ3NzBw?=
 =?utf-8?B?V1Q0YjdqQUh3RmgxbWdCeHNJMUwxckdSMTBPQ2NiTEtabWo0SXU1OXlDeEVD?=
 =?utf-8?B?MkxiaThzUWtEUmljdHNmYUE2eS95Mm9oYUxHeWZyeXlPZE01QjhTL0VxN2VM?=
 =?utf-8?B?NlpTN29NZ0pSNHgrVUFibm1nU3FqNFZYZGlnWDM0SkxGK1NPVnQ4TVpnZ2hU?=
 =?utf-8?B?R1pFMjRCOEFhTGQzVWIycVFNeXpTQmFlMUpoQkZvWE53cEJxNjNGYkc5YWRi?=
 =?utf-8?B?eWxWYUFtTEVoaHo0UDNYMkt3ZktEbEFTdE92ZEpLRHp1dFQraUw5YXNSOU53?=
 =?utf-8?B?dkpwdVB6QWJNZVZvdnhHdWpsQllWMkFDRkRjeVY2ZzlGK0I2R1ljTFhCcDdV?=
 =?utf-8?B?d1drY2NDR2ZHY1QwL2E1bkQrbnh1MVFRZnBQZVNYazVvS0g4NWRBaXlHZS9v?=
 =?utf-8?B?Tk8wZjFFNkpQamo4NHJUT2xHaS9ERXN1a1hQd0hrc1E0NEZmWkFqdG5Uc09i?=
 =?utf-8?B?QlVyTHQ2VWtxdWZDRHNHUFFNK0VObS8rMFU3Wmx3QUYvOXhMbkw2RktKZU9n?=
 =?utf-8?B?anRQemZVOGN1NkVERmRabEVQdDc2M2pVWUVvOUtla0FQZlVHbEVhYzhpK0ZJ?=
 =?utf-8?B?UWFCQUh0cUJXbGFtcng2YlBZSXFBVzhubTlRbFpINUxlOGZFNWRtaFBVSlQw?=
 =?utf-8?Q?1zORJ0HkZgOnR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 404b7a21-126d-4a34-09d4-08d91c2c3526
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 07:44:04.8018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UdshBjQp9rr/a91RBhQ2pAXF6eo0hv6Ti3pCHEYO5AwwqvaCGKtO6UgJnjzlXnAB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.05.21 um 19:08 schrieb Daniel Vetter:
> [SNIP]
>> AH! So we are basically telling the fence backend that we have just
>> missed an event we waited for.
>>
>> So what we want to know is how long the frontend wanted to wait instead
>> of how long the backend took for rendering.
> tbh I'm not sure the timestamp matters at all. What we do in i915 is
> boost quite aggressively, and then let the usual clock tuning wittle
> it down if we overshot. Plus soom cool-down to prevent
> abuse/continuous boosting. I think we also differentiate between
> display boost and userspace waits.

I was not thinking about time stamps here, but more like which 
information we need at which place.

> On the display side we also wait until the vblank has passed we aimed
> for (atm always the next, we don't have target_frame support like
> amdgpu), to avoid boosting when there's no point.
>
>>> So boosting right when you've missed your frame (not what Rob implements
>>> currently, but fixable) is the right semantics.
>>>
>>> The other issue is that for cpu waits, we want to differentiate from fence
>>> waits that userspace does intentially (e.g. wait ioctl) and waits that
>>> random other things are doing within the kernel to keep track of progress.
>>>
>>> For the former we know that userspace is stuck waiting for the gpu, and we
>>> probably want to boost. For the latter we most definitely do _not_ want to
>>> boost.
>>>
>>> Otoh I do agree with you that the current api is a bit awkward, so perhaps
>>> we do need a dma_fence_userspace_wait wrapper which boosts automatically
>>> after a bit. And similarly perhaps a drm_vblank_dma_fence_wait, where you
>>> give it a vblank target, and if the fence isn't signalled by then, we kick
>>> it real hard.
>> Yeah, something like an use case driven API would be nice to have.
>>
>> For this particular case I suggest that we somehow extend the enable
>> signaling callback.
>>
>>> But otherwise yes this is absolutely a thing that matters a ton. If you
>>> look at Matt Brost's scheduler rfc, there's also a line item in there
>>> about adding this kind of boosting to drm/scheduler.
>> BTW: I still can't see this in my inbox.
> You've replied already:
>
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210518235830.133834-1-matthew.brost%40intel.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Ce4f3688b832842c4236e08d91bb1e148%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637571273080820910%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=uk3Gs%2FW42BDqMuMJtujcAH5GvN8mOlDnmywK8x1I%2F0k%3D&amp;reserved=0

Yeah, but doesn't that also require some changes to the DRM scheduler?

I was expecting that this is a bit more than just two patches.

Christian.

>
> It's just the big picture plan of what areas we're all trying to
> tackle with some why, so that everyone knows what's coming in the next
> half year at least. Probably longer until this is all sorted. I think
> Matt has some poc hacked-up pile, but nothing really to show.
> -Daniel
>
>> Do you have a link?
>>
>> Christian.
>>
>>> -Daniel
>>>
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> BR,
>>>>> -R
>>>>>
>>>>>> Thanks,
>>>>>> Christian.
>>>>>>
>>>>>>> BR,
>>>>>>> -R
>>>>>>>
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>> Am 19.05.21 um 20:38 schrieb Rob Clark:
>>>>>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>>>>>
>>>>>>>>> Add a way to hint to the fence signaler that a fence waiter has missed a
>>>>>>>>> deadline waiting on the fence.
>>>>>>>>>
>>>>>>>>> In some cases, missing a vblank can result in lower gpu utilization,
>>>>>>>>> when really we want to go in the opposite direction and boost gpu freq.
>>>>>>>>> The boost callback gives some feedback to the fence signaler that we
>>>>>>>>> are missing deadlines, so it can take this into account in it's freq/
>>>>>>>>> utilization calculations.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>>>>>> ---
>>>>>>>>>       include/linux/dma-fence.h | 26 ++++++++++++++++++++++++++
>>>>>>>>>       1 file changed, 26 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>>>>>>>> index 9f12efaaa93a..172702521acc 100644
>>>>>>>>> --- a/include/linux/dma-fence.h
>>>>>>>>> +++ b/include/linux/dma-fence.h
>>>>>>>>> @@ -231,6 +231,17 @@ struct dma_fence_ops {
>>>>>>>>>           signed long (*wait)(struct dma_fence *fence,
>>>>>>>>>                               bool intr, signed long timeout);
>>>>>>>>>
>>>>>>>>> +     /**
>>>>>>>>> +      * @boost:
>>>>>>>>> +      *
>>>>>>>>> +      * Optional callback, to indicate that a fence waiter missed a deadline.
>>>>>>>>> +      * This can serve as a signal that (if possible) whatever signals the
>>>>>>>>> +      * fence should boost it's clocks.
>>>>>>>>> +      *
>>>>>>>>> +      * This can be called in any context that can call dma_fence_wait().
>>>>>>>>> +      */
>>>>>>>>> +     void (*boost)(struct dma_fence *fence);
>>>>>>>>> +
>>>>>>>>>           /**
>>>>>>>>>            * @release:
>>>>>>>>>            *
>>>>>>>>> @@ -586,6 +597,21 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
>>>>>>>>>           return ret < 0 ? ret : 0;
>>>>>>>>>       }
>>>>>>>>>
>>>>>>>>> +/**
>>>>>>>>> + * dma_fence_boost - hint from waiter that it missed a deadline
>>>>>>>>> + *
>>>>>>>>> + * @fence: the fence that caused the missed deadline
>>>>>>>>> + *
>>>>>>>>> + * This function gives a hint from a fence waiter that a deadline was
>>>>>>>>> + * missed, so that the fence signaler can factor this in to device
>>>>>>>>> + * power state decisions
>>>>>>>>> + */
>>>>>>>>> +static inline void dma_fence_boost(struct dma_fence *fence)
>>>>>>>>> +{
>>>>>>>>> +     if (fence->ops->boost)
>>>>>>>>> +             fence->ops->boost(fence);
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>>       struct dma_fence *dma_fence_get_stub(void);
>>>>>>>>>       u64 dma_fence_context_alloc(unsigned num);
>>>>>>>>>
>>>>> _______________________________________________
>>>>> Linaro-mm-sig mailing list
>>>>> Linaro-mm-sig@lists.linaro.org
>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.linaro.org%2Fmailman%2Flistinfo%2Flinaro-mm-sig&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Ce4f3688b832842c4236e08d91bb1e148%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637571273080820910%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=lOOKD4J4h7byys2ifx0Ibn5vVr9gwZGGGsgrNmaymc4%3D&amp;reserved=0
>

