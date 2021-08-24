Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7420F3F5B49
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 11:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D7289C59;
	Tue, 24 Aug 2021 09:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 903 seconds by postgrey-1.36 at gabe;
 Tue, 24 Aug 2021 09:50:15 UTC
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (unknown
 [40.107.101.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9526589C59;
 Tue, 24 Aug 2021 09:50:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIx06qxmjxTDnc1xCGbD2VaodGXNHVjqo+cW4XsoDkgj96F+ZuGpDJEvRTcgVid+kkIJqv8ViQbLCZi5HkTciglREDrUdIjyrX7YreV+E+RvfM3RVcjuU4Oixu/FOCFiFfYe/bNOlWynfLbZJEDTNwxkni3qcm2Jpv/0IcQ/CjtH5rCcAl/wM3GfRlsi396T8AYlW5sH7GDzNyEcU1FnoID/9ysCxBZl6JyLpE4qnBacqDCC2IOor9yXCjsxaCICsXam0GgMWsxZvmec1ouCc/mlUP4WycT+KigVjA9UvubApV0RiyhHwCJiqkTlD1slxYJejy01MIeU992uljcYXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QN3C9i5dhISP02nrXNm8o/9tYnteX//i1vyuw6PBMeY=;
 b=AI2QCGJSMbfa14tvEeVkIt/sxxHjps8Kjq6Njht3SnqCX7jGjDzRLLcTzRgquepIhsAd6S5HHAN0PgBJ3OX1gKaOkw06yOKfVNlIsiUZIBsGV0zYcOnBm2lgdgxIglRVaLmsVMs2jYbS347X5hyFydZHPVQ27Qv805TBh/1ZIBxzFpJTbzen0770s1E35cLb56j8kCRq4nU/4LRRox8IPpiSuzAMVfTa9t7PjcdS/yoHM4nRvFtfffROxDfgkClgfHUrCAp7SnIknUJTSn7+MlYWAMzM0K8153PHr37Zh4bImssYsp272G8k5OGN9u0N1fDsi5VSoCqxbQ1Ma2RSDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QN3C9i5dhISP02nrXNm8o/9tYnteX//i1vyuw6PBMeY=;
 b=BPJjVxIYtzy37DIEln828mpcXEOIX3XLkfZQo2MLlJkNkkuMN519GuubHbIf0ZAptGEPtAk3NxvVjzwqamXSl7pzg3jkQUZxHM8cgvbxwkJeFLeyGFYjFLF6kbkG/t18QY6Qtkvym0IGqMeAcL8Ykrne/sJigtDMLAerv+W7Ves=
Authentication-Results: fooishbar.org; dkim=none (message not signed)
 header.d=none;fooishbar.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4705.namprd12.prod.outlook.com (2603:10b6:208:88::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Tue, 24 Aug
 2021 09:35:10 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4436.024; Tue, 24 Aug 2021
 09:35:10 +0000
Subject: Re: [RFC 6/8] drm: Document fdinfo format specification
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin
 <tvrtko.ursulin@intel.com>, David M Nieto <David.Nieto@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
References: <20210823112859.103561-1-tvrtko.ursulin@linux.intel.com>
 <20210823112859.103561-7-tvrtko.ursulin@linux.intel.com>
 <52ba613b-be4b-b9f4-5a9e-91c772b810cd@amd.com>
 <337f3b5d-f903-1eb4-9597-d00191dc8788@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a58beb1f-d88f-5006-cb65-fce277f5cb61@amd.com>
Date: Tue, 24 Aug 2021 11:34:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <337f3b5d-f903-1eb4-9597-d00191dc8788@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM9P193CA0007.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::12) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.21] (91.14.161.181) by
 AM9P193CA0007.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 09:35:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26c3da49-8e10-4926-60a6-08d966e27759
X-MS-TrafficTypeDiagnostic: BL0PR12MB4705:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB47058827918C42829433EF6E83C59@BL0PR12MB4705.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j32Nque5wQNjDiDq8/gECmYnfSnMdz3n1ewr+vloWSq+RDmwKzb5ryVnjSnm+5O0FhhAgm1m6Sy66NHWYGX2PVnXw5xUFOX+P1SOpxqjDW4upJfMrct3sO53NinQXQKBuvlm6udgTkhFVOYkD1Cy0ff2P90CPfKDZQgyGliihGRCyLSwJa+8DMmdqpBIEb1SGjkr95CEm96JcH1z1G1cGe9peXrvRzkBz5iu+blvuPfxDEjSPZEz9/cHLZ4NbLO1mIVrIIcM0/rCZbk+xcwkFBx/dDEjRE05c1nE9Ss7/r1InLeitJOWqIus4PhmA9p+YQQK0KVWIPNBgheWU6pwR3C7tjAFeTfXBvQOFfkUUY/Y6k8kAg4oaeILdRSticChnbNh2C9EuakXxaGfMYunOxR6x1i3cItuoXSWW6q41REmEVc8B3iLMdZk9L6WxRgXnnPZIivWDvKnacDxUfyH86FEnQb7K+zd91/3BBoY3Fgm5yoOCqQy5KxdDY1s1MMN4zifGOSUzBr7E+Qz9WmOBhi5xzcVfmyhWUtsn1p/gArFjBJJVsgFGzQnhovwsIftaVK//zyjtpKWVD4IIBxZUa8zOWra9+6QmJScb10UuwJGmP8BlaMxRQFvZJV0Jps7TIP5pskTQN0f6GwSV5S6qY3uQjJlNPKMrMGI6kKDLWbIGJU/B+w1dUmtacvhkNY7zSwlMmuiToNHDpbajxJN2ZFWuhsHYKl4RsqnKDr12+8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(86362001)(8936002)(6486002)(36756003)(5660300002)(2906002)(66574015)(478600001)(38100700002)(54906003)(53546011)(66556008)(83380400001)(26005)(6666004)(316002)(16576012)(31696002)(4326008)(31686004)(186003)(66946007)(66476007)(2616005)(956004)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFFSWVJRMm5qVEJjdkIyWVpjR1ZKWjl2bGtxVmhOdHltbWpLVHVjRlAyU21E?=
 =?utf-8?B?TE9valZpaEFVZnlDdGVjOXRUcHd5d0FPaGpoN0M5d01WTlpSZG15TEJCc1p0?=
 =?utf-8?B?RnRTRjFWZ3E5Sm9hMFQxYVQ3blRZSkZ2SXRPY3IwSnZDTm1SUS9Nc3llYmtp?=
 =?utf-8?B?TS9mY3l1VGJHSlQzaUJJL3NOMEZuMnVOdjdxUlZYYTJWRnI5MjBaSUNjNEE5?=
 =?utf-8?B?K2FVUmRrbTFGNlVXaFhUZlhQdmIvR3R6ZmFrdnFIRmtxVVVERlNWanh0dFUv?=
 =?utf-8?B?Mmd4aHNNL3F0WTFOeS9RQmdQL0dRTmt0ZCtyOUFadjFpZWtNWTI3ejNWRXNp?=
 =?utf-8?B?UWJySVZ4MmNjMGxVbERRVU9Kc3dvb2w0UFB4MzZXTGFMRm1NMVhtd0djT053?=
 =?utf-8?B?VWhjbXlySDhFU3UrS25Mc2ZXdFF4UVZ4bG1oUmgrN1RSakcyS1J5R2d2b25J?=
 =?utf-8?B?ejBadG13U0R3RUtYMm1LVk5KZDVmTm1penJ4NDdwdTdpWnhhd0lSZnliRzBp?=
 =?utf-8?B?WHkzYnlSRWhIZDBUZEJHUVNHQ2hOaWRaSWtHRy9XMUlBMUNlUGZacTZ2ZWZD?=
 =?utf-8?B?MEM5aVk5ay9EdzVJK2ZEejk2MlZrNFVwMEF3bytSR0tLUjZjdTVpcGtrV1N2?=
 =?utf-8?B?N0NhYlVoUkdpNE5iV1AxY3cvSlBKRTV6ZDF5cVF5M1IvaTdkNStPUk44TFZF?=
 =?utf-8?B?Ulk3UVdEd1RNT2xqdmk2MVVFbnJrV3J0WDRnVjM1SzVvYy8rdHMrVnF0R3lG?=
 =?utf-8?B?dDlremFBQWVpc1g5M3Bzd0pFamdtd210cU1wTDFMQlJFejdkZVFraEhxK3ZB?=
 =?utf-8?B?aVhUUFhkaE9CSUNhUk9QaThhbXdtZ04ybUNJWm1MOVF3bzB3RmFlT2MxamxX?=
 =?utf-8?B?a1ZZK3FObjNwekdMZXJkNzFwV3cxNnVsUytnWXV1UEtYbkFQWTR4enpqTjRz?=
 =?utf-8?B?b3EwN0VEZVNLSTdIWmx5SDFHY0JYN2c4UERnQWgrMkMwOG85N3RQSTlLdWxY?=
 =?utf-8?B?VkZrRVpkVUREUWhwY2RpWXB1bmhOay9vdWJXTko2N1c4Ly9tWkw2MDJPNTAz?=
 =?utf-8?B?NGxwMlNXcVZ0WUx5VmdNc0FWMGdFRFk1cGpsVzluRmRzRDhMVGNBaytIMlho?=
 =?utf-8?B?ZlI4bzFGUk5jMkRHY1hURDVFZk81QzhweVJNMXB2eEhkZ1lDM0V2bS82S3lC?=
 =?utf-8?B?SmwxR1ZRTmZGOWhlaXQ3TjlmeWlsRkVkNTF5M3hBRTdJa1JTSThCRStvZUtO?=
 =?utf-8?B?S3lkWWM3d3RRMEsyRmllQ3A3SmY2Z084MzA4TVEwS2VXb1NCMldndll1Tmxw?=
 =?utf-8?B?Qy9oKy9zUEVpZVJ4dkdndk5wcmJodUVWZVplMm9QWmEwTkhUTW4rNXZIVkl4?=
 =?utf-8?B?UVVZMkNoVEc5bHFabzFFQVYreFZoZFAxdzg4WkJqOHh5OFk5REdEWXRhN0Zu?=
 =?utf-8?B?TS9nOFNxU2ViYms0MXFLOHVoZlBmbURDQTY3ei9SV3hSSmQ3ZHQ5Zko4T0xx?=
 =?utf-8?B?YlN5eFQrNjd4NUw5aG1laDZzeGVmMXU5M3pZOVVNWnNQOVdRNlF5V2p6YjZ5?=
 =?utf-8?B?WVlSSkFkRzEyTGt1SmQyaTY0UHlZQkpQY2VHOFZRWW9PM0htVEozMmdGZjlu?=
 =?utf-8?B?V0EyMWwvRXQ2SkNwajJHU0V2SVJJemd5blRDNldwVDUrZXV1ZGZ3VWJnOVFm?=
 =?utf-8?B?aCtyOGJjS2Znc2tHSVJLNEtNKzZaYUVXWVB5T0I4WG44OFZXNmlxdGhvR2FR?=
 =?utf-8?Q?afsT3V3LrRo765M8XMk+LU0tmD5Yhl8TiMEPWDo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c3da49-8e10-4926-60a6-08d966e27759
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 09:35:10.3192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnG499z2Pe7tKSLqlPETX4c5H2kxTCkBTq99g8Y0sriwd47PoaqNt5wwNBNYdvdt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4705
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

Am 24.08.21 um 11:25 schrieb Tvrtko Ursulin:
>
> On 23/08/2021 14:32, Christian König wrote:
>> Am 23.08.21 um 13:28 schrieb Tvrtko Ursulin:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> Proposal to standardise the fdinfo text format as optionally output 
>>> by DRM
>>> drivers.
>>>
>>> Idea is that a simple but, well defined, spec will enable generic
>>> userspace tools to be written while at the same time avoiding a more 
>>> heavy
>>> handed approach of adding a mid-layer to DRM.
>>>
>>> i915 implements a subset of the spec, everything apart from the memory
>>> stats currently, and a matching intel_gpu_top tool exists.
>>>
>>> Open is to see if AMD can migrate to using the proposed GPU utilisation
>>> key-value pairs, or if they are not workable to see whether to go
>>> vendor specific, or if a standardised  alternative can be found 
>>> which is
>>> workable for both drivers.
>>>
>>> Same for the memory utilisation key-value pairs proposal.
>>>
>>> v2:
>>>   * Update for removal of name and pid.
>>>
>>> v3:
>>>   * 'Drm-driver' tag will be obtained from struct drm_driver.name. 
>>> (Daniel)
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Cc: David M Nieto <David.Nieto@amd.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Daniel Stone <daniel@fooishbar.org>
>>
>> I'm not an expert on that stuff, but as far as I can see this totally 
>> makes sense to me.
>
> Thanks!
>
>> Feel free to add an Acked-by: Christian König 
>> <christian.koenig@amd.com> to those three patches.
>
> However note that the last one is full of TODO markers, including the 
> commit message, where I was hoping to nudge the feature owners of the 
> amdgpu side to fill in the blanks in my understanding of how things 
> work over there. At least the different semantics need to be 
> documented so random userspace can interpret the amdgpu values correctly.

Yeah, that's the reason why I only dare to give an ack. David is driving 
this at AMD.

If you ask me exposing ns like the i915 wants to do is perfectly 
sufficient for us as well.

Regards,
Christian.

>
> Or alternatively I drop the last patch and if someone is interested 
> they can resurrect and complete it at their leisure.
>
> Just not sure how Daniel would accept this since his push was to gate 
> i915 addition behind a drive for common solution.
>
> Regards,
>
> Tvrtko
>
>>> ---
>>>   Documentation/gpu/drm-usage-stats.rst | 97 
>>> +++++++++++++++++++++++++++
>>>   Documentation/gpu/index.rst           |  1 +
>>>   2 files changed, 98 insertions(+)
>>>   create mode 100644 Documentation/gpu/drm-usage-stats.rst
>>>
>>> diff --git a/Documentation/gpu/drm-usage-stats.rst 
>>> b/Documentation/gpu/drm-usage-stats.rst
>>> new file mode 100644
>>> index 000000000000..c669026be244
>>> --- /dev/null
>>> +++ b/Documentation/gpu/drm-usage-stats.rst
>>> @@ -0,0 +1,97 @@
>>> +.. _drm-client-usage-stats:
>>> +
>>> +======================
>>> +DRM client usage stats
>>> +======================
>>> +
>>> +DRM drivers can choose to export partly standardised text output 
>>> via the
>>> +`fops->show_fdinfo()` as part of the driver specific file 
>>> operations registered
>>> +in the `struct drm_driver` object registered with the DRM core.
>>> +
>>> +One purpose of this output is to enable writing as generic as 
>>> practicaly
>>> +feasible `top(1)` like userspace monitoring tools.
>>> +
>>> +Given the differences between various DRM drivers the specification 
>>> of the
>>> +output is split between common and driver specific parts. Having 
>>> said that,
>>> +wherever possible effort should still be made to standardise as 
>>> much as
>>> +possible.
>>> +
>>> +File format specification
>>> +=========================
>>> +
>>> +- File shall contain one key value pair per one line of text.
>>> +- Colon character (`:`) must be used to delimit keys and values.
>>> +- All keys shall be prefixed with `drm-`.
>>> +- Whitespace between the delimiter and first non-whitespace 
>>> character shall be
>>> +  ignored when parsing.
>>> +- Neither keys or values are allowed to contain whitespace characters.
>>> +- Numerical key value pairs can end with optional unit string.
>>> +- Data type of the value is fixed as defined in the specification.
>>> +
>>> +Key types
>>> +---------
>>> +
>>> +1. Mandatory, fully standardised.
>>> +2. Optional, fully standardised.
>>> +3. Driver specific.
>>> +
>>> +Data types
>>> +----------
>>> +
>>> +- <uint> - Unsigned integer without defining the maximum value.
>>> +- <str> - String excluding any above defined reserved characters or 
>>> whitespace.
>>> +
>>> +Mandatory fully standardised keys
>>> +---------------------------------
>>> +
>>> +- drm-driver: <str>
>>> +
>>> +String shall contain the name this driver registered as via the 
>>> respective
>>> +`struct drm_driver` data structure.
>>> +
>>> +Optional fully standardised keys
>>> +--------------------------------
>>> +
>>> +- drm-pdev: <aaaa:bb.cc.d>
>>> +
>>> +For PCI devices this should contain the PCI slot address of the 
>>> device in
>>> +question.
>>> +
>>> +- drm-client-id: <uint>
>>> +
>>> +Unique value relating to the open DRM file descriptor used to 
>>> distinguish
>>> +duplicated and shared file descriptors. Conceptually the value 
>>> should map 1:1
>>> +to the in kernel representation of `struct drm_file` instances.
>>> +
>>> +Uniqueness of the value shall be either globally unique, or unique 
>>> within the
>>> +scope of each device, in which case `drm-pdev` shall be present as 
>>> well.
>>> +
>>> +Userspace should make sure to not double account any usage 
>>> statistics by using
>>> +the above described criteria in order to associate data to 
>>> individual clients.
>>> +
>>> +- drm-engine-<str>: <uint> ns
>>> +
>>> +GPUs usually contain multiple execution engines. Each shall be 
>>> given a stable
>>> +and unique name (str), with possible values documented in the 
>>> driver specific
>>> +documentation.
>>> +
>>> +Value shall be in specified time units which the respective GPU 
>>> engine spent
>>> +busy executing workloads belonging to this client.
>>> +
>>> +Values are not required to be constantly monotonic if it makes the 
>>> driver
>>> +implementation easier, but are required to catch up with the 
>>> previously reported
>>> +larger value within a reasonable period. Upon observing a value 
>>> lower than what
>>> +was previously read, userspace is expected to stay with that larger 
>>> previous
>>> +value until a monotonic update is seen.
>>> +
>>> +- drm-memory-<str>: <uint> [KiB|MiB]
>>> +
>>> +Each possible memory type which can be used to store buffer objects 
>>> by the
>>> +GPU in question shall be given a stable and unique name to be 
>>> returned as the
>>> +string here.
>>> +
>>> +Value shall reflect the amount of storage currently consumed by the 
>>> buffer
>>> +object belong to this client, in the respective memory region.
>>> +
>>> +Default unit shall be bytes with optional unit specifiers of 'KiB' 
>>> or 'MiB'
>>> +indicating kibi- or mebi-bytes.
>>> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
>>> index b9c1214d8f23..b99dede9a5b1 100644
>>> --- a/Documentation/gpu/index.rst
>>> +++ b/Documentation/gpu/index.rst
>>> @@ -10,6 +10,7 @@ Linux GPU Driver Developer's Guide
>>>      drm-kms
>>>      drm-kms-helpers
>>>      drm-uapi
>>> +   drm-usage-stats
>>>      driver-uapi
>>>      drm-client
>>>      drivers
>>

