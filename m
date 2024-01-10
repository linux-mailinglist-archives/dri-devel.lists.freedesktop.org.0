Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9577D82839A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 11:00:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4B610E3D7;
	Tue,  9 Jan 2024 09:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C23010E3C3;
 Tue,  9 Jan 2024 09:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704794397; x=1736330397;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=aPHyUKUyHXed8656ZhEm3Uv9sPN5tlk1/6xGtbFguzs=;
 b=GK4VpKQn/ABPyb/+dq4jx0wtER+p39KVvKpy/tXqPzzhtKekir3DNSpG
 UiUeyC0gMHW9glceIrKYE6PT95GLzfQQcJ6YmLjH7TEcm5WPQt4odWIki
 pu7PKU9WfEe7+VKc1hyyNNjVLnF5ctx7NqWIkeu9OviebG5Jh8MRUTLmr
 ifSjaz3L04gE6wNtBBf9edipQ4QwUrwyzjhYDjmT3awOesRYaq6X/aRfz
 QUTlKWcWvu652MCDIVxm8YX01QEFcOGRQ8Hi68v6hUu61tS6Dki7AVTUi
 KyzJ2/3eeXG+q05JdwOxFRkGt1YFn+qjSXyAZZwyOOK/GlezafshXeqsO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="4898847"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="4898847"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 01:59:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="1113029294"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="1113029294"
Received: from aakinrin-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.252.36.188])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 01:59:54 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Danilo Krummrich <dakr@redhat.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/nouveau: include drm/drm_edid.h only where needed
In-Reply-To: <95f6815c-1ff5-4c89-b8c6-0445834a0083@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240104201632.1100753-1-jani.nikula@intel.com>
 <95f6815c-1ff5-4c89-b8c6-0445834a0083@redhat.com>
Date: Tue, 09 Jan 2024 11:59:52 +0200
Message-ID: <87ttnmx1wn.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: nouveau@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 08 Jan 2024, Danilo Krummrich <dakr@redhat.com> wrote:
> On 1/4/24 21:16, Jani Nikula wrote:
>> Including drm_edid.h from nouveau_connector.h causes the rebuild of 15
>> files when drm_edid.h is modified, while there are only a few files that
>> actually need to include drm_edid.h.
>> 
>> Cc: Karol Herbst <kherbst@redhat.com>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: nouveau@lists.freedesktop.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Danilo Krummrich <dakr@redhat.com>

Are you going to pick this up via the nouveau tree, or shall I apply it
to drm-misc-next?

BR,
Jani.

>
>> ---
>>   drivers/gpu/drm/nouveau/dispnv50/head.c     | 1 +
>>   drivers/gpu/drm/nouveau/nouveau_connector.h | 2 +-
>>   2 files changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
>> index 5f490fbf1877..83355dbc15ee 100644
>> --- a/drivers/gpu/drm/nouveau/dispnv50/head.c
>> +++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
>> @@ -32,6 +32,7 @@
>>   
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_edid.h>
>>   #include <drm/drm_vblank.h>
>>   #include "nouveau_connector.h"
>>   
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
>> index a2df4918340c..0608cabed058 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_connector.h
>> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
>> @@ -35,7 +35,6 @@
>>   
>>   #include <drm/display/drm_dp_helper.h>
>>   #include <drm/drm_crtc.h>
>> -#include <drm/drm_edid.h>
>>   #include <drm/drm_encoder.h>
>>   #include <drm/drm_util.h>
>>   
>> @@ -44,6 +43,7 @@
>>   
>>   struct nvkm_i2c_port;
>>   struct dcb_output;
>> +struct edid;
>>   
>>   #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
>>   struct nouveau_backlight {
>

-- 
Jani Nikula, Intel
