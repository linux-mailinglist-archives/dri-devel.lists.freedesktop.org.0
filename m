Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17842405AB5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 18:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A132F6E8AA;
	Thu,  9 Sep 2021 16:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7631B6E8AA
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 16:22:14 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 c19-20020a9d6153000000b0051829acbfc7so3163880otk.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 09:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dk8LIqNkMKGl82jE81VC3NoA+xKnpg42hcpg5ueDGTc=;
 b=a6/uoi81nAynOG7vOwCZGZft4+mgIBMM65lU8eh/Tus+m0G+hOodnr8yNhp8/tKAKk
 DBPmKo42rhq0lxQUvO9EdXH7BE1dtPJrMJbpTWlUbORLSgb5O/j6iXwutaxQvqD+jNH5
 5Lf8yEFIbAGsYCl7XKIgjxlMJd30vR2tDUZ/KQZpLYGCi1/C/4T7QiUx1qDE00yngCfc
 w1e1zJ6VBq5LxfM65o8loC1hiAlUytnCBNzaFLRa+G4DNawlL3mXiDqlSIBku4MZmcWB
 rngQQTX310WJQJs4maic9qsj1o6ziI/kAXdbS/5qQty5qxUFNUxj0X38v0aVkQQMzwZr
 XNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dk8LIqNkMKGl82jE81VC3NoA+xKnpg42hcpg5ueDGTc=;
 b=7zcxojFllcW+FeE1CGwcz21+KbcwRlYuYQcOXcLnM3yciyyp/YT5r8jNGWVzSMSZ2U
 5qIO24BrEEOaPNPK68rCOaJMIV0mIUfe17w8Z2pcB61Zob042h5mDdupFIYgga5AmCC0
 ltrL7l6cmrrtoFcH8cRqYtbxuXOyRjw7igU0GCGuBasfxxnTFlu4kH0k1CBKBZNl5fm8
 qiqfIbGHMUqa4Kbx/uSm9YPeE7TlMh1+eX+x6sqFYHDIpQ7TXdvvEDwYk2d2EfOkjlGN
 FIu2hY6RhvKDWxRt9LuGhTl543WWj11vkZqexmcIgY/6P4ZTXeTg44Jvv2118tPL1Y/B
 FvDQ==
X-Gm-Message-State: AOAM531CQlno3n54jmmCzvo9EwIlobLQRe+WpJq2qcfWHtk6057xMdF/
 torRs/YiDsLGrY4BhJewbjT7akbw106paOku9fRkEDxd
X-Google-Smtp-Source: ABdhPJxPOD53zWKTaD2I+4cwD6KkOHms50C5XZFpL3zMfSmKZI//XEBP3t6C56+fSTjQQA92u7MWebaB3AWRlmuzCXU=
X-Received: by 2002:a05:6830:25d3:: with SMTP id
 d19mr563519otu.357.1631204533698; 
 Thu, 09 Sep 2021 09:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210908132933.3269-1-christian.koenig@amd.com>
 <20210908132933.3269-2-christian.koenig@amd.com>
In-Reply-To: <20210908132933.3269-2-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 Sep 2021 12:22:02 -0400
Message-ID: <CADnq5_P6PNdeqeUgx=u-KzSLhWuk=9zTEBvJkGg=7kfJdH2==w@mail.gmail.com>
Subject: Re: [PATCH 1/8] drm/ttm: remove the outdated kerneldoc section
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 matthew.william.auld@gmail.com, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Sep 8, 2021 at 9:29 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Clean up to start over with new and more accurate documentation.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  Documentation/gpu/drm-mm.rst | 49 ------------------------------------
>  1 file changed, 49 deletions(-)
>
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index 0198fa43d254..8ca981065e1a 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -30,55 +30,6 @@ The Translation Table Manager (TTM)
>
>  TTM design background and information belongs here.
>
> -TTM initialization
> -------------------
> -
> -    **Warning**
> -    This section is outdated.
> -
> -Drivers wishing to support TTM must pass a filled :c:type:`ttm_bo_driver
> -<ttm_bo_driver>` structure to ttm_bo_device_init, together with an
> -initialized global reference to the memory manager.  The ttm_bo_driver
> -structure contains several fields with function pointers for
> -initializing the TTM, allocating and freeing memory, waiting for command
> -completion and fence synchronization, and memory migration.
> -
> -The :c:type:`struct drm_global_reference <drm_global_reference>` is made
> -up of several fields:
> -
> -.. code-block:: c
> -
> -              struct drm_global_reference {
> -                      enum ttm_global_types global_type;
> -                      size_t size;
> -                      void *object;
> -                      int (*init) (struct drm_global_reference *);
> -                      void (*release) (struct drm_global_reference *);
> -              };
> -
> -
> -There should be one global reference structure for your memory manager
> -as a whole, and there will be others for each object created by the
> -memory manager at runtime. Your global TTM should have a type of
> -TTM_GLOBAL_TTM_MEM. The size field for the global object should be
> -sizeof(struct ttm_mem_global), and the init and release hooks should
> -point at your driver-specific init and release routines, which probably
> -eventually call ttm_mem_global_init and ttm_mem_global_release,
> -respectively.
> -
> -Once your global TTM accounting structure is set up and initialized by
> -calling ttm_global_item_ref() on it, you need to create a buffer
> -object TTM to provide a pool for buffer object allocation by clients and
> -the kernel itself. The type of this object should be
> -TTM_GLOBAL_TTM_BO, and its size should be sizeof(struct
> -ttm_bo_global). Again, driver-specific init and release functions may
> -be provided, likely eventually calling ttm_bo_global_ref_init() and
> -ttm_bo_global_ref_release(), respectively. Also, like the previous
> -object, ttm_global_item_ref() is used to create an initial reference
> -count for the TTM, which will call your initialization function.
> -
> -See the radeon_ttm.c file for an example of usage.
> -
>  The Graphics Execution Manager (GEM)
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> --
> 2.25.1
>
