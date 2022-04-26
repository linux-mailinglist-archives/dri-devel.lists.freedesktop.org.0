Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2395108D7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 21:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A8610E48C;
	Tue, 26 Apr 2022 19:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CA710E3C4;
 Tue, 26 Apr 2022 19:19:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 107061F41A32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651000777;
 bh=MAjmFdqWA+Hrdq60ZeCd3OrHWgUw+ka1jffl+aLkF04=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=U4W2g9y7THG9R7VpouQpRZ1L82hltGgjoux1qoqVpBWDvEKw5qIoSP2j+H1YBzZhO
 ajW6m+pKYyUK5uiuxPYKz0kDo37QsSYOOJWi3EFXYrWLChEvM0nf/qSL+UtYcDmuOJ
 wlPd5Ug6Rz8EAjED5i4Q/JYdJshiM4/jxmJXIxKQlM7jfIq8pnSPOIs4b8aTAr9gZG
 Uzd5vqUAw1Q3dxHbDVHnsOiVRxrXva/iLl63V3hAlfXaZfixLYs22KPDys3kYej46X
 ZvX5cUqrh08vjhCXLT2q0VOVVNGlEBPtpzmD9bVGp6jY3b3Bt6ynrakUp6liIoZ8lj
 omDh51dXTmefA==
Message-ID: <780fa818-292c-a313-6006-0af0730c2743@collabora.com>
Date: Tue, 26 Apr 2022 20:19:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PULL] gvt-next
Content-Language: en-US
To: "Wang, Zhi A" <zhi.a.wang@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <c5cf6773-e7a2-8ba8-4cde-0bb14007bc6b@intel.com>
 <20220426155318.GQ2125828@nvidia.com>
 <e245c195-fdb0-32c4-dcfb-8ff49bc3a63c@intel.com>
From: Robert Beckett <bob.beckett@collabora.com>
In-Reply-To: <e245c195-fdb0-32c4-dcfb-8ff49bc3a63c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 26/04/2022 17:58, Wang, Zhi A wrote:
> On 4/26/22 3:53 PM, Jason Gunthorpe wrote:
>> On Tue, Apr 26, 2022 at 07:58:59AM +0000, Wang, Zhi A wrote:
>>> Hi folks:
>>>
>>> Here is the pull of gvt-next which fixs the compilation error when i915 debug
>>> is open after the GVT-g refactor patches.
>>>
>>> Thanks so much for the efforts.
>>>
>>> Thanks,
>>> Zhi.
>>>
>>> The following changes since commit 2917f53113be3b7a0f374e02cebe6d6b749366b5:
>>>
>>>    vfio/mdev: Remove mdev drvdata (2022-04-21 07:36:56 -0400)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://github.com/intel/gvt-linux tags/gvt-next-2022-04-26
>>>
>>> for you to fetch changes up to 2da299cee780ea797b3f72558687868072cf5eb5:
>>>
>>>    drm/i915/gvt: Add missing export of symbols. (2022-04-25 18:03:04 -0400)
>>>
>>> gvt-next-2022-04-26
>>>
>>> - Add two missing exports of symbols when i915 debug is enabled.
>>>
>>> Zhi Wang (1):
>>>        drm/i915/gvt: Add missing export of symbols.
>>>
>>>   drivers/gpu/drm/i915/intel_gvt.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>
>> This still has another compile problem:
>>
>> ERROR: modpost: "intel_runtime_pm_put" [vmlinux] is a static EXPORT_SYMBOL_GPL
>>
>> Because:
>>
>> #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_RUNTIME_PM)
>> void intel_runtime_pm_put(struct intel_runtime_pm *rpm, intel_wakeref_t wref);
>> #else
>> static inline void
>> intel_runtime_pm_put(struct intel_runtime_pm *rpm, intel_wakeref_t wref)
>> {
>>          intel_runtime_pm_put_unchecked(rpm);
>> }
>> #endif
>>
>> Looks like it happens if CONFIG_DRM_I915_DEBUG_RUNTIME_PM=n
>>
>> I think you probably want to #ifdef the export in the same way:
>>
>> --- a/drivers/gpu/drm/i915/intel_gvt.c
>> +++ b/drivers/gpu/drm/i915/intel_gvt.c
>> @@ -309,7 +309,9 @@ EXPORT_SYMBOL_NS_GPL(__intel_context_do_pin, I915_GVT);
>>   EXPORT_SYMBOL_NS_GPL(__intel_context_do_unpin, I915_GVT);
>>   EXPORT_SYMBOL_NS_GPL(intel_ring_begin, I915_GVT);
>>   EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_get, I915_GVT);
>> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_RUNTIME_PM)
>>   EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_put, I915_GVT);
>> +#endif
> Sigh. That's tricky. Let me prepare another one.

Also the following compile error:

drivers/gpu/drm/i915/gvt/handlers.c:75:6: error: no previous prototype 
for ‘intel_gvt_match_device’ [-Werror=missing-prototypes]

    75 | bool intel_gvt_match_device(struct intel_gvt *gvt,

       |      ^~~~~~~~~~~~~~~~~~~~~~


it was removed from a header. The implementation should now be made static

>>   EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_put_unchecked, I915_GVT);
>>   EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_for_reg, I915_GVT);
>>   EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_get, I915_GVT);
>>
>> Jason
>>
> 
