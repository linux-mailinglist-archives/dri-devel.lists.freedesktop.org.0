Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EAF7710AF
	for <lists+dri-devel@lfdr.de>; Sat,  5 Aug 2023 19:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F075689343;
	Sat,  5 Aug 2023 17:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC8389343
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Aug 2023 17:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691254972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AwC2ZFlhYxmRV4GegFNry2xNQ2qKII2yxV/GxFfD/+Q=;
 b=Xig+jq7K3kCph2B2RA+VfIgX1G6HcavQct5gLv7Vb+MjAdtYdMiLmwyG1rtx1DsrVgx/cE
 /Q2oOzxzcoKsGVxLy3gPY1yQp6jA2bWd16GOGRKHaZVus8R7Qc/gwtxH+0kaxhJDLRgyxG
 DdYBpmO2tm2l9Rk/eRurXKyVxJw5Ck4=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-oppB_99UNjGdglwEibQNPA-1; Sat, 05 Aug 2023 13:02:49 -0400
X-MC-Unique: oppB_99UNjGdglwEibQNPA-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2a7a6393ba6so6723161fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Aug 2023 10:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691254967; x=1691859767;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AwC2ZFlhYxmRV4GegFNry2xNQ2qKII2yxV/GxFfD/+Q=;
 b=DM9424lVKgBc0x7hla5lOZFWAKfh2lM8efsBBgNH5J06DPDgf9esWUYUfeMY1oLRq6
 QI2aL/IPRGXqQ6gwzMTCPz46ElR638757mMu45he3rxu3yltWzKCVZzvAibv2e5lpTFz
 a/6lXWZBMefvA8GDemAe85TVKXKgs9nm8sIApGGNUs1nOs+6C0iJf58ui3ewT5o5m+2B
 ixbZgMmWHheaYQ2Q5z7u5GgUWon1lM3GIJr0BkPYZFeisoU773x37hqWALqwMUvfzmVL
 8n8owIfhReuL/Vuguj1UJ3CaKOh6BiLdqRUI4rb76EoZqLWJTCiBFu389IbTV77D7XUx
 Pv+w==
X-Gm-Message-State: ABy/qLY4m/jHJSlYGkO69u6/NGo6tfRZMi3MdbOJ1uHlIYsLN+BtFKRV
 yvVn/eDDDao+/KSb7YvoXxnCjm8zzHGqRwIB2ZpS0Y8/ipL1u8Du19pge8EfFGYsdRTIYzi7dYj
 vWYMfzB9Hehe8Rwa9F/enNhK2stcJGe/vRScvzfxz1Sn/
X-Received: by 2002:a05:651c:2c6:b0:2b6:120a:af65 with SMTP id
 f6-20020a05651c02c600b002b6120aaf65mr11587133ljo.3.1691254967645; 
 Sat, 05 Aug 2023 10:02:47 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGYiaAtFICZukz9GbgjadQIab1/CS12YPAHJmL8CGE4gx4kvaxS7NRq41yHA7pyNnx9RsTZk5QJDcTdUUMT23U=
X-Received: by 2002:a05:651c:2c6:b0:2b6:120a:af65 with SMTP id
 f6-20020a05651c02c600b002b6120aaf65mr11587124ljo.3.1691254967373; Sat, 05 Aug
 2023 10:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230805160027.88116-1-dakr@redhat.com>
In-Reply-To: <20230805160027.88116-1-dakr@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 5 Aug 2023 19:02:36 +0200
Message-ID: <CACO55tuS=tg_r-9W1fCr55svT8U0GhxLauMAmAmW7A052S_Mdg@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next] nouveau/dmem: fix copy-paste error in
 nouveau_dmem_migrate_chunk()
To: Danilo Krummrich <dakr@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 5, 2023 at 6:00=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> w=
rote:
>
> Fix call to nouveau_fence_emit() with wrong channel parameter.
>
> Fixes: 7f2a0b50b2b2 ("drm/nouveau: fence: separate fence alloc and emit")
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nou=
veau/nouveau_dmem.c
> index 4ad40e42cae1..61e84562094a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -678,7 +678,7 @@ static void nouveau_dmem_migrate_chunk(struct nouveau=
_drm *drm,
>         }
>
>         if (!nouveau_fence_new(&fence))
> -               nouveau_fence_emit(fence, chunk->drm->dmem->migrate.chan)=
;
> +               nouveau_fence_emit(fence, drm->dmem->migrate.chan);
>         migrate_vma_pages(args);
>         nouveau_dmem_fence_done(&fence);
>         nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);
>
> base-commit: 82d750e9d2f5d0594c8f7057ce59127e701af781
> --
> 2.41.0
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

