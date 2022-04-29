Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861C4514F0A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 17:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB8EB10E3F4;
	Fri, 29 Apr 2022 15:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7A210E29B;
 Fri, 29 Apr 2022 15:17:04 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-e2442907a1so8427889fac.8; 
 Fri, 29 Apr 2022 08:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3xlZKMfXOWwYkt3Pm+HzAM1Ba+HT7GaPjlYqQGfMcvo=;
 b=QypqKKBFuHoePNg/EBj+EfIUoy30MRZiE5ofHJB3ajmDmt7aLSIf///QKFV+TmjsG1
 6W7hS0XYz13rWWuNGjI0rVJa/WJvSk8rv/aiosm5EkPKl6XlGRP2yF518uRwrKKxmVfj
 BAlMSbVMQGidrtbJ6DoPyT8WFZYacrKCq+nPWNmZEZArIIAbcjcGUkQTPW4rCfhAFuXw
 Lin7LneIYmI67eHrDAdZDL5L0VZegbdD2UIC541tzvcTy+adrBu9Aup366/cVsCRxXqu
 QjmILPHh42Mg3dD62YJELG8E6SFPHHwT118A6IhOZi3y9m7laKzqzwpYqFJZvQTTbF4q
 gTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3xlZKMfXOWwYkt3Pm+HzAM1Ba+HT7GaPjlYqQGfMcvo=;
 b=LvocaKXu4nTGVHu5xY2GWB0MavSej4+9LzG3E4Y7/Fdyj8cM3TkXxKgyF04X/gLftp
 Nd6Vbxpf//mb8S9N14Js8mHhuNnxbC5xmHl68HT3W8/gehFfj+8Ac9FdTMNDxJQmLv39
 H2ATcPAypqdWMUxXKlKMPSulsyU+qUCIbVcJpLPia2GZgPrXnuDbR/K+e5+5SUXYZ2/b
 3QjjwT5BMzTnj5iqzvE3JNewNiGfW4zCcdVAPqGC4irpjOH1f7n3zyv4PjZl6n5ZRu8m
 9Ma+jIEABZrt2qUjj2R31glmXYkuyWgcj5QY7dE0hrMLNsD/aDg9WTdYcuckf4RqermR
 A3rQ==
X-Gm-Message-State: AOAM531fJqLThwtligwubX5uuv4Mr1X0web0x6QlpxwJpVBCFimRAm2M
 xS38tDXZ7PxoKYM9DPAPsfWP3u97LYoEBh/UkzY=
X-Google-Smtp-Source: ABdhPJylMMPfIHZM+tbLHh9jwNnT2hwrhUaVbJ09UCTwM3SA3vKZrfUm7HL45LOfRaIY9kbZUD2awJ1Ldcc6+oQYHMw=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr1480700oaa.200.1651245424273; Fri, 29
 Apr 2022 08:17:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220429054841.3851915-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220429054841.3851915-1-chi.minghao@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 29 Apr 2022 11:16:52 -0400
Message-ID: <CADnq5_Oo4KM+Jjiy8b+42UAP5PhaEMp76zS7gi3iRua2jTyUPQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: simplify the return expression of
 iceland_ih_hw_init
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

On Fri, Apr 29, 2022 at 1:48 AM <cgel.zte@gmail.com> wrote:
>
> From: Minghao Chi <chi.minghao@zte.com.cn>
>
> Simplify the return expression.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/iceland_ih.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
> index ddfe4eaeea05..aecad530b10a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
> @@ -308,14 +308,9 @@ static int iceland_ih_sw_fini(void *handle)
>
>  static int iceland_ih_hw_init(void *handle)
>  {
> -       int r;
>         struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>
> -       r = iceland_ih_irq_init(adev);
> -       if (r)
> -               return r;
> -
> -       return 0;
> +       return iceland_ih_irq_init(adev);
>  }
>
>  static int iceland_ih_hw_fini(void *handle)
> --
> 2.25.1
>
>
