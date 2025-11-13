Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E29D0C56E96
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 11:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287D310E5E6;
	Thu, 13 Nov 2025 10:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8935F10E348
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 10:40:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A92012FC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 02:39:59 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E26C73F5A1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 02:40:06 -0800 (PST)
Date: Thu, 13 Nov 2025 10:39:58 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Abhishek Rajput <abhiraj21put@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/komeda: Convert logging in komeda_event.c to drm_*
 with
Message-ID: <aRW1fobS0XbAJPTF@e110455-lin.cambridge.arm.com>
References: <20251113100623.162327-1-abhiraj21put@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251113100623.162327-1-abhiraj21put@gmail.com>
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

On Thu, Nov 13, 2025 at 03:36:23PM +0530, Abhishek Rajput wrote:
> Replace the DRM_ERROR() call in
> drivers/gpu/drm/arm/display/komeda/komeda_event.c with the corresponding
> drm_err() helper that uses the existing drm_device parameter.
> 
> Using drm_err() allows the DRM core to prefix log messages with the
> specific DRM device name and instance, which helps distinguish logs when
> multiple display controllers are present.
> 
> This change aligns komeda_event.c with the DRM TODO item:
> "Convert logging to drm_* functions with drm_device parameter".
> 
> Signed-off-by: Abhishek Rajput <abhiraj21put@gmail.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_event.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_event.c b/drivers/gpu/drm/arm/display/komeda/komeda_event.c
> index 53f944e66dfc..78a4a78d1fab 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_event.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_event.c
> @@ -148,7 +148,7 @@ void komeda_print_events(struct komeda_events *evts, struct drm_device *dev)
>  		komeda_sprintf(&str, ", pipes[1]: ");
>  		evt_str(&str, evts->pipes[1]);
>  
> -		DRM_ERROR("err detect: %s\n", msg);
> +		drm_err(dev, "err detect: %s\n", msg);
>  		if ((err_verbosity & KOMEDA_DEV_PRINT_DUMP_STATE_ON_EVENT) &&
>  		    (evts_mask & (KOMEDA_ERR_EVENTS | KOMEDA_WARN_EVENTS)))
>  			drm_state_dump(dev, &p);
> -- 
> 2.43.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
