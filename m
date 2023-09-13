Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A04C79EF2F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 18:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF92F10E4B8;
	Wed, 13 Sep 2023 16:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B4A10E0D1;
 Wed, 13 Sep 2023 16:46:59 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-523100882f2so9093195a12.2; 
 Wed, 13 Sep 2023 09:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694623618; x=1695228418; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C5YGng7LquR7VbitExATGwfX7+5OwRblTGs4u5vbxVs=;
 b=KHzfbAcjiSU5PsCXgrJOAClcDT/KvtiW0NHnAu5MDN5cO6Q9mxGxMN0sMYBurBS8Aj
 MIaN4i1BTZ0RGJjFgDblLl+t858X5iaNTuhmMUJ6xQivBhq6NRIsecu8D4Y0xChu1JM7
 bYxH6akfWAt1yFYyMowF6fHu+hpMVWhuzxOP4o7KmbtrHtTTPODaS2p+ryAMZixFt5Xe
 eew/XdlS039UbSsHFBXy8p2U4A0Os7g4u8XID/whyAAQC24S1b4Q79j/GCDpParHTGF9
 TgSdQrmg+/a2QpnwFyJvcmL80x6E9boWjC+jx5gtasS98FDq8MQHkVhqLDvPShQxJgjb
 C07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694623618; x=1695228418;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C5YGng7LquR7VbitExATGwfX7+5OwRblTGs4u5vbxVs=;
 b=TK7k6LHAep8aJ3XtOYECY1bsLRcX+f07OVzcM1ULlpquWYxacsag4czw5asUFlWbWR
 4Mju/JcDo/2JRY1Nu1NNZU1GLStKyxNmTMM2dmQDk/5va8mHCPW6rc+2sIN0NNagiLXI
 KB/zMxd1XyyfLOUZv6ZLUI7CMMEbf6BbLB9wuOVe0LtPcSA/aPUDb1Vk87Ju18AbVe6H
 JHhlyp+UNVZRtGW7CCcdQPpjNTZAWtLPeOzCvJ/dVfiq2r3NHrCkGRaVOtKVHZI7wgx5
 rWISP5XDv7YRreZR/pkadTDMTtoKsj9hsLupFjnUfVSpO2+lV5xFdd4TVNYJ8MlULpS/
 lmqA==
X-Gm-Message-State: AOJu0Yy8YSjQEGUY/ST/oJm+NP9kHBYJ4/Bwr+pBI2CGiJ8gmHIcOPeo
 5ei+3x1sfGZFs8cHreIYF9vYsKcS24ZmSdI+pqrIsDCf
X-Google-Smtp-Source: AGHT+IEc2KBgN3FRWC0KNxdRSFvRYj33UjiqQW/x5aJZfHR0AmWtDWPkiHn6xF3C8Knu1WGuANLSFzngKfOIKzJec/o=
X-Received: by 2002:aa7:c0cb:0:b0:523:47b0:9077 with SMTP id
 j11-20020aa7c0cb000000b0052347b09077mr2728747edp.38.1694623617692; Wed, 13
 Sep 2023 09:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230912084044.955864-1-adrian.larumbe@collabora.com>
 <20230912084044.955864-7-adrian.larumbe@collabora.com>
 <20230912113210.65897aab@collabora.com>
 <CAF6AEGtzOS89V1vbobpSEb9KX8x9T0FfmkW2OAaxAKLs+GugKA@mail.gmail.com>
 <CAF6AEGup93tQMYrmx6iKex2Fxz+Yu5m-MMWPmeOQ4yx_Racnag@mail.gmail.com>
 <20230913093637.2748d217@collabora.com>
In-Reply-To: <20230913093637.2748d217@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 13 Sep 2023 09:46:45 -0700
Message-ID: <CAF6AEGu+NeMfeP3yVLr76fUmXeWPx86D9ckw_WjXu+Xpn6DJvA@mail.gmail.com>
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

On Wed, Sep 13, 2023 at 12:36=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Tue, 12 Sep 2023 19:14:35 -0700
> Rob Clark <robdclark@gmail.com> wrote:
>
> > On Tue, Sep 12, 2023 at 6:46=E2=80=AFPM Rob Clark <robdclark@gmail.com>=
 wrote:
> > >
> > > On Tue, Sep 12, 2023 at 2:32=E2=80=AFAM Boris Brezillon
> > > <boris.brezillon@collabora.com> wrote:
> > > >
> > > > On Tue, 12 Sep 2023 09:37:00 +0100
> > > > Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:
> > > >
> > > > > The current implementation will try to pick the highest available=
 size
> > > > > display unit as soon as the BO size exceeds that of the previous
> > > > > multiplier. That can lead to loss of precision in BO's whose size=
 is
> > > > > not a multiple of a MiB.
> > > > >
> > > > > Fix it by changing the unit selection criteria.
> > > > >
> > > > > For much bigger BO's, their size will naturally be aligned on som=
ething
> > > > > bigger than a 4 KiB page, so in practice it is very unlikely thei=
r display
> > > > > unit would default to KiB.
> > > >
> > > > Let's wait for Rob's opinion on this.
> > >
> > > This would mean that if you have SZ_1G + SZ_1K worth of buffers, you'=
d
> > > report the result in KiB.. which seems like overkill to me, esp given
> > > that the result is just a snapshot in time of a figure that
> > > realistically is dynamic.
>
> Yeah, my point was that, generally, such big buffers tend to have
> a bigger size alignment (like 2MB for anything bigger than 1GB), but
> maybe this assumption doesn't stand for all drivers.

Maybe for CMA?  Regardless, this # is the sum of buffer sizes, so you
could still get that 1G+1K scenario

> > >
> > > Maybe if you have SZ_1G+SZ_1K worth of buffers you should report the
> > > result with more precision than GiB, but more than MiB seems a bit
> > > overkill.
> > >
> > > BR,
> > > -R
> > >
> > > > >
> > > > > Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_file.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_fil=
e.c
> > > > > index 762965e3d503..bf7d2fe46bfa 100644
> > > > > --- a/drivers/gpu/drm/drm_file.c
> > > > > +++ b/drivers/gpu/drm/drm_file.c
> > > > > @@ -879,7 +879,7 @@ static void print_size(struct drm_printer *p,=
 const char *stat,
> > > > >       unsigned u;
> > > > >
> > > > >       for (u =3D 0; u < ARRAY_SIZE(units) - 1; u++) {
> > > > > -             if (sz < SZ_1K)
> >
> > btw, I was thinking more along the lines of:
> >
> >    if (sz < 10*SZ_1K)
> >
> > (or perhaps maybe 100*SZ_1K)
>
> I think I suggested doing that at some point:
>
>                 if ((sz & (SZ_1K - 1)) &&
>                     sz < UPPER_UNIT_THRESHOLD * SZ_1K)
>                         break;
>
> so we can keep using the upper unit if the size is a multiple of this
> upper unit, even if it's smaller than the selected threshold.

yeah, that wfm

BR,
-R

>
> >
> > I mean, any visualization tool is going to scale the y axis based on
> > the order of magnitude.. and if I'm looking at the fdinfo with my
> > eyeballs I don't want to count the # of digits manually to do the
> > conversion in my head.  The difference btwn 4 or 5 or maybe 6 digits
> > is easy enough to eyeball, but more than that is too much for my
> > eyesight, and I'm not seeing how it is useful ;-)
> >
> > But if someone really has a valid use case for having precision in 1KB
> > then I'm willing to be overruled.
>
> So, precision loss was one aspect, but my main concern was having
> things displayed in KiB when they could have been displayed in MiB,
> because the size is a multiple of a MiB but still not big enough to
> pass the threshold test (which was set to 10000x in the previous
> version).
>
> > But I'm not a fan of the earlier
> > approach of different drivers reporting results differently, the whole
> > point of fdinfo was to have some standardized reporting.
>
> Totally agree with that.
>
> >
> > BR,
> > -R
> >
> > > > > +             if (sz & (SZ_1K - 1))
> > > > >                       break;
> > > > >               sz =3D div_u64(sz, SZ_1K);
> > > > >       }
> > > >
>
