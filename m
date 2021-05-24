Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF8D38F2C5
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 20:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7176E20B;
	Mon, 24 May 2021 18:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DD86E1F6;
 Mon, 24 May 2021 18:12:17 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 v13-20020a4ac00d0000b029020b43b918eeso6548395oop.9; 
 Mon, 24 May 2021 11:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+9I9jlaYCJwm7GMK8vCa+XPnOfqmkJZLcMPH2lbyCHI=;
 b=nzCpeBr7dDnoasU9Kv35bQBN1pMvKkUb21yqjebcNR2NJdUbJQcfCM/tzozKsoET/0
 uRTBHjIf65/dksUaZ6hQKSniPIUhnWbn84k8THLUecpHq6CvZeJnM6xyXqcZWRd2kKeG
 FPbHQEbOwZN+EoTMnq7lEWNmenmgzpzKltRDQ8yy3W/c7yn1FE4h8VKbIQfGAzUGzL4K
 ZyMvbhSOIKL1tn1GKT39I0eYmVguLX3dG458TVDrp96RUjLhWnFoYWhQ35Ubl4nsPzRL
 CdIWHCDVaqLD9QJuY1LhiLLmgnjCL8jG22j2BF5VIGNAoPfGswRu1a7C35eWEDZSwxWr
 UbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+9I9jlaYCJwm7GMK8vCa+XPnOfqmkJZLcMPH2lbyCHI=;
 b=qrjBt0sJQeaDerXpDXUiTZCSFk7b3PS9uQtaqNR07L3lgf+3AMzjLGSPmzzddvY85E
 v6dXOJFPnLeND705IeSlsNC0CwVC/Rwf6u14mmqXmJZDcFoZZDi+gk5eAm/61sqHLIZY
 v86QHCkLtcyY3ao0dCPOq24mRp2sWck4s9FdM0aHIhFUTl1dVSH0+hV4XumaPkMbJsSu
 M/6wtMHmZrvh/J1TxSvFaghCkDtLPF0XDk48y2g6zf/jeKKZkmPcaUKlkfFfUj5iRuqs
 rZE1xtfA4azguHQwIS8ZistmJXcLe/CWcCC4W1AggjCmG2V0Cqcob6wK0dhEYijdxUQA
 4xIg==
X-Gm-Message-State: AOAM533rp7DngOphoQcUZoMfSxiiDTrCeDBgwgFeLNB+Bd0HSI5fj/FV
 6qP1dGPRkqKhvkGINRa35a3fctSLp8Ycdhhv4qw=
X-Google-Smtp-Source: ABdhPJzhVFLRxGfoyzWVJh3tF9KW/NhQHanjStmXRL3+N/qojxCqMzyXV6pZNW3TG8IVKGKFaI7lHeuVsvrsYP+dFK0=
X-Received: by 2002:a4a:d085:: with SMTP id i5mr19301783oor.61.1621879937282; 
 Mon, 24 May 2021 11:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210524133548.2361943-1-weiyongjun1@huawei.com>
In-Reply-To: <20210524133548.2361943-1-weiyongjun1@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 May 2021 14:12:06 -0400
Message-ID: <CADnq5_Os1fKouKSkfmmiWgjLxkX3FQ1Ny5Wcno7VQcheG4-26Q@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amdgpu: fix error return code in
 amdgpu_acpi_init()
To: Wei Yongjun <weiyongjun1@huawei.com>
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
Cc: Lijo Lazar <lijo.lazar@amd.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, kernel-janitors@vger.kernel.org,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>,
 Prike Liang <Prike.Liang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Ye Bin <yebin10@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 24, 2021 at 9:25 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.

I don't see any other cases in this function where we return an error.
It could arguably be made a void.  All of these APCI methods are
optional.

Alex

>
> Fixes: 77bf762f8b30 ("drm/amdgpu/acpi: unify ATCS handling (v3)")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index 49563ff87f1a..9564690b21b4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -895,12 +895,15 @@ int amdgpu_acpi_init(struct amdgpu_device *adev)
>  atcs:
>         /* Probe for ATCS, and initialize it if found */
>         atcs_handle = amdgpu_atcs_probe_handle(handle);
> -       if (!atcs_handle)
> +       if (!atcs_handle) {
> +               ret = -ENODEV;
>                 goto out;
> +       }
>
>         atcs = kzalloc(sizeof(*atcs), GFP_KERNEL);
>         if (!atcs) {
>                 DRM_WARN("Not enough memory to initialize ATCS\n");
> +               ret = -ENOMEM;
>                 goto out;
>         }
>         atcs->handle = atcs_handle;
>
