Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B42F542793
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 09:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2990110E6A7;
	Wed,  8 Jun 2022 07:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286D210E668;
 Wed,  8 Jun 2022 07:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654672803; x=1686208803;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3jv/RyK9DbMhOKnM8Ce8pjAzbywbOBUBVW2NRehb/8E=;
 b=dLg1H9ERm3vJO6BcDp+pZrtIvw9b5hE2iDOikku0tBuWwQB/7E/Ux2fr
 S34FmEot9Y300B9u7VriAbVRY5VaeI8QuaNe7ordLXneJolnIuvCJADOc
 27lr6OlvSSAI2WPlhV9/qYhbRUZcBc/v4sxPOfIPvycIIshAAAJnTygOG
 bpKvwNS4xG8V+G7/pQYgbCeVWlEBocMQsu/SN+/AHvHAThwxc1xpJ4vX9
 rTWqGJkjsXBuwdeGzDRBpHa7cMPSqijIckpeq+0ygL4JXRhYVTwvurJo4
 KG0UW40zzylf6U/w/J9d2uvbrOzVLEOErKXG3fCT2Qvja/0vJUA6LxjGw g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="259948002"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="259948002"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:19:48 -0700
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="907515497"
Received: from jking17-mobl.ger.corp.intel.com (HELO [10.213.193.156])
 ([10.213.193.156])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:19:42 -0700
Message-ID: <4346fb7b-f2c0-367a-0f65-8938bb8c4f40@linux.intel.com>
Date: Wed, 8 Jun 2022 08:19:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/2] drm/msm: Expose client engine utilization via
 fdinfo
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220606195432.1888346-1-robdclark@gmail.com>
 <20220606195432.1888346-2-robdclark@gmail.com>
 <8559b6f0-0322-9232-7000-534087e786fe@linux.intel.com>
 <CAF6AEGv0heF1fj0W3XALtQwZBE0yJTszXisg2CQR+-hFOmHSng@mail.gmail.com>
 <CAF6AEGvMNhoMTV+z0svbeX2bLusp-Yed7p9Z6KYa__0ckvg2LQ@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGvMNhoMTV+z0svbeX2bLusp-Yed7p9Z6KYa__0ckvg2LQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 07/06/2022 17:08, Rob Clark wrote:
> On Tue, Jun 7, 2022 at 9:02 AM Rob Clark <robdclark@gmail.com> wrote:
>>
>> On Tue, Jun 7, 2022 at 1:56 AM Tvrtko Ursulin
>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>
>>>
>>> On 06/06/2022 20:54, Rob Clark wrote:
>>>> From: Rob Clark <robdclark@chromium.org>
>>>>
>>>> Similar to AMD commit
>>>> 874442541133 ("drm/amdgpu: Add show_fdinfo() interface"), using the
>>>> infrastructure added in previous patches, we add basic client info
>>>> and GPU engine utilisation for msm.
>>>>
>>>> Example output:
>>>>
>>>>        # cat /proc/`pgrep glmark2`/fdinfo/6
>>>>        pos:    0
>>>>        flags:  02400002
>>>>        mnt_id: 21
>>>>        ino:    162
>>>>        drm-driver:     msm
>>>>        drm-client-id:  7
>>>>        drm-engine-gpu: 1734371319 ns
>>>>        drm-cycles-gpu: 1153645024
>>>>        drm-maxfreq-gpu:        800000000 Hz
>>>>
>>>> See also: https://patchwork.freedesktop.org/patch/468505/
>>>>
>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>> ---
>>>>    Documentation/gpu/drm-usage-stats.rst | 21 +++++++++++++++++++++
>>>>    drivers/gpu/drm/msm/msm_drv.c         | 19 ++++++++++++++++++-
>>>>    drivers/gpu/drm/msm/msm_gpu.c         | 21 +++++++++++++++++++--
>>>>    drivers/gpu/drm/msm/msm_gpu.h         | 19 +++++++++++++++++++
>>>>    4 files changed, 77 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
>>>> index 6c9f166a8d6f..60e5cc9c13ad 100644
>>>> --- a/Documentation/gpu/drm-usage-stats.rst
>>>> +++ b/Documentation/gpu/drm-usage-stats.rst
>>>> @@ -105,6 +105,27 @@ object belong to this client, in the respective memory region.
>>>>    Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
>>>>    indicating kibi- or mebi-bytes.
>>>>
>>>> +- drm-cycles-<str> <uint>
>>>> +
>>>> +Engine identifier string must be the same as the one specified in the
>>>> +drm-engine-<str> tag and shall contain the number of busy cycles for the given
>>>> +engine.
>>>> +
>>>> +Values are not required to be constantly monotonic if it makes the driver
>>>> +implementation easier, but are required to catch up with the previously reported
>>>> +larger value within a reasonable period. Upon observing a value lower than what
>>>> +was previously read, userspace is expected to stay with that larger previous
>>>> +value until a monotonic update is seen.
>>>> +
>>>> +- drm-maxfreq-<str> <uint> [Hz|MHz|KHz]
>>>> +
>>>> +Engine identifier string must be the same as the one specified in the
>>>> +drm-engine-<str> tag and shall contain the maxium frequence for the given
>>>
>>> maximum frequency
>>>
>>>> +engine.  Taken together with drm-cycles-<str>, this can be used to calculate
>>>> +percentage utilization of the engine, whereas drm-engine-<str> only refects
>>>
>>> reflects
>>>
>>>> +time active without considering what frequency the engine is operating as a
>>>> +percentage of it's maximum frequency.
>>>
>>> Cycles vs max freq sounds very useful. My reservations is that how come
>>> the idea hasn't happened in the CPU world. Or maybe it has and I am
>>> un-informed?
>>
>> I do often pay attention to both where tasks get scheduled, and the
>> individual CPU freq when I'm profiling CPU side stuff (eg. in
>> perfetto)
>>
>> I could also report "always-count" cycles, I think, which could be
>> used by gputop to derive freq.  I'd have to think about that a bit,
>> since keeping the result monotinic(ish) might be a bit tricky (the hw
>> counter loses state across runtime suspend)
>>
>>> In any case, if going with this I think we need to clarify the text that
>>> the value should reflect the current soft limit, where the driver
>>> supports that, in case it has been set to lower than the maximum
>>> frequency hardware can support. I am thinking about avoiding "my gpu
>>> cannot hit 100%" support incidents in cases when user/admin lowered the
>>> soft limit for some reason. Possibly does not apply to msm but can apply
>>> to i915, if we decided to export the same data.
>>
>> Yes, with pm-qos thermal or userspace could limit the max freq.. but
>> we also internally use a pm-qos constraint to reduce freq when the GPU
>> is idle, and I don't think there is a good way to differentiate
>> *which* constraint is which.  I'll add something involving the word
>> "recommended" ;-)
> 
> Hmm, or on second thought, maybe it would be better to, for drivers
> that can, just report the soft limit separately?

Yes. I realized later soft-limit does not work, anything reported here 
has to be invariant otherwise userspace cannot make sense of the 
accumulated cycles vs changing freq. Max freq, as long as it is truly 
max, as you were proposing, works I think.

Regards,

Tvrtko
