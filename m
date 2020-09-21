Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5032D2732DC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 21:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F328828E;
	Mon, 21 Sep 2020 19:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429708828E;
 Mon, 21 Sep 2020 19:31:53 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d4so595413wmd.5;
 Mon, 21 Sep 2020 12:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YH5llJy+UZ7IF1xl6CJ1Evb+uKpkOIo3lUNcZYyahmE=;
 b=sywkcLG2yw+k66v57gAmah0RShts+EYALdBeuGD6MBvpHrwmpmwm1OOL9QFjZoEB20
 +/D+/pNVMA1cz3xdYCTVtC93YYPovdOZaNWW66pMtghWhgxgIQG92LtzGPRAO/2FKZ89
 4yyMRHhmaRgcVXFSrBW4SMlNYEUoTrRakDDryjwUDfyGyHQmrCAgcxnj6xf4TZcgUVe+
 szuq+jU3g6/3jql+Y3nemZjnvPJ1opW4WgzndIImu87rQBmoOSDEJIcNlJI6kBOJWIzc
 KcvOe6i7DKCLcZbmDT3UbfcMY6jmChbsFUWSzlhUQCog0uvBMMkRAm9rikrnyBSwgCbU
 wTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YH5llJy+UZ7IF1xl6CJ1Evb+uKpkOIo3lUNcZYyahmE=;
 b=V8xFu3AmLzaAAaVicfEYTp8xW15nk0L0tdRsz73LFgV31f02sjiheV4kjkn2Bxi8Yw
 L0oIh4I48IYlVuhvFtJH4rjwrIzF6yFvwiXZUhzkjonKBeYTvUEihzH9+41EBbdtblol
 klAs2yy2IvDdhcvDpUVuAim3D2DWlWswdYjC3HkWRDXhCUOmPj3/Ku5rZ/er398Fu+Bb
 LbrtkwbzqnXJ7Ord0sbnL1cecUYAt0YFVXHTQk/JmImxVzykAN71ban2U1Tk+xxKSiwA
 nTayYRtYFHcttdDNczoyx7/Su9Cfk1AXUu1VxNf5wCQRIqY7owMkWYBlgbYTiqklIKqj
 1/Eg==
X-Gm-Message-State: AOAM531/B2CcMJLjqF8QHoulu1rcE7WxNMDzlzdCChEnb1XZunu02CG/
 35qWAMuTf5LrBZcTSL3GWzbmddQC5e3LaD1BY44Sr8Mk
X-Google-Smtp-Source: ABdhPJyHFBMoD3EpjZNZZ67IKqNfRPYMlYOLKow9z5LjsfUknWco2H/F7WWqQdd3jCNeg+8YA8Ej8P+WVQ1rMYxGizc=
X-Received: by 2002:a7b:c090:: with SMTP id r16mr912217wmh.56.1600716711938;
 Mon, 21 Sep 2020 12:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200921082429.2591146-1-liushixin2@huawei.com>
In-Reply-To: <20200921082429.2591146-1-liushixin2@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 21 Sep 2020 15:31:41 -0400
Message-ID: <CADnq5_O5y+5xp6JsQt=zXQ4wQOt7iVGiaHTvEV-V9SEW1U5-Zw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amdgpu/gmc9: simplify the return expression of
 gmc_v9_0_suspend
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
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> index 5400cac02087..cb9e9e5afa5a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> @@ -1683,14 +1683,9 @@ static int gmc_v9_0_hw_fini(void *handle)
>
>  static int gmc_v9_0_suspend(void *handle)
>  {
> -       int r;
>         struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>
> -       r = gmc_v9_0_hw_fini(adev);
> -       if (r)
> -               return r;
> -
> -       return 0;
> +       return gmc_v9_0_hw_fini(adev);
>  }
>
>  static int gmc_v9_0_resume(void *handle)
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
