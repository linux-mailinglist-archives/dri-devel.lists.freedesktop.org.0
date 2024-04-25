Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 837F88B290D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 21:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550AA10E3CA;
	Thu, 25 Apr 2024 19:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tronnes.org header.i=@tronnes.org header.b="Vty8uhJE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6431B10E3CA
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 19:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202312;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5tRJK1UV1pvwUAKeIjhi+TprALIW1SqSIXJRlUAG31I=; b=Vty8uhJE266ITaXR0L/uBlpamI
 1HBeJ424YeoowkBwPF5BXRcPtxy+svEXXgl3zvwINS7aP02v7CQ0QE3WueclfaPc5MN97l9hOEa1G
 DFgqA+k2NzA9fyuQxleknj749P7J4Gi5tznY4zEuJcNtuGX4Kqksfr2LheYNY6pHvNnXvWhkScLz8
 X1X9n+wV6N0tGWW3z0VVsyrtVXVQuG41/e8y9vadlwV0okIjJBk0SDVMfs9rgS5WdkehnmhD/tig/
 ph0RsXRv+tHcev28Pp8c3Ybt9JK7S/f22wJX1FbC19dUiXGt3p7VzHseyYGychxGRH6IYDbToEA9q
 f9ATaY3g==;
Received: from [2a01:799:962:4900:815f:3dd0:60d8:6458] (port=56458)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1s04nU-008Vsv-M0;
 Thu, 25 Apr 2024 21:30:20 +0200
Message-ID: <703d9f05-499f-41d5-a892-b5c2ee2ab814@tronnes.org>
Date: Thu, 25 Apr 2024 21:30:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/print: drop include seq_file.h
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Maxime Ripard <mripard@kernel.org>, noralf@tronnes.org
References: <20240422121011.4133236-1-jani.nikula@intel.com>
 <20240422121011.4133236-2-jani.nikula@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
In-Reply-To: <20240422121011.4133236-2-jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 4/22/24 14:10, Jani Nikula wrote:
> Never include where a forward declaration will suffice.
> 
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20240410141434.157908-2-jani.nikula@intel.com
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  include/drm/drm_print.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 561c3b96b6fd..089950ad8681 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -28,7 +28,6 @@
>  
>  #include <linux/compiler.h>
>  #include <linux/printk.h>
> -#include <linux/seq_file.h>
>  #include <linux/device.h>
>  #include <linux/dynamic_debug.h>
>  
> @@ -36,6 +35,7 @@
>  
>  struct debugfs_regset32;
>  struct drm_device;
> +struct seq_file;
>  
>  /* Do *not* use outside of drm_print.[ch]! */
>  extern unsigned long __drm_debug;

Looks like this broke komeda and omapdrm on arm:

/home/notro/develop/dim-linux/src/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c:
In function ‘komeda_pipeline_dump_register’:
/home/notro/develop/dim-linux/src/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c:366:9:
error: implicit declaration of function ‘seq_printf’; did you mean
‘drm_printf’? [-Werror=implicit-function-declaration]
  366 |         seq_printf(sf, "\n======== Pipeline-%d ==========\n",
pipe->id);
      |         ^~~~~~~~~~
      |         drm_printf

/home/notro/develop/dim-linux/src/drivers/gpu/drm/omapdrm/omap_fb.c: In
function ‘omap_framebuffer_describe’:
/home/notro/develop/dim-linux/src/drivers/gpu/drm/omapdrm/omap_fb.c:325:9:
error: implicit declaration of function ‘seq_printf’; did you mean
‘drm_printf’? [-Werror=implicit-function-declaration]
  325 |         seq_printf(m, "fb: %dx%d@%4.4s\n", fb->width, fb->height,
      |         ^~~~~~~~~~
      |         drm_printf

Noralf.
