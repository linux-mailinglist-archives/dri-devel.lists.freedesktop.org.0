Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5F4782008
	for <lists+dri-devel@lfdr.de>; Sun, 20 Aug 2023 22:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECDE10E158;
	Sun, 20 Aug 2023 20:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB0510E158
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Aug 2023 20:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692565120; x=1724101120;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OUecqVDX7rTMI7j3qYSlra+znTy7hPl1BCFU+37IXYc=;
 b=dA++Dw5HD/gZgfocX04uERXtLPRdYgJPQeRhGhnRe0IgPKdz/eo3mU/6
 SiuP+L3LIepVZf8h//l1fYiTttCX/lRw6ZbglpoBxUkJddAjuHDCt5vyc
 iTul/z1defc6aNm5sAfXF/1h0GMLCEBdHXqhsJxpd6GSj0/luWVlVwPdd
 RsF2lqos1Xn44frtmKe5BoSzJQA2gom3NMVh/m3gvN/afkw0kKSvO6GqW
 J0bS2WvM/aJxKN69ybwr0CJYnUwtkXUmGF5QZbOZi72nv90EMa5vNDsqk
 hv7nRJldbNv71vRIoW7gmUoRvuJWr4qfYTOZTOqqoZBwfXknfK9MbTyQp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="370882190"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="370882190"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2023 13:58:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="685450338"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="685450338"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 20 Aug 2023 13:58:38 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 20 Aug 2023 13:58:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 20 Aug 2023 13:58:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 20 Aug 2023 13:58:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1r8WmQ68Xq1vhtRaLdaz1mBrKn1++pDT7OLQh9NipkOEAq4Dqcl9lC9eNLsZVSGnqUR9u3A6734Zm7E35QyTin7z8VMY5hcCyqaebYXWR7y1te2E801+VXVrprRqBL7AfYPytl4+7f9JHj45d15J2GpFe9pK5f2DHecWFviWAYk0//OVyzI2dLLfZH0EJW9D1LHbZ6L6Whavs4t5HgVKjVL+S0Wj/grvuZUrUzNyfJNTjoVsfqOAv9jdvurX9fLxvXb9SKV4/r1/1Qda/aEORNCprRL/kmDMrpSIn43Jedvmwb0gMJhHY3QsqY4SdbghAFS8HKVhrmpzEb1Th/DMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQuw6BKHMY/ordaRAaw0uh9+jZWO45CUadI9WC6RzAk=;
 b=BjpfgmlyPRnwOPahhAkGoreB2JgJY+hm9uD3h+RHm4oNLXNNXueIUrEhZVfQH09IoeWiKz1Hg1MomB8xiP7eqnwzsrfzLY4SbU8zSZ40Am5XTahynkq5Da1pRmURLNZl2RSX5N0Wborg776/FSSwnIZzI/40nIoicsHhDtcA4Q55Kp+q4hKwPGls0yd8ER01e6OPfmCusMQRH1rI6RxXLQTkwLb7cR0VcOW8pqCyKrvhvuIzUtTClI4MIyI8WG8H/C0WW7VnFwndoivBbDlUvTExnuRT6U1a19AgYBI7O258zM7BX4ioYeRvN68uScDwa1cS8+ZwHqmPLUBl3SMqTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 by DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.20; Sun, 20 Aug 2023 20:58:37 +0000
Received: from PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::e12e:7690:e251:1aa5]) by PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::e12e:7690:e251:1aa5%3]) with mapi id 15.20.6699.020; Sun, 20 Aug 2023
 20:58:36 +0000
Message-ID: <8689536c-4760-a32b-76f4-65c022b5eadc@intel.com>
Date: Sun, 20 Aug 2023 13:58:33 -0700
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
From: "Kim, Dongwon" <dongwon.kim@intel.com>
In-Reply-To: <04181690-adc2-fc30-d1b4-b6ca5b02a142@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0087.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::28) To PH8PR11MB6879.namprd11.prod.outlook.com
 (2603:10b6:510:229::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6879:EE_|DM8PR11MB5573:EE_
X-MS-Office365-Filtering-Correlation-Id: ecdfc7f1-2e65-457b-3e46-08dba1c038be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IPTxZCphMVWdVrmwK9y9lF/ziEbWP3kozzHlWgbK6RyL8FPoDgACh+mtPvaFVH+YXga0opna1iUt5hhWiJ0jAHyd6Dt/rrAW9MYsVYvQfuXxVbxWw+o8Ewm80dO0mblvlLKHOrlDop+UG8WYHSd3QB/MyYBU/PR1N2Au/dfA4XZiX+C+dLE0Z1+CtyA43ROhlVJ8lL0lGKeJhYsC6Pg3ZRWGEGZLiErflh3aGnirViFkt9irJlJwnCWBKW3ueifWg/v5mrZAlVp3Ba5uglZIHQ1BCHLuELtXollMKOcXTEaM86UPDWzSaJnWYgRZqEUgI+SJNSeXtIQl4ucYF5vUCTC7nsgZXDMt0VdQJJmNPnlTALEkDiqAASkVlgvVk423llg0ODvxyIwufuvbjBBJSc3k0k3kXL5JvbyOVKH4AADDzIrzjY6pqLjVRL1HDzNngoLuhAfHmS0f+Kp8v8bLJVgsYls/E2HivDoQE07yiw1Gr4T0AkIuCzmtzsz0OzbM6j2EnscC1/e8U6DsVUfIVgNJkgEHwwxzAq+WOINicqMrieLvx9045z3MZzU9yvJsafjK50nFBhT/VZsY6B0QGaMyddpSCf+OsksFbgibGFP0sQo1Ic4g02Z4Za+NrlHa1HH1JN5J/LFIzVpVksdCiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6879.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199024)(1800799009)(186009)(86362001)(5660300002)(2616005)(41300700001)(316002)(2906002)(66946007)(66556008)(66476007)(31686004)(8936002)(4326008)(8676002)(478600001)(31696002)(82960400001)(6666004)(6486002)(53546011)(38100700002)(6506007)(6512007)(26005)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjVsaUZLQTJXV1o1M0lCT2xzR2IzYnczVDZMOXlwUVczY2dsQnhrcVZ6MWN2?=
 =?utf-8?B?R1pUNEZ6d1lVMWNOOWVLUVI1UFAwWWVoZ1BkYjloRWR2dFAzU1U0b3ZGWlN3?=
 =?utf-8?B?NDQyc3A2VlpjbmhjQ05VYndVbHVON3RNVVZXOEZ5MkpuZWgwbFZwMDczdGpo?=
 =?utf-8?B?NkRpUHp4WmM3TGJjRmM5UUt3ekJaUVJ0QnFtWTg4RzJkS3lVSFJEcXFEbFR5?=
 =?utf-8?B?b1VuMk1Jb2tvZGxTQXAvUlhrZDVGaDZxZFhtR2p1a2VHQ0xGZHc2MHRiN2R2?=
 =?utf-8?B?YVE0Y2RxVnhmbEFiSlNIVFk0MlplT1hLYVluMmtmZTNhSWRqYWZwaWVaS0Vy?=
 =?utf-8?B?a25IU3ZnZzF6MnhIK0FVTElpbER6SENHUTd2SDFqa1FsSWtWRDYwR082dkhP?=
 =?utf-8?B?MWdYOE9iNks1clBPTCtJMHZ6T2l6K1dncnl2d0pqUVZzKzNweW5yTzlKcFlJ?=
 =?utf-8?B?c2JPWnFQMVJXNVdrbFNRWStiY2VvcWFRQ1d4dDBLVFl4eCtQQ1o0TnIvZUlB?=
 =?utf-8?B?d0JWRkE4UDM2Uy9OREE5a2tmeVh4Y2pSNlFyQnc1Z1h3aEdnaFhIR2grWlJ6?=
 =?utf-8?B?YXZnMjJJblpSK3BCZzhLazZFR0tLWDNkZko4cC9BeDJSbDVCRmFqSHVmOWtQ?=
 =?utf-8?B?VDQ2VG9WOE9xZHVZbFJuYlIzdFZRanhKM29QZEhZYjRqVWdCRWIzSXFmTU82?=
 =?utf-8?B?UVNXMkNVY2NKdTkxcmJMOXNQUXBxeTZCTDYyczR2Unhpb3VHNHE4QXlQVGp4?=
 =?utf-8?B?b2J4QS9xWUlGVTRUM0UzOFdFTlQySEE3eHlFMVVJczJaUm1JMU5zcndGeE1Q?=
 =?utf-8?B?c2VreFFsOExvSWZxMUJmSDZLaGJmU0JVbVE2dER5a1haaXdWQ01UR3JwNUFw?=
 =?utf-8?B?eFRXU0VGeHhJa0VLUXg1QjNYQmZNYUI5SjV6YVc5SWpzbUFTNXBKWEhZbDFY?=
 =?utf-8?B?YWt1enNIdmcxQnJXVTIzRlRjeEpwTW5Jdi9JWHJ3bjBwOGR0K0VsWXdMOUgv?=
 =?utf-8?B?NndTN3I3TXFzYzNjZTNyaUhMSTUvRjRWc3h6Rmt1N1NIcll4b3o1d21lTnkz?=
 =?utf-8?B?Q09jVVZrVVh3Ujc2aDJlK1FxOUo2Nk1OWFdpd3pJbm15RnFscmV5UnBVVXZo?=
 =?utf-8?B?djlXdmlEbHVZVVVZelViTEVlYjgya3ViV25VNjhZcldWL0Zld3lPSk5RL2c5?=
 =?utf-8?B?OUlJT2t3aUZFaHNvcTlxUzB3d2NBN0VHVTROT1E4cTdKVUhXZkJEZElZQVc1?=
 =?utf-8?B?aVg0NEtLQW82UkxjYmpMdzNMdStJMGh6U0oyUGl1MmpIL1BsKzBXbkwxTXYr?=
 =?utf-8?B?ZFBLdUJxWFNpeWJoWmJrckNzcTkxc1RiUTFzcDNGcENycGhIZ09laitmQndy?=
 =?utf-8?B?V2RnVzZvUE9SY3NQbkxoRmZ5NU0zdEJDK21Db0xFaVZyS211NWl4Y2V3UDgy?=
 =?utf-8?B?ZUVqUGxJYlQxZktWZ1F6bGxid24yZEVKdHhYTW4rOWVYV3JxVXlnU3g1NlJF?=
 =?utf-8?B?SG54WGhnZ0ZlYVBNK1c3YW9sYlExNDlXb0NGTXdEOXdZTEttbUJUV2xVRFNn?=
 =?utf-8?B?VEtNNFBEWHM2a2k0dEJyelFTTjVNakg5UUhnTkc2eEN2L2RZMzBTbFFHSFJ1?=
 =?utf-8?B?VWhPLzRweU5MYnVtZzJDOTlxMjJtYWo5OXQyWi9NRXhBeE9WMWt0dmhvZFgz?=
 =?utf-8?B?M0tJMnF3cEpMRjdRb01oNUtGVG9VaUIxM25zUlUvS3kzUHE3V1hxWUhTMFc1?=
 =?utf-8?B?ZWZLRFhDWHVNNnVvcG5CSGdpbUNnV0UwNnBSOGE2MkE5Rk84MnM2TUJxVjd0?=
 =?utf-8?B?N1orV2lkakUvZlBXelY2ZzRNNXROWkl6T3dIRmdiaStSM2xTdlZOa3JWdE1H?=
 =?utf-8?B?RmtqT0tkNStEamNZMHJITkM3bWlONFZ4N0MzcDVsVDNmT1EwRHNlRnkveFNG?=
 =?utf-8?B?WUxNMkkxc0U3cFNMV3VISWhzdDg3ZFRSM0NvU1JEbExnMEZwT0RLMGp6VVNW?=
 =?utf-8?B?U3NnRHZMTFFxTktGNDBKdW1QYnYvMTA0WVFmQWRVZmsvbCt4clh3YmpUNXBs?=
 =?utf-8?B?ai9PMTFKSlJCMTV5cnQzUC9SaWlNZXpSakFEZi9VWUdTWXhyVjZrM2xGM0J1?=
 =?utf-8?Q?Z6V/eKF8eZID+nOIGSfJeA6+0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecdfc7f1-2e65-457b-3e46-08dba1c038be
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6879.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2023 20:58:36.2219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ttpdqy+64ObbTdKlurgTUZI4HSg0YeQSsUUotJ6kyOZ9EsuANIt+bObM26cdt3eL1hXe37qM0i6RyLDkjsZ7Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5573
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

On 8/17/2023 7:33 PM, Dmitry Osipenko wrote:
> On 7/13/23 01:44, Dongwon Kim wrote:
>> This helper is needed for framebuffer synchronization. Old framebuffer data
>> is often displayed on the guest display without this helper.
>>
>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
>> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
>> ---
>>   drivers/gpu/drm/virtio/virtgpu_plane.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
>> index a063f06ab6c5..e197299489ce 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
>> @@ -26,6 +26,7 @@
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_damage_helper.h>
>>   #include <drm/drm_fourcc.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   
>>   #include "virtgpu_drv.h"
>>   
>> @@ -271,6 +272,9 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
>>   	vgfb = to_virtio_gpu_framebuffer(new_state->fb);
>>   	vgplane_st = to_virtio_gpu_plane_state(new_state);
>>   	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
>> +
>> +	drm_gem_plane_helper_prepare_fb(plane, new_state);
> The implicit display BO sync should happen on a host side, unless you're
> rendering with Venus and then displaying with virgl. Doing it on guest
> side should be a major performance hit. Please provide a complete
> description of your setup: what VMM you use, config options, what tests
> you're running.

We use virtio-gpu as a kms device while using i915 as the render device in our setup.
And we use QEMU as VMM. Virtio-gpu driver flushes the scanout to QEMU as a blob resource
(reference to the buffer). QEMU then creates a dmabuf using udmabuf for the blob
then renders it as a texture using OGL. The test I ran is simple. Just starting terminal
app and typing things to see if there is any frame regression. I believe this helper is
required since the BO on the guest is basically dmabuf that is being shared between i915
and virtio-gpu driver. I didn't think about the performance impact. If the impact is
too much and that is not acceptable, is there any other suggestions or some tests I can try?

Thanks!

