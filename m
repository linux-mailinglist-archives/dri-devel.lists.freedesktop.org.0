Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A269D8C09A0
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 04:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2FE10E256;
	Thu,  9 May 2024 02:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Dt0mUcAY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDC410E256;
 Thu,  9 May 2024 02:06:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 555D761C52;
 Thu,  9 May 2024 02:06:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E458DC4AF07;
 Thu,  9 May 2024 02:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715220368;
 bh=G7cFv9cF2cnjfjAGz44Yc56GefLQLwiyJxe2ewKnFKM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Dt0mUcAYAMaPa/Uds31u1AfZRfwo9qsdT9GkegzCTgMP408fiPsec0+QQDTA9E6d6
 mrjyzYDR9XlzxTS3M7IDQkjFX9tiALxQbsaKfcDP1YFtc6pRKsKZv3wOwUlhpVRPhe
 NNEfs8UtRg2T9KPktotUITIsKunsUpd5akPDIIDzWxoPkJOEjGLH2Qp/3zB/s+Awp8
 9xMmu2YsfOAgGymwfhxojvaAFxyeyPJ4pBZy+UYv458a1nEmgt1MXdu8uxb+Dgx8ju
 Lik8lmkdpF9PA5EnVNN+fE6F2bjgy3v9vHpWuJ4IEyFW21N1iv1OoNEVk8cZejctfX
 QDsY18ZvKIpaw==
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-51fb14816f6so482955e87.0; 
 Wed, 08 May 2024 19:06:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUPUhb6YEr6aOEPzV66+3+UU2TD9vHDkbfu4ETK3nEjoacTSpI7DSYbf4NBfFzAPFJnAX6HDJs7dupouubBur6ms1waZnkvHr0M6ThZjBnByYajLicHTo39MtI5WkGsgOTyeBhKl/1wwpswiKJqDlTR
X-Gm-Message-State: AOJu0YwuNPVHBn7sX1EnX8vOE0azUBWIEVJY5SkxaH0Y63Q3fck4/ide
 auBrp2+pX7qMTzAEU8VsgrMHyOK2o9C4FsE/aimBhSQ01tIIEN6WlO+jyLdUnAYRzFAeJs7fxAL
 omfS694L/OeLdK6cyDdKESeEjLxc=
X-Google-Smtp-Source: AGHT+IG9jgW2EhldqJEU5OYVfvoRjo0wlRA5x/+WH/NBhi4EjV49pvu6Eqy1EviqeUURrwJaBPOetOpoppVu/vQSytA=
X-Received: by 2002:a05:6512:3a8c:b0:521:b2b5:5ab2 with SMTP id
 2adb3069b0e04-521b2b55ab6mr2522757e87.46.1715220367602; Wed, 08 May 2024
 19:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
 <CAD=FV=Xa6LJEWZwdUXvFVPQ0-qnDZroDi6tkZaLFHiarJ2gyew@mail.gmail.com>
In-Reply-To: <CAD=FV=Xa6LJEWZwdUXvFVPQ0-qnDZroDi6tkZaLFHiarJ2gyew@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 9 May 2024 11:05:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNARZu1Jrqibn-PvjAa=dQwikMdWVH9d9oKwpe007JeVC6Q@mail.gmail.com>
Message-ID: <CAK7LNARZu1Jrqibn-PvjAa=dQwikMdWVH9d9oKwpe007JeVC6Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: remove python 3.9 dependency for compiling msm
To: Doug Anderson <dianders@chromium.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 seanpaul@chromium.org, swboyd@chromium.org, quic_jesszhan@quicinc.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, May 9, 2024 at 9:28=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Tue, May 7, 2024 at 4:05=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quici=
nccom> wrote:
> >
> > Since commit 5acf49119630 ("drm/msm: import gen_header.py script from M=
esa"),
> > compilation is broken on machines having python versions older than 3.9
> > due to dependency on argparse.BooleanOptionalAction.
> >
> > Switch to use simple bool for the validate flag to remove the dependenc=
y.
> >
> > Fixes: 5acf49119630 ("drm/msm: import gen_header.py script from Mesa")
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/registers/gen_header.py | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
>
> No idea if we're supposed to allow python as a build dependency. That
> being said, I can confirm that this fixes the problem for me since I
> ran into it too [1].
>
> Tested-by: Douglas Anderson <dianders@chromium.org>
>
> [1] https://lore.kernel.org/r/CAD=3DFV=3DXnpS-=3DCookKxzFM8og9WCSEMxfESmf=
TYH811438qg4ng@mail.gmail.com
>


I do not like Perl.

IMHO, Python should be OK if Perl is OK.
I agree that the required version should be
documented changes.rst, at least.






--=20
Best Regards
Masahiro Yamada
