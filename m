Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 354406D7E0E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 15:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9F010E09E;
	Wed,  5 Apr 2023 13:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99D410E09E;
 Wed,  5 Apr 2023 13:50:35 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 a30-20020a9d3e1e000000b006a13f728172so15870198otd.3; 
 Wed, 05 Apr 2023 06:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680702634;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TWYCTW3umiiR+6qL8jCRq5HPkiPkwIuHGIYzIuJerUc=;
 b=SG7nWufenx4mh39/7JLVOg1GQfQ0jB5fjAv1g++007WllAQLkL6RQ23FLerkw1K4+y
 QeXZi2+vWINhFvc6IWdx2ZOq4ApxcX9ThZF8j2GfbSkklJHjk8l9CB2wj5ZuY76WRZMl
 N281jRqwsLs7ssSjZUKi+z6IIRQkymrcYyX9Ze5thyNon53UMVPRfglijLR7OHKedjnG
 /vwZZJshZGvMuOszdRxg1KYWwHmSRjySD6pzE0qzcJz0Z9nNyu+sF2urvy+Ew6ZEcIlY
 D5JtL9ki164lCmorM/RJ7eIfdO0gOAJgRkOoBHt/p3M+AEJZZhBYd1U9xoopTOCpspob
 lDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680702634;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TWYCTW3umiiR+6qL8jCRq5HPkiPkwIuHGIYzIuJerUc=;
 b=CHba22bEy29k2bIgedYf1R18vI1Cc/tSXnikbWMAR6mVPE5mOz9wbTM29bulQ4dyq1
 ttu6OnvLmY96tHgTTR0RZsSTexnzeVHZqQzVZZRxBouqx0Eie9UqlSlb8emBff+M72vY
 HfuWqmAGxCD43p1GTuMWqK1LyzzZuWLnCM45njv0nigQHrkIhRLDAkQTquk32SR43MsL
 RiUBuuQh86aSXeEObTJ9zhq/QVVU6V8AOEJuP37qFp0Z5Dx3Col3bt1XYVJ6iT3R3Hdh
 LyDPIp2ZHRqe1TWzGarECGWGXiyA7GulqN4jBLXiYTLrMKvdkGR1cCbn7A+WpNvfK/3+
 KItA==
X-Gm-Message-State: AAQBX9dROvV1aWVK5RakPvE/XnQ0JSxqqP77OXpQlRwIcH+MMraFzMhG
 wwmt4dZWjn8Q0tU1kqswRADEQF6H96755dvHLoY=
X-Google-Smtp-Source: AKy350ZeWbieaLFA+NP2qQLhKqOwfEt8QEeLalSxkYi2UjWzSdSgw7nsbp51P4NFCyBZ3cx7K/URe9rys2fgzEEd8Gc=
X-Received: by 2002:a9d:664e:0:b0:696:f275:a60d with SMTP id
 q14-20020a9d664e000000b00696f275a60dmr1925750otm.7.1680702634708; Wed, 05 Apr
 2023 06:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230405081650.797972-1-daniel.vetter@ffwll.ch>
 <20230405133105.947834-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20230405133105.947834-1-daniel.vetter@ffwll.ch>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 5 Apr 2023 06:50:22 -0700
Message-ID: <CAF6AEGsFTSSQMMnr8PkJ4CBhwVnYBsxdZGP1SO9aZyeLhO0Ohg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/atomic-helper: Don't set deadline for
 modesets
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 5, 2023 at 6:31=E2=80=AFAM Daniel Vetter <daniel.vetter@ffwll.c=
h> wrote:
>
> If the crtc is being switched on or off then the semantics of
> computing the timestampe of the next vblank is somewhat ill-defined.
> And indeed, the code splats with a warning in the timestamp
> computation code. Specifically it hits the check to make sure that
> atomic drivers have full set up the timing constants in the drm_vblank
> structure, and that's just not the case before the crtc is actually
> on.
>
> For robustness it seems best to just not set deadlines for modesets.
>
> v2: Also skip on inactive crtc (Ville)
>
> Link: https://lore.kernel.org/dri-devel/dfc21f18-7e1e-48f0-c05a-d659b9c90=
b91@linaro.org/
> Fixes: d39e48ca80c0 ("drm/atomic-helper: Set fence deadline for vblank")
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # test patch on=
ly
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index f21b5a74176c..d44fb9b87ef8 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1528,6 +1528,12 @@ static void set_fence_deadline(struct drm_device *=
dev,
>         for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
>                 ktime_t v;
>
> +               if (drm_atomic_crtc_needs_modeset(new_crtc_state))
> +                       continue;
> +
> +               if (!new_crtc_state->active)
> +                       continue;
> +
>                 if (drm_crtc_next_vblank_start(crtc, &v))
>                         continue;
>
> --
> 2.40.0
>
