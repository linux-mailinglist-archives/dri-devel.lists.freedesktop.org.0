Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9588753525
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 10:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F233910E087;
	Fri, 14 Jul 2023 08:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762F110E087
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 08:40:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXNecy73CL9p5rEH4aERwcraDGglCrUjKmo6s7qrUlB0XmTa0ObDl5iKnztsfhuxTSqIK0NRiPVAOUKi/I141xzAerXc76cmMkR7vwFjWS5bGQT32qe1EY6ENzQPoQEemfp+tZ0TRMD9DzoQJv4xfH99YAlryABSYUw6WmpXzLan953L4bmAvRC5Bgcu5RlPgHn0uoNMPkp+8v54i8evcCEX2TRk+OXEvFngdvoPmpMIQdcvzX23d3HO8Hs3ZsEbFEovIDq6LXi3c0SjFI/tOcvFc+hgvKTvo6Fmo/pvDNcZvEKilw0JU4nIiiQU/1NyNa0PklcMPOF5Sasj/Ey9mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EsmmI89Z53hQCdJmxt6wU5nE0m3+5uI2V7gIDXRzB8=;
 b=RlJgykZQ4cKU1vBQ+RtSFdw6z8n3wYECDeqRDQjhzfdKOv5sl/EKhLNa6V6m/Zh570tbjzWtAHVdT7xc9OGW2kQOdNAWF46XOpKV3U5QWEwGJs6J33neA+BEscmEPv5KKHPC8mDEMidQ/6GHSKsy6lhjYh5xaNmOvDZt2pV5aawSkPlp14WmgybG2Spbq4fkqOVpf3SVVIQWgPAp+kkTVfoXrnPOvvQRnAmUVgkgHOcX/8NVxFjRIvlKpos/VNi957NcLkn258YjLA7xgDorZM7DHfGQO1MRID5NZUVonzl97FpgKkyTNZdqShLQLqC74dJBnulupOpoaypHnoVPhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EsmmI89Z53hQCdJmxt6wU5nE0m3+5uI2V7gIDXRzB8=;
 b=oAkb6qpwYGTTnE89PPs3u40OUGt/JkHGGtx7/C36ueK7+y7HukUDZ1KI9ItxSBoe+tM9oo1eUmufswvFY55V/ngWuZbc7SpyzsYrGvXK/1je+27Q6t9MzDntjQsJyarVVQuUnOz73xMIyrJ8PqTPfuumJ0ihZqDyvUXneuTYyxI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW5PR12MB5684.namprd12.prod.outlook.com (2603:10b6:303:1a1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Fri, 14 Jul
 2023 08:40:10 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921%4]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 08:40:09 +0000
Message-ID: <332e031c-c04e-998c-e401-685c817ea2a1@amd.com>
Date: Fri, 14 Jul 2023 10:40:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] drm/scheduler: Add more documentation
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>, Luben Tuikov <luben.tuikov@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-1-c567249709f7@asahilina.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230714-drm-sched-fixes-v1-1-c567249709f7@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW5PR12MB5684:EE_
X-MS-Office365-Filtering-Correlation-Id: c5b3807b-9f9b-4a9f-6f5e-08db8445ee33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J+92gTXOiOG99MYPhMGYKNFH1w5sxKmEv1YJOq18HteS3GRN5zNmCuWuiPKY8ZpwvtcX50dGX+dKx1oOzKe2w5oscyEJEzHBeMu91WEoHDHqnBQ9DUoDuV6EX7j7IbEWuXk6Yi9BT2Vc/fArfKv+7uCKn75AsKxeWYryDZIxoh6eeLI49jXiyiKvu3ExjutEInEAQDJhJPJuwmPzcBAnrGkM0c4vO6a9vbjB+TTAXhEXJLRK7dOsFtJSVL3JPqDubUglANQMrFRtQNcOnhtHHNFkabF5WO4bj88CAOAaFUvrd3o28ZTTosegGoShgDNLhUea4th+mOZlz3zDqg/9JWsZK49yX7VoVjHscSvTRDD8DWUNfwA2tYjBhl2OkYB0ZW+eWS5bwge6uPjxDk1M9nsbqlAWfshnr3Q5hOV4Qk8FeQtUJ6K/wcsGd1/f+HptVeIcfzysv8Z0EvfEewyOaDLgR97BQfk9UORTVrLtZhrBYhTmCYS7v9tIUj0fd5eMx8agRgCnzNxwkNHnDgA7FWKhqti9TM4D+K9KN6KNYovOLMkR1wqSO5M/XEwkJbFbhFtnOU8e1F0hYGIADTDDOFLjw86AdhVThkIUyNkSHNOHXBImjf1zuWpYeXZgIKj1gQEAmU49JFIfPuDGWdmvpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199021)(41300700001)(2616005)(83380400001)(4326008)(8676002)(8936002)(38100700002)(66556008)(316002)(6506007)(66476007)(86362001)(6512007)(478600001)(6486002)(66946007)(6666004)(31696002)(110136005)(7416002)(5660300002)(36756003)(186003)(2906002)(54906003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Skt4SEsydHY3M29zNUQvUkIzcjNVb0c4TzJVckNYQmNCcGo1bnVxL0E1bDR5?=
 =?utf-8?B?cWV6cTFaeDBBaW5Ea2FJOVNwUFdaOXdjM1VJdU9rZlNsUVh2K1QwQnNXa0Z6?=
 =?utf-8?B?dzZacTA2MzJublczN0VJZXNTTjJZeEIrdUZRS2s0RGhONkNTT0F2L2lxTFZh?=
 =?utf-8?B?Yy8zaE1yZk1OWmhUYmUwMlprSHJZbTBTbG9sbmtaTzF5bzNjMzJzd1R1S1N2?=
 =?utf-8?B?NUpYNXNVVzNpbVMzVG1CaU1pcDU0THFuT2tTSXM4Tk5ad05tOWJDT3dMQkVp?=
 =?utf-8?B?TFZpQld4dS9BZkVzWGJRWWVkVjZRWWFOVzUyTjVVZDhIK3R1STdQdlpkc1J3?=
 =?utf-8?B?c25SMlNzdjRISXNtRWc2a1BEVU9pRVFzcUxsZ0UwVnlXVFhENStRZkpyQnJ6?=
 =?utf-8?B?bjBoMTFXUGwxVnJYNG5GTVVtQVhUR21XcWwxUmlyWWc2R1NpZ0gzRUM4Z2t3?=
 =?utf-8?B?MkZjMk9GeitsTFdWeXowZHRnT3RwSTdLYlIrZnRpTU52RC9iYUtVTHRsMHcr?=
 =?utf-8?B?MU0yYlF3VldtdmUrUU9zbTkxOG9nSzAzTUFoa0MvKzdpenlhQllKMEwzU2Uv?=
 =?utf-8?B?clhEQk9pYlR6aHlieUxRWHdrK1NXZjhxZXpTS2FXbkFnZ3lvT01iT3FvaUpT?=
 =?utf-8?B?K09YNGo0Wm5mWktvLzJaSW9hV0ZBTERPa2xnNHdmaWpFWCtUbk5FVWg4MCsy?=
 =?utf-8?B?K0NkMHJzV0pUM01tQU9qTkROaXNUTDFjNklOMytnb2dNWU9ETlNnV0VCRWJF?=
 =?utf-8?B?MmF5UHdMZWpOTDBOcHpSRzF3aEJZQmZIWTA0QVBFaUYvRXhzcURVQ042SGZw?=
 =?utf-8?B?SEMwekN6RFBnZWYwZmNVMHJxTm1NNi80d1Z3aFByQ3drQVprRitnMENtL3BR?=
 =?utf-8?B?dHQ3NFVEYWNvMVNvZmMyTmtPMWd4eW95NnlRYklyaTh2NEUxZDZ4Zzl1U0Qy?=
 =?utf-8?B?cGIrbTBKUmlvQ1RxdUoxRG9SektycFFScEFUWDFzOFNqaUk1MXNIUERvcjcy?=
 =?utf-8?B?WEEzTTR4aHhNb0d3YmxEV3NmNXQrdVI4elRQQXBTVGY5bURJYzF0QnMxUEdv?=
 =?utf-8?B?N2hGY0I0MWtaYlJIMjAyWHZPS2t3cDVKS0h0a2lmR09IdElvU3JYNEw3aDY2?=
 =?utf-8?B?Y1ZTajh2dFQ1bUR1bjJsbE1YenhOWWFCOFZIaXI3ZFpmQkE0cmIraC9aTkhE?=
 =?utf-8?B?U0JvR1pGL1F6U3JIS0lvSVFYUmVIVEtYR1VaN3RhaFJBZ3c1UnhQdStQcDBn?=
 =?utf-8?B?RVFnSmNkNjdJOWFMY25VZ2ZGa1IyY3lYekMzSGVJZXlWTW1CdG5mQzJRSGRp?=
 =?utf-8?B?bXhPcXc5bWQ3L0pkdnhSZkdJcDRRTjNIQWY1cmtLWTRFSW9kZ1ZRd3lFaFI0?=
 =?utf-8?B?U1llQ1ROMmdldW5iOEFOWVplYS9RZVdHd0o2REZCa0paYmQzaFNOckxjMThY?=
 =?utf-8?B?RVQzMjJiUkZZY2hTY0xsem42QWs4TEVSb2F6OXZWbW5jdVlnOG1paEYyRmtj?=
 =?utf-8?B?UE5HOVBHMW9pdElZR0V4RlFKSUxWLzVybnlHTW9lRSthMEpyMVRyeFZlVkI0?=
 =?utf-8?B?cUI3eDVoc2puZzdyMmxmMXgwNStxMXYrYWRFQ2ZZeFhJMmVRdWtzT2x4UGZ1?=
 =?utf-8?B?c3h0SC9lZ2lvbnBLSDdPTUc4ZEc3RTd4M3lJNzUwQllzbGNYdGdQRXlWV3lL?=
 =?utf-8?B?UnFSVHdjbzBwTW50TDdDaTNzZGN6cWFlMWRnc0t5TnJ3MGhUa1Y1b0RmcEVV?=
 =?utf-8?B?VGN1eStxVUcyNjJza2h0NUYrRGxvVWZHMzdmQThBazRPQzhlT3JQeUNBQ2NL?=
 =?utf-8?B?U3VvYXFlTmttWDFETzU3YWM0K1R1MDBaa1hNbXQ1c3M5S2xySVR2eTRGTEMy?=
 =?utf-8?B?TGgrZEtNTVB6NDZQR05RUEJPRUg3RVBaWDdrKzFHUS9BTm4xY29WbGJwYUhF?=
 =?utf-8?B?MWFHZ01GTFRUTHp2R05IeE5ERW1hV0I1b1JWS2lVWWNPSndFYlpkRHhKOThy?=
 =?utf-8?B?TjhXSnBjT2REamJKalU2cUpRTzY5cjNmVDBWVTNQTGNka3psM3pHVldKUWI1?=
 =?utf-8?B?U0YxbXNZWVNDWkc4WXQwT1J2TlhJVEpPQS9RUEZsWnRreUl6NFhaN3ZHR29l?=
 =?utf-8?B?ak56bjk2VlIyVjlURkNJbmROQldGcXdHaXVla25JdzkrL29VQVNLSkV6NGxm?=
 =?utf-8?Q?EewElrMaYzywUc45pOllCfPrQXc/5GXS/FhCEbDLYZiY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b3807b-9f9b-4a9f-6f5e-08db8445ee33
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 08:40:08.8933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5hVQ9NPwQ+tywLj/r9/X/Co8XUUaic1b8BNZlqUqcEfX0qKrgBH+LvW+NMTBP6FM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5684
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
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.07.23 um 10:21 schrieb Asahi Lina:
> Document the implied lifetime rules of the scheduler (or at least the
> intended ones), as well as the expectations of how resource acquisition
> should be handled.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 58 ++++++++++++++++++++++++++++++++--
>   1 file changed, 55 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 7b2bfc10c1a5..1f3bc3606239 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -43,9 +43,61 @@
>    *
>    * The jobs in a entity are always scheduled in the order that they were pushed.
>    *
> - * Note that once a job was taken from the entities queue and pushed to the
> - * hardware, i.e. the pending queue, the entity must not be referenced anymore
> - * through the jobs entity pointer.
> + * Lifetime rules
> + * --------------
> + *
> + * Getting object lifetimes right across the stack is critical to avoid UAF
> + * issues. The DRM scheduler has the following lifetime rules:
> + *
> + * - The scheduler must outlive all of its entities.
> + * - Jobs pushed to the scheduler are owned by it, and must only be freed
> + *   after the free_job() callback is called.
> + * - Scheduler fences are reference-counted and may outlive the scheduler.

> + * - The scheduler *may* be destroyed while jobs are still in flight.

That's not correct. The scheduler can only be destroyed after all the 
entities serving it have been destroyed as well as all the jobs already 
pushed to the hw finished.

What might be possible to add is that the hw is still working on the 
already pushed jobs, but so far that was rejected as undesirable.

> + * - There is no guarantee that all jobs have been freed when all entities
> + *   and the scheduled have been destroyed. Jobs may be freed asynchronously
> + *   after this point.
> + * - Once a job is taken from the entity's queue and pushed to the hardware,
> + *   i.e. the pending queue, the entity must not be referenced any more
> + *   through the job's entity pointer. In other words, entities are not
> + *   required to outlive job execution.
> + *
> + * If the scheduler is destroyed with jobs in flight, the following
> + * happens:
> + *
> + * - Jobs that were pushed but have not yet run will be destroyed as part
> + *   of the entity cleanup (which must happen before the scheduler itself
> + *   is destroyed, per the first rule above). This signals the job
> + *   finished fence with an error flag. This process runs asynchronously
> + *   after drm_sched_entity_destroy() returns.
> + * - Jobs that are in-flight on the hardware are "detached" from their
> + *   driver fence (the fence returned from the run_job() callback). In
> + *   this case, it is up to the driver to ensure that any bookkeeping or
> + *   internal data structures have separately managed lifetimes and that
> + *   the hardware either cancels the jobs or runs them to completion.
> + *   The DRM scheduler itself will immediately signal the job complete
> + *   fence (with an error flag) and then call free_job() as part of the
> + *   cleanup process.
> + *
> + * After the scheduler is destroyed, drivers *may* (but are not required to)
> + * skip signaling their remaining driver fences, as long as they have only ever
> + * been returned to the scheduler being destroyed as the return value from
> + * run_job() and not passed anywhere else.

This is an outright NAK to this. Fences must always be cleanly signaled.

IIRC Daniel documented this as mandatory on the dma_fence behavior.

Regards,
Christian.

>   If these fences are used in any other
> + * context, then the driver *must* signal them, per the usual fence signaling
> + * rules.
> + *
> + * Resource management
> + * -------------------
> + *
> + * Drivers may need to acquire certain hardware resources (e.g. VM IDs) in order
> + * to run a job. This process must happen during the job's prepare() callback,
> + * not in the run() callback. If any resource is unavailable at job prepare time,
> + * the driver must return a suitable fence that can be waited on to wait for the
> + * resource to (potentially) become available.
> + *
> + * In order to avoid deadlocks, drivers must always acquire resources in the
> + * same order, and release them in opposite order when a job completes or if
> + * resource acquisition fails.
>    */
>   
>   #include <linux/kthread.h>
>

