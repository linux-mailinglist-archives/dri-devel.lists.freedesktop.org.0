Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F730742709
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 15:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF4310E3CA;
	Thu, 29 Jun 2023 13:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165F310E3CA;
 Thu, 29 Jun 2023 13:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5gBm7015A4hdAPyt1XTpmFIFSaE1k9BcyQR+lyfqJ8o=; b=WcF7a7PvHPSSH8RkVJssqlUU+s
 ImScZlAnduZcKAwEtiUvHyTPNF9vZBW26pH3ld6VExtPVXcKZMyDvFSXjvRVLv6F46fkbIwtmGJSW
 3J/hGWgetzDJjykSs/LPhPzQQ9d9hSg6lyJXfm6mYTJLoTQN0EEcduJ10WsEXRVuZ+a4Sgp6KX73m
 sxLLQffRdpKecaMLzKCKuuFm0WePnUOmZMTNN2UR2dq00AskhaueObNPhKW3YM2R08xCBCm6YUs8l
 xzTOWIrZ97X1ZdRqiHZuyxWgh9XNpjmDihWhIQPXF7VqBwr6gC9Dg03Fq31r8nL6P6B5DIAbQy1It
 Eo/BZCEQ==;
Received: from [187.74.70.209] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qErQX-005nTk-1p; Thu, 29 Jun 2023 15:11:13 +0200
Message-ID: <02789f9b-ff16-b419-097f-b97b56afad57@igalia.com>
Date: Thu, 29 Jun 2023 10:11:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 1/1] drm/doc: Document DRM device reset expectations
Content-Language: en-US
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <1dbeb507-3f18-1b5d-37be-fcfd60a1c0d4@gmail.com>
 <b3f72b45-c607-7cd3-2bdb-21567f901469@igalia.com>
In-Reply-To: <b3f72b45-c607-7cd3-2bdb-21567f901469@igalia.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, kernel-dev@igalia.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Em 27/06/2023 18:17, André Almeida escreveu:
> Em 27/06/2023 14:47, Christian König escreveu:
>> Am 27.06.23 um 15:23 schrieb André Almeida:
>>> Create a section that specifies how to deal with DRM device resets for
>>> kernel and userspace drivers.
>>>
>>> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>> ---
>>>
>>> v4: 
>>> https://lore.kernel.org/lkml/20230626183347.55118-1-andrealmeid@igalia.com/
>>>
>>> Changes:
>>>   - Grammar fixes (Randy)
>>>
>>>   Documentation/gpu/drm-uapi.rst | 68 ++++++++++++++++++++++++++++++++++
>>>   1 file changed, 68 insertions(+)
>>>
>>> diff --git a/Documentation/gpu/drm-uapi.rst 
>>> b/Documentation/gpu/drm-uapi.rst
>>> index 65fb3036a580..3cbffa25ed93 100644
>>> --- a/Documentation/gpu/drm-uapi.rst
>>> +++ b/Documentation/gpu/drm-uapi.rst
>>> @@ -285,6 +285,74 @@ for GPU1 and GPU2 from different vendors, and a 
>>> third handler for
>>>   mmapped regular files. Threads cause additional pain with signal
>>>   handling as well.
>>> +Device reset
>>> +============
>>> +
>>> +The GPU stack is really complex and is prone to errors, from 
>>> hardware bugs,
>>> +faulty applications and everything in between the many layers. Some 
>>> errors
>>> +require resetting the device in order to make the device usable 
>>> again. This
>>> +sections describes the expectations for DRM and usermode drivers when a
>>> +device resets and how to propagate the reset status.
>>> +
>>> +Kernel Mode Driver
>>> +------------------
>>> +
>>> +The KMD is responsible for checking if the device needs a reset, and 
>>> to perform
>>> +it as needed. Usually a hang is detected when a job gets stuck 
>>> executing. KMD
>>> +should keep track of resets, because userspace can query any time 
>>> about the
>>> +reset stats for an specific context.
>>
>> Maybe drop the part "for a specific context". Essentially the reset 
>> query could use global counters instead and we won't need the context 
>> any more here.
>>
> 
> Right, I wrote like this to reflect how it's currently implemented.
> 
> If follow correctly what you meant, KMD could always notify the global 
> count for UMD, and we would move to the UMD the responsibility to manage 
> the reset counters, right? This would also simplify my 
> DRM_IOCTL_GET_RESET proposal. I'll apply your suggestion to the next doc 
> version.
> 

Actually, if we drop the context identifier we would lose the ability to 
track which is the guilty context. Vulkan API doesn't seem to care about 
this, but OpenGL does.

>> Apart from that this sounds good to me, feel free to add my rb.
>>
>> Regards,
>> Christian.
>>
>>
