Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC7A6DB218
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 19:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C327610E124;
	Fri,  7 Apr 2023 17:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A1110E20F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 17:53:01 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id q191so7582430pgq.7
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Apr 2023 10:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680889980; x=1683481980;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KYBbdfYMz/vjcXkNGYT26LJaYJDJYJgOQo589rbtS2s=;
 b=DqKYdsHfDx8zdLJVjdTiTFTABvHWdnCrcEmv1w5HVb7vZJgYb9t4uDuX/Cr9FthsY+
 sNlQf5412FR4vITwMaeTaoKN8vXOBxK5I09sKXDtFLOCDcucYYJqntHqjO3K/idXejnx
 mpjwZtwsKYITG3OUusv3MCa9zgiWgd4qcE93WnOc5b19hJYSRsJv9ND+hyeP42g88eNa
 4M5aWWIG7t2lc67vCrkzFbzHfaMpEH2orbYitLkGcLjlPGiRbePJKxB3XQzuoavzhYGq
 dWt2ylU++nmF7XJzcfQQHXSf1nOsa4/z1PObYwy+i3A5Vf3jwiWGU3HMphpiMtUKlzUK
 V5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680889980; x=1683481980;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KYBbdfYMz/vjcXkNGYT26LJaYJDJYJgOQo589rbtS2s=;
 b=OOHBBOhCALjqIMZA5B+dmd6XUhqzvdCYNQlRkoTcdoTdYN1hIllLgvTO/IPIGxJinC
 FEbpoWjUfDE7H3UOeq0n7IvupP4q9eoJ7d1ztHObvFjw9xQmyTqbuk1NqvP/Fd2rSsi4
 0sT407WF/gc9g3G4Rd+bXa4KUvm7R8pKxaWWGlaDH8BW6kyL8o0ZAU5z39F/KD+rYMfe
 Q/8T2xtoXMcHoqKsi1oeRpERDG/TvqjJdTYFacILLRkjtMR6RRTvLWrCRSSpJlF1PlcA
 Sbj17ph6VX+mY9l/w6xPuPARQR0+yKorN5d+43EvEdUfJXJInfZQwn2beV0d9Ui4FZ14
 1UXw==
X-Gm-Message-State: AAQBX9fAfu7Z0rjbxkI+QSebfXBkeEoSj1jlnDdNsbeWRvf5ghVKOqUK
 g3gte3B93NtTIXSX+MyeqOIMWDaG84sVnrnqXy0ilQ==
X-Google-Smtp-Source: AKy350a+v8VTeVHFSzQqt9MX7OgojFeGTP3VMzP+2ISQI5Bm8J3rb6li0V3ygg9UHvL/3/kvKvVCidFCyNNRg0JU/is=
X-Received: by 2002:a65:5b43:0:b0:50f:5f89:2a9d with SMTP id
 y3-20020a655b43000000b0050f5f892a9dmr671939pgr.1.1680889980187; Fri, 07 Apr
 2023 10:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230325134503.1335510-1-trix@redhat.com>
In-Reply-To: <20230325134503.1335510-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 10:52:49 -0700
Message-ID: <CAKwvOdng_wH8qKnnGN=VpUhLK9q6wyc7sZKO7ORt-3QOKVP_nw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove unused matching_stream_ptrs
 variable
To: Jimmy.Kizito@amd.com
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
Cc: Cruise.Hung@amd.com, llvm@lists.linux.dev, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, wenjing.liu@amd.com, nathan@kernel.org,
 dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>,
 alexander.deucher@amd.com, Jun.Lei@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jimmy, can you review?

The change LGTM; but I'm not sure if there was something else intended here=
.

On Sat, Mar 25, 2023 at 6:45=E2=80=AFAM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_enc_cfg.c:625:6: er=
ror:
>   variable 'matching_stream_ptrs' set but not used [-Werror,-Wunused-but-=
set-variable]
>         int matching_stream_ptrs =3D 0;
>             ^
> This variable is not used so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c b/driv=
ers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
> index 41198c729d90..30c0644d4418 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
> @@ -622,7 +622,6 @@ bool link_enc_cfg_validate(struct dc *dc, struct dc_s=
tate *state)
>         int i, j;
>         uint8_t valid_count =3D 0;
>         uint8_t dig_stream_count =3D 0;
> -       int matching_stream_ptrs =3D 0;
>         int eng_ids_per_ep_id[MAX_PIPES] =3D {0};
>         int ep_ids_per_eng_id[MAX_PIPES] =3D {0};
>         int valid_bitmap =3D 0;
> @@ -645,9 +644,7 @@ bool link_enc_cfg_validate(struct dc *dc, struct dc_s=
tate *state)
>                 struct link_enc_assignment assignment =3D state->res_ctx.=
link_enc_cfg_ctx.link_enc_assignments[i];
>
>                 if (assignment.valid) {
> -                       if (assignment.stream =3D=3D state->streams[i])
> -                               matching_stream_ptrs++;
> -                       else
> +                       if (assignment.stream !=3D state->streams[i])
>                                 valid_stream_ptrs =3D false;
>                 }
>         }
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers
