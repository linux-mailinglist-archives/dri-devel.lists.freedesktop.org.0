Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D70B772B11
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F7710E2CD;
	Mon,  7 Aug 2023 16:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2A510E2DC;
 Mon,  7 Aug 2023 16:36:04 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1bc479cc815so3692895fac.1; 
 Mon, 07 Aug 2023 09:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691426163; x=1692030963;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/X2RI7KjH5Yx+MU8RevEmyA0pwRz4NFKlvWhA6KHUgM=;
 b=P+G6uB23xPqDxt5w3eH9Aw5PuuUCNxmoRZ86hj8p1Rr9oOF8Ckq4HpTWplRoy46eSr
 kW4bMZhjnXhCSbIBlk/Z3vqRhjnabPJIo2KuIq0DdPCIv4O14uEED7mWmiBNcmGqmlSA
 JcUyQ8zEC8xBwReEFVXBx24nG9CMPrr6R5+z2hjAMlpwkeA304bu8+CuXYuuSWtY5rqn
 UKS48b/dh+WxZdLT2It0+WCKvBOU/ZUmj+8fbmp6KEByIGeXo16i7s9XKk6wBlyy/icD
 UNxfmP99ttz64JvMe/ZwMEKcj5fO74CsYuI3AfWYFsv+6rgZ05XjGU27b6c425xfhmDS
 bS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691426163; x=1692030963;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/X2RI7KjH5Yx+MU8RevEmyA0pwRz4NFKlvWhA6KHUgM=;
 b=Pco9oqDW3FPru90AsNP4qIIIsdPi8dikU7MOMl94bKqpu5B6z5eMNQJeX431vsElQp
 j0IQSGlM5/5Q0gZlqV1/6c35PvXXjszajagHIyy4JKBwUotmomo6NxkV2uqA1UaJu1qu
 xarcomXRCRK5skdh/1Us49yy2M+5UxyBLaOfSmW9k5zpyaNu7gAQ8X0g2BSfSDxg/X9C
 ig4CnOlosTsJIyMwaQfhPz5Wh5V4NWHhYpix2t56m/e0kwEiSYAHnn3oMWmwHF2VY/ke
 lIMxbf2UZb1g/cMK6oHETwZ24qNxtl6Rqza3pIJ8zU2lmXrgJxl0JlcQflW0S0XGp2Lh
 oxQg==
X-Gm-Message-State: AOJu0YxJIkCWDMPn2mmrfotlCEXo6VytXk1nprGyLVTrY0ICQkPiHrt7
 XhoAftGdg35aOzKg0CpOqXh73cY3viKWVwGv1Z8=
X-Google-Smtp-Source: AGHT+IHxav8wq0MkdwiAu07noGH5tXWTHhZ4OcQv3DFcN9zfoRPcjrC38lMKmPF563QGU2Wz26RfLuwAGk4KiDBGSrI=
X-Received: by 2002:a05:6871:5c6:b0:1be:c688:1c0 with SMTP id
 v6-20020a05687105c600b001bec68801c0mr12543916oan.47.1691426163362; Mon, 07
 Aug 2023 09:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230801075951.6467-1-sunran001@208suo.com>
In-Reply-To: <20230801075951.6467-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:35:52 -0400
Message-ID: <CADnq5_Oao-NQ2zJkYvA9Xyd10O4eUYe8CKmsyf8TzwgHrj2R8A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in smu_helper.c
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

On Tue, Aug 1, 2023 at 4:00=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: spaces required around that '=3D' (ctx:VxV)
> ERROR: spaces required around that '<' (ctx:VxV)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c b/driver=
s/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
> index d0b1ab6c4523..79a566f3564a 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
> @@ -696,7 +696,7 @@ int smu_get_voltage_dependency_table_ppt_v1(
>                                 return -EINVAL);
>
>         dep_table->count =3D allowed_dep_table->count;
> -       for (i=3D0; i<dep_table->count; i++) {
> +       for (i =3D 0; i < dep_table->count; i++) {
>                 dep_table->entries[i].clk =3D allowed_dep_table->entries[=
i].clk;
>                 dep_table->entries[i].vddInd =3D allowed_dep_table->entri=
es[i].vddInd;
>                 dep_table->entries[i].vdd_offset =3D allowed_dep_table->e=
ntries[i].vdd_offset;
> --
> 2.17.1
>
