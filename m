Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8787736D0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 04:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A00A610E394;
	Tue,  8 Aug 2023 02:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9094410E390;
 Tue,  8 Aug 2023 02:37:17 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5230a22cfd1so6790375a12.1; 
 Mon, 07 Aug 2023 19:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691462236; x=1692067036;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/Pzo/ae8fiZC5mD6rJbJETUk5SqmzLl4qP80bXe4VJw=;
 b=jp1qrrbYROFguZcOFx9Q8zIaj8439PAFQ7zNWYG0iZ0RiVY/dWssDNLrr6irn+1IVi
 0IY+prmE0xcz50IQCnF/HguKEH9Vi5T81s8LnWFPeoUsog6Kh9ajCk0j8NslPILHNN+E
 kUG5oNIUfzmbirknglpMB/MLFr8g56RxYdc6YJBJowu4B+tFY1EgNahw4FcMni62kmdv
 Y9XKLpNrHImDw9nNBB7VsSi/6UHQmuAmSd/WL/am0vqJvPlqmy6jClV2grrAilGUVfvF
 ShNFNDujmkhRvbKePthwC1uMIY5zf/+u7pAV+g5CXRUIF1PU7sw1WnIgxO4Rq/1+Koxk
 HGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691462236; x=1692067036;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Pzo/ae8fiZC5mD6rJbJETUk5SqmzLl4qP80bXe4VJw=;
 b=MWGA7A7hDBQo9eHf2oVhpvONeWdPFbQUU7cRUBrrx1F4BKOnNVqR9jKF5CV7FiYhBY
 Q9FNC0emJvDKeO0hBYcLPvJIwKigSGavi14Hmej4+pkMvGtwvaFSYN5t9+gWPWui1wsg
 tqcOlXeUSNywXPJO9RDHuBI0DztR+QRazRCvQyqbpdoijw+a9q9v6TYYYiEMiym9XeT+
 daO8S9qrmUcOFcxRUhO0x7iimdgto8p+WKD473Db9X3XWtX4ONKV5jis7RomfQPQPX7Q
 88WLodu0HX+W2u7vQxP9+TqdkjWQBcXPAfE09UmpQZTT7AmrTeobRvdpb0tw2jCBjxWD
 2dDQ==
X-Gm-Message-State: AOJu0YzaAHJsN0I7WPHYzO6722IndBMRxceCAX+YhsRtabehaInM6VbW
 8kK+FJTXmzIyrEVF0Z9mrqxFy/2HI5p77QXPBrqZTGvDl9o=
X-Google-Smtp-Source: AGHT+IEh9niFo4xdJ945FQYYzvfAVJ3a7wxVMppL7pEawqEYWNmd2+JTGsKdFCsEX2UI/cKYLZoP0spIVcDaXCc5E8U=
X-Received: by 2002:a17:906:3298:b0:99c:53f:1dc7 with SMTP id
 24-20020a170906329800b0099c053f1dc7mr8795188ejw.54.1691462235711; Mon, 07 Aug
 2023 19:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230807163238.2091-1-dakr@redhat.com>
In-Reply-To: <20230807163238.2091-1-dakr@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 8 Aug 2023 12:37:03 +1000
Message-ID: <CAPM=9twBcE8vRBvjxSSsk23wh246cBFX8jQx5Aap9veLYxOt-g@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next 0/5] Nouveau VM_BIND uAPI Fixes
To: Danilo Krummrich <dakr@redhat.com>
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
Cc: sfr@canb.auug.org.au, kherbst@redhat.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the series:

Reviewed-by: Dave Airlie <airlied@redhat.com>

On Tue, 8 Aug 2023 at 02:32, Danilo Krummrich <dakr@redhat.com> wrote:
>
> The patch series provides a few fixes for the recently merged VM_BIND uAPI
> mostly addressing a couple of warnings.
>
> It also contains one patch to slightly reduce the memory footprint of
> struct nouveau_uvma.
>
> Danilo Krummrich (5):
>   nouveau/dmem: fix copy-paste error in nouveau_dmem_migrate_chunk()
>   drm/nouveau: nvkm: vmm: silence warning from cast
>   drm/nouveau: remove incorrect __user annotations
>   drm/nouveau: uvmm: remove incorrect calls to mas_unlock()
>   drm/nouveau: uvmm: remove dedicated VM pointer from VMAs
>
>  drivers/gpu/drm/nouveau/nouveau_dmem.c        |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_exec.c        |  6 ++---
>  drivers/gpu/drm/nouveau/nouveau_exec.h        |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c        | 23 ++++++++-----------
>  drivers/gpu/drm/nouveau/nouveau_uvmm.h        | 14 +++++------
>  .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    |  5 ++--
>  6 files changed, 24 insertions(+), 28 deletions(-)
>
>
> base-commit: 82d750e9d2f5d0594c8f7057ce59127e701af781
> --
> 2.41.0
>
