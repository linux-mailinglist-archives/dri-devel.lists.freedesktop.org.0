Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D3AA00124
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 23:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216AD10E333;
	Thu,  2 Jan 2025 22:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="O1jLuRVo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB9210E333
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 22:18:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1735856323; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fnPkrvqfc+vOst/lYz+zEuGkLNNy07OJp7pKurh4hotnk3eHRyK5bpQyiYm3q+sdCv89Y5DCYaHObwOM7tL7UP0xXUQIIrrrbkcE8zTATJruS+LMGzPTEU7AZ+d0a6TS6DgUg2cN9KHc7Nf4PTaw5GABbOeeNKU5Sh2j9YBjh6g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1735856322;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=56/M00KxBUOOwfdcqsT/BnImePykccXwFWecilI3qPc=; 
 b=cnDVmIKZ/mov8HqtfT6OyBLT/NvmtrxCziM8VMaipatBs3dhzRuXfb2LymQOjt9XuRA+oYL5rPyJ01jruhxT0cMI1gxi30X8aZ8g56UTC3DIDtrpq0CnnzAEDjmK1Nzyfelw1zLcDhcksEfT6jhy5lnoRFmngX+/b6s+Mzj/jy4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735856322; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=56/M00KxBUOOwfdcqsT/BnImePykccXwFWecilI3qPc=;
 b=O1jLuRVoRjbJoVEUmvBR9RT3oPXPSCsC7q44biH9qUSPsEvNst0pHXniOqomMzBz
 Q9/a8pIENUTJcsuc/oPNCOFkMmX7NENlExFY7ntYBHKEjykzVZTqSpE4LBcj6YWBl9l
 x/RSWN+LuiQddrDAjOIozlG/zfk6xeLWkdJsXKWo=
Received: by mx.zohomail.com with SMTPS id 1735856319520390.38209805862607;
 Thu, 2 Jan 2025 14:18:39 -0800 (PST)
Date: Thu, 2 Jan 2025 22:18:35 +0000
From: =?utf-8?B?QWRyacOhbiBNYXJ0w61uZXo=?= Larumbe
 <adrian.larumbe@collabora.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Mihail Atanassov <mihail.atanassov@arm.com>
Subject: Re: [PATCH v5 2/2] Documentation/gpu: Add fdinfo meanings of
 drm-*-internal memory tags
Message-ID: <2sb72aco2lc5hlvwn7hpc5k27naep7u2s64lc6qzk4ruy6jkhd@c2dfhvhe76yt>
References: <20241218181844.886043-1-adrian.larumbe@collabora.com>
 <20241218181844.886043-3-adrian.larumbe@collabora.com>
 <1ef1d07b-bfa9-4e52-bfa0-20f569752701@ursulin.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ef1d07b-bfa9-4e52-bfa0-20f569752701@ursulin.net>
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

On 02.01.2025 21:59, Tvrtko Ursulin wrote:
>
>On 18/12/2024 18:18, Adrián Martínez Larumbe wrote:
>> From: Adrián Larumbe <adrian.larumbe@collabora.com>
>> 
>> A previous commit enabled display of driver-internal kernel BO sizes
>> through the device file's fdinfo interface.
>> 
>> Expand the description of the relevant driver-specific key:value pairs
>> with the definitions of the new drm-*-internal ones.
>> 
>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>> Reviewed-by: Mihail Atanassov <mihail.atanassov@arm.com>
>> ---
>>   Documentation/gpu/panthor.rst | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>> 
>> diff --git a/Documentation/gpu/panthor.rst b/Documentation/gpu/panthor.rst
>> index 3f8979fa2b86..23aa3d67c9d2 100644
>> --- a/Documentation/gpu/panthor.rst
>> +++ b/Documentation/gpu/panthor.rst
>> @@ -26,6 +26,10 @@ the currently possible format options:
>>        drm-cycles-panthor:     94439687187
>>        drm-maxfreq-panthor:    1000000000 Hz
>>        drm-curfreq-panthor:    1000000000 Hz
>> +     drm-total-internal:     10396 KiB
>> +     drm-shared-internal:    0
>> +     drm-active-internal:    10396 KiB
>> +     drm-resident-internal:  10396 KiB
>>        drm-total-memory:       16480 KiB
>>        drm-shared-memory:      0
>>        drm-active-memory:      16200 KiB
>> @@ -44,3 +48,13 @@ driver by writing into the appropriate sysfs node::
>>   Where `N` is a bit mask where cycle and timestamp sampling are respectively
>>   enabled by the first and second bits.
>> +
>> +Possible `drm-*-internal` keys are: `total`, `active`, `resident` and `shared`.
>> +These values convey the sizes of the internal driver-owned shmem BO's that
>> +aren't exposed to user-space through a DRM handle, like queue ring buffers,
>> +sync object arrays and heap chunks. Because they are all allocated and pinned
>> +at creation time, `drm-resident-internal` and `drm-total-internal` should always
>> +be equal. `drm-active-internal` shows the size of kernel BO's associated with
>> +VM's and groups currently being scheduled for execution by the GPU.
>> +`drm-shared-internal` is unused at present, but in the future it might stand for
>> +the size of executable FW regions, since they do not belong to an open file context.
>
>The description is way too specific, too tied to some of the implementations.

These are panthor-specific key:value pairs. I was in the belief that drivers
could define their own when it suits their interest beyond the DRM-wide ones
defined in the drm-fdinfo spec.

>I also don't remember that you ever explained why totting up the internal
>objects into existing regions isn't good enough. I keep asking, you keep not
>explaining. Or I missed your emails somehow.

It's not that it's not good enough, but rather that it cannot be done in the
current state of affairs. drm_show_memory_stats() defines its own
drm_memory_stats struct as an automatic variable so we don't have access to it
from anywhere else in the driver. In a previous revision of the patch series I
had come up with a workaround that would let drivers pass a function pointer to
drm_show_memory_stats() which would gather those numbers in a driver-specific
way, but it didn't seem to get any traction.

>And you keep not copying me on the thread. Copying people who expressed
>interest, gave past feedback, etc should be the norm.

I did not CC you on this series because these are all panthor-specific changes
which do not touch on any DRM fdinfo-wide code, and also because I didn't think
that driver-specific key:value pairs needed the approval of the drm-fdinfo core
maintainers.

>Until we can clarify the above points I don't think this can go in.
>
>Regards,
>
>Tvrtko

Adrian Larumbe
