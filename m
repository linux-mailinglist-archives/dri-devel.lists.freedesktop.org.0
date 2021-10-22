Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A22A437FDC
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 23:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298206E5AE;
	Fri, 22 Oct 2021 21:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400116E570;
 Fri, 22 Oct 2021 21:13:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9iqctxsMYwcVtvGnMFGGymC+7a33HeWT0yfnh46pjO7hnftyfmyUHfQBgOmuFSeVTfTuymV5/KXaN5l9dU63bvUeBdoJcZLTL89G8x1B4Wy3fhvwFWfiQ47tka2PsHOKSJmgwLit9CY3bazaTK1Y7lFE7BiEGY3MMDTSwDNGQJC29oBGtB0Cjsd0g8gr8iVsL/WGlAoxeUBUvwxrmvnhErkeuqVxm6ilguVYdF4G6VupF3mQSoU7sUU/tYwMZ+q6VgXZxopLvYgTEj9Yay+rPuW+Y0OqqiZrHIZ6rjicaJ+r5dTeJB/yW8FnaInzya9ghAAzUwcvfDptXxc+dXSZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMqnFc9OeZY1BWjfSx0l0GnvB+fA2em+4mrN2q1N7RU=;
 b=V7CtoxW4VaFYyeqKyM8S7log8zEj6KaSPpeFEnVo8gniP5RXtnryEUsQgzFjqBmseFYXR+7XZbSFrOstQcjsp9heZSTqHj7jW4kq65/5YFQ4sT8YH2QnKEXohuDD3kjbJjYk0bKb/2+tWMR1WsbUXfGmS0f9NvUFxBsqx9wxZXeRS85fX2RerjqDSZqt1mB2zylQypqeJpbWPFATGSApiazK2pUdCy0l+F42ePWHRtAPxBpEojNdBGKQWo+hluSQub+mmegx8fE2+8EtwHlTkU1Q8OR7zPTdd6YqgCD6hBs7tz5iBlxpZ0qGwdZKLBh7qUfpZlFvuqZdK7r1UrW9Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMqnFc9OeZY1BWjfSx0l0GnvB+fA2em+4mrN2q1N7RU=;
 b=vT2KVTPKrF4npTHj6M4VzyIQHhAU0ZA7i6105IpI87UheMy1c5MlEhTkl5H7MH5ftfLZ2lAcNNmHdO7yrf3xBI7qe/T3Z6aoyci3Gb3iUk6t9IgAzRCl9216xah9Eo8P4KWvIO4eF/jeBgDR+a48i2bCAu6kflywX8b+kvj3awU=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN2PR12MB4000.namprd12.prod.outlook.com (2603:10b6:208:16b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Fri, 22 Oct
 2021 21:13:54 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6972:7084:df02:6dc3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6972:7084:df02:6dc3%9]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 21:13:53 +0000
Message-ID: <aef9bba4-cc5f-bcfa-1ccb-33483b4507fc@amd.com>
Date: Sat, 23 Oct 2021 02:52:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 03/13] drm: add Makefile support for drm buddy
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
Cc: christian.koenig@amd.com, matthew.auld@intel.com, alexander.deucher@amd.com
References: <20211019225409.569355-1-Arunpravin.PaneerSelvam@amd.com>
 <20211019225409.569355-4-Arunpravin.PaneerSelvam@amd.com>
 <84ff2d86-345c-8bcf-81c6-467b9737f652@suse.de>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <84ff2d86-345c-8bcf-81c6-467b9737f652@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0077.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::17)
 To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
Received: from [10.138.142.32] (165.204.156.251) by
 MA1PR01CA0077.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Fri, 22 Oct 2021 21:13:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0aad228-e076-40ce-eb5c-08d995a0d9cf
X-MS-TrafficTypeDiagnostic: MN2PR12MB4000:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB40006E140C3EE20722E28BB6E4809@MN2PR12MB4000.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 66mbz8zzkgVaqepZZTt/yrZhegaqCzBkm9kLDLOQhRrbkforVDgXhF+0mQG/jgMR/ljPOVgVGqKfnDRETDwtbv1BXG0EVu9Ha6ZKbvgLAUkP2AqhNpudClVWIcg6m51QALcxuPSGGjcI1gwLbHy8DyxTwX9DbyjxQaYfLFJd4V4SHT+L6gvNEhxcOpb0iofiZV7CBlPGC2dqdQ6EiOxhOvcrImrfMxSZWGHgAx3+xGpnnxSzzRWDHcLR7McTGn1mIlwHjMY+AZOshBOe3AS15lCgU8GRsgNJvF9OCIcG8t6i2YZoBjmaGF1tqjileWT0VLRFn2w5L1zyRsMpe09XBL9dybJZ51A0ON3ccZ5alWpHVPCqr5dGP1di/z3MwT+OYz/TwXRpPjhCg/Fe0sO1S3Bf9DmTwBTfqrV9Hdkleg+29feSaTXxQOSTKru6wlPR6sQJoAwHvfzvALh6e1YYYC0mlwNfL5BhvBTSVTqUT66vGI6LvFq3JUTDBW8/J/xOkiofWPsTGO422BSAlIaEnQiF/JFpw2PSmBmE2XTiEOnxI+6J9v1Uzl98YCgQpH/twFuCr69WqJP4PDhhLooKT+k65oOmMgRnxyPv3Etd2HQdnIIia4ycLLXc6D2JAkjBO7+DUN61jVWtLL2N2yIGnLaPjemCtXDOuylnqtd8geBNSBYlIo4bLDHpejKxapQN0hwZH5A1aBL0gu0zIgyBvbX8HAX+qCaEdnc3jo4d6WkDcNCDa692mM5y1uKEeZIr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(36756003)(16576012)(4326008)(316002)(66556008)(8676002)(186003)(86362001)(2906002)(508600001)(31686004)(956004)(6486002)(53546011)(26005)(83380400001)(31696002)(5660300002)(66476007)(6666004)(8936002)(66946007)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TERYZjhEeU9UR2UwV2c2VW40TDFZbTNJL3VWVkxsdUVHU085QndldjA0bEh5?=
 =?utf-8?B?RDN3S01XRThqUVZyK2tnZlZBSmNJcHNiZ0hpNnJsM3BSWTZZZ05vSktHZmdj?=
 =?utf-8?B?R2tGZ0dIbWdZb0pYbGtxdzdFWWpkL1ZSVk1iVWFHSEtJU1pibzJFN01CMVpR?=
 =?utf-8?B?bUNPV3pHNmMxZWRZc1N0UnNqb1E0TXorbUR2M1l6bzdQRUhFRE4wNkJ6MUs5?=
 =?utf-8?B?bG8rcU5HMngxOVJGTm5KRDllNmxsMVkzSDVqSkI2c21HL1I3amxDd20xaWUv?=
 =?utf-8?B?K0JGWVJkSStRRmdwSDc0TmxRS0lNR2dZRkhQODJmd3JEcysxZ0ozU3o5cWJp?=
 =?utf-8?B?M2RROWhxcVpVMWlBL3c3QUlKWkJWeE1DeUJKSGNpNnRrTENSbVUwOGxJb1hy?=
 =?utf-8?B?MU52RElZdXY5VGpBV2p1ZjdPVXpLRXdiK0NYMVh0NFh0WWI0akltWldlSyt5?=
 =?utf-8?B?WWZyeHZPdHZ3cWxSOHBMTzBLRERQbGswUm1ScElpNVUzMy9wOUw1Vzd4T3pR?=
 =?utf-8?B?MFdxSWJVSXJDSS9tamtYZDZyTlRPb0JoQmhpMHZMZ1VsTldlczljdTdMRnc2?=
 =?utf-8?B?Y2dqOUphWXFHTXZZRXd5UmdWQVlISWtXaW03dDNNNlpOV3VJcTQycTR6ZGk3?=
 =?utf-8?B?NXU0NXNaeS9lOXQ1bElGY0J4bWZETi93S0g1ck9aY3BZL2ZabTZOeU1Hekdh?=
 =?utf-8?B?b0NuWXZ4Y0FyU3krYTB0cG5kT2xFZXIzUnRISjhHeVN2UFZXcTF3TDdyRmp6?=
 =?utf-8?B?ZlZDcTZFb25TamhFdjRQOTA4RnFtcGJseTJtL2xWMy8yS09DajRpN2VaelhM?=
 =?utf-8?B?clRyclBqckl0L1RpSUNReHlyMDR5b0ViWi90WFNGa2ZvbTN5OE5DdkdYNENk?=
 =?utf-8?B?ZTdzcld1WWZYdWZmVkhXQUt5MXgxNDJpTSs0bXVJazdHY1BVeHhYMjI3c1Bt?=
 =?utf-8?B?SmtjM2NiNVd4ZTc5b01ycE9ENlRGTlduYXprSHZYeEdLSjQ4YnZoL1dQcUJh?=
 =?utf-8?B?dVFTSlZPa3o2WElDc3l4QURBQjhGYmowNCtLWXdWazJPZktIMUF5N3VWUWJ3?=
 =?utf-8?B?d3BZR2FtbEs2ZTZPTVBMM01YWWFDR2dhNTBUOW45UTYyaDFRRG43QnhMYmts?=
 =?utf-8?B?L1pBa2lJVTNMYnBmNU9STUxQMXkrOVYyVEhiV2lqMWJYc2xWeElkMU96dVFs?=
 =?utf-8?B?aXZxV1VlUGFPY25ERjFHc280UDNWckRGUDBVS2JQSVhZR09xN2JVcVRQd1da?=
 =?utf-8?B?ZlpRNlpxeXB1ZnVMWXp0TEpnRzlkMWRrN1Fkek9Qd2Y4QUoyZmI4VFhjaEQv?=
 =?utf-8?B?cGI2eC9rcmZvcFNYcUJGZlZ5cU5kV3dVMldqM2hOS1MxU1Ewc2ppOFBtN3Vz?=
 =?utf-8?B?ZW9NSy9Yd2cySzlVRTc3OEFtRi9ZQWkrT01XWCtxbkU0VWhEQ3pvUWtkOENC?=
 =?utf-8?B?SHpmejN6US91NjJIOU90eUkyVGEvdEVucU1XS1RWTElVTCtyWEpnM0xOMUNW?=
 =?utf-8?B?Nyttc0pOUUxkbFNqQjNDczhJakZCd2tBSm10RjJUc2ljZW4xdnJiSDQ4NDdw?=
 =?utf-8?B?Z2ZqdWhHaFg2YU8yOGdEOXZYU2dheUtUNUpyTXNLczlhSTVXcEdvZG5XTHdG?=
 =?utf-8?B?cjVyM1RNZ3A2RlFNWnVGNGJWV0JERTRoejlKR3dBdWRhWkREdWliY0gzQXVZ?=
 =?utf-8?B?SlBod2JnQThkMmgya1NnUlVBN0czT2VLYXhYWU1DbHVEdnhTNllEWUhKNEcv?=
 =?utf-8?Q?8/tXizg9whWwL57XXRdpa8lRjisMr0eUUBuqQjj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0aad228-e076-40ce-eb5c-08d995a0d9cf
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 21:13:53.5525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apaneers@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4000
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



On 20/10/21 1:51 pm, Thomas Zimmermann wrote:
> Hi
> 
> Am 20.10.21 um 00:53 schrieb Arunpravin:
>> - Include drm buddy to DRM root Makefile
>> - Add drm buddy init and exit function calls
>>    to drm core
> 
> Is there a hard requirement to have this code in the core?
> 
> IMHO there's already too much code in the DRM core that should rather go 
> into helpers. The allocator should live in it's own module and driver 
> should init it if needed.
> 
Hi Thomas,
I will check on this
@Daniel, Could you please share your opinion

Regards,
Arun
>>
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/Makefile  | 2 +-
>>   drivers/gpu/drm/drm_drv.c | 3 +++
>>   2 files changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 0dff40bb863c..dc61e91a3154 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -18,7 +18,7 @@ drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
>>   		drm_dumb_buffers.o drm_mode_config.o drm_vblank.o \
>>   		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
>>   		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o \
>> -		drm_managed.o drm_vblank_work.o
>> +		drm_managed.o drm_vblank_work.o drm_buddy.o
>>   
>>   drm-$(CONFIG_DRM_LEGACY) += drm_agpsupport.o drm_bufs.o drm_context.o drm_dma.o \
>>   			    drm_legacy_misc.o drm_lock.o drm_memory.o drm_scatter.o \
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 7a5097467ba5..6707eec21bef 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -43,6 +43,7 @@
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_mode_object.h>
>>   #include <drm/drm_print.h>
>> +#include <drm/drm_buddy.h>
> 
> In alphabetical order please. Here and everywhere else.
> 
> Best regards
> Thomas
> 
>>   
>>   #include "drm_crtc_internal.h"
>>   #include "drm_internal.h"
>> @@ -1034,6 +1035,7 @@ static void drm_core_exit(void)
>>   	drm_sysfs_destroy();
>>   	idr_destroy(&drm_minors_idr);
>>   	drm_connector_ida_destroy();
>> +	drm_buddy_module_exit();
>>   }
>>   
>>   static int __init drm_core_init(void)
>> @@ -1043,6 +1045,7 @@ static int __init drm_core_init(void)
>>   	drm_connector_ida_init();
>>   	idr_init(&drm_minors_idr);
>>   	drm_memcpy_init_early();
>> +	drm_buddy_module_init();
>>   
>>   	ret = drm_sysfs_init();
>>   	if (ret < 0) {
>>
> 
