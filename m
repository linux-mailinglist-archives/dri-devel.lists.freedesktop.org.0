Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C2DA32373
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 11:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E8D10E32C;
	Wed, 12 Feb 2025 10:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oxp3gk6C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967AB10E32C;
 Wed, 12 Feb 2025 10:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739356003; x=1770892003;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=w2MZ4NJMjEywyLCI52LgqIPkuJv9KAooUdzEqi5tHaE=;
 b=Oxp3gk6CNAWGLcO1krnGvg8bCniGFkZZYwZdlwt/PlpMMFyEuLyrjA+e
 u/ssIh1KvhwK8AZIC93dXz4wAu5HfpExI2rO9ifU+EIYxxL3kzJYXoshw
 ONjtIP+bp8vA7+XtcGwPrWpenz+EMYW2ZYi7ncVKkBVP/IT7X7HR+UPhv
 ANWCo0N9GAw23bL5rdLkoQ5uroPz/qVCgZm4VBz6j37g4OaG5J9h01J3v
 c8dft0XO87HcA35Tqjd94yTFsO7XJXTUvVAdYh8LALI4VTCOhIfYgRLjn
 G+GJcSi0MXJ8rS4x0w2iV/dY6poUCWdNcygk0DruPtCMPkJBpZIO5Wx+w g==;
X-CSE-ConnectionGUID: 7LpIRjokSiuf3cbTAJRUTA==
X-CSE-MsgGUID: TUv0S7heRL6r9XLLzHT8CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="65361865"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="65361865"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 02:26:42 -0800
X-CSE-ConnectionGUID: Qm2yafNCQ4GkIkgd31mvBg==
X-CSE-MsgGUID: E7BUA7mmS+a68cleNyR+SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="112545851"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.167])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 02:26:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, simona.vetter@ffwll.ch
Subject: Re: [PATCH 0/2] drm: add header tests
In-Reply-To: <Z5JYXICinxvDXN2J@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1737556766.git.jani.nikula@intel.com>
 <Z5JYXICinxvDXN2J@phenom.ffwll.local>
Date: Wed, 12 Feb 2025 12:26:36 +0200
Message-ID: <87mserzcf7.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Jan 2025, Simona Vetter <simona.vetter@ffwll.ch> wrote:
> On Wed, Jan 22, 2025 at 04:41:32PM +0200, Jani Nikula wrote:
>> Add CONFIG_DRM_HEADER_TEST to ensure drm headers are self-contained and
>> pass kernel-doc. And for starters, fix one header that this catches.
>> 
>> Jani Nikula (2):
>>   drm/client: include types.h to make drm_client_event.h self-contained
>>   drm: ensure drm headers are self-contained and pass kernel-doc
>
> I guess we should give this another shot. On the series:
>
> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

Thanks, pushed to drm-misc-next.

BR,
Jani.

>
>
>> 
>>  Kbuild                         |  1 +
>>  drivers/gpu/drm/Kconfig        | 11 +++++++++++
>>  drivers/gpu/drm/Makefile       | 18 ++++++++++++++++++
>>  include/Kbuild                 |  1 +
>>  include/drm/Makefile           | 18 ++++++++++++++++++
>>  include/drm/drm_client_event.h |  2 ++
>>  6 files changed, 51 insertions(+)
>>  create mode 100644 include/Kbuild
>>  create mode 100644 include/drm/Makefile
>> 
>> -- 
>> 2.39.5
>> 

-- 
Jani Nikula, Intel
