Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A30514F0D
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 17:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DBA10E471;
	Fri, 29 Apr 2022 15:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155F210E078;
 Fri, 29 Apr 2022 15:18:07 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-e2fa360f6dso8456051fac.2; 
 Fri, 29 Apr 2022 08:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IVKH9E+l7o2XudEOKH10/8Spo2yzScp0hzyP8QBi7BE=;
 b=JY7Q/ILOzg3ysXd9geh9fS9vWGHMd+NT6LqqxD1FH1YKig/AUTIyAJgQzgJTWp2YYt
 RUnLugHV/CY4y/L8n2vZx8Wlr0brkPm8eFpaH3bG4UENdLUFJ7emmoVdsKqn3NwxUhGi
 Gvee27j8FwozjSEXGPfuojiDp9cqm+gX1ieMrhvVgFok7Ci9b1V8whVmpEVV/nTdpWvA
 zh6gXX8ofsP64q3KH1uBLTpSzNxdY0DR/Sm+sTuDgATwZ3XSUuudDzgJjNECS+fA6IZi
 D+vVqyD6ZrNG5qbjdarPLWJ1KEJdtZssTLD8860ohjmFmM1joSCSMRx5mecsxpw2dnXs
 3f+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IVKH9E+l7o2XudEOKH10/8Spo2yzScp0hzyP8QBi7BE=;
 b=AcwFceVLaw0wPYmJlqLspv+ZYvZ6/eoULFYvx89Mwc5PMsVN7xJ8LdE6sYByvZ8HG1
 19sdVGwGggjh2Sf75sCU9P71ff6qLYnmlFvMh+QVs7JTuL0HQR90aOcxfVm2hd8Pw69g
 s6WI1hzjIuppL9/WmwCp6D7Qno+krfhjuI3zWTPkyu/z5bpiM8bg8BGHdK8NbcIeyK2e
 ZHdGpV1TQe8tq54ON4uNa9EtS0Wk9qpKFr+dhiclsKN/ndJBs3vyUeqI2W7kYZfGIH6a
 Al1hyeHM//gA1ur+x5eUQrtJs2f4OvK9NX6MAWqmzH3cT55mX1+G/LVQ3qNW+6lHmHhT
 D5BA==
X-Gm-Message-State: AOAM531UoFs/ZSH4kNd0/dsLElyrBXIpYdr3qQJ4t+nAZMrhYdoY9LZR
 7dGlRVSUYTcNCi0YRfy1hY4XzZhxAZ8x1JpgORM=
X-Google-Smtp-Source: ABdhPJxwBcfHMKT9AQjsJUPy7CWDdzvL4iBKjdwzdC6eu1LFYOZLa5zoFvTyB5EGbAMeY7Dy1Dd01LOpWKrIn+rUYFk=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr1483544oaa.200.1651245487284; Fri, 29
 Apr 2022 08:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220429055037.3852147-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220429055037.3852147-1-chi.minghao@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 29 Apr 2022 11:17:56 -0400
Message-ID: <CADnq5_OJ7dvj8kh6AjQ6cSBMEqAbfDo5Gj7rFV+fpf+=RoXkzA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: simplify the return expression of
 navi10_ih_hw_init()
To: CGEL <cgel.zte@gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Zeal Robot <zealci@zte.com.cn>,
 xinhui pan <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Minghao Chi <chi.minghao@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Apr 29, 2022 at 1:50 AM <cgel.zte@gmail.com> wrote:
>
> From: Minghao Chi <chi.minghao@zte.com.cn>
>
> Simplify the return expression.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/navi10_ih.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> index 97201ab0965e..4b5396d3e60f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> @@ -593,14 +593,9 @@ static int navi10_ih_sw_fini(void *handle)
>
>  static int navi10_ih_hw_init(void *handle)
>  {
> -       int r;
>         struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>
> -       r = navi10_ih_irq_init(adev);
> -       if (r)
> -               return r;
> -
> -       return 0;
> +       return navi10_ih_irq_init(adev);
>  }
>
>  static int navi10_ih_hw_fini(void *handle)
> --
> 2.25.1
>
>
