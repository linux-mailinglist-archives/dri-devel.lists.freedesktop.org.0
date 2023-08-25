Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35545788D81
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 18:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C4E10E1BD;
	Fri, 25 Aug 2023 16:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C924010E0F7;
 Fri, 25 Aug 2023 16:59:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=luZBvNaTO4ERqluLCYnr85oaPKPuZEVbmegOB3sClXPceq82/UdzAu81/fLfHwcgS+fyxin6fMbAEu/WFXu15J8iFxE3hsvGwlEF4W6rD2qbW8beyKzWf6oaVtKFEtOwIp8E8glghi08IDn5kzY62rrX8fs4p78sUSEShgGdeP+Wcubv9mWqbDCCdySGsb6NCUQXlq3Vfbd9MYA2XwPYAlZ3jSYEYR4f+3/SszEImSOxhgGNKg7XD4Uht59u1sa5L/k7UPuSYE3gtC+9CZ4PATYVeJybAWAG+KxU4igOuX8Jvpa32RVZGyBUS3OcezZD/+/l5+8xeF07au0HcXoffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkldrlgAtqdmnatzl9FrkYEeC8zDbjAsK1FT7qTQdzU=;
 b=Cpiuahpn7rq6WS+xcQoiHWs4sm0/Np1GbFuytIhSkeIcrVemCUA4bNXzI0X2cB0SWJMxdOiBwQTSCVj8U/T/TVNfI064TlFwBnLxYTfDY/QuovCrAw9MkGbWCAXTH7Y8ECfchPMzNor0Aoc+kQX0So8E/E3V1Ph9jVX6QpeUAcDwsqvCqBMaQkNXeGvZEpVwBUyorI1BrUXoFK3wssfXRqJLN3R8ffBTQM7GyeCGvCqyDetkkgNb9DbjtHcwLXboR/aavKNPXos0tqM5hobnaREeGwF6FUKgdgteWjNKe1Skuh8wgkWS+42uEhIMiaLvLqB2ovYGoMI34jMqc0RnKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkldrlgAtqdmnatzl9FrkYEeC8zDbjAsK1FT7qTQdzU=;
 b=RjGSLExLmAMo/SI3SbttNEeSeL4qH+fOg7JlBWz0pCkqnuncNPDbVgMZN8UwhXaqe8lNJV0Uc3jORUwdP/yOlFU/So5zqN7T6Ha7kIGfdeU9bNtEx+uR7g4dHLsbZhIXJ/iHphJ1FtKLyoyRJwS9hacjQ7L3xEzXv6+L345xvvY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18)
 by SJ2PR12MB8978.namprd12.prod.outlook.com (2603:10b6:a03:545::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 16:59:31 +0000
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::ae93:e5c5:41f7:bf08]) by SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::ae93:e5c5:41f7:bf08%7]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 16:59:31 +0000
Content-Type: multipart/alternative;
 boundary="------------0DqO0rnne25MaigARN2Y7z6a"
Message-ID: <10bb9689-9226-d47c-4cf1-7bf9d599456c@amd.com>
Date: Fri, 25 Aug 2023 12:59:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 1/4] drm: Use XArray instead of IDR for minors
Content-Language: en-US
To: =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
References: <20230724211428.3831636-1-michal.winiarski@intel.com>
 <20230724211428.3831636-2-michal.winiarski@intel.com>
From: James Zhu <jamesz@amd.com>
Organization: AMD RTG
In-Reply-To: <20230724211428.3831636-2-michal.winiarski@intel.com>
X-ClientProxiedBy: YQZPR01CA0075.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::10) To SJ0PR12MB6760.namprd12.prod.outlook.com
 (2603:10b6:a03:44c::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6760:EE_|SJ2PR12MB8978:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a084438-71df-409f-78b4-08dba58ca678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jq8aLBKFHZvIuGC29xaWbPbxBmvQUwdp52+BjEtaH320pwWPTH7hF9g4zbLwBe/NOTpx24fsU9yddr956hz8IhPquSddzUTQHMBEphPVE2kBK4buwSVWBjsohtPuRSvNDd7u6IHIYEbf2s2Fe8SYSoVaXFH8TRC0M2M0dmarwZOmQ57yNRHJFh7va3Y0NFMLEXOxDu4zP4rht1RTKdX3dnjSQs6A6p7CBduwb3SUt2ge2qFMUuVK8JaF8QlPF69F46bl/Ll36IlqKt6kg3CDSx9X2qXcf0deLFaj5O9I/nV9hd2o2MwrPYgtVUOQl6Z9SWNLuj8ZzMYRoFT9h/rP75NoS1X3EDUCjWrFSkzevE5MRUWrY3Ikc+bjh7QP8E3sLufXE/rONF+Y6kAoPGDtAKMDFNEuUkov/WG3rkjP6NRp9JA+oeBa5g+HcNbcwCKiwiwY1/n+WzO3c9hBpFGOOpnbcFbfFiZ9bT9+iqF9VPO4sMW9RCqxoJUE1BJAjH+3rkwXn9OtdLx+1ehO8Ta8ABEdwd4ks4hGiPclLjbdZ/7cY6FYw0ITa1QmUD+qx46J0T32nMTLJHgx/barWX23Sn93NI4P8z0/LU/JZLPyC1QfeCPIZZ9HyFewB5W1jy22B6RD9foggwwlCJjqlw57PA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB6760.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(366004)(136003)(396003)(1800799009)(186009)(451199024)(2616005)(5660300002)(4326008)(8676002)(8936002)(36756003)(30864003)(83380400001)(7416002)(26005)(6666004)(38100700002)(66556008)(66476007)(54906003)(66946007)(316002)(478600001)(31686004)(53546011)(41300700001)(6512007)(2906002)(6506007)(36916002)(33964004)(31696002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0lXQXdhczZzbXhVTGI5L3VjWXMvWC9QamMwenUyS0FySUUxekg5NTRkbmhP?=
 =?utf-8?B?N1IxVFN4ZDZmbFlEN2dmRW9JQURpaTA5d3BSWkJoR2c5WVl3eS9vVWJDbzI5?=
 =?utf-8?B?b0I2VTl1bDc1cGk5bUVWbm9sdUpzcFBxcjdqNXZuRlNBeHE3MDJEclVpRFFC?=
 =?utf-8?B?UWtOWER2eXhoMnRhNFhoVmlGaGJIcmpWd3hVekVXNEV6eXVUNzBtelB4L3lt?=
 =?utf-8?B?cEpWVGltdUpaWkF2bmllWGFIMkU0OGk0cHllRjNzQkJzNEZPOTA1bFdZVHdI?=
 =?utf-8?B?V055YXFvSDNTZ242N1pJUDY0VjkvMWNSWDk0NEhBL3kwK3A3eTI0MFQrWkd4?=
 =?utf-8?B?NkdTTEM4RDJTYi92Y3p3MG5VUm8yUThwSThiQlA4ZnZhQW1qZENnM080V2sw?=
 =?utf-8?B?T2JPQjJENlpabHU0VWdTL0I4WFQvSDB3cUgyL2VwbzhUVkNPdDQ5MEkxRm9U?=
 =?utf-8?B?b3RtYjBUdXhrMXVGZXZKNTdMMlM3ZkdaeGxDcVV5WGdxcnE5UksxZU5hM05E?=
 =?utf-8?B?a0pnNmhBYUdIcjVPWGp1elhoUmI2QzF5WkxiaHQvcHFnbGVndm5sMW9aVUxK?=
 =?utf-8?B?S0FEZElhK1Z5K0p6Tm5vMGFGNVpIMEFmeWpzQ0xvSEg5R2QxQlQvZ25yMEtp?=
 =?utf-8?B?MjVQVWhEdjdiNFpsejFxMCtnc0JDUVJ2dUZzcXEzZ2VIdU5lWlFxQW1KVTFx?=
 =?utf-8?B?MkpkMjd5ZC8yQnFiMlJ6eWlDMnBZT0JROVJRVjRnOWFmZnpDSXBIQ0R3a2kx?=
 =?utf-8?B?V2RBYWRrazVpbXRCczQ0MC8xYVBmd1UvT0xJR2NZZ2tJY3cyV1RjUWVlOExS?=
 =?utf-8?B?dnY2VEhOUVROOWd6RHVhNmtsOGVPYS9GV3NnQ2p5ZnVsVm04c0gzTlQ0Zjhq?=
 =?utf-8?B?NWV1YU5aNjJlUmJyQmpITEtKNFdxQTdwL284RlJyYzN0L3labVNraXJOQVd5?=
 =?utf-8?B?SXhKbDlraHZwOS9wclZpNTRrQjVEc3pEaW5RUWcvTFE4SlZFSWdQelErYUl3?=
 =?utf-8?B?U3RvM2h0QStWc245ZjJTeU8wSnl6QjhtZU5JTFg5OHQ1dlZOb3JUL2QwOGd4?=
 =?utf-8?B?Wk5oK3J0MXJITURLSFRZZmpLQ1FheUdvOEdDYzdnTkdvcnVwYWtlaG1WM2ZH?=
 =?utf-8?B?SndQSVBTemxIcUFHK25RZmtjUTkxWUpYQ3NnRFBwVVpuZHprb0Z0ZTQzSUdH?=
 =?utf-8?B?UkprUThPMVZacWJvTDJScXlyQko1MlRham53VCswNnhzbWpzTHRaMzZKbFdp?=
 =?utf-8?B?bWQvTzdEOUJTZENtSmJ1UVRONThJQmRzTEhXUExyamFlUlJ4T0Y5Z2J2eDl1?=
 =?utf-8?B?WnVTdEpQQUlFRGMwYjd1QXlvblhkQ1ViVG1WYzNIa28ycjRnUThUWWJvTkw4?=
 =?utf-8?B?VXlZaVA3cXNvN20xeWl6eE11VUhQalRTeXE5eDNYWndJbXM0SGlOUWpoT0xt?=
 =?utf-8?B?ZUlwd3dUelhJUmF1NHR0OFdPd0F0QngxWllDYVhIOHh2SXdTM1pJYkZLcWlQ?=
 =?utf-8?B?RzczdlhIVTFZZC9xc0xxMk1SRUhBNzJ2Uml6UVBPYXhKczkybjB5M3RETjgy?=
 =?utf-8?B?d2xwc1YyUm5ZZTFZb2NKMVJIMHk4TzhYOFgycWdLR2Q5c3d1UEttaE9MbGZj?=
 =?utf-8?B?NFhYUS8zbUUzWWwvZ3dkN3FSSFROTGtUNkYwNUpKQWo5RXRmeUt0a2pqV09u?=
 =?utf-8?B?NzhURDB5R0NsN1I5b1I2OHlabUFKNE4rVFRCeGlNSGF4ek1iaEY0SldkcjF6?=
 =?utf-8?B?VHJiTUJSeHd0c2g2TkhURStNdDZvZy92VkRBSnJvd2ZiN3B3b3hkMHUrd3Fa?=
 =?utf-8?B?aFovREs0dThoQ01vdkE3WC9ranlKVWEzWCtVSnJUd3lOc1Z1bFp6SzBCdzZQ?=
 =?utf-8?B?Z0hBajdUbzhZVGRNRk1BZWNEQ2xPZHRpVENlc080aWlNbno3T3hsRVJnRGgr?=
 =?utf-8?B?YWlHYkVTWVhPd1hSUU1pZXJtajV2azlkRDBoVnZFS0h1dWNjaFkwdGJUM1Za?=
 =?utf-8?B?NENuZXZ2ZU85bmN0UndjRGQ4TU9IdmtubU1XOHNQSG5yVmM2TFlJeU9udkdH?=
 =?utf-8?B?S3BFL0F1ekxlZ3cyMkRaQjRSaDRXcDA1R09PZmlXOERySFJwSzVjSEYxS2Mz?=
 =?utf-8?Q?M/mxjHWKVu3uzdxh3K9PfMuAK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a084438-71df-409f-78b4-08dba58ca678
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6760.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 16:59:31.2065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZOJ4XWmi71lOBJS627QaM3DVKQIMi6bGqiiyQc1va9KOAU6vPfN/myPfTjXZU1z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8978
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Airlie <airlied@linux.ie>, Oded Gabbay <ogabbay@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Emil Velikov <emil.l.velikov@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 James Zhu <James.Zhu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------0DqO0rnne25MaigARN2Y7z6a
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023-07-24 17:14, Michał Winiarski wrote:
> IDR is deprecated, and since XArray manages its own state with internal
> locking, it simplifies the locking on DRM side.
> Additionally, don't use the IRQ-safe variant, since operating on drm
> minor is not done in IRQ context.
>
> Signed-off-by: Michał Winiarski<michal.winiarski@intel.com>
> Suggested-by: Matthew Wilcox<willy@infradead.org>
> ---
>   drivers/gpu/drm/drm_drv.c | 63 ++++++++++++++++-----------------------
>   1 file changed, 25 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 3eda026ffac6..3faecb01186f 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -34,6 +34,7 @@
>   #include <linux/pseudo_fs.h>
>   #include <linux/slab.h>
>   #include <linux/srcu.h>
> +#include <linux/xarray.h>
>   
>   #include <drm/drm_accel.h>
>   #include <drm/drm_cache.h>
> @@ -54,8 +55,7 @@ MODULE_AUTHOR("Gareth Hughes, Leif Delgass, José Fonseca, Jon Smirl");
>   MODULE_DESCRIPTION("DRM shared core routines");
>   MODULE_LICENSE("GPL and additional rights");
>   
> -static DEFINE_SPINLOCK(drm_minor_lock);
> -static struct idr drm_minors_idr;
> +static DEFINE_XARRAY_ALLOC(drm_minors_xa);
>   
>   /*
>    * If the drm core fails to init for whatever reason,
> @@ -101,26 +101,23 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
>   static void drm_minor_alloc_release(struct drm_device *dev, void *data)
>   {
>   	struct drm_minor *minor = data;
> -	unsigned long flags;
>   
>   	WARN_ON(dev != minor->dev);
>   
>   	put_device(minor->kdev);
>   
> -	if (minor->type == DRM_MINOR_ACCEL) {
> +	if (minor->type == DRM_MINOR_ACCEL)
>   		accel_minor_remove(minor->index);
> -	} else {
> -		spin_lock_irqsave(&drm_minor_lock, flags);
> -		idr_remove(&drm_minors_idr, minor->index);
> -		spin_unlock_irqrestore(&drm_minor_lock, flags);
> -	}
> +	else
> +		xa_erase(&drm_minors_xa, minor->index);
>   }
>   
> +#define DRM_MINOR_LIMIT(t) ({ typeof(t) _t = (t); XA_LIMIT(64 * _t, 64 * _t + 63); })
> +
>   static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
>   {
>   	struct drm_minor *minor;
> -	unsigned long flags;
> -	int r;
> +	int index, r;
>   
>   	minor = drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
>   	if (!minor)
> @@ -129,24 +126,17 @@ static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
>   	minor->type = type;
>   	minor->dev = dev;
>   
> -	idr_preload(GFP_KERNEL);
>   	if (type == DRM_MINOR_ACCEL) {
>   		r = accel_minor_alloc();
> +		index = r;
>   	} else {
> -		spin_lock_irqsave(&drm_minor_lock, flags);
> -		r = idr_alloc(&drm_minors_idr,
> -			NULL,
> -			64 * type,
> -			64 * (type + 1),
> -			GFP_NOWAIT);
> -		spin_unlock_irqrestore(&drm_minor_lock, flags);
> +		r = xa_alloc(&drm_minors_xa, &index, NULL, DRM_MINOR_LIMIT(type), GFP_KERNEL);
>   	}
> -	idr_preload_end();
>   
>   	if (r < 0)
>   		return r;
>   
> -	minor->index = r;
> +	minor->index = index;
>   
>   	r = drmm_add_action_or_reset(dev, drm_minor_alloc_release, minor);
>   	if (r)
> @@ -163,7 +153,7 @@ static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
>   static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
>   {
>   	struct drm_minor *minor;
> -	unsigned long flags;
> +	void *entry;
>   	int ret;
>   
>   	DRM_DEBUG("\n");
> @@ -190,9 +180,12 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
>   	if (minor->type == DRM_MINOR_ACCEL) {
>   		accel_minor_replace(minor, minor->index);
>   	} else {
> -		spin_lock_irqsave(&drm_minor_lock, flags);
> -		idr_replace(&drm_minors_idr, minor, minor->index);
> -		spin_unlock_irqrestore(&drm_minor_lock, flags);
> +		entry = xa_store(&drm_minors_xa, minor->index, minor, GFP_KERNEL);
> +		if (xa_is_err(entry)) {
> +			ret = xa_err(entry);
> +			goto err_debugfs;
> +		}
> +		WARN_ON(entry);
[JZ] would WARN_ON(entry != minor)be better?
>   	}
>   
>   	DRM_DEBUG("new minor registered %d\n", minor->index);
> @@ -206,20 +199,16 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
>   static void drm_minor_unregister(struct drm_device *dev, enum drm_minor_type type)
>   {
>   	struct drm_minor *minor;
> -	unsigned long flags;
>   
>   	minor = *drm_minor_get_slot(dev, type);
>   	if (!minor || !device_is_registered(minor->kdev))
>   		return;
>   
>   	/* replace @minor with NULL so lookups will fail from now on */
> -	if (minor->type == DRM_MINOR_ACCEL) {
> +	if (minor->type == DRM_MINOR_ACCEL)
>   		accel_minor_replace(NULL, minor->index);
> -	} else {
> -		spin_lock_irqsave(&drm_minor_lock, flags);
> -		idr_replace(&drm_minors_idr, NULL, minor->index);
> -		spin_unlock_irqrestore(&drm_minor_lock, flags);
> -	}
> +	else
> +		xa_store(&drm_minors_xa, minor->index, NULL, GFP_KERNEL);
>   
>   	device_del(minor->kdev);
>   	dev_set_drvdata(minor->kdev, NULL); /* safety belt */
> @@ -238,13 +227,12 @@ static void drm_minor_unregister(struct drm_device *dev, enum drm_minor_type typ
>   struct drm_minor *drm_minor_acquire(unsigned int minor_id)
>   {
>   	struct drm_minor *minor;
> -	unsigned long flags;
>   
> -	spin_lock_irqsave(&drm_minor_lock, flags);
> -	minor = idr_find(&drm_minors_idr, minor_id);
> +	xa_lock(&drm_minors_xa);
> +	minor = xa_load(&drm_minors_xa, minor_id);
>   	if (minor)
>   		drm_dev_get(minor->dev);
[JZ] why minor->dev need ca_lock here?
> -	spin_unlock_irqrestore(&drm_minor_lock, flags);
> +	xa_unlock(&drm_minors_xa);
>   
>   	if (!minor) {
>   		return ERR_PTR(-ENODEV);
> @@ -1067,7 +1055,7 @@ static void drm_core_exit(void)
>   	unregister_chrdev(DRM_MAJOR, "drm");
>   	debugfs_remove(drm_debugfs_root);
>   	drm_sysfs_destroy();
> -	idr_destroy(&drm_minors_idr);
[JZ] Should we call xa_destroy instead here?
> +	WARN_ON(!xa_empty(&drm_minors_xa));
>   	drm_connector_ida_destroy();
>   }
>   
> @@ -1076,7 +1064,6 @@ static int __init drm_core_init(void)
>   	int ret;
>   
>   	drm_connector_ida_init();
> -	idr_init(&drm_minors_idr);
>   	drm_memcpy_init_early();
>   
>   	ret = drm_sysfs_init();
--------------0DqO0rnne25MaigARN2Y7z6a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023-07-24 17:14, Michał Winiarski
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230724211428.3831636-2-michal.winiarski@intel.com">
      <pre class="moz-quote-pre" wrap="">IDR is deprecated, and since XArray manages its own state with internal
locking, it simplifies the locking on DRM side.
Additionally, don't use the IRQ-safe variant, since operating on drm
minor is not done in IRQ context.

Signed-off-by: Michał Winiarski <a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;michal.winiarski@intel.com&gt;</a>
Suggested-by: Matthew Wilcox <a class="moz-txt-link-rfc2396E" href="mailto:willy@infradead.org">&lt;willy@infradead.org&gt;</a>
---
 drivers/gpu/drm/drm_drv.c | 63 ++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 3eda026ffac6..3faecb01186f 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -34,6 +34,7 @@
 #include &lt;linux/pseudo_fs.h&gt;
 #include &lt;linux/slab.h&gt;
 #include &lt;linux/srcu.h&gt;
+#include &lt;linux/xarray.h&gt;
 
 #include &lt;drm/drm_accel.h&gt;
 #include &lt;drm/drm_cache.h&gt;
@@ -54,8 +55,7 @@ MODULE_AUTHOR(&quot;Gareth Hughes, Leif Delgass, José Fonseca, Jon Smirl&quot;);
 MODULE_DESCRIPTION(&quot;DRM shared core routines&quot;);
 MODULE_LICENSE(&quot;GPL and additional rights&quot;);
 
-static DEFINE_SPINLOCK(drm_minor_lock);
-static struct idr drm_minors_idr;
+static DEFINE_XARRAY_ALLOC(drm_minors_xa);
 
 /*
  * If the drm core fails to init for whatever reason,
@@ -101,26 +101,23 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
 static void drm_minor_alloc_release(struct drm_device *dev, void *data)
 {
 	struct drm_minor *minor = data;
-	unsigned long flags;
 
 	WARN_ON(dev != minor-&gt;dev);
 
 	put_device(minor-&gt;kdev);
 
-	if (minor-&gt;type == DRM_MINOR_ACCEL) {
+	if (minor-&gt;type == DRM_MINOR_ACCEL)
 		accel_minor_remove(minor-&gt;index);
-	} else {
-		spin_lock_irqsave(&amp;drm_minor_lock, flags);
-		idr_remove(&amp;drm_minors_idr, minor-&gt;index);
-		spin_unlock_irqrestore(&amp;drm_minor_lock, flags);
-	}
+	else
+		xa_erase(&amp;drm_minors_xa, minor-&gt;index);
 }
 
+#define DRM_MINOR_LIMIT(t) ({ typeof(t) _t = (t); XA_LIMIT(64 * _t, 64 * _t + 63); })
+
 static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
-	int r;
+	int index, r;
 
 	minor = drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
 	if (!minor)
@@ -129,24 +126,17 @@ static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
 	minor-&gt;type = type;
 	minor-&gt;dev = dev;
 
-	idr_preload(GFP_KERNEL);
 	if (type == DRM_MINOR_ACCEL) {
 		r = accel_minor_alloc();
+		index = r;
 	} else {
-		spin_lock_irqsave(&amp;drm_minor_lock, flags);
-		r = idr_alloc(&amp;drm_minors_idr,
-			NULL,
-			64 * type,
-			64 * (type + 1),
-			GFP_NOWAIT);
-		spin_unlock_irqrestore(&amp;drm_minor_lock, flags);
+		r = xa_alloc(&amp;drm_minors_xa, &amp;index, NULL, DRM_MINOR_LIMIT(type), GFP_KERNEL);
 	}
-	idr_preload_end();
 
 	if (r &lt; 0)
 		return r;
 
-	minor-&gt;index = r;
+	minor-&gt;index = index;
 
 	r = drmm_add_action_or_reset(dev, drm_minor_alloc_release, minor);
 	if (r)
@@ -163,7 +153,7 @@ static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
 static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
+	void *entry;
 	int ret;
 
 	DRM_DEBUG(&quot;\n&quot;);
@@ -190,9 +180,12 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
 	if (minor-&gt;type == DRM_MINOR_ACCEL) {
 		accel_minor_replace(minor, minor-&gt;index);
 	} else {
-		spin_lock_irqsave(&amp;drm_minor_lock, flags);
-		idr_replace(&amp;drm_minors_idr, minor, minor-&gt;index);
-		spin_unlock_irqrestore(&amp;drm_minor_lock, flags);
+		entry = xa_store(&amp;drm_minors_xa, minor-&gt;index, minor, GFP_KERNEL);
+		if (xa_is_err(entry)) {
+			ret = xa_err(entry);
+			goto err_debugfs;
+		}
+		WARN_ON(entry);</pre>
    </blockquote>
    [JZ] would WARN_ON(entry != minor)be better?<br>
    <blockquote type="cite" cite="mid:20230724211428.3831636-2-michal.winiarski@intel.com">
      <pre class="moz-quote-pre" wrap="">
 	}
 
 	DRM_DEBUG(&quot;new minor registered %d\n&quot;, minor-&gt;index);
@@ -206,20 +199,16 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
 static void drm_minor_unregister(struct drm_device *dev, enum drm_minor_type type)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
 
 	minor = *drm_minor_get_slot(dev, type);
 	if (!minor || !device_is_registered(minor-&gt;kdev))
 		return;
 
 	/* replace @minor with NULL so lookups will fail from now on */
-	if (minor-&gt;type == DRM_MINOR_ACCEL) {
+	if (minor-&gt;type == DRM_MINOR_ACCEL)
 		accel_minor_replace(NULL, minor-&gt;index);
-	} else {
-		spin_lock_irqsave(&amp;drm_minor_lock, flags);
-		idr_replace(&amp;drm_minors_idr, NULL, minor-&gt;index);
-		spin_unlock_irqrestore(&amp;drm_minor_lock, flags);
-	}
+	else
+		xa_store(&amp;drm_minors_xa, minor-&gt;index, NULL, GFP_KERNEL);
 
 	device_del(minor-&gt;kdev);
 	dev_set_drvdata(minor-&gt;kdev, NULL); /* safety belt */
@@ -238,13 +227,12 @@ static void drm_minor_unregister(struct drm_device *dev, enum drm_minor_type typ
 struct drm_minor *drm_minor_acquire(unsigned int minor_id)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
 
-	spin_lock_irqsave(&amp;drm_minor_lock, flags);
-	minor = idr_find(&amp;drm_minors_idr, minor_id);
+	xa_lock(&amp;drm_minors_xa);
+	minor = xa_load(&amp;drm_minors_xa, minor_id);
 	if (minor)
 		drm_dev_get(minor-&gt;dev);</pre>
    </blockquote>
    [JZ] why minor-&gt;dev need ca_lock here?<br>
    <blockquote type="cite" cite="mid:20230724211428.3831636-2-michal.winiarski@intel.com">
      <pre class="moz-quote-pre" wrap="">
-	spin_unlock_irqrestore(&amp;drm_minor_lock, flags);
+	xa_unlock(&amp;drm_minors_xa);
 
 	if (!minor) {
 		return ERR_PTR(-ENODEV);
@@ -1067,7 +1055,7 @@ static void drm_core_exit(void)
 	unregister_chrdev(DRM_MAJOR, &quot;drm&quot;);
 	debugfs_remove(drm_debugfs_root);
 	drm_sysfs_destroy();
-	idr_destroy(&amp;drm_minors_idr);</pre>
    </blockquote>
    [JZ] Should we call <span style="color: rgb(0, 0, 0); font-family: &quot;Source Code Pro&quot;, monospace; font-size: 13.3333px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">xa_destroy instead here?</span>
    <blockquote type="cite" cite="mid:20230724211428.3831636-2-michal.winiarski@intel.com">
      <pre class="moz-quote-pre" wrap="">
+	WARN_ON(!xa_empty(&amp;drm_minors_xa));
 	drm_connector_ida_destroy();
 }
 
@@ -1076,7 +1064,6 @@ static int __init drm_core_init(void)
 	int ret;
 
 	drm_connector_ida_init();
-	idr_init(&amp;drm_minors_idr);
 	drm_memcpy_init_early();
 
 	ret = drm_sysfs_init();
</pre>
    </blockquote>
  </body>
</html>

--------------0DqO0rnne25MaigARN2Y7z6a--
