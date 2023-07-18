Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F30757FB7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 16:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FC210E365;
	Tue, 18 Jul 2023 14:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF1C10E35F;
 Tue, 18 Jul 2023 14:36:50 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6b886456f66so3296617a34.0; 
 Tue, 18 Jul 2023 07:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689691010; x=1692283010;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zQf+oUcGcr5G91Xt9lom7mrF/vizZR+ycdZT6h8lo/0=;
 b=SB4mlWwzsBk34tG45RbN/YgPk7FQApL/VzYYIeFJ4M+3kqFsOipRgLWo/hEAJIwS/G
 C9iapSlhqwnUjJ2D6c81q4j3KW1+T38ZA8ITylAJPDO2W1poeJadkdoVp2X7PftrZKmN
 LaAAvvubP8JiZ0cY8qAGFNW44/tcarbK/YCRrIxC45RIsRPUN3HquD6V/63bHN6Gq7Vp
 +TFhb1DjN3FqJUYIKXlinko4bwvR2k4IJEY9E4TR5zzH4nSnCHbFfckxqoBS5qmKt+Jh
 CzwZsuz67Mo3SIj3TYlm8blUxQYm8r9qJoism/T5q27IHKYBLHMcPZgtL1W87uKFBViB
 vpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689691010; x=1692283010;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zQf+oUcGcr5G91Xt9lom7mrF/vizZR+ycdZT6h8lo/0=;
 b=IsWSyG+PUkOkSd+uPSKB9K3OJCNmEmQWokLXXGklfDLemCpbiY2ilTIn0gQsmjIGHb
 CYjqZgZ9mDRkXGVJ/VBLJM5EM09xxMD+vYjZJkuZQo2CpIEEOAqAgNXCDbAxKTEKCVI4
 7bp8dg6MdIwgSk1oDejlTCtQJOSMTCz+zdMSq8oxKoWPOHB3uPkjt6J7kYLg7nO64xAi
 ImcRR9ecT0z7af6pU261SoeZAzrKeWMAr5q0t9WOErko7zXQSnyxRJLcPllzC75JhYlx
 muZbYv1QLRB4IGxqGhVChvdwFweaj1O7CL9bbn2Flhs2myGP1BymYGuuSz5/QCrcDyaa
 UmYQ==
X-Gm-Message-State: ABy/qLYRA/Md5EGPGY0WdM9KRm2mr+PmPp+SoWSP+Kmi7QwnEbO9Fi3c
 H4ZQQ248wokBq1DrOGEypUao9h5bSb8LV+41CuU=
X-Google-Smtp-Source: APBJJlEsOBa3z0vgWEg0Rdv40N6WvpSECqAkmNTxr1hhe3KsAxJLk8xziuMp2+p+SQtn/hto02rwx0W5XpCwD0z1T+E=
X-Received: by 2002:a05:6808:e8a:b0:3a0:5b87:6ef7 with SMTP id
 k10-20020a0568080e8a00b003a05b876ef7mr13380685oil.2.1689691009800; Tue, 18
 Jul 2023 07:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_FDFE1B9D84BD3C51CAE7FADFDCF6613D5D0A@qq.com>
 <21b12c2d37bff73a0c625b6af9d95021@208suo.com>
In-Reply-To: <21b12c2d37bff73a0c625b6af9d95021@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 18 Jul 2023 10:36:39 -0400
Message-ID: <CADnq5_OM2+Ed8z7FU84yEGoyGZpQF5a-+ZPThPszU9b=xFuVHQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/dpm: ERROR: open brace '{' following enum go
 on the same line
To: shijie001@208suo.com
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'm happy to apply these patches, but please check your mailer.  The
formatting is messed up and they don't apply cleanly.  Please use
git-format-patch and git-send-email to generate and send the patches.

Thanks!

Alex

On Fri, Jul 14, 2023 at 3:15=E2=80=AFAM <shijie001@208suo.com> wrote:
>
> Fix four occurrences of the checkpatch.pl error:
> ERROR: open brace '{' following enum go on the same line
>
> Signed-off-by: Jie Shi <shijie001@208suo.com>
> ---
>   drivers/gpu/drm/radeon/ni_dpm.h | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/ni_dpm.h
> b/drivers/gpu/drm/radeon/ni_dpm.h
> index 74e301936906..4e3e7303e035 100644
> --- a/drivers/gpu/drm/radeon/ni_dpm.h
> +++ b/drivers/gpu/drm/radeon/ni_dpm.h
> @@ -59,8 +59,7 @@ struct ni_mc_reg_table {
>
>   #define NISLANDS_MCREGISTERTABLE_FIRST_DRIVERSTATE_SLOT 2
>
> -enum ni_dc_cac_level
> -{
> +enum ni_dc_cac_level {
>       NISLANDS_DCCAC_LEVEL_0 =3D 0,
>       NISLANDS_DCCAC_LEVEL_1,
>       NISLANDS_DCCAC_LEVEL_2,
> @@ -72,8 +71,7 @@ enum ni_dc_cac_level
>       NISLANDS_DCCAC_MAX_LEVELS
>   };
>
> -struct ni_leakage_coeffients
> -{
> +struct ni_leakage_coeffients {
>       u32 at;
>       u32 bt;
>       u32 av;
> @@ -83,8 +81,7 @@ struct ni_leakage_coeffients
>       u32 t_ref;
>   };
>
> -struct ni_cac_data
> -{
> +struct ni_cac_data {
>       struct ni_leakage_coeffients leakage_coefficients;
>       u32 i_leakage;
>       s32 leakage_minimum_temperature;
> @@ -100,8 +97,7 @@ struct ni_cac_data
>       u8 lts_truncate_n;
>   };
>
> -struct ni_cac_weights
> -{
> +struct ni_cac_weights {
>       u32 weight_tcp_sig0;
>       u32 weight_tcp_sig1;
>       u32 weight_ta_sig;
