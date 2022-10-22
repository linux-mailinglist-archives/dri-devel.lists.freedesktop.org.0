Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E81608330
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 03:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D561510E6A0;
	Sat, 22 Oct 2022 01:43:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8619A10E6A0
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Oct 2022 01:43:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBbAHVBGdsRQTEQ0FL435BWFZJMK+pfqj8XeKmIQ3GYfzf18zfo9DKYxg1QVYZkGO1aoEXNCwdDw10PILb+2GPAhHw6ZppulzCEMTW/ouYEq03sduqrZP9L6QHp8cltDZQURC8mMepFlP1Vd+xacKLV9lF1vUB6B/7VAzm2E/7Wg0+8iDx7BDpIKjWpXSRY/d8wJn5JGUlt+nUvUqJhAAYZHyc83K7NA5LZ4hVZU6+Szj/TO5DXgg0f/hAxAro5Nlm40TgfCVp9qSTw+yojVT/S4QWyddvH5O7mBDvRBkQjWN8ReD0a259ClrO61yQ7x6teWvz8why1sIBmr4pX5fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgAOKeEqzuMGmMMzyyM8xghNuhc6I5f14ZNSfSLuJlU=;
 b=ffA8IjJVVz8lm3vYiPM5boT5Isk/PF50A1T/IYXY8lgzUcQIXM6UEDdPP+EyfH9jsGI9fB3vR5UrRDdzPiKTByCY+P7hdWJpSaku7+tTGv4yMNFQUGrbGLJ7TqD7cV4enaL8Grh5jdqMttFHe1q9KkIrKta0hCV5OrGkuHWmIZ7/6ynpqMXV23VCv4EUT9lG/18klE+qgj5eXaLejg5zP+Qq0j5FeVrMNKWMlseayO+xI1CijX0uPyPp473Ozdp4WNfXEP/+P2+E6NAntJSTY/MfR85IIl9iwuFGbWOwdQB2wkwwNv+kGcVknBuZwJKB5zC4u4uTYw2qxltmuyVVkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgAOKeEqzuMGmMMzyyM8xghNuhc6I5f14ZNSfSLuJlU=;
 b=US+VRUP50MathL472DwC7zixymhbCXHHqv/MR3ZAKNloQoylyByTcUODc24xErUW2w/Gu1lfnJBInwx6b5cCJy4DAKHD0qEl8W1DTHDesqjDLzFy188hmwANBHmYE4DIv6vy/nurusHxMXLuVFmQEkPitnat/waVFotbawZn2io=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SN7PR12MB6958.namprd12.prod.outlook.com (2603:10b6:806:262::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Sat, 22 Oct
 2022 01:43:37 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5723.035; Sat, 22 Oct 2022
 01:43:37 +0000
Message-ID: <9e7f64dd-399a-7aec-57a1-d1eac3210d3d@amd.com>
Date: Fri, 21 Oct 2022 21:43:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [RFC PATCH] drm/scheduler: Set the FIFO schedulig policy as the
 default
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
References: <20221022010945.95560-1-luben.tuikov@amd.com>
Content-Language: en-CA
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20221022010945.95560-1-luben.tuikov@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0093.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::32) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SN7PR12MB6958:EE_
X-MS-Office365-Filtering-Correlation-Id: cbac0e36-b370-4f76-4c83-08dab3ced6ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qAFlS8cockz+fvSw5yQf6ZRgV3Etq0TJm68ywwnKbShAT8jnXrcXW/bMq0uqArsXoBH2sLs9Ijn8ZnA+w4ycXW5GdA/EyeC0lvUKKnyy/66Ko370bGQjzowl0eqtArOt9CTiWUBoDksxCGs79mRIv8D9tWnBh6NQ3DK5MEKq4TMb/2Yzo3beSVrENaRvOnNe0fD8WN93BmNuDNBd93+jstKCJHD+QcsK61mB9KwWEl+7Ig2nAdkWQ87gNa6iEzy2+/gOyK9YDKcCaRkSdhae2Joox8juRirsniXLO05GAlJfcXFUGL4DkxKJ6XgbTbQ4oeJfOOCvHCmPpvQSGcBbBTUacOBGD3TwiMoLJdgi6DsNP+lcOkxEJf1l1F4KoLz9Mw0USLcrrj5IfaL4F4WHA/Iirb3+6E2w/4WBbOvJpIXTj+5ZO3W1VaDAO/Mrfh+Xvbxzsyg98fhoJZR+9BdRCT94A8Z7vF6Q5Akb5IpTIGYl4RpQg4rXuzIdD/LP4xHNQ91Jrj0WU+1C5DL4BrNRaROUaNVdropsi7UVy2WxDVUaY6l/fVuh7wszpYTzO3zKg3VvyPcRiLzQBL6Da+JvNtIbPkZKQePPDTiwe/CEqSR7z/a5vZ6Uad8SbsK2H+VVuioVY3s3CxXy4enjRywe2UxgZJCUkAvnWI62iqSpHpQe+5VkqCYtHOxi1d5WUIp3mgOFZQfg6iQreCda5KvngkO3NNsJ0HDd4BcZduQklikz1mSCWQNSC5nsA1L5Y1VoLOYV85p2vBXgQZe0O5Z+liLjNONBxZlJH1iNziqcYYw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199015)(31686004)(8676002)(6916009)(41300700001)(86362001)(4326008)(5660300002)(66946007)(66476007)(66556008)(6666004)(36756003)(31696002)(478600001)(2906002)(4001150100001)(44832011)(8936002)(6486002)(6506007)(83380400001)(66574015)(6512007)(54906003)(316002)(186003)(38100700002)(2616005)(53546011)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TytTYUtPQVFzUGI0VWx1Y2ZoVmRUQU9MdEVnaFhHV3pOTzRSTUFnOVV5em9a?=
 =?utf-8?B?SEJ0Zy9LcXdXV3c2eXQwckNWQnc5Rk1vVGRPYnQ0VXMrZDllVjZpTy9SWnFP?=
 =?utf-8?B?VzdzS0kvRDloY2ZDT1FONFFyNjVISU5hK2o4UDZXb0k3RDVUaEIrZVYvSElV?=
 =?utf-8?B?RGlnMWx4bHVJSU5jWThmakoxMWhpRDJNamdSNllVTlMreHlYUFhSUHdyMzNO?=
 =?utf-8?B?Uk5hd1NZY25haWdCM2h1enZFbWNFR3g1S0tmTU10WjliajJ5a2lkQWtJY0VF?=
 =?utf-8?B?eGVMV1l2SUhBMHJieTV3clhtcWx3MDNIcEVwRmRPNk42d2FLYVlrTXJsemJ2?=
 =?utf-8?B?NVVRc1ZrdVRsRDJOYjQ4cHlWQU1scWl5dHRtWU03Wmh6YmVUZFEyMG1lOGRD?=
 =?utf-8?B?b1FHR1laVk95WFJjd3hsbGIzMnA2dEMxdmNYaDU0YWRwMlR1Q0RDNFdKU2Vi?=
 =?utf-8?B?Nng5bVJSSzVyWUxJeHNCanlOS01ia2hEY09vNzc2c3J6ZmFnU3NmVWhrUm1D?=
 =?utf-8?B?N0JJTWJhWDVwRCtqWmxHbHFtcDB5bWdqL2xGSXlPV1NVNVd3TWc4WU1kREtm?=
 =?utf-8?B?MnJKTXRtKzFMeHl3bGhOYVlWS0JZNVVVeGlTT1RqZzN3cGxTVHNuMGo1TGRw?=
 =?utf-8?B?b3NIaDlTaEJTNEQ2cWVKVnZNSXJwRFBJWlJjcThEemNYM2xLRXR2cS90VFVE?=
 =?utf-8?B?bVYyeUlVdjJQSmhqdjJ1UDRmcnNIKzdLRmNrT3ZvUEwyRlVia0VyeUZZOTRN?=
 =?utf-8?B?aCswQkdLVkxCakRWb0lOMlFmNk5nYzVuVFBtTGdPdTEwcEF5QzVQRFRRa1d2?=
 =?utf-8?B?MUd3VmdDY3hNTUhhNWVqQ0dZTlZ6MGFZMEJoTlJIQytoL01GaUt3dlJVbEFU?=
 =?utf-8?B?VWVaTzV2QTJ0MkJFT1FETUdzYS9BeGVUU25iMWdQTVpOTGhrQzh0akw5T3Bv?=
 =?utf-8?B?WFFJekJvMkg2ckFmUkV0b0VqQllmay93ZTV5RVpDUmlvbFUxZ3dEVXBEb09v?=
 =?utf-8?B?VGhZTWxac2V2RFdENTFLeS9WQ2prTjBNOVkxNnVtOWw3dVFMdDFzU2ZIZ0V4?=
 =?utf-8?B?a2Z1aDBadWFDQUs2b2tsSnA5d2Z5cE5oc084a241eVM3dG83bS9SY2Fja1BY?=
 =?utf-8?B?QmtIYmtiVjltVUFzNGcrai93ck4rWnFoY014Y3pFb2lnUHJWTFJQeVVpaC9p?=
 =?utf-8?B?MksxN3Y0SnliOG0vTmhHcldLSjdWdksrcG9LZHIxNk9VYXJCRFphSEdBc21G?=
 =?utf-8?B?NElPRnRoWEh0eEhoSTh3SVNOWForUjhIcHRya0VDS0dJUlpPNVpzTDk0eldN?=
 =?utf-8?B?WUU4eUk0VG9CMy9iQXlXZmI1Z2hWTVU1azNJRXNCT2JhOTVkQWkyK3hKV2FX?=
 =?utf-8?B?c21SUEJTSjk0aXltdkhZRERyR21neWt5a2VrZklFZUk5WUYxeG9rZXYvcFBI?=
 =?utf-8?B?Ly9NdXNMa3pVdU1EQkJ0RGZ6V2wzeFMzMm9OVmhsOVBWREdyM3RYS1JyOFRq?=
 =?utf-8?B?QXJxanI5UGllTGVFdEV1aGo2MHZOb3JLOWlYT0VCQVRyVVo3eU4wZndQWUUr?=
 =?utf-8?B?dGs0dGRMZ1Y2UEJHemh0L3dZQWl4d3JpQ0cxcWM0U3U2UVlLNHJoWlJwbTMy?=
 =?utf-8?B?RE5aZlZveTlRb0xIc29ucUFrYytMVk9sNEkyWDhNS3dxSmEvcFJTa0QweVAx?=
 =?utf-8?B?MFdWUDdxbklHQk5oMnMwdGNRamVJQktNNmpMa3Z4aVArYlp4RGRZRE1KMUhP?=
 =?utf-8?B?NHZZOFE5TUMzZnFSYkh6YnRPa0g3R1FqNFlKSmJVaGs3aXFrMjBsbWhVR0da?=
 =?utf-8?B?ODE5WXdRTFJhcklnNEhzV3JjWG5yWW4zUjVON3hLTUF1dG9DYjZNVFpkdVZL?=
 =?utf-8?B?NjJ5NEZaRDBSTVhRVHhvN0ppTFVEZHNzNm5LaWQwdFFURGszZ2FNcVdnTmtG?=
 =?utf-8?B?OVJyaUxjb3NESnVVKzBLRU5TalBzRmc5NWlSQXdLRHVIWlBhc3pjNEJHVGZY?=
 =?utf-8?B?dzA1MDVhZk9aYmRRc0dpQm5QZ2MzYzBIQjVWZlliSG5sOFlNaTFHaXVCelM1?=
 =?utf-8?B?ZTQ3bzN0QjlPeFR6TGJ0Z0lUWnlnbVFWY09WbFYyL0NIWkduNkR0bWhic2hD?=
 =?utf-8?Q?44Jg3A1K9tj5xbk6OH/2ORJq7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbac0e36-b370-4f76-4c83-08dab3ced6ba
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2022 01:43:37.4608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rVUMQMe7NBGqPIpu+JWmiWSJVsHfRRER/rsoOMgEr33uOZnBtfh21v9jKw/7aMuK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6958
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Please comment on the v1 of this patch, which I sent right after.

Regards,
Luben

On 2022-10-21 21:09, Luben Tuikov wrote:
> The currently default Round-Robin GPU scheduling can result in starvation
> of entities which have a large number of jobs, over entities which have
> a very small number of jobs (single digit).
> 
> This can be illustrated in the following diagram, where jobs are
> alphabetized to show their chronological order of arrival, where job A is
> the oldest, B is the second oldest, and so on, to J, the most recent job to
> arrive.
> 
>     ---> entities
> j | H-F-----A--E--I--
> o | --G-----B-----J--
> b | --------C--------
> s\/ --------D--------
> 
> WLOG, asuming all jobs are "ready", then a R-R scheduling will execute them
> in the following order (a slice off of the top of the entities' list),
> 
> H, F, A, E, I, G, B, J, C, D.
> 
> However, to mitigate job starvation, we'd rather execute C and D before E,
> and so on, given, of course, that they're all ready to be executed.
> 
> So, if all jobs are ready at this instant, the order of execution for this
> and the next 9 instances of picking the next job to execute, should really
> be,
> 
> A, B, C, D, E, F, G, H, I, J,
> 
> which is their chronological order. The only reason for this order to be
> broken, is if an older job is not yet ready, but a younger job is ready, at
> an instant of picking a new job to execute. For instance if job C wasn't
> ready at time 2, but job D was ready, then we'd pick job D, like this:
> 
> 0 +1 +2  ...
> A, B, D, ...
> 
> And from then on, C would be preferred before all other jobs, if it is ready
> at the time when a new job for execution is picked. So, if C became ready
> two steps later, the execution order would look like this:
> 
> ......0 +1 +2  ...
> A, B, D, E, C, F, G, H, I, J
> 
> This is what the FIFO GPU scheduling algorithm achieves. It uses a
> Red-Black tree to keep jobs sorted in chronological order, where picking
> the oldest job is O(1) (we use the "cached" structure), and balancing the
> tree is O(log n). IOW, it picks the *oldest ready* job to execute now.
> 
> The implemntation is already in the kernel, and this commit only changes
> the default GPU scheduling algorithm to use.
> 
> This was tested and achieves about 1% faster performance over the Round
> Robin algorithm.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <Alexander.Deucher@amd.com>
> Cc: Direct Rendering Infrastructure - Development <dri-devel@lists.freedesktop.org>
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 2fab218d708279..d0ff9e11cb69fa 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -62,13 +62,13 @@
>  #define to_drm_sched_job(sched_job)		\
>  		container_of((sched_job), struct drm_sched_job, queue_node)
>  
> -int drm_sched_policy = DRM_SCHED_POLICY_RR;
> +int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
>  
>  /**
>   * DOC: sched_policy (int)
>   * Used to override default entities scheduling policy in a run queue.
>   */
> -MODULE_PARM_DESC(sched_policy, "Specify schedule policy for entities on a runqueue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin (default), " __stringify(DRM_SCHED_POLICY_FIFO) " = use FIFO.");
> +MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
>  module_param_named(sched_policy, drm_sched_policy, int, 0444);
>  
>  static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
> 
> base-commit: 16d2a3f2ad1d2b95bf9122c910c63b0efe74179d

