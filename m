Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 727C155AAAF
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 15:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3EF12BD06;
	Sat, 25 Jun 2022 13:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DFF12BD06
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 13:58:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSsbceMq2/uUB3/4UkPkRUiTQYz8gDxtD7xavjj96Xkaj6bGU2ZfwMs+CBluMbTipGtsKr3RrKOLsz8p9hh8/uHeLmVT7/ol8NZaNbvu4Djc6nOl6eJKJWKD/VZqXDc6nj3p94tn1Nw/nzjM3XGGqSQJmIYcU1eLlNSVnxsXG8Arc1y08m4lPXRJZGBU1K2zkvkurr7gdesQvoj4/U3hKoDEkhUVaOZmzQ8nF739FAjWw9211W/HiyUAknESm7f1pDQ5gCStNEEjAuc0uC89C3wuxRmmEsq2aCjw3AQIhVVtEyYsnZTiRwJt4ZYfMZZSE/zySxV7lY6zTAiVJgjjyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCANvwMvwFniYHJ/Cnu1OxJ3px06Jb6om3FcORbjxIo=;
 b=Ypl5apg9s2wWy2WX6TF/EUGykLStTcQ9EDodQicUCiYCw0F/tXNxy5A3Dh1Un5UBqvHtV+HXcj98TAvJPGwzwiBOynW00dgnE4MhdGEUGc6FLW0IsFMJXeJDQCrzt4BHkneGb2KyHSxS5QVl07gkqMl8mEU+em1D3RMJ8tJV+XA+T1QBhNABU+2LOyTOMY9I78LJCkT4LLOQQANSLECJqSisBOVuoJpiTWTb4SV2vfUymYrbDu3ZAEatT05EMEu9KUhxuxqbHvGo9I2SkQnIExU6jYVxfFv4bXpN714IjepreX2M2QYRM8UhlIwXgHnR1M1QUtVeOB+rG+BTXgPLpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCANvwMvwFniYHJ/Cnu1OxJ3px06Jb6om3FcORbjxIo=;
 b=GgTUWQyrSAVAUPRM7gdk0MvbkgzRTTC7h5W/j4UuE76j1jSGbEJUJivJmmquO1M/kQd3SCl9AhGyxyZyHVLLptriGBHk7uRRjwq07ETJO8ZwEQUnSpTnHUEnHUXnMB3pZRwzq8YYARtZ7cg0/2wLFuMD+5U1cjDKK+TIQT2aB68=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY5PR12MB6528.namprd12.prod.outlook.com (2603:10b6:930:43::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Sat, 25 Jun
 2022 13:58:22 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5373.015; Sat, 25 Jun 2022
 13:58:22 +0000
Content-Type: multipart/alternative;
 boundary="------------S3jBpVoNnGJqrfzEebU0AVaL"
Message-ID: <785d01ba-7d4a-1b69-a97a-6144ce0f6772@amd.com>
Date: Sat, 25 Jun 2022 15:58:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <CAP+8YyFKOM1qztPBNGk4nzsaX7Dq8-cwg0h_GUgz6sUxBZLhEw@mail.gmail.com>
 <98c1ea95-2b1e-36dd-6706-b3667f0f5f47@amd.com>
 <CAP+8YyEWE9KCmo2pGOHMyT3fSEXskTG-tfymwQmmy7d1c9CuRQ@mail.gmail.com>
 <3b6a7d56-6c65-046d-0a51-bbe167e04322@amd.com>
 <CAP+8YyGL_WEME-1_oB_K5_K600c5kcmO0GxXBQGVQEF7aP_D7w@mail.gmail.com>
 <91e843ca-928a-7ab1-12e4-89fbba085403@amd.com>
 <CAP+8YyHqcoxVeropBpeuSRX4kNtVezi1-s3FKSic_Z_OQ8BcAg@mail.gmail.com>
 <1e04e766-4a5b-6825-6991-3bd542f562b5@amd.com>
 <CAP+8YyGEHUZhCCUa-3sSVmgGMrTkj=vQomPar=hTN=3-RCznOA@mail.gmail.com>
 <71cc9552-4bf6-4941-e903-2ea62a22a2e9@amd.com>
 <YrYfw6T4MGvifIco@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YrYfw6T4MGvifIco@phenom.ffwll.local>
X-ClientProxiedBy: AS8P189CA0009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 222e5942-0bf4-49f9-eb93-08da56b2c45a
X-MS-TrafficTypeDiagnostic: CY5PR12MB6528:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: slefZf4gcGIacZn1MDk2w0px+MKOS0ITHbGm5YjAplNKvi+YwTXLDDprssygHM/Sr65I7ru3qvCQ0v9DuvKNmT38S2LrT/z0NTB/4gJbBc4jpez3dHqfRGVy/Z/yGyRMd+vJeTYmXKjZtWWrxVsLyrsdtQnJPgyLTDl6JGFcWed8gBjya7UHAUZ3grAY64TWWL5fe7oYPv4DWZLig+xTq0NZU5AuqNgiAz7JSPbIrakfhploGB0RVEVPPdMOo1QPNVqYbY/5/399rprPilGjIIY6/SkuC/uXt49hpQsKWBZJ6Oup2LeMA+2EVkE5EcNQ/zVpAvtlT8/lUWnu3wUXlbb+ay/fHvZ+4G1d9/f7p7vA9lMm6bDCqZBBL3c44MtjK6F6LniaGCbgLgLaecBozGTDB47evIkHfRXEpwUmGCbyiIK52qiBLr5N54tFIZ5YjteK1v4SjBnSeFL5GRfgaDCc1DULsg2GRzUtSR9jknzQRXdY+bDvrrh7Vl8q6iSaWGPcp3GGXDquQsUNUpBbSCcNPMFwKHW3934eJrzveFASGsiHdVb7aNy0+FzfPFanb0tfz0w9Dyw9N9+/HZbbQEQuZuxAx9b6uS/d1Tv/6gLjGGuwACxqwx+2U7nWXhSebzOUjJVrhCVCejr/bH/06UoDdvq4bkGla2D0G3AbgXnwcKCHOwJ1DS1w2GoDiNaUyzxYJBjaYxnmOUJyZhxrOLmZ4cYkfZDSaFjAd1MnJf2cFHh861F2zqHfTWGOzNeIYXfQ+E7C67p3VvYGvobEZm93qrqWrWAGh1ra2pp62RDsT843pEZwrxuXmUZnpvjuOSZJH/r/KfQj++alF+LUNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(36756003)(6916009)(6512007)(66574015)(2906002)(2616005)(83380400001)(31686004)(186003)(54906003)(5660300002)(33964004)(8936002)(86362001)(31696002)(38100700002)(66476007)(66556008)(8676002)(4326008)(6506007)(6666004)(478600001)(316002)(66946007)(41300700001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHl0UTQ1OVpiNmcwMEhIdjF0Z0VHUTZ4a2E0ZzI1aEFUZU5oenhWaE5VcjV1?=
 =?utf-8?B?SmpZc2RwWndrN3pubU92ZytMWjVnREVLTkZPSlByUXRPb3E4RlN6VjBSWG1x?=
 =?utf-8?B?eFFjTDNwaGd0dHZMMXI2UlFUNTg5MTFGR1ZDSml5SHVBb2hmbHVhdkE0eDFN?=
 =?utf-8?B?eWM4bjNSeW4vanNvaDRaRXZwb0psUjMrMjhaNVI1eDJNRlRLaGtrRTl2V2ZN?=
 =?utf-8?B?djBDbk9NOWsydTlKNG90NXMwd1NlSEpRVVFtc21mMU5ReFAzdTQzZDNTWHU1?=
 =?utf-8?B?aFBIZzBWbE9LZGhmYkY0WGl0cUhNdHNOUVBpVlVrOXZPbXl2b2VHbXd0SFdD?=
 =?utf-8?B?Nk83RWx5anFNeWgydnBxcVlxRFMzamR6YTFRM3lXLzBDR1BYUFhQOEhpM05Y?=
 =?utf-8?B?U2NaQnlnSXp1MkV0K253ZVd0MXlrMytiaGozSUlaUjR3Uk5uOWZSZnZibHhB?=
 =?utf-8?B?OGZaMzJDMG5vRGIwaEgvR0JHaHdlQ0cvSXhRVTA3QkI5dWY1YVZRQXlMT1c1?=
 =?utf-8?B?WS9xRXZscUZvZDQvWDBWc0hHNW85WWFPVSsyVlhFMys3V25EQXhjbTd5VE1s?=
 =?utf-8?B?QnFhSmMzS1pGcndJUWR3R2lTR2hrR2dOemRXM1FuS1pQL1RYN3hQUW5Va2FJ?=
 =?utf-8?B?cmhoNkovditXQVBWM0p5V2hQRDJhVS81QnpITkJOdnlpclFWbDQzQ3VMcEgv?=
 =?utf-8?B?ZVZ5dW9zSFpzQlRkeFdWd0tPczVSd0tiWDByZFUvOHUxcms0Q2crUzBjTmNH?=
 =?utf-8?B?YitSa0dBd3ptSWNvWmZNVFc4dWI3WFd6RzRpRU5hSVl0MnVhS2Rha3BjU2NO?=
 =?utf-8?B?dGJpVXZVUVkwM1k3VktXQXlSYzB6RGlpVHpFSzdoWTRrcXRZdWFpSFlWbEgy?=
 =?utf-8?B?cXo1ODJ3ek5YZGVhSGhIVjdsWXNtalBOelZoTlRLQnY1TFdWQlhDOEgwVU5a?=
 =?utf-8?B?Y3BzNTJTVTNseFlZNlJYbktWUWY4Y3Q0TFFBTDN2NGNLQzFDa3ZKeXBOVnls?=
 =?utf-8?B?ZUU2S0dKODZMSnp1ck81R3JZR2xUbncxbkZTVUJQa3B0OHdVTzdybHlBVGxK?=
 =?utf-8?B?cTVDT2NvazY5RDVYQVVpNHlOV0VHa0g3b1VBekNLcC9sVVRPYkN3YlNUR1ND?=
 =?utf-8?B?WWFvYnl5Yzl3YW00dVJtdElTUXlTWDZuVmVHb3I4UlJzYXk1ME80ODM5a3pI?=
 =?utf-8?B?VC9BSlRWOGdGZ2dPclJ6WUZoQTNCL2M3THhncU1nZFdkSzFyWlM0RjV4UmdY?=
 =?utf-8?B?MitpL2ZwSGg4Q2hmeDBJdmRSM3ZmUGdSbDdWNDlwaUh4anRjOWFwOXN6bHhJ?=
 =?utf-8?B?VXBnbjdRYXQ3TEFlT0hBbUZqNlIwTUF1NW10WitIdndGVVJkNDNwVkh5Rk50?=
 =?utf-8?B?aHM5N3BqOExaaXUrcU1Qb2UvajBRTWZtcHhTd1JmNHpuT3RJM2Y1cVd0Yzhp?=
 =?utf-8?B?dDlZRTQ5ck90ZFJvanNLc1RkSnBYVXVQUmFyQk5VdExocjFXS0krWDkvaE9E?=
 =?utf-8?B?MWgwc2c0TEE1elFISWd3czlWam9pak91Q1ZzMTF0ZkRKYVRIY0FVOEFPQ3Q3?=
 =?utf-8?B?K0pjYlJtZGZqQW42SDI2SmZzYU9ab2ZHV1VmdG90Sjc5L1p5YmtwbmNVT3dS?=
 =?utf-8?B?ZzJBY1R2SVZ4SFQyWEtZUkNUQjMvRUk5d3oxcHZaTWE2bThBamNJYWVOL2Ns?=
 =?utf-8?B?V2lKSzRZUUJaQzlsU0c3MTJnTTNvYlowMC82YlJRdHBDYmhndzdMQVhpT0Fs?=
 =?utf-8?B?Vk5UU2ZDVTRGUTl6S3dWSjFrSkttSEcvNTdTWTJUNWpYVEdPVTBLaXp4cTZM?=
 =?utf-8?B?SGljd2RTUjBya3ZNR3dGV3BWcElHRlQyS1dubm5ySFdwY29jZVFDSktRVnJk?=
 =?utf-8?B?eUN4amVDOXF5WFY0R3NqOVlGR243S21IRE5iYTJreEJ3aHhicGlycmlmZFlT?=
 =?utf-8?B?OVdLdFdGKy9jenlYb2xDZUQreUlmTTlMd0sxdklZRzgxaU82YkpxMUovQTl0?=
 =?utf-8?B?dFdxUDkvWWFhZjR1cThOR0dNaUliK3RKUHdQaHV5UXBhSU5TRFNxOStLY082?=
 =?utf-8?B?VkVrQXlxd0xOU3Rwbm96ZVUxWFAyaTZWcXQzeW1EZ0tPNDI3ZVlRK2pQOFNT?=
 =?utf-8?B?SmFZMnJxVHV5TVJNYWZwY2JUeUE5eXFoM1BPQnZaeEFOR2pQK2tSRER3T3ZR?=
 =?utf-8?Q?8g1HO/LwqAbM8yE6AQsxU/MKSoIMVU0iFzgHrwKC+Wbh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 222e5942-0bf4-49f9-eb93-08da56b2c45a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2022 13:58:22.6369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qry560bz7Ydi51wLRbYzoOIk65/FK9gvS8JZbj8L7A/oQTPCVYCu43gn8MYxYpgo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6528
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------S3jBpVoNnGJqrfzEebU0AVaL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 24.06.22 um 22:34 schrieb Daniel Vetter:
> Digging out of a hole, apologies to everyone.

No problem, I'm totally overworked as well.

> On Fri, Jun 17, 2022 at 03:08:00PM +0200, Christian König wrote:
>> Am 17.06.22 um 15:03 schrieb Bas Nieuwenhuizen:
>>> [SNIP]
>> BOOKKEEP is exactly for that, but as discussed with Daniel that's not what
>> we want in the kernel.
> Not sure which Daniel you talked to, but this wasn't me.

Hui what? Of course I'm talking about you.

>> When you mix implicit with explicit synchronization (OpenGL with RADV for
>> example) it should be mandatory for the OpenGL to wait for any RADV
>> submission before issuing an operation.
>>
>> What you want to do is intentionally not supported.
> vk is very intentional in it's rejecting of any implicit sync.

[SNIP]

> We should probably also document this in the kerneldoc for the BOOKKEEPING
> usage that this is the fence type that vulkan cs should use in all
> drivers, otherwise this will become an endless mess of driver specific
> hacks (i.e. the world we currently live in).

Well, Daniel somehow we are somehow not talking about the same thing here :)

I've documented exactly what you describe above in the initial patch 
which added BOOKKEEPING (I've still called it OTHER in that iteration):

> >/+ /**/
> >/+ * @DMA_RESV_USAGE_OTHER: No implicit sync./
> >/+ */
> >/+ * This should be used for operations which don't want to add an/
> >/+ * implicit dependency at all, but still have a dependency on memory/
> >/+ * management./
> >/+ */
> >/+ * This might include things like preemption fences as well as device/
> >/+ * page table updates or even userspace command submissions./
> >/+ */
> >/+ * The kernel memory management *always* need to wait for those fences/
> >/+ * before moving or freeing the resource protected by the dma_resv/
> >/+ * object./
> >/+ *//
> >/+ DMA_RESV_USAGE_OTHER/

Later on I've even explicitly mentioned that this is for Vulkan submissions.

But it was *you* who made me remove that with the explanation that we 
have to use READ for that or we break existing userspace.

I mean that still makes a lot of sense to me because if I'm not 
completely mistaken we do have use cases which break, especially 
Vulkan+encoding.

Regards,
Christian.

> -Daniel

--------------S3jBpVoNnGJqrfzEebU0AVaL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 24.06.22 um 22:34 schrieb Daniel Vetter:<br>
    <blockquote type="cite" cite="mid:YrYfw6T4MGvifIco@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">Digging out of a hole, apologies to everyone.</pre>
    </blockquote>
    <br>
    No problem, I'm totally overworked as well.<br>
    <br>
    <blockquote type="cite" cite="mid:YrYfw6T4MGvifIco@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">On Fri, Jun 17, 2022 at 03:08:00PM +0200, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 17.06.22 um 15:03 schrieb Bas Nieuwenhuizen:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">[SNIP]
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">BOOKKEEP is exactly for that, but as discussed with Daniel that's not what
we want in the kernel.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Not sure which Daniel you talked to, but this wasn't me.</pre>
    </blockquote>
    <br>
    Hui what? Of course I'm talking about you.<br>
    <br>
    <blockquote type="cite" cite="mid:YrYfw6T4MGvifIco@phenom.ffwll.local">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">When you mix implicit with explicit synchronization (OpenGL with RADV for
example) it should be mandatory for the OpenGL to wait for any RADV
submission before issuing an operation.

What you want to do is intentionally not supported.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
vk is very intentional in it's rejecting of any implicit sync.</pre>
    </blockquote>
    <br>
    [SNIP]<br>
    <br>
    <blockquote type="cite" cite="mid:YrYfw6T4MGvifIco@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">We should probably also document this in the kerneldoc for the BOOKKEEPING
usage that this is the fence type that vulkan cs should use in all
drivers, otherwise this will become an endless mess of driver specific
hacks (i.e. the world we currently live in).</pre>
    </blockquote>
    <br>
    Well, Daniel somehow we are somehow not talking about the same thing
    here :)<br>
    <br>
    I've documented exactly what you describe above in the initial patch
    which added BOOKKEEPING (I've still called it OTHER in that
    iteration):<br>
    <br>
    <blockquote type="cite">
      <pre>&gt;<i> +	/**</i>
&gt;<i> +	 * @DMA_RESV_USAGE_OTHER: No implicit sync.</i>
&gt;<i> +	 *</i>
&gt;<i> +	 * This should be used for operations which don't want to add an</i>
&gt;<i> +	 * implicit dependency at all, but still have a dependency on memory</i>
&gt;<i> +	 * management.</i>
&gt;<i> +	 *</i>
&gt;<i> +	 * This might include things like preemption fences as well as device</i>
&gt;<i> +	 * page table updates or even userspace command submissions.</i>
&gt;<i> +	 *</i>
&gt;<i> +	 * The kernel memory management *always* need to wait for those fences</i>
&gt;<i> +	 * before moving or freeing the resource protected by the dma_resv</i>
&gt;<i> +	 * object.</i>
&gt;<i> +	 */</i>
&gt;<i> +	DMA_RESV_USAGE_OTHER</i></pre>
    </blockquote>
    <br>
    Later on I've even explicitly mentioned that this is for Vulkan
    submissions.<br>
    <br>
    But it was *you* who made me remove that with the explanation that
    we have to use READ for that or we break existing userspace.<br>
    <br>
    I mean that still makes a lot of sense to me because if I'm not
    completely mistaken we do have use cases which break, especially
    Vulkan+encoding.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:YrYfw6T4MGvifIco@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">
-Daniel
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------S3jBpVoNnGJqrfzEebU0AVaL--
