Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF058FB95C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 18:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2989110E56A;
	Tue,  4 Jun 2024 16:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NlKNpiFM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E44E10E59D;
 Tue,  4 Jun 2024 16:45:30 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2c24109aca8so1694521a91.1; 
 Tue, 04 Jun 2024 09:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717519530; x=1718124330; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QecifVAR+tvBUqTJQdxCWnDSVIat9xStXa2bm/K4Dng=;
 b=NlKNpiFMlW4sC822kI1YhXPc/fUhGBkp3OSrO+POxc0luJtUBqgCJLNhLmzRDpjmfR
 51Xh4DqBYHoiKihh7lHLhinxHshJniyInqb7II+T/ES2zPfTlmfzOrHWkFhUI4fS3F2Z
 6zYYtjZOg2qPU68GjDIBJxlgitHjHFEO0Dtt8ix6cUrvmBU38IfbNRgyIyHbz8JUj5jK
 Lh9umuWw/I+OkAqSOyvuyu0sTv1qhvJeX3uxS5ad5xUk7FQpneaV0BMRbtAzaUkk4V3j
 8l9W9bWZMDrBFC/akWw90ZL70Jo14GwgYeXKb6qHfXZc2opqJ/gp2C23AJpOw6E+/nay
 tcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717519530; x=1718124330;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QecifVAR+tvBUqTJQdxCWnDSVIat9xStXa2bm/K4Dng=;
 b=miRJo2aNADy7NluXoZj5qGs4YaIlaxUh1kqb0K8PUxR2KcRASpkTEhu0QB7kmiF6LK
 pM018pg0aONptesDQjiq6SVnUyBuPkKaGmzn0vgTjiVCWQ20aQ8elv54Gc5YvSXOy4Q1
 WT9bMhxg6UhDh88UP/yd7iciPB7B7MbEb7B+2MJ3O3T9wu8ueMqsMn7di+g2mq48CVfe
 eYfEsGbMSU5LUPgHYJvm19xODxzdhT32Kw9BCMvU3+g8gJ1jszh1J9A8KqovY3Ued7Yd
 VEzEVrycTXnCJdHWOi2BFkMa10mowAExbmTgFCfTJc/VGsBqvReMDRHY1rJuW6mJGpRH
 /Sdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjInV3ca4feL25uut/7gsx86QAkyGGr9FTbGBgDs9A+snWWAkQtseunvrFEdOEMKRtLwUiBUhnTdi/InRufSUxExq58CCDj5ZRr5hVmFJCo2Pp0+L9mhDK2nfTT3UNcAnmHN6ntrO/SLGXOXJEm2Gm
X-Gm-Message-State: AOJu0YyNgpKESSOyqP9keVKuQ3U8sJ8CJ4YzSZMH+2dhoh4Fw36Y82yy
 t2RhfdRic75jxhpw8YzG2fIARPOM4wVDiA+YpyVepcr3m/F3Yv5MWUz08LX4SHSEr7I/Al8S1oo
 M6HiiREqyNP5ikxwUI8BNItW45IE=
X-Google-Smtp-Source: AGHT+IFCTYi81ohxmB4GHF8R5ig10gXlGw/VXeg6Zyu7SRlO2MnRd3LHAj40rLREbkSJw9Vw999N2GkMUnudzwyOxwY=
X-Received: by 2002:a17:90b:30c2:b0:2bf:9566:7c58 with SMTP id
 98e67ed59e1d1-2c1dc5d2962mr11454075a91.41.1717519530143; Tue, 04 Jun 2024
 09:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240604-a505-v1-1-82ee1c04d200@gmail.com>
 <49fe3b01-4f00-4ffc-80cf-2a0add1ebaad@linaro.org>
 <CAGsSOWV=i2JHsYNvi5EC6q=NoD8v7SiTjbVQhTDLNw35+irTCQ@mail.gmail.com>
In-Reply-To: <CAGsSOWV=i2JHsYNvi5EC6q=NoD8v7SiTjbVQhTDLNw35+irTCQ@mail.gmail.com>
From: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Date: Tue, 4 Jun 2024 18:45:19 +0200
Message-ID: <CAGsSOWV9SRK1VUJiQfavEM1hL0PapxUBG6CNeD+Q=0qPT5ZnSA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Add support for Adreno 505 GPU
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Daniil Titov <daniilt971@gmail.com>
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

On Tue, Jun 4, 2024 at 2:27=E2=80=AFPM Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trab=
arni@gmail.com> wrote:
>
> On Tue, Jun 4, 2024 at 1:55=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linar=
o.org> wrote:
> >
> >
> >
> > On 6/4/24 02:20, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrote:
> > > From: Daniil Titov <daniilt971@gmail.com>
> > >
> > > This GPU is found on SoCs such as MSM8937 (450 MHz), MSM8940 (475 MHz=
),
> > > SDM439 (650 MHz).
> > >
> > > Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> > > Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>
> > > ---
> >
> > This all looks very good, just a nit
> >
> > [...]
> >
> > > +             /*
> > > +              * Increase inactive period to 250 to avoid bouncing
> > > +              * the GDSC which appears to make it grumpy
> > > +              */
> > > +             .inactive_period =3D 250,
> >
> > Are you sure this is actually necessary?
> Every A5XX GPU is using the same value, but i have never tried with
> DRM_MSM_INACTIVE_PERIOD.
This was the original patch
https://lore.kernel.org/all/20180507224750.9383-1-jcrouse@codeaurora.org/
where the inactive period was increased for a530. I cannot test
suspend on msm8937 yet.
I can check on msm8953 with a506 maybe if a506 works fine with
DRM_MSM_INACTIVE_PERIOD
then a505 would be fine with it also.
>
> >
> > Konrad
