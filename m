Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7425440012A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 16:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4BF86E89C;
	Fri,  3 Sep 2021 14:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBA06E89C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 14:22:56 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id b4so4658323qtx.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 07:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KRTbApTgn1Xl+eRMSbQgs/62WR8DfeoMr7GRB6FGjwg=;
 b=MbCqJiShdytOif7aDolTPMn+uW4ZDeBV/EPRomGDdaiWRZq4sO+sAbDKRR93ib/MFW
 5TBKuulYNqecNZ0Jk2pd1BnSKqpYpNn2DyZlkl3+uXP607jZpKzkk7fI5maJLTJxl4or
 J8IMzeWAGg52wsG1kMAdpBsBYdscbCK34pP83FlMk2Whm8howTbieiJPj87TEfrjuf6F
 PCv+2t9AIMuy6o83DlnJxqPeo9iDFU2BD6rv6HSRWHWHukiDvimt2DcUKVmJeihBjx9P
 /cupnGCaUGUT4Eus/Km6j0t9wnCFl2Ac7pfglwKiN/iPXxyFzmLULIEcIUhaJP2+Xy77
 jq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KRTbApTgn1Xl+eRMSbQgs/62WR8DfeoMr7GRB6FGjwg=;
 b=anbkbZfF/c9VGN2I0SUxSK6McTfkHEIWo1g9pktuuGWDgkX1VXJVuwj/pskgTiK4JF
 qDsfqpux2D9aFibfONOXvIrykl5zLG9Z7j7I78ZOxTB9lTCodVq0Ba6fku4XcWGu92W9
 p7P3zTBHj/UmOeObrqI/DiRN0p4UHooMIop2GoLuriYIZu6nlsS5a3U7qLzpdZ1efgTy
 r2L3wnCEUOsRSzUWlfnkgwc4HhSKDCuxkDoUXBJuAPH54JMF2KZ4f07H5gAaOmctcTb9
 uyjUgOGpjDyyjy+Xn8nIK6eu084xNIbhLUMs5/NVS/BJBGkBTxVtDpGsK7K5NSY0o9Na
 hI5A==
X-Gm-Message-State: AOAM533mDvFq1Ls8XWwkMCSvsBjL7S52v4gol4ZZhFN1czZOGm/Z9ea6
 hi0GZyPTqu27JvwQctdVgMYmxDOeKTf/hRETmezfs/YvKiI=
X-Google-Smtp-Source: ABdhPJwQCKw4OUSAjz6trYmEcGB3rPgaZRWb/ILXtqu9G7AG3PlL5nPGqThXszAvWf8ZppKnlxLGBLUzMHpo9PIei/U=
X-Received: by 2002:a05:622a:394:: with SMTP id
 j20mr4042150qtx.196.1630678975280; 
 Fri, 03 Sep 2021 07:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210903123123.116575-1-christian.koenig@amd.com>
In-Reply-To: <20210903123123.116575-1-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 3 Sep 2021 15:22:27 +0100
Message-ID: <CAM0jSHMdNUbbE2EzFnpfaVJn6gg2JEiPUL=qV2STmgEtfoEsjQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/ttm: remove the outdated kerneldoc section
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
> Clean up to start over with new and more accurate documentation.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

For the series,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

We could maybe also bring in ttm_pool.[ch]? It looks like it already
has near complete kernel-doc?

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
