Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 508E57E2842
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 16:11:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABDF10E342;
	Mon,  6 Nov 2023 15:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B6910E342;
 Mon,  6 Nov 2023 15:11:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oP2YNizelZJ+LiRx+8IQVKXJYYR91xviS5jeCecbTlDO4A3b11zAW4rH74jke6nRkcYyPCKZv/H5lGCSF565RLjJcMWZdH75FPpTgI+mskEySGnrtwdtFtdY09rLQlWukRn75uEgNbzo9n6Ed4dublc3A+2rm5G0+Rr0wxWKUdEalB5TTjn4/4CwXG5lUkdh9HGXFQ1Iv7cJR36JMkqzNhCT1u+85uchaolCSBiRp8H7ng7DxUCiVrcL8QsRmBfxiautDl0XJ8xB6o7NHZTWhn1ilqUJGlD3M6fJWwzJnU5MqsCb1NIjaS9zlBd8jG/Vy26p0UnuvbnjjkvQPmLaFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfugNjzrQwtVNFpaL8Gj/PyJzuCk7erxt/dxy5n3tL8=;
 b=Z5gXvFLhg0aeSHKxCtva1HKjFADtC5nk+M6FPWnWcYo2FCFetkjkbsWmxp05ph7tCqtXxmbgWZPHFRSsD7Acc279wyIh6J/tq1fkXuu1bAbUnkGgIBSWSPpAAGvdP+L/+i9GTeM8VIeKFh4vmD+CUTQA/T2xvCk//ZV7adnqx2T0vBsPv9AK99KW+EXfGhsQqoovIokLwgYbIKZhKMxGVG92LDhADjnOtSLYsDDhnrVbTwEk4JOWC+eIQPPaj0BqTsTFkDBnGp75G2X4iOw62L25yyR0wE2/cymoqAgQyZIDF1js/13XlRLZUrqN400sFtj2AVcUoD9tJ3Efh5iqFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PfugNjzrQwtVNFpaL8Gj/PyJzuCk7erxt/dxy5n3tL8=;
 b=jGRo0a67AfVe9UQlyf48DoJBr99TMeVdwHpZUMhmT2uGR2C3VKl+wcM/+KtWyRFt3Ak+aUhLx6wr5wR5HpaPULh2T2JZzoGd9my7/M0CLCyCtAjS3sU4HnIF9kUgwRH7r3jrycIdt87EBOSnAb2/B36BgoAvA6KTn+e4t8D77Jk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 15:10:55 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6954.027; Mon, 6 Nov 2023
 15:10:55 +0000
Content-Type: multipart/alternative;
 boundary="------------2P0mETAKNouDVomsGMRe5bZP"
Message-ID: <6d3c48f6-a92d-49b3-b836-ee1bc95b56bf@amd.com>
Date: Mon, 6 Nov 2023 16:10:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v8 09/12] drm/gpuvm: reference count
 drm_gpuvm structures
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>
References: <20231101233113.8059-1-dakr@redhat.com>
 <20231101233113.8059-10-dakr@redhat.com>
 <be93d9ef-3d3e-4262-a280-d2922b983ca1@amd.com> <ZUTyGTxcH7WlHKsv@pollux>
 <a2e13a27-d2e5-4ae3-9c11-c18b425b69cc@amd.com>
 <b533af44-0404-49c9-9879-3414d0964acc@redhat.com>
 <51dea5f3-a18b-4797-b4fa-87da7db4624a@amd.com> <ZUjZFFtLM435tTxJ@pollux>
 <8e87d962-c80c-40d9-94d7-58b6cd9dd794@amd.com> <ZUj0DdYZUgjhcvf5@pollux>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZUj0DdYZUgjhcvf5@pollux>
X-ClientProxiedBy: FR3P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: 38618e3a-c4c6-4391-0839-08dbdeda9312
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P9vqz1L9eTfSx1HhCtwjXXxcrkVEVc2pkI6ERSiDmkHU6LEXIOGztJLOsF4/N7KRoDUHtBBq04V5JNoS48rTEHU3vMTAGg2tXLJQyDd8z2kcKr9Iutdt7a4nLKfwbzlllYWecXjBpXZ+YypmrMr0/AeNqJ0tfxuPWBHMWij3Y/4QJ0PHc1AKTQe7cHBqRWkeC3gNzaNMATjCweanJYIiHRoHv9c4Z67I6OKfKisRG60T5VZGm3JKtkGSlWNN9cENfM9uEDtyiIr8T57vv+bWMerYadMxext/N9bio4bACtquYrufzWB4MBdnK/JDRiKgDqV3uv2WBkDH/86OMKxtzIDtUxfG8UfmKZzHxnOb2YXmp2IRg/PVq6T8h1kKEIj68joKtdNhcT0n4YCdiy9QcrqUtgifanl0nHRvTRlHN9BYA1yAmCfB8Xj3rSdOxVexBPmE20EmP1EvW6BWB0BeDjJh+4N3pf97frLKJKaBVZDqSB+q/64HDFz1qTGELl9GpcW7aDMAYj1LoJgiRyy/CrEybthKpd9VfSmK6p2ZiVT4AU4fhlBd1hW0btZ2a51SEs4ADnxOizyjPTlGvM1CLzCBXWmagIcZ+G7ErI+3Sk4Dy+0uWIm/FGE0MU8CMkWuikrrmUlYqeNwdW+AfpHF1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(346002)(39860400002)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(36756003)(316002)(66574015)(4326008)(8936002)(8676002)(83380400001)(26005)(66476007)(66946007)(6916009)(66556008)(5660300002)(41300700001)(478600001)(6486002)(6512007)(6666004)(6506007)(33964004)(7416002)(2616005)(31686004)(2906002)(31696002)(86362001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NW9aQ2NuUnhxeVNCVDIxeVdEbGlGaDg2bG5BVnNDVitoZFRPRmIyRTAralpR?=
 =?utf-8?B?ajBwcVNSSHpyMXBycXRxMWl1NWp1dlBKemNiVDZtRngxMkdzTUVzbXo5TnB3?=
 =?utf-8?B?VFE5Z0IxRDhyWGpwQ0FPZHpHRlJoYU9pZWhhdUhWVGJqZTJsMkQzbHBVOWp6?=
 =?utf-8?B?QXVaRzR2L1hMUmF2QTAwV2Uvcyt1TVhZQW91UXZrOTVyeTdrRER4eGZXUjVy?=
 =?utf-8?B?TXpkWlovWHlOeHQ0STJxUCtTUnZtTTJKZ2VNbWVwUnlUcStickR0RGFDd01W?=
 =?utf-8?B?NHlNRUl3TExvRUd4QkNJZnpTeUtLTUROMTdTZVJicUZRNEJKMElKS215VzFj?=
 =?utf-8?B?V3NZMDBIR0tJdWdZV0F1cHNKckdBLzJIK1d5VmRTZ21pRnNkYllwTU1GVnFz?=
 =?utf-8?B?ak1lRE9GUDA2cjhqaVpqQ1Y3SURqdGF3MXNwa1p6QzVKdTZ6ZnA5V1pQTUkw?=
 =?utf-8?B?Y2pBdmxDMTdidXA2eldTdHlPb0s3SUZEejIrWEQzNTExRS9nV2tPdjR3ckF6?=
 =?utf-8?B?OSt2dGtwc3hmSEhuWGNlclo0RWpUV1NMZmJOdE5ML2EwbXY2Y3I5WVNPUWVi?=
 =?utf-8?B?a1JjUXFtR1R6cmRpQTIyUVNkc1BtVEh0TVg3SVBZY0dVeEZ5WWQ0UnpYOThp?=
 =?utf-8?B?SlBtMGN0MnF2YlBKa283ZjUyVVJEV1o4NFE2eEczUWkzQWR2OTBFTEU5SHFG?=
 =?utf-8?B?SG96QXBaS1pkZGc0NHdOZ3ZCQ1NSQ0YxS0U5VHpEL0U1cmFjS0RPek05K0NS?=
 =?utf-8?B?OU5CdzFWRXNnZU9NdTJUNDY0c0Q5S1lFV2VzZGsyMi9FYnBXL21rOXdjRFEz?=
 =?utf-8?B?R2pSSVlsWVluYllPTEVGNWlJMUMwU1h3a1FjcDNRV1lhWjhtRSs4dGJEK1VV?=
 =?utf-8?B?UUtsNnBNeDg2TVJOWmVUOVQ3WE5tREhISjc5MUtpTUg1T0NPRzY5eDlidnJS?=
 =?utf-8?B?QVZjbVFaSHpuVWhIMDRRYUJLVmc4Z3N5NlJCRnROV0xEUjlIVGZkaGp2OTF2?=
 =?utf-8?B?ak44U1NFcWhaVTJ5MG5ZQlpQZlpvdDAxMmp3bVdLbjNvUGdBbVJHMU9wdTNi?=
 =?utf-8?B?NWRKUklWQktYbTdxc1JieDZYSnJ3dHd4bXR6LzRQcm5uRytWdGdlaUdqY1BX?=
 =?utf-8?B?bW5Zc0FHY2pNQTJwaFhiVjBLUXMvSFJ4NFVHUUhyUEgxbEZFclpLNjBTTHFF?=
 =?utf-8?B?L3JIZUhoSWhOTEVhb1orMXlzdDBsTHhwWXUvdmJYSkh2U3UzQnhFRjdpVWlK?=
 =?utf-8?B?OW9STjJwckhkMElZeGYrWHJQWDIrckp2VHFhVzJUVStTZ0JWRFRRVStKYmZq?=
 =?utf-8?B?WEpTRzlNcnBxaURubDlqWHYwcWRlWlJ4ZUJEdHlDV3ByU0xYMEZUbjJ0RDhY?=
 =?utf-8?B?Y0xrL29XaXR3VnYxcGFOcnpUQXUvZkFsd0I5UEtCYlJnT2JQQU95dFRUMEgx?=
 =?utf-8?B?MVRhay9VQ3FnbjROMjFHdFBsRlZuYVFWV0xOa3d3TmZ1c0JDYm1idG5JaG0v?=
 =?utf-8?B?Zm90bjZwRDNJT1g5ZUk0REhUaVJkWTlvOW1oZUZtSXg4c3pKakx3Q3RJeThB?=
 =?utf-8?B?dnBlRm1PMFJQT3RMY25meXFabzBsZmxTYjhsWGNmejNUemd2T1VXMzgvKzRv?=
 =?utf-8?B?S1ZvelpMbGtSTkZaMmhjTWIxRFFZSHFHeEhQRklBV3lhbE04MWUxdEFrNlVV?=
 =?utf-8?B?ZEJBMnVzN1pMT0swUFBMNEJPdkV4MU5rM3pSZi83M3ZMRk5DZXVwektGNWk3?=
 =?utf-8?B?RktzaDJlSkRJSTRVYzRkOGl5eDROYXRlalhqY3N6b3cwbVlyeUhKcmlWWU1m?=
 =?utf-8?B?UGswWDNuR2E0SDllOXk3NWxwcndMcU9PWENrdUZwOVpCTm9ZQU5JTUU2YkVh?=
 =?utf-8?B?RnVoT0tySGlxam5pM3g4aWlvWDdVUG1LMHNjWjZFV2M5TEgxVTIyQmlFNE9r?=
 =?utf-8?B?V3cyalh2Tnd1NFRiTU9HRko3MVZTNGtoZUUwQjluemFUVld6M1FWd0hKYVBQ?=
 =?utf-8?B?MUlseVYvVTZ6cE9BNFlSSDZGeGp4QW1vT2xJQjVkelBmaGNkcHJzdUR0NmRN?=
 =?utf-8?B?ektsODJwbThoNW5VU2FDVkxRSUpla2xSNXU5UnlxL0tSOU5KUGgvZW5KYUZI?=
 =?utf-8?Q?tx48=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38618e3a-c4c6-4391-0839-08dbdeda9312
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 15:10:55.6146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fw2eOVx/+yk6Q3eZoq9Vo4/NPR/OOpVj+4JU9xCukRwzD5/xJd70BeG8D2nsMrWf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6839
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 faith@gfxstrand.net, boris.brezillon@collabora.com, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------2P0mETAKNouDVomsGMRe5bZP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 06.11.23 um 15:11 schrieb Danilo Krummrich:
> On Mon, Nov 06, 2023 at 02:05:13PM +0100, Christian König wrote:
>> Am 06.11.23 um 13:16 schrieb Danilo Krummrich:
>>> [SNIP]
>>> This reference count just prevents that the VM is freed as long as other
>>> ressources are attached to it that carry a VM pointer, such as mappings and
>>> VM_BOs. The motivation for that are VM_BOs. For mappings it's indeed a bit
>>> paranoid, but it doesn't hurt either and keeps it consistant.
>> Ah! Yeah, we have similar semantics in amdgpu as well.
>>
>> But we keep the reference to the root GEM object and not the VM.
>>
>> Ok, that makes much more sense then keeping one reference for each mapping.
>>
>>>> Because of this the mapping should *never* have a reference to the VM, but
>>>> rather the VM destroys all mapping when it is destroyed itself.
>>>>
>>>>> Hence, If the VM is still alive at a point where you don't expect it to
>>>>> be, then it's
>>>>> simply a driver bug.
>>>> Driver bugs is just what I try to prevent here. When individual mappings
>>>> keep the VM structure alive then drivers are responsible to clean them up,
>>>> if the VM cleans up after itself then we don't need to worry about it in the
>>>> driver.
>>> Drivers are *always* responsible for that. This has nothing to do with whether
>>> the VM is reference counted or not. GPUVM can't clean up mappings after itself.
>> Why not?
> I feel like we're talking past each other here, at least to some extend.
> However, I can't yet see where exactly the misunderstanding resides.

+1

>> At least in amdgpu we have it exactly like that. E.g. the higher level can
>> cleanup the BO_VM structure at any time possible, even when there are
>> mappings.
> What do you mean with "cleanup the VM_BO structue" exactly?
>
> The VM_BO structure keeps track of all the mappings mapped in the VM_BO's VM
> being backed by the VM_BO's GEM object. And the GEM objects keeps a list of
> the corresponding VM_BOs.
>
> Hence, as long as there are mappings that this VM_BO keeps track of, this VM_BO
> should stay alive.

No, exactly the other way around. When the VM_BO structure is destroyed 
the mappings are destroyed with them.

Otherwise you would need to destroy each individual mapping separately 
before teardown which is quite inefficient.

>> The VM then keeps track which areas still need to be invalidated
>> in the physical representation of the page tables.
> And the VM does that through its tree of mappings (struct drm_gpuva). Hence, if
> the VM would just remove those structures on cleanup by itself, you'd loose the
> ability of cleaning up the page tables. Unless, you track this separately, which
> would make the whole tracking of GPUVM itself kinda pointless.

But how do you then keep track of areas which are freed and needs to be 
updated so that nobody can access the underlying memory any more?

>> I would expect that the generalized GPU VM handling would need something
>> similar. If we leave that to the driver then each driver would have to
>> implement that stuff on it's own again.
> Similar to what? What exactly do you think can be generalized here?

Similar to how amdgpu works.

 From what I can see you are basically re-inventing everything we 
already have in there and asking the same questions we stumbled over 
years ago.

>>> If the driver left mappings, GPUVM would just leak them without reference count.
>>> It doesn't know about the drivers surrounding structures, nor does it know about
>>> attached ressources such as PT(E)s.
>> What are we talking with the word "mapping"? The BO_VM structure? Or each
>> individual mapping?
> An individual mapping represented by struct drm_gpuva.

Yeah than that certainly doesn't work. See below.

>> E.g. what we need to prevent is that VM structure (or the root GEM object)
>> is released while VM_BOs are still around. That's what I totally agree on.
>>
>> But each individual mapping is a different story. Userspace can create so
>> many of them that we probably could even overrun a 32bit counter quite
>> easily.
> REFCOUNT_MAX is specified as 0x7fff_ffff. I agree there can be a lot of
> mappings, but (including the VM_BO references) more than 2.147.483.647 per VM?

IIRC on amdgpu we can create something like 100k mappings per second and 
each takes ~64 bytes.

So you just need 128GiB of memory and approx 20 seconds to let the 
kernel run into a refcount overrun.

The worst I've seen in a real world game was around 19k mappings, but 
that doesn't mean that this here can't be exploited.

What can be done is to keep one reference per VM_BO structure, but I 
think per mapping is rather unrealistic.

Regards,
Christian.



--------------2P0mETAKNouDVomsGMRe5bZP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 06.11.23 um 15:11 schrieb Danilo Krummrich:<br>
    <blockquote type="cite" cite="mid:ZUj0DdYZUgjhcvf5@pollux">
      <pre class="moz-quote-pre" wrap="">On Mon, Nov 06, 2023 at 02:05:13PM +0100, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 06.11.23 um 13:16 schrieb Danilo Krummrich:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">[SNIP]
This reference count just prevents that the VM is freed as long as other
ressources are attached to it that carry a VM pointer, such as mappings and
VM_BOs. The motivation for that are VM_BOs. For mappings it's indeed a bit
paranoid, but it doesn't hurt either and keeps it consistant.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Ah! Yeah, we have similar semantics in amdgpu as well.

But we keep the reference to the root GEM object and not the VM.

Ok, that makes much more sense then keeping one reference for each mapping.

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Because of this the mapping should *never* have a reference to the VM, but
rather the VM destroys all mapping when it is destroyed itself.

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Hence, If the VM is still alive at a point where you don't expect it to
be, then it's
simply a driver bug.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Driver bugs is just what I try to prevent here. When individual mappings
keep the VM structure alive then drivers are responsible to clean them up,
if the VM cleans up after itself then we don't need to worry about it in the
driver.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Drivers are *always* responsible for that. This has nothing to do with whether
the VM is reference counted or not. GPUVM can't clean up mappings after itself.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Why not?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I feel like we're talking past each other here, at least to some extend.
However, I can't yet see where exactly the misunderstanding resides.</pre>
    </blockquote>
    <br>
    +1<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZUj0DdYZUgjhcvf5@pollux">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">At least in amdgpu we have it exactly like that. E.g. the higher level can
cleanup the BO_VM structure at any time possible, even when there are
mappings.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What do you mean with &quot;cleanup the VM_BO structue&quot; exactly?

The VM_BO structure keeps track of all the mappings mapped in the VM_BO's VM
being backed by the VM_BO's GEM object. And the GEM objects keeps a list of
the corresponding VM_BOs.

Hence, as long as there are mappings that this VM_BO keeps track of, this VM_BO
should stay alive.</pre>
    </blockquote>
    <br>
    No, exactly the other way around. When the VM_BO structure is
    destroyed the mappings are destroyed with them.<br>
    <br>
    Otherwise you would need to destroy each individual mapping
    separately before teardown which is quite inefficient.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZUj0DdYZUgjhcvf5@pollux">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">The VM then keeps track which areas still need to be invalidated
in the physical representation of the page tables.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
And the VM does that through its tree of mappings (struct drm_gpuva). Hence, if
the VM would just remove those structures on cleanup by itself, you'd loose the
ability of cleaning up the page tables. Unless, you track this separately, which
would make the whole tracking of GPUVM itself kinda pointless.</pre>
    </blockquote>
    <br>
    But how do you then keep track of areas which are freed and needs to
    be updated so that nobody can access the underlying memory any more?<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZUj0DdYZUgjhcvf5@pollux">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I would expect that the generalized GPU VM handling would need something
similar. If we leave that to the driver then each driver would have to
implement that stuff on it's own again.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Similar to what? What exactly do you think can be generalized here?</pre>
    </blockquote>
    <br>
    Similar to how amdgpu works.<br>
    <br>
    From what I can see you are basically re-inventing everything we
    already have in there and asking the same questions we stumbled over
    years ago.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZUj0DdYZUgjhcvf5@pollux">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">If the driver left mappings, GPUVM would just leak them without reference count.
It doesn't know about the drivers surrounding structures, nor does it know about
attached ressources such as PT(E)s.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
What are we talking with the word &quot;mapping&quot;? The BO_VM structure? Or each
individual mapping?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
An individual mapping represented by struct drm_gpuva.</pre>
    </blockquote>
    <br>
    Yeah than that certainly doesn't work. See below.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZUj0DdYZUgjhcvf5@pollux">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">E.g. what we need to prevent is that VM structure (or the root GEM object)
is released while VM_BOs are still around. That's what I totally agree on.

But each individual mapping is a different story. Userspace can create so
many of them that we probably could even overrun a 32bit counter quite
easily.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
REFCOUNT_MAX is specified as 0x7fff_ffff. I agree there can be a lot of
mappings, but (including the VM_BO references) more than 2.147.483.647 per VM?</pre>
    </blockquote>
    <br>
    IIRC on amdgpu we can create something like 100k mappings per second
    and each takes ~64 bytes.<br>
    <br>
    So you just need 128GiB of memory and approx 20 seconds to let the
    kernel run into a refcount overrun.<br>
    <br>
    The worst I've seen in a real world game was around 19k mappings,
    but that doesn't mean that this here can't be exploited.<br>
    <br>
    What can be done is to keep one reference per VM_BO structure, but I
    think per mapping is rather unrealistic.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <br>
    <br>
  </body>
</html>

--------------2P0mETAKNouDVomsGMRe5bZP--
