Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA006244A0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 15:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2EAA10E835;
	Thu, 10 Nov 2022 14:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D2F10E835;
 Thu, 10 Nov 2022 14:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668091641; x=1699627641;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qrfF+Jp9IflVSZj+VdlE4jNPI/afp/x7OkfFKbZGE1I=;
 b=F/Ch3URsSQRr9Z+v/Ezk5gjo6PPuCv2jLpIN1PxOFrzCorln2gQ3JNRm
 BRuyQqDXb2JJBedfm9SKQ20mtdhqQclHniSCciUTyVuPyiXtMQLzfUOE6
 jsuft/Nanf3Fj66O1RMOKIyxP2hzphtXanYO3sd+KqeClNll2no29MeE2
 Ugs5kYqj8A3zKcanutcoFdUsKuXU9GJJJIgDfVoRVwcvCgyFRiLccGF+x
 3KyQeV73KNUIQc8nqZzRdf5bxlyPRuXaPXCjZ+xEC0SRveGL8gh8OkmaQ
 C1pjhWwWUl3MAneTPsuLAggzrTmlsZWlC1iUcAXHRbT5g9kPMk7fMpqN3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="397618240"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="397618240"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 06:47:21 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="726406084"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="726406084"
Received: from salmasha-mobl.ger.corp.intel.com (HELO [10.213.230.214])
 ([10.213.230.214])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 06:47:18 -0800
Message-ID: <9097e704-841e-673d-4969-73ffc8f9093f@linux.intel.com>
Date: Thu, 10 Nov 2022 14:47:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [Intel-gfx] [PATCH v6 00/20] drm/i915/vm_bind: Add VM_BIND
 functionality
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
References: <20221107085210.17221-1-niranjana.vishwanathapura@intel.com>
 <7a1c8c8ba83e3e7ba286e636de0074516a099d68.camel@intel.com>
 <Y2yQ2T7+sILYn3rM@nvishwa1-DESK>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Y2yQ2T7+sILYn3rM@nvishwa1-DESK>
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/11/2022 05:49, Niranjana Vishwanathapura wrote:
> On Wed, Nov 09, 2022 at 04:16:25PM -0800, Zanoni, Paulo R wrote:
>> On Mon, 2022-11-07 at 00:51 -0800, Niranjana Vishwanathapura wrote:
>>> DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind GEM
>>> buffer objects (BOs) or sections of a BOs at specified GPU virtual
>>> addresses on a specified address space (VM). Multiple mappings can map
>>> to the same physical pages of an object (aliasing). These mappings (also
>>> referred to as persistent mappings) will be persistent across multiple
>>> GPU submissions (execbuf calls) issued by the UMD, without user having
>>> to provide a list of all required mappings during each submission (as
>>> required by older execbuf mode).
>>>
>>> This patch series support VM_BIND version 1, as described by the param
>>> I915_PARAM_VM_BIND_VERSION.
>>>
>>> Add new execbuf3 ioctl (I915_GEM_EXECBUFFER3) which only works in
>>> vm_bind mode. The vm_bind mode only works with this new execbuf3 ioctl.
>>> The new execbuf3 ioctl will not have any execlist support and all the
>>> legacy support like relocations etc., are removed.
>>>
>>> NOTEs:
>>> * It is based on below VM_BIND design+uapi rfc.
>>>   Documentation/gpu/rfc/i915_vm_bind.rst
>>
>> Hi
>>
>> One difference for execbuf3 that I noticed that is not mentioned in the
>> RFC document is that we now don't have a way to signal
>> EXEC_OBJECT_WRITE. When looking at the Kernel code, some there are some
>> pieces that check for this flag:
>>
>> - there's code that deals with frontbuffer rendering
>> - there's code that deals with fences
>> - there's code that prevents self-modifying batches
>> - another that seems related to waiting for objects
>>
>> Are there any new rules regarding frontbuffer rendering when we use
>> execbuf3? Any other behavior changes related to the other places that
>> we should expect when using execbuf3?
>>
> 
> Paulo,
> Most of the EXEC_OBJECT_WRITE check in execbuf path is related to
> implicit dependency tracker which execbuf3 does not support. The
> frontbuffer related updated is the only exception and I don't
> remember the rationale to not require this on execbuf3.
> 
> Matt, Tvrtko, Daniel, can you please comment here?

Does not ring a bell to me. Looking at the code it certainly looks like 
it would be silently failing to handle it properly.

I'll let people with more experience in this area answer, but from my 
point of view, if it is decided that it can be left unsupported, then we 
probably need a way of failing the ioctl is used against a frontbuffer, 
or something, instead of having display corruption.

Regards,

Tvrtko
