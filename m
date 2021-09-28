Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D69341ADAA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 13:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DABD6E106;
	Tue, 28 Sep 2021 11:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9086E106
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 11:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632827683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZU+KVR0y2VTh3ZrdA51D/L+4k30fXIYJ6SUmvuXTBtU=;
 b=FcaykwPZNo92lJaeTP35evk3+6CY2OWeLx9VgdynD2AtD02wBD0bUUoBS04RUL5NF/yVj7
 3tkwCFGF4m1kHFCQ5r0QI2wxMySb7N6ZN+bOlZUDVKBS3RZhFiCHaKR57sq+iEYmyXyY73
 W5qcMIG4wtzQbjVGEzPs49ZOmZ/C7KU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-J6zPYse5MTCjRlHpJbQTzw-1; Tue, 28 Sep 2021 07:14:42 -0400
X-MC-Unique: J6zPYse5MTCjRlHpJbQTzw-1
Received: by mail-wm1-f70.google.com with SMTP id
 r66-20020a1c4445000000b0030cf0c97157so1845871wma.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 04:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZU+KVR0y2VTh3ZrdA51D/L+4k30fXIYJ6SUmvuXTBtU=;
 b=MO5GS67FgBw4ZSICoDBreI7ObGdXeA4VekoROyJKZVVZ8n0XL90bU9bOkKk5ZccAwZ
 Gb+aYz+plMTMgHKg2o4zlE9LH5/KNcUod3UsPz0NQSxSjfnE0w/m8abVXNAP+ljewkAK
 axwk2J7g/YhtKwMcGA4JJCZZdMXYTeqHTuLkUwJ0uNRxJPlzj0OEmQibCXDML/9PABVS
 DJhRN5u6XJ74jt4uvCnekOxIDGitfNYy+BZIGuWRyQHgWFR+z1/ohgi+OdT3rDfl03Zg
 MWILReLCthHg11E3NkmEfLfSSHaW3ou55pfaunro7wkLc0b4Xpgl8FWi2unxwKXkzdKm
 U/sQ==
X-Gm-Message-State: AOAM533Vl2xH1pMFFMek7UcCRfHIPKHaaxd3PhWuKMM6/OWQnHVAyjQm
 6sqc2D/hGNsAedT/s157aH8tyT8i22lSs1fMJ4WltJ9cMPbnqf44eJd2s9QA+m6+dXSJ6UinzfC
 bhxrGdI/IqmAETw4Ak3J+bBBtv6/qNTEgwHAMMD5qL0F9
X-Received: by 2002:a7b:c1d6:: with SMTP id a22mr4054956wmj.146.1632827681480; 
 Tue, 28 Sep 2021 04:14:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmyS/k9wYJiX+xvA60Ee54wMfLNQLygQJU7Coe9SlPvQKuE0bZ2nADyYTfZL/XxVTwdXQwLWEQNDjqQrl73Dg=
X-Received: by 2002:a7b:c1d6:: with SMTP id a22mr4054944wmj.146.1632827681334; 
 Tue, 28 Sep 2021 04:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210821021106.27010-1-luo.penghao@zte.com.cn>
In-Reply-To: <20210821021106.27010-1-luo.penghao@zte.com.cn>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 28 Sep 2021 13:14:30 +0200
Message-ID: <CACO55tv5PoPL122+XSwS8Fyq9bbRNzqBghy7CPX1uTCKea9eUA@mail.gmail.com>
Subject: Re: [PATCH linux-next] drm/nouveau/mmu: drop unneeded assignment in
 the nvkm_uvmm_mthd_page()
To: CGEL <cgel.zte@gmail.com>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, 
 Luo penghao <luo.penghao@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Sat, Aug 21, 2021 at 10:46 AM CGEL <cgel.zte@gmail.com> wrote:
>
> From: Luo penghao <luo.penghao@zte.com.cn>
>
> In order to keep the code style consistency of the whole file,
> the 'ret' assignments should be deleted.
>
> The clang_analyzer complains as follows:
>
> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c:317:8:warning:
> Although the value storedto 'ret' is used in the enclosing expression,
> the value is never actually read from 'ret'.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Luo penghao <luo.penghao@zte.com.cn>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
> index c43b824..d9f8e11 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
> @@ -314,7 +314,7 @@ nvkm_uvmm_mthd_page(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
>         page = uvmm->vmm->func->page;
>         for (nr = 0; page[nr].shift; nr++);
>
> -       if (!(ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, false))) {
> +       if (!(nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, false))) {
>                 if ((index = args->v0.index) >= nr)
>                         return -EINVAL;
>                 type = page[index].type;
> --
> 2.15.2
>
>

