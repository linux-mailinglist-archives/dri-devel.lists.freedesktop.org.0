Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAE85B1E4F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 15:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C51310E9C4;
	Thu,  8 Sep 2022 13:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB0210E9C4;
 Thu,  8 Sep 2022 13:14:49 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-11e9a7135easo44199993fac.6; 
 Thu, 08 Sep 2022 06:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=PKx0v8N9YvEdbCnl3VJ9cuH9xcqQx+VnjaIOLPR9Czk=;
 b=ZS/7JbXh65BNH4t6OPVZOW0t4raGc4c7dXcoWt2lmQ6mrH6/aE31PuYG0HeXHOq+Ub
 9oMQP+1k0cZrL/tYzvk2occ2c38JKtrEaRktgSx8eK7puJKnmTWkzu9gxA9uKwjM1im3
 3MqqaMBOgxL3Y6fBoIPlbo4O2GQ1iiTxSaeybjEaxO2d0tpa0XhK1mtdieziqctGY7/C
 6ZXXhX47Y7tPFr1MujrwSnTDmfMTXjURsqzv8PWl+X1kzza1gISo70QeB7Utaq7ZtUU9
 5/ySsPZo6J5vTXXXnUrTugE6VNAoUXY1KuxRk6bPZ/Y3USReD+noLy1OyIiKXOAS49KW
 6YCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=PKx0v8N9YvEdbCnl3VJ9cuH9xcqQx+VnjaIOLPR9Czk=;
 b=e3JzfjSvR/pJ8+/tIlvGt+cWZk0oZPB/IQX3Ll83CHBdckibw/iwu27UhYGTRdJNdk
 vTZ+z+Y47tVoNXMBMCRO9cpnC1K+TbgyodwQ2RqvdLFIZNY8AyXE+1ux7laigKbzZGgX
 TOgipYCx1tmcWHizlkEHygS4yY9MTjVNkfATFfg2lGvA6pzZzeC2HJrj+c27zzNEIWUo
 AGiRzi73eqztevilFbPB8bKg6OSlkvN1cFPUoKYoTKDEExj1HHsVF5o8FjkqW9mg1GDe
 1O00b/ItO+qWe4emgv7Zqznj0vJfKc3MTMQiC+9DSqYri6jIvSAf4CakrYTln49Ts5Kb
 6T5w==
X-Gm-Message-State: ACgBeo1tfmyl9LTSYHCUxa7Lv1v1jRZA8WgZvWawGOg8FM9Ufdxi04Po
 c2xMxfpQolo8V1CT7/TtIyTK7c7s8EID5F/ItdY=
X-Google-Smtp-Source: AA6agR63axWcWuoiPmLdv7JJo8NQ+7t/OC3Va7LB8HTyVVWAvafafRCGevZ5p9xF6ImC115Oou+1v2eU0FXaaNhWTVY=
X-Received: by 2002:a05:6870:1783:b0:12a:f442:504d with SMTP id
 r3-20020a056870178300b0012af442504dmr335621oae.46.1662642888600; Thu, 08 Sep
 2022 06:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220906195721.143022-1-hamza.mahfooz@amd.com>
In-Reply-To: <20220906195721.143022-1-hamza.mahfooz@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Sep 2022 09:14:37 -0400
Message-ID: <CADnq5_O0W-ipCCy3hsub5GwirjDTM76Xn3kAxgyZT5V+vDguSA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: use dirty framebuffer helper
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Guchun Chen <guchun.chen@amd.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Sean Paul <seanpaul@chromium.org>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Fernando Ramos <greenfoo@u92.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 6, 2022 at 3:58 PM Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>
> Currently, we aren't handling DRM_IOCTL_MODE_DIRTYFB. So, use
> drm_atomic_helper_dirtyfb() as the dirty callback in the amdgpu_fb_funcs
> struct.
>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index c20922a5af9f..5b09c8f4fe95 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -38,6 +38,7 @@
>  #include <linux/pci.h>
>  #include <linux/pm_runtime.h>
>  #include <drm/drm_crtc_helper.h>
> +#include <drm/drm_damage_helper.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_fb_helper.h>
> @@ -496,6 +497,7 @@ bool amdgpu_display_ddc_probe(struct amdgpu_connector *amdgpu_connector,
>  static const struct drm_framebuffer_funcs amdgpu_fb_funcs = {
>         .destroy = drm_gem_fb_destroy,
>         .create_handle = drm_gem_fb_create_handle,
> +       .dirty = drm_atomic_helper_dirtyfb,
>  };
>
>  uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
> --
> 2.37.2
>
