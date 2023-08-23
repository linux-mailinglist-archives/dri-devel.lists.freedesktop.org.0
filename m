Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C3E785F37
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 20:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550FB10E09F;
	Wed, 23 Aug 2023 18:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D4410E09F;
 Wed, 23 Aug 2023 18:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U9L60WSoH5EjFYNUcZxoJPo5M2F16vkqWzOx0XRJXvg=; b=l3TrSNUBhx+X/rJslIVVfmQIM5
 BoP//9c8bETnX4jXYYGOQn3CI2nWzuvWmB/sN/4f3tvlYSspOAyX+dthy0ImIAiyURMtx0jGLe6Ik
 561gCf7Ft8cBcyCNxKOo3oHlm8jNnCuEhgMhSnpMZEbzp6zR6EZjXmmTnF+4ak5O8qKpDJQ2FkkzU
 329//R+IhbGvzcT5LvhXGVRzzQaFEf0+mbB0mUqgAkdYsSp4o2qzlaT4yCIJS1qoUcVKiiqWpow1Y
 3fA90tLPgTlYPPT7PQxZgcm17Re/socciEX8zGT2LWwxsTVkKv4gVJN/28gJBaC3+KrE+UTx7xQ0P
 okZkCQYg==;
Received: from [187.35.42.59] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qYsGM-00EZWC-Sp; Wed, 23 Aug 2023 20:07:27 +0200
Message-ID: <4b85a79e-bfb3-4e38-bb10-212539e45126@igalia.com>
Date: Wed, 23 Aug 2023 15:07:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] drm/doc: Document DRM device reset expectations
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230818200642.276735-1-andrealmeid@igalia.com>
 <ZOZCcnwu3IOHGoJ/@intel.com>
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <ZOZCcnwu3IOHGoJ/@intel.com>
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
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo,

Em 23/08/2023 14:31, Rodrigo Vivi escreveu:
> On Fri, Aug 18, 2023 at 05:06:42PM -0300, André Almeida wrote:
>> Create a section that specifies how to deal with DRM device resets for
>> kernel and userspace drivers.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>
>> ---
>>
>> v7 changes:
>>   - s/application/graphical API contex/ in the robustness part (Michel)
>>   - Grammar fixes (Randy)
>>
>> v6: https://lore.kernel.org/lkml/20230815185710.159779-1-andrealmeid@igalia.com/
>>
>> v6 changes:
>>   - Due to substantial changes in the content, dropped Pekka's Acked-by
>>   - Grammar fixes (Randy)
>>   - Add paragraph about disabling device resets
>>   - Add note about integrating reset tracking in drm/sched
>>   - Add note that KMD should return failure for contexts affected by
>>     resets and UMD should check for this
>>   - Add note about lack of consensus around what to do about non-robust
>>     apps
>>
>> v5: https://lore.kernel.org/dri-devel/20230627132323.115440-1-andrealmeid@igalia.com/
>> ---
>>   Documentation/gpu/drm-uapi.rst | 77 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 77 insertions(+)
>>
>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>> index 65fb3036a580..3694bdb977f5 100644
>> --- a/Documentation/gpu/drm-uapi.rst
>> +++ b/Documentation/gpu/drm-uapi.rst
>> @@ -285,6 +285,83 @@ for GPU1 and GPU2 from different vendors, and a third handler for
>>   mmapped regular files. Threads cause additional pain with signal
>>   handling as well.
>>   
>> +Device reset
>> +============
>> +
>> +The GPU stack is really complex and is prone to errors, from hardware bugs,
>> +faulty applications and everything in between the many layers. Some errors
>> +require resetting the device in order to make the device usable again. This
>> +section describes the expectations for DRM and usermode drivers when a
>> +device resets and how to propagate the reset status.
>> +
>> +Device resets can not be disabled without tainting the kernel, which can lead to
>> +hanging the entire kernel through shrinkers/mmu_notifiers. Userspace role in
>> +device resets is to propagate the message to the application and apply any
>> +special policy for blocking guilty applications, if any. Corollary is that
>> +debugging a hung GPU context require hardware support to be able to preempt such
>> +a GPU context while it's stopped.
>> +
>> +Kernel Mode Driver
>> +------------------
>> +
>> +The KMD is responsible for checking if the device needs a reset, and to perform
>> +it as needed. Usually a hang is detected when a job gets stuck executing. KMD
>> +should keep track of resets, because userspace can query any time about the
>> +reset status for a specific context. This is needed to propagate to the rest of
>> +the stack that a reset has happened. Currently, this is implemented by each
>> +driver separately, with no common DRM interface. Ideally this should be properly
>> +integrated at DRM scheduler to provide a common ground for all drivers. After a
>> +reset, KMD should reject new command submissions for affected contexts.
> 
> is there any consensus around what exactly 'affected contexts' might mean?
> I see i915 pin-point only the context that was at execution with head pointing
> at it and doesn't blame the queued ones, while on Xe it looks like we are
> blaming all the queued context. Not sure what other drivers are doing for the
> 'affected contexts'.
> 

"Affected contexts" is a generic term indeed, giving the differences 
from each driver as you already pointed out. amdgpu also tends to affect 
all queued contexts during a reset. This wording was used to fit how 
different drivers works.
