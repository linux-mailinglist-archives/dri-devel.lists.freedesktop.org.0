Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5325369E5FC
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 18:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943A810E16A;
	Tue, 21 Feb 2023 17:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B04C10E16A;
 Tue, 21 Feb 2023 17:28:44 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id f16so5137077ljq.10;
 Tue, 21 Feb 2023 09:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2uM2Sqi1LrzmhdYBUsLJKmYqTJHGFd6mwupJ4HuqqlE=;
 b=Bf5IlGK7pRPqSncYXrGgSRNto8ECKIs46Z+9kXBQP4kb6ekBMqmRjlaZac0DPIj8cy
 YKMkhRFQHaclMI9pDWN2Z125WfJY+8E7rNXz+A/L4XnN3GHa+4u/rLJPXHT3qlWGBH2T
 DEwTorkopg0ylpU9lsItsZ+uNbJAO7UXlvqcq2oEJZWb81t+2yuLPH1Yg7MUgnpx5ybL
 8DU1T6+KPy63SxY42Dsq6+IMHuMFAAgMktYFlhFuTVqAdj994giIwmBWUn9gyzk6dqru
 zxCWEdw7aA5Kx37pKUwuo6G/LAvM8nXVJm4hzYOAkHIH2IYFvdr2H198MtWO3RaZwbSP
 l5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2uM2Sqi1LrzmhdYBUsLJKmYqTJHGFd6mwupJ4HuqqlE=;
 b=q/cBTkPwX21xCHT0nQ0Fc07c4wn7ZsS5/SVaVfJv11ve7/bn+UrU0ZFIwCceJXijOB
 t7YpNPuSmn7AMAI5u++BDim1xbDl1nTU0tbn6g5eo8iwSkU1+29RHRqaQPZYMZzUOeQM
 r35BkSk+IICjSduktocGOu+R+dyelLXdT4XiqHiwhoIFgITxv1da17yZ3IOXGrjJyJ61
 m13fO1wQ3F1IfXczA8svyOq9f7AYrvHQPauMxOgwmEebqK27hC5swL4AKMcR8x0bsFOT
 iPlz1UMOH0kwlBBqPLkZVCNhdrwIU/8z6/1VeCT2vy9iqGuNhDOiow9yD6q1QpjdOo8i
 TXlA==
X-Gm-Message-State: AO0yUKXum/ekLziCrCRS1KKm2w5Ne/TGi1WYbdNAppvn1qDjiHnzA9Ej
 U61P7ttpBW6h9T8gg0IRBARToRVUndgVLt5TqhY=
X-Google-Smtp-Source: AK7set8HS6OZ9bbuqsGa4opdA0t95yS61MTlL/x4KCdXFKihc5QLWYNVee8A3kxAzcBalZpLLbTKkmmfppkU7fqSbLs=
X-Received: by 2002:a05:651c:331:b0:293:4fd2:9a59 with SMTP id
 b17-20020a05651c033100b002934fd29a59mr1955516ljp.2.1677000522451; Tue, 21 Feb
 2023 09:28:42 -0800 (PST)
MIME-Version: 1.0
References: <20230217122224.29243-1-christian.koenig@amd.com>
 <20230217122224.29243-5-christian.koenig@amd.com>
In-Reply-To: <20230217122224.29243-5-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 21 Feb 2023 17:28:15 +0000
Message-ID: <CAM0jSHMcUk3x_RdBjG++KCB1rhh=ORVNOUqczWKYcpLsSjG6KQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] drm/gem: Remove BUG_ON in drm_gem_private_object_init
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Feb 2023 at 12:23, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
>
> ttm_resource can allocate size in bytes to support less than page size.
>
> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20230208090106.9659-1=
-Amaranath.Somalapuram@amd.com
> ---
>  drivers/gpu/drm/drm_gem.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index aa15c52ae182..5a3ca3363f82 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -152,8 +152,6 @@ EXPORT_SYMBOL(drm_gem_object_init);
>  void drm_gem_private_object_init(struct drm_device *dev,
>                                  struct drm_gem_object *obj, size_t size)
>  {
> -       BUG_ON((size & (PAGE_SIZE - 1)) !=3D 0);
> -

There are also some comments in drm_gem_{get, put}_pages referring to
this exact BUG_ON(), which could do with updating now.

>         obj->dev =3D dev;
>         obj->filp =3D NULL;
>
> --
> 2.34.1
>
