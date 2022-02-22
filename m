Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6980D4BFF0C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 17:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C965910E871;
	Tue, 22 Feb 2022 16:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0095C10E86C;
 Tue, 22 Feb 2022 16:41:15 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 u47-20020a4a9732000000b00316d0257de0so18349416ooi.7; 
 Tue, 22 Feb 2022 08:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YXHD+C0/B8yXZE8EfrgFtwcPwJgyLlmaD7cEYGEmRMM=;
 b=fuBlPcCzxrvT7+ShgM3+W3qsp2u2V09DJmwqNLjX5fLhy8dc8j6/w2JhloLbmKInG8
 XNqQmB8Rp+vR7/XvSAScTjH/URtFM43zt8LOmtmew8O5k5Y6dhZ1Dp/ePsMeph62HmWB
 eurPiPNpYGp+qmwdrBhTqfwOCdl26C3gAd5+ayQ8HL6xO/tLZ/CNHzfatDwwpw8/if/d
 ZVkgN14V5KAxCaesOfAUhsGGP8cUDJHD/d979cQFm8yTuVxSXW5Cl7Jl0wov3NwNVOET
 YT2rO3Xdq+qTv1ItNrlgA7CYu/z48farfnqcgHkAIfwu0gYbGSRd98id1a3OtbiFR+Q0
 EQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YXHD+C0/B8yXZE8EfrgFtwcPwJgyLlmaD7cEYGEmRMM=;
 b=dRziLLxWD4Pok2lQhP208Kq5aPUcPKhpNhbqXqmURpiTM3PmEKECzB7Hosoem7Fr8B
 S1E1QgbCnA5Sr/Tib6TrNS2afsyURmM3K7uQi5Ho7BvxvY1q6dmJIdVAlcPRUYJDu3sK
 tpxmHxJn10NGvPgLtsbz5c6GWh5Ml8oOUgwRnz4XxuTZm1bsX4o34gaNDD6u7Ay510v+
 mZRxMwyZEr373smkrusZBXYu6ZxcEjcwVhmFJ452unJ04JYmMqZGwB06IYJoPfFOkkCl
 OhGrLH2Ltchn8pZqAZpVI7XigSxz44Z1VKTX19fcEJ2NSZRX0KMg0wtzfkVdibq5RIS8
 u8GA==
X-Gm-Message-State: AOAM531h/UY2bHfd362kWClLC2VOBjHjpmPj3Gq3LxLtIKpHZfxLGtoE
 gkAZvyg90CyutUB6en5r0TmjAWKAEsCzh1E26i4=
X-Google-Smtp-Source: ABdhPJya4bay6XYFIZCyMsuysyg0pIii92FwYXZtsMNZ0psrVz6aeSWA23ZVot6d/3GAmeGPNEphCTWbuu8Dw2gDNWA=
X-Received: by 2002:a05:6870:3e0d:b0:d3:fe6d:57c3 with SMTP id
 lk13-20020a0568703e0d00b000d3fe6d57c3mr2042169oab.225.1645548075325; Tue, 22
 Feb 2022 08:41:15 -0800 (PST)
MIME-Version: 1.0
References: <20220222131701.356117-1-maira.canal@usp.br>
 <20220222131701.356117-10-maira.canal@usp.br>
In-Reply-To: <20220222131701.356117-10-maira.canal@usp.br>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Feb 2022 11:41:04 -0500
Message-ID: <CADnq5_O-LmQ3qD7p0bHHhcc7BRpExahhtg9d4dcPx1_x3pDzUw@mail.gmail.com>
Subject: Re: [PATCH 09/10] drm/amd/display: Add missing prototypes to
 dcn201_init
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
> Include the header with the prototype to silence the following clang
> warning:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_init.c:127:6:
> warning: no previous prototype for function 'dcn201_hw_sequencer_construc=
t'
> [-Wmissing-prototypes]
>     void dcn201_hw_sequencer_construct(struct dc *dc)
>          ^
>
> Signed-off-by: Ma=C3=ADra Canal <maira.canal@usp.br>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn201/dcn201_init.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_init.c b/driver=
s/gpu/drm/amd/display/dc/dcn201/dcn201_init.c
> index f1f89f93603f..1826dd7f3da1 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_init.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_init.c
> @@ -27,6 +27,7 @@
>  #include "dcn10/dcn10_hw_sequencer.h"
>  #include "dcn20/dcn20_hwseq.h"
>  #include "dcn201_hwseq.h"
> +#include "dcn201_init.h"
>
>  static const struct hw_sequencer_funcs dcn201_funcs =3D {
>         .program_gamut_remap =3D dcn10_program_gamut_remap,
> --
> 2.35.1
>
