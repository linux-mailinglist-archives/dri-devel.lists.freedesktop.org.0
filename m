Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9375F68F6E8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 19:31:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111D910E6C0;
	Wed,  8 Feb 2023 18:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF53510E6C0
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 18:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b9fT0xiL+d4HYbF55jK9XASVobyxfE/UbSexv++6IKc=; b=QCwdfZ/XwnuMNKabC+Eg3z3Yef
 Jv/4U41RUB6aG6gbSFTqmPOZl+xDKS8N9w4+xoQ2o9pUWZMm6fgom1yK07GsmlgJmyBhap67bRrse
 ecWAQwjAJy8pVIptXhQbitWQ9cIQFLptVo4WPWRaPMqIQRtup7qHGraLNvI/Qfnl1PyXb+2xfkxw9
 W2p6TQLYjso11L6VNeOiuTUFgbIKKPrrETOdNmaezrnRnOkeeczQdS9HjxB+kwEixoNhpL+TzbVlX
 4zmrk5xscnvSPEJ2WMBLUSrAywP+Q7RGN9KwjfvTzKJQ+aC3uplfkzT/g/pVLh2b9iT+3TQQdB6KE
 Gk/h0HKw==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pPpEP-00D9YZ-S1; Wed, 08 Feb 2023 19:31:46 +0100
Message-ID: <1a25cc58-ba2b-2529-2e02-5c610e9d3f58@igalia.com>
Date: Wed, 8 Feb 2023 15:31:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: DRM accel and debugfs/sysfs
Content-Language: en-US
To: Oded Gabbay <ogabbay@kernel.org>, Daniel Vetter <daniel@ffwll.ch>
References: <20230201152003.GA2623449@linux.intel.com>
 <5dfdf605-55a2-28d3-aecf-713a632b2431@igalia.com>
 <5651b98b-ace8-5009-409f-d6032cb5374d@quicinc.com>
 <bdf077e8-87ff-108a-e1fe-44bd6db79674@igalia.com>
 <Y+Pk185JOBg7/AKN@phenom.ffwll.local>
 <CAFCwf11-46pknoh_S=GYWeQFP3Q6x+k7EcqsOapPEEji5Dygnw@mail.gmail.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <CAFCwf11-46pknoh_S=GYWeQFP3Q6x+k7EcqsOapPEEji5Dygnw@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/8/23 15:13, Oded Gabbay wrote:
> On Wed, Feb 8, 2023 at 8:07 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> On Tue, Feb 07, 2023 at 01:17:47PM -0300, Maíra Canal wrote:
>>> On 2/7/23 12:43, Jeffrey Hugo wrote:
>>>> On 2/7/2023 4:31 AM, Maíra Canal wrote:
>>>>> Hi Stanislaw,
>>>>>
>>>>> On 2/1/23 12:20, Stanislaw Gruszka wrote:
>>>>>> Hi
>>>>>>
>>>>>> I was about to send debugfs support for ivpu and noticed that there
>>>>>> are current changes that deprecate drm_devel->debugfs_init callback.
>>>>>>
>>>>>> Further I looked at this commit [1], that stated we should not
>>>>>> use drm_minor for debugfs and sysfs. What is quite contrary to
>>>>>> what drm accel framework did in the first place.
>>>>>>
>>>>>> So my question is how we should use debugfs/sysfs in accel?
>>>>>> Use it with old fashioned minor-centric way or change
>>>>>> the framework somehow ?
>>>>>
>>>>> As we are trying to replace drm_debugfs_create_files() [1], it would
>>>>> be nice to see the accel debugfs support use the new debugfs API. This
>>>>> would mean using the debugfs_list from the drm_device, deprecating
>>>>> the debugfs_init callback, and adding the a similar code snippet to
>>>>> accel_debugfs_init:
>>>>>
>>>>> list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
>>>>>       debugfs_create_file(entry->file.name, 0444,
>>>>>                   minor->debugfs_root, entry, &drm_debugfs_entry_fops);
>>>>>       list_del(&entry->list);
>>>>>
>>>>> Maybe Daniel has some more thoughts on this matter, but I guess it
>>>>> would be better to drop the use of the old-fashioned minor-centric
>>>>> implementation in accel.
>>
>> It was a simple case of two things landing in parallel and not being
>> synchronized. Would be good if accel could be adapted to use the new
>> debugfs infra, now that both accel and the new debugfs stuff have landed.
>> -Daniel
> Yes, definitely.
> Does anyone volunteer to send a patch to align ?

I can send a patch this week align it.

Best Regards,
- Maíra Canal

> If not, we will do it internally and send a patch.
> 
> Oded
>>
>>>>>
>>>>> [1] https://cgit.freedesktop.org/drm/drm-misc/tree/Documentation/gpu/todo.rst#n511
>>>>>
>>>>> Best Regards,
>>>>> - Maíra Canal
>>>>
>>>> Thank you for the details Maira.  It helps to explain what the todo is suggesting.  Is there an example of a driver/drm_device that uses debugfs_list which you can easily point to?
>>>
>>> The implementation of this device-centered infrastructure is linked in [1]
>>> and an example of the conversion of debugfs APIs is linked in [2], and other
>>> drivers such as v3d, vkms, vc4 and gud use this new API as well.
>>>
>>> [1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1c9cacbea880513a896aee65a5c58007bcb55653
>>> [2] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=2e3ab8a6994f265bbd4dbd00448b84548f18464c
>>>
>>> Best Regards,
>>> - Maíra Canal
>>>
>>>>
>>>> -Jeff
>>>>
>>>>>
>>>>>>
>>>>>> [1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=99845faae7099cd704ebf67514c1157c26960a26
>>>>>>
>>>>>> Regards
>>>>>> Stanislaw
>>>>>>
>>>>
>>
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
