Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A9050E696
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 19:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9479410EF9C;
	Mon, 25 Apr 2022 17:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85CB10EF61;
 Mon, 25 Apr 2022 17:10:12 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so16733040fac.7; 
 Mon, 25 Apr 2022 10:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FKPxk8T+PNpsX+t/Fbj+aBKeJtlWLiqDlWC/CAfDx2c=;
 b=g0SEwyj8gHZs144Ip4riSiMjWfpHFrJ7xX50lQ82lYEDVCaeszdY9VQ0BYoq1/QoCh
 pQDNtjETe+ryPaZ5Y2Ma02dVLaA1lVpR2Q0RJSbfyaKWRBpiJAHvjg+gLUeZLbV6s6og
 Ztc7244wbNq6eX98h1Dg6dHTDmYqhfh8JqKgDQdgojPMUeChiYEhbwIvM+vp/tVTdV8t
 rL3jRYH4SwCTpeYgoCcdvm0GQfDTl54LEsqlZCQJ9r1g9OEpnHYdxv3KoSWpAqVLTpsw
 qXHzNf6Uykj954vKSAWJFT33aJppnWltm7TbfRjLgx6jHC3yh/398OIt7ED8UeipIt1s
 txHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FKPxk8T+PNpsX+t/Fbj+aBKeJtlWLiqDlWC/CAfDx2c=;
 b=Tua+k1pKgz4/R7GrIqGnwkQR634MB0ri+FXn4TzQ8Z0TKAf9d2Hc2zyO5vosUwWCq6
 1RnK6yINB7PglMFQlB72uNoBFS+CCoBG3kCxlvGcuUphuc/+Y/R3MQX7/08fIi5wM7+U
 Nz5FyQqVOAn646kg92dOBrt8cp4CqOLmfw8tskiICZObgWjUwqkq5dpVwNwpzGrpVlEe
 XUFPlLUYHE3TW4Ej/IVlk8aXQI81OsiaR4ttEzfhxqQcJ365md03HYQTJjlZG7YadyK6
 91s1HY0MC/PYdnoKhNSWL/GaGui7fPvQf/a0wv0S4x6mfpJTg7H4eVMfeWfZGIujuJKX
 H8jQ==
X-Gm-Message-State: AOAM533quS3OouOZOS0w+2dKqXUmCBkSV6eq7Dcq+JnF8RwZnHj2ZVw6
 BkyiBF7T8hBvKoYfxWmyPAZCouPMcad5AwNYKYk=
X-Google-Smtp-Source: ABdhPJxDeMcCi6n0Vl4q2/ICp4DEmjg3kaj7k4WDNM3ZtsZWC6eVYEyE4tZ7EkHRjQNcogaKJ5M5u9+pBxCZQrJujFU=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr11123566oaa.200.1650906612105; Mon, 25
 Apr 2022 10:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220423200155.1735336-1-trix@redhat.com>
In-Reply-To: <20220423200155.1735336-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Apr 2022 13:10:00 -0400
Message-ID: <CADnq5_Oys5RXiksMGW8kvFiZ+DknGRqMnR6njEN1DZGWhYRcEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: change cac_weights_* to static
To: Tom Rix <trix@redhat.com>
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
Cc: Dave Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sat, Apr 23, 2022 at 4:02 PM Tom Rix <trix@redhat.com> wrote:
>
> Sparse reports these issues
> si_dpm.c:332:26: warning: symbol 'cac_weights_pitcairn' was not declared. Should it be static?
> si_dpm.c:1088:26: warning: symbol 'cac_weights_oland' was not declared. Should it be static?
>
> Both of these variables are only used in si_dpm.c.  Single file variables
> should be static, so change their storage-class specifiers to static.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/radeon/si_dpm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/si_dpm.c b/drivers/gpu/drm/radeon/si_dpm.c
> index 3add39c1a689..fbf968e3f6d7 100644
> --- a/drivers/gpu/drm/radeon/si_dpm.c
> +++ b/drivers/gpu/drm/radeon/si_dpm.c
> @@ -329,7 +329,7 @@ static const struct si_dte_data dte_data_malta =
>         true
>  };
>
> -struct si_cac_config_reg cac_weights_pitcairn[] =
> +static struct si_cac_config_reg cac_weights_pitcairn[] =
>  {
>         { 0x0, 0x0000ffff, 0, 0x8a, SISLANDS_CACCONFIG_CGIND },
>         { 0x0, 0xffff0000, 16, 0x0, SISLANDS_CACCONFIG_CGIND },
> @@ -1085,7 +1085,7 @@ static const struct si_dte_data dte_data_venus_pro =
>         true
>  };
>
> -struct si_cac_config_reg cac_weights_oland[] =
> +static struct si_cac_config_reg cac_weights_oland[] =
>  {
>         { 0x0, 0x0000ffff, 0, 0x82, SISLANDS_CACCONFIG_CGIND },
>         { 0x0, 0xffff0000, 16, 0x4F, SISLANDS_CACCONFIG_CGIND },
> --
> 2.27.0
>
