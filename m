Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 055A3787758
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 19:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F94A10E5A4;
	Thu, 24 Aug 2023 17:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B7B10E5A4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 17:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692899912; x=1724435912;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iCw0U4w4HKzwvagVH1PI8LbfLF/7aWQHnKEB7cRQLA0=;
 b=dvXtmno5UvZs0TyFocL6+1X5QF8+OOLi1TwTAz833tkgseQGpzgnNBPn
 dsLGE0O14HyJmj6XJqxKGBpiXsPm23PDSzDO6duI4GS+JEQWRiE1kIoLb
 m/5oADaVrhgR+yJ8IMhWJJXEzPzGvJwMID3Xtwwn8hzfZ7poIIFgcIUtB
 DN5h/RuKrptKTV5vsRpjEnMwKPVO4YcxKUiA8AyQdMLCMMpx8RsHYLUd2
 HZdS8tlCtoUW0RMNaytdT9S106z/NAftXM3VTE90XV/9BCqn/UoJT0heh
 gvsvXmHUTo8cNmcAUArLiRzy+akRLDkyexpa3T0BsHS2qutXuVxZnjZTo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="374494079"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="374494079"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 10:58:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="737139794"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="737139794"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 24 Aug 2023 10:58:31 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 10:58:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 10:58:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 10:58:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HiazZI9dEtPPVbycCo2gS0EHokp3legoi7x1bx/lMNL586nFkGp7NtiwFFZSZfNxoBWYKaoutlA8T/Y+VkUhSg/Et/Dj/c7kxFawcClo+LLPEH8MwzPAqkYZ1xvOPrBx1IOBnliwMYTqHpfrdEABKcYC1LdSSMB19S5hSCX5LZP7+dmM/0zol4dpQZEdxiYhhK1+lJQQFCvycw7MdgVSq5zL90Ibb29I2GBFrgn7Q40mTQXL2G0Dq19tuM/rIMdY5N7zWs4MdK2t7kAbRM8FTD2cJ6PgxxhZzdG+pbwesFU0fieFTLHsjmGZJTloPtiLiJVOEL+rEeSPTG5KDE68yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IpypectvdzF8VoOcoNbH16ZfPsz02qRZw1nwUmCtxVc=;
 b=nT0ZBtsQJIUanBE5PEURz76aSMoKnblafE0cM9jZ9Ld6+BM/JI4hGpERoPhbZgT1K+DD+vlVFDpZhQjHoBe3+uAuaI57eVS5Pd5qB1rge27HVQgz00Sx0Oc7WJzXP5Z8TfOOgUX9AjqEzmMqtdy37s8vqiGJXdh8bDhf8IruagudWFGZdIi20p/7sH2O+UA38UZGRNAOiDAVTw0V9RyaWZ8nY5vrtDaZkDiy5onqaWXqFdUleGzK89xP5d5M64tvLZcHTxnOVQ1JfLhpdsx3cZLStyeocP5UC8tUvfADdKX1gvPl+m2uVr6KhZrlYs0mh9XBrdC26tQgOe0yF9w8rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 by IA0PR11MB8355.namprd11.prod.outlook.com (2603:10b6:208:480::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 17:58:28 +0000
Received: from PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::e12e:7690:e251:1aa5]) by PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::e12e:7690:e251:1aa5%3]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 17:58:28 +0000
Message-ID: <a07fc333-3481-6ab3-f22c-f64054b49beb@intel.com>
Date: Thu, 24 Aug 2023 10:58:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC PATCH 3/3] drm/virtio: drm_gem_plane_helper_prepare_fb for
 obj synchronization
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230712224424.30158-1-dongwon.kim@intel.com>
 <20230712224424.30158-4-dongwon.kim@intel.com>
 <04181690-adc2-fc30-d1b4-b6ca5b02a142@collabora.com>
 <8689536c-4760-a32b-76f4-65c022b5eadc@intel.com>
 <535626da-0958-7c42-7bc1-6f7c0f805634@collabora.com>
From: "Kim, Dongwon" <dongwon.kim@intel.com>
In-Reply-To: <535626da-0958-7c42-7bc1-6f7c0f805634@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::12) To PH8PR11MB6879.namprd11.prod.outlook.com
 (2603:10b6:510:229::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6879:EE_|IA0PR11MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: 322e74ab-8d3b-45cf-5846-08dba4cbb83a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 69r1FaDOaqOaZtHRRYa/pQ/hS+u74dd38Fwy6GVGq6lizcLSNAHOsGh5ugbE7cnB82+HgA/5BWeiXF9mYQh7hKvG+xIl4UDVLVHflAdMtHZn/IjgDVOxX5+45HP7R8fQu9XaiBrbukJi2hLvRB9nNcmAEqG42LbUfykHHYWf/gsUvWHv4jw9PH+9hAHIm6EmGMcgzAstt3pU3TbppB4MbXcQn7A0H9ixMYIVh/G7/qyL6BcgVueuCX8pievTxCx6jEmhAbyHPanTstJwxeZ38iuCZxJV1ihYCqiSkX74y0olhbqxWC9FLVfPgMEnBLFgpb8ZN1kwqAqBtG5EKxXj3ygqLRlfykS3K871C+vTbxUGT7UhB7Na91R3edopqsFaOW0AgrBh0VLYof8p4MLjHiAOCJbLKd5jmk9J0lMBVL3oVFzH4bVo4d9cSAaGU/UnKR073akjdBn7VZ3njXk59y1mOWom+IPxC3+iEJ+Hy4TeM6LUZ9XjcmB6BP5oDMhGbdS+LHKbYaA1ygyg16/bVVlJlELuAbARN/bWV+HJYmMyjQB9ExA/T4EguzYCJKAFxvUFuwiBOVrh9+yiX2pAgrdXxLu9suWarpvdmalAh43PyC9IpnocyPlyaZUXJEAhlvhqTiN0hCXtviZ8zI43/dPiqz2hxPedeAfQGnzIoZY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6879.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(396003)(136003)(346002)(186009)(1800799009)(451199024)(2616005)(5660300002)(4326008)(8676002)(8936002)(36756003)(83380400001)(26005)(38100700002)(82960400001)(66556008)(66946007)(66476007)(316002)(478600001)(966005)(31686004)(53546011)(41300700001)(6512007)(6506007)(2906002)(86362001)(6486002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akpkK212aTg1UnF5YkY4UTU3OTJWbnMwK2ordkdEelJ1bU9RY3p2Q2VhVTc0?=
 =?utf-8?B?QlAxOGhIbjRnL3N4YTFISFlLMG1rRndmajhqNFJZbnovS0d0bFlzbmVrbU5H?=
 =?utf-8?B?UkVEK01aRTlaWGVIeENYU2oyWkNBcE0ycU1aMjhaYjVDaVJiaS9WZS9TTlBV?=
 =?utf-8?B?OXo1ODhuSHlEWnpnd0lVYU1nb21KQ0w2YWhzRlJBeFBvQzlOVGlRRzEvNS8v?=
 =?utf-8?B?dHh0MzhCeDVFWTk4cllZeVN4OW9tVG5SOExKeGN2SWMwT3N4M2NNTkZOU3Fa?=
 =?utf-8?B?RDZmaDY0Nkl2bmR5aUo1bHpNYWlKU0ZFQzU0QjExVmtGZXZ6V2dmRnVuMzZy?=
 =?utf-8?B?MTJ1WGU5T3ZYYkFQN3ZCS3krV1VpZ3pJMk1vdXlCVU5ndmdKMHI2MG9mcmFV?=
 =?utf-8?B?ai9QVkFlclRFRERhUGtSakRQcUlJRUhZN3ZMekhqaWw2TzFXQ25YNDFLdlVN?=
 =?utf-8?B?d3RMeVVoKzdIekFGQWZKU2VmM1JNTmtDK0VLL214QitBV09haC9hdnVKNnpj?=
 =?utf-8?B?VzdaVHlsOGVyT3RzUzRBZWFjMkRWSWlvK1ZsQ3lmeS8yN0d2bUlTNkxNNnVm?=
 =?utf-8?B?ZXBEbTJ2NUVLVHpLa2dQVmdhRUhGTk5yVVNZZ1lqNnArZk9udmpYTnNFdmtK?=
 =?utf-8?B?V1RxckNHaFNHU2toZUZKS1NLWE9McnY0MUVWby9qTTRud2UzSUZ4a2o5a0o0?=
 =?utf-8?B?SHJZaXAxNzJ1THBoTnkvTTVYdnZ4RHJJL1hyU2ZDOFRxNGRVSmM4bWszU2Uy?=
 =?utf-8?B?Q1ZWcjhOUDZ2TUlrK2xxc1hZYVN0MGdUT0I1dFYraHUwNmZvdzVKdmtaWk5I?=
 =?utf-8?B?MUZEeVJoSlBZd2dsQ3hOUXdKZ2JpTUlsQUZSaTZxOTRob0V1NjZYWDJqVFRi?=
 =?utf-8?B?Ti9MRjQzanNvTHZqQ0tQcUNmUXh1bktqWHBnUStxMDJPaDdrVWQ2NWtGYURQ?=
 =?utf-8?B?b2NCZTZBOVVPMjRYeHlqczFIOXN3VEJzUVhGWjlDb3NnbUYvU29Hb051S2hJ?=
 =?utf-8?B?QmRyclB1Q29XcUNOemp3NHdaVm0rby9PTTF3Yk10TnZuejkyZ3FSVW5lWDJ1?=
 =?utf-8?B?cStMbG1Wa0dSK0t2SVFNMjJrbFZvUkRsYWhESnpIM2prYUNpbGxIRTltd2Zn?=
 =?utf-8?B?dEY4L3U2WnM3b0JUeElsdnhPTGgvMzVOS0pYS3Zrd0UwYkZkQXVCWlRXMG00?=
 =?utf-8?B?SFIvUDJBcUt0NS9lZFRpd1NjUld2ZTFXUUxwbktlVk5DR1VXNHVpb3Y2dFgx?=
 =?utf-8?B?dFU0Y1M4QlJnZkp0UGdUNWdyc3NsVEFoWnFYVHRXZkYxdDNuRWhPc1RIa2hW?=
 =?utf-8?B?dDlGUWhickY2c29KSVpOck9tS1hnSWl1UFQvNnBZN2k4T0tHNW1PS2c0YVVC?=
 =?utf-8?B?eUNYVHBFZ1A2cmxEK0pKUmpQbFd2T3J3blloWWxFL096WTIzZmxFRTRqdkZZ?=
 =?utf-8?B?MmZWUks3ZGNRVjl0aE14NVJOVy9Wbk50RlMwWEtvQjhxZDJDUzJ3bjdqbWd3?=
 =?utf-8?B?N0l4N1BYMFdLM1B0ZVViSmg1SzNla1BhaHVEcUpiSTl6azhwdG05MjJwa0JV?=
 =?utf-8?B?eWpiNi8xTGNrQSt6R2phb25DMWw4aHI0d0VMdm5FTzBtN0ZqVzFLaVkwOTJ1?=
 =?utf-8?B?bW1Dck0vWUFVQ0IyYS9jVVVwdFdRYkhRUGY4cFRhTGlaQkpzWEhPa000ZnZW?=
 =?utf-8?B?bnhkK0YwTjB1ektNOFNITkJUK2VLc3FVeS9qNXp6UDZkajBpbVE0dEFTZ2Zt?=
 =?utf-8?B?NFNrY3M2NEZNdjdyQnVrei83cXU4VFpOWloxcGRqbE9yTnU5NFJrMkV0N3hp?=
 =?utf-8?B?L2Q3UDU1N1Vwc3liNnV2SzFWdXR1eUVrY1lLaVF0ZVl3RUFBWmZmZE13bHNh?=
 =?utf-8?B?a21UZy95T2ZhYzZXS1NjLy9LSHJsbDJhL1dyNUpFRlRVZ09KQ3lsL3A2aWxm?=
 =?utf-8?B?V1g1OTMvMm9LMFBna1pOWDc2QStsa2o5aTFTL3lDTnNmNjB2ZEdrcGR4ZFFK?=
 =?utf-8?B?ZjNxb1gzRVowSE5sK2dWYjNaTi81YkFobjRZRXJDdlNCdXlFS20rM1RYRGly?=
 =?utf-8?B?c3JpQUJnaVpLVHBYb09HNjNVQ3dyN2IwTFZmVURHbUJ2aDMxRU5jSUpISWJF?=
 =?utf-8?Q?6CzoTzfV1iybh6J2R327DrW+D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 322e74ab-8d3b-45cf-5846-08dba4cbb83a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6879.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 17:58:28.0497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VEwhb1185zqlf8a6L6gWDMbWpGqsh6iDv27bSIJnS9Jo0JR5bKDbR9kIkE0VmiFMvJR+J+KikE53hGXyHKgVjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8355
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>, kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/23/2023 8:52 PM, Dmitry Osipenko wrote:
> On 8/20/23 23:58, Kim, Dongwon wrote:
>> On 8/17/2023 7:33 PM, Dmitry Osipenko wrote:
>>> On 7/13/23 01:44, Dongwon Kim wrote:
>>>> This helper is needed for framebuffer synchronization. Old
>>>> framebuffer data
>>>> is often displayed on the guest display without this helper.
>>>>
>>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>>>> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
>>>> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/virtio/virtgpu_plane.c | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c
>>>> b/drivers/gpu/drm/virtio/virtgpu_plane.c
>>>> index a063f06ab6c5..e197299489ce 100644
>>>> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
>>>> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
>>>> @@ -26,6 +26,7 @@
>>>>    #include <drm/drm_atomic_helper.h>
>>>>    #include <drm/drm_damage_helper.h>
>>>>    #include <drm/drm_fourcc.h>
>>>> +#include <drm/drm_gem_atomic_helper.h>
>>>>      #include "virtgpu_drv.h"
>>>>    @@ -271,6 +272,9 @@ static int virtio_gpu_plane_prepare_fb(struct
>>>> drm_plane *plane,
>>>>        vgfb = to_virtio_gpu_framebuffer(new_state->fb);
>>>>        vgplane_st = to_virtio_gpu_plane_state(new_state);
>>>>        bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
>>>> +
>>>> +    drm_gem_plane_helper_prepare_fb(plane, new_state);
>>> The implicit display BO sync should happen on a host side, unless you're
>>> rendering with Venus and then displaying with virgl. Doing it on guest
>>> side should be a major performance hit. Please provide a complete
>>> description of your setup: what VMM you use, config options, what tests
>>> you're running.
>> We use virtio-gpu as a kms device while using i915 as the render device
>> in our setup.
>> And we use QEMU as VMM. Virtio-gpu driver flushes the scanout to QEMU as
>> a blob resource
>> (reference to the buffer). QEMU then creates a dmabuf using udmabuf for
>> the blob
>> then renders it as a texture using OGL. The test I ran is simple. Just
>> starting terminal
>> app and typing things to see if there is any frame regression. I believe
>> this helper is
>> required since the BO on the guest is basically dmabuf that is being
>> shared between i915
>> and virtio-gpu driver. I didn't think about the performance impact. If
>> the impact is
>> too much and that is not acceptable, is there any other suggestions or
>> some tests I can try?
> You can do fence-wait in the guest userspace/Mesa after blitting/drawing
> to the udmabuf.

There is already synchronization between QEMU and virtio-gpu driver on the guest. Upon resource flush, virtio-gpu waits for the response for the message from the QEMU and QEMU sends out the response once rendering is done. The problem we are seeing is not that the rendering part is reusing the buffer before it's displayed by the QEMU. Problem we are facing is more like some frame is often not finished when "resource-flush" is issued. So unless there is a way for QEMU to wait for this fence (guest drm), I think we should have some synchronization point in the guest side.

I saw other DRM drivers, omap, tegra, vc4 and so on are doing the similar so I guess this is a generic solution for such cases. But I do understand your concern as the primary use case of virtio-gpu driver is for virgl. So this extra wait would cost some performance drop. But I have a couple of points here as well.

1. Wouldn't this extra wait caused by drm_gem_plane_helper_prepare_fb be minimal as the actual
rendering is done in the host?

2. Can we just make this helper called only if virgl is not used as 3D driver?

>
> You may run popular vk/gl gfx benchmarks using gl/sdl outputs to see the
> fps impact.

ok

>
> Virglrender today supports native contexts. The method you're using for
> GPU priming was proven to be slow in comparison to multi-gpu native
> contexts. There is ongoing work for supporting fence passing from guest
> to host [1] that allows to do fence-syncing on host. You'll find links
> to the WIP virtio-intel native context in [1] as well. You won't find
> GPU priming support using native context in [1], patches hasn't been
> published yet.
>
> [1]
> https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1138
>
> Note that in general it's not acceptable to upstream patches that serve
> downstream only. Yours display sync issue is irrelevant to the upstream
> stack unless you're going to upstream all the VMM and guest userspace
> patches, and in such case you should always publish all the patches and
> provide links.
>
> So, you need to check the performance impact and publish all the patches
> to the relevant upstream projects.

QEMU has all patches regarding this (blob scanout support) but guest Mesa
patch for KMSRO is still outstanding.

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/9592

I understand this specific patch would need more discussion/justification but
what about other two, are you generally ok with those in the same series?

Thanks!!


