Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689CBA91AED
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 13:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F68D10EACD;
	Thu, 17 Apr 2025 11:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c95j4e0g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9452F10EAC8;
 Thu, 17 Apr 2025 11:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744889421; x=1776425421;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Ia5pniwOSwFh5dgBNgloPIn51o0KZZavQZZVK5ASOJ8=;
 b=c95j4e0gKvu3bNjFYmmgHa28flRrZmwpxgeCr3ptzPm6dzXfLk4Gxd2D
 ZwP2MFdJsKx8JpZaIRA3anV6lCWnioMW6+PaPwgnlziaqdpOl09W1SXmk
 XJX0q7Hu9A77TKFMrLvEPOj+h8josDO2xQgujTgaGKuTP7kDpSRcrTK0v
 HeVu1ux2ayFShvtx90VV36QAvLDEIUSQqiZaEC2cnJW8Y4hnS8ZppgffY
 NDOSRsYwbj6BAT1RPZxN+yffu63OZwkk61+iyCb6YPkS3mZwFYDushw4V
 x2eY5iFroyD97uo0sneviIt3kPqJfCpHnyiFoQ0rFggxsSxCUSdssTzn8 g==;
X-CSE-ConnectionGUID: pa0UX9EiS7COYXf7P7Frwg==
X-CSE-MsgGUID: Dp74CWLeTF6JD1lraz4ioA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46603459"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="46603459"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 04:30:21 -0700
X-CSE-ConnectionGUID: fAFNzLb0SI2UJ3qWlEqT8g==
X-CSE-MsgGUID: eKCu/6VsTmquYF/fP3kREw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="130541223"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 04:30:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, Sunil Khatri
 <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>
Subject: Re: [PATCH v6 1/5] drm: add macro drm_file_err to print process info
In-Reply-To: <2ec09b8a-25f3-484c-b81c-f6478d9743cd@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250417091355.2240384-1-sunil.khatri@amd.com>
 <874iynp1uw.fsf@intel.com> <05d7ba43-28ff-4c76-9b63-782b8df0f9f6@amd.com>
 <871ptroxkl.fsf@intel.com> <2ec09b8a-25f3-484c-b81c-f6478d9743cd@amd.com>
Date: Thu, 17 Apr 2025 14:30:15 +0300
Message-ID: <87tt6nnhyw.fsf@intel.com>
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
> Am 17.04.25 um 13:07 schrieb Jani Nikula:
>> On Thu, 17 Apr 2025, Christian K=C3=B6nig <christian.koenig@amd.com> wro=
te:
>>> Am 17.04.25 um 11:35 schrieb Jani Nikula:
>>>> On Thu, 17 Apr 2025, Sunil Khatri <sunil.khatri@amd.com> wrote:
>>>>> Add a drm helper macro which append the process information for
>>>>> the drm_file over drm_err.
>>>>>
>>>>> v5: change to macro from function (Christian Koenig)
>>>>>     add helper functions for lock/unlock (Christian Koenig)
>>>>>
>>>>> v6: remove __maybe_unused and make function inline (Jani Nikula)
>>>>>     remove drm_print.h
>>>> I guess I gave all kinds of comments, but in the end my conclusion was:
>>>> why does *any* of this have to be static inline or macros? Make
>>>> drm_file_err() a regular function and hide the implementation inside
>>>> drm_file.c. That's the cleanest approach IMO.
>>> That won't work. The macro is necessary to concatenate the format strin=
gs.
>> I think you can handle them using struct va_format and %pV.
>
> Oh, really good point! I wasn't aware that this functionality exists.
>
> Going to discuss that with Sunil internally.

Please see the completely untested patch below for a starting point.

BR,
Jani.



From 55968ab339467c5b6e12ceb157ecbaf62eaa6082 Mon Sep 17 00:00:00 2001
From: Sunil Khatri <sunil.khatri@amd.com>
Date: Thu, 17 Apr 2025 14:43:51 +0530
Subject: [PATCH] drm: add macro drm_file_err to print process info
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Esp=
oo
Cc: Jani Nikula <jani.nikula@intel.com>

Add a drm helper macro which append the process information for
the drm_file over drm_err.

v5: change to macro from function (Christian Koenig)
    add helper functions for lock/unlock (Christian Koenig)

v6: remove __maybe_unused and make function inline (Jani Nikula)
    remove drm_print.h

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_file.c | 45 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_file.h     |  3 +++
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index c299cd94d3f7..dea954f57890 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -1025,3 +1025,48 @@ struct file *mock_drm_getfile(struct drm_minor *mino=
r, unsigned int flags)
 	return file;
 }
 EXPORT_SYMBOL_FOR_TESTS_ONLY(mock_drm_getfile);
+
+static struct task_struct *drm_task_lock(struct drm_file *file_priv)
+{
+	struct task_struct *task;
+	struct pid *pid;
+
+	mutex_lock(&file_priv->client_name_lock);
+	rcu_read_lock();
+	pid =3D rcu_dereference(file_priv->pid);
+	task =3D pid_task(pid, PIDTYPE_TGID);
+
+	return task;
+}
+
+static void drm_task_unlock(struct drm_file *file_priv)
+{
+	rcu_read_unlock();
+	mutex_unlock(&file_priv->client_name_lock);
+}
+/**
+ * drm_file_err - Fill info string with process name and pid
+ * @file_priv: context of interest for process name and pid
+ * @format: printf() like format string
+ *
+ * This update the user provided buffer with process
+ * name and pid information for @file_priv
+ */
+void drm_file_err(struct drm_file *file_priv, const char *format, ...)
+{
+	struct drm_device *dev =3D file_priv->minor->dev;
+	struct task_struct *task;
+	struct va_format vaf;
+	va_list args;
+
+	va_start(args, format);
+	vaf.fmt =3D format;
+	vaf.va =3D &args;
+
+	task =3D drm_task_lock(file_priv);
+	drm_err(dev, "comm: %s pid: %d client: %s %pV",
+		task ? task->comm : "", task ? task->pid : 0,
+		file_priv->client_name ?: "Unset", &vaf);
+	drm_task_unlock(file_priv);
+}
+EXPORT_SYMBOL(drm_file_err);
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 94d365b22505..ceb08a67f0b7 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -446,6 +446,9 @@ static inline bool drm_is_accel_client(const struct drm=
_file *file_priv)
 	return file_priv->minor->type =3D=3D DRM_MINOR_ACCEL;
 }
=20
+__printf(2, 3)
+void drm_file_err(struct drm_file *file_priv, const char *format, ...);
+
 void drm_file_update_pid(struct drm_file *);
=20
 struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, unsigned int=
 minor_id);
--=20
2.39.5




--=20
Jani Nikula, Intel
