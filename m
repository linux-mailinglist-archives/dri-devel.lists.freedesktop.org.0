Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F7D70EB9F
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 04:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F2610E566;
	Wed, 24 May 2023 02:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3D310E564
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 02:56:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 009F363820
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 02:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6969BC4339C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 02:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684896993;
 bh=E9N/sAfiWUA+ZElz5wXgXJ0URf+jkMc0VYEsIDumwIM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uxo9Q6dlBJ19Ma0l5jISNnb0DCAgr8wVExorQUZeY9BHGIy/JoMjyFUBZcadP/QNz
 Dw8Mw8x67cCWCEr/84MM5RmLcu4DnSLmlOY75H/DSWFD/P7ydmT+HehVauNG4E3AU9
 J2g2500D3KT9/JOdJ+6pd9B6aXvF+KEhWWra88IrSyl71kA+KWhnsgGdz6RZd2OTOW
 9HqOJ9xhxHVmRCMqpHt99rTkHepRnaf0QY1oZD0KhxjCe0hRb6QM+EJoxVP1XPqofU
 0t1EZUklTeEaxkWgh3iVLdk5uXcJEZLI/nbN2NzBf+xR3RhFg+MNdGh/WQ33lmZr91
 hthznWcHiSEGQ==
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-96fab30d1e1so119792066b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 19:56:33 -0700 (PDT)
X-Gm-Message-State: AC+VfDyQkVsYOg1Y5+0SEcQ+jFLnUNZfSXUjP57Q1PvkBvgRERQXye3k
 9nkiEY6oXSmLy+WsLhYK6jB/8EvfYpI+LHe2wQU=
X-Google-Smtp-Source: ACHHUZ6i9KR0riGnMcQYXxLMBszSuF2aNO1/uSx3dwZ0hU2V8tO6jzLEGgXBjYfrHlAWi77UzA9fDJpaJtyeOq1i32A=
X-Received: by 2002:a17:907:1ca7:b0:96f:ddaa:c30d with SMTP id
 nb39-20020a1709071ca700b0096fddaac30dmr9621163ejc.26.1684896991695; Tue, 23
 May 2023 19:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230520105718.325819-1-15330273260@189.cn>
 <20230520105718.325819-2-15330273260@189.cn>
 <26fd78b9-c074-8341-c99c-4e3b38cd861a@xen0n.name>
 <73447e35-f4df-9871-6210-b7bf1a3f04fc@189.cn>
 <97fe7af2-0a93-3f28-db6e-40a9b0798d49@xen0n.name>
In-Reply-To: <97fe7af2-0a93-3f28-db6e-40a9b0798d49@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 24 May 2023 10:56:19 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5iRHFUgWZb2HdE7RdAw-bYdn0-xJTdq=eQexabjmn5_w@mail.gmail.com>
Message-ID: <CAAhV-H5iRHFUgWZb2HdE7RdAw-bYdn0-xJTdq=eQexabjmn5_w@mail.gmail.com>
Subject: Re: [PATCH v14 1/2] drm: add kms driver for loongson display
 controller
To: WANG Xuerui <kernel@xen0n.name>
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Christian Koenig <christian.koenig@amd.com>,
 Liu Peibao <liupeibao@loongson.cn>, Li Yi <liyi@loongson.cn>,
 linux-kernel@vger.kernel.org, Sui Jingfeng <15330273260@189.cn>,
 loongson-kernel@lists.loongnix.cn, Emil Velikov <emil.l.velikov@gmail.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 23, 2023 at 4:14=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wro=
te:
>
> On 2023/5/22 16:02, Sui Jingfeng wrote:
> > Hi,
> >
> > On 2023/5/21 20:21, WANG Xuerui wrote:
> >>> --- /dev/null
> >>> +++ b/drivers/gpu/drm/loongson/Kconfig
> >>> @@ -0,0 +1,17 @@
> >>> +# SPDX-License-Identifier: GPL-2.0
> >>> +
> >>> +config DRM_LOONGSON
> >>> +    tristate "DRM support for Loongson Graphics"
> >>> +    depends on DRM && PCI && MMU
> >>> +    select DRM_KMS_HELPER
> >>> +    select DRM_TTM
> >>> +    select I2C
> >>> +    select I2C_ALGOBIT
> >>> +    help
> >>> +      This is a DRM driver for Loongson Graphics, it may including
> >>
> >> Drop "it may"; "including" should be enough.
> >>
> > 'it may' is more *precise* here, because currently we don't ship with
> > the support for loongson 2K series SoC.
> >
> > I'm try to be precise as far as I can, we avoid made this driver too
> > large by ignore loongson 2K series SoC temporary.
>
> That's a good idea! For now the patch is so large that my review reply
> is said to be dropped by the lists. Focusing on one bunch of similar
> models first then adding support for the rest not-so-similar models is
> very friendly towards the reviewing process and will help code quality to=
o.
I suggest split the LS2K parts to a separate patch, but keep it in the
same series to get them upstreamed together.

Huacai
>
> >
> >>> +      LS7A2000, LS7A1000, LS2K2000 and LS2K1000 etc. Loongson LS7A
> >>> +      series are bridge chipset, while Loongson LS2K series are SoC.
> >>> +
> >>> +      If "M" is selected, the module will be called loongson.
> >>
> >> Just "loongson"?
> >
> > Yes,  when compile this driver as module,  loongson.ko will be generate=
d.
> >
> >   drm radeon is also doing so, See drm/radeon/Kconfig.
> >
> >> I know it's like this for ages (at least dating back to the MIPS days)
> >> but you really don't want to imply Loongson is mainly a GPU company.
> >> Something like "loongson_drm" or "lsdc" or "gsgpu" could be better.
> >
> > No, these name may have backward compatibility problems.
> >
> > Downstream driver already taken those name.
> >
> > userspace driver need to differentiate them who is who.
>
> IMO this shouldn't be a problem. Let me try explaining this: currently,
> upstream / the "new world" doesn't have any support for this driver at
> all, so any name will work; just use whatever is appropriate from an
> upstream's perspective, then make the userspace bits recognize both
> variants, and you'll be fine. And the "existing" userspace drivers can
> also carry the change, it'll just be a branch never taken in that setup.
>
> So, I'm still in favor of keeping the upstream "clean" without dubious
> names like this (bare "loongson"). What do you think about my suggestion
> above?
>
> --
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
