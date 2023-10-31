Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C08837DCF48
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 15:34:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE45310E511;
	Tue, 31 Oct 2023 14:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958B010E50E;
 Tue, 31 Oct 2023 14:34:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQyB0WjoA4c8Zd6cTl7V1ruRnnjk0GBNy1BIfOT93Oftu6COCZ9H52AZKgZZi1b+nCHeEpqJevuRKvD5F/uRCn45fSJzHfGRfENrVpFlWMTSdbZI1JhF9sKOBFvQtbKye5RTjfOTS8/0/87wyRGf5PU9ev0LK/OzdhrLN5ugU6cBTB9cDx9EknxWfSnrxlw7HeKOsFWAUBFxq1ohoy6gNqBCok4PQ9FqcWnOTgxb06SZh5bdVjDtsu6aWcdu9kUN2jmNOXnX/c+4ECmOEdVXC2NOY0kGQNaAy0o8ct//a8r6g5WXKxbDFsve4+gvlhwrD8y/JkiXF6gDgkh7A1r+ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlBjVlmJ7f/y0rrY6FLr/7WV/iIIWi7FixyWGoTkJ1E=;
 b=FGi+kTvRlgksNo+iiVkbwrtj9zu9R031m0eBjZorh5ygUZWASJgkpMT0pzrZaUkLFQ0D5zlJp55QE1ZSDf5TvGRSe3UTOCY4a9DGBxxx57RGnr9msVyt4ztB+wCJjGTQk0+CPrvLk9grCDgufR1nyzEAainQyEeFksw0pLSntVfDJ+tjtapopsyeif2cctPzfI8hiYDxmOVwYujBG+JR0WcapXrwVvmrxD5zlaud8HLL34K+rasYqM5ShXHFxzwGBaguxH/vBqnje1D85zIvi1mgYgpXKr+Q30yc04fw17mKn/39iSeIYCcgBpQx5ye3jgyGZHAGcMKXvlYj3GM+dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlBjVlmJ7f/y0rrY6FLr/7WV/iIIWi7FixyWGoTkJ1E=;
 b=IdCTxkR9Hw6Ao5q6Uj5BTo+HpfTh7AEoseSzet1qm87oWOS9Ja55N5acPZUrQ2nVft3NUYiQ7w5EdPVOklw8Lb2+AKjsPBKSRiFVHIjxinrIhVuPIaFwmlMRsJQIkpYCF4ajMw6rVEAJxOm326MRk9c20pqyP3gIroSVPeekgNI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW3PR12MB4489.namprd12.prod.outlook.com (2603:10b6:303:5e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Tue, 31 Oct
 2023 14:34:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 14:34:25 +0000
Content-Type: multipart/alternative;
 boundary="------------oG8mS7aHzqCPrHY0kLtILcQk"
Message-ID: <02d7fe0c-cf7e-413a-a2c2-714c932062d5@amd.com>
Date: Tue, 31 Oct 2023 15:34:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/amdgpu: Add flag to disable implicit sync for GEM
 operations.
Content-Language: en-US
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
 <20231031134059.171277-6-ishitatsuyuki@gmail.com>
 <454e7d7f-8a23-58bd-8822-55c13beba97f@mailbox.org>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <454e7d7f-8a23-58bd-8822-55c13beba97f@mailbox.org>
X-ClientProxiedBy: FR4P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW3PR12MB4489:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d27d5c1-1fee-4099-876e-08dbda1e7af7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eSQ92yvk42UVAbwKXPAafDG+oHDOVyblvnCkI6XEL02ZuvqyGXRD1jd2VausFRjP7XqUM+qKrk5qRVx5oQ7J0sNYaSP3x4O0q7EcaGLJ9iCzTFFfXTB3Sg8xPKPjmwTJpy/1H+qdtYTbDwWNCkBGThEaynpNL/9X9/wyJUNEjOqM6DHoWxE0LU6vNrT2z2QQqzRbeRtLdOt0eJmJCoai3NkCjKmPbU5McTh58dDSbZQgO1QS9QQpUvK2jDfkpoIbFSa4cmJDR9hKKVPOz0L4i+BjHOCZwUv3lcUfNSv+BrtuYDx2oC1y/atQO8YczzX1Rl2Ops6f4dfs9iJHCHpc0bPxGh4Jo+SfP6icbYmfJMRlAtHqrkx7LMuUCtVrFsOs5GpvM7RmX6uvdqhTbg1XWICUwAqTwT15lD+6DIQy/PDYTNB9D7jB0nPmxNp6ZpRwRfUgxxl/Hx3O3Lze2uKAm/2+ZH5G8NWUMa1l/RaQYAJuZEE1zH67dqQOCKTL5sQtO0AJBfnA4TwX6fE20dAs9C+C5BEye0SaUIehKXXKfJ4I1yc2ZcibA5xqxYJFrR0N/VYTnVEZU0q4PDuJBlZnYMdqgAuJKvlYP+ZYsrNAEBnFD+cnCdRaunCRgjURamYr48QlsvRc/R6eQx5vePYo3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(366004)(39860400002)(346002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(6506007)(26005)(83380400001)(2616005)(66574015)(66556008)(38100700002)(110136005)(316002)(66476007)(66946007)(5660300002)(8936002)(53546011)(4326008)(8676002)(6666004)(33964004)(478600001)(6486002)(6512007)(41300700001)(2906002)(36756003)(86362001)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEFzRW94Q3VqcjNuT1hEWW93aHNPcEZybDFDSE8vMmdCQjNOVGdyaHl3aUN1?=
 =?utf-8?B?U20xdS8xdE5uQ0tCMWQzRUpFTWhEa2d5MkRWTUdQTUNESWREZTVMVkl3OW93?=
 =?utf-8?B?MTRnMndvKzVyd0JsQm1qQSt6OHdMNG1mc3Z4TXVpMlVDVlBHb0xxdWxnZnlQ?=
 =?utf-8?B?YkVPMGgzR2pzNFBpOWw5bDNTZzFLVktUSkFFSmdMUUNqV2FwUjdKTnk4Mjdr?=
 =?utf-8?B?OUR1aGp6b0oxc0tkS25rL1FuZi8rb2dOdWJpUnZCdkMxanFBdnlwNGlRaE5j?=
 =?utf-8?B?ZTNqeEdqOEFKUGJ6eVBlM0tHOGptV3lyQVBJTDcveFIreTdzODB0Sjd4Zkds?=
 =?utf-8?B?djJ2QlZKcFdOK2s3VGhDajluTHhPY0JXaDU1NDlIdzduMXhBdG5UbGU1WnE4?=
 =?utf-8?B?dmZVYzFsWncvakk1T1lIaGVkSjY3dW1kWndnQWZpOWgrSkY5UmxTOXk1Sm9v?=
 =?utf-8?B?V2I1V0hPdEhWRW8rdW9rcVF1YlhiK2FOM29jb1hTQ3Zhek9VNEd0dzYvNi82?=
 =?utf-8?B?UWpibjd3ZnVqRXNSTlk5am82VTVuZ1dqb0FKQXYvNTRtRHUxeHZpMGFGVUow?=
 =?utf-8?B?MmExcDVsK0J3bk9ud2hSQngxcEJhUW5zcHJnU3JuZGRNd0ZiK0FWcDZiRXpK?=
 =?utf-8?B?Z3k2N2RqTDg1VmNoM1FkSjhhRHdVT3JlanQxZXVhWXJFVGFUaGc5QnFrMk1Z?=
 =?utf-8?B?STNwcm91QTJCSGhRSjZyY3g5UjF3WVZmeEZySURZRlE3RWFnUTV4S1lwZTFp?=
 =?utf-8?B?SUxWNzE0UWlVYzIzWEZXbE5ld0c0VE9XREJyUGMwWkNLYWd6OUlyQ2pNdTRN?=
 =?utf-8?B?Uk9iNGhyOFVUQ1lZbW5xL2J5VXhZU1RmT0FxV3VRUGdCdFQrTmwrVzRBb3R6?=
 =?utf-8?B?b0lyM2hMZElUbjNFM3FLdXBvVjQ0UXI2TzAvajR2LzJRTEFMRjBvaVhFUFcy?=
 =?utf-8?B?bTd1MExKUVJYa3NoS0VYK3BaUFdtLzlHR0hrSTJJQVNtejdBWDVRNys0N3Jz?=
 =?utf-8?B?cUpZd3BncHE4L1Vvb2JhNld3aGdVbU5HWlFJdmRrVzROTnRWckJpcWg1aEl5?=
 =?utf-8?B?cEdneCt0SUI5OG9sOE1aVDlJVWpsZmcvelFGcWNjZzBkd0Q2OGlwSmN2VEFj?=
 =?utf-8?B?SEJNMWVPMXZLL3BGeG4xMllncmJSRHlwdEtPdDRQcm9QeWd2L1NsWC9QdkhG?=
 =?utf-8?B?UytPNTlJMnREQU54Rm9LYjFVQ1RIb1JzQnZGZXlRaFF0T1Z4NmpqL0tmVmdi?=
 =?utf-8?B?bDhJVm5DYmg4SVRMaTJySFVpakZ0SVlidHVNbTVOaHB3TC9aNUZQc3kwMVI0?=
 =?utf-8?B?YjlybjhPQklIZGlsQjZUbGFOc2x4V2kwWHprSmtjTjVxOHB3QUxtU3lxdElr?=
 =?utf-8?B?bmVrRWtMM1FkOGxuamFkdW9aUkNTUmozbzZLSWhBb2FBNUFVNVZnVy9xbWdM?=
 =?utf-8?B?RWo3K3h4RUU3L294aVNTT2hqb0ZDcVhFdFJWOUhMd1BUTnF6UUtNWWJxRmhE?=
 =?utf-8?B?dGZVRGk4VDJzaVNaek4wVXQvQjZWL0lFTzJOK2NCTFc5VkphSndTeGh5MWtW?=
 =?utf-8?B?dWsyRlB5WFJZeS9kUTZTbXVWb1ZuOWRnWE55ckhnR1VtTHV0bk5TMGFkUU81?=
 =?utf-8?B?eDdVaDVVTStmUGhabG5VMlU4NW01cE1TZTFUbzNDUlRBdmxXQWpDQmIwejNx?=
 =?utf-8?B?djVQQzBCYmZLbS9QWTZOYUhPRWVLd09pMFR0ZDFRd1QwcmpQbk5NMW1SMDl1?=
 =?utf-8?B?ajhRQ0wvQk5CUUNoMTJCejZVNklvZTdlRVhKelJBdSs1VDIxeUhRWWt0U2hG?=
 =?utf-8?B?YU5pb2Q3SE5SeU41dm9WU0g0WktwVThpUWZGbDVqUDdseW94aWNoYWhmMFpr?=
 =?utf-8?B?US8zTHplbFVFTHpnNHlYOFAzQzJ3UzlBRHV2aXNNQmF6WnEwU1k4c3dueDVU?=
 =?utf-8?B?NjRWNGkybFAvYnY1TzhTSTZvZnRQN2ZRcEhmRkdDWUVOV3ZYazJBanFJZDNy?=
 =?utf-8?B?aHFjcVdwTkVqTnloUnF2Z2dZOXZPRksvK05JYlJ4OG1UMWlKbEVrbHQ2R1c2?=
 =?utf-8?B?K3hFMlpmMVg4VWd4VGFGT2xPTHhTUnZONS84cElPV2dwdVphWnFaQmFGa0RP?=
 =?utf-8?Q?S78c6BfNmRvG0Ycb6HauuA+Qd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d27d5c1-1fee-4099-876e-08dbda1e7af7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 14:34:25.1984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xm6RvLuoLWmCV3d3Qn4qhz+QDEf8Wz+RaPnP02wIQaWMirN6eQSdo7u8VRVUNwDZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4489
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

--------------oG8mS7aHzqCPrHY0kLtILcQk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Am 31.10.23 um 15:14 schrieb Michel Dänzer:
> On 10/31/23 14:40, Tatsuyuki Ishi wrote:
>> In Vulkan, it is the application's responsibility to perform adequate
>> synchronization before a sparse unmap, replace or BO destroy operation.
>> Until now, the kernel applied the same rule as implicitly-synchronized
>> APIs like OpenGL, which with per-VM BOs made page table updates stall the
>> queue completely. The newly added AMDGPU_VM_EXPLICIT_SYNC flag allows
>> drivers to opt-out of this behavior, while still ensuring adequate implicit
>> sync happens for kernel-initiated updates (e.g. BO moves).
>>
>> We record whether to use implicit sync or not for each freed mapping. To
>> avoid increasing the mapping struct's size, this is union-ized with the
>> interval tree field which is unused after the unmap.
>>
>> The reason this is done with a GEM ioctl flag, instead of being a VM /
>> context global setting, is that the current libdrm implementation shares
>> the DRM handle even between different kind of drivers (radeonsi vs radv).
> Different drivers always use separate contexts though, even with the same DRM file description, don't they?

Separate contexts don't help here since the VA space is shared between 
the two.

>
> FWIW, RADV will also want explicit sync in the CS ioctl.
You can replace that with the DMA-buf IOCTLs like Faith is planning to 
do for NVK. Regards, Christian.
--------------oG8mS7aHzqCPrHY0kLtILcQk
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">Am 31.10.23 um 15:14 schrieb Michel
      Dänzer:<br>
    </div>
    <blockquote type="cite" cite="mid:454e7d7f-8a23-58bd-8822-55c13beba97f@mailbox.org">
      <pre class="moz-quote-pre" wrap="">On 10/31/23 14:40, Tatsuyuki Ishi wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">In Vulkan, it is the application's responsibility to perform adequate
synchronization before a sparse unmap, replace or BO destroy operation.
Until now, the kernel applied the same rule as implicitly-synchronized
APIs like OpenGL, which with per-VM BOs made page table updates stall the
queue completely. The newly added AMDGPU_VM_EXPLICIT_SYNC flag allows
drivers to opt-out of this behavior, while still ensuring adequate implicit
sync happens for kernel-initiated updates (e.g. BO moves).

We record whether to use implicit sync or not for each freed mapping. To
avoid increasing the mapping struct's size, this is union-ized with the
interval tree field which is unused after the unmap.

The reason this is done with a GEM ioctl flag, instead of being a VM /
context global setting, is that the current libdrm implementation shares
the DRM handle even between different kind of drivers (radeonsi vs radv).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Different drivers always use separate contexts though, even with the same DRM file description, don't they?</pre>
    </blockquote>
    <br>
    Separate contexts don't help here since the VA space is shared
    between the two.<br>
    <br>
    <blockquote type="cite" cite="mid:454e7d7f-8a23-58bd-8822-55c13beba97f@mailbox.org">
      <pre class="moz-quote-pre" wrap="">

FWIW, RADV will also want explicit sync in the CS ioctl.</pre>
    </blockquote>
    <span style="white-space: pre-wrap">
You can replace that with the DMA-buf IOCTLs like Faith is planning to do for NVK.

Regards,
Christian.
</span><br>
  </body>
</html>

--------------oG8mS7aHzqCPrHY0kLtILcQk--
