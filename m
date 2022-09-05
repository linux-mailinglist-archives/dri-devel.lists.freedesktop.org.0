Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC975ACDF2
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 10:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3DF10E0C2;
	Mon,  5 Sep 2022 08:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9879C10E0C2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 08:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662367553; x=1693903553;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=VulwtAMXr7xVKmVAu+tufKJVLzx457Obcg3dQM6GRgQ=;
 b=Gh7IPSu1bzYmKHZceLJhg50HK1RzVdji2NLCoU2AtBR7rPyB7I7GqjKF
 8ppphPr4hi/LXrhzK/fgfQILoqd0eevhMPVHUkTwtkHD3NVZ2HQyaCr+a
 Oaa2m2dhtZ1jXCPHP2tzgLKsw42ydx1e3jALS/mUDCZOLbT4AamYFyqKo
 UXu1iEx5DKP+LFTqP8sKAtHx1uAe8g3pjCHZr5PnXvc66To/tX3g1q/Un
 18JNmHN1QdRfbHSnTbpvwQXrOhhGvV4/wxs2eawwJyQMozSXgYpvvN0vq
 fOj1udToE0bh/cKyYAvrKPuIVeaFY2aZFX4rST2g40ISTwMFOft78JPVk A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="293925802"
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; d="scan'208";a="293925802"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 01:45:52 -0700
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; d="scan'208";a="675198191"
Received: from smaciag-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.57.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 01:45:50 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jingyu Wang <jingyuwang_vip@163.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [PATCH] drm/print: cleanup coding style in drm_print.h
In-Reply-To: <20220904203818.16775-1-jingyuwang_vip@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220904203818.16775-1-jingyuwang_vip@163.com>
Date: Mon, 05 Sep 2022 11:45:34 +0300
Message-ID: <87wnaib45t.fsf@intel.com>
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
Cc: Jingyu Wang <jingyuwang_vip@163.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 05 Sep 2022, Jingyu Wang <jingyuwang_vip@163.com> wrote:
> Fix everything checkpatch.pl complained about in drm_print.h

Sorry, you just can't assume the checkpatch.pl complaints are all
correct, or that it would be this trivial to fix them.

This is broken.

> Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
> ---
>  include/drm/drm_print.h | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 22fabdeed297..4332fbeb76a8 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: MIT */

What's the point of having both the SPDX and full license text in the
header? But unless you're the license holder, I'd be pretty careful
about removing the license text.

>  /*
>   * Copyright (C) 2016 Red Hat
>   *
> @@ -103,7 +104,7 @@ __printf(2, 0)
>   * @va: the va_list
>   */
>  static inline void
> -drm_vprintf(struct drm_printer *p, const char *fmt, va_list *va)
> +drm_vprintf(struct drm_printer *p, const char *fmt, va_list * va)

Checkpatch is just confused here. Look at all the other params, why
would you add an extra space here?

>  {
>  	struct va_format vaf = { .fmt = fmt, .va = va };
>  
> @@ -426,16 +427,16 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>  
>  
>  #define drm_info(drm, fmt, ...)					\
> -	__drm_printk((drm), info,, fmt, ##__VA_ARGS__)
> +	__drm_printk((drm), info, fmt, ##__VA_ARGS__)
>  
>  #define drm_notice(drm, fmt, ...)				\
> -	__drm_printk((drm), notice,, fmt, ##__VA_ARGS__)
> +	__drm_printk((drm), notice, fmt, ##__VA_ARGS__)
>  
>  #define drm_warn(drm, fmt, ...)					\
> -	__drm_printk((drm), warn,, fmt, ##__VA_ARGS__)
> +	__drm_printk((drm), warn, fmt, ##__VA_ARGS__)
>  
>  #define drm_err(drm, fmt, ...)					\
> -	__drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
> +	__drm_printk((drm), err, "*ERROR* " fmt, ##__VA_ARGS__)

This is macro magic, and that ,, there passes an empty arg. You remove
it completely, shifting all the args to the wrong place, breaking drm
error logging.

BR,
Jani.

>  
>  
>  #define drm_info_once(drm, fmt, ...)				\
>
> base-commit: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
> prerequisite-patch-id: f039528bc88876d6e0f64e843da089e85f6d3f58
> prerequisite-patch-id: c14ed2e970be2c3f8ba746634e8161b94c148e88

-- 
Jani Nikula, Intel Open Source Graphics Center
