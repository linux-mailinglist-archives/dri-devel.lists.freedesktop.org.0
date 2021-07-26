Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5AD3D54F7
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 10:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6E56E88C;
	Mon, 26 Jul 2021 08:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443576E85A;
 Mon, 26 Jul 2021 08:12:44 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id d9so6406867qty.12;
 Mon, 26 Jul 2021 01:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SsA9p+TlYc08mbezt8A+26M/ZO1fyw9OG86zFTtyUXM=;
 b=KkWctV18CVEq2vH59MJaoWOLcyHmRcShy7FEAtkhjgw7A4z2yVlGKhCINM1yShHR+e
 B0/X6KyAUTrAjOUtqfUUyPvM7DMhHd5hwixt9w+I00XU4czUbR5U/aN86o81T2lTe08q
 SEpfgieNDYuCZluwiQzlzWo0hC0jIPBom6K9HC2zVDs3sAlH3XhL7WTADNdFxTAbtBuP
 UgnVPzSZXi05TdQ3cMb2sncV+BLRGa84/tfyWE/BLHnHIiTlSIPQXDxQjZI4ZlLsNgmM
 1ynNporp+1hE9fqSqocxcu/BIZ+H9vCEQpx6k+NfarGpnucI3Kt7oanm4KEdE01e3Lvu
 lMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SsA9p+TlYc08mbezt8A+26M/ZO1fyw9OG86zFTtyUXM=;
 b=YaTOFwuewqEYw5JOQQ9o4B4cymjSW/43/ceIH7Wqcz6wyTBe8gXZFS7/ns5enHl2Ck
 r2i5MR0pFmrzKGY4bhr9SWExTKwrc4FLVxL1afnZn/7UDBjPxyhWy3wIYcN2dCZ0jvTG
 4JFjBOGPuZ5r9hoDD6JgmoH39p8VjpGmhty3LbmvgV41xCuZt21Spc0Xpc0iHtxqxJ10
 7NShhSYGLKUMBPDr8XDApKQrBzLf1mCO4TZ5INiwYAvFcAmKTmVoqQxF2qez6TdJyVF2
 f49ITrb75Gp+52ldIN7CWrmtXi4JwBVgJB/D6OSGcAZZOktbXGzYxW2FDeMRQIV1i561
 uXVQ==
X-Gm-Message-State: AOAM530il6JkIn9yzAQjuDlCW8MX4xls/Efdah+umrxDLlUa/Tj/jWzs
 vQb1wo8qJNQnXUK30JM7jdjZxixmSadiNBufRoU=
X-Google-Smtp-Source: ABdhPJzEkjcjUfybN+sVjzKRPAJLofqlutHNjkHGm507taDFp9wG0pz4fdU4qNt88wqCjBDUbsL3aQt+mSOygY8i23E=
X-Received: by 2002:ac8:584d:: with SMTP id h13mr14132202qth.341.1627287163454; 
 Mon, 26 Jul 2021 01:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210723172142.3273510-1-jason@jlekstrand.net>
In-Reply-To: <20210723172142.3273510-1-jason@jlekstrand.net>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 26 Jul 2021 09:12:17 +0100
Message-ID: <CAM0jSHOgJQni53DJWP0NWJTAR82PNmb6zgt2Gm-faBd1sDaSHA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 0/8] drm/i915: Migrate memory to SMEM when
 imported cross-device (v8)
To: Jason Ekstrand <jason@jlekstrand.net>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 23 Jul 2021 at 18:21, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> This patch series fixes an issue with discrete graphics on Intel where we
> allowed dma-buf import while leaving the object in local memory.  This
> breaks down pretty badly if the import happened on a different physical
> device.
>
> v7:
>  - Drop "drm/i915/gem/ttm: Place new BOs in the requested region"
>  - Add a new "drm/i915/gem: Call i915_gem_flush_free_objects() in i915_ge=
m_dumb_create()"
>  - Misc. review feedback from Matthew Auld
> v8:
>  - Misc. review feedback from Matthew Auld
> v9:
>  - Replace the i915/ttm patch with two that are hopefully more correct
>
> Jason Ekstrand (6):
>   drm/i915/gem: Check object_can_migrate from object_migrate
>   drm/i915/gem: Refactor placement setup for i915_gem_object_create*
>     (v2)
>   drm/i915/gem: Call i915_gem_flush_free_objects() in
>     i915_gem_dumb_create()
>   drm/i915/gem: Unify user object creation (v3)
>   drm/i915/gem/ttm: Only call __i915_gem_object_set_pages if needed
>   drm/i915/gem: Always call obj->ops->migrate unless can_migrate fails
>
> Thomas Hellstr=C3=B6m (2):
>   drm/i915/gem: Correct the locking and pin pattern for dma-buf (v8)
>   drm/i915/gem: Migrate to system at dma-buf attach time (v7)

Should I push the series?

>
>  drivers/gpu/drm/i915/gem/i915_gem_create.c    | 177 ++++++++--------
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  58 ++++--
>  drivers/gpu/drm/i915/gem/i915_gem_object.c    |  20 +-
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |   4 +
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  13 +-
>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 190 +++++++++++++++++-
>  .../drm/i915/gem/selftests/i915_gem_migrate.c |  15 --
>  7 files changed, 341 insertions(+), 136 deletions(-)
>
> --
> 2.31.1
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
