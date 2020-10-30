Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B07A2A0CB7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 18:45:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2316E9E1;
	Fri, 30 Oct 2020 17:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B534D6E9E0;
 Fri, 30 Oct 2020 17:45:35 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id l8so3695173wmg.3;
 Fri, 30 Oct 2020 10:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7wEr5Dqk9C4lrCpsWhhhfQP1Jc/kVZd8qfNomT6z69M=;
 b=T8d3YMICnoOKnXtEbbghVhWKZ3yII6mafp3clEg+DIdgIUQRAwj4kzKL0tre+6nw/f
 P4jUgaU8fsaBbltL+Q1ci2XXkWPGsakMLHbbjwrKwN4Zh7ViAtGUNvSzKywMXWLIzjuq
 mVxIB8NwhsFaBbBYf/LxfcTQ1ivXoeuRdeegUICZiUkmqGgqqTg5RK0ZZ6MKdI5PnVPc
 YrhEGoTLkCdH9GIdbVHzGXfOpZ4Qm7qwgstPrVdNzr5BazWxSEBdlUmH7WzzoQymseiP
 5MgRBnCWszu7096iYogx0VoVjRsGXZKE/HctieslL/ekoB3W8FZ2dXqAmUQkkhLcJsgU
 YZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7wEr5Dqk9C4lrCpsWhhhfQP1Jc/kVZd8qfNomT6z69M=;
 b=mZgW5XQUfIGMWrDow/SmIAvF0+tuDO9q8qDwQWekd1FXyROgUfcHwZXRHssELap7sm
 Fq6viROScW7CL3skDTlxd8L1M/TWsGet4Gl2iVQVSIiBDA3bQN7yURvoTSkEIQ9kIKqs
 6L6NmYsnsls8t4Z68B7o8MXafmeyjIG2tKPujLhgOlflK0s6lsgGz1y3agARdYDH4MJ1
 bKfP2DmaKLs1Mx0GfIInUCRR+f/qFUD4ccE0U7ZJIc0n3hkHMlTwdkMxqnlvCb7pZmlc
 aY5oR9oyb+1RApPPvPtFkNMV2OCsYRmYEDRIRgKRDaDcrTuo/XKDXodqcbgECdgM74Ex
 ZSAA==
X-Gm-Message-State: AOAM530Xot15g/rF+zr10zb0QM9oE4d452yqLSuMbR1QQ4AEs9WwjJYB
 I2ABLPinc1ia6CGnusIWl3zdjhdyxibhv62ZFd8=
X-Google-Smtp-Source: ABdhPJx1luv8bnwT4cFNgdaMqCEsZE0R3sacZyY6hfrZF4GCZ5YjXyQrEGKpGUN7aUFYxC9FNLlIrJooPNw35YhoBMs=
X-Received: by 2002:a1c:6302:: with SMTP id x2mr4030775wmb.56.1604079934351;
 Fri, 30 Oct 2020 10:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201026210039.3884312-1-arnd@kernel.org>
 <20201026210039.3884312-4-arnd@kernel.org>
 <CADnq5_MdJt02hpdTsvPDVwN4_1D7-1ybDexDreL6GjDipc_Yvw@mail.gmail.com>
 <c5335426-c19a-c174-40a9-a012711cdf0b@amd.com>
In-Reply-To: <c5335426-c19a-c174-40a9-a012711cdf0b@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 30 Oct 2020 13:45:22 -0400
Message-ID: <CADnq5_MNuPuUPvSfHTqL2icZgAV11q7zgcgDhLB3Q1hyd+r7nw@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/amdgpu: fix build_coefficients() argument
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Arnd Bergmann <arnd@kernel.org>, Krunoslav Kovac <Krunoslav.Kovac@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Lewis Huang <Lewis.Huang@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Josip Pavic <Josip.Pavic@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Reza Amini <Reza.Amini@amd.com>,
 Denis Efremov <efremov@linux.com>, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Anthony Koo <Anthony.Koo@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Oct 30, 2020 at 1:04 PM Harry Wentland <harry.wentland@amd.com> wrote:
>
>
>
> On 2020-10-29 11:53 p.m., Alex Deucher wrote:
> > On Mon, Oct 26, 2020 at 5:01 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >>
> >> From: Arnd Bergmann <arnd@arndb.de>
> >>
> >> gcc -Wextra warns about a function taking an enum argument
> >> being called with a bool:
> >>
> >> drivers/gpu/drm/amd/amdgpu/../display/modules/color/color_gamma.c: In function 'apply_degamma_for_user_regamma':
> >> drivers/gpu/drm/amd/amdgpu/../display/modules/color/color_gamma.c:1617:29: warning: implicit conversion from 'enum <anonymous>' to 'enum dc_transfer_func_predefined' [-Wenum-conversion]
> >>   1617 |  build_coefficients(&coeff, true);
> >>
> >> It appears that a patch was added using the old calling conventions
> >> after the type was changed, and the value should actually be 0
> >> (TRANSFER_FUNCTION_SRGB) here instead of 1 (true).
> >
> > This looks correct to me.  Harry, Leo?
> >
>
> Confirmed with Kruno, this is correct.
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > Alex
> >
> >
> >>
> >> Fixes: 55a01d4023ce ("drm/amd/display: Add user_regamma to color module")
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >> ---
> >>   drivers/gpu/drm/amd/display/modules/color/color_gamma.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
> >> index b8695660b480..09bc2c249e1a 100644
> >> --- a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
> >> +++ b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
> >> @@ -1614,7 +1614,7 @@ static void apply_degamma_for_user_regamma(struct pwl_float_data_ex *rgb_regamma
> >>          struct pwl_float_data_ex *rgb = rgb_regamma;
> >>          const struct hw_x_point *coord_x = coordinates_x;
> >>
> >> -       build_coefficients(&coeff, true);
> >> +       build_coefficients(&coeff, TRANSFER_FUNCTION_SRGB);
> >>
> >>          i = 0;
> >>          while (i != hw_points_num + 1) {
> >> --
> >> 2.27.0
> >>
> >> _______________________________________________
> >> amd-gfx mailing list
> >> amd-gfx@lists.freedesktop.org
> >> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7Charry.wentland%40amd.com%7C3b50cfb318a04e2708e308d87c875c07%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637396268091128887%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=QGijLrlFTXI3xx2sGx1iNczHBezfWdu%2FP2xkfoq%2FMB0%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
