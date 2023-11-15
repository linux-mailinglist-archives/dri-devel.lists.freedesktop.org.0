Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A86CC7EBE87
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 09:24:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F62B10E502;
	Wed, 15 Nov 2023 08:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FAD010E502
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 08:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700036666; x=1731572666;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Ml84cLxD5rsfsxL3mrpqnpsM0Wv1bTCCfZD5GoFtfX4=;
 b=SPmDd6QpM+0Dv8NASnmoesCh3N1JYy0tM2kvRxyqBVRoqLvyg6Z2tl2A
 AQvvOhYvVdDGFXqQmamhF3AYXX8rHiKIBJrrnZ+nGk9cqiBJbc8UBj1LU
 oeWZyzdN7oasE58ViLw8hgwGy34IFaar+J116NHFfwVY1bPhXhNYJ8JpG
 7ysOmUSjlvEVo0CNU8E3PELT94mbRnGzURAWOwz4twj/66KNskJf2j+/B
 UKAdQnSG1dKeGfkzQICqkIKxYmQLQ9KKlqnIQUEZdAZkoEeNIdSms10zV
 P3OgAlOqPoC4qBCFfoeChLIT2Q3B8A1KLS+b3bdnRUnK5OpkkVG/ggWAM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="370184567"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="370184567"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 00:24:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="882329714"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="882329714"
Received: from aklett-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.252.38.156])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 00:24:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luben Tuikov <ltuikov89@gmail.com>, Direct Rendering Infrastructure -
 Development <dri-devel@lists.freedesktop.org>, Danilo Krummrich
 <dakr@redhat.com>
Subject: Re: [PATCH] drm/sched: Define pr_fmt() for DRM using pr_*()
In-Reply-To: <fcec4d24-41d6-4897-bc2a-9ea7d3b4afd5@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231110002659.113208-2-ltuikov89@gmail.com>
 <878r75wzm9.fsf@intel.com>
 <35c03405-4163-45de-b67e-77de08ed2d2a@gmail.com>
 <87h6losf0p.fsf@intel.com>
 <fcec4d24-41d6-4897-bc2a-9ea7d3b4afd5@gmail.com>
Date: Wed, 15 Nov 2023 10:24:21 +0200
Message-ID: <871qcrs9u2.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Nov 2023, Luben Tuikov <ltuikov89@gmail.com> wrote:
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index a93a387f8a1a15..ce784118e4f762 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -453,7 +453,7 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
>  
>  /* Helper for struct drm_device based logging. */
>  #define __drm_printk(drm, level, type, fmt, ...)                       \
> -       dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
> +       dev_##level##type(drm ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)

I think that would be an improvement that stands on its own merits.

Please also wrap the first drm in parens (drm).

> The output would be similar to that if drm->dev were NULL.

Yes. I don't know how people will feel about intentionally using
drm_err(NULL, ...) all over the place, but that's another matter. ;)

BR,
Jani.


-- 
Jani Nikula, Intel
