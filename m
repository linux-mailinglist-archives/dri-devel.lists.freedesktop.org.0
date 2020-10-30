Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE4C29FC54
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 04:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDC56E94D;
	Fri, 30 Oct 2020 03:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5711D6E94C;
 Fri, 30 Oct 2020 03:53:28 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c16so1706706wmd.2;
 Thu, 29 Oct 2020 20:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2FD2h7D4v2HS4oDKnH1ozkl5z/Z0lmckPIvoRH81OaE=;
 b=lDwiUGqe31YYTdcVzh2ub/9hCxgwWbd4hg6znAi74KYcScH0EqreAG4C1XmeV0kkpr
 4BHK/9Z/rRbK5WVSko+DcPz1K3OA66BJL1FcM2WKFTJLpzyLYh4bMPZlt3zpL4AZ5ooQ
 O2qjHrGiWXyqLfyoxsNaWpXnF0OGpNTufvrdVm6r2UF6TuUQozh+/zKS8Xu7R5GmeC3d
 gMSFPgfX7Iuvsql+XtxR/7WZlqAuM/h+pTu5k7WTc0nJBQ+xZIbtjuxsv+H5T5vFP8ti
 RlGlPocWeEzuPBf3DvYMWXIMAi0XJe0lg1hKn0i+u04cDID55sfZMqnhL6k4/Ff3219L
 E2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2FD2h7D4v2HS4oDKnH1ozkl5z/Z0lmckPIvoRH81OaE=;
 b=UElQChjy/ASIXw4YKZishcaZCAOlDpeLZ3MJ3oRJsNMQoueBYYAzmVgwMj5OA0EdAA
 6DSe8hueYdrdlYBe0hzUJdx3Z8YajqTlTxxU3LaF2ViH9jD014bfD0DXT88Pjg45Zxhz
 jO6TSN7E7h5zwkQthk8eoAWlFFbtlOuC5TMfPQ36QEmjvl0LgOHe5+5HrTr590Hn9Jd8
 EE+na7n4WOs8v1Um56F37qfrvEfuv8LELMDJlrp1l7UkwlunDkrPOplATHOZ8i/kztw5
 ay+1Suw/r3R0Qjpk+KLrq1jY+VsJSQ4QUmWX1ISRIM4jfOfm9H0PqFWNZs6XxXaoPRrg
 Sc1A==
X-Gm-Message-State: AOAM532neHjo9jHuUKKZ3fbA9mKanvma5rXX7qPa5QQhpGfyFwp5FhZx
 lacf8xWTDK7CqZhBZkPsEQBsPs1as1U/zy4XJkQ=
X-Google-Smtp-Source: ABdhPJwmM5iqHlfZ6Cf/n9mn4d3K9CcA0cI58sMTvHlsxSEJSmOe/+uzB8GaUumH85FrOM3YWbSwfQLbgHq6ZDb7jIM=
X-Received: by 2002:a05:600c:25a:: with SMTP id 26mr247532wmj.39.1604030007030; 
 Thu, 29 Oct 2020 20:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201026210039.3884312-1-arnd@kernel.org>
 <20201026210039.3884312-4-arnd@kernel.org>
In-Reply-To: <20201026210039.3884312-4-arnd@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Oct 2020 23:53:15 -0400
Message-ID: <CADnq5_MdJt02hpdTsvPDVwN4_1D7-1ybDexDreL6GjDipc_Yvw@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/amdgpu: fix build_coefficients() argument
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Lewis Huang <Lewis.Huang@amd.com>,
 Krunoslav Kovac <Krunoslav.Kovac@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Leo Li <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Josip Pavic <Josip.Pavic@amd.com>, David Airlie <airlied@linux.ie>,
 Reza Amini <Reza.Amini@amd.com>, Denis Efremov <efremov@linux.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 26, 2020 at 5:01 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> gcc -Wextra warns about a function taking an enum argument
> being called with a bool:
>
> drivers/gpu/drm/amd/amdgpu/../display/modules/color/color_gamma.c: In function 'apply_degamma_for_user_regamma':
> drivers/gpu/drm/amd/amdgpu/../display/modules/color/color_gamma.c:1617:29: warning: implicit conversion from 'enum <anonymous>' to 'enum dc_transfer_func_predefined' [-Wenum-conversion]
>  1617 |  build_coefficients(&coeff, true);
>
> It appears that a patch was added using the old calling conventions
> after the type was changed, and the value should actually be 0
> (TRANSFER_FUNCTION_SRGB) here instead of 1 (true).

This looks correct to me.  Harry, Leo?

Alex


>
> Fixes: 55a01d4023ce ("drm/amd/display: Add user_regamma to color module")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/amd/display/modules/color/color_gamma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
> index b8695660b480..09bc2c249e1a 100644
> --- a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
> +++ b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
> @@ -1614,7 +1614,7 @@ static void apply_degamma_for_user_regamma(struct pwl_float_data_ex *rgb_regamma
>         struct pwl_float_data_ex *rgb = rgb_regamma;
>         const struct hw_x_point *coord_x = coordinates_x;
>
> -       build_coefficients(&coeff, true);
> +       build_coefficients(&coeff, TRANSFER_FUNCTION_SRGB);
>
>         i = 0;
>         while (i != hw_points_num + 1) {
> --
> 2.27.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
