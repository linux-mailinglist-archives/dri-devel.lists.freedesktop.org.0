Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8DC388D5E
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 13:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD626ED83;
	Wed, 19 May 2021 11:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022D46ED83
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 11:59:52 +0000 (UTC)
Received: from [IPv6:2804:431:e7dd:20a5:77af:59ad:49dc:ab16] (unknown
 [IPv6:2804:431:e7dd:20a5:77af:59ad:49dc:ab16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B185B1F42717;
 Wed, 19 May 2021 12:59:50 +0100 (BST)
Subject: Re: [PATCH 1/2] drm/doc: document how userspace should find out CRTC
 index
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20210428213651.55467-1-leandro.ribeiro@collabora.com>
 <20210428213651.55467-2-leandro.ribeiro@collabora.com>
 <20210506115053.15741550@eldfell>
 <f4cfbb53-bfc6-768f-461b-252380b5b5a6@collabora.com>
 <20210512160422.66f3be04@eldfell>
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Message-ID: <5df41230-746a-1ab7-f6af-6a6cb6d6d872@collabora.com>
Date: Wed, 19 May 2021 08:59:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210512160422.66f3be04@eldfell>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
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
Cc: airlied@linux.ie, kernel@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/12/21 10:04 AM, Pekka Paalanen wrote:
> On Wed, 12 May 2021 09:50:14 -0300
> Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:
> 
>> On 5/6/21 5:50 AM, Pekka Paalanen wrote:
>>> On Wed, 28 Apr 2021 18:36:50 -0300
>>> Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:
>>>   
>>>> In this patch we add a section to document what userspace should do to
>>>> find out the CRTC index. This is important as there are multiple places
>>>> in the documentation that need this, so it's better to just point to
>>>> this section and avoid repetition.
>>>>
>>>> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
>>>> ---
>>>>  Documentation/gpu/drm-uapi.rst    | 14 ++++++++++++++
>>>>  drivers/gpu/drm/drm_debugfs_crc.c |  9 +++++----
>>>>  include/uapi/drm/drm.h            |  3 ++-
>>>>  3 files changed, 21 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>>>> index 04bdc7a91d53..1aa52a6ac567 100644
>>>> --- a/Documentation/gpu/drm-uapi.rst
>>>> +++ b/Documentation/gpu/drm-uapi.rst
>>>> @@ -457,6 +457,20 @@ Userspace API Structures
>>>>  .. kernel-doc:: include/uapi/drm/drm_mode.h
>>>>     :doc: overview
>>>>
>>>> +.. _crtc_index:
>>>> +
>>>> +CRTC index
>>>> +----------
>>>> +
>>>> +In some situations, it is important for userspace to find out the index of a  
>>>
>>> That could be said about everything, so this sentence has no
>>> information value. Instead, you could start by stating that CRTCs have
>>> both an object ID and an index, and they are not the same thing. CRTC
>>> index is used in cases where a densely packed identifier for a CRTC is
>>> needed, e.g. in bit-for-crtc masks, where using the object ID would not
>>> work.
>>>  
>>>> +CRTC. The CRTC index should not be confused with its object id.
>>>> +
>>>> +In order to do this, userspace should first query the resources object  
>>>
>>> Instead of saying what userspace must do, you could just explain where
>>> it can be observed.
>>>   
>>>> +from the device that owns the CRTC (using the DRM_IOCTL_MODE_GETRESOURCES  
>>>
>>> So here you might start with: DRM_IOCTL_MODE_GETRESOURCES populates a
>>> structure with an array of CRTC IDs. CRTC's index is its index in that
>>> array.
>>>   
>>>> +ioctl). The resources object contains a pointer to an array of CRTC's, and also
>>>> +the number of entries of the array. The index of the CRTC is the same as its
>>>> +position in this array.  
>>>
>>> Anyway, the idea here is right.
>>>   
>>
>> So what about:
>>
>> CRTC's have both an object ID and an index, and they should not be
>> confused. The index is used in cases where a densely packed identifier
>> for a CRTC is needed, for instance in a bitmask of CRTC's. (maybe a link
>> to the possible_crtcs field of struct drm_mode_get_plane? as example)
>>
>> DRM_IOCTL_MODE_GETRESOURCES populates a structure with an array of CRTC
>> id's, and the CRTC index is its position in this array.
> 
> Sure, sounds good.
> 
> Capitalized 'ID'?
> 

Sure, I'll add this change.

Thanks,
Leandro
