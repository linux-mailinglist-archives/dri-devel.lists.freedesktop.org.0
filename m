Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 564906D3F73
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 10:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D920310E38B;
	Mon,  3 Apr 2023 08:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376B110E38B;
 Mon,  3 Apr 2023 08:51:40 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id t20so2802823uaw.5;
 Mon, 03 Apr 2023 01:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680511899;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FymDryzt1xBzbE+SpKvnTozEFbclbNgIFpbMS++SyVU=;
 b=WQLhONVAXpN5OHyuTesxZLQCVH84lLcS8R//4zp4N5W1jHxF5GlEOMu++thn0Z8osa
 wse+65L8OESh9bizgwSYVrNCi5XOk2wqGxaeu9Jxmgn9TswzAZPTyxn8SbhIhHNbLlwk
 giSe4Ewsddb2G9rIwlLNlJdMjHjB19E39XCmz6rhVoPMVxtkOKu0NmFmvPeczy7Lmq/+
 Ne6t3WZ+wZXYABufxAHZokA+Q9B2D8HCKfkyK+yTg4Sa5g5/DiZnb7eYyOKjkmS56/BD
 13NPRof6md+4O6dicSgoOh5+j6l/+pCyvlFC5fZ2DLSyGJjreVZCYeHqHgz1x/zNg8lH
 0BnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680511899;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FymDryzt1xBzbE+SpKvnTozEFbclbNgIFpbMS++SyVU=;
 b=VmGGbxq3fYoAC4eQgc2Ldck8LB4+aKa8L5m3e3jpanbdx3p0BdqMxh+dxmaRjRXI5A
 5ozsLMzj2oKm1k8nc63xB5fhSTY8Jo7g2B/X+2BNqSFD3CY5oC9CIR4Gn3+FjfYhmr22
 XR+yH5I3AyYrddCC99PVuZ05RzhMwwBjpi2WZm7CLLwOV2YSSxE2mUWSuTy7mc/nPYn8
 d3QNeWu1H9eqSM/2wno3I1tms8i0pnqtPMjKnQt+Vlkt6Jl9V0MDXOH8YjcVbmvXNa9k
 4mFN+HCFv0szwzG5Rci3+cLm1ZzeTcNC5BL67h0KKCk8rgQCBthL+7uXZC82JQajkxYN
 nCrQ==
X-Gm-Message-State: AAQBX9elZt0B9nzmuMLvmtfPb8X1LnvL2Jpr0lrkzoz8uCaGKfEeCKKS
 ka60fGBiOLSnLJhoBzqGat3AO/gpYkD/x/4YFP8=
X-Google-Smtp-Source: AKy350b4qh7ooTYUZmD0lqPsElUdZR/+GMJIQH4u47foRbem0nU3YeXjFhuoxUqXFrG8UrY6FG7/2VR2qiQ4iBbIXAk=
X-Received: by 2002:a1f:a8d4:0:b0:43c:6ef1:7200 with SMTP id
 r203-20020a1fa8d4000000b0043c6ef17200mr1391338vke.3.1680511898929; Mon, 03
 Apr 2023 01:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230403121617.61e2a929@canb.auug.org.au>
In-Reply-To: <20230403121617.61e2a929@canb.auug.org.au>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 3 Apr 2023 16:51:27 +0800
Message-ID: <CAKGbVbv=eyaKPQM8QfD-999-=vbrrqnEXkhuE7dy=vpK7OFY6Q@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I think you can just revert the following three lima commits when merge:
* 4a66f3da99dc ("drm/lima: add show_fdinfo for drm usage stats")
* 87767de835ed ("drm/lima: allocate unique id per drm_file")
* bccafec957a5 ("drm/lima: add usage counting method to ctx_mgr")

Regards,
Qiang

On Mon, Apr 3, 2023 at 10:16=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> drivers/gpu/drm/lima/lima_ctx.c: In function 'lima_ctx_do_release':
> drivers/gpu/drm/lima/lima_ctx.c:53:45: error: 'struct drm_sched_entity' h=
as no member named 'elapsed_ns'
>    53 |                 mgr->elapsed_ns[i] +=3D entity->elapsed_ns;
>       |                                             ^~
> drivers/gpu/drm/lima/lima_ctx.c: In function 'lima_ctx_mgr_usage':
> drivers/gpu/drm/lima/lima_ctx.c:125:43: error: 'struct drm_sched_entity' =
has no member named 'elapsed_ns'
>   125 |                         usage[i] +=3D entity->elapsed_ns;
>       |                                           ^~
>
> Caused by commit
>
>   bccafec957a5 ("drm/lima: add usage counting method to ctx_mgr")
>
> interacting with commit
>
>   baad10973fdb ("Revert "drm/scheduler: track GPU active time per entity"=
")
>
> from Linus' tree.
>
> I can't see any obvious way to fix this up, so I have used teh drm-misc
> tree from next-20230331 for today.
>
> --
> Cheers,
> Stephen Rothwell
