Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5654A7DF8F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 15:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E051E10E46A;
	Mon,  7 Apr 2025 13:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="AnUSn8Q0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com
 [95.215.58.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F337910E46A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 13:39:20 +0000 (UTC)
Date: Mon, 7 Apr 2025 09:39:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1744033157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0XIUj5MzVf7FhQ0vyFo3sl3uOZZc7cydDbrjDL7zEyw=;
 b=AnUSn8Q0qW8EJbxaYpV//3gIq1BNV/l5jNmEnDrt4l/wo2PakV7tNGYR3IGv8dO3t9xeD3
 +NN/OvaHFh8FOR7dTh1CsE5vkBE7vez9xz0VrEfZ6dv3STH+Rf7ckwxp2tWoIei8Igcy+b
 5ZL1vloSJpacSgEcvZajunglNsWrXrPJtUwTkeD4TUBaP4z2lKD81FrWDJHzISwRmWBHK5
 ffSD87Wb3JhA4PhsNHKX94CjNbepPnT4bxu/TzV5+cArtmVlca9UXRCb1L+gXrzL+5pZEh
 XjUw/m5gpT2xdAw7014fsH5NKMpbUjw5qodLb7bWpla2dQqp8SCvv990JnvcKA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Aditya Garg <gargaditya08@live.com>
Cc: Petr Mladek <pmladek@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>,
 Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
 Simona Vetter <simona@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com,
 joe@perches.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
 Kees Cook <kees@kernel.org>, tamird@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Hector Martin <marcan@marcan.st>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>
Subject: Re: [PATCH v3 3/3] drm/appletbdrm: use %p4cl instead of %p4cc
Message-ID: <Z_PVfqVzvscBFND_@blossom>
References: <8153cb02-d8f1-4e59-b2d5-0dfdde7a832e@live.com>
 <PN3PR01MB9597A66B39FF5824E3718EC3B8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB9597A66B39FF5824E3718EC3B8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Migadu-Flow: FLOW_OUT
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Mon , Apr 07, 2025 at 07:07:54PM +0530, Aditya Garg a écrit :
> From: Aditya Garg <gargaditya08@live.com>
> 
> Due to lack of a proper printk format, %p4cc was being used instead of
> %p4cl for the purpose of printing FourCCs. But the disadvange was that
> they were being printed in a reverse order. %p4cl should correct this
> issue.
> 
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---
>  drivers/gpu/drm/tiny/appletbdrm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/appletbdrm.c b/drivers/gpu/drm/tiny/appletbdrm.c
> index 703b9a41a..751b05753 100644
> --- a/drivers/gpu/drm/tiny/appletbdrm.c
> +++ b/drivers/gpu/drm/tiny/appletbdrm.c
> @@ -212,7 +212,7 @@ static int appletbdrm_read_response(struct appletbdrm_device *adev,
>  	}
>  
>  	if (response->msg != expected_response) {
> -		drm_err(drm, "Unexpected response from device (expected %p4cc found %p4cc)\n",
> +		drm_err(drm, "Unexpected response from device (expected %p4cl found %p4cl)\n",
>  			&expected_response, &response->msg);
>  		return -EIO;
>  	}
> @@ -286,7 +286,7 @@ static int appletbdrm_get_information(struct appletbdrm_device *adev)
>  	}
>  
>  	if (pixel_format != APPLETBDRM_PIXEL_FORMAT) {
> -		drm_err(drm, "Encountered unknown pixel format (%p4cc)\n", &pixel_format);
> +		drm_err(drm, "Encountered unknown pixel format (%p4cl)\n", &pixel_format);
>  		ret = -EINVAL;
>  		goto free_info;
>  	}
> -- 
> 2.43.0
> 
