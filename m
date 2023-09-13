Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D11179DE27
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 04:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0417D10E067;
	Wed, 13 Sep 2023 02:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DEB10E067;
 Wed, 13 Sep 2023 02:14:49 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9aa0495f9cfso94953666b.1; 
 Tue, 12 Sep 2023 19:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694571288; x=1695176088; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q7tdcZxWcWP9Umyb5qLqi3mZy8phtG7cbzdtVA/Y3II=;
 b=ryN94w5GRQTVashntw7F6sOxoSoEwgDenGbxJHx02k1eu23A9udFBIC0CE6bCXZHpU
 crT4MICYaLPR44CX4QixuspstTrZMvZ+F/9wxIJLX5EePNmXvdmOJF3p0qjqvpWByE6G
 YfA9hCVJvWIfQOc+ktZBRdieoFGqz4tJjfduZmJKCseElyWvyxACwnbsmSxypWqSIgFu
 savvY34xDOjoUXVwFSezb2UGuNFkimb1ZgcpMQqIhNlNzy97amjUKNEFzP7kZnBT2vQ5
 UNkfgc4rglLIaCElftduKGLfl31iBXaqwpg2PTDUnLXPOclkn9eTwrm2KKmcbn898Kwr
 uayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694571288; x=1695176088;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q7tdcZxWcWP9Umyb5qLqi3mZy8phtG7cbzdtVA/Y3II=;
 b=bIljyvoOyi0Bv2pj7ksw6NOsaC9C2szXIKxuOKXZQ1AFxxgtuZG2/RiUUT2pgDCsNQ
 +xuROfqiZ3Lz3LbMo3EHkbfEedZEvqaby7UJOE5dhD8f86Nc+1kuyXmpNTOqPeQfc2A2
 G1PKWrsIu0hdQv4oXfkSKg0D2jSUzjFfJiMyfnWMRhD0y/1W5Qqhv29POO07NJf0yr+v
 Scf4BvlZhhlWunVDla9t43Ctzdv0jZhwtLGnEfUBvTLUUKTBEIVsOm1xHExGCXZGtHvt
 SvVrkgK10UgeWol21iiV0kFSQXHRrlgpymgLYxdyfSKciChK6zqM99aP+ofIppx9LDym
 gxTA==
X-Gm-Message-State: AOJu0YzeHhgJ+Ra2amNslMm2Yii7g0fNXLqijsACUTeIMXCZAIQI6bCy
 Q+oiTWiidynQy5wIVg/xl+h0WQpM1B9N6htF1iQ=
X-Google-Smtp-Source: AGHT+IFWoaxMpozSizksjlTIWZ2gq5IqQtjZx2Fma+6ckL4UgPSLfUZk28X5KYN6Ft4GFGF1z5hEo0GwRNCn2M3plks=
X-Received: by 2002:a17:907:762d:b0:9a5:9305:83fb with SMTP id
 jy13-20020a170907762d00b009a5930583fbmr1793419ejc.34.1694571287818; Tue, 12
 Sep 2023 19:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230912084044.955864-1-adrian.larumbe@collabora.com>
 <20230912084044.955864-7-adrian.larumbe@collabora.com>
 <20230912113210.65897aab@collabora.com>
 <CAF6AEGtzOS89V1vbobpSEb9KX8x9T0FfmkW2OAaxAKLs+GugKA@mail.gmail.com>
In-Reply-To: <CAF6AEGtzOS89V1vbobpSEb9KX8x9T0FfmkW2OAaxAKLs+GugKA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 12 Sep 2023 19:14:35 -0700
Message-ID: <CAF6AEGup93tQMYrmx6iKex2Fxz+Yu5m-MMWPmeOQ4yx_Racnag@mail.gmail.com>
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
Cc: tzimmermann@suse.de, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 sean@poorly.run,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 quic_abhinavk@quicinc.com, mripard@kernel.org, steven.price@arm.com,
 freedreno@lists.freedesktop.org, healych@amazon.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org,
 kernel@collabora.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 6:46=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Tue, Sep 12, 2023 at 2:32=E2=80=AFAM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > On Tue, 12 Sep 2023 09:37:00 +0100
> > Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:
> >
> > > The current implementation will try to pick the highest available siz=
e
> > > display unit as soon as the BO size exceeds that of the previous
> > > multiplier. That can lead to loss of precision in BO's whose size is
> > > not a multiple of a MiB.
> > >
> > > Fix it by changing the unit selection criteria.
> > >
> > > For much bigger BO's, their size will naturally be aligned on somethi=
ng
> > > bigger than a 4 KiB page, so in practice it is very unlikely their di=
splay
> > > unit would default to KiB.
> >
> > Let's wait for Rob's opinion on this.
>
> This would mean that if you have SZ_1G + SZ_1K worth of buffers, you'd
> report the result in KiB.. which seems like overkill to me, esp given
> that the result is just a snapshot in time of a figure that
> realistically is dynamic.
>
> Maybe if you have SZ_1G+SZ_1K worth of buffers you should report the
> result with more precision than GiB, but more than MiB seems a bit
> overkill.
>
> BR,
> -R
>
> > >
> > > Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> > > ---
> > >  drivers/gpu/drm/drm_file.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > > index 762965e3d503..bf7d2fe46bfa 100644
> > > --- a/drivers/gpu/drm/drm_file.c
> > > +++ b/drivers/gpu/drm/drm_file.c
> > > @@ -879,7 +879,7 @@ static void print_size(struct drm_printer *p, con=
st char *stat,
> > >       unsigned u;
> > >
> > >       for (u =3D 0; u < ARRAY_SIZE(units) - 1; u++) {
> > > -             if (sz < SZ_1K)

btw, I was thinking more along the lines of:

   if (sz < 10*SZ_1K)

(or perhaps maybe 100*SZ_1K)

I mean, any visualization tool is going to scale the y axis based on
the order of magnitude.. and if I'm looking at the fdinfo with my
eyeballs I don't want to count the # of digits manually to do the
conversion in my head.  The difference btwn 4 or 5 or maybe 6 digits
is easy enough to eyeball, but more than that is too much for my
eyesight, and I'm not seeing how it is useful ;-)

But if someone really has a valid use case for having precision in 1KB
then I'm willing to be overruled.  But I'm not a fan of the earlier
approach of different drivers reporting results differently, the whole
point of fdinfo was to have some standardized reporting.

BR,
-R

> > > +             if (sz & (SZ_1K - 1))
> > >                       break;
> > >               sz =3D div_u64(sz, SZ_1K);
> > >       }
> >
