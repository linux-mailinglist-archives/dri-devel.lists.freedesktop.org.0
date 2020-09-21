Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4BB2732D8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 21:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB3D389057;
	Mon, 21 Sep 2020 19:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1547B6E532;
 Mon, 21 Sep 2020 19:30:57 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s12so14016585wrw.11;
 Mon, 21 Sep 2020 12:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MG5GeuWsQTyPF2iATQLYUVJQWCXYJxETCbv2BxD/ONg=;
 b=P6yLcsoz2LpsjDOE8gTegsB2wajcD/ezKZ+8GmFofaTZyH7j7FJvN3PoFSLwbIIuf8
 x9YW0gOnctd2n/AlxOe8gcT3uOnoSu4KEyFL4fiTDUHcn1HEXrKDsvcoa+39QaVJ+LvL
 beXnLt7QYRHHlhgx9JZkOjQYHKiu7k6xfVKJ5KnixMs1D96DTLtaXlAcYWW23HAm8O+1
 rX0W9GTHZcL8x/7LfspOIjmD3+s6fJlpV8RYwPmrV0ShQLnXNY7XxgpUITNxEe1vaLDU
 lAStgGa9vWH19vvqFrwa7HHWEYrLKW9xqjFYQM63tXyz7/6SWqvkD1iTNdJXGFeneJdo
 adKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MG5GeuWsQTyPF2iATQLYUVJQWCXYJxETCbv2BxD/ONg=;
 b=HToglK1r8+dpRtV/CfEzFsCqwUEhSyFTYjHPP14Ufwos/U0EOuorchyYU1gMs21s3M
 8EusF7qfPuZKPkJsDuxQoPODSIy+rMkk4fft+CprEPhfr5BpH4wVQtQe0rHDlKtT3WQ0
 DQJ3j9R6rN7jmp/RrHXn9nEXxCl2VaYbxsSfWhKEPfP2+JU2DYefxerqu1DEwwnVBkeg
 edyE961WLpp69TdYZOeAMM3+gEt9B3HdEc8nMybtd3n1EMNCTWXcN0smI//v0qDpurj8
 4vSb5bvv3myJgzCJwpVqLdqRJ78H/lF9rrtNewAL4w3KNVWsa0aYHR8QFzQ7kkmX7Dit
 w7TA==
X-Gm-Message-State: AOAM533+4BWckUinlYjm/tPy+55CgnC9USAsjmjBV/dFL4FXOgCubYiU
 vIYjwygvMI3T8NafW4vdm/s+lW/pXRBMtkXqeB0dzXsV
X-Google-Smtp-Source: ABdhPJzpMRT+ByT30Axa4Ty74Ac4xlaFFz/Ka6NEYDah9H69c7vzyyTUyCQgjosQ+WdgTYc+fKmhSZ/tZqIjOCt5mKs=
X-Received: by 2002:a5d:6886:: with SMTP id h6mr1391164wru.374.1600716655805; 
 Mon, 21 Sep 2020 12:30:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200921082430.2591201-1-liushixin2@huawei.com>
In-Reply-To: <20200921082430.2591201-1-liushixin2@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 21 Sep 2020 15:30:44 -0400
Message-ID: <CADnq5_MjgpEeZgv3FL9f1TvQCuEvfi_xhV9=Lu5A+Q_yLBuYdQ@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/pm: simplify the return expression of
 smu_hw_fini
To: Liu Shixin <liushixin2@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Sep 21, 2020 at 9:14 AM Liu Shixin <liushixin2@huawei.com> wrote:
>
> Simplify the return expression.
>
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> index 5c4b74f964fc..3612841d40dc 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> @@ -1214,7 +1214,6 @@ static int smu_hw_fini(void *handle)
>  {
>         struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>         struct smu_context *smu = &adev->smu;
> -       int ret = 0;
>
>         if (amdgpu_sriov_vf(adev)&& !amdgpu_sriov_is_pp_one_vf(adev))
>                 return 0;
> @@ -1230,11 +1229,7 @@ static int smu_hw_fini(void *handle)
>
>         adev->pm.dpm_enabled = false;
>
> -       ret = smu_smc_hw_cleanup(smu);
> -       if (ret)
> -               return ret;
> -
> -       return 0;
> +       return smu_smc_hw_cleanup(smu);
>  }
>
>  int smu_reset(struct smu_context *smu)
> --
> 2.25.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
