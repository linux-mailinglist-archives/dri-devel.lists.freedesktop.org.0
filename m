Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C253F474BCF
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 20:23:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C745110E153;
	Tue, 14 Dec 2021 19:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2205610E153;
 Tue, 14 Dec 2021 19:23:35 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 v19-20020a4a2453000000b002bb88bfb594so5212308oov.4; 
 Tue, 14 Dec 2021 11:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ly7ashr0Abfix6SoCDJYNsr0pgjAfUrtoNa4BxcGFmI=;
 b=DaubiwHwzJwXsWIRixjWAKO7YA+Njfarz7GWWLXaUfA2fcW40KoSMkWIh3y/Zkdxyh
 BdXsnDNnEGn2GhdebKFdq7tXv/4MW3ZEK7emL9lvnOVwIPB8udu9qVCEX085iBt40FAe
 eGrE6OmNnQjO/CHduWdRD9ucpoUFbkz+H6f+3IQox3dSQU4SYvd89vx/JvAJQFhrPmMl
 D0h14/RP1SoYbCNAbMbEV5rI3Bnsc2shomrnanhui91YPDbEzrbz/2BQ6GPWWxUVpV6P
 BsvQNY8RMOOQmXMxpnIi7V06SBq6apMW3fz80Tu4fpGNFJDDYjYP4qF0xN5mKRb3Vr+3
 sSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ly7ashr0Abfix6SoCDJYNsr0pgjAfUrtoNa4BxcGFmI=;
 b=yDA/EMW4Pc7D4yi2DdmWUARIC1flzWgE35kuj6vEaT7L2EYC2Ef9xc+M+3C9yybGhE
 7EFytOWRJ1Imy6OJcDdtli3Z3X1ZvrXy0fc9jsTl9ZlX+7Yx0z1gxM11PKcSwdaF2Po2
 Go8edkOVx/oZjQhTKXG83V+MmTBkjGeMQA/fXJCRKfMLNxsx9hD2hK+SW72+PgdEv0e8
 HXvEJjRwGS5TEIXFFQH44o56PE0OeSWXdapozDnftglYsoHW5sds7dR3qf80XKDWo22k
 a8MM751GIpRqP1mbvSH+GQvT8tq1cMqUB6e0QD2lPFClqQ1mmchG+evH9FJCLX0bhatT
 BBQA==
X-Gm-Message-State: AOAM533AhpiZ+6nEsRobFc01nWNNqcuqe7/tnNRbLXLpTrkeJKWoyYZq
 3pFJgcTjfqhnXZG1erGJLUxZYu8Wr3kxPmIXCv0=
X-Google-Smtp-Source: ABdhPJz/pMYwME4RUdHlSZKIwCyCbYPbaG8SyeKTNS+1TSa4EuIzL7K2wrWvAQGoXRVaGW3cZxi1o4susTjozQai9T8=
X-Received: by 2002:a4a:8701:: with SMTP id z1mr4746722ooh.68.1639509814392;
 Tue, 14 Dec 2021 11:23:34 -0800 (PST)
MIME-Version: 1.0
References: <20211214135217.24444-1-wangxiang@cdjrlc.com>
 <ba96bb4f-1666-32a2-68a9-8fe3d6e2c10e@gmail.com>
In-Reply-To: <ba96bb4f-1666-32a2-68a9-8fe3d6e2c10e@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 14 Dec 2021 14:23:23 -0500
Message-ID: <CADnq5_M_VJ7jisaqJuq9x7GrUjQHCDLDJmwo+KNUpPuYgQEwxQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Fix syntax errors in comments
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Xiang wangx <wangxiang@cdjrlc.com>, Dave Airlie <airlied@linux.ie>,
 xinhui pan <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Dec 14, 2021 at 9:54 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 14.12.21 um 14:52 schrieb Xiang wangx:
> > Delete the redundant word 'we'.
> >
> > Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>
>
> Well not a syntax error in the sense of a coding error, but valid fix
> anyway :)
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/radeon/radeon_vce.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_vce.c b/drivers/gpu/drm/rade=
on/radeon_vce.c
> > index 511a942e851d..ca4a36464340 100644
> > --- a/drivers/gpu/drm/radeon/radeon_vce.c
> > +++ b/drivers/gpu/drm/radeon/radeon_vce.c
> > @@ -513,7 +513,7 @@ int radeon_vce_cs_reloc(struct radeon_cs_parser *p,=
 int lo, int hi,
> >    * @allocated: allocated a new handle?
> >    *
> >    * Validates the handle and return the found session index or -EINVAL
> > - * we we don't have another free session index.
> > + * we don't have another free session index.
> >    */
> >   static int radeon_vce_validate_handle(struct radeon_cs_parser *p,
> >                                     uint32_t handle, bool *allocated)
>
