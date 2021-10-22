Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F32CB4373C1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 10:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1756E575;
	Fri, 22 Oct 2021 08:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D456E575;
 Fri, 22 Oct 2021 08:39:41 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id r15so3898207qkp.8;
 Fri, 22 Oct 2021 01:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qhJwM3Hz28ZevvoHoUJUGs0FBBITYEtpwNOdUuRSac8=;
 b=fskGz8VJY5QMHf7+PZtHJFJtbkygWDvY5WHuquvsu3VugjbYu9pS+EkvFRg3ZNftY6
 6eVNVxNyQj1BLNAHv6H7lbdclYr8HrbaAmkVQduMNdiz0U8TTGektEu5JcfQYLpiXUdH
 BUJZluKd+Y22o+H5GfX+cc+GleJ0qlyeeXAfor9XIO7Tqkfka8ZHjj9e4FF7UQI9q0Hc
 w5qBq3su/Z0r/TzMS7u7yzLgHi+VJmG1SEAWjGZXHZHBxr/arJ1gfjGmeyb7i+ng1hUy
 zCNjr73uO6PAbRct5HYdCLOed9wyYHs1vhUvYj9DZP0ss3uJHc61okBk/46g9BuMSB/Q
 FGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qhJwM3Hz28ZevvoHoUJUGs0FBBITYEtpwNOdUuRSac8=;
 b=doYdrUm8enZ5/DhdxmzYQYVUdlCC7JDpp9U2RgMM+xBDaeGj8R+d+zb8/6kDulTvhc
 d9jfTtyPNDnCqErLV/9FCHHulbryT91cDc6JYVasMQK4OTlI/GFEHVut5Qdu2osX1Zn1
 niDDVl4z03Tnd32x4srw3AtTJ7zrNUt0uKUteX6hcstHFvosjcoVglJTnffhd6yLHE8I
 aFBOimmDDOJ+WtgYURx+9RhzwApferQ6qGwPOBvdSn+CRxrpBSGjRXiUAItMgZ4TVhmN
 F3LoAR22uHodW33BhT7Nv3Xe8qICKM2MdSkouAqY7gG6fCgtNz21iTrwhvQDKeNmWHJB
 U03g==
X-Gm-Message-State: AOAM532gNm9i49/MNv7KlOO3jlPzZe5h/wDCDAhddicL53zAHUteOa3c
 qAfPn9c98ExO4p4Ff5d1rvYc65V96jPoFZS8OKg=
X-Google-Smtp-Source: ABdhPJwc9c/OO72WTKGkd9/efEYSwm8X8DPQUNRgD8wtWL5QpGV/qBxmIKtP431HLl/XtowD/G3qFlBpPkFu6aB+u3s=
X-Received: by 2002:a37:857:: with SMTP id 84mr8659620qki.342.1634891980944;
 Fri, 22 Oct 2021 01:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211022082200.2684194-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20211022082200.2684194-1-daniel.vetter@ffwll.ch>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 22 Oct 2021 09:39:13 +0100
Message-ID: <CAM0jSHOm-fhS_ANcoU+_vOa2=9ewFk+mqPr0XKU5jxQB6WxonQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i195: Remove some dead struct fwd decl
 from i915_drv.h
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Oct 2021 at 09:22, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Gone with userptr rewrite by Maarten in ed29c2691188 ("drm/i915: Fix
> userptr so we do not have to worry about obj->mm.lock, v7.")
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

s/i195/i915/

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_drv.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 12256218634f..2321f895cdea 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -191,8 +191,6 @@ struct i915_hotplug {
>          I915_GEM_DOMAIN_VERTEX)
>
>  struct drm_i915_private;
> -struct i915_mm_struct;
> -struct i915_mmu_object;
>
>  struct drm_i915_file_private {
>         struct drm_i915_private *dev_priv;
> --
> 2.33.0
>
