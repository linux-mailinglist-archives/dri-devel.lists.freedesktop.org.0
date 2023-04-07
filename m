Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8CA6DB2C6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 20:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4968310EE44;
	Fri,  7 Apr 2023 18:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5EC910EE44
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 18:30:07 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-23fd46e5be0so219941a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Apr 2023 11:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680892207; x=1683484207;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6HFtEQBBSrqrPLBtxkiSj0n1tTAIZHxJ4QeL5qxREtA=;
 b=SGVhjkvM7NMsU3Ujj47loy8mP8KYq9yQKj7qCA7dGa6PS0QGifsVTLCvMX9UxzGjCw
 HT6NnidZGBo053+sewjwtJyGcjS4BoV9MUYXQDd9xRILSKr9204cTvzS2huicN0Fg5x0
 VW8PHcQrfrG/EesRu2lov5LxIsQw03EgW78SwfOHXkerwYqWrGckT2wpZlFFc+qLJXbg
 pXqLIx3yiEOUSdKq0fZfiKJwysQO1jEwJbUVhZuBCnDkSz4gKhfr9dkB/wGt0+7bEl7f
 UtG7bO146qYi7lU2K57GH3F31N+1GGgq+wW9M3CzOfDNs4dxg/65laKeUwfT2VD2zhVv
 cBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680892207; x=1683484207;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6HFtEQBBSrqrPLBtxkiSj0n1tTAIZHxJ4QeL5qxREtA=;
 b=bDh4Z1+QUc2GgG0jsj/BwK0npuulwNRtvjXGLSMOr1LT+FERIoY/9RAlOT2UBGhomP
 0IJAGJwMBExRj5yB2SN3zXhKv3DNoFhW5++rlh1lfTqLe73+zEE0QVd2+i+pbZlXbjYe
 V07kgbwo4p4bIUDFcrHJZE/BEsGRs2IzngVxVaAOMldUiYkky5O9io4d2PgIktd0MD7e
 EszGNYxG+HRROwDOilaCtjjeREbts6aEFOv8BkKVr85kPcpIpVTWKqR9SA6vas/a77Cy
 vDauQ0VypkIYoXNPBCvoRj2+TTM1HJGE6HYQEVt3BvQ84Bk1oSE++lmNNlMvZvZsQD/P
 xCOA==
X-Gm-Message-State: AAQBX9fjM5JUepIqZWRm4mJSkB7e9qejdNY8Yf4XzVC23AQBGqnOjyMg
 V/L42215V6xe/lRtoO4hnNp/hTcuyC97UNogVSHYtg==
X-Google-Smtp-Source: AKy350Zn9nhE87iZkJPFl7414s8bVyJul5VukIyzyCsiFEtRHapVK5V9N1ZeYdKb2AlkJUj1xE94rcNxMRPPdz4DjIU=
X-Received: by 2002:a05:6a00:2e23:b0:62a:d87a:a375 with SMTP id
 fc35-20020a056a002e2300b0062ad87aa375mr1663621pfb.4.1680892206429; Fri, 07
 Apr 2023 11:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230325134503.1335510-1-trix@redhat.com>
 <CAKwvOdng_wH8qKnnGN=VpUhLK9q6wyc7sZKO7ORt-3QOKVP_nw@mail.gmail.com>
In-Reply-To: <CAKwvOdng_wH8qKnnGN=VpUhLK9q6wyc7sZKO7ORt-3QOKVP_nw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 11:29:55 -0700
Message-ID: <CAKwvOd=CVq3DTPwUgDgghJBKsUKgL69K7Hne5=gY9V7vwshfAg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove unused matching_stream_ptrs
 variable
To: Tom Rix <trix@redhat.com>
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
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, Jun.Lei@amd.com,
 christian.koenig@amd.com, Jimmy.Kizito@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 7, 2023 at 10:52=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Jimmy, can you review?
>
> The change LGTM; but I'm not sure if there was something else intended he=
re.

Nevermind, Jimmy's email address bounced.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> On Sat, Mar 25, 2023 at 6:45=E2=80=AFAM Tom Rix <trix@redhat.com> wrote:
> >
> > clang with W=3D1 reports
> > drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_enc_cfg.c:625:6: =
error:
> >   variable 'matching_stream_ptrs' set but not used [-Werror,-Wunused-bu=
t-set-variable]
> >         int matching_stream_ptrs =3D 0;
> >             ^
> > This variable is not used so remove it.
> >
> > Signed-off-by: Tom Rix <trix@redhat.com>
> > ---
> >  drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c b/dr=
ivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
> > index 41198c729d90..30c0644d4418 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
> > @@ -622,7 +622,6 @@ bool link_enc_cfg_validate(struct dc *dc, struct dc=
_state *state)
> >         int i, j;
> >         uint8_t valid_count =3D 0;
> >         uint8_t dig_stream_count =3D 0;
> > -       int matching_stream_ptrs =3D 0;
> >         int eng_ids_per_ep_id[MAX_PIPES] =3D {0};
> >         int ep_ids_per_eng_id[MAX_PIPES] =3D {0};
> >         int valid_bitmap =3D 0;
> > @@ -645,9 +644,7 @@ bool link_enc_cfg_validate(struct dc *dc, struct dc=
_state *state)
> >                 struct link_enc_assignment assignment =3D state->res_ct=
x.link_enc_cfg_ctx.link_enc_assignments[i];
> >
> >                 if (assignment.valid) {
> > -                       if (assignment.stream =3D=3D state->streams[i])
> > -                               matching_stream_ptrs++;
> > -                       else
> > +                       if (assignment.stream !=3D state->streams[i])
> >                                 valid_stream_ptrs =3D false;
> >                 }
> >         }
> > --
> > 2.27.0
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
