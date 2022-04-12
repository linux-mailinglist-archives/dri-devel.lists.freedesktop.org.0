Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8916F4FE4E4
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 17:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422CF10E12D;
	Tue, 12 Apr 2022 15:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6095110E12D;
 Tue, 12 Apr 2022 15:39:12 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-d39f741ba0so21099282fac.13; 
 Tue, 12 Apr 2022 08:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GDejQrBv5+8R4CloLYKGTaS0N+kPnjCZFu6AY4D/UQU=;
 b=A0L0qWbjnbVwHBr0yXc8U+iOId6sGqUs93ezYwnGa3UKet+MmjfsePBP9BK6EWHXXa
 2k/VOKOi2hlW2X0zwWIUIz9tncPRTaH2nzA2p+RXkKOnhkRRjN5m+FexrYf7TGD4Y454
 wXRFm3GPf+qzuLVJnYIfzPRVzS/pc3A5C1kozQNM0Gq7aGFAtd++pA6DONJ71wuVYLk2
 vTK6dY47BWvE5yaAHMHwiP8gaL+RVkF0CajVguT7G680dwE94+xGLu+V7Vsyr/hthkvP
 IRbiT9YbgNsLSPzK00wq29jhIGmYN305FouGQtLwnkuHL++mK8K8fHppzJ35KBYmq0+c
 WfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GDejQrBv5+8R4CloLYKGTaS0N+kPnjCZFu6AY4D/UQU=;
 b=5sw38TT6cpHDQNKeu8LYKW59Mp70mab98Va+Kbuz3JlLP2IgqPDmCjtyz8ugMvm6cl
 AXexo3YLPHZbiz3cukB3j37IPbwEKTu2E8arKeuouw047ekfrb3BrQpb0oTkfgHbPYSR
 nHl4Uf9+JcgsHxAoe9GHd1OKFDCLbpQCy8WMtP3dtz2twVjysOCNQjUWNrfKy6lV5eoW
 wRB/0iiQ3rZR0uePoZqZD1bNcFi+jrNjt9b+y68y9j0V87hyo40dMZu7YLwxT6ZOo02w
 i7q+I1dtjR6VFqHxDKBQXtvfZviVriQqinPneXSWbgc14j+gE/2Sw1EmMXX07MY2U9xs
 +ubA==
X-Gm-Message-State: AOAM531l1xVrgIw2F555DMc4RluOdg1c8XvhgDRspSwQh7IzjW4i66nt
 r57lWhMdZ+2YlFvsF5flX6J87oY0Hb6JJ8bRd2c3sD7g
X-Google-Smtp-Source: ABdhPJymQ3dGYfaQ3h3dIFyjd8B/Cp9j8yb6BEvJMl112E4b/Ks7c+dO7vg8yc6oMUfPBbg2Dj05+DYpf6FC8Ir4dZI=
X-Received: by 2002:a05:6870:d683:b0:de:eaa2:3550 with SMTP id
 z3-20020a056870d68300b000deeaa23550mr2422005oap.253.1649777951636; Tue, 12
 Apr 2022 08:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220325225402.469841-1-alex.hung@amd.com>
 <20220325225402.469841-14-alex.hung@amd.com>
 <42d34e82-3c15-c33a-5cd4-a0d2436e44d2@molgen.mpg.de>
In-Reply-To: <42d34e82-3c15-c33a-5cd4-a0d2436e44d2@molgen.mpg.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Apr 2022 11:39:00 -0400
Message-ID: <CADnq5_OT6Nakp_guGHjMVE2ACAgMKvevyq2P2rhcPaSJ5vVBRQ@mail.gmail.com>
Subject: Re: AMD Display Core (DC) patches (was: [PATCH 13/16]
 drm/amd/display: Revert FEC check in validation)
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Cc: Stylon Wang <stylon.wang@amd.com>, George Shen <George.Shen@amd.com>,
 Solomon Chiu <solomon.chiu@amd.com>, Alex Hung <alex.hung@amd.com>,
 Greg KH <gregkh@linuxfoundation.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Martin Leung <Martin.Leung@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Leo \(Sunpeng\) Li" <Sunpeng.Li@amd.com>,
 Aurabindo Pillai <Aurabindo.Pillai@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Wayne Lin <wayne.lin@amd.com>, Alexander Deucher <Alexander.Deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, "Gutierrez,
 Agustin" <agustin.gutierrez@amd.com>, "Kotarac, Pavle" <pavle.kotarac@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 12, 2022 at 2:52 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> [Cc: +dri-devel@lists.freedesktop.org, +Daniel Vetter, +Alexander
> Deucher, +Greg KH]
>
>
> Dear Alex,
>
>
> I am a little confused and upset about how Display Core patches are
> handled in the Linux kernel.
>
>
> Am 25.03.22 um 23:53 schrieb Alex Hung:
> > From: Martin Leung <Martin.Leung@amd.com>
>
> git puts a line =E2=80=9CThis reverts commit =E2=80=A6=E2=80=9D into the =
commit message, when
> something is reverted. Why isn=E2=80=99t this here? Right now, commit
> 7d56a154e22f, reverted here, is proposed for the stable series. I guess,
> because these indicators and meta data are missing.

Sasha's tools proposed to pick it up which I often struggle with.
It's very useful, but at the same time, we don't have the bandwidth to
test every combination of patches that Sacha  proposes on every stable
kernel.  The additional metadata would be useful, but I'm not sure if
it would solve this problem.  This patch would likely be picked up by
Sasha as well once it landed.

>
> > why and how:
> > causes failure on install on certain machines
>
> Why are such kind of commit messages accepted? What does =E2=80=9Cfailure=
 on
> install=E2=80=9D even mean? Why can=E2=80=99t the machine configuration b=
e documented so
> it can be reproduced, when necessary.
>
> No less confusing, the date you posted it on amd-gfx is from March 25th,
> 2022, but the author date of the commit in agd5f/amd-staging-drm-next is
> `Fri Mar 18 11:12:36 2022 -0400`. Why is the patch missing the Date
> field then?
>
> > Reviewed-by: George Shen <George.Shen@amd.com>
> > Acked-by: Alex Hung <alex.hung@amd.com>
> > Signed-off-by: Martin Leung <Martin.Leung@amd.com>
>
> Shouldn=E2=80=99t the Signed-off-by line by the author go first?
>
> You committed this on `Mon Mar 28 08:26:48 2022 -0600`, while you posted
> the patch on amd-gfx on Friday. How should *proper* review happen over
> the weekend?
>
> > ---
> >   drivers/gpu/drm/amd/display/dc/core/dc.c | 4 ----
> >   1 file changed, 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm=
/amd/display/dc/core/dc.c
> > index f2ad8f58e69c..c436db416708 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> > @@ -1496,10 +1496,6 @@ bool dc_validate_boot_timing(const struct dc *dc=
,
> >       if (!link->link_enc->funcs->is_dig_enabled(link->link_enc))
> >               return false;
> >
> > -     /* Check for FEC status*/
> > -     if (link->link_enc->funcs->fec_is_active(link->link_enc))
> > -             return false;
> > -
> >       enc_inst =3D link->link_enc->funcs->get_dig_frontend(link->link_e=
nc);
> >
> >       if (enc_inst =3D=3D ENGINE_ID_UNKNOWN)
>
> The patch reverted here, also lacked proper review, had a to-be desired
> commit message, did not follow the Linux kernel coding style (missing
> space before the comment terminator), so should not have been committed
> in the first place.
>
> Seeing how many people are in the Cc list, I would have hoped, that
> somebody noticed and commented. The current state also makes it really
> hard for non-AMD employees to get the necessary information to do proper
> reviews as the needed documentation and information is non-public. So
> good/excellent commit messages are a must. I think to remember, you
> replied to me once, that Display Core patches are shared also with the
> Microsoft Windows driver, restricting the workflow options. But I think
> the issues I mentioned are unrelated. I know graphics hardware is very
> complex, but if quality of the commits and review would be improved,
> hopefully it saves time for everyone in the end, as less bugs are
> introduced.

I agree that good commit messages are ideal and we should strive for
them, but this is certainly not limited to GPUs.
Subsystems all require a certain amount of assumed knowledge when it
comes to commit messages.

At the same time, I think it would be good to set expectations.  Too
many frivolous review comments and escalations tends to turn
people off even if they are well intentioned.  There are always new
people becoming kernel developers that may not have had
a lot of previous kernel experience.  That said, to the AMD
developers, please try and address every comment.

Alex
