Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F49C6013E6
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 18:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9992B10E771;
	Mon, 17 Oct 2022 16:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B1110ED9C;
 Mon, 17 Oct 2022 16:50:45 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 d18-20020a05683025d200b00661c6f1b6a4so6124007otu.1; 
 Mon, 17 Oct 2022 09:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=03OOBwIKxfAvfZgEz0tjkK6Zty98m+iiULKAI7zle0I=;
 b=LeUixK35Lz4eb4ehoG92ehI5rHPkRGWWsL1rGHGGqwBq+aO5eUo12PUEhNtifyYDw0
 8BbAgVMXx5Ocvomw34HW0sfe+NsbBkWYfWDl6A5RuHdKzxnP27+OakO9J7tOr+OSCfjM
 F16DebD96GVk/V1oDX1IOkKminD0yMLzkF1L69NLyp16AMOQ7DLUOwE/vb5ZX4V76KX9
 td2aP01nW49s5oyRf9GPG9u8QReE4xvJ9OujB8Oq1f6dLecu5R5EyR33ob0JBYxsgbEY
 vGn8WKr0KoSBT6NuAtb4KONGythPHJazqk/T1w6EQxT0jL3ohu2mTbb0ypeZ2l7j471R
 j7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=03OOBwIKxfAvfZgEz0tjkK6Zty98m+iiULKAI7zle0I=;
 b=ux3MRhEaTOwNWvJwPD1Nt5QLMHDejoxd1C+wmzsbnQLApkNWXwqN4GQubMe1rEL+6e
 m243RcsH02VbNGz0nQq2bcP7y0IOguf4fhJ2jPY21zo5sF5GKP5VEGjH6MphVWPpGUey
 jXzHD4sFXwnfPXevxQD8qzve9GUwOeqd5e9NRhRxgFKTKlmM06JKxAV4ttbtvXDJKHad
 8B+6aw4t3SWf8rTNMRB74amC9aw5LeeigcRCsHe8AoKnLvzZkNCy6J6ZHt5tfc7yHrNo
 8Hd21+A+EJGlKm/Je29EPJt+1iNYRbVtICb38JO10GIR1NTU4/c4GzpVZMM2LIdInJSZ
 LV3A==
X-Gm-Message-State: ACrzQf2A2GYk18bFxknGXHvMeJxHkB/IaD3UoQLkYGhCFnuA3XH33BPw
 7rfTffnzGsKUbsNbPiZbqk5wxs55LU2FuA0A6Vk=
X-Google-Smtp-Source: AMsMyM4xmMTiSnYhq2DbjTqfjrqqGnz4gAdx5HsaAWlKW4ntV2o8HezI0fBr6GDQ+j4rblvtah3OohMAaqb71r2bBPU=
X-Received: by 2002:a05:6830:2475:b0:661:b91c:f32a with SMTP id
 x53-20020a056830247500b00661b91cf32amr5448586otr.123.1666025444903; Mon, 17
 Oct 2022 09:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221013182523.835499-1-linux@roeck-us.net>
In-Reply-To: <20221013182523.835499-1-linux@roeck-us.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 17 Oct 2022 12:50:33 -0400
Message-ID: <CADnq5_PLAVozmE4NjmWnPkwrmBoqSBeQRiQC5fhx3EYjzKpHng@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Increase frame size limit for
 display_mode_vba_util_32.o
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: Leo Li <sunpeng.li@amd.com>, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@google.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Oct 13, 2022 at 2:25 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Building 32-bit images may fail with the following error.
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_util_=
32.c:
>         In function =E2=80=98dml32_UseMinimumDCFCLK=E2=80=99:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_util_=
32.c:3142:1:
>         error: the frame size of 1096 bytes is larger than 1024 bytes
>
> This is seen when building i386:allmodconfig with any of the following
> compilers.
>
>         gcc (Debian 12.2.0-3) 12.2.0
>         gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
>
> The problem is not seen if the compiler supports GCC_PLUGIN_LATENT_ENTROP=
Y
> because in that case CONFIG_FRAME_WARN is already set to 2048 even for
> 32-bit builds.
>
> dml32_UseMinimumDCFCLK() was introduced with commit dda4fb85e433
> ("drm/amd/display: DML changes for DCN32/321"). It declares a large
> number of local variables. Increase the frame size for the affected
> file to 2048, similar to other files in the same directory, to enable
> 32-bit build tests with affected compilers.
>
> Fixes: dda4fb85e433 ("drm/amd/display: DML changes for DCN32/321")
> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Reported-by: =C5=81ukasz Bartosik <ukaszb@google.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/gpu/drm/amd/display/dc/dml/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/dr=
m/amd/display/dc/dml/Makefile
> index d70838edba80..ca7d24000621 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -77,7 +77,7 @@ CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/dcn30_fpu.o :=3D $(dm=
l_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn32/dcn32_fpu.o :=3D $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn32/display_mode_vba_32.o :=3D $(dml_ccfla=
gs) $(frame_warn_flag)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn32/display_rq_dlg_calc_32.o :=3D $(dml_cc=
flags)
> -CFLAGS_$(AMDDALPATH)/dc/dml/dcn32/display_mode_vba_util_32.o :=3D $(dml_=
ccflags)
> +CFLAGS_$(AMDDALPATH)/dc/dml/dcn32/display_mode_vba_util_32.o :=3D $(dml_=
ccflags) $(frame_warn_flag)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn321/dcn321_fpu.o :=3D $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/dcn31_fpu.o :=3D $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn301/dcn301_fpu.o :=3D $(dml_ccflags)
> --
> 2.36.2
>
