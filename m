Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5201294EB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 12:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD276E25A;
	Mon, 23 Dec 2019 11:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE226E25A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 11:18:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Dec 2019 03:18:25 -0800
X-IronPort-AV: E=Sophos;i="5.69,347,1571727600"; d="scan'208";a="211525553"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Dec 2019 03:18:22 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 4/8] drm/print: add kernel-doc for drm_debug_enabled
In-Reply-To: <20191221095553.13332-5-sam@ravnborg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191221095553.13332-1-sam@ravnborg.org>
 <20191221095553.13332-5-sam@ravnborg.org>
Date: Mon, 23 Dec 2019 13:18:19 +0200
Message-ID: <87zhfjuw78.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Joe Perches <joe@perches.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 21 Dec 2019, Sam Ravnborg <sam@ravnborg.org> wrote:
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  include/drm/drm_print.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index c1d333bb7534..c9fa06b517cc 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -392,6 +392,21 @@ enum drm_debug_category {
>  	DRM_UT_DP		= 0x100,
>  };
>  
> +/**
> + * drm_debug_enabled - check if debug logging is enabled for the
> + * specified category
> + * @category: the category that is checked
> + *
> + * The category specified can be either one &drm_debug_category value or several
> + * &drm_debug_category values ORed together.

It can implementation wise, but I'd prefer to advertize it as a plain
enum for just one category in the interface.

BR,
Jani.

> + * drm_debug_enabled() can be used to avoid expensive logging functionality
> + * when logging is not enabled.
> + * Use with care.
> + *
> + * RETURNS:
> + * true if debug logging for the specified category is enabled.
> + * false otherwise
> + */
>  static inline bool drm_debug_enabled(enum drm_debug_category category)
>  {
>  	return unlikely(__drm_debug & category);

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
