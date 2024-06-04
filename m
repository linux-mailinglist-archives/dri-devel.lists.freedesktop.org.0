Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B55038FBA81
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 19:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D24E10E279;
	Tue,  4 Jun 2024 17:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A4PunydU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E1610E279;
 Tue,  4 Jun 2024 17:33:19 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-6d4bf8eb8e2so505186a12.3; 
 Tue, 04 Jun 2024 10:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717522399; x=1718127199; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=63v6j8hzC+Le93kyoeflCRDkGNVRCCu2mfp5KUaAnVQ=;
 b=A4PunydU0PtflVZlre82ZnKV/4etVTT/QnniBixQTe3qppgtk+J+pKC2rUDrxFiv4q
 pbZ9x5zIe8OGJwkOOuXdWhrEuIVNrPuxqVz3u+8KZuzn3O5LvdQfqjG2ZSrpxhdcmV1Q
 rsstNuhoVM/FGdzWNKk1t91oRzEF7P2/xtFS5SENxkHQfr1qgAMgF1cB0+xM/SMT5mI3
 ll/os58hVOlEwIEHvmQwxHwLcLiwbNqmdgrtQ4BxuSXYEfeRmCd4eMLSdpLdCvNMb6ks
 eHEFs++lp3+aMZe1QBX2mgDR2HvWnHPBUfWrwplLe4GD8U3OZwCPPaFSOa+20QmzjZRL
 qHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717522399; x=1718127199;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=63v6j8hzC+Le93kyoeflCRDkGNVRCCu2mfp5KUaAnVQ=;
 b=K4B+Rc5Y++5mugNIVCS1EB/9s9r071bBjzJP21/c/DcTQUvPrp9CbUS9Fh94rQI/BW
 Y+JTtSh9xY6f8ZnL0/78xkftNHyeX3+azPOxpHICT4oi+a20rG+vuZCIQagyMiYjWc5n
 YR2/WxFEAFW5S8ooFV26REY1z1GqDnxfd6vu/T34iugvlEJs1Bf+dnJP9rhCRg0qgGnG
 05RAHS1Nuib1KHfAVRjB2lz+TAl3nDb5GmX0Q8QdYD73qyClawNdH18AryzXtRPnB7N6
 rcqOiwVDWPfSJFTEyFmc/k+WsJcXrCxRGdYA85HsPJJ/qjQnSqc0Lw1VsQyVmf68cYE2
 H+bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9p6YkenO71+/EJ7+E5xd1QmWR49Ogt2vA631+CYkBiSruQseAOPrEXRcxCpaDzdjmPF6oeFJmSQBdwwWJ82eg2I0MJ+ufyyCrQAVMbO7R8zaTQ7F8DGWIUgZ75sAxOp4zZ6LdNcYN21Ki3QfJRRZH
X-Gm-Message-State: AOJu0YxGCoy80/4S8xIzamwplEXZyCBJgCmDPNxufljI1K30GEwweuvi
 Tb8ud0XIAZqyUdcxce2R1NUPSjiDDvLbhrbbNzfGMrpRf2FLNTqLFccU7t04LfWDqyD87W5YIz3
 iuAvxeC5YTNGpJZBpjlE//KUEZhU=
X-Google-Smtp-Source: AGHT+IFL6LnqJEew7ANnyer/NGZs2s8PRUmbYPraWgW0HaR3LUPGwf4aoQwHd/mVUBYU0r0nM3dM2yMs2IsqmijKfOY=
X-Received: by 2002:a17:90b:20d:b0:2bf:6b68:5219 with SMTP id
 98e67ed59e1d1-2c27db63af1mr114715a91.41.1717522399093; Tue, 04 Jun 2024
 10:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240604-a505-v1-1-82ee1c04d200@gmail.com>
 <49fe3b01-4f00-4ffc-80cf-2a0add1ebaad@linaro.org>
 <CAGsSOWV=i2JHsYNvi5EC6q=NoD8v7SiTjbVQhTDLNw35+irTCQ@mail.gmail.com>
 <CAGsSOWV9SRK1VUJiQfavEM1hL0PapxUBG6CNeD+Q=0qPT5ZnSA@mail.gmail.com>
 <37b0404d-bba5-4a77-ad86-62c6dd308d37@linaro.org>
In-Reply-To: <37b0404d-bba5-4a77-ad86-62c6dd308d37@linaro.org>
From: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Date: Tue, 4 Jun 2024 19:33:07 +0200
Message-ID: <CAGsSOWUNN-PRvojvJR-i7wBDz8QRNnaTt19-6G41g7Hdt6RyTQ@mail.gmail.com>
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

On Tue, Jun 4, 2024 at 7:06=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro.=
org> wrote:
>
>
>
> On 6/4/24 18:45, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrote:
> > On Tue, Jun 4, 2024 at 2:27=E2=80=AFPM Barnab=C3=A1s Cz=C3=A9m=C3=A1n <=
trabarni@gmail.com> wrote:
> >>
> >> On Tue, Jun 4, 2024 at 1:55=E2=80=AFPM Konrad Dybcio <konrad.dybcio@li=
naro.org> wrote:
> >>>
> >>>
> >>>
> >>> On 6/4/24 02:20, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrote:
> >>>> From: Daniil Titov <daniilt971@gmail.com>
> >>>>
> >>>> This GPU is found on SoCs such as MSM8937 (450 MHz), MSM8940 (475 MH=
z),
> >>>> SDM439 (650 MHz).
> >>>>
> >>>> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> >>>> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>
> >>>> ---
> >>>
> >>> This all looks very good, just a nit
> >>>
> >>> [...]
> >>>
> >>>> +             /*
> >>>> +              * Increase inactive period to 250 to avoid bouncing
> >>>> +              * the GDSC which appears to make it grumpy
> >>>> +              */
> >>>> +             .inactive_period =3D 250,
> >>>
> >>> Are you sure this is actually necessary?
> >> Every A5XX GPU is using the same value, but i have never tried with
> >> DRM_MSM_INACTIVE_PERIOD.
> > This was the original patch
> > https://lore.kernel.org/all/20180507224750.9383-1-jcrouse@codeaurora.or=
g/
> > where the inactive period was increased for a530. I cannot test
> > suspend on msm8937 yet.
>
> The suspend here refers to device suspend, not system suspend. Adreno
> goes into device suspend every time you stop using it, i.e. after the
> rendering is done and there's no more work to do.
>
> I suppose a good test scenario here would be to keep running and closing
> kmscube in a rapid fashion and checking if the GPU starts crashing for
> unknown reasons (the dmesg would denote that)
>
I have checked on a505 and a506 with this small script
while true; do kmscube; kill kmscube; done
none of them crashing, so i am going to change it.
> > I can check on msm8953 with a506 maybe if a506 works fine with
> > DRM_MSM_INACTIVE_PERIOD
> > then a505 would be fine with it also.
>
> The more testing the merrier :)
>
> Konrad
