Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2F887529C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 16:02:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5D41137CE;
	Thu,  7 Mar 2024 15:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ERpYeWiX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63891137CD;
 Thu,  7 Mar 2024 15:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709823742; x=1741359742;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=kE3dFxQY+uP+aLrCZxR3myJ4a+qbGf6GFx4k/5wJlis=;
 b=ERpYeWiXFL7ynHiPVc1YPtnQUe+koS7O8wE7sMxjBI1ze7qaU2mR4Vii
 U+VycVfIeZFxOObUK7Otbf64t+qnZr5V4JAkIx6tMqp7ea21PZFrjwstN
 50jQf9A4QGXnpZQ7D9tv/j7EIytx/c7elQ2SQ3d1xsb+0P8+w+po0LYKB
 z5fzUkxU+l+t13e13sES5tuyYqvb8DE6yN0YLvzJMe+jRc2ff/hU027Ej
 CScgR8x0lXVp2EfWyOAxRy0WdEAXE9XdVNGuOPyfsh/GP6+/u7KPm3+9f
 PTGumRXdIJsXBl9Cad67HVwER4KqDA9XJyagT4J7LPomjMsGxgKM+Ijfr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4360853"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="4360853"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 07:02:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="41029262"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 07:02:18 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 04/22] drm/amdgpu: make amd_asic_type.h self-contained
In-Reply-To: <CADnq5_NXUYjq1bTbK1xGW-zREfMvNxYyg=B0jxA4oytGnUoi3A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1709749576.git.jani.nikula@intel.com>
 <115327b880b69b1c8ad157e5ff7f6b419868fab0.1709749576.git.jani.nikula@intel.com>
 <CADnq5_NXUYjq1bTbK1xGW-zREfMvNxYyg=B0jxA4oytGnUoi3A@mail.gmail.com>
Date: Thu, 07 Mar 2024 17:02:15 +0200
Message-ID: <87edcmw0eg.fsf@intel.com>
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

On Thu, 07 Mar 2024, Alex Deucher <alexdeucher@gmail.com> wrote:
> On Wed, Mar 6, 2024 at 1:43=E2=80=AFPM Jani Nikula <jani.nikula@intel.com=
> wrote:
>>
>> Include <linux/types.h> for u8.
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>
> Do you want me to pick this up? Otherwise, feel free to take it via
> whatever tree makes sense.

Thanks, I'd like to take it along with the rest via drm-misc-next.

BR,
Jani.

>
> Alex
>
>> ---
>>  include/drm/amd_asic_type.h | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/include/drm/amd_asic_type.h b/include/drm/amd_asic_type.h
>> index 724c45e3e9a7..9be85b821aa6 100644
>> --- a/include/drm/amd_asic_type.h
>> +++ b/include/drm/amd_asic_type.h
>> @@ -22,6 +22,9 @@
>>
>>  #ifndef __AMD_ASIC_TYPE_H__
>>  #define __AMD_ASIC_TYPE_H__
>> +
>> +#include <linux/types.h>
>> +
>>  /*
>>   * Supported ASIC types
>>   */
>> --
>> 2.39.2
>>

--=20
Jani Nikula, Intel
