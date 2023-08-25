Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F676789175
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 00:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB00210E15C;
	Fri, 25 Aug 2023 22:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CE210E15C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 22:12:51 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50098cc8967so2218959e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 15:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1693001570; x=1693606370;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SkDyGFLOPkor6CsSqEx1av4BTza+8feNyKNHk0yvR74=;
 b=pO2A3xQ1p8QFqLOQ0bEKirF5S5oukYeUe2XGdbYZ6OYDoM/sGVEVJMGZUPCYO8E3wY
 CbVG26ghtYSa48fA70Zk/DaiAWgdqADDyEiSZ5KFABWLlYJVivaWxhTW3bm9AJ1LcUlm
 BrdPbWrS/tlfrjCtdHz5US/69yvF4rs5e5+MA7HgZQUcxWg9qIybpMxbwAToyKGlOkEA
 2uS5kOWXuVGOZ1NeLjTXeOhTaTbl7szklIOnHr2WI5FmCVY3W2sYYrU92ak7bBoWD8U/
 lYFO6K8We2XMAeF51MOGiXayhC77U97OCmNIcil4BGmUND0py5ta3JbutTOYRXeGLdw0
 F7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693001570; x=1693606370;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SkDyGFLOPkor6CsSqEx1av4BTza+8feNyKNHk0yvR74=;
 b=YoPwDElwoB+8dQkJDHsDPYVHNi8vzp3DCyLB0ZlvtyL/2paF0FL0UfQcPJ/Ujd7xNp
 VMhHDYvqMW0j2mQqU5F0ML7BA0qCrlVf70tr3PrMfv7yASgM9WPiTaYrQeLx3xXQCL5x
 0Zei668Icbotagt+qmbAc36oSjLmcObEkCJ6L8GFOC76Y7PiQKR/r0CzPl/Y5b/ykIgu
 v1/+OS+cT8/9nx2de4RrlcnhlEmmdHgDKZdoZ0qLA7dXKChidKzP+yVYl98Bu8QN5Zbu
 jioCmy3wzH02xll9H8ZVA9w3gdoQhdzPlqxolez4jPN/X+ufMytXYsbyKr1hGMlsJx6N
 XRoQ==
X-Gm-Message-State: AOJu0Yz5fVse4Ta4w6btvh1PDteAfxGdCZYg9Kqg3+YQPceYQyDkT4Z/
 ClBGTw1xawVvB7JO1Xd16KPfMu+H0w2cNdh+Pt8k6tDZkq085CBPzK0zng==
X-Google-Smtp-Source: AGHT+IEn2JzE6UCZ8KIXqUJv+vx7r5gB/pBzvkXtK/pE4WNVUOx5eUKdVpuE9DHm9KftwRSaJ0dXd/SmBDpcBsaSXXo=
X-Received: by 2002:a05:6512:31c8:b0:4fe:8f66:28a3 with SMTP id
 j8-20020a05651231c800b004fe8f6628a3mr15305230lfe.0.1693001569644; Fri, 25 Aug
 2023 15:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230824-strncpy-drivers-accel-habanalabs-gaudi2-gaudi2-c-v1-1-1a37b65576b4@google.com>
In-Reply-To: <20230824-strncpy-drivers-accel-habanalabs-gaudi2-gaudi2-c-v1-1-1a37b65576b4@google.com>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 25 Aug 2023 15:12:38 -0700
Message-ID: <CAFhGd8pzgNDYwBSpnvLzWTVeN=0TTCARPAyCN46jF=86F1NM8w@mail.gmail.com>
Subject: Re: [PATCH] habanalabs/gaudi2: refactor deprecated strncpy
To: Oded Gabbay <ogabbay@kernel.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch as well as two other related patches were combined into a
single patch [1]

On Thu, Aug 24, 2023 at 1:45=E2=80=AFPM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> `strncpy` is deprecated for use on NUL-terminated destination strings [1]=
.
>
> A suitable replacement is `strscpy` [2] due to the fact that it
> guarantees NUL-termination on its destination buffer argument which is
> _not_ the case for `strncpy`!
>
> Link: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-n=
ul-terminated-strings[1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.h=
tml [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Note: build-tested only.
> ---
>  drivers/accel/habanalabs/gaudi2/gaudi2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/hab=
analabs/gaudi2/gaudi2.c
> index 20c4583f12b0..755b2d92357d 100644
> --- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
> +++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
> @@ -2431,7 +2431,7 @@ static int gaudi2_set_fixed_properties(struct hl_de=
vice *hdev)
>         prop->pcie_dbi_base_address =3D CFG_BASE + mmPCIE_DBI_BASE;
>         prop->pcie_aux_dbi_reg_addr =3D CFG_BASE + mmPCIE_AUX_DBI;
>
> -       strncpy(prop->cpucp_info.card_name, GAUDI2_DEFAULT_CARD_NAME, CAR=
D_NAME_MAX_LEN);
> +       strscpy(prop->cpucp_info.card_name, GAUDI2_DEFAULT_CARD_NAME, CAR=
D_NAME_MAX_LEN);
>
>         prop->mme_master_slave_mode =3D 1;
>
> @@ -2884,7 +2884,7 @@ static int gaudi2_cpucp_info_get(struct hl_device *=
hdev)
>         }
>
>         if (!strlen(prop->cpucp_info.card_name))
> -               strncpy(prop->cpucp_info.card_name, GAUDI2_DEFAULT_CARD_N=
AME, CARD_NAME_MAX_LEN);
> +               strscpy(prop->cpucp_info.card_name, GAUDI2_DEFAULT_CARD_N=
AME, CARD_NAME_MAX_LEN);
>
>         /* Overwrite binning masks with the actual binning values from F/=
W */
>         hdev->dram_binning =3D prop->cpucp_info.dram_binning_mask;
>
> ---
> base-commit: f9604036a3fb6149badf346994b46b03f9292db7
> change-id: 20230824-strncpy-drivers-accel-habanalabs-gaudi2-gaudi2-c-0b3f=
717bee12
>
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
>

[1]: https://lore.kernel.org/r/20230825-strncpy-habanalabs-combined-v1-1-da=
a05a89b7e3@google.com
