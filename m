Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8205C6AE358
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 15:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D346210E4DE;
	Tue,  7 Mar 2023 14:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89BF10E4E1;
 Tue,  7 Mar 2023 14:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678200646; x=1709736646;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AUwtmgOInpIN6raXxwEoYSFfTPuMrKms91AeqYMAOfA=;
 b=lbhiucC0oy58KQS0pvTjuNBkRPnaXFaG82C/qxZKn9A4UxxQTwLD0TQV
 q8D47J1rY1eHTfMgdat4fNcpuUxr8eW0uX0hgEh/jMhAHConF/JiCXw4X
 UHMT/fSvMRz7ixQfZ1WU5t5BPUrdaA7sFJI+FLjIyjs0KluqzUR246X1q
 RPVKtoj/LDMxJk3YwBCUis49JLE+R5LvgD6aXSczvX69NhSfegZT2d22S
 3k8dCAWEmYJbBNGd1ITRwPn6tzqZS06UGiCCoOGsaOAwbTQWcSnhdkDMH
 zZ5Nm46BzqMqo2b1OYIfPhIdB+sUyrh9t8T3W/oR3nCioagfxQSkHsuWP Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="400688292"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="400688292"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:50:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="800415593"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="800415593"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 07 Mar 2023 06:50:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 06:50:45 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 06:50:45 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 06:50:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9KJ3SKb5ncEst2napPoFnYgpa1G3L94P8Yx6bRYFB9apDe+JhsR2ssSaVxhmDPyv1E+1VP/h0pZ2RY8sq4vyciz/RzJ/NCqdgWTxLio7B0tyHQpxGhkbVniVhmqn1UTv9P0oBLQTERBrBKB+XhXDhWKvrwQwZnIUvxcGVcsXLB70y+CNmTzsLDUl7FVbBex11921K5/xocvVrtIYQMePlMGb+PzgI6UJBpqNs+CJMBSi5+enR9UWgFnyczRGW3Hg97Gq8A8La7s8pH1B3dDpQygMhhSs2cDzhCE+/AUPIimXPc2pGJZWArpWwRplkMLqS92BoMqYDlWYMxi3/HmQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAKhpoF5sU89RG8bSFQQPCzT/b5jMt2APV89fhSDiP0=;
 b=XchsyKSv5GzSx/RWG/NStAO4mBDujjW35e6+FkG5hgEMoB5xXdkcgKudmV3G02gWrg9U8zY4xBQMqOM0DnACyBfkjAyL0pqES6yYTucyzFbasZv/pWU7g/B1IebUhMDt25FtUK8+qEC3WddEK7+oxG31oo8VAswMixbq//PdzsAhuou4WzX8AM4Cve/YxsjPHQ3xxeOqu5T0rj7yT094W1hQWH9poMtkNK8xrZZ1H+ITM6ntzmDDR/aXggbaiJBeJZ43HsN4rhZ24G77cdQ0dEGx1a4/XTl9lHb+VLMHxquQnRp3badoQg8dLZWKIBIPO4dM12+amq1ais8OChtUEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by CY8PR11MB7243.namprd11.prod.outlook.com (2603:10b6:930:96::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 14:50:43 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::cc58:aa84:72be:b4fa]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::cc58:aa84:72be:b4fa%7]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 14:50:43 +0000
Message-ID: <ecbee22b-c9f5-0503-fbdc-1d408035ad5b@intel.com>
Date: Tue, 7 Mar 2023 15:50:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 3/3] drm/i915/display: Implement fb_mmap callback
 function
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230306102850.18299-1-nirmoy.das@intel.com>
 <20230306102850.18299-3-nirmoy.das@intel.com> <ZAX5jC+E/aUgUW9X@intel.com>
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <ZAX5jC+E/aUgUW9X@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::17) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|CY8PR11MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: fc5388af-bd42-4d44-c50c-08db1f1b53cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mjGit4fRqIrOpcQsDLPp9tuKLMo6z1dO20WyGhSeS8kVI5+pz+BQkEGqrYS9jKRPdxVWZrW2U7wpKeozKr+HL32yLr6dvZP4ljQQ51wljrIbGFNdZy/uTBdNwaDv/dvuCH0Lmg7AO0Exv+GNeuROrqG3foMNOOgdUIWhJaZ47joLsFzU9pFGN1akXY1a6DX7YhQHFydJSmXYfNlcHmHYuKQpC/9OUJlBYo0kyAqmUfy2ug9Bip4tNP2J1Fkk5IPkXeaLdJQNP0w6liLJKX5xn0ydz9eivgLggOgoVBlB/YW0B/2nCdQxqUpop8SY/7QtE+jV6dRtvIxTBDs99zi/gXqKXeyz0X9bk+OJmxbj3ASKGb1RbgZ7LoYtgJ5qYymrHPhfBwkbpB51UBt8FKrEAC+gNaN3f1t3PtQfWlZS6MiVJw8exPFIHHZV0GO0GkppOBJuPUp6iFuko3AtD6c88g2hfVpJ6iTZdzZHjxSb8V+2fpoDYJjBSKcOmE67ykaKVhvTH3ClTz08jx3cAg+ajbX90eDonb5ldRZp1oBqX0/9Mudq7zA5McvE8IPGEX3oHzPzj10Pebj29o+XkSdXdz+vZptgQpSxjaEy93LcX0mpqmIPwVaf9MPVOe7X0xbP5YhBWynaiz0W2vUus1zdyrG4PsPpAVNAsIQTT8qBpOBiySn8iipUADKtHiryYyyVn6YKoaHgtrpsXivhcsV9+F7qcJf+CYPh+ha/+l6F6Fw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(376002)(346002)(136003)(366004)(451199018)(31686004)(2906002)(5660300002)(8936002)(41300700001)(316002)(4326008)(6916009)(66476007)(66946007)(8676002)(66556008)(6486002)(6666004)(478600001)(53546011)(6512007)(6506007)(31696002)(86362001)(66574015)(38100700002)(2616005)(82960400001)(36756003)(26005)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzZNL1hGUjZ4V3VzSjg2Y1pVNGZ2OEd4NjI2bXl5a1BkNFJ1VGYzT2RYWjFD?=
 =?utf-8?B?NXNETTlEQm1HbHBzQWQwZmdxOUIvQTlTRmltS3A4djZPdmdyRmE2ZndTeldV?=
 =?utf-8?B?UTF1VGFkaGRzSEhlUlVuNmRFdndLZEZjbWVuL2tCaWxvdTgwVm9NYzlnYzhM?=
 =?utf-8?B?Nm8zWFR4OFlkZVovZTFzTjJDOHZkajN6Zlg3RDFvMUxMZndVdFBkblJBZ0Iv?=
 =?utf-8?B?bk1FU3p4dlIwd0VKSHFQVEhoNEZJUk9sY3dMOXpDeDhOYVZNalBjUkg2RUE2?=
 =?utf-8?B?U0RMcnNML3oyejVJNTZSNmU1b1BHeHF5VWFjR0RHNDI5d2dPZ0VCejlvVnA3?=
 =?utf-8?B?djJMcU9Jek9GdXcrTGNkTlVEeEVpQU55YmNyOGJRMHlPWkVkY05aZzFPR1l1?=
 =?utf-8?B?SXhRSkxqeXk4bFEvcHV0YWwzVC9vcVQwL3k4NmJmV1d1RzdJMzcza0JGbWIy?=
 =?utf-8?B?eVRpWTFaQmtlVnJxQ1VqRlRWVWpvUXAyRTBiRkNtOWpVSUpLWUUvcWpZbjJv?=
 =?utf-8?B?MTg1Mk1rcDlGbU5UWHVUR2dnMEtWNnV1Njk2aW1QM1hxNU53b3lOdjNlMDln?=
 =?utf-8?B?eWNPbE01TW9WbVFsbzVRYnk5L04zcm50enV6ZEZBQlliL0xxZHZaekVwZDdJ?=
 =?utf-8?B?dFM2ak1GNmI2VFM5MitISDljMmoxRTJXUVdoZ0lrTkFqQXlpbDY0R25objRa?=
 =?utf-8?B?eEpaWWQxVStpak1jMXpFQzNHK1ZGeW0vSkNQd1hKKzNBSDBPRDJSeU5hQ0Y0?=
 =?utf-8?B?ZXE0TWNCNlJTK1hnUUowUFR2bmg0WVl4WVVZZ1ZpWUh1TmFqeUR5dXk0SmE1?=
 =?utf-8?B?ZUorb2V1L1NYTHlwRGpja01lTzNqRVM1Q1FLWFBoaWFrZUkzZ2cwVGJpK0cz?=
 =?utf-8?B?MXZxRmRBcFNkMFNWS05peTUwc1J6N3Z5UzM5Q0RQVkVCelJXY1J4c0JWd1l6?=
 =?utf-8?B?Y241SHcvT1c3VUtCSDNwVVNWcDRzMVMxcmxGZmdocUlzRlJHNWVHTmhuREVR?=
 =?utf-8?B?NEFIaWswZ2ZkblQ2UG13cHlRL1hQY0RieG1iNUladmxNZTc5WFhpQ2hqQzla?=
 =?utf-8?B?ZlpzdGdUeFNZaFZYYWFBQzFFQzB5VHQxNUlsQWd3MGozMDIxaWdPek9zbUY3?=
 =?utf-8?B?NUdiQ1l4VHUvQzdiT2lYZ0lURnBscjR4a0U5ajlDUFJVTmFQblVlcFlYWVkw?=
 =?utf-8?B?NnhCa1FEQWlqN01rVzVrUHdSRUV2TG4wc3JVZ1o3RW1LbnRCOCtEZjJBWkRT?=
 =?utf-8?B?WkRHeWQ5ZmN3dU9UNGcvUkhrTUNrNTlHMnBIZ2xUZmQycThJb0JiZXZsekNB?=
 =?utf-8?B?Mk5taVhCMSs0MzdIS3RXcTA1ZU45Qk9WeDR5cEw5d1ZIQWVjVUo3YkgyeEJB?=
 =?utf-8?B?T1NnTEFiclpwQXkrVUlPK3d6aVc5MS8zRGI2RWxwdTZRaHdsRFdlMW5UWkhi?=
 =?utf-8?B?RDM0NE5HWHZDNmd1QmpuK1RJell4WTZueDE3bUlhamF0ODBER3dWcmx3Y0Iv?=
 =?utf-8?B?RWNMMVd5Q2NiTlFlN1lSTHBmcmM4WmIrVHZCRGdTdTdxVStkSVRXb3Q4MUZ3?=
 =?utf-8?B?M1ZGMmV4cCtkUnlNSFRZdVNhNzBsR2JrRXIzYlNJSm5NaEEzSnFFaDRlakZR?=
 =?utf-8?B?RmhES3E2TytWWTJ6eDZXVTNXTHdLTEdZK1FIRG01T1U4Uk84dHRrODRKRjRm?=
 =?utf-8?B?VnVhN3h2c1JOQlZaVUtNWTlMWnFMaVF3NmRzODN6VkdVMlU1a01SRmlyc1My?=
 =?utf-8?B?ME11MEtISWZMREMzdk90c2h2eEJiMndsNVhkeVZ1NW45TWtjSUxRUFlXVnVK?=
 =?utf-8?B?SGw2UE10dG1uQkROY3dvMnM5UHRHN2FlWHlURkNpWi93Y3kvYnQ3eGdva2ZP?=
 =?utf-8?B?RS94SkJ0VTFueGsxZ1pxZFlMKzlwVGlmbDhSR05YRVJKM2x5ZzAvd0taTlEx?=
 =?utf-8?B?M0xEL2U2WnpDWTV6VnJSbzBybFAwWmRGUTBXNXVzSVBOMlpKZzFhQWJBcXk4?=
 =?utf-8?B?QlNjQTVNSDZRNTZWeDQ1K0o0WnQ2Zi80bnYzTlplamRzb05EUVM3bi9EWTRB?=
 =?utf-8?B?UDJydXNWRUpQeWlIcy8raGpOZUZJQUpuM1UyZkpkcVlzdmVnUHIva0VFNFBH?=
 =?utf-8?Q?JI1rqehSnXGrcubEnA7RZ4feF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5388af-bd42-4d44-c50c-08db1f1b53cd
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 14:50:43.5348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CmNglFLm8aqhhAXdHEZGmnxHDpwbMAfGWRjZKksbAj3RL8vFYnTEQ+4ElMChnG2QGoO3tRayMMYpFyGKkvzF1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7243
X-OriginatorOrg: intel.com
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville,

On 3/6/2023 3:32 PM, Ville Syrjälä wrote:
> On Mon, Mar 06, 2023 at 11:28:50AM +0100, Nirmoy Das wrote:
>> If stolen memory allocation fails for fbdev, the driver will
>> fallback to system memory. Calculation of smem_start is wrong
>> for such framebuffer objs if the platform comes with no gmadr or
>> no aperture. Solve this by adding fb_mmap callback which also gives
>> driver more control.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_fbdev.c | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> index 98ae3a3a986a..ed0f9e2af3ed 100644
>> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
>> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> @@ -40,8 +40,10 @@
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_fb_helper.h>
>>   #include <drm/drm_fourcc.h>
>> +#include <drm/drm_gem_framebuffer_helper.h>
>>   
>>   #include "gem/i915_gem_lmem.h"
>> +#include "gem/i915_gem_mman.h"
>>   
>>   #include "i915_drv.h"
>>   #include "intel_display_types.h"
>> @@ -120,6 +122,23 @@ static int intel_fbdev_pan_display(struct fb_var_screeninfo *var,
>>   	return ret;
>>   }
>>   
>> +#define to_intel_fbdev(x) container_of(x, struct intel_fbdev, helper)
>> +static int intel_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
>> +{
>> +	struct intel_fbdev *fbdev = to_intel_fbdev(info->par);
>> +	struct drm_gem_object *bo = drm_gem_fb_get_obj(&fbdev->fb->base, 0);
>> +	struct drm_i915_gem_object *obj = to_intel_bo(bo);
>> +	struct drm_device *dev = fbdev->helper.dev;
> You seem to be missing the fb vs. mmio handling here entirely.


Could you please expand this more, I am not so familiar to fbdev code.


>
>> +
>> +	vma->vm_page_prot =
>> +			pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
> Does that do something sane on eg. !PAT?
>
>> +
>> +	if (obj->stolen)
>> +		return vm_iomap_memory(vma, info->fix.smem_start,
>> +				       info->fix.smem_len);
> Why doesn't i915_gem_object_mmap() know how to handle stolen?


Sent out another rfc series to address this.


Regards,

Nirmoy

>
>> +
>> +	return i915_gem_object_mmap(obj, vma);
>> +}
>>   static const struct fb_ops intelfb_ops = {
>>   	.owner = THIS_MODULE,
>>   	DRM_FB_HELPER_DEFAULT_OPS,
>> @@ -131,6 +150,7 @@ static const struct fb_ops intelfb_ops = {
>>   	.fb_imageblit = drm_fb_helper_cfb_imageblit,
>>   	.fb_pan_display = intel_fbdev_pan_display,
>>   	.fb_blank = intel_fbdev_blank,
>> +	.fb_mmap = intel_fbdev_mmap,
>>   };
>>   
>>   static int intelfb_alloc(struct drm_fb_helper *helper,
>> -- 
>> 2.39.0
