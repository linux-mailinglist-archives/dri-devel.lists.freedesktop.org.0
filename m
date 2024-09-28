Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC65988F34
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 14:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CCD10E120;
	Sat, 28 Sep 2024 12:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="G6uZGtpz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C1010E120;
 Sat, 28 Sep 2024 12:34:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1727526857; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Jidp+v56GHpQ90d6jE42qovl/DPZDzyJY7TTyUYckqojZHA0zSaXjpcRcrNAURMcRiPs3Oa7BWrqs0j4HL8XFZEvKuhY7gBIsaTQlykpCoTG5BxZad6dALB4DyTm98nDlKeKaf14fIPoPEq4HVyeTBoAefMHLnv79Tp1qWzBmJc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1727526857;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=uFDG71r06/1KgUI9hwQET+t7IyxOBPeVXQbnAZX+teM=; 
 b=lCHDtTZMSDE6q00ay0GXurCYDKOD+eumqSIjsf3DZSJweU7VqHLpF6JCq8W8oNiKYJNLu+dHEPtpoYcCJ0vL/4UbaT9GPsabIJs06WV0/puD1CrF0SCa5OMtPVXpq4O2Kfyuxthg3JwgEdnRZ7NLEMzhbV/8LTU0ENPSK+pP9DU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727526857; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=uFDG71r06/1KgUI9hwQET+t7IyxOBPeVXQbnAZX+teM=;
 b=G6uZGtpzNI1n5VfMrO2vVwAgcFY+NDG5pesmtkqevYGdvZEm2OI+UyzrA9efuNG0
 IMZwr7K3Uc2UHgeJKuyurErv8m9bTarAbTJntQwN12Kf2zSa2v1Pi9XVsXq6MDOVR3l
 /2I/mpfIV6GfsuUuoGEAP6FFsPKNXpmb73qjmHUI=
Received: by mx.zohomail.com with SMTPS id 1727526855212827.5193517713183;
 Sat, 28 Sep 2024 05:34:15 -0700 (PDT)
Message-ID: <e44c75a8-9747-424e-a1e5-e43d7ad43c2f@collabora.com>
Date: Sat, 28 Sep 2024 15:34:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] DRM_SET_CLIENT_NAME ioctl
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, tursulin@igalia.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org
References: <20240927084848.263718-1-pierre-eric.pelloux-prayer@amd.com>
 <33c18e28-de1d-4c1d-8dc9-4be69552dc23@amd.com> <87ikuhzcad.fsf@intel.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <87ikuhzcad.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

On 9/27/24 12:16, Jani Nikula wrote:
> On Fri, 27 Sep 2024, Christian König <christian.koenig@amd.com> wrote:
>> Am 27.09.24 um 10:48 schrieb Pierre-Eric Pelloux-Prayer:
>>> v4 changelog:
>>> * DRM_SET_NAME -> DRM_SET_CLIENT_NAME (Dmitry)
>>> * reject names that would mess up with formatting (Sima),
>>>    and use a stricter filter (isgraph allowed extended ASCII
>>>    which weren't looking great)
>>> * documentation edits, minor fixups (Dmitry, Trvtko)
>>> * clarified commit message of commit 3/6 (Trvtko)
>>> * reworked amdgpu_vm_set_task_info a bit in 4/6 (Trvtko)
>>
>> If nobody has any more additional comments on this I'm going to pick it 
>> up and merge it through drm-misc-next by the end of today.
> 
> AFAICT the userspace is not reviewed and ready for merging [1].
> 
> BR,
> Jani.
> 
> 
> [1] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1428

Userspace has been discussed in the past. I'll merge virglrenderer MR
once Pierre will update it based on this v4 and after the kernel patch
will land to misc-next.

-- 
Best regards,
Dmitry

