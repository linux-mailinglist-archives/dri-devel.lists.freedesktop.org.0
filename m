Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A74D679DDE7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 03:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACA210E037;
	Wed, 13 Sep 2023 01:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15AE810E037;
 Wed, 13 Sep 2023 01:47:07 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9a9d6b98845so97014866b.0; 
 Tue, 12 Sep 2023 18:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694569625; x=1695174425; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nw2vbwh9Prl2aL4eCjxqEEuY3ibeNqCIYYpwmGgbBKk=;
 b=KD8xTCPA+gK/N4QuzSRFl9NaqOUpAE2q6vDSzozOveyWkMjVsy5DGCI3P1F7D9l19U
 G6i7TZZBHxjTZhrIYCYrLX8logRAlEqMjFAHXyNKO5m7cxhpYQ5B+xR9qTsh+8MxdfKO
 w5CPqz2XD+seGcsZs+DD6/XiCfTVFa7Hc0Ziu5UBxodptx0bId2pE3jP0CJJDZA8Lfy1
 pakPe4/xdbdDsLtXvATs/m9IMcPgAqmo5mu+AFStLMZ4cI+1LHhJG4MZgPRUPKfAS13L
 JRT6EHC5MmjaNX8H0SP+gvQAdbTnsQUCPxAnUAMIRQT9fIzo5mtr3sWAcuXb/FjFXF5E
 qiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694569625; x=1695174425;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nw2vbwh9Prl2aL4eCjxqEEuY3ibeNqCIYYpwmGgbBKk=;
 b=f6F902h+MwqjiFpLI3cOpVOlKQ4WX4pG5+LLj8H5YSicaT0UEvh1l0OOV3R8vJvBg0
 aeJl2Ruv2USIIi6HO7y21k2OhpI4i7ME+vnuYHzU82szk2zTZ3mdBrbHWMh6rkLwge4Q
 0EhqcpmhuZ1onRCoQjGHEB1jc1NpjoBVxxtun/yPREHU8/JTwjFhYigg8FWShyVZm7dt
 +EQr9C/nZqiPGOED0E9AgIL2IUVrZJc/njsbUhW185YPQd9WKSOo+z9vFWbZOUpALxlq
 eIIoeyUUQfCRt4gZQsqHcgh2Mc7eisyY+JMvGHtDUqgoa2iyZ6bOYKwo4D+Rs1bRmdpC
 Ix1g==
X-Gm-Message-State: AOJu0Yyhtc9UFOL525tSY1uCbgMAZMpiyUMdsElqwYgtbHgBtUx5z+JR
 Jh1LQtryRw//YojrYWLTqxl30HHRfoqjCVxMFS4=
X-Google-Smtp-Source: AGHT+IH9cpCU/7Zs/hX2BjtG9840MbiSgk277qyUw73/CDt/MTKZHbRGAldZh5h9dMja6DQe2blemM8bcrEFXPMnBd0=
X-Received: by 2002:a17:906:cc0d:b0:9a2:86a:f9c0 with SMTP id
 ml13-20020a170906cc0d00b009a2086af9c0mr1955824ejb.1.1694569625097; Tue, 12
 Sep 2023 18:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230912084044.955864-1-adrian.larumbe@collabora.com>
 <20230912084044.955864-7-adrian.larumbe@collabora.com>
 <20230912113210.65897aab@collabora.com>
In-Reply-To: <20230912113210.65897aab@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 12 Sep 2023 18:46:52 -0700
Message-ID: <CAF6AEGtzOS89V1vbobpSEb9KX8x9T0FfmkW2OAaxAKLs+GugKA@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] drm/drm-file: Show finer-grained BO sizes in
 drm_show_memory_stats
To: Boris Brezillon <boris.brezillon@collabora.com>
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
Cc: tzimmermann@suse.de, sean@poorly.run,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 quic_abhinavk@quicinc.com, mripard@kernel.org, steven.price@arm.com,
 freedreno@lists.freedesktop.org, healych@amazon.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org,
 kernel@collabora.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 2:32=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Tue, 12 Sep 2023 09:37:00 +0100
> Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:
>
> > The current implementation will try to pick the highest available size
> > display unit as soon as the BO size exceeds that of the previous
> > multiplier. That can lead to loss of precision in BO's whose size is
> > not a multiple of a MiB.
> >
> > Fix it by changing the unit selection criteria.
> >
> > For much bigger BO's, their size will naturally be aligned on something
> > bigger than a 4 KiB page, so in practice it is very unlikely their disp=
lay
> > unit would default to KiB.
>
> Let's wait for Rob's opinion on this.

This would mean that if you have SZ_1G + SZ_1K worth of buffers, you'd
report the result in KiB.. which seems like overkill to me, esp given
that the result is just a snapshot in time of a figure that
realistically is dynamic.

Maybe if you have SZ_1G+SZ_1K worth of buffers you should report the
result with more precision than GiB, but more than MiB seems a bit
overkill.

BR,
-R

> >
> > Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_file.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > index 762965e3d503..bf7d2fe46bfa 100644
> > --- a/drivers/gpu/drm/drm_file.c
> > +++ b/drivers/gpu/drm/drm_file.c
> > @@ -879,7 +879,7 @@ static void print_size(struct drm_printer *p, const=
 char *stat,
> >       unsigned u;
> >
> >       for (u =3D 0; u < ARRAY_SIZE(units) - 1; u++) {
> > -             if (sz < SZ_1K)
> > +             if (sz & (SZ_1K - 1))
> >                       break;
> >               sz =3D div_u64(sz, SZ_1K);
> >       }
>
