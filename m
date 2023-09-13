Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0238979EC0D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 17:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3577510E4C7;
	Wed, 13 Sep 2023 15:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2057.outbound.protection.outlook.com [40.107.95.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D6810E471;
 Wed, 13 Sep 2023 15:05:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPxVI0CvS3db11wwi1nRCzMBrfFnhNJazvZulCENmfgcF6V0ljGzWuXv5AfwInwd7CsW0dB8WwElUqlJ3GJ+puTZzaPXaxC/BqcQ2beWqVB1nW3fkyS7uKsCVBU1/G9y/7hHpv7BFGMMPap75Y9VoNhvapAtIj84beXQT1ElmIdNjOJiV3zaueEul7YpG3kJYgl67DfD1z3zg9HA619P/yFPcQVyzh2y/NufVjhRBU49ySi88b3LnzGw6nYEEvpwn8mFhc6qr1ZP0gBcNaIV6o7coWu3vsI1SbCP4t0kccfksJcxxWEL5hkc70362qqdDRWGl4Oi0iB4hjuO7DP7+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOKplv30tV1xDEuABlTHEvPHE61DBm90VI5zKLWeNIU=;
 b=R7Dr4S/QjvptHa0/9L0Juxk8tkJkNNhlR0deD/FJoJ//po7AQPuKBxMh22+NeGhimWh57AAnWgBbxUPBImijpOp0cXYFKbpcG/a/qKsLyZAFldiHKrOQIe9TOjwyxvZ7ehNUJCKAGIc1kobWJoryt7/qTBDGmQ69OuLLR9ms1uO+8sQZfEqEoZpGc1J7SFjzzLqll+8lE09yNIs1Q8ACSJKTiZX8SeCfT5w/9JWVFfDvEZo7u/WC0rMw3LIvBEf4cchjkqZpDP6XusO/pUNP7BRhNjx01eV8bY/ev8Wj6ZOiw5duz46uK/IlZnKHjk04nvBA0r8Yhep5q1e1Z4+cJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOKplv30tV1xDEuABlTHEvPHE61DBm90VI5zKLWeNIU=;
 b=1gXtPjyxSiDOsVHpxfCxu97EFMpWk+6aH2K52L6e/u0nYyq+hA+Uw1pD4jo+7J8suIJhzWFbM5l0gDmxNZYzV32w3ysb3X6yow49ZudXTE2bJm4fNlQU3BMaOBp9kk1O2aMCDUIvDO2XvFL7qDplNyuYiKDmEnktnUFinLQiUTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CYYPR12MB8702.namprd12.prod.outlook.com (2603:10b6:930:c8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Wed, 13 Sep
 2023 15:05:01 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 15:05:01 +0000
Message-ID: <3087d60d-a3e9-f3d9-651f-8977c15ee4f8@amd.com>
Date: Wed, 13 Sep 2023 17:04:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 12/13] drm/sched/doc: Add Entity teardown documentaion
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-13-matthew.brost@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230912021615.2086698-13-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CYYPR12MB8702:EE_
X-MS-Office365-Filtering-Correlation-Id: c09791b4-d8a7-4a56-63b1-08dbb46acdc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I8eJzJSCI92d/oprC7Q8FgsIvRMqcubvBDVQky3oymHlKzDxvGvp8PPRJDCaoA3OpgBaV/M4goER4kU36NjnQL3pPaIRr6Ez4cvMPnvsyHecRmUxbwY0o8q5C7Z9gWpfrDXb5G9VGwTiP95ESog6ZOnTbsdep4aQYyTPzCgjsLZyA9WY7f5g1AhnO3/KRP7rXGueXb1GaHjb/jE+3zUQGoZ5j2UwZr66ZWCpcvILQ0mV7alGPqX0YhwcvbVw6LATPFhm/gphsGuF8zjniWVWlA0iXNRqSlyZ8Z6p33b67vR8OC1mw1zKBSKz7e75AGpwQxjvo58RKd+97ed3cp7tzilGv5MlcXLk/S6o86I/TN8Z0F2kTCEVkz7x71yS0L0rvZYu/ZzgePPQW455RAKbt+Eud9H0M05zyIpnsh5plWPFHpplmfEmWLJarS3rtesdF+noF985KJ2WphWbWorAf+JOmBA7SlVWR+IkofJmNPHYbkfTP3hyu3/2g4KGHiPwRgac22CwdWvGAxJeSg5bbulsseofqIZmoOg+xPWoQIf6R7mjOolBqB+kcM3wGVNpLkJMoww4CK5Ij2Ixm408JHtpEYIJuu46uf2KBb/nVA/n+jXLCIrY8fFq2Muu2evQq1Ko+uT0v19hafeaJdMzyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199024)(1800799009)(186009)(6512007)(38100700002)(7416002)(2616005)(8676002)(86362001)(66556008)(5660300002)(66476007)(31696002)(66946007)(8936002)(41300700001)(6486002)(316002)(6666004)(478600001)(4326008)(36756003)(83380400001)(2906002)(26005)(31686004)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGk3V2NON0pDMUNqMCswRG9GdFZYcmZjYjErRlR6UHpWOURsdG51eEJNcTM0?=
 =?utf-8?B?NnBmdEY4S2RFc1UxdmswYXFUcThnM0RXSWlXay90N3dDR0pxRWVETXZ0eEFX?=
 =?utf-8?B?UnRiQ2toSDBzWkpQZDlBZ2VVS1dSREgxbG92c0lTMXVZTkhlVE8zakpxcVV1?=
 =?utf-8?B?VFo5N1I0Zm5yRFhzL01wVk91bE9QTGNhc3AyUm1HcHFoYjlDaDBlQzZ6TURs?=
 =?utf-8?B?WWIvMjlWOVBGcWQ3N3lSdEJTd1BROXRTenpFcnZzRW9zSnpodG1Fc2MwWUVY?=
 =?utf-8?B?QTc1NnVpRGR1N1BxL2J4Z1Nxb2syZ3lXeldUbTFjdlpJSVJ1alcrRVhxOHhq?=
 =?utf-8?B?YzArSXlYM082cGdMbEUvSHdxanQzbUwxUE1ucFZEUzU2NUVlREdTQUxhWCt3?=
 =?utf-8?B?YWJaVitabEFhYzFJSFNBQmVCSnhpT2dka0Z2clZDQ0ZCeXF2eUlQclQwZWNL?=
 =?utf-8?B?YUZtYi9TU3VLUUtVNGg0cVUwQ0RVMkQ4a1E0WnM1N3pBY0c3amRIS0I1WW15?=
 =?utf-8?B?eElGN2QwdDQrNFNmR1hqTnhOZmdyaUhaV0wrbFZXZXczY3RnejRkaWlxbHZq?=
 =?utf-8?B?bitIYmZIZjNmRW03Yks4LzdaOG80ZTBwcW9wWm5RQ2VSL2F5djVCcFJkUDNO?=
 =?utf-8?B?TU1DUW5JRXpvdWtKRFlKWllTMmZjc1ZHanJBUklySjJ3b2dxRHUzdjRRVUVz?=
 =?utf-8?B?amFqOUdsSktyZWZmYnVBWTVUV09XYlBNN2FtRlBwVGFyQ3BnUzBSbzc4VlUx?=
 =?utf-8?B?dlZwd1dmckp6ZXI4RzRnTDcyMFZkelhCQVJ5Y25KYjJ3V1dGMmdDVnU1Z0tm?=
 =?utf-8?B?VjFkTTJRckY5aUxKelVBSExoQmwzdE1yL21iZWg5K1lSZ2dKWkJvc0dWM1JS?=
 =?utf-8?B?elNlTjB3Q1pBblQwWHhjN25lbFUvcFFEazFwZjZWM3M1KzNhczJsVUtHNGMr?=
 =?utf-8?B?M3loN2JRQWFPZUliQm1nQkNsdFZHVUlHeldCdmpoUENWRDQ0TnNKWmlSaXk2?=
 =?utf-8?B?STczK2s0VEx6cHIwUWduamRNNjJLUUp5VjlicFRwQ2F6WlNMUXdkd3hWUE53?=
 =?utf-8?B?MWlucmcrY0k5ejVETTdOL0paU2d3alNGQjJITVZ1ZnlIeG9DUHJiSGNEanFm?=
 =?utf-8?B?Z2VER2paOFF6WWVBUHFQRC9xKzRKYXpoOHlmWUtoTWtKZTB0b2dJNHNLalFF?=
 =?utf-8?B?ZHlvYVJJNnZjbnJ6ZHViTUp3OE9HckNpTVNoRU1ySU1pSXRxaGZ1K0tSajND?=
 =?utf-8?B?Wm8yL2xWT3BUWHllODhJeFZTdUd2NmVFTEJEdkkxZiszck5NNCtUWTJSdXRF?=
 =?utf-8?B?enpLQWZpNGpmanFhYmQyUU56MlhiL1BzRk1xMmRCQ0w1Z3dCekhxaGpkMjIz?=
 =?utf-8?B?bkZlSk92czh6WlB4dWdrdCtiU1J0Z3BibWcxRnpiM1BPQ0NNMm5rL29HUWho?=
 =?utf-8?B?TVNCVnlzOHB0QmVRZXM2ZmxVQzJQZERkMnJqbkRDZlZPZUZ5TU9hMTVNYTRY?=
 =?utf-8?B?aWVhWnpoTVN1RUtDbDNkWTlILzNKZXNVek53bS84SXNEeXp0SzVCQms1Q3h4?=
 =?utf-8?B?a0Q1a09HaFdIUGQxaTYzZFo1WnlVSmhXMU5VMlA3dkJWT3BCTnlSd0d2anZz?=
 =?utf-8?B?SElqRXpjSlRxWUVLMUVvRUNwbG51UG1TQWdjZDlybjBUNUlxRko2c2hZZTJy?=
 =?utf-8?B?TXlRUUgxMEkvemtSNm9pTVBoZ2ExRnRydWIwSE50OHhSVTFQQmdQbHorSjRW?=
 =?utf-8?B?bGlTSjFneC9JSEVnWERPVmF4YmRXdXpTa2UyVTJJMlVFK0d0cGh0QmpiejZy?=
 =?utf-8?B?WUpwa1laRnVYcEJTdWYwajdqT3ZaMjdMaTdtMCtqQlBKOXhmUm91cTQwdTF6?=
 =?utf-8?B?MUFKYm41akp5cncyYUswUlJFYjYwZkM5bWNRNS9DUTBGVkpyWWY1OGgrM00r?=
 =?utf-8?B?MDR6SkdoelQwOEpMNUxKeTFBY1J5VmhaYXo3V2JkQ2NTTENITzVESE94ejN1?=
 =?utf-8?B?cjRLdUFzMXIxWlR3eS9iU3FKTGcwVjhIN1NScEhjdlpWaUx5VHh5QzN0R2dn?=
 =?utf-8?B?NTRsM0QwTFhvcUVHYmtjN2VTTFkyQkJvejdMSU9ta0dLWWRESXBZdUgrQitV?=
 =?utf-8?Q?o2/MfZgg3o2Y6cb0dRsx/I3uS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c09791b4-d8a7-4a56-63b1-08dbb46acdc8
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 15:05:01.6532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6TX8O7J4F8rs7HXBjQ9ZSx1YLfoqXWYAvi11pWstOB+6+tdAZMcP2r+kz/akCTAF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8702
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, mcanal@igalia.com,
 Liviu.Dudau@arm.com, luben.tuikov@amd.com, lina@asahilina.net,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.09.23 um 04:16 schrieb Matthew Brost:
> Provide documentation to guide in ways to teardown an entity.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   Documentation/gpu/drm-mm.rst             |  6 ++++++
>   drivers/gpu/drm/scheduler/sched_entity.c | 19 +++++++++++++++++++
>   2 files changed, 25 insertions(+)
>
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index c19b34b1c0ed..cb4d6097897e 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -552,6 +552,12 @@ Overview
>   .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>      :doc: Overview
>   
> +Entity teardown
> +---------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_entity.c
> +   :doc: Entity teardown
> +
>   Scheduler Function References
>   -----------------------------
>   
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 37557fbb96d0..76f3e10218bb 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -21,6 +21,25 @@
>    *
>    */
>   
> +/**
> + * DOC: Entity teardown
> + *
> + * Drivers can teardown down an entity for several reasons. Reasons typically
> + * are a user closes the entity via an IOCTL, the FD associated with the entity
> + * is closed, or the entity encounters an error. The GPU scheduler provides the
> + * basic infrastructure to do this in a few different ways.
> + *
> + * 1. Let the entity run dry (both the pending list and job queue) and then call
> + * drm_sched_entity_fini. The backend can accelerate the process of running dry.
> + * For example set a flag so run_job is a NOP and set the TDR to a low value to
> + * signal all jobs in a timely manner (this example works for
> + * DRM_SCHED_POLICY_SINGLE_ENTITY).

Please note that it is a requirement from the X server that all 
externally visible effects of command submission must still be visible 
even after the fd is closed.

This has given us tons amount of headache and is one of the reasons we 
have the drm_sched_entity_flush() handling in the first place.

As long as you don't care about X server compatibility that shouldn't 
matter to you.

Regards,
Christian.

> + *
> + * 2. Kill the entity directly via drm_sched_entity_flush /
> + * drm_sched_entity_fini ensuring all pending and queued jobs are off the
> + * hardware and signaled.



> + */
> +
>   #include <linux/kthread.h>
>   #include <linux/slab.h>
>   #include <linux/completion.h>

