Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F2C98812A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 11:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483C410E1F2;
	Fri, 27 Sep 2024 09:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L52MzdHq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E71910E166;
 Fri, 27 Sep 2024 09:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727428629; x=1758964629;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=EjH5Rik4gezdSAdEOnc+MHdkCa8BUlSKYc6dh3TxQd0=;
 b=L52MzdHqwnjfpu2DBwNNS7CXFTlIx9JZP/onKBaXC/Cjhxuz2G38MLAX
 tJ/VVsJEhrpqU0yXFt09/t47G9zFZUgdNPoz4XNESj36e+IyBk18TObmw
 rMrmKY7MPU7PD1/XyGC/zbLa0nyLWchN9BRu1lyflOoBCBjNAnqBUOvhD
 M3KOg9cfs4Xa7hvKaB+CsilC/aCo48RpM0pOudTmY8cYxPaCKFpVkq16I
 lD4dCw80SEfsCoZgfFpcls7+dfSZ8H7qxzbo0pflPGuaA9/B6v4tpAj9E
 u5DlFmbMPAWoK7paTHArfTbPnrNim6HC+SCmpZXqedNfOMTG2vCvanunj w==;
X-CSE-ConnectionGUID: hZ0tC2LKTTq77QgVh1ojbA==
X-CSE-MsgGUID: kq1FIiAJQ0SpktR9lauwMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37238872"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="37238872"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 02:17:08 -0700
X-CSE-ConnectionGUID: Geres5JMQi2CpBQmxKUL3w==
X-CSE-MsgGUID: baqrMKV8Q365lDv9YVOdyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="72136128"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.211])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 02:17:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, Pierre-Eric
 Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>, dri-devel@lists.freedesktop.org,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dmitry.osipenko@collabora.com
Subject: Re: [PATCH v4 0/6] DRM_SET_CLIENT_NAME ioctl
In-Reply-To: <33c18e28-de1d-4c1d-8dc9-4be69552dc23@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240927084848.263718-1-pierre-eric.pelloux-prayer@amd.com>
 <33c18e28-de1d-4c1d-8dc9-4be69552dc23@amd.com>
Date: Fri, 27 Sep 2024 12:16:58 +0300
Message-ID: <87ikuhzcad.fsf@intel.com>
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

On Fri, 27 Sep 2024, Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> Am 27.09.24 um 10:48 schrieb Pierre-Eric Pelloux-Prayer:
>> v4 changelog:
>> * DRM_SET_NAME -> DRM_SET_CLIENT_NAME (Dmitry)
>> * reject names that would mess up with formatting (Sima),
>>    and use a stricter filter (isgraph allowed extended ASCII
>>    which weren't looking great)
>> * documentation edits, minor fixups (Dmitry, Trvtko)
>> * clarified commit message of commit 3/6 (Trvtko)
>> * reworked amdgpu_vm_set_task_info a bit in 4/6 (Trvtko)
>
> If nobody has any more additional comments on this I'm going to pick it=20
> up and merge it through drm-misc-next by the end of today.

AFAICT the userspace is not reviewed and ready for merging [1].

BR,
Jani.


[1] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1428


--=20
Jani Nikula, Intel
