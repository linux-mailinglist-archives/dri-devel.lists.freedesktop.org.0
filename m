Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BDC4000BE
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 15:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADC66E898;
	Fri,  3 Sep 2021 13:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859116E898
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 13:48:40 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id f22so5789061qkm.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 06:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jjnhl+1tSd1nFZ/DpOmRxkX0whO8TXgiMZwhYXnC2Kc=;
 b=mbyFZ+9ewxx8a3qcOIJgg4kZNYE9UHQeTYconmVicBWJr3OCj0Ge2QkYDltRjfUliu
 0g3jJIUwod7rpMXZX/QeXnpshGO/Bq5OEAdRh0NCK8KTzBBvQ3u3edrQ/FuJXdk654hM
 MkD/jX1iovfNrd/LR2/nkgnir5R5oPM8dM6VMo90m+otcjczjEjUzjYdPtYiZ3OqriMt
 Vm1JIEFJprPoaa66mGlTanGAD8/uIu/NvV/artftOSEnEGXntEMUx/Ymh8VQhDb8oKh/
 /cE0BiZ/+SKVR6SkyOP0dzsUhgdrRgD3e1HkwxAT08g3GWU9uyZcLSXNsZBnc77uueZ0
 sIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jjnhl+1tSd1nFZ/DpOmRxkX0whO8TXgiMZwhYXnC2Kc=;
 b=CdwGT6Vi6IXpS/SVz/JkJTI/1+CDYyn4wypyuRLsiKeqcwtvFeDBRZaEdlm+CRYY3Z
 H6q+PKOv1MwE5mI7H+TvOpX92sBCK9OoR3qbIs1CUJ+/5byPmFIwhaDVnDy4UB5DAx7F
 GvwQUrSLUeALbUvvVs/Mde9V84PgPHbhBz7EfuzXcL9GDFld+kPtG5mY+k0Zu7OW78cA
 0SXrsn4CdB2xTwSOGqVUJGX0UGwkALJjEGxl6TwTk2/SwzvHyNrlkcyvWamYP8DYOBTC
 5B0BjTom4VvE0s1/zHuHacg34INUufd6JKjAPI/bLnQ41PdOwO6egm9s2EIX2wmaF4qS
 H6OA==
X-Gm-Message-State: AOAM532f767w8VeRphf4c5iEupxJCZJyMZ/MJwNn7exFyp7aNfthT4AE
 FPruLsuqVohgihLnEiN5Pk8/djz9pUVJAqq2lDvJ8ZQaZlk=
X-Google-Smtp-Source: ABdhPJxnalncn30gx+D1qnPNb6LqPwMxXUOmF88/metHkyOfBw+SaBNz72kdPV6CoBsXxVwVhrcD9lc66KTNFrrPEq0=
X-Received: by 2002:a05:620a:228a:: with SMTP id
 o10mr3507211qkh.342.1630676919625; 
 Fri, 03 Sep 2021 06:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210903123123.116575-1-christian.koenig@amd.com>
 <20210903123123.116575-3-christian.koenig@amd.com>
In-Reply-To: <20210903123123.116575-3-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 3 Sep 2021 14:48:12 +0100
Message-ID: <CAM0jSHPHs3A9x8L91kbpzs-7QvM48nEXG0Swm=QXOVAbav7MBA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/ttm: enable TTM resource object kerneldoc
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
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

On Fri, 3 Sept 2021 at 13:31, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Fix the last two remaining warnings and finally enable this.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  Documentation/gpu/drm-mm.rst   | 9 +++++++++
>  include/drm/ttm/ttm_resource.h | 6 ++----
>  2 files changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index 56b7b581567d..094e367130db 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -39,6 +39,15 @@ TTM device object reference
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
> index 32c5edd9e8b5..255fc8169d9a 100644
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
> + * @caching:           What CPU caching should be used

Maybe add "See enum ttm_caching" or something, so it generates a link,
once we also add kernel-doc for that?

>   *
>   * Structure indicating the bus placement of an object.
>   */
> --
> 2.25.1
>
