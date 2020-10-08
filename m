Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A5D287636
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 16:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1836EA69;
	Thu,  8 Oct 2020 14:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D000B6EA69
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 14:38:17 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d4so6693300wmd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 07:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1H55B28CMkgUZS6Qu3gEflWXHCUoQhahHi1xNJrTLmc=;
 b=lSHdgIUXbiB+/312bukdA2pLz3/W4k+ySXDevHgdDYyAlgw/GxEe6tKsH3FnRTkdRC
 BPZ+qHcusxtXEK8wNbURvtswpjLUKdw+yaUQWpxxiD6W0CS1kuZlbuf1eDX45JtZ+Mq0
 WszpqUeO4/Kh/Iug+j5e1hDszWDNMOvE/v1w6fVgI9nuAZJIES5fkPsYto3tJieHQ16c
 EUtegHbgVrA+EBXVw2+NY3HpCMjEgyA04pUgeDwJpBTgZ+awcgJo0vJYOSwBbtAJpYhX
 m2zztPlX++HkDSWGbqh371m5VC3SUuIb+SM9TJVgUGP6XF/9x+pKI1bHUC0gaMWSZJ2m
 JDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1H55B28CMkgUZS6Qu3gEflWXHCUoQhahHi1xNJrTLmc=;
 b=jzzl3AuUGflyByoP0B2a3qNQXWd53d3lMpX3N2X2Fwby5EcjopiJ8vHxAuYkda2Ues
 D7KYr/CS1ZRIygzhE6FC3LNWzScSOpNJAFCXf9SZwYlGZi0nxAvtA0QM7ACKY94Uxa6I
 +AMK4HYHv6sHz7V3CfFplhkOwZmwziPPHUTSIkJWKIcpHB/PVPhfoN4l4zj20S1OSusD
 z1LLtM7kbu/pqx4PpbR9IvFbgcjdofi5OYTNwN8zi4K0jQWC51Lh+vmu7VZ6j9xAe9C6
 FV4/jHJQW0vt/6B8IGGtkYrn2vlTmCP600pM70W+QOHQRQKOg6MbBDp5ole9tU6amo9A
 M9Tg==
X-Gm-Message-State: AOAM530Fp2jppYzbYV56ugoKnlheGWdON0LIzqICAUqb0JfMwlgZHW7n
 iH/dowVEojWDNIiKM0rM6PA1GLqyz/zYVbaoVCk=
X-Google-Smtp-Source: ABdhPJwCV5JKzXj3MhvT0BvxnejRcJ+IS9pe1TH+ZlwBVUOg/Pg4uTOhYIcty2PV06Q6ZMSNS93gZN4bTSmNVepgI/o=
X-Received: by 2002:a1c:a184:: with SMTP id k126mr9135632wme.39.1602167896530; 
 Thu, 08 Oct 2020 07:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201008142927.2819321-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20201008142927.2819321-1-daniel.vetter@ffwll.ch>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Oct 2020 10:38:05 -0400
Message-ID: <CADnq5_NedFqTz7k8LNOgC-XBUNta+dAR3H69h0WZPpndmTneDA@mail.gmail.com>
Subject: Re: [PATCH] drm: Give irq_by_busid drm_legacy_ prefix
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 8, 2020 at 10:29 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> It's the only ioctl handler purely for legacy drivers that didn't have
> this yet.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/drm_internal.h | 8 ++++----
>  drivers/gpu/drm/drm_ioctl.c    | 2 +-
>  drivers/gpu/drm/drm_pci.c      | 6 +++---
>  3 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index b65865c630b0..2bdac3557765 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -53,15 +53,15 @@ void drm_lastclose(struct drm_device *dev);
>  #ifdef CONFIG_PCI
>
>  /* drm_pci.c */
> -int drm_irq_by_busid(struct drm_device *dev, void *data,
> -                    struct drm_file *file_priv);
> +int drm_legacy_irq_by_busid(struct drm_device *dev, void *data,
> +                           struct drm_file *file_priv);
>  void drm_pci_agp_destroy(struct drm_device *dev);
>  int drm_pci_set_busid(struct drm_device *dev, struct drm_master *master);
>
>  #else
>
> -static inline int drm_irq_by_busid(struct drm_device *dev, void *data,
> -                                  struct drm_file *file_priv)
> +static inline int drm_legacy_irq_by_busid(struct drm_device *dev, void *data,
> +                                         struct drm_file *file_priv)
>  {
>         return -EINVAL;
>  }
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 87a44492957e..6def1621e32a 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -578,7 +578,7 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>         DRM_IOCTL_DEF(DRM_IOCTL_VERSION, drm_version, DRM_RENDER_ALLOW),
>         DRM_IOCTL_DEF(DRM_IOCTL_GET_UNIQUE, drm_getunique, 0),
>         DRM_IOCTL_DEF(DRM_IOCTL_GET_MAGIC, drm_getmagic, 0),
> -       DRM_IOCTL_DEF(DRM_IOCTL_IRQ_BUSID, drm_irq_by_busid, DRM_MASTER|DRM_ROOT_ONLY),
> +       DRM_IOCTL_DEF(DRM_IOCTL_IRQ_BUSID, drm_legacy_irq_by_busid, DRM_MASTER|DRM_ROOT_ONLY),
>
>         DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_GET_MAP, drm_legacy_getmap_ioctl, 0),
>
> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> index c250fb5a88ca..6dba4b8ce4fe 100644
> --- a/drivers/gpu/drm/drm_pci.c
> +++ b/drivers/gpu/drm/drm_pci.c
> @@ -139,7 +139,7 @@ static int drm_pci_irq_by_busid(struct drm_device *dev, struct drm_irq_busid *p)
>  }
>
>  /**
> - * drm_irq_by_busid - Get interrupt from bus ID
> + * drm_legacy_irq_by_busid - Get interrupt from bus ID
>   * @dev: DRM device
>   * @data: IOCTL parameter pointing to a drm_irq_busid structure
>   * @file_priv: DRM file private.
> @@ -150,8 +150,8 @@ static int drm_pci_irq_by_busid(struct drm_device *dev, struct drm_irq_busid *p)
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int drm_irq_by_busid(struct drm_device *dev, void *data,
> -                    struct drm_file *file_priv)
> +int drm_legacy_irq_by_busid(struct drm_device *dev, void *data,
> +                           struct drm_file *file_priv)
>  {
>         struct drm_irq_busid *p = data;
>
> --
> 2.28.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
