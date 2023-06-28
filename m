Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F22740B51
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 10:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D005610E02D;
	Wed, 28 Jun 2023 08:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9A910E02D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 08:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687940751; x=1719476751;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=BXkseK/7Ha+I5qFw0bg5W7x6wKpug2h9qv3tmbroptE=;
 b=V9Lpfn02jqfTfu3JQSGl9lgvlqr7D9ONr3txQ1khLlDOdGKkIF+kSnEl
 V6NdEgBxczaZv/g9drxnutVAzjFAK8d6PoCE3xZAolMw9JNST3Mzyx2cv
 lzwTfyH05/C5QWKD9SwjaB6mcZow+gFPh2SJ4Oomk7ZcW9Sq3580P+gQy
 OsOxAzAOdSr5yLeOAIOOtfBrw7pZUjGjbirPJqKJ0Gql/o+XCt5ZK5yVq
 zpq0r3d3dd2zhHPGOEIzYikFYWXTl0O0mObkCawsxYwDARxSTbypLH8yY
 wiyr3mFDGlOjgL7KSC/Uw9fbDdZW5ijFeRUCDiUKoktpcyVICa8LG2Fh+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="360637125"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="360637125"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 01:25:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="840980913"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="840980913"
Received: from lzhiguno-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.63.165])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 01:25:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Colin Ian King <colin.i.king@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH][next] drm/edid: make read-only const array static
In-Reply-To: <20230627170109.751829-1-colin.i.king@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230627170109.751829-1-colin.i.king@gmail.com>
Date: Wed, 28 Jun 2023 11:25:26 +0300
Message-ID: <87ttusro21.fsf@intel.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 27 Jun 2023, Colin Ian King <colin.i.king@gmail.com> wrote:
> Don't populate the const array on the stack, instead make it static.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks, pushed to drm-misc-next.

> ---
>  drivers/gpu/drm/drm_edid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index e0dbd9140726..39b13417b749 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3962,7 +3962,7 @@ static int drm_cvt_modes(struct drm_connector *connector,
>  	struct drm_display_mode *newmode;
>  	struct drm_device *dev = connector->dev;
>  	const struct cvt_timing *cvt;
> -	const int rates[] = { 60, 85, 75, 60, 50 };
> +	static const int rates[] = { 60, 85, 75, 60, 50 };
>  	const u8 empty[3] = { 0, 0, 0 };

Side note, this could be removed by replacing

	if (!memcmp(cvt->code, empty, 3))

with

	if (!memchr_inv(cvt->code, 0, 3))

or even

	if (!cvt->code[0] && !cvt->code[1] && !cvt->code[2])

BR,
Jani.

>  
>  	for (i = 0; i < 4; i++) {

-- 
Jani Nikula, Intel Open Source Graphics Center
