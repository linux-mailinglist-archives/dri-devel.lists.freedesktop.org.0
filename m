Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC7B55A16C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 21:21:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A84810E4AD;
	Fri, 24 Jun 2022 19:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A1C10E7D8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 19:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=vXLKoqK/rHhAwUvzyC5mmSWvQu6UM2h+wo+BaSp548I=;
 b=tm38uwoaSMSJNMUvGRur9rJ0Z00imE8H2am13QSZ+o4AiIEHSYdSihNIqWxykJTIqg7xi/IwyuHoN
 /7lL0vGKqRajr+ocFPPVUc3p67apgf5+KmGMZn8EFwlwA4POpz3N9qZOLekgmstrC/ddVpCuJgsxP2
 kv7ALAg3NHjsgrkVeMBUuZvDi8CBYw4cSxFqU8dXDyznt7hi4kc4VDHHT9mLndaxEHnCYPgGb4Pk6t
 VicoFBnIhfMlF+aE/Fe9y07TcNWLJdNR4Vimr2Gid0Ow9sZNOKzFWV9sK/4vqQPuqKITnrU/j8cFej
 hDSplyceX8hcBpP6Whz74zLeZVGPvTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=vXLKoqK/rHhAwUvzyC5mmSWvQu6UM2h+wo+BaSp548I=;
 b=YdGbOeEP64dONVYEKH6W0GzV4c4auh0E/ihNRMesDyNBkDCgOHMYB3Gi3SY/hl+jnOEkWlUcERxRp
 hVg/CVYCg==
X-HalOne-Cookie: d38b4eda7381997d81ac0c7cf90c171ee506e8c8
X-HalOne-ID: cc54b654-f3f2-11ec-a6c4-d0431ea8a283
Received: from mailproxy2.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id cc54b654-f3f2-11ec-a6c4-d0431ea8a283;
 Fri, 24 Jun 2022 19:21:08 +0000 (UTC)
Date: Fri, 24 Jun 2022 21:21:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 04/68] drm/connector: Reorder headers
Message-ID: <YrYOotdDalSPV/3r@ravnborg.org>
References: <20220622143209.600298-1-maxime@cerno.tech>
 <20220622143209.600298-5-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622143209.600298-5-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 22, 2022 at 04:31:05PM +0200, Maxime Ripard wrote:
> Unlike most of the other files in DRM, and Linux in general, the headers in
> drm_connector.c aren't sorted alphabetically. Let's fix that.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/drm_connector.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 1c48d162c77e..353d83ae09d3 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -22,14 +22,14 @@
>  
>  #include <drm/drm_auth.h>
>  #include <drm/drm_connector.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_encoder.h>
> -#include <drm/drm_utils.h>
> -#include <drm/drm_print.h>
> -#include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_print.h>
>  #include <drm/drm_privacy_screen_consumer.h>
>  #include <drm/drm_sysfs.h>
> +#include <drm/drm_utils.h>
>  
>  #include <linux/uaccess.h>
>  
> -- 
> 2.36.1
