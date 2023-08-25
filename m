Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8E5789176
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 00:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708B810E161;
	Fri, 25 Aug 2023 22:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821E310E161
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 22:13:11 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5298e43bb67so2956396a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 15:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1693001590; x=1693606390;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bRGLhCJxk2YfYhkw71kLVJLLsM+bnOcMS87gS/EBB2k=;
 b=B1jyrIcDb5DFQ48F/wCw3Jn5c7WHjXuwf5BP1lJtcMO+KVxCfURnBNUQcgZinLsSG4
 MWWmbKrsLRZ7d2z2GYjUZrbwSkUZ+uiL4VORl65hWJcy05qfidHY5FhdbTu02H1duxsu
 dBkaVaFu2jF2Z/V1zI5ILQ5REyW0NvlittLUsR8TOk4AttvI4Nw4dxClmD9XbFIH6wH3
 0daKqwS9GEGTwFOZt+Cg4twvoIxR0oXUJoOq+WscXB2P0F+FfOuRfsNRuc05V2rI3jOJ
 clxqpmVRw4KHhMKIL84kO8kfVOxYhyyImaKXawwnkgeYJPDnwmNFUvzBrj3g8XuumtTN
 nHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693001590; x=1693606390;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bRGLhCJxk2YfYhkw71kLVJLLsM+bnOcMS87gS/EBB2k=;
 b=dOk/wFv8Bf1JcKehdm7tlkVUsoIXi1Ze8o61exXUFHuubwBO+63+PFYbdU1L2nKgfN
 zcSwp1xrgAoz5kwENs0Pc2FvhHBPa8KwbWqVg3whSKjiQQQ3st+3YWZpICGDn3cmWY6P
 W2DYP18ulRehDOY1ki2kdOiuFz3qPIDzXEC6w8a0+FxKKKsP3/tWg9lLSzvz0l0us1Ki
 PcSMnM3t8BpUA+X7Kci4aBM0tuKkADk9KfziD56q2kfHSJ06B/hNHpbsG5qW+ljh+s2C
 ScN9nO+SUZpxCEvnU5g9Y1WnDlpkVqS/hX/4DySPSjI8YNiLbMkVA1mPHMckdIoEMKDb
 ihHA==
X-Gm-Message-State: AOJu0YzsxNYm31nGBWYc1usrRNnl1LQUGwJkV1XNvXLIm7ugiH0ywSf7
 cwPCNFeNbE0awGRJEU/ab1+oqDOCr3VRaX5nDji1eg==
X-Google-Smtp-Source: AGHT+IGCmYRo7hllh+m7oORH9Z9Xh45QNBFb7h4WVFR4TG7CAw4ipcinmyISbGr6gmCiXUWeRCLxdyZgBaPZPc7K9kI=
X-Received: by 2002:aa7:c384:0:b0:522:4764:8baa with SMTP id
 k4-20020aa7c384000000b0052247648baamr20833831edq.12.1693001589840; Fri, 25
 Aug 2023 15:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230824-strncpy-drivers-accel-habanalabs-gaudi-gaudi-c-v1-1-a7fb9054734c@google.com>
In-Reply-To: <20230824-strncpy-drivers-accel-habanalabs-gaudi-gaudi-c-v1-1-a7fb9054734c@google.com>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 25 Aug 2023 15:12:58 -0700
Message-ID: <CAFhGd8r1ADbYRg2dF5wwS4Tf1Worv-zR6CTrzBPHxQO2YAiWQA@mail.gmail.com>
Subject: Re: [PATCH] habanalabs/gaudi: refactor deprecated strncpy
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

On Thu, Aug 24, 2023 at 1:41=E2=80=AFPM Justin Stitt <justinstitt@google.co=
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
> Note: build-tested only
> ---
>  drivers/accel/habanalabs/gaudi/gaudi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/habanalabs/gaudi/gaudi.c b/drivers/accel/haban=
alabs/gaudi/gaudi.c
> index 056e2ef44afb..f175456cdef0 100644
> --- a/drivers/accel/habanalabs/gaudi/gaudi.c
> +++ b/drivers/accel/habanalabs/gaudi/gaudi.c
> @@ -660,7 +660,7 @@ static int gaudi_set_fixed_properties(struct hl_devic=
e *hdev)
>         prop->pcie_dbi_base_address =3D mmPCIE_DBI_BASE;
>         prop->pcie_aux_dbi_reg_addr =3D CFG_BASE + mmPCIE_AUX_DBI;
>
> -       strncpy(prop->cpucp_info.card_name, GAUDI_DEFAULT_CARD_NAME,
> +       strscpy(prop->cpucp_info.card_name, GAUDI_DEFAULT_CARD_NAME,
>                                         CARD_NAME_MAX_LEN);
>
>         prop->max_pending_cs =3D GAUDI_MAX_PENDING_CS;
> @@ -8000,7 +8000,7 @@ static int gaudi_cpucp_info_get(struct hl_device *h=
dev)
>                 return rc;
>
>         if (!strlen(prop->cpucp_info.card_name))
> -               strncpy(prop->cpucp_info.card_name, GAUDI_DEFAULT_CARD_NA=
ME,
> +               strscpy(prop->cpucp_info.card_name, GAUDI_DEFAULT_CARD_NA=
ME,
>                                 CARD_NAME_MAX_LEN);
>
>         hdev->card_type =3D le32_to_cpu(hdev->asic_prop.cpucp_info.card_t=
ype);
>
> ---
> base-commit: f9604036a3fb6149badf346994b46b03f9292db7
> change-id: 20230824-strncpy-drivers-accel-habanalabs-gaudi-gaudi-c-f0b581=
4ced38
>
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
>

[1]: https://lore.kernel.org/r/20230825-strncpy-habanalabs-combined-v1-1-da=
a05a89b7e3@google.com
