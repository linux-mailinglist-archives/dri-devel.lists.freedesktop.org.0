Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EBB7EB172
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 15:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BFE10E202;
	Tue, 14 Nov 2023 14:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABA410E202
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 14:04:34 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3b3f6dd612cso3299830b6e.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 06:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699970674; x=1700575474; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1qlOleY1sx1uSAUuif2xWluY3/a1BG3eRXZXp2fHeOw=;
 b=jjSFOtZifWZ0IfIb7x4uMgexNfBwUujvnqPnBTRS5kzp2hCFEcgRq7AXko7jcBCsUP
 zA7EyDj7kZTt71mLlh0/mvsTGlS42UgqgyQZ9f5GF5RBXXTCZdh3DCDryYxQ76qX6du2
 dUR8HIYZvGhxRUKxNbpd7KMGgwT1NU8pMrGcrMGTlkgQiuK9wQc12Ln/NtVBkbc7C/6s
 O/tnnV26mDi9izlA7wW/xZhCCNI+WVmUF7+NXhuVY2wRWlbieBjWECMfZRJPPT8dFd0T
 bzkR1/Rmj7687PHQOetBWZzQXDnGBNZ/vTbwd6g/kBA2nzejnZ19rwxIUqgX8QzJkdbc
 yRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699970674; x=1700575474;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1qlOleY1sx1uSAUuif2xWluY3/a1BG3eRXZXp2fHeOw=;
 b=d1soZPMHBWmYETGCzo/zV7Pu6Fgr/cKtlVqSrHZdZ40UZGGAldV+m/K21Iibjf+oVy
 QJhaKhkKbP7epCNhduuy6bHInV97EBpVmX9SpuxzQf9MKeo76t1TyQK5BOuCgxX81l92
 Gi2k3MNR4pt414JOpJbA+gpkQwxyHuaW6CYGX9GBC9bxk3cIBo8hWrgZMM2PMaNKog69
 4COFfqAr35HKG3I2v39/mATJpcbY8SJYKd4HzGNpc+3Gyy7oGh9AldXT5y43cBNrieTj
 sxsF1EYh7VyNq8Jt1STc32hP8e6HyD741rGn0wUaR+lU5A+GjNlxZII2smwUxUnxbB1S
 uJzg==
X-Gm-Message-State: AOJu0YxS+G7SZpAFeoZ6ssm6m7r9aWc7Ye0S2MDXfetzGWjEOWDnVi4T
 4a4PZLqTXP7aooz7u2Li1MVEJAZBfCTFSCXHXIuDsg==
X-Google-Smtp-Source: AGHT+IEqrRkM174mwSoofUNLHBqExjN+6X2fwSMYZl0oH5qHedom76o2Xwq0biyqfX70tQoLsWSZbg0vBTSDPJqoYek=
X-Received: by 2002:a05:6808:320b:b0:3b5:9965:2bc2 with SMTP id
 cb11-20020a056808320b00b003b599652bc2mr13206804oib.23.1699970673856; Tue, 14
 Nov 2023 06:04:33 -0800 (PST)
MIME-Version: 1.0
References: <20231114132713.403443-1-dipamt1729@gmail.com>
In-Reply-To: <20231114132713.403443-1-dipamt1729@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 Nov 2023 16:04:22 +0200
Message-ID: <CAA8EJpo+38OVfnmyE0zqDkVOss5GfPbR52FuObTxswCbtYtkig@mail.gmail.com>
Subject: Re: [PATCH] Remove custom dumb_map_offset implementation in msm driver
To: Dipam Turkar <dipamt1729@gmail.com>
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
Cc: freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, marijn.suijten@somainline.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Nov 2023 at 15:28, Dipam Turkar <dipamt1729@gmail.com> wrote:
>
> Make msm use drm_gem_create_map_offset() instead of its custom
> implementation for associating GEM object with a fake offset. Since,
> we already have this generic implementation, we don't need the custom
> implementation and it is better to standardize the code for GEM based drivers.
>
> Signed-off-by: Dipam Turkar <dipamt1729@gmail.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c |  2 +-
>  drivers/gpu/drm/msm/msm_gem.c | 21 ---------------------
>  drivers/gpu/drm/msm/msm_gem.h |  2 --
>  3 files changed, 1 insertion(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index a428951ee539..86a15992c717 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1085,7 +1085,7 @@ static const struct drm_driver msm_driver = {
>         .open               = msm_open,
>         .postclose          = msm_postclose,
>         .dumb_create        = msm_gem_dumb_create,
> -       .dumb_map_offset    = msm_gem_dumb_map_offset,
> +       .dumb_map_offset    = drm_gem_dumb_map_offset,
>         .gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
>  #ifdef CONFIG_DEBUG_FS
>         .debugfs_init       = msm_debugfs_init,
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index db1e748daa75..489694ef79cb 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -671,27 +671,6 @@ int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
>                         MSM_BO_SCANOUT | MSM_BO_WC, &args->handle, "dumb");
>  }
>
> -int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
> -               uint32_t handle, uint64_t *offset)
> -{
> -       struct drm_gem_object *obj;
> -       int ret = 0;
> -
> -       /* GEM does all our handle to object mapping */
> -       obj = drm_gem_object_lookup(file, handle);
> -       if (obj == NULL) {
> -               ret = -ENOENT;
> -               goto fail;
> -       }
> -
> -       *offset = msm_gem_mmap_offset(obj);

msm_gem_mmap_offset internally has locking around
drm_gem_create_mmap_offset() / drm_vma_node_offset_addr() calls, while
 drm_gem_dumb_map_offset() does not. Thus this patch does more than is
stated in the commit message.

> -
> -       drm_gem_object_put(obj);
> -
> -fail:
> -       return ret;
> -}
> -
>  static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
>  {
>         struct msm_gem_object *msm_obj = to_msm_bo(obj);
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 8ddef5443140..dc74a0ef865d 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -139,8 +139,6 @@ struct page **msm_gem_pin_pages(struct drm_gem_object *obj);
>  void msm_gem_unpin_pages(struct drm_gem_object *obj);
>  int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
>                 struct drm_mode_create_dumb *args);
> -int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
> -               uint32_t handle, uint64_t *offset);
>  void *msm_gem_get_vaddr_locked(struct drm_gem_object *obj);
>  void *msm_gem_get_vaddr(struct drm_gem_object *obj);
>  void *msm_gem_get_vaddr_active(struct drm_gem_object *obj);
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
