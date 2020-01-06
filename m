Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9288130B3E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 02:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E1189CE0;
	Mon,  6 Jan 2020 01:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F5289CE0;
 Mon,  6 Jan 2020 01:06:17 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id c14so15342848uaq.11;
 Sun, 05 Jan 2020 17:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oD/TmYE7Rc3ZEG5cPZO14SpBA53dODt6EQBgZE8gYPI=;
 b=PEmo0PFq7DKBYxBtymV7LxJFLP5A+tQ61Dr0ltLhlVBdB2gwEN7SUZkn6EobnWvRem
 OOY+ffQNhh4/RyrTB7CjApYSGy04OicYqOgN/yxu270OCR+8vLKP3227IoaoKuTGEKNu
 9mzyotU7JeOQnzPwz/GVM78jUm8dSUOobw4X68g2pB4VcfT58ih1EbnaFfXHDuONOBLt
 zkcRL44LM3kClp35/K3eqEzB7Tj18SjIJxG0L66oSkyefi5kpoM4BRRt3Q/v9IoM8y/p
 Ezv/Odb3x3dSfYxliNTUjm+idMNtR37QhXGI9QJJ+qIvJc/pXupjc7rIhOdXerPBXK4U
 Q5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oD/TmYE7Rc3ZEG5cPZO14SpBA53dODt6EQBgZE8gYPI=;
 b=tO9DDRr6VDzUvGIEMs2kpBiPAIWdXfB9FKBnnejenVqh0nFbrdGzZrTPYrTTRD9RM5
 n6yVVjDB9kIMeVLz7wkAmJXdGtPrDAJ5oXJxxiXiv89oepTufl2Tz//hIb8lTq4neWwJ
 tBfBT4C4twMRK8g3Y9c1APziUHIGKWIK5IVVXWNhXORLnseBI+OKD17O1Uk/mLA/sqg9
 fo2Bt8OoQuh5ETARpjyvbWc5Ioj9hQeXYM+rxoloe3nxG6gmPuA3msR3/f6C2e80Kl22
 46lnS0D4+o+aeLfCOBgOk8tz3+hGEl8R8PLhePosEJmdgydHWssSqPlp7i0ux2SRmQz3
 NXTA==
X-Gm-Message-State: APjAAAUAvoFmu8028OZxPnE6nZJakylJtY+evgpg2BOrLxSQ27srhq0f
 IkFuex+NcRD+jDHdl7b8T6p5kI2fjbVJ1/jIK/k=
X-Google-Smtp-Source: APXvYqx3CyDfxmt7yEu8FyFHyU8Oa/0pVpqjMMDxszF13Rx1oXVB90+4EwrYBUaZfUuxGzrGM8cVVxOcDQ9zrjCmByw=
X-Received: by 2002:ab0:6029:: with SMTP id n9mr57299619ual.35.1578272776664; 
 Sun, 05 Jan 2020 17:06:16 -0800 (PST)
MIME-Version: 1.0
References: <20191230024628.11820-1-yuehaibing@huawei.com>
In-Reply-To: <20191230024628.11820-1-yuehaibing@huawei.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 6 Jan 2020 11:06:05 +1000
Message-ID: <CACAvsv6GAO18farNBWy5t-tXyTkZHtNDxZEfHeNpZ475yMdGUA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH -next] drm/nouveau/nv04: Use match_string()
 helper to simplify the code
To: YueHaibing <yuehaibing@huawei.com>
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 ML nouveau <nouveau@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 Dec 2019 at 12:48, YueHaibing <yuehaibing@huawei.com> wrote:
>
> match_string() returns the array index of a matching string.
> Use it instead of the open-coded implementation.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Thanks!

> ---
>  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> index 03466f0..3a9489e 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> @@ -644,16 +644,13 @@ static int nv17_tv_create_resources(struct drm_encoder *encoder,
>         int i;
>
>         if (nouveau_tv_norm) {
> -               for (i = 0; i < num_tv_norms; i++) {
> -                       if (!strcmp(nv17_tv_norm_names[i], nouveau_tv_norm)) {
> -                               tv_enc->tv_norm = i;
> -                               break;
> -                       }
> -               }
> -
> -               if (i == num_tv_norms)
> +               i = match_string(nv17_tv_norm_names, num_tv_norms,
> +                                nouveau_tv_norm);
> +               if (i < 0)
>                         NV_WARN(drm, "Invalid TV norm setting \"%s\"\n",
>                                 nouveau_tv_norm);
> +               else
> +                       tv_enc->tv_norm = i;
>         }
>
>         drm_mode_create_tv_properties(dev, num_tv_norms, nv17_tv_norm_names);
> --
> 2.7.4
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
