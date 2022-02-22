Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 790EF4BFEFF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 17:40:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4036810E803;
	Tue, 22 Feb 2022 16:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B03210E7FF;
 Tue, 22 Feb 2022 16:40:32 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id p15so15145834oip.3;
 Tue, 22 Feb 2022 08:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p40txYoRuDqRToAk//92DsV14CqomtL3Q8ARQVWa/nE=;
 b=TkCFnrgW0aoLHODg9trdPkzSCZhWdz2TpEfAoMCyxt+YUGogRXWkGP51I4Pvac+mW1
 lDSXdMyHaAnGC5BFOVYuGq7XQ0L9Smf8ey4INkOhItVXkekZQqk2BYpaX7elAkS/R01i
 nF3Gj41+2U3ukwABWrB0UaoXZNcF5TSffK7YT4AF2nHAty6DEVRQ6OC6PHihbR8rjd4w
 z914Z2jKY2lAuzRd6z6xcm178A7g9Liup+3zN+pYqHCqbt4NLhBY7+Rz7RUmhfp3oY7p
 BGdY6U+9i774sAXJ1GNG0907qbMtwmq3lVw8AtF0fjTJuBwRmZigbZANGbyr5vFz6vRk
 3V0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p40txYoRuDqRToAk//92DsV14CqomtL3Q8ARQVWa/nE=;
 b=OqHv02S8+umAkOAw5D/6fbIJo/YP/GPAIMYBa+AU8XwiDBgM8hCY2CjBzR2c3vAzlJ
 QxEOJkNKjH3yvmJ/Fz16HMFkkX39ZL9bSuPzv4sqt/a03uZxEuNEy4jkqd0+iJr1sd5o
 ZZq9UsuNCjhPJvr0VxRLsyrMrmDOJUuWjCMxRnekNhDpz7eRLDctccS62qhNUx0yFttM
 PF+tQrn3Iq8GDm3Ao9+5IKj9b/WZQcLLU5Vix8tUY8fibIMi+y/c0OjQ+F6f6s/nqEKl
 buck+UXbicTIVrweyQVl10pTfagpM4ah7X9Gn1bkktohPtjSBf0Gy9V/jLyAJFQEoCEf
 IuxQ==
X-Gm-Message-State: AOAM531eAXWdVKqPWGvCJnp5iW4C6FDZAtyDsCsMW3czdPTLVWBafsaJ
 DRFflTtJtCqQW9hKZMZm7kM6xFU4i+qywB+kK2U=
X-Google-Smtp-Source: ABdhPJzGgNDMe4B8iHx1OozJUpsE/fOo2XJZsl0TfO1F2smK9orBVi+gBIiiqvVg+AvsVwgn36rMJ9ruAYaTFI7pEXw=
X-Received: by 2002:a05:6808:612:b0:2d5:1c6a:db4 with SMTP id
 y18-20020a056808061200b002d51c6a0db4mr2488935oih.199.1645548031784; Tue, 22
 Feb 2022 08:40:31 -0800 (PST)
MIME-Version: 1.0
References: <20220222131701.356117-1-maira.canal@usp.br>
 <20220222131701.356117-9-maira.canal@usp.br>
In-Reply-To: <20220222131701.356117-9-maira.canal@usp.br>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Feb 2022 11:40:20 -0500
Message-ID: <CADnq5_MqzkkNaXRuEqx8oCdF=zL9GgAWF_UNR=21BO4MaojydA@mail.gmail.com>
Subject: Re: [PATCH 08/10] drm/amd/display: Remove unused variable
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>
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
Cc: "Tuikov, Luben" <luben.tuikov@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, "Joshi, Mukul" <mukul.joshi@amd.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mwen@igalia.com, "Chai, Thomas" <YiPeng.Chai@amd.com>,
 "Stanley.Yang" <Stanley.Yang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Magali Lemes <magalilemes00@gmail.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Isabella Basso <isabbasso@riseup.net>,
 John Clements <john.clements@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Dennis Li <Dennis.Li@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Feb 22, 2022 at 8:18 AM Ma=C3=ADra Canal <maira.canal@usp.br> wrote=
:
>
> Remove the variable clamshell_closed from the function
> dcn10_align_pixel_clocks.
>
> This was pointed by clang with the following warning:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:2063:=
7:
> warning: variable 'clamshell_closed' set but not used
> [-Wunused-but-set-variable]
>     bool clamshell_closed =3D false;
>          ^
>
> Signed-off-by: Ma=C3=ADra Canal <maira.canal@usp.br>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/=
drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> index 8dc1afc03961..559aa45f27e7 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> @@ -2060,14 +2060,11 @@ static int dcn10_align_pixel_clocks(struct dc *dc=
, int group_size,
>         uint32_t embedded_pix_clk_100hz;
>         uint16_t embedded_h_total;
>         uint16_t embedded_v_total;
> -       bool clamshell_closed =3D false;
>         uint32_t dp_ref_clk_100hz =3D
>                 dc->res_pool->dp_clock_source->ctx->dc->clk_mgr->dprefclk=
_khz*10;
>
>         if (dc->config.vblank_alignment_dto_params &&
>                 dc->res_pool->dp_clock_source->funcs->override_dp_pix_clk=
) {
> -               clamshell_closed =3D
> -                       (dc->config.vblank_alignment_dto_params >> 63);
>                 embedded_h_total =3D
>                         (dc->config.vblank_alignment_dto_params >> 32) & =
0x7FFF;
>                 embedded_v_total =3D
> --
> 2.35.1
>
