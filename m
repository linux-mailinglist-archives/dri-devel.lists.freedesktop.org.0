Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 276CA772A75
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825EC10E2A7;
	Mon,  7 Aug 2023 16:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762D410E2A6;
 Mon,  7 Aug 2023 16:21:38 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1bb571ea965so3610376fac.0; 
 Mon, 07 Aug 2023 09:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691425297; x=1692030097;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W6a6OPGqjVivVDw1eoWRT/DMOBdbCCUrI0pcLxomi0w=;
 b=b8xSm4HEayy9a0u8zHlqX6LS/nvpqAH9HKyb7F5ICDjpGy/eYcNvMc54RfC/nWPvVd
 NlCEnfjLDMSj0d3flf7SS5/MI1QGfd8jjVqP7u+OajuWWD7CwywAk/NKUAYmwHQsf3vr
 EhBbwbnoR5B99pcE5jg/4K63eTmn9RT61M6ETknfLCMQTnhfQCXMxAsK+1s6WFtsqdaO
 9EFpm6n69F6jX0n/DbO32hhKC4SicrBhlMmwFas9DVSsriks+gp65VdT2UGjbnbi3YbZ
 P3IXBX6VLURauHOnwFi+b/oCHxYbNyE3ha7nmWwA/0FtiJYKErKhG6ZvRYqZo37d/xO6
 MnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425297; x=1692030097;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W6a6OPGqjVivVDw1eoWRT/DMOBdbCCUrI0pcLxomi0w=;
 b=Qh/20JoMrOnSUUVC0zZFSD8Cj8Xgp8ctNvsZRlhYYmZbJxGl161pFeD5gd+zUfWk0z
 5XlZB8h6dz4YmAPr2DGWIxSgGLTxNZN0E3KQlU1rZozi/i4ibXddYJAMXcZRaTEHsdgW
 UxrIlQsN90ISZ/bDU+MywEFMfcxV1CmyKJYc7X8ugNONIk60StYEKtzJ/azm42e0ihI8
 lb4QBnAd89Ek9QtvrjepD4+eokCxUObspJff1HEkUEJsan8b8bi37fR5RNGHF3hLZrBc
 FADb3HMoHfTQp0XNtMU4+B9QMPatpS0WsIwu50i9Yjhs+8I6d6W5k99QuiCheI7yDSyj
 Uokw==
X-Gm-Message-State: AOJu0YxSltb5/xa6DuRmSq0aPTDeqWmhq4qB73Xv7bKnhv6IxYWYXabC
 w1JFvINXrvajlcTL3i6IwTsdXG8YtLs3SZmsAjs=
X-Google-Smtp-Source: AGHT+IHkQbeZrmJm8STaoLnhIdcxpNY5NmiGjOO7tyrMjyxIIgZifm159Q1bsgtg2qO+pREbHpds+OSLviai86hpVA0=
X-Received: by 2002:a05:6870:5607:b0:1bb:b13c:7f9c with SMTP id
 m7-20020a056870560700b001bbb13c7f9cmr10569693oao.57.1691425297605; Mon, 07
 Aug 2023 09:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230801020625.4281-1-sunran001@208suo.com>
In-Reply-To: <20230801020625.4281-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:21:26 -0400
Message-ID: <CADnq5_M9j6pM+cic6PHj2k+AhkxnsyYfWMh2gfJ168uQD2jANQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in smu_v13_0_6_ppt.c
To: Ran Sun <sunran001@208suo.com>
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Jul 31, 2023 at 10:06=E2=80=AFPM Ran Sun <sunran001@208suo.com> wro=
te:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: code indent should use tabs where possible
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drive=
rs/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> index 1ac552142763..43afa1ee1b4a 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> @@ -1248,9 +1248,9 @@ static int smu_v13_0_6_get_power_limit(struct smu_c=
ontext *smu,
>                                        uint32_t *default_power_limit,
>                                        uint32_t *max_power_limit)
>  {
> -        struct smu_table_context *smu_table =3D &smu->smu_table;
> -        struct PPTable_t *pptable =3D
> -                (struct PPTable_t *)smu_table->driver_pptable;
> +       struct smu_table_context *smu_table =3D &smu->smu_table;
> +       struct PPTable_t *pptable =3D
> +               (struct PPTable_t *)smu_table->driver_pptable;
>         uint32_t power_limit =3D 0;
>         int ret;
>
> @@ -1366,8 +1366,7 @@ static int smu_v13_0_6_set_irq_state(struct amdgpu_=
device *adev,
>         return 0;
>  }
>
> -static const struct amdgpu_irq_src_funcs smu_v13_0_6_irq_funcs =3D
> -{
> +static const struct amdgpu_irq_src_funcs smu_v13_0_6_irq_funcs =3D {
>         .set =3D smu_v13_0_6_set_irq_state,
>         .process =3D smu_v13_0_6_irq_process,
>  };
> --
> 2.17.1
>
