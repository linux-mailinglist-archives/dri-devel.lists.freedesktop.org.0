Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 177438FBAC8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 19:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC92710E239;
	Tue,  4 Jun 2024 17:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JqCYqMz0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6040810E239;
 Tue,  4 Jun 2024 17:45:54 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2c2070e1579so2318850a91.3; 
 Tue, 04 Jun 2024 10:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717523154; x=1718127954; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xan6JHlbzoN/Cx1uze2aPQDqzU0Q2XkBrsIeaRmv2Pk=;
 b=JqCYqMz0Ac7ssaJF1ijkubcrpjWlwkhHWsb1JnxLFfWvBArq4omYDUZJfqZaS/z05C
 Dr9mvTSeBJFkwhCq7ZZUqzgvQu+blrepDqce4BNYta9GcWJV1mb8IoRJAW3ip/W0sx5K
 h0U1DbtdoNBJYmhL+OwrrGV/Ye9+bm8i/zaX7N7cbWLzuNGVk50Xr6B3aRaYFfYXYVyd
 qL3Ktgkld2pT9BuYtZDndVvJPFPXhoYJjVZxA/EZ6rvXZjZKZcPN0tqcJZVozwARXaEL
 RDq3tFkYPHhH0JAIQ1rNmqbqs4ICBMtEPbX9+A3favnOk93LF0yPvUSEYir9ZE/b3Qmd
 X6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717523154; x=1718127954;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xan6JHlbzoN/Cx1uze2aPQDqzU0Q2XkBrsIeaRmv2Pk=;
 b=i/F22ag5tS4lvEwtdkX+itx7bLNcrWbu4VRyhY0bzLrciZJBfJpRSGyNxOWPVsDpWT
 +lRTW4Czg3DbfX9AyIyzPRHfndMzRz0yRM8ca0L5PBjC04y5mG7a4czbXB1i+aQcM8gz
 yi+HMLfhvhloUSc24bjCgNW2jXH9zGXQQnNU/D7sx9Nw07kjQDW2Lt3nC6W6UfdD6PfQ
 FqZYhS4CjfSaEa5+IqogsAGRk+TDaUcQYt1ZcewAjXTr4jUBKn2RrxqZ5FdCVVR7L3nN
 BanYmPAzOReIo9J/QM2KX3JwCFbNNmRJUhCinq8VqXK/CzLIracrPCnLoLtV6ksbBRHu
 3njw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5gtvm6F0g7wgD0Dp1y5dzfNa7Y8RXthwS4U+Qh5OeGu4gK/SmSTD87zhLAxENErrDPktmVW7wdHYIvq1zTZLm+XuR80aAqyRzu4SJFZkh/gFLlZlopaIVK0MBsIMWjJFpP9RH/gtYvxns3C2Y8V0x
X-Gm-Message-State: AOJu0YzB9LEwjsa319ucxxBsVodisf11ngCs0ddcN/yaUUSgNwhe8bgM
 o3spPAPNvG2mdB207UtLcB8lBzG1FNOCggo39A6yINzY3RjeJ9tgpyxdQ5dQpXhQPwyqwjfZp7c
 2wpGxLA+z6aFdGNpmtOl6O5vyMpQ=
X-Google-Smtp-Source: AGHT+IF4SDAMREgP/6f9usTqurOcEnWyWau/glbHaaRqYBypCPYcFQHO0oQhL/xmMhu68goaifs8OIpZRozunJtrC6A=
X-Received: by 2002:a17:90b:f8c:b0:2bd:fa34:a613 with SMTP id
 98e67ed59e1d1-2c27db02ca2mr149430a91.4.1717523153741; Tue, 04 Jun 2024
 10:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240604-a505-v1-1-82ee1c04d200@gmail.com>
 <49fe3b01-4f00-4ffc-80cf-2a0add1ebaad@linaro.org>
 <CAGsSOWV=i2JHsYNvi5EC6q=NoD8v7SiTjbVQhTDLNw35+irTCQ@mail.gmail.com>
 <CAGsSOWV9SRK1VUJiQfavEM1hL0PapxUBG6CNeD+Q=0qPT5ZnSA@mail.gmail.com>
 <37b0404d-bba5-4a77-ad86-62c6dd308d37@linaro.org>
 <CAGsSOWUNN-PRvojvJR-i7wBDz8QRNnaTt19-6G41g7Hdt6RyTQ@mail.gmail.com>
 <d7cf1848-d39b-43f1-bcd5-b917e0289fcf@linaro.org>
In-Reply-To: <d7cf1848-d39b-43f1-bcd5-b917e0289fcf@linaro.org>
From: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Date: Tue, 4 Jun 2024 19:45:42 +0200
Message-ID: <CAGsSOWVoO2JTcWNR0GH=OeyH8EzqOr64Bv=FZTrbSu6ZbD-=Eg@mail.gmail.com>
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

On Tue, Jun 4, 2024 at 7:38=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro.=
org> wrote:
>
>
>
> On 6/4/24 19:33, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrote:
> > On Tue, Jun 4, 2024 at 7:06=E2=80=AFPM Konrad Dybcio <konrad.dybcio@lin=
aro.org> wrote:
> >>
> >>
> >>
> >> On 6/4/24 18:45, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrote:
> >>> On Tue, Jun 4, 2024 at 2:27=E2=80=AFPM Barnab=C3=A1s Cz=C3=A9m=C3=A1n=
 <trabarni@gmail.com> wrote:
> >>>>
> >>>> On Tue, Jun 4, 2024 at 1:55=E2=80=AFPM Konrad Dybcio <konrad.dybcio@=
linaro.org> wrote:
> >>>>>
> >>>>>
> >>>>>
> >>>>> On 6/4/24 02:20, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrote:
> >>>>>> From: Daniil Titov <daniilt971@gmail.com>
> >>>>>>
> >>>>>> This GPU is found on SoCs such as MSM8937 (450 MHz), MSM8940 (475 =
MHz),
> >>>>>> SDM439 (650 MHz).
> >>>>>>
> >>>>>> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> >>>>>> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>
> >>>>>> ---
> >>>>>
> >>>>> This all looks very good, just a nit
> >>>>>
> >>>>> [...]
> >>>>>
> >>>>>> +             /*
> >>>>>> +              * Increase inactive period to 250 to avoid bouncing
> >>>>>> +              * the GDSC which appears to make it grumpy
> >>>>>> +              */
> >>>>>> +             .inactive_period =3D 250,
> >>>>>
> >>>>> Are you sure this is actually necessary?
> >>>> Every A5XX GPU is using the same value, but i have never tried with
> >>>> DRM_MSM_INACTIVE_PERIOD.
> >>> This was the original patch
> >>> https://lore.kernel.org/all/20180507224750.9383-1-jcrouse@codeaurora.=
org/
> >>> where the inactive period was increased for a530. I cannot test
> >>> suspend on msm8937 yet.
> >>
> >> The suspend here refers to device suspend, not system suspend. Adreno
> >> goes into device suspend every time you stop using it, i.e. after the
> >> rendering is done and there's no more work to do.
> >>
> >> I suppose a good test scenario here would be to keep running and closi=
ng
> >> kmscube in a rapid fashion and checking if the GPU starts crashing for
> >> unknown reasons (the dmesg would denote that)
> >>
> > I have checked on a505 and a506 with this small script
> > while true; do kmscube; kill kmscube; done
> > none of them crashing, so i am going to change it.
>
> Hmm.. not sure if it actually idled when tested in a tight loop.. If you'=
re
> running bash, try "while true; do kmscube &; sleep 0.08; pkill -f kmscube=
; sleep 0.08;done"
>
I see no crash
> Konrad
