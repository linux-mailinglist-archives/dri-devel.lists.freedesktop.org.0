Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C39C13AD3AA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 22:35:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0516EA7C;
	Fri, 18 Jun 2021 20:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF116EA7C;
 Fri, 18 Jun 2021 20:34:59 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id l12so11872855oig.2;
 Fri, 18 Jun 2021 13:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iQNzXJ3TwOzpw9bYBccWuBhdgfIg21YN1ripdW4KJLQ=;
 b=PXPa92zF007eLHXmzfYr64ztYgQFfHXWc4GdymN1kuuhixG+E9cA8yhyO3w18C/nX3
 ddmO+aa0Z9iyfg9l4ghcCyLCyeRJmQqtcRr/pBsTkyv92EC6RoB+vt4+O/7uchG95kUI
 6QpKN3iVSt9qf2fBybUKzh+86phHmVqgo60hMHQHfbK4ujFZVENAoenDVtbBVKL0pYiB
 ufyom+qds2k9GgHNAyHxojZX+5iVqRSl8ax3jk48j627JKeXbymhv6LsWcxxiIhqO/DY
 T+Pklw7VZImai7dpUSXEjcxyiAbmj41WKnjC6O3OYMm61Cceimd4fgkQVCdtMviFM8X+
 7G3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iQNzXJ3TwOzpw9bYBccWuBhdgfIg21YN1ripdW4KJLQ=;
 b=IP+OphwZLJamjkhp/TAKrH7HpmvB1eyy4UGUXHlYGTxKSalPTpKWdpyd2jRBd+EpEw
 wEFE/b9L1rENLE03PjbAOsT4nfyHqhkJcuQQYlMH8tpRGf2q3SPvSkBW9oj1Xc5077zo
 tUp1eKc6OYHHlYYhCcqDjqfvzT08SrGrM33PgJP22hxW3kqd4oypw//KU/a1H0rFDzSv
 BwTyWWKeCHVQ/pXKN7OaXqIaCD1tzmSYDqeo5Zi/hf0E2uNkrFuOKKmlm+rZsF9Hcwwg
 iL0sXBPrsta3gLRgtHhjMhIqvV7vbVUYYxvxS37y/L8UNUGd8KmZGOQNIGPuLWO6jqKy
 dbbg==
X-Gm-Message-State: AOAM530tn8eR/e7Dm2wLVoFQVPMgJhmRlNZixOLDRTRQMeujEhjLsrEy
 cgYrFmee78Z0QbRS2AQaeIejaWaqr/INj92sNkI=
X-Google-Smtp-Source: ABdhPJyhSi9zAgTqHX3Mdd5ODSa6ar3uqjpvAyhe4sA58n+09kvDn9XoVr8fFxP2daFSRzmysgT1McWb1Hq+wDrnjq4=
X-Received: by 2002:a05:6808:c3:: with SMTP id t3mr15182503oic.5.1624048498773; 
 Fri, 18 Jun 2021 13:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210617011632.187690-1-pulehui@huawei.com>
 <7758a4ef-0b8e-8873-fac0-7db7a2f6402b@amd.com>
In-Reply-To: <7758a4ef-0b8e-8873-fac0-7db7a2f6402b@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Jun 2021 16:34:47 -0400
Message-ID: <CADnq5_PJu+ZXWbTVyxRE7vdSfBx7=w_mhtob8+EQUeMfKMJ6bw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: remove unused variable 'dc'
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Anson Jacob <Anson.Jacob@amd.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 xinhui pan <Xinhui.Pan@amd.com>, Roman Li <roman.li@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>, zhangjinhao2@huawei.com,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Pu Lehui <pulehui@huawei.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Jun 17, 2021 at 3:04 PM Harry Wentland <harry.wentland@amd.com> wro=
te:
>
>
>
> On 2021-06-16 9:16 p.m., Pu Lehui wrote:
> > GCC reports the following warning with W=3D1:
> >
> > drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_psr.c:70:13:
> > warning:
> >  variable =E2=80=98dc=E2=80=99 set but not used [-Wunused-but-set-varia=
ble]
> >     70 |  struct dc *dc =3D NULL;
> >        |             ^~
> >
> > This variable is not used in function, this commit remove it to
> > fix the warning.
> >
> > Signed-off-by: Pu Lehui <pulehui@huawei.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c b/dr=
ivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
> > index f7c77ae0d965..70a554f1e725 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
> > @@ -67,14 +67,12 @@ bool amdgpu_dm_link_setup_psr(struct dc_stream_stat=
e *stream)
> >       struct dc_link *link =3D NULL;
> >       struct psr_config psr_config =3D {0};
> >       struct psr_context psr_context =3D {0};
> > -     struct dc *dc =3D NULL;
> >       bool ret =3D false;
> >
> >       if (stream =3D=3D NULL)
> >               return false;
> >
> >       link =3D stream->link;
> > -     dc =3D link->ctx->dc;
> >
> >       psr_config.psr_version =3D link->dpcd_caps.psr_caps.psr_version;
> >
> >
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
