Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A21F79F788
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 04:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26A210E4EA;
	Thu, 14 Sep 2023 02:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A368710E4EA;
 Thu, 14 Sep 2023 02:06:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbSn7o29GnBfC3WTJzvYxSuCEIPN/kb81VcRTlkJ8CT/rIhCf3rQJYClCmSosDNkXOoc1ovidiXKCGCU4Kz0dOlaCmTSdSFl34L8uLhvL1MSFINRd2yTycZv468xNjygGH9JtqctFfBihembtNJ+kkoGFAIY0FiEQGoMCGxxrlRmG6M55Lb0KeHTt3hA+EY9xdld2QFUfw/KNyCrSmEhX9MSzOhrjzkVDhMkqJdR5SrmJjgL7LWDZ6kn5ZMIHDAX15vPsMEcYOKT5ZEMJRPDlE/J1BHAhdH5LZk2/FxbL8oRDheBK52fEZdxjhBMGjDMCQ43bSiHOJz4GHt7hqT4tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5TAM0Z75tpwGG/yxZTsfIh30zq91SS/OnxGb3EBO/Q=;
 b=F5lyxjo5bZXTxObBKeMrzZf03A0Tnx2p/gyRhkIShcXfZhAHCmJy1aWFVdBDTQxV+4cPi03Jotm7NzmxwxyXgW24gZNl3UZKVEc6urZlBwL20YQuWG0g26I+vn+G8L8YKzjvROoeU1MV4C8IvIbvIYM8jqXQg9ww0nHKU1FrbZbhu3Z0N4NeOO3Rj3q+5giWK2501yL8oYOYwp/UQrgMJcfYLKDbSQKi+IDUFNR9e8l1lmzC8lLYNkg/5XFTHD/j0kmgmQdzvDT6ajbH0QMPx22iVIG92sNYZ8UCExsK9I3tpu5LA8zB3BXFGbJWBivzd0y5PR3RtKIkKAjRI4VlBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5TAM0Z75tpwGG/yxZTsfIh30zq91SS/OnxGb3EBO/Q=;
 b=jGMnhLmjFBWKGcoWz4WjYQr6TNipbv7lV24WIQqhLjHNQbxP3SWUGQs5BN90i1H9OutHS9HkUViZI5GmmvRGBbF4dqKLvBProgOeWn0XHSZJeMR9kpa5EuyO9eozVMzia6XbFxphRIt5dPoehbooY5i1En0ibBBKWm3MI6daUek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CH0PR12MB8549.namprd12.prod.outlook.com (2603:10b6:610:182::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Thu, 14 Sep
 2023 02:06:56 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Thu, 14 Sep 2023
 02:06:56 +0000
Message-ID: <161f85ca-37bb-4515-987f-59059a40c9cd@amd.com>
Date: Wed, 13 Sep 2023 22:06:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.2.2
Subject: Re: [PATCH v3 12/13] drm/sched/doc: Add Entity teardown documentaion
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-13-matthew.brost@intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <20230912021615.2086698-13-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::33) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|CH0PR12MB8549:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e73239-fd4b-423b-ceda-08dbb4c7457b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LzlRyGMub2FMF3gcWF22DtiNIVkmAySCEpJcvmGFm5f2PBHyOk4wuLoQp43GcgiAgvKcjzNbH9WGAeDfamSowo22w31s8nLL4H0tVJJ0xoAYDMzOkTWYOhfDhKhcGAHK5q0U1pxa5BrZyf1SUnJJlMyh/JcPRX32+mJdr9hCLCeGSdJjUn28XbXW9ixz1+yoUZ7+qvTjoFZpvz0xbFNnLVUKmetOrRGzsckXuuarJvRA9v06ct52hdHB05n5zHevLuv9X/8o19ceZZ09Mse8qpLvTmxEVyO2Pw5eLTSCwfMqHK+1JW4/qRTXfyHkp547GSrjQVZpxRD8f9uXmYUYFpNleXeV7OV3s+RWvewc+MdyF7EOqxD43+79LUfMPWpGeJMNzvwzDkZ7tSOmEwthdOnwLCdqIYq1O8xINz9FLtxNi1UYaEk1CwprWPXpDlyxP68Xyu62OUSUuEDsWIhh6yD2ovk1N+s6uIesIJ7CrUY1retPnDxCKVlZQjaG4/rZV3H9X//x/Y+f8VrUt0tZwIEGU+z0ll8Ff7/mKOE0nxHiFxtJDidc5iS5ZModCtj1qe1m7ARWdi5RudjdLvmHNOksTYgogkVMdnm3QuxozrfdjNFiwev7491wIi5Wx+rTEHvuYxvCA9D773Olfmw4Yg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(39860400002)(366004)(396003)(376002)(451199024)(1800799009)(186009)(31696002)(8676002)(86362001)(8936002)(4326008)(5660300002)(44832011)(2906002)(7416002)(36756003)(6666004)(38100700002)(83380400001)(53546011)(6506007)(6512007)(6486002)(26005)(2616005)(478600001)(66946007)(66556008)(66476007)(316002)(31686004)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDlWTjJpL25JRTBaU1ZQSDNRaDhCV3RIK1grMS92cTRiRUpXTHpHeEhXNXRW?=
 =?utf-8?B?a2doOEhJc3VFUlVObDR0WjhWR09TNzc4SjZBZ0FTcGwxay9BdXJRaUNXMmdy?=
 =?utf-8?B?bTh1MjBkYzJXMFNYY2xreXhPdFVud0ZsRUdERkJsa0RSa09xU1ZRci9wZ1k1?=
 =?utf-8?B?SnlwM1AvRG9kdDZ5K3ZESzZrMjVCSWQ5RkdFRG1TcnVmVjNrRFp5UWpsYktT?=
 =?utf-8?B?ZlU0c3RYZi9VUlBGK29nazg2azZ2bFJzdUVrbjlzU2wzZ1Y4cXhUNEUzOTBk?=
 =?utf-8?B?b3hvMjFUR3dyY2ZlbERzemtCb0phbWJqQUpnZUxFVEgxd1VaTDc1VFBFR01z?=
 =?utf-8?B?SThsajExMTNLVHkrdjhrUC9ld002d1JDMXJxam04RmZDaEEvR0ZjejJrVFlI?=
 =?utf-8?B?WjAvajlMTkxWR3VQbEZZUjh2VER6TXpnUTdFdEZhWWR1VUVxbnVmelVyZHQv?=
 =?utf-8?B?RkxrWEYyQWNvNGtKSXpiUXlURUhEdldPaDI5Z2hhZ2c2Y2JQek9sRHVrcTlr?=
 =?utf-8?B?dUJjWWJJQkpNZ0ZwM0ZMYkoyamZ6SDdjYy9jdWxiMjh1bThQcFVpVWtwaDha?=
 =?utf-8?B?cVNJS2thWksyUmUraEZVMTlFbkduQXN2Nng1RFdCSDJGdmFWb2M3d01PWjFZ?=
 =?utf-8?B?TndFdlQwMFBDWHRHRThweDltbmxQYTdrR05EQVlUbXFqZFZzSlZQU0w1VDJN?=
 =?utf-8?B?WmpQVUZZSXBZWFFBcnZ5YWx4VzBmUWpnS2FUWHlrRDhPaUFSbkRSWExuakgz?=
 =?utf-8?B?eWMrd2phV1kwcVIzYnJQaitsT3BLT05wSUQ2Q2hha1dMdkpaeE9HZEZySTBK?=
 =?utf-8?B?cXNRd2xxZ3NVOWFnbk1udGdYVjRFNXc1blhlSHN4VGVicGt4ZUNDN3ZlQ1lj?=
 =?utf-8?B?YkdzVktnUTdYRUdRZll4dHlES2M2OG4za2JhYmo1ak1wY1VFdUlMUmNvTmpi?=
 =?utf-8?B?OGdPdVl5ZmljcERpSm42dEJ3MnZCb2xhR1ZjeUJ5Y2lDYWlVTmlYZnRybm81?=
 =?utf-8?B?WHJFa0tXVEZ4M0VyR0Z0NWdSamdGbVVtcDJTcnhWUExtazl3TmNEVkVqOERi?=
 =?utf-8?B?cno5UERZUTNVeGRHWFNzVlRIV3Z2UHg3cE1IaHlqZ1g5d2dZNWdNd0dJZlVk?=
 =?utf-8?B?c1JUN2ltRDZEVVdLVUJOdUs5QjF2dVJUcDB4T3ltQjBkeHNLSEo4TUxpWkd3?=
 =?utf-8?B?U1NtUWswM1J4MVFuOUhISDVGTDUyR3BQQmhHS09KV3krTXFhTlc1aEVJOHFP?=
 =?utf-8?B?Q3h6ZnBLajJWRmwxeHNwczZXSGlJZEswQlJOWXV5MDVqMnBUVFVDQUxObjRk?=
 =?utf-8?B?RzB5cElyZ2VSS3lpKzNEeVVRY0pIV3BlMjI5RGdnZndRNzRGeXp2U1c1YkR0?=
 =?utf-8?B?Q3c1Snl2SGNKTDVXUVZIZzFzNXRZQlZzdXZ2K1YyVndEck9YZm5NNnMxeWRl?=
 =?utf-8?B?Q251bzdWWWZvUUVlTmZqM1B2L3I1QVZPeHJ0QWJoeUFDc2wxOTg0aXN0R3VD?=
 =?utf-8?B?dngzaVdMQ04vQi85MlA3N1RrTC9nODFDOUpsb2RsVnRLRCtRUWdvS096WVU3?=
 =?utf-8?B?dXNnTENjbis2VEJtdFV2ZjE3UTVtV3lvZ3pGdTdJM0VCYUFZVTZRTmVBWmQx?=
 =?utf-8?B?djVXbmtLVTF4Um9jaFd2dnNpWkZ5WFU4WEVCaVl4aTA5d3lqdHFoR2pNbGdp?=
 =?utf-8?B?SFVPeE1QQ3FZS3hjS1Y5OHZRNTR4MUQ2TTh6KzlvcnF5aGNtZDgvaGNONVJ3?=
 =?utf-8?B?WUxWb3crUVNWTml5QkduOTAybEhSSnBUN1IrZ21xRGdyc1liU1I5eDRMZzdQ?=
 =?utf-8?B?ei9XaTBYZG9IZjNIcnFxTnR6WHBQTEhQMSthVmliWEhKWGxzbzdJaVZXSnNP?=
 =?utf-8?B?RGhtdWFsdnBrYlEwRlovTXpFdllWd0NaaFl5Sk9kQ09VL1VkWjd6UDIxeG5x?=
 =?utf-8?B?YnhlZjZvMnVVUDU1eE5VVUZ1a2x3WVU0ckFWbmNqVXZzZ0VyRGVSazVsL2tM?=
 =?utf-8?B?eDUwZ09FamZQQ2VQRHg2THJmUmFvN25nZW5jelBRTDlUR3dwUzNZdzVWdXlZ?=
 =?utf-8?B?eElDZU1lS091QWpNWk5yMGNGbUk1d3UxRnlkeWFtK2hFdlRvOUFxMzdhbFBI?=
 =?utf-8?Q?lIi1o/z/UghtEDMxpI+v2Fdnc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e73239-fd4b-423b-ceda-08dbb4c7457b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 02:06:56.1643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAfshyjEnPf5KzFOZ3Z9O0xocqXiSVNvmajCBnUHHms8xbikUZM2Uz9hz+qg/vX+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8549
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
 Liviu.Dudau@arm.com, boris.brezillon@collabora.com, donald.robson@imgtec.com,
 lina@asahilina.net, christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-11 22:16, Matthew Brost wrote:
> Provide documentation to guide in ways to teardown an entity.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  Documentation/gpu/drm-mm.rst             |  6 ++++++
>  drivers/gpu/drm/scheduler/sched_entity.c | 19 +++++++++++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index c19b34b1c0ed..cb4d6097897e 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -552,6 +552,12 @@ Overview
>  .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>     :doc: Overview
>  
> +Entity teardown
> +---------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_entity.c
> +   :doc: Entity teardown
> +
>  Scheduler Function References
>  -----------------------------
>  
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 37557fbb96d0..76f3e10218bb 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -21,6 +21,25 @@
>   *
>   */
>  
> +/**
> + * DOC: Entity teardown
> + *
> + * Drivers can teardown down an entity for several reasons. Reasons typically
> + * are a user closes the entity via an IOCTL, the FD associated with the entity
> + * is closed, or the entity encounters an error.

So in this third case, "entity encounters an error", we need to make sure
that no new jobs are being pushed to the entity, or at least say that here.
IOW, in all three cases, the common denominator (requirement?) is that no new
jobs are being pushed to the entity, i.e. that there are no incoming jobs.

> The GPU scheduler provides the
> + * basic infrastructure to do this in a few different ways.

Well, I'd say "in two different ways." or "in the following two ways."
I'd rather have "two" in there to make sure that it is these two, and
not any more/less/etc.

> + *
> + * 1. Let the entity run dry (both the pending list and job queue) and then call
> + * drm_sched_entity_fini. The backend can accelerate the process of running dry.
> + * For example set a flag so run_job is a NOP and set the TDR to a low value to
> + * signal all jobs in a timely manner (this example works for
> + * DRM_SCHED_POLICY_SINGLE_ENTITY).
> + *
> + * 2. Kill the entity directly via drm_sched_entity_flush /
> + * drm_sched_entity_fini ensuring all pending and queued jobs are off the
> + * hardware and signaled.
> + */
> +
>  #include <linux/kthread.h>
>  #include <linux/slab.h>
>  #include <linux/completion.h>

-- 
Regards,
Luben

