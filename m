Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33469E4F0F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 09:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B76710EDC3;
	Thu,  5 Dec 2024 08:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h1BOkTeX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86F410EC48;
 Wed,  4 Dec 2024 08:33:23 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6efa08f91c8so32501277b3.1; 
 Wed, 04 Dec 2024 00:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733301202; x=1733906002; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PqgcCQZXvVp4Bfem5Yv6XqnOFFpUID6nHSIu6ZBoJFY=;
 b=h1BOkTeX5OWSHV2rl4wiAbDlwaZJn86kWTVPw5s7lUU+6uRxqGRqNxmzTh4lTGV+gS
 y6EM71kWgu5Zg+9A8aJ/IT64/oAScwNNOWbvmH/OV7cNcaBq6zxsYlc3tYR8r01DYE8i
 CKoVwT+hBpa7Ro/fhXSGcQQN/cFY86nYhm2TeWbFYYYgLwxTODsj8+hq3X41ex1Q9tuv
 triSrSrWvkXSeDo3OLrtzHJ1QTi8RTszDFiDiOfb7cE778mwndoK0qpxfXH2iwkT8yau
 hjr/uQN3J/fsnAtmVcKO7+I2YL9hT9yg8ZYD0zwjPI+ZsuP6ylWdxqi5cqtG+Fypqosl
 sOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733301202; x=1733906002;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PqgcCQZXvVp4Bfem5Yv6XqnOFFpUID6nHSIu6ZBoJFY=;
 b=tDb+PK/KQOMrG4WD/00nQQNRNTUSMporF9xyNx8IRuYcOFeZM/WH7UxtUbqckAVwPX
 UFjy9iduMqbBYm04HMLT/zvoFJ2q3B/wRR5jF44qaLQiPegjJNjhby0FKprM75zSX8Kr
 xXbgyxbc/RZNwm9RXsqiQSzJYprgdbSPkgMRXJ0g5fvNM7IMAfdgPVKdOgSuXfEDu8l4
 bXooarHkL3+vPmnYSHf5+6Xvjnglz+f75AT/sLt9E9EGEbgxkC6GcUtbo5cHRtB9sTYj
 DAcFKx3KtQZhFaRELCdkg0JiHLmBJUaa0FB03GbUYcbBZJwT7sKsh+0qCHHcrSm+2eEZ
 Jw+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUTdlHboZiuD9xdGGtJnEkQrxDvt/oAr9zcO1wOGMapNJbOl/6uFZLTmiIhTxrV4vHyfrZeyQOjPM=@lists.freedesktop.org,
 AJvYcCWLAA/t3fsxF3YsXwn9fu9+c/Dl44lU8KXhm/+2k1J0S21g1RCTCnQHrZnkSc/JeW7k2kFx9PQYKfQn@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2hNoA1Pz1rnvbxfDh40mYleY8oyaQeIlm42SWI1DSUBswvMhF
 Zg8/E7oj5Im1xHtfHylkGeQ1gMTPSi1Na28B+0wm/WEmGV6iVz7nb/+UH0LtbJUmkODo7l6r5IK
 aPIDwOrrVCdfAv1mD4fx8dedt+t0=
X-Gm-Gg: ASbGncvWAXhrtfKooDqC6xVA5XQyUj22rbTosBUwuSQ3iw3GrgT1gH9yIyHcwkM/wEY
 xDcWv1/3u17H179V+aGdVEw/CBCs9nQ==
X-Google-Smtp-Source: AGHT+IFw774SQc5f/E3/qKNgVjFvhg5SBOnKwWNF0IB05KgUZjFgT5iwuKqww2EKSOoPqGsXNx9Fv0RKwOHRybGib+M=
X-Received: by 2002:a05:6902:2803:b0:e38:b3a2:6bc4 with SMTP id
 3f1490d57ef6-e39d436e234mr5853142276.42.1733301201994; Wed, 04 Dec 2024
 00:33:21 -0800 (PST)
MIME-Version: 1.0
References: <Z1ASwcMuxEWmudzP@gmail.com>
In-Reply-To: <Z1ASwcMuxEWmudzP@gmail.com>
From: Luoxi Li <lee.lockhey@gmail.com>
Date: Wed, 4 Dec 2024 16:33:09 +0800
Message-ID: <CAL7siYM7MMrYtARvicp0+AAdP=drufHVgCAgcTOmSJxvS5_mvg@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] drm/msm: adreno: add GMU_BW_VOTE feature flag
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 05 Dec 2024 08:01:58 +0000
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

sry=EF=BC=8CPlease ignore this email forwarding=EF=BC=8C thks.

Dmitry Baryshkov <lee.lockhey@gmail.com> =E4=BA=8E2024=E5=B9=B412=E6=9C=884=
=E6=97=A5=E5=91=A8=E4=B8=89 16:28=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Nov 20, 2024 at 01:37:48PM +0100, Neil Armstrong wrote:
> > On 20/11/2024 12:19, Dmitry Baryshkov wrote:
> > > On Tue, Nov 19, 2024 at 06:56:39PM +0100, Neil Armstrong wrote:
> > > > The Adreno GMU Management Unit (GNU) can also scale the DDR Bandwid=
th
> > > > along the Frequency and Power Domain level, but by default we leave=
 the
> > > > OPP core vote for the interconnect ddr path.
> > > >
> > > > While scaling via the interconnect path was sufficient, newer GPUs
> > > > like the A750 requires specific vote paremeters and bandwidth to
> > > > achieve full functionality.
> > > >
> > > > While the feature will require some data in a6xx_info, it's safer
> > > > to only enable tested platforms with this flag first.
> > > >
> > > > Add a new feature enabling DDR Bandwidth vote via GMU.
> > >
> > > Squash into the implementation patch.
> >
> > Which one ? the flag is use in the next 3 patches
>
> First one which uses it
>
> >
> > >
> > > >
> > > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > > ---
> > > >   drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
> > > >   1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/=
drm/msm/adreno/adreno_gpu.h
> > > > index 4702d4cfca3b58fb3cbb25cb6805f1c19be2ebcb..394b96eb6c83354ae00=
8b15b562bedb96cd391dd 100644
> > > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > > @@ -58,6 +58,7 @@ enum adreno_family {
> > > >   #define ADRENO_FEAT_HAS_HW_APRIV                BIT(0)
> > > >   #define ADRENO_FEAT_HAS_CACHED_COHERENT         BIT(1)
> > > >   #define ADRENO_FEAT_PREEMPTION                  BIT(2)
> > > > +#define ADRENO_FEAT_GMU_BW_VOTE                  BIT(3)
> > > >   /* Helper for formating the chip_id in the way that userspace too=
ls like
> > > >    * crashdec expect.
> > > >
> > > > --
> > > > 2.34.1
> > > >
> > >
> >
>
> --
> With best wishes
> Dmitry
>
>
> ----- End forwarded message -----
