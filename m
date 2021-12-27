Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A65BB480312
	for <lists+dri-devel@lfdr.de>; Mon, 27 Dec 2021 18:57:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C8410EC72;
	Mon, 27 Dec 2021 17:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADDF10EC71;
 Mon, 27 Dec 2021 17:57:31 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 w19-20020a056830061300b0058f1dd48932so20875408oti.11; 
 Mon, 27 Dec 2021 09:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BW30tn1YOaWNFa+8QoO7oT2uLa84tu10Ml26KctqUJY=;
 b=dlOulSeH6GQ72XuLeRkFw0Hg0y6ijmrlqdTd/N9roWJG0OQ5AuatlGyvK2e5vXDZni
 Glp2asIPa/x0PK0RaN0LE6/Udp4EOhGNRutGILHL1SWH60R/yNH7IcSkC5yrM1UBuGor
 I9fgEc74e6couTMUZw2AhRtM0qonSepEJtsp9LQY+icOEKtYAPaPiWAhsqzJylHQ3Ue/
 lAPK73mRtkjYC/w9GcMfgpPv5vCZAMeOL0Dgwz7ZGIBhKiApYMb69XXqQ9OAd58QF37K
 4HbTTs+/o66xkTtGoKMzAGZjXuW7fUiLSJKq1I9fa3lNxdTKioGHpln5uqRmieUXQJwu
 u/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BW30tn1YOaWNFa+8QoO7oT2uLa84tu10Ml26KctqUJY=;
 b=jM45bEEMJNrGhyi6iTGYzaFkvvJvOHmVJ06XgFlHRoPhln/dpAe/vkTQpgL6nqtzeZ
 lDYE+CQL/zbPXtD7WTPnjhEgZteZpS0OjfTQ8EmsX3fBndNGjq6rJOFch5teonHj/T8Z
 y5ltAPIvPFQjvtQ1z+ez0fpWgOxbi1vtpTGgW9d6xhuy6R0wEwV0CYRwTnXVD+f3a9oX
 ZlHyNw+UvTaN+dCzpanqF7hhhPVtlA0q91HK67UrdSOH0o6K0wfS/4YQkDn5LrZY/5Bd
 ZrcDgtKjv5t9wD3Jp/tZoIQK9OtHKi/b5YoCvxK0rQcNIoDMue4Tw7oz9Oc8HpCSqriY
 q0hQ==
X-Gm-Message-State: AOAM532CsrQiUL7G79rZSiu/HfmDJqO+HM1BUyj2ZQUvJj4aeQ8qXWzC
 3jrE1F2QyDPg+1sZu7bWuvHTbf1vYZOVUtEgayQ=
X-Google-Smtp-Source: ABdhPJwrnPXyP+/e7seaUaSuYFcBL04y9tZVeVuQyzYHFBrDwhGXblrapVe3azHehekSvIVKE+Ob82oiYHknrLLEclw=
X-Received: by 2002:a9d:6390:: with SMTP id w16mr13539799otk.200.1640627850700; 
 Mon, 27 Dec 2021 09:57:30 -0800 (PST)
MIME-Version: 1.0
References: <20211226111614.30181-1-jose.exposito89@gmail.com>
In-Reply-To: <20211226111614.30181-1-jose.exposito89@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Dec 2021 12:57:19 -0500
Message-ID: <CADnq5_N9b_Wm2GrLfL9Ug4rXN4Wqqv6kM+KxGf+kguoj6Wfytw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/display: fix dereference before NULL check
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
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
Cc: Charlene Liu <charlene.liu@amd.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sun, Dec 26, 2021 at 6:16 AM Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gm=
ail.com> wrote:
>
> The "plane_state" pointer was access before checking if it was NULL.
>
> Avoid a possible NULL pointer dereference by accessing the plane
> address after the check.
>
> Addresses-Coverity-ID: 1493892 ("Dereference before null check")
> Fixes: 3f68c01be9a22 ("drm/amd/display: add cyan_skillfish display suppor=
t")
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> ---
>
> v2:
>
>  - Fix coverity report ID
>
>  - Add Reviewed-by tag (thanks to Harry Wentland)
> ---
>  drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c b/drive=
rs/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
> index cfd09b3f705e..fe22530242d2 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
> @@ -134,11 +134,12 @@ void dcn201_update_plane_addr(const struct dc *dc, =
struct pipe_ctx *pipe_ctx)
>         PHYSICAL_ADDRESS_LOC addr;
>         struct dc_plane_state *plane_state =3D pipe_ctx->plane_state;
>         struct dce_hwseq *hws =3D dc->hwseq;
> -       struct dc_plane_address uma =3D plane_state->address;
> +       struct dc_plane_address uma;
>
>         if (plane_state =3D=3D NULL)
>                 return;
>
> +       uma =3D plane_state->address;
>         addr_patched =3D patch_address_for_sbs_tb_stereo(pipe_ctx, &addr)=
;
>
>         plane_address_in_gpu_space_to_uma(hws, &uma);
> --
> 2.25.1
>
