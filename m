Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6195917351
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 23:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCE110E2C3;
	Tue, 25 Jun 2024 21:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Cj6JgXzQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CB510E2C3;
 Tue, 25 Jun 2024 21:22:29 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-79c0c19ff02so74860685a.1; 
 Tue, 25 Jun 2024 14:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719350548; x=1719955348; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tw5CUHUm3Gpt6SSSe/xI/X8gPanBuozSYqQObhb6KGY=;
 b=Cj6JgXzQZ+qqXnyui3ttDohPf+dqYNwanCQbeCnxCyebGsWTuo8DQOsx2xbqPD4pbp
 0p8TfBA55Z5wdasfy3NuiRSqnaG1yEr/pn/pZLRI387VKP3rzlUxbroIajzexxEga2by
 VjPixTs1+1+1jGOGTULKuyp9O/rYsU18RqbfqEXvvAnnneBH6WJusC9tdmPC+xz8Bel9
 KSo7BfIeJN8VaOziihnwKFkB63Spj1Jzp8XtLmQPEomD33yOJwmLmHC1EflPk5pqZiwp
 BKaMIxAO0V6YDZ/isyX4nJH4BK7DUh5O4I/59xsYC1wOqPm47N30Fro/mUMPea6i2QDw
 hSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719350548; x=1719955348;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tw5CUHUm3Gpt6SSSe/xI/X8gPanBuozSYqQObhb6KGY=;
 b=v9CTt5QVvyT+CJ6Lq6dUITICIHpy1k+xgaXhGw3f9W+a7pvkhFh++Ys7qhaszyI91J
 2PMiKb7YItGP9gX7pmhvHnx9Ca3kHVgimYFsw+RPNF3bodihZRv8BfrFIv8tHZ8qOG53
 goRjDv/1GrktS0wUvsIa1u8sX00xbDzIIGw8hws+9x0lRzUfIkVMdy5dUmBL5VsOxM1O
 oANWGf7k70Q/DJqTtC9PwnHebhivyV6x9kwhNEbCVNsUiGk29f4+D+8ep7QytQLXZxe1
 n/TmiKFThMXucy9aQxZe7Etl/2heMXb4AyARMe0iorjPvmtHfysm7kBL9L2W9PfXO2Ki
 JDYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK/+R2DUIyoklzlGWLc7IEJcqZpYXqPsPZCl3Xr2rP1T32tskrShw28lXU9znKoalNtC6k2ecmquf3/ARVnfaAgzpPG4syF8HpQQ2YdbhiSnq9e45Sg3MaY4hlzwH50JsjlbgXduUqHwF2+/EbJgME
X-Gm-Message-State: AOJu0YwjS/9vwCk1DuVkRyayQfPQRz4U2vQR3p+xDZSDDgP1kA0j/oIB
 oMc2/110HL3x3PzxJ3xccyx9/Let8XDfeueRvyqPNatSk+Ixivz89XvvUuO83cu42MwUKKzjMRL
 KDHTyb0jGx49j03mj5A0ZGM4fJ/k=
X-Google-Smtp-Source: AGHT+IFXbQes4gdlhi490sxQ7X7y/cppE8GmTYOi2RZ9YmtK0eJYSO7nHKlB0DeYq0ofNiX6Js/r4nkF0aYqaVEkXP0=
X-Received: by 2002:ac8:7e8f:0:b0:445:3f1:4715 with SMTP id
 d75a77b69052e-44503f14c47mr8059651cf.36.1719350547916; Tue, 25 Jun 2024
 14:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240625-adreno_barriers-v2-0-c01f2ef4b62a@linaro.org>
 <20240625-adreno_barriers-v2-2-c01f2ef4b62a@linaro.org>
 <CAA8EJpqnFEkWx4hq_UDgQ9n5qNj=WjN-Td0+ELGh8hrDpBFjGQ@mail.gmail.com>
In-Reply-To: <CAA8EJpqnFEkWx4hq_UDgQ9n5qNj=WjN-Td0+ELGh8hrDpBFjGQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 25 Jun 2024 14:22:15 -0700
Message-ID: <CAF6AEGt0cjmNyp9wqMMLE9FCKP3E=eibW9q_HGpqnCZzO=sKcA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Revert "drm/msm/a6xx: Poll for GBIF unhalt status
 in hw_init"
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 25, 2024 at 1:18=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 25 Jun 2024 at 21:54, Konrad Dybcio <konrad.dybcio@linaro.org> wr=
ote:
> >
> > Commit c9707bcbd0f3 ("drm/msm/adreno: De-spaghettify the use of memory
>
> ID is not present in next

it ofc wouldn't be, because it was the previous patch in this series ;-)

I've fixed that up (and below) while applying the patch

BR,
-R

> > barriers") made some fixups relating to write arrival, ensuring that
> > the GPU's memory interface has *really really really* been told to come
> > out of reset. That in turn rendered the hacky commit being reverted no
> > longer necessary.
> >
> > Get rid of it.
> >
> > This reverts commit b77532803d11f2b03efab2ebfd8c0061cd7f8b30.
>
> b77532803d11 ("drm/msm/a6xx: Poll for GBIF unhalt status in hw_init")
>
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index 4083d0cad782..03e23eef5126 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -867,10 +867,6 @@ static int hw_init(struct msm_gpu *gpu)
> >                 gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT);
> >         }
> >
> > -       /* Some GPUs are stubborn and take their sweet time to unhalt G=
BIF! */
> > -       if (adreno_is_a7xx(adreno_gpu) && a6xx_has_gbif(adreno_gpu))
> > -               spin_until(!gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK));
> > -
> >         gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
> >
> >         if (adreno_is_a619_holi(adreno_gpu))
> >
> > --
> > 2.45.2
> >
>
>
> --
> With best wishes
> Dmitry
