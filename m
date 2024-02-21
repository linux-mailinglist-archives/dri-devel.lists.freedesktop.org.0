Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E54885E053
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 15:54:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6E310E778;
	Wed, 21 Feb 2024 14:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UuSvLxkC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2073.outbound.protection.outlook.com [40.107.100.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C9A10E771
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 14:54:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QAgXknwkU2902gn4c+opXraArpy1P4kpOAyu+peB1xIphjI5yXCxrDQF98XM9MBaEFAdc4hhq0UJ3ZxHk8fYo+6+XxYvppDXuFpewVC9wZ9hH1sBvsqkKTFD9U+1Zpb7oD7A+PewT40uoiUMXD/Pmxr/qLyF5pfsb+3etQJcA3HCp1rSXRIEqzoWBJIjxVrtaq337kwpa29aRm4OjYFY15X19WaBXkVwxmXtfn2E3KqT+G5T5Sz0nUEzYj2zv4sgDh2VtlG4/mPDOoV87NAG2L1eWGXpc0CQ7Db5uZxoSSVYtF9y+lA3hBNwsbvkqR5y76J0PKzF07jZGE6YCd4h6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJDGNrRij9yWoPyp8wfnRs/Wv9vR5YR8tnk4frqYh0Y=;
 b=aUAoP71AEB08b9PsE3/6yDNjlRm80bsuiROjGO6ZEXagnXMCSbNl6JrAe41FklkThxjFLNvx2Q72W3/iNkxLHxQd4qBKqPDBN5dgEUaPVBiVA6tTOVjEWLcn9TthqKR1Erl57cge5aO3J0L/hLN05g4kTGmxtaX8h8nm6TGCaip8Zek+DLm/FHKW1usz9BkDw5DSLnRPmdtlvu22Zcri8iZk/lKyfHHDmBeGc8QWBB3fcVC+hxirtF8Dd4SSaxM1HWN0HGyToch2ydjHlO/UDkaivg1nzMqLcH/HJ5PsTcAmZfs7FEEhYl/uogXCesgkgMe1B1oCE+ociUf96/Q+Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJDGNrRij9yWoPyp8wfnRs/Wv9vR5YR8tnk4frqYh0Y=;
 b=UuSvLxkCcNweJmpeORKIFA2m46pFedpCYgdlzqA87NAEMsFxlMWYG+I/zp6dPMXp3EBhFtrAnbxhRK6mn/f49xKqTlTHWzG/a08Yl2RQgvJo+AX+r2ib1H79fYBW7rNwRSAlTR+QApF6aMvcwFTIGzkp6stAj2wyhTijOoYLhx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6611.namprd12.prod.outlook.com (2603:10b6:510:211::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.20; Wed, 21 Feb
 2024 14:54:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 14:54:31 +0000
Content-Type: multipart/alternative;
 boundary="------------poAxNQYz9z0vG4YS08OmwdU0"
Message-ID: <fa5fa080-0ce3-4ab0-80a9-9ee5baba9131@amd.com>
Date: Wed, 21 Feb 2024 15:54:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Running ttm_device_test leads to list_add corruption. prev->next
 should be next (ffffffffc05cd428), but was 6b6b6b6b6b6b6b6b.
 (prev=ffffa0b1a5c034f0) (kernel 6.7.5)
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
 Erhard Furtner <erhard_f@mailbox.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow
 <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
References: <20240219230116.77b8ad68@yea> <ZdRtDOhQGQUm5X4d@archie.me>
 <9cdf0baa-f544-4fa8-bee3-568b790527cc@amd.com>
 <4xggxtkk44m3xcfucbougtuhr66s2pc7tilpnju7xnyw45facb@odsrpqp57kiz>
 <535f9089-b988-45ac-b3f3-a7d593861723@amd.com>
 <uddqboamqcnxwvnud5gmkkm4igvxj67xc2zw52iex5ahljtlb4@2e7ydoplg6rt>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <uddqboamqcnxwvnud5gmkkm4igvxj67xc2zw52iex5ahljtlb4@2e7ydoplg6rt>
X-ClientProxiedBy: FR3P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6611:EE_
X-MS-Office365-Filtering-Correlation-Id: 01aaa1ab-347f-4acd-9e39-08dc32ed02a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AC5tPyjXCanrSNHJMH528fYqqPIjBoyWBcdQgWJlAdOhygYkBk4epuIquyfCFRiNoJVxk6rCpq2P5aT6rOyse0+cBIu8LMC1w0EJ2zG0VZNzDcuwN7+zDVPTVtAasKCvQ+zK6bQ25JC1Ig7FBSaZnq4xxsgl5NzxbWy1X5aiBRF2auIxsRK8DCf7TeFqf5ipUdSfeNXT3aRxKbQOJaLvmHk0WOwQXLCuC0ys7n/20hQZRKRSkp5kOlaAcDfxpev0Zz//FIbbks1NH7og7AMualKITTLbbDhCp7jR3rSbLnrcdNu/+83GFjHtcO023Fjul2750pMxXkXTTJmv5YB5x4dY/9QL3dSaHB1k5zMdgwbrbP9T70Y7YfLX/r1O0m4x+/8TeFhYc9Zy5RrJ16Y1g0VrFGOMn45wHUyT2XGjGTEfCE1eMz2zVuad1SQ/qD7iqkIqX6SVhbrKbnMFZ7lAteSWwUsn3EsVs15sMuNfeR+IJVivNkay7rWoSyWVAnMZVPWGR8q/zkd9SMJI+Bl073v7rB3yS5i7bOlAvM8GXIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3dWY3IvT1BnRTl3Z3d4c1l1dUhvT0IxcGR1R2VkWE53NlVzZXlJNjlLSnky?=
 =?utf-8?B?T0dJeklid3F0WkZyQVE1c3ROM2hHamI0c2JPWkVuNkZCR2lCbmpxcW5VNVlP?=
 =?utf-8?B?SjgvdkVDUGQzVXcvR1FUWGlBYnZrZ0xGYnVoajMxWFQvNWZyUVIyUVJ4VElv?=
 =?utf-8?B?M2xwWDNxM3R5alR4b1crNnpyQWxoNEhUOTBaUDRhWlRXVXNNT1lkQnZFOGVK?=
 =?utf-8?B?djNnYXQ3bk5jakhvUnpVMUJ4RkFXWkRvMElyK014UkhKSGZueVhCN2V0RVli?=
 =?utf-8?B?eGJJOU1maUx2Y21Zb1liVXVBZ1VlVHBOUmNqNnl3Nlh0K1Iwa3RIQy8rTlp0?=
 =?utf-8?B?MHRwbzBVZzNjVFZSRnNWKzdLTzFzYXBVMzlmajZ2a1FjWUs4RjZYcGFXMDhv?=
 =?utf-8?B?cGNCYWtzWFRoMUZibVpyc2ZEQk1JbytJQlllSzJZT0c0emZnSGUrdWErWEJt?=
 =?utf-8?B?c2Uzc0VtRUZ4UjJLeGZUb1I3WC92TnhZQmFxU0xyejlYL1hJMzFOTGpxRlBV?=
 =?utf-8?B?UDlqUUpqWHpZSURPbTlEVlBNdm0ybmlhanY5YzhhbnNTdGJEOXNuYklZYmdF?=
 =?utf-8?B?WnFiYUpFbHVqQ1YzcXZCVDJnVGl6cUV2N2ZxT1ViWTRpQ3czc0IyNkdRSkFG?=
 =?utf-8?B?TUhtK1U2eHAyWHdMNWhHUjFNaHVSMjFUeWx3cUVGOTJKa1ltMkIvWlFWdUtx?=
 =?utf-8?B?Y2JoTzJubXNNSVlGNGwxRTNSekRHV3ZmUnE3QjlBMUJ5U3ozNmsrRHpwSHBC?=
 =?utf-8?B?Y05JcGlWMzNSMFoxRVJNbU5rdy9MYk5mRzFsVWhvQmVlN0NJdWdSa2xXUnhG?=
 =?utf-8?B?bVlKRE9pdTRDMHZ4VzZSemFoL1FCRjBMTFZXZkNZV3hkMXl5T1B1NHI2aStw?=
 =?utf-8?B?ZjRhU1hSQldiMFRFaHdSTzJkbGFCTlVkYlhETDlXL3A1ZVgwZTNESFpoU0NT?=
 =?utf-8?B?MitaT2ZxRU5BQm5MbW1UWWNDU0RZcmMyODhkZXhGbnFpZGpPamxvR2J6WGNu?=
 =?utf-8?B?TnhWVEZtNkZNNWE0dlNaZ1QxelhZQ2JvOGxGQS9ManVDUWMyKzFIL2pDNGZ5?=
 =?utf-8?B?dk1PQ091Y1JWNGNHcGJJaEpIV3lSVUV2YXBhSi91Y0lTSXRjSURRZVFmS1I2?=
 =?utf-8?B?ZENnTDd2U2ZIZTZQSktmaGpWbXFrWFVIMHRpSHNzTDJXRHJvRk9FcVdmNzh4?=
 =?utf-8?B?VkQ0Rmw0alRaMmxmallnZ1JNS092QzBuQXV1WFc5cmg4bUIvQVd4NjM5UWhK?=
 =?utf-8?B?NHR2U29ZOU5sbHFjcmFuUjNNV0l2bllxT25oZDZMZDhhM3BtSndqcGJITGdZ?=
 =?utf-8?B?ZGV0WitPekJKc2M5MEFjdnFOZjB6d2FmTUNBOVYrRnJnNURpM1lHM0RhS0FT?=
 =?utf-8?B?YjU3WTVvL0xmMnJYSENVcXhndm0ySTlZR243VFVNcW9mUmZDMlpHZWZxcGQ0?=
 =?utf-8?B?ckZzV1lwRVNyMGcxdW5pVHYzT3Z0WnJIeVRTM01Rb1BqMEVtZ2VybmRTMUhl?=
 =?utf-8?B?UlJWR2NYL0JOd1loeHFUeWgwODcvTkhya2V5R2lDMGVYSUx1QUxmU2VVM0pJ?=
 =?utf-8?B?WnQxSGFrVEluZjdOaUJQS0IvTnA2Z1V1TlkvU3htMkI5NGdXVkVMRmFBbElv?=
 =?utf-8?B?eHJIMjFZWGtkditCb0RqWnZCeCtQc1gzY1MwNDExZjlST3I1dUpiVmxTcEU0?=
 =?utf-8?B?by9Eb2F4VFFKdGp1QkYrcllpbG5FQmNyMFBpbjhtdWtvTXkxSE5jazlZT043?=
 =?utf-8?B?VFRnenBQaDdtdzAvdjhsMVFjcGE5T20ra01NN284L0MrME4zTldIUTQ0S01U?=
 =?utf-8?B?MDgvK0NlRk1hdDhBMEtnUlkxYzhXUDNyb2o4cFY3U0syakdIbnk4emVCdS9m?=
 =?utf-8?B?OHNranMxRUJhcStzbERpaTlxREx2dU5ZVXlsc0k0RmZ5dlBGTnh4emV5Q1lM?=
 =?utf-8?B?c1lSMm1DUkRab0dJK285YVYvNVRKK1dUb0VyUUQrL1NrV3JTNUhja09vMmdr?=
 =?utf-8?B?blhpOFV5cDFDNFJ3MEx6WkMvcFg1cW1qemw3MGlkY1lST0w3M1ptVDZMVElh?=
 =?utf-8?B?eVM4QmVxb0l0UnZEV0RrbXNBSktVVUhHd2k1Q09XY0pYYU91VldFVytlZ0hi?=
 =?utf-8?Q?4FnxhjNWSr75knu+VKJSq7boS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01aaa1ab-347f-4acd-9e39-08dc32ed02a4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 14:54:31.4009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvJI9Af6wWmevtU9sL43UBk+ffZhT7GkW3HMNoSTWkkdvoZW2rDxGcSJPWfh/sjt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6611
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

--------------poAxNQYz9z0vG4YS08OmwdU0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Maxime,

Am 21.02.24 um 15:41 schrieb Maxime Ripard:
> Hi Christian,
>
> On Tue, Feb 20, 2024 at 04:03:57PM +0100, Christian König wrote:
>> Am 20.02.24 um 15:56 schrieb Maxime Ripard:
>>> On Tue, Feb 20, 2024 at 02:28:53PM +0100, Christian König wrote:
>>>> [SNIP]
>>>> This kunit test is not meant to be run on real hardware, but rather just as
>>>> stand a long kunit tests within user mode linux. I was assuming that it
>>>> doesn't even compiles on bare metal.
>>>>
>>>> We should probably either double check the kconfig options to prevent
>>>> compiling it or modify the test so that it can run on real hardware as well.
>>> I think any cross-compiled kunit run will be impossible to differentiate
>>> from running on real hardware. We should just make it work there.
>> The problem is what the unit test basically does is registering and
>> destroying a dummy device to see if initializing and tear down of the global
>> pools work correctly.
>>
>> If you run on real hardware and have a real device
> I assume you mean a real DRM device backed by TTM here, right?

Right.

>> additionally to the dummy device the reference count of the global
>> pool never goes down to zero and so it is never torn down.
>>
>> So running this test just doesn't make any sense in that environment.
>> Any idea how to work around that?
> I've added David, Brendan and Rae in Cc.
>
> To sum up the problem, your tests are relying on the mock device created
> to run a kunit test to be the sole DRM device in the system. But if you
> compile a kernel with the kunit tests enabled and boot that on a real
> hardware, then that assumption might not be true anymore and things
> break apart. Is that a fair description?

Yes, exactly that.

>
> If so, maybe we could detect if it's running under qemu or UML (if
> that's something we can do in the first place), and then extend
> kunit_attributes to only run that test if it's in a simulated
> environment.

Yeah, as I said AMDs CI is running those tests with UML only and I 
strongly assume Intel is doing the same.

In my reply to the reporter of the bug I provided a patch which limits 
the tests to (UML || COMPILE_TEST) and as far as I can see is the 
easiest option for now.

We could detect that we are not in UML and skip the device test, but 
that's also rather pointless. Better not to provide the option in the 
first place.

Regards,
Christian.

>
> Maxime

--------------poAxNQYz9z0vG4YS08OmwdU0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Maxime,<br>
    <br>
    <div class="moz-cite-prefix">Am 21.02.24 um 15:41 schrieb Maxime
      Ripard:<br>
    </div>
    <blockquote type="cite" cite="mid:uddqboamqcnxwvnud5gmkkm4igvxj67xc2zw52iex5ahljtlb4@2e7ydoplg6rt">
      <pre class="moz-quote-pre" wrap="">Hi Christian,

On Tue, Feb 20, 2024 at 04:03:57PM +0100, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 20.02.24 um 15:56 schrieb Maxime Ripard:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Tue, Feb 20, 2024 at 02:28:53PM +0100, Christian König wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">[SNIP]
This kunit test is not meant to be run on real hardware, but rather just as
stand a long kunit tests within user mode linux. I was assuming that it
doesn't even compiles on bare metal.

We should probably either double check the kconfig options to prevent
compiling it or modify the test so that it can run on real hardware as well.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I think any cross-compiled kunit run will be impossible to differentiate
from running on real hardware. We should just make it work there.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
The problem is what the unit test basically does is registering and
destroying a dummy device to see if initializing and tear down of the global
pools work correctly.

If you run on real hardware and have a real device
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I assume you mean a real DRM device backed by TTM here, right?</pre>
    </blockquote>
    <br>
    Right.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:uddqboamqcnxwvnud5gmkkm4igvxj67xc2zw52iex5ahljtlb4@2e7ydoplg6rt">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">additionally to the dummy device the reference count of the global
pool never goes down to zero and so it is never torn down.

So running this test just doesn't make any sense in that environment.
Any idea how to work around that?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I've added David, Brendan and Rae in Cc.

To sum up the problem, your tests are relying on the mock device created
to run a kunit test to be the sole DRM device in the system. But if you
compile a kernel with the kunit tests enabled and boot that on a real
hardware, then that assumption might not be true anymore and things
break apart. Is that a fair description?</pre>
    </blockquote>
    <br>
    Yes, exactly that. <br>
    <br>
    <blockquote type="cite" cite="mid:uddqboamqcnxwvnud5gmkkm4igvxj67xc2zw52iex5ahljtlb4@2e7ydoplg6rt">
      <pre class="moz-quote-pre" wrap="">

If so, maybe we could detect if it's running under qemu or UML (if
that's something we can do in the first place), and then extend
kunit_attributes to only run that test if it's in a simulated
environment.</pre>
    </blockquote>
    <br>
    Yeah, as I said AMDs CI is running those tests with UML only and I
    strongly assume Intel is doing the same.<br>
    <br>
    In my reply to the reporter of the bug I provided a patch which
    limits the tests to (UML || COMPILE_TEST) and as far as I can see is
    the easiest option for now.<br>
    <br>
    We could detect that we are not in UML and skip the device test, but
    that's also rather pointless. Better not to provide the option in
    the first place.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:uddqboamqcnxwvnud5gmkkm4igvxj67xc2zw52iex5ahljtlb4@2e7ydoplg6rt">
      <pre class="moz-quote-pre" wrap="">

Maxime
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------poAxNQYz9z0vG4YS08OmwdU0--
