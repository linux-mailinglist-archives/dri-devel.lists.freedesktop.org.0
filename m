Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 464C9A91A04
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 13:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666EF10EAB3;
	Thu, 17 Apr 2025 11:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8zMKQjw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B45510EAAC;
 Thu, 17 Apr 2025 11:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744888081; x=1776424081;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=fDNWsxGhe8C/n+6dTsXJ2fs2UwpN2J6C/w/LWhY5w5Q=;
 b=Q8zMKQjwlcWjTv5v5M7wEjJY+8hsL4onJYftWDXMgXS4hZ013fB7oW7q
 Nvu9fIflxONJiIQjuwH/dBALNIf/5u/AhqQwJ3Z6ZrBIqNVcgz7Rr9iSv
 ZKlST8spIUGk/6AlyOd5l7Ja9kAepkWj3JQQC/BX3WsPnu48KSA7xyzBC
 geVFsh1lGl4HmYvPpHUmNkgggZjPYKDKpFjh3Pa1+pn1jYi37atD4aLSv
 SPvvIns6BsV4JRhH3YBiL6vpxTVun5waxkegNn/Hqgv9kLosT43pLjIV1
 Hwh5YcIJNGNbtLUju6Zkhk9KOmao9a5WDeM5fPJ5+nhNXfc7X1p9Xca1D Q==;
X-CSE-ConnectionGUID: kI5KBkJJR7WIiq0dLWd7eg==
X-CSE-MsgGUID: WPW0La3qTGeMRxTyv9vQTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50279170"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="50279170"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 04:08:00 -0700
X-CSE-ConnectionGUID: NB9dXP0IQQeDKpWUg/L3XQ==
X-CSE-MsgGUID: n924Cj8nTlKtULMVPSOMZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="153955944"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 04:07:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, Sunil Khatri
 <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>
Subject: Re: [PATCH v6 1/5] drm: add macro drm_file_err to print process info
In-Reply-To: <05d7ba43-28ff-4c76-9b63-782b8df0f9f6@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250417091355.2240384-1-sunil.khatri@amd.com>
 <874iynp1uw.fsf@intel.com> <05d7ba43-28ff-4c76-9b63-782b8df0f9f6@amd.com>
Date: Thu, 17 Apr 2025 14:07:54 +0300
Message-ID: <871ptroxkl.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 17 Apr 2025, Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> Am 17.04.25 um 11:35 schrieb Jani Nikula:
>> On Thu, 17 Apr 2025, Sunil Khatri <sunil.khatri@amd.com> wrote:
>>> Add a drm helper macro which append the process information for
>>> the drm_file over drm_err.
>>>
>>> v5: change to macro from function (Christian Koenig)
>>>     add helper functions for lock/unlock (Christian Koenig)
>>>
>>> v6: remove __maybe_unused and make function inline (Jani Nikula)
>>>     remove drm_print.h
>> I guess I gave all kinds of comments, but in the end my conclusion was:
>> why does *any* of this have to be static inline or macros? Make
>> drm_file_err() a regular function and hide the implementation inside
>> drm_file.c. That's the cleanest approach IMO.
>
> That won't work. The macro is necessary to concatenate the format strings.

I think you can handle them using struct va_format and %pV.

BR,
Jani.


>
> But the drm_task_lock() and drm_task_unlock() functions shouldn't be in t=
he header. Those can be perfectly in drm_file.c or drm_print.c
>
> And we should put drm_file_err into drm_print.h instead of drm_file.h as =
far as I can see.
>
> Regards,
> Christian.
>
>>
>> BR,
>> Jani.
>>
>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>> ---
>>>  include/drm/drm_file.h | 37 +++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 37 insertions(+)
>>>
>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>> index 94d365b22505..856b38e996c7 100644
>>> --- a/include/drm/drm_file.h
>>> +++ b/include/drm/drm_file.h
>>> @@ -446,6 +446,43 @@ static inline bool drm_is_accel_client(const struc=
t drm_file *file_priv)
>>>  	return file_priv->minor->type =3D=3D DRM_MINOR_ACCEL;
>>>  }
>>>=20=20
>>> +static inline struct task_struct *drm_task_lock(struct drm_file *file_=
priv)
>>> +{
>>> +	struct task_struct *task;
>>> +	struct pid *pid;
>>> +
>>> +	mutex_lock(&file_priv->client_name_lock);
>>> +	rcu_read_lock();
>>> +	pid =3D rcu_dereference(file_priv->pid);
>>> +	task =3D pid_task(pid, PIDTYPE_TGID);
>>> +	return task;
>>> +}
>>> +
>>> +static inline void drm_task_unlock(struct drm_file *file_priv)
>>> +{
>>> +	rcu_read_unlock();
>>> +	mutex_unlock(&file_priv->client_name_lock);
>>> +}
>>> +/**
>>> + * drm_file_err - Fill info string with process name and pid
>>> + * @file_priv: context of interest for process name and pid
>>> + * @fmt: prinf() like format string
>>> + *
>>> + * This update the user provided buffer with process
>>> + * name and pid information for @file_priv
>>> + */
>>> +#define drm_file_err(file_priv, fmt, ...)						\
>>> +	do {										\
>>> +		struct task_struct *task;						\
>>> +		struct drm_device *dev =3D file_priv->minor->dev;				\
>>> +											\
>>> +		task =3D drm_task_lock(file_priv);					\
>>> +		drm_err(dev, "comm: %s pid: %d client: %s " fmt,			\
>>> +			task ? task->comm : "", task ? task->pid : 0,			\
>>> +			file_priv->client_name ?: "Unset", ##__VA_ARGS__);		\
>>> +		drm_task_unlock(file_priv);						\
>>> +	} while (0)
>>> +
>>>  void drm_file_update_pid(struct drm_file *);
>>>=20=20
>>>  struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, unsigned=
 int minor_id);
>

--=20
Jani Nikula, Intel
