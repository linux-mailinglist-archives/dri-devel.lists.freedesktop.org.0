Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD5E51A1A1
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 15:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22A410E1AC;
	Wed,  4 May 2022 13:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8565010E1AC
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 13:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651672721; x=1683208721;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=11770cKS+9CS+QLXwuNHlJ4PVZqEaAPkwZKE6duj5KU=;
 b=kn60oK6Piy9cF8Npdqal5RMc40FvKwDyrhgHzFCeWS7Ka3csaJ2BoK3G
 PZe5ci1ZX74lacVnRvvV1ncHxkr2mIVrm7MEZ+4EilItW3dZMoQMNS4Zx
 qbOHW7hh1YdsdONbAj/orNZMM1tRswkFp2oxYdLiE2WBYS/tavjIP1GQu 8=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 04 May 2022 06:58:40 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 06:58:40 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 4 May 2022 06:58:40 -0700
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 4 May 2022
 06:58:39 -0700
Message-ID: <6dde7bb4-8931-ccdb-2677-930a1c6d6dab@quicinc.com>
Date: Wed, 4 May 2022 07:58:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] drm: drm_gem.h: Add explicit includes for
 DEFINE_DRM_GEM_FOPS
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
References: <1651262112-29664-1-git-send-email-quic_jhugo@quicinc.com>
 <87y1zkq6vg.fsf@intel.com> <YnJJq6UdCVIWcH3G@phenom.ffwll.local>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <YnJJq6UdCVIWcH3G@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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

On 5/4/2022 3:38 AM, Daniel Vetter wrote:
> On Mon, May 02, 2022 at 06:41:39PM +0300, Jani Nikula wrote:
>> On Fri, 29 Apr 2022, Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>>> DEFINE_DRM_GEM_FOPS() references drm functions from other headers.  For
>>> example drm_open() is defined in drm_file.h and drm_ioctl() is defined
>>> in drm_ioctl.h.  Since drm_gem.h doesn't include these headers, it
>>> relies on an implicit include from the .c file to have included these
>>> required headers before DEFINE_DRM_GEM_FOPS() gets used.  Relying on
>>> these implicit includes can cause build failures for new code that
>>> doesn't know about these requirements, and can lead to future problems
>>> if the headers ever get restructured as there will be a need to update
>>> every downstream file that includes drm_gem.h.
>>>
>>> Lets fix this explicitly including the required headers in drm_gem.h so
>>> that code that includes drm_gem.h does not need to worry about these
>>> implicit dependencies.
>>
>> In the general case, I tend to agree, but in this specific instance I
>> think I'd err on the side of fewer includes. I think the more likely
>> outcome here is accumulating implicit dependencies on symbols from
>> drm_file.h and drm_ioctl.h by including drm_gem.h only!
>>
>> I do think headers need to be self-contained, and we actually enforce
>> this in i915 (see HDRTEST in drivers/gpu/drm/i915/Makefile), but not to
>> the point of macro expansions.
> 
> Yeah we abuse macros in a bunch of places to untangle header dependencies,
> so then going back and pulling in all the headers back in feels a bit
> silly and defeats the point.

Fair enough.  I'll consider this NAK'd

I've been pondering alternate solutions, but haven't come up with any. 
I guess, for now, the status quo will remain.

> 
> iow, I concur.
> -Daniel
> 
>>
>> BR,
>> Jani.
>>
>>
>>
>>>
>>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>>> ---
>>>   include/drm/drm_gem.h | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>> index 9d7c61a..1cbe3d8 100644
>>> --- a/include/drm/drm_gem.h
>>> +++ b/include/drm/drm_gem.h
>>> @@ -37,6 +37,8 @@
>>>   #include <linux/kref.h>
>>>   #include <linux/dma-resv.h>
>>>   
>>> +#include <drm/drm_file.h>
>>> +#include <drm/drm_ioctl.h>
>>>   #include <drm/drm_vma_manager.h>
>>>   
>>>   struct iosys_map;
>>
>> -- 
>> Jani Nikula, Intel Open Source Graphics Center
> 

