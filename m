Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891863A282D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 11:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E776ECA7;
	Thu, 10 Jun 2021 09:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C616ECA7;
 Thu, 10 Jun 2021 09:21:04 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id 5so4054266qvf.1;
 Thu, 10 Jun 2021 02:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P4iEhDem4kZK+SyUyBPttrlpuO+aLuZVSlxOmTIA50w=;
 b=qVkWH4RnV6lnk+N0kipQ0LUeMbBIPfTBjgz7Bn++bEj02Yak31f7aFlKdIuJTtz5TQ
 tnw5Up1LQtz7kKB/aDUPkOdCQtsikVSBSVRwqsJdOhK9WAb0B9izPnvPEQGJpFBMPeLr
 JT+PRh53KIuMz+rY40ic9eJAoSVtmJ68V3msPDFdym7WhN/hNV3ocWBm4//ZfGPs2WLD
 Uy2/w9qGa0gq40MO42xAvKdFTnbHODQn4O7SuzaKkYR8tORAm/rsQbXl/AKVJBjitxDg
 fw3NQzxSOaz8/eN83N7HefbAURto4NHhp0LQVD3KyPftkcOnEptPAcs8faMJnPhhynXE
 KYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P4iEhDem4kZK+SyUyBPttrlpuO+aLuZVSlxOmTIA50w=;
 b=IatFocKqnoZNG0fAhO9ByfjPz3ABuvLALQhKinnFzxx03WISLlopt9EeDL2hBMynB9
 CyWKFRQ1rViSSzjiub2Bsdcx4YEe/YdNHyiq9jv5IdwEGTR8tUE1kngnqDACW2Itd+io
 jdUrQS/Uv7Eh4nIldZ1GiDsv5YkXlsiLg/pD4+KJmYbjt0RJUVkLTmb4nBcgUXLz3i3l
 a1Cq3qvpQ0n7Db/6LqSmpga3CUMNHVnN/F+CyGRhGeIlM2j0SSqqDQNgueTqVEAWQddd
 KIAHyRcJGtuRKpRPjSopWUq8EaulzQ0J3V4izMN7ncaPu1a1NTdvPBX5Eh4OPVu3AOOt
 CwNA==
X-Gm-Message-State: AOAM531LQinZ8o698GZpOShY8/LgtHFJf9rvaW65wJQ25VKljNZ6iyh3
 LZnl3/5x0xWlBfFf58flrwEdMD+Re8D7/4woffM=
X-Google-Smtp-Source: ABdhPJwhXLh64zHDWG2mptUnFVGdHO2Sbc8j3h5R1chhHutwY1ett/fLW3sF8OgRKC+x7iYZapFSyWZQNtgMeqcUi6E=
X-Received: by 2002:a05:6214:764:: with SMTP id
 f4mr4032377qvz.60.1623316863810; 
 Thu, 10 Jun 2021 02:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210609172902.1937-1-christian.koenig@amd.com>
In-Reply-To: <20210609172902.1937-1-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 10 Jun 2021 10:20:37 +0100
Message-ID: <CAM0jSHPXTtqQ+E7+yOXnzyOPj4GX_wfiky92RYMMQWxTEM9BEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: init the base GEM fields for internal BOs
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
Cc: cyndis@kapsi.fi, nouveau@lists.freedesktop.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>, ray.huang@amd.com,
 Matthew Auld <matthew.auld@intel.com>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 9 Jun 2021 at 18:29, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> TTMs buffer objects are based on GEM objects for quite a while
> and rely on initializing those fields before initializing the TTM BO.
>
> Noveau now doesn't init the GEM object for internally allocated BOs,
> so make sure that we at least initialize some necessary fields.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

fwiw,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouve=
au/nouveau_bo.c
> index 520b1ea9d16c..085023624fb0 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -149,6 +149,8 @@ nouveau_bo_del_ttm(struct ttm_buffer_object *bo)
>          */
>         if (bo->base.dev)
>                 drm_gem_object_release(&bo->base);
> +       else
> +               dma_resv_fini(&bo->base._resv);
>
>         kfree(nvbo);
>  }
> @@ -330,6 +332,10 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 size, in=
t align,
>         if (IS_ERR(nvbo))
>                 return PTR_ERR(nvbo);
>
> +       nvbo->bo.base.size =3D size;
> +       dma_resv_init(&nvbo->bo.base._resv);
> +       drm_vma_node_reset(&nvbo->bo.base.vma_node);
> +
>         ret =3D nouveau_bo_init(nvbo, size, align, domain, sg, robj);
>         if (ret)
>                 return ret;
> --
> 2.25.1
>
