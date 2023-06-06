Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A43724CF3
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 21:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB43F10E257;
	Tue,  6 Jun 2023 19:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2654F10E267;
 Tue,  6 Jun 2023 19:23:46 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-565eb83efe4so82932807b3.0; 
 Tue, 06 Jun 2023 12:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686079425; x=1688671425;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yAk03zc/P/OUBf9OltBs8qALiN+AwjCHAF6DHi78NMo=;
 b=SNBH6UZxGc/79+TYo8HTtHxwzZqrT60RJOunfcuti2i/qDYLaOELL85i3GplTWEA77
 kw7eLZ2heliDsRnoZgPTHSb1muZSgT3vzNJlmp0PnbsnP8IoBuaGA6EkVXc7TQPoKRKX
 Xq9zJ53VBLLd9hN57XL9gvl6QJ81SrjsrPopuXQogxZNodWKHXPdtfveBCBUh97mkeH7
 vwoclsA0vYmLexjS/KquDPoyqE8EGQjwnIE5OEWC3CIBOTdtMUZ/OOD+jGZl8v+Z4jj9
 2pQ08TFQO1lHf46gYHIPvh89l9t2f4P1GqhqPYIwjCaEskXXw8ZxMNXF97C+8XhFQQTh
 tXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686079425; x=1688671425;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yAk03zc/P/OUBf9OltBs8qALiN+AwjCHAF6DHi78NMo=;
 b=S7yj40aYZ8c8r0owCvmPt4seIbqJs8L2IMyBXwqFGMIanU4ivfOqFoVeBQGyByxK0m
 9ATtqRJFKzwkidiG58smUyshmalFatEZjVVuuamJnR4hw65fCvF4Iq3xgVD9Adbay4he
 MZoEdMZqHt6FUmxkw3vDeyj/yX6E1nc4JC4TJVRyj+zRekU0PyESsTSPGmX7S5JARv34
 wNmp3a5tDo8he9B/wHx/ar8s0l3CqYPPgGT+fnARDMEEozTcJ+ytO9N2rgcGt6iWHLF2
 Yg60ZMia9U/kqWAqq6Z6LYacNJWh4qN80ruUejZPljzPI7HVb3jZJ+bin4+dmDCbdJ0g
 UQog==
X-Gm-Message-State: AC+VfDx/LhJu0wDR8lKDBwZOBPx4Nv+ojE1IXDcIqEscwWEqUZ6nV2pj
 1CuKUwn5UDEx+7jywHNjY0h14/Xv16I3ZCiuJXmOW7j+
X-Google-Smtp-Source: ACHHUZ7Lkapm2zMouLuWDboS2854o1EUXzupJUtwa8UNGIhcc5zWPNz52eerIVZdGHIaFomZfJk728gzaKKw6No/oZM=
X-Received: by 2002:a05:6870:52d6:b0:1a3:125d:333b with SMTP id
 p22-20020a05687052d600b001a3125d333bmr1927975oak.56.1686078927962; Tue, 06
 Jun 2023 12:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230606133328.148490-1-suijingfeng@loongson.cn>
In-Reply-To: <20230606133328.148490-1-suijingfeng@loongson.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 6 Jun 2023 15:15:16 -0400
Message-ID: <CADnq5_MdNSBJuNrJC2-fRByhEoUqEJmMGATT+OrFvjqA7k4F5Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: display/Kconfig: replace leading spaces with
 tab
To: Sui Jingfeng <suijingfeng@loongson.cn>
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
Cc: Leo Li <sunpeng.li@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Jun 6, 2023 at 9:33=E2=80=AFAM Sui Jingfeng <suijingfeng@loongson.c=
n> wrote:
>
> This patch replace the leading spaces with tab, make them keep aligned wi=
th
> the rest of the config options. No functional change.
>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/amd/display/Kconfig | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/di=
splay/Kconfig
> index 2d8e55e29637..04ccfc70d583 100644
> --- a/drivers/gpu/drm/amd/display/Kconfig
> +++ b/drivers/gpu/drm/amd/display/Kconfig
> @@ -42,16 +42,13 @@ config DEBUG_KERNEL_DC
>           Choose this option if you want to hit kdgb_break in assert.
>
>  config DRM_AMD_SECURE_DISPLAY
> -        bool "Enable secure display support"
> -        depends on DEBUG_FS
> -        depends on DRM_AMD_DC_FP
> -        help
> -            Choose this option if you want to
> -            support secure display
> -
> -            This option enables the calculation
> -            of crc of specific region via debugfs.
> -            Cooperate with specific DMCU FW.
> +       bool "Enable secure display support"
> +       depends on DEBUG_FS
> +       depends on DRM_AMD_DC_FP
> +       help
> +         Choose this option if you want to support secure display
>
> +         This option enables the calculation of crc of specific region v=
ia
> +         debugfs. Cooperate with specific DMCU FW.
>
>  endmenu
> --
> 2.25.1
>
