Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B25305F6462
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 12:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0120410E028;
	Thu,  6 Oct 2022 10:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A6E10E028
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 10:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665052729; x=1696588729;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=B3augJp3fk1qe+mBthnq0pxJCB8QBCksPWpBNe9BcX8=;
 b=lN6QxLwxduQBQZ/8AP/Sp9vs36mkN1k4KL4BIGgsM/j36D+1s+8xvmpT
 6WXVyqJ6RucHYvUpwiXd1ZzxIb+wWtypoTpK8C2RR+9FP6+0FdTWCRR8U
 tGLDzVbJ3zIW8WId3ljj8eBxTMao/r4Si+1r3kvdF4eelAYPT7uiAgVUB
 iIGb+/8H5mtBkk1JkL6ExwvPZfDbwd0vHxie2UQ5yzqV1TMlZsJJ8rWYc
 SzgoMBLoiM92Jf3XFyViXymUvomotLPJSBvUIGB1Iye70SpCAKHScxSha
 zVT3gtb0g+6N5Ufvlq/OcKjq2TDDk8wAgCu8e1cVNkBePiUAXlN1/RDBV g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="303385701"
X-IronPort-AV: E=Sophos;i="5.95,163,1661842800"; d="scan'208";a="303385701"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2022 03:38:48 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="624674737"
X-IronPort-AV: E=Sophos;i="5.95,163,1661842800"; d="scan'208";a="624674737"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.153])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2022 03:38:45 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jilin Yuan <yuanjilin@cdjrlc.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [PATCH] drm/edid: fix repeated words in comments
In-Reply-To: <20220907113644.32831-1-yuanjilin@cdjrlc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220907113644.32831-1-yuanjilin@cdjrlc.com>
Date: Thu, 06 Oct 2022 13:38:42 +0300
Message-ID: <87zge9p77x.fsf@intel.com>
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
Cc: Jilin Yuan <yuanjilin@cdjrlc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 07 Sep 2022, Jilin Yuan <yuanjilin@cdjrlc.com> wrote:
> Delete the redundant word 'on'.
>
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>

Thanks for the patch, pushed to drm-misc-next.

BR,
Jani.

> ---
>  drivers/gpu/drm/drm_edid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 4005dab6147d..25866b568d6b 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6837,7 +6837,7 @@ drm_hdmi_avi_infoframe_quant_range(struct hdmi_avi_infoframe *frame,
>  	 * by non-zero YQ when receiving RGB. There doesn't seem to be any
>  	 * good way to tell which version of CEA-861 the sink supports, so
>  	 * we limit non-zero YQ to HDMI 2.0 sinks only as HDMI 2.0 is based
> -	 * on on CEA-861-F.
> +	 * on CEA-861-F.
>  	 */
>  	if (!is_hdmi2_sink(connector) ||
>  	    rgb_quant_range == HDMI_QUANTIZATION_RANGE_LIMITED)

-- 
Jani Nikula, Intel Open Source Graphics Center
