Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D15479A738
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 12:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3962510E285;
	Mon, 11 Sep 2023 10:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1326410E285
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 10:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694427820; x=1725963820;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=bvEMa2Vj8vG0UZTNEnBqLbnPwQfb0MClvUIcOVW2KS0=;
 b=ji9gQ86LKCj9PT0UsMvdUH7ej5JfSKw1qzR63hS66OzEMswWSsjwAnFq
 XCi9NNnFNISK580WmAayFSf+opf4iVoVen0D+WadwyWgCZiBElsMfkSxx
 lrdeHBCms/OzGp/xQWaWZVwTtdm+msEJI13n7VymOi5IxBhX82ndvXHxv
 MwxuZtuPXz+XcgONYzeoMf0ow34RIM4vITs+YMVCElz8aMoiBY6kJEa4B
 /CPwACXMPmxRotlVkOTD/z5Mr03Mw6tBumaHFciE8C1B9gCbNUwhGs/9U
 4FP4FgMphEiF0qWpLihVgSdY03P5uZX6Js29JO4GmiaM0eMTgYnnNKJIV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="368286751"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="368286751"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 03:23:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="833455779"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="833455779"
Received: from kschuele-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.119])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 03:23:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: Re: (subset) [PATCH v2] drm/connector: document
 DRM_MODE_COLORIMETRY_COUNT
In-Reply-To: <169409716450.2201230.1132363284756871897.b4-ty@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230906-topic-drm_connector_doc-v2-1-1f2dcaa43269@gmail.com>
 <169409716450.2201230.1132363284756871897.b4-ty@kernel.org>
Date: Mon, 11 Sep 2023 13:23:34 +0300
Message-ID: <87il8hf1p5.fsf@intel.com>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 07 Sep 2023, Maxime Ripard <mripard@kernel.org> wrote:
> On Wed, 06 Sep 2023 22:47:38 +0200, Javier Carrasco wrote:
>> The drm_colorspace enum member DRM_MODE_COLORIMETRY_COUNT has been
>> properly documented by moving the description out of the enum to the
>> member description list to get rid of an additional warning and improve
>> documentation clarity.
>> 
>> 
>
> Applied to drm/drm-misc (drm-misc-next).

After the fact, but adding /* private: */ would've been an alternative
approach. I think support for that for enums should be there.

Anyway, just for future reference, the merged patch is fine.

BR,
Jani.

>
> Thanks!
> Maxime
>

-- 
Jani Nikula, Intel Open Source Graphics Center
