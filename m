Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8235925E8E3
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 17:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34ADC89021;
	Sat,  5 Sep 2020 15:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719E989021;
 Sat,  5 Sep 2020 15:50:17 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a65so9375386wme.5;
 Sat, 05 Sep 2020 08:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pXbA5QzXaE9R1TUgN58xIlVudUBkwmoW38ydLzuUlbw=;
 b=PNVhN54sLGUBiCB9RkkMawPjyZ+NkUWAY1nYfephvsoOEOVaPPFhxuZtfKHBF4+EDr
 KAkEnIOjmxYPTCOG8N9Cm3237Ww9RU4ICmTZ4iEnCJC64GqnDEIZJme5kfflseCF0kqt
 tJA9Tgkh7ZjCT4e7xP//o7682EjRFAUsh55D4f3aKezTlyTL3Kz1T7KFVXpSnWDwV8bA
 VIf47XZesqvGwbOv4tF2z/cAkBdPio/+UHaolj8lLdXv+fcPnDgne3Bly78KUFEpXxBu
 kSdcI+eONRMxdsm1DB/t0FTfqk6PKzqtoTDsQp5fPkFaTtku7h5MlMdRlzfZ0Vm+H4ex
 OGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pXbA5QzXaE9R1TUgN58xIlVudUBkwmoW38ydLzuUlbw=;
 b=H7+FWdZcOPzaEYcwKFBhKpZXm7TvqCRmuWGIxL1cF+Fi67+DNmD+VwBvfGYCfNTU9A
 Am2xWk984LBOZrzxrMl0YxjMPfsl/qv/RIyFGZ5c5qmg5Ki95/zRm/p8ZSDftht8WTzO
 u7LmMR60fE1KtoMUlG3EDtcgTkE/NFbej7rVD+56hVu7QQPqWW1SxQwRqUJ4AJ3v3oFV
 L9B8z25NVR002lMyfSBduxaY4miCWSq+zmVYHWMVghjSPB9kVcPsnB7RWlFTxVe0+GEd
 UnL7y+f0mgjHKUStWT+psBwCKLbV/6GG1on4tnWqP5q9Cfa74AKuDTXrlucvEZ95RMwD
 A1tA==
X-Gm-Message-State: AOAM531+BZxUfUB3O3bg+hcR6p306LTdr6vmw0KzEv24OvX+R3OHM7WD
 VkCAvdDf647LcAsn8j49mNqNXrqHzDgSMyS7AFs=
X-Google-Smtp-Source: ABdhPJznxRpuo85kX5TUVzhel4uX1W0BIskZ+6ZxFcgOlIJzwDmtxS6yKdWRjfsJ9zntaVYKEnXb1DNLSbTXXdeWCaM=
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr12981690wmj.79.1599321016109; 
 Sat, 05 Sep 2020 08:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200904012218.4971-1-luben.tuikov@amd.com>
 <20200904012218.4971-2-luben.tuikov@amd.com>
In-Reply-To: <20200904012218.4971-2-luben.tuikov@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sat, 5 Sep 2020 11:50:05 -0400
Message-ID: <CADnq5_NRyOfP48C5w4Q87qx98-hTLQP7PsP8OhGMbXJBu_Gb4A@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: Convert to using devm_drm_dev_alloc()
To: Luben Tuikov <luben.tuikov@amd.com>
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 3, 2020 at 9:22 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
>
> Convert to using devm_drm_dev_alloc(),
> as drm_dev_init() is going away.
>
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>

I think we can drop the final drm_put in the error case?  I think the
unwinding in current devm code should take care of it.

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 146a85c8df1c..06d994187c24 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1142,18 +1142,13 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>         if (ret)
>                 return ret;
>
> -       adev = kzalloc(sizeof(*adev), GFP_KERNEL);
> -       if (!adev)
> -               return -ENOMEM;
> +       adev = devm_drm_dev_alloc(&pdev->dev, &kms_driver, typeof(*adev), ddev);
> +       if (IS_ERR(adev))
> +               return PTR_ERR(adev);
>
>         adev->dev  = &pdev->dev;
>         adev->pdev = pdev;
>         ddev = adev_to_drm(adev);
> -       ret = drm_dev_init(ddev, &kms_driver, &pdev->dev);
> -       if (ret)
> -               goto err_free;
> -
> -       drmm_add_final_kfree(ddev, adev);
>
>         if (!supports_atomic)
>                 ddev->driver_features &= ~DRIVER_ATOMIC;
> --
> 2.28.0.394.ge197136389
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
