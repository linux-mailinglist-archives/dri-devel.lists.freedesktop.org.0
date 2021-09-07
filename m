Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39794402BCD
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 17:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EC4894E0;
	Tue,  7 Sep 2021 15:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5486C894E0
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 15:29:46 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 k12-20020a056830150c00b0051abe7f680bso13261762otp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 08:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SV1TPA5lKuZ35qLAlTD+kxWyUMAsU+YEjCDjfEIUf+4=;
 b=Aoa1jEvG7jdKeVQUqVBydU3JA6KkhACVHx0MJw98XmSrsG0frH2CmDxd/DzsgZ16a6
 FoiVSEVEq2RAZbllmoDpHmIhBe3tTBUtHcyv81mJeD9v14TcJUpYWarklKf/vbv+pIdN
 11ClWM3q4WgfUTomLLNaIaHX3dP7GgaxLwidK8+iS48I4SABWw+mDV843FDycNgsqv5W
 fwjAtFdeH/K2gTvA3wHwjkMrmS1bwD87V3WPr+jVdnUzJgdGfRV1pbHYfPnxUkjt1hLf
 tFZ8Ux3c2aMbk5re0/s4oAUIrwtCfQM0Lv/q2RwDdMpXkGRzo55AJsFNOaTftNnogtA1
 U9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SV1TPA5lKuZ35qLAlTD+kxWyUMAsU+YEjCDjfEIUf+4=;
 b=qSGPns/0XmBE+6dvMNqDsK97NTrPq0x/FaPUxzPnw0aR56ppbxiwHyfKn31luZ8QRP
 8yRm5bYE7cARbqHKLPDkwR14ldrrJgpUV3CSIo5lG+WjMu8sN4VhjeVkb0t+I97sbg6G
 gewG+xURd+tsg7R0UTQ42HaBcGdFj6uSf3tuj4WlC/WL94FHmXIDzv/wIVzTn2FGOKbz
 MyvBAbun0qSjyEmbE2i/ykbCFSarVrQKUn7eCBIw3//En0ZA9M6qmT4mfkviO7+tDdJ1
 UzI23Nzf8P1IVkV8w7HgnKgtrkiY0bp/TvVBVcS+ahW8328383CvXfPkvHZXpupmEUW4
 Yqzw==
X-Gm-Message-State: AOAM533pPAwKLkS87r5NWObiAX7SLp++nDwBeRW3mtuxtmyyfE+7aQL3
 orCaPmxFdZHEu6cyp546ltsvmj9SEtqCYUndr6lKWLqLp78=
X-Google-Smtp-Source: ABdhPJzbHg/9j5p3oNU41ZWNS5anjNxwizXPaXD0jpCpUSFc4m1NqfOkpvJdnG7CncZeMNzn18q80t1j5R5lEZewXws=
X-Received: by 2002:a05:6830:25d3:: with SMTP id
 d19mr16033279otu.357.1631028585641; 
 Tue, 07 Sep 2021 08:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210907080135.101452-1-christian.koenig@amd.com>
 <20210907080135.101452-5-christian.koenig@amd.com>
In-Reply-To: <20210907080135.101452-5-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 7 Sep 2021 11:29:34 -0400
Message-ID: <CADnq5_OMdszsCo41vBxFS9pMRD3TkOkog0OEO1nJgxb0ixdJWg@mail.gmail.com>
Subject: Re: [PATCH 5/8] drm/ttm: enable TTM resource object kerneldoc v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 matthew.william.auld@gmail.com
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

On Tue, Sep 7, 2021 at 4:01 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Fix the last two remaining warnings and finally enable this.
>
> v2: add caching enum link
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  Documentation/gpu/drm-mm.rst   | 9 +++++++++
>  include/drm/ttm/ttm_resource.h | 6 ++----
>  2 files changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index 3da81b7b4e71..66d24b745c62 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -43,6 +43,15 @@ TTM device object reference
>  .. kernel-doc:: drivers/gpu/drm/ttm/ttm_device.c
>     :export:
>
> +TTM resource object reference
> +-----------------------------
> +
> +.. kernel-doc:: include/drm/ttm/ttm_resource.h
> +   :internal:
> +
> +.. kernel-doc:: drivers/gpu/drm/ttm/ttm_resource.c
> +   :export:
> +
>  The Graphics Execution Manager (GEM)
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resourc=
e.h
> index 32c5edd9e8b5..5952051091cd 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -103,10 +103,7 @@ struct ttm_resource_manager_func {
>   * struct ttm_resource_manager
>   *
>   * @use_type: The memory type is enabled.
> - * @flags: TTM_MEMTYPE_XX flags identifying the traits of the memory
> - * managed by this memory type.
> - * @gpu_offset: If used, the GPU offset of the first managed page of
> - * fixed memory or the first managed location in an aperture.
> + * @use_tt: If a TT object should be used for the backing store.
>   * @size: Size of the managed region.
>   * @func: structure pointer implementing the range manager. See above
>   * @move_lock: lock for move fence
> @@ -144,6 +141,7 @@ struct ttm_resource_manager {
>   * @addr:              mapped virtual address
>   * @offset:            physical addr
>   * @is_iomem:          is this io memory ?
> + * @caching:           See enum ttm_caching
>   *
>   * Structure indicating the bus placement of an object.
>   */
> --
> 2.25.1
>
