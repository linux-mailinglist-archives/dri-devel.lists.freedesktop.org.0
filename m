Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6E65BD1D6
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 18:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A0610E68F;
	Mon, 19 Sep 2022 16:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE6110E68D;
 Mon, 19 Sep 2022 16:06:55 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-12c8312131fso81078fac.4; 
 Mon, 19 Sep 2022 09:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=jVrDrYFmT8W5kZ7jEm9bBXR34qhnehExEbUS076MVZU=;
 b=c1jtyUwrdI1Qo5qEo9OEaE8ixOsICKG0PLFwlmDdoL1VX6i4r7/nN9icGEGu2Kn7B/
 dcV3qpxNH6g3aixlXP8vrxJfvhSaG/91awvnIT4KT83vgDWiup65tJEoM2/R9BloUBj/
 i/b+y6naK/hNLlaKWoF5+pRuWVO39UfOZXil4pECt4AutoqTSaU/InwBUnww/BW0Eklj
 kxJobQQW7TJelmkbRD5DiLMEkFnothNfK0Isi23MOIOay2viFvRFgO4fg4j5acWn32h8
 T4Hpd4oeMVVtY0HcoCD/+00Etc4GLZDvMtKUo/8rBNtRYAOWsHg9/dhtDK+G/hyaikFO
 n+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jVrDrYFmT8W5kZ7jEm9bBXR34qhnehExEbUS076MVZU=;
 b=IOc1X9s+V5z0nW4n+v5o2ZGyPk7mhJWrzZOTM7C36QTj9NV27ntbpiJNinhR8QdAfG
 SSYDF4X/jkcL87phMkeSuI0PXHCEG/H2erOY8KcHjVGBiroLIP63FOwnD/bRVytxVZbh
 wcSOeYnzRWW1jeCvGURM1p4zdR7iZcqeYLkBKwYJx63OWconmG6EqwgUOXA4Z7c0U3Rh
 7qDEAkowHK0oFWJ0I8/KEx0adr1zbu8WUCu6HXofqBYQTh8Q1B9NdCxc/dKjy1b9DIul
 jzJoZpAEoghzREydXy84Rn4EaXjlW0leyYXi+DAhwO536dN2YRfQWNW1spIy3AK3b/A+
 E4Ag==
X-Gm-Message-State: ACgBeo0uVDm8Sm6J6Pi9VSkquglpaMvOhSZqsAgIFwT0POva4FRv3Fqx
 UmwsNdd9MSZgYVVX+Sxt1xKqCKD2hmnR435+wWI=
X-Google-Smtp-Source: AA6agR7t3u8MLwqkcjbu8HaTl5mJueTDHbkQBIHI7n/ZnINRh49uFbwBsLuFuoRPrgzm5P5SfX6sUgkP68RBgRboZAM=
X-Received: by 2002:a05:6870:1783:b0:12a:f442:504d with SMTP id
 r3-20020a056870178300b0012af442504dmr16846294oae.46.1663603614736; Mon, 19
 Sep 2022 09:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220919014457.3297857-1-zengheng4@huawei.com>
 <CADnq5_OE0yZvEYGu82QJHL9wvVcTFZrmeTgX7URgh7FVA=jqYg@mail.gmail.com>
In-Reply-To: <CADnq5_OE0yZvEYGu82QJHL9wvVcTFZrmeTgX7URgh7FVA=jqYg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 19 Sep 2022 12:06:43 -0400
Message-ID: <CADnq5_PmZsMCPk3hwZvk+ZrtDMpfxWrhHKfMAostd9pOgXwFHw@mail.gmail.com>
Subject: Re: [PATCH] gpu: color: eliminate implicit conversion about enum type
To: Zeng Heng <zengheng4@huawei.com>, jaehyun.chung@amd.com, 
 Krunoslav Kovac <Krunoslav.Kovac@amd.com>
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
Cc: HaoPing.Liu@amd.com, sunpeng.li@amd.com, liwei391@huawei.com,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, Yao.Wang1@amd.com, weiyongjun1@huawei.com,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, Pavle.Kotarac@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the relevant AMD developers to comment.

On Mon, Sep 19, 2022 at 12:05 PM Alex Deucher <alexdeucher@gmail.com> wrote=
:
>
> On Mon, Sep 19, 2022 at 3:19 AM Zeng Heng <zengheng4@huawei.com> wrote:
> >
> > Fix below compile warning when open enum-conversion
> > option check:
> >
> > drivers/gpu/drm/amd/amdgpu/../display/modules/color/color_gamma.c:
> > In function =E2=80=98apply_degamma_for_user_regamma=E2=80=99:
> > drivers/gpu/drm/amd/amdgpu/../display/modules/color/color_gamma.c:1695:=
29:
> > error: implicit conversion from =E2=80=98enum <anonymous>=E2=80=99 to =
=E2=80=98enum dc_transfer_func_predefined=E2=80=99 [-Werror=3Denum-conversi=
on]
> >  1695 |  build_coefficients(&coeff, true);
> >       |                             ^~~~
> >
> > As 'build_coefficients' definition, it needs enum
> > 'dc_transfer_func_predefined' type acts as the
> > second argument, instead of bool-type one.
> >
> > The numerical values of TRANSFER_FUNCTION_BT709 & true
> > happen to be the same, so there is no change in
> > behavior.
>
> This looks like a regression from:
>
> commit 9b3d76527f6ea50270f7f7ac749493b41783e8bd
> Author: Jaehyun Chung <jaehyun.chung@amd.com>
> Date:   Mon Aug 30 16:46:42 2021 -0400
>
>     drm/amd/display: Revert adding degamma coefficients
>
>     [Why]
>     Degamma coefficients are calculated in our degamma formula using
>     the regamma coefficients. We do not need to add separate degamma
>     coefficients.
>
>     [How]
>     Remove the change to add separate degamma coefficients.
>
>     Reviewed-by: Krunoslav Kovac <Krunoslav.Kovac@amd.com>
>     Acked-by: Mikita Lipski <mikita.lipski@amd.com>
>     Signed-off-by: Jaehyun Chung <jaehyun.chung@amd.com>
>     Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>
> Which seems to improperly revert:
> commit d020970959169627d59a711769f8c4b87bf5f90c
> Author: Jaehyun Chung <jaehyun.chung@amd.com>
> Date:   Tue Aug 24 14:05:48 2021 -0400
>
>     drm/amd/display: Add regamma/degamma coefficients and set sRGB
> when TF is BT709
>
>     [Why]
>     In YUV case, need to set the input TF to sRGB instead of BT709,
>     even though the input TF type is distributed. SRGB was not
>     being used because pixel format was not being set in the
>     surface update sequence.
>     Also, we were using the same coefficients for degamma and
>     regamma formula, causing the cutoff point of the linear
>     section of the curve to be incorrect.
>
>     [How]
>     Set pixel format in the surface update sequence. Add separate
>     coefficient arrays for regamma and degamma.
>
>     Reviewed-by: Krunoslav Kovac <Krunoslav.Kovac@amd.com>
>     Acked-by: Mikita Lipski <mikita.lipski@amd.com>
>     Signed-off-by: Jaehyun Chung <jaehyun.chung@amd.com>
>     Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>
> I think the proper fix is to set it to:
> build_coefficients(&coeff, TRANSFER_FUNCTION_SRGB);
>
> Alex
>
> >
> > Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> > ---
> >  drivers/gpu/drm/amd/display/modules/color/color_gamma.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c b/=
drivers/gpu/drm/amd/display/modules/color/color_gamma.c
> > index 04f7656906ca..2f807d787c77 100644
> > --- a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
> > +++ b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
> > @@ -1692,7 +1692,7 @@ static void apply_degamma_for_user_regamma(struct=
 pwl_float_data_ex *rgb_regamma
> >         struct pwl_float_data_ex *rgb =3D rgb_regamma;
> >         const struct hw_x_point *coord_x =3D coordinates_x;
> >
> > -       build_coefficients(&coeff, true);
> > +       build_coefficients(&coeff, TRANSFER_FUNCTION_BT709);
> >
> >         i =3D 0;
> >         while (i !=3D hw_points_num + 1) {
> > --
> > 2.25.1
> >
