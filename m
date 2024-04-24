Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 236208B09F2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 14:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80146113B09;
	Wed, 24 Apr 2024 12:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NrZ3sIs4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8C9113B09;
 Wed, 24 Apr 2024 12:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713962739; x=1745498739;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=0jLlO4p+9YTNmH0ivC9TTOSbeS7d/lr9b0CvWkTB+k0=;
 b=NrZ3sIs43T9AGHEWIGfrgWGPyZ0JlJyAO+JyIG7P3Rw3I+heUt61xUV1
 4W7y3r7NSEclRgywzU9Djq8Ps5plG+dnldzP9RtutA0hqVFJEFE68ebWL
 J5u4UHm+MgRNsFJwtSCOwKsYCVvcKugduTXfRtavEvfv0RtdlmGVzCOii
 22suuVqPz5wCL/moyKmhRBjrIqy25E9vdhgCioV/llQ9XwJCLIs0YdCsM
 y7D6OPDZlAtbszxwZhDPAHFR8m452PdqedFewvaDNjtm3PhzCumTfAdic
 RQdwp92MxfjlgzbmENXYEaraBxKgFkEC9zgSOeRZmNBLq3ThNz2CNIXLx w==;
X-CSE-ConnectionGUID: YjZeDY2MSmm6j7IKO8YfHQ==
X-CSE-MsgGUID: yKw0Ui+TT7qeDwACpfBq7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9459452"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9459452"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 05:45:38 -0700
X-CSE-ConnectionGUID: +laFtgcdTg6a77k731vYsg==
X-CSE-MsgGUID: fDl53eSmRTCNvrogLSjZxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="29178254"
Received: from vgrigo2x-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.49])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 05:45:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ryszard Knop <ryszard.knop@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] MAINTAINERS: Move the drm-intel repo location to fd.o
 GitLab
In-Reply-To: <20240424114159.38719-1-ryszard.knop@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240424114159.38719-1-ryszard.knop@intel.com>
Date: Wed, 24 Apr 2024 15:45:34 +0300
Message-ID: <871q6vq68h.fsf@intel.com>
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

On Wed, 24 Apr 2024, Ryszard Knop <ryszard.knop@intel.com> wrote:
> The drm-intel repo is moving from the classic fd.o git host to GitLab.
> Update its location with a URL matching other fd.o GitLab kernel trees.
>
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d6327dc12cb1..fbf7371a0bb0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10854,7 +10854,7 @@ W:	https://drm.pages.freedesktop.org/intel-docs/
>  Q:	http://patchwork.freedesktop.org/project/intel-gfx/
>  B:	https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html
>  C:	irc://irc.oftc.net/intel-gfx
> -T:	git git://anongit.freedesktop.org/drm-intel
> +T:	git https://gitlab.freedesktop.org/drm/i915/kernel.git
>  F:	Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
>  F:	Documentation/gpu/i915.rst
>  F:	drivers/gpu/drm/ci/xfails/i915*

-- 
Jani Nikula, Intel
