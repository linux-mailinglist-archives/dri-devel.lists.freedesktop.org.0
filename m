Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C55AE772A1E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB30C10E1FF;
	Mon,  7 Aug 2023 16:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6702D10E1FF;
 Mon,  7 Aug 2023 16:07:01 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3a3efebcc24so3464219b6e.1; 
 Mon, 07 Aug 2023 09:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691424420; x=1692029220;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7o9SBVPzxyZdcldhRu9dD8c45lGIBGn38eeuuL6Ze0U=;
 b=PH+n3uy8x2QtON55O5Vtf1QADgE32iiYBwxE80aaHxP04ejgQ+5CIAZAM910nQ5LyU
 yBRPXpTb6b3/S56w6eD0uTlN8ss5uMFuZ2sgThPBO19HD0BMpePH6BsSH6nL7p1cYLxk
 05GDy8lb/9z9nShBWmuJlgTzHI7xTJGwyoqkcWg99Xp+4tBCvHs9LOBsEQO7EOlexak2
 ZAA8928oO8LCjC4YhdG2EES5NkC1RzOqO0O/uW1X3OFyDIk0bQ8OcADzAdCeHPewc0Nd
 7Sb1UorKxGb4oHO3tZS3jZbhUdnoOBgYMfQ9RnjTUtv83cYQQer/2RQ2fJPZK0XH0v+Z
 Lc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691424420; x=1692029220;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7o9SBVPzxyZdcldhRu9dD8c45lGIBGn38eeuuL6Ze0U=;
 b=g9LJNOh5YwCs+yQTGgxdHEtmX8Qhudz+NDFp9Ibte5MamnUjjRHGABN1fgge6Yw29A
 G+104V0DDHREd+1H03h7NxkoJi4ybL0lfac8obaH0TR49ob8IfvReUkVMaYN6X5MZyG2
 ME7wrMb/k93w3UVw1nUY+4N4C7VJ4e6XYBWB1NuRfQT4DoeWKHHMdLuavfOYkbEUTG3/
 5ILInykES+pPRHEvTqOcyPL37RUJRPn79Pt9EWH515Oz9kqYrLZLA2Q5zZOlbIsXJjZ0
 6zs8ql0ulms0A/orWbadRNDzcyRMmuG1s/ZhpyFn82hm9SlupWYyxBBCnbLdTJOSAcI+
 cF4A==
X-Gm-Message-State: AOJu0YxNOHFaF7XIQJkLbKenOfU9XWVLgJFGqkHZMQvak33uEptCGxjO
 yfs7G6S0kbKdnxqNOQLWAQvy8aiOVzlWdPBM0ts=
X-Google-Smtp-Source: AGHT+IFWQmuBYiX4eO8MVzB+m38ZmimznirBldbEBm1Ubp6pLNvrWg5ea1IcokTSNu21NQG/DUFs/U9zAhIymcQO700=
X-Received: by 2002:a05:6808:152c:b0:3a7:8725:f37c with SMTP id
 u44-20020a056808152c00b003a78725f37cmr7468703oiw.10.1691424420477; Mon, 07
 Aug 2023 09:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230803141116.58883-1-arefev@swemel.ru>
In-Reply-To: <20230803141116.58883-1-arefev@swemel.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:06:49 -0400
Message-ID: <CADnq5_MSXxaAnF+4t1X_v0enooY5Xb8BSpo8f7pPe8g7mPT6AQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Return value of function
To: Denis Arefev <arefev@swemel.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: trufanov@swemel.ru, lvc-project@linuxtesting.org,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, vfh@swemel.ru,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Aug 3, 2023 at 10:18=E2=80=AFAM Denis Arefev <arefev@swemel.ru> wro=
te:
>
> Added return value check hpd_enable
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Signed-off-by: Denis Arefev <arefev@swemel.ru>
> ---
>  drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c b/driv=
ers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
> index fa314493ffc5..bf2f620aeb66 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
> @@ -1645,7 +1645,7 @@ void dce110_link_encoder_enable_hpd(struct link_enc=
oder *enc)
>         uint32_t hpd_enable =3D 0;
>         uint32_t value =3D dm_read_reg(ctx, addr);
>
> -       get_reg_field_value(hpd_enable, DC_HPD_CONTROL, DC_HPD_EN);
> +       hpd_enable =3D get_reg_field_value(hpd_enable, DC_HPD_CONTROL, DC=
_HPD_EN);
>
>         if (hpd_enable =3D=3D 0)
>                 set_reg_field_value(value, 1, DC_HPD_CONTROL, DC_HPD_EN);
> --
> 2.25.1
>
