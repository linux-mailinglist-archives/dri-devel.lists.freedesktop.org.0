Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D774D2487
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 23:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1E110E2BA;
	Tue,  8 Mar 2022 22:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DCA10E2BA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 22:57:21 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id n19so622538lfh.8
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 14:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8MuVYFNOaR9sliTT6PtGIJ1tDZacg9KCLiOwg2Rb9wE=;
 b=MXnPx5h0ijIvF7hzm97VrMTqvyic7sV48mwtFM03Cb2ZqYOIpnQ94270DTDJEPiPh9
 5CjRWWSGQtAApqB9y0tEUktv0WoI/5rS06ibAZJRqy6wYLCJ39pyFCAQa5vhGbS7jpt+
 RnHHXgNmhxv8e00HrU5+YGURkZWrbImCONWMl1DHCay8t/iiuqqtVW4ygi+TsCEAnnVe
 skhfJqTsnhWQHOKbDk3yD8UnHCafjqI1RpmaAPDM06Opmlw5WycySR/878Mppq8I00B8
 TSygBNI2YB8hFZCdpc9mwjDF1NaLFy4OrVQEjZ8wkBfIUT3UNgstcg7tJxHFRiikPcEM
 KnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8MuVYFNOaR9sliTT6PtGIJ1tDZacg9KCLiOwg2Rb9wE=;
 b=r87JxxRyAoEr4R60i4J3wcExD/M+cXF07cdhEfERm73JtYjPKVi28WUd61qlQFF1hD
 E711S/re7FEdO5uUNDGZnZpEP2Ya+01mXfJuh5CrjLigzFfmOTvayDIgtJbMyh/PH2Nf
 h+n7mhnldd8uf7odmkIC9YPtXXsrlID1SC/Z9/9FKzC5awoUv0DKM0j1qyc4z2+Zdz0Z
 8C/R+l/Z+O/ZxY4ZNVgEL5VtQp8+Qf1u05a0QgfKlSoZGlyb+WVmGB9S3WfLvv/s/2yC
 1peRZFtqSuBrZeIFLsWqN9sUeK0ziX5k7t6Af6WaHAcZS7ScjFh4rhNmSlCY0iFnMid1
 /TBA==
X-Gm-Message-State: AOAM531dZHj/Hl1tHGx6OUfxhArdl78SsVJPboNLVX9a2SrtY8RE7MCE
 ySJuusJN99i5G6Ol78Y1cL4dpGTk0eF2dkUbkcAcjimce6MyiZ4X
X-Google-Smtp-Source: ABdhPJzdL2oC651g9gnqpZ43uG6CG69kcwxMsKSo599esFmsA3M5zPERun34wywdexJK6V1Ow3rB18oZvOBuem+8a1Q=
X-Received: by 2002:ac2:5223:0:b0:448:5100:e427 with SMTP id
 i3-20020ac25223000000b004485100e427mr176322lfl.87.1646780239304; Tue, 08 Mar
 2022 14:57:19 -0800 (PST)
MIME-Version: 1.0
References: <20220303201943.501746-1-trix@redhat.com>
In-Reply-To: <20220303201943.501746-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 8 Mar 2022 14:57:07 -0800
Message-ID: <CAKwvOdnoV_SsFuWWJd4nOOd1vGG6_-gg-KvdOg4_NHuRp7_WfA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: check the return on anx7625_aux_trans
To: trix@redhat.com
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
Cc: llvm@lists.linux.dev, jonas@kwiboo.se, airlied@linux.ie,
 robert.foss@linaro.org, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, nathan@kernel.org, tzungbi@google.com,
 pihsun@chromium.org, laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, hsinyi@chromium.org, sam@ravnborg.org,
 xji@analogixsemi.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 3, 2022 at 12:19 PM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> Clang static analysis reports this issue
> anx7625.c:876:13: warning: The left operand of '&' is
>   a garbage value
>   if (!(bcap & 0xOA01)) {
>         ~~~~ ^
>
> bcap is only set by a successful call to
> anx7625_aux_trans().  So check.
>
> Fixes: cd1637c7e480 ("drm/bridge: anx7625: add HDCP support")

Is this the correct Fixes tag?

I think it should be

Fixes: adca62ec370c ("drm/bridge: anx7625: Support reading edid
through aux channel")

instead.

> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 633618bafd75d..f02ac079ed2ec 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -872,7 +872,10 @@ static int anx7625_hdcp_enable(struct anx7625_data *ctx)
>         }
>
>         /* Read downstream capability */
> -       anx7625_aux_trans(ctx, DP_AUX_NATIVE_READ, 0x68028, 1, &bcap);
> +       ret = anx7625_aux_trans(ctx, DP_AUX_NATIVE_READ, 0x68028, 1, &bcap);
> +       if (ret < 0)
> +               return ret;
> +
>         if (!(bcap & 0x01)) {
>                 pr_warn("downstream not support HDCP 1.4, cap(%x).\n", bcap);
>                 return 0;
> --
> 2.26.3
>


-- 
Thanks,
~Nick Desaulniers
