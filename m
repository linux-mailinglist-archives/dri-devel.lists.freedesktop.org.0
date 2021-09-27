Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F46C4190D6
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 10:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6106E839;
	Mon, 27 Sep 2021 08:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E4B6E839
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 08:30:19 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id b20so74099107lfv.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 01:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GA+w/7Fz7pakq81lfEfoU3pvOJjsT/IRnVhcz7mumtU=;
 b=PqTM8Z1XyThr8zP1E88HEWwxMztdEkgS/wFDGnZ2Hs5wm4Uqwe7AIcFdo6m02qfgZu
 YWUws2qQZBc8xVg+76rHPY1oSmoQapqoVDn4mCR98TuaR047XnaAOVaC05kYQ00/NsyJ
 wUYZ8LML2ZCJlQxtglPY5b+XZ1apHJPn4VEJJWHPD+ppNd7MEz/ORS7HJAzBt5nVFyda
 cQVTY/M2rgCJwV7tkNN69UV9v5Gfs9hwq2hFlDfITZFeR7ovUVw+Kt5rHw5PVFnFhOHw
 d3BIyZ7osifz3oXJTFsSQkVBdD+bBpwBe2sBBpAI2nQQiLJ20hNfFzkeLJP+eZuC9DTG
 CwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GA+w/7Fz7pakq81lfEfoU3pvOJjsT/IRnVhcz7mumtU=;
 b=J0/Occ/c3Lk1xgkwF52tVckzAgNThwNscwzK1a9KicBFfEf/XkpBhYJR5ksjFDv5CL
 gYbDRFTEWA2YdsxYooudtvCWVg10LMthWBju582Sl6XiBLUPQutyglGGW2BBJG5D9WbV
 KLE5p61xWnYlChVWEhHb48muHaktR+mxDAznausZSyi54E4fAP/Fmu5YDrz82gtvIMZ1
 S5JW3WuThTmTxAEJSAzT6iBaSVfGxIKzg7SZqqD60QW9niHLAk2VxUKCghPwkgMliOsb
 v0qoGuDzVkcZiyZHY7zJGDOQVJ1LhT+zuS1ecv97p3oFFhOfzOD74UpQJzErjQz3k0Vl
 k+Dg==
X-Gm-Message-State: AOAM532SDkH+8Gbljw/1tEZAJzYn5OIZEKoW0j5L+j7sp+jjafgQwdhQ
 KS5fjYf7QWZ27XNsHsCCnHchK2CzkiOqPJTaFAE=
X-Google-Smtp-Source: ABdhPJwYHjyBP7mZhAmpgLhGWAsbaUV7IlU5kun3EgVI7EacBVOexLL13DDFGMMullGRY6HEuHbKqUqQ8T3lZpWCQxM=
X-Received: by 2002:a2e:9901:: with SMTP id v1mr26572450lji.384.1632731417725; 
 Mon, 27 Sep 2021 01:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210927081628.GA10186@kili>
In-Reply-To: <20210927081628.GA10186@kili>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 27 Sep 2021 10:30:06 +0200
Message-ID: <CAMeQTsaobgz5kc7m+2_xfqzTVd_zF3Ae=Htscc0JjG3B-cdegg@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Fix error code in probe()
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 kernel-janitors@vger.kernel.org
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

On Mon, Sep 27, 2021 at 10:16 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The error code is stored in "dev_priv", not "dev".  The "dev" pointer
> isn't initialized yet.
>

Hi Dan,
This is already addressed in:
https://patchwork.kernel.org/project/dri-devel/patch/20210924094040.3631675-1-yangyingliang@huawei.com/

-Patrik

> Fixes: c2f17e60cbe1 ("drm/gma500: Embed struct drm_device in struct drm_psb_private")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/gma500/psb_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
> index 3d036d2a3b29..7a10bb39ef0b 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.c
> +++ b/drivers/gpu/drm/gma500/psb_drv.c
> @@ -454,7 +454,7 @@ static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>
>         dev_priv = devm_drm_dev_alloc(&pdev->dev, &driver, struct drm_psb_private, dev);
>         if (IS_ERR(dev_priv))
> -               return PTR_ERR(dev);
> +               return PTR_ERR(dev_priv);
>         dev = &dev_priv->dev;
>
>         pci_set_drvdata(pdev, dev);
> --
> 2.20.1
>
