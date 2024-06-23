Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E329139AD
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 12:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850E810E076;
	Sun, 23 Jun 2024 10:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Eot995DQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B8F10E04C;
 Sun, 23 Jun 2024 10:49:06 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-7065e2fe7d9so1242370b3a.3; 
 Sun, 23 Jun 2024 03:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719139745; x=1719744545; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5tOKBNF1K6kM4/l3Ir2w3oOEOvrznnr6BloYrKa9764=;
 b=Eot995DQ1zQgJuVHy+aRBF7W3RxGJwQ97OL7gjGY4VHzLAFBPdmhbJx4RIsPiC1zRJ
 OMFReLBwWONfhoqe1HDOGVbjMD3FruCsNK9JqYrPdH158067zuWEe6rbqGEuy5dcSsJS
 NfyMJFhD0+Rcu/jBlgGtml2ZuLo0OArIuc3wF0i4tmYtwLn6riEhmA2/6QbL16RX5mDc
 C3/Tb3GlG20+Sapt4w0PS9FWUIH3hzDYJ/DvcCwIZVLWkxi07/uK3sX9msY7xltmACJo
 gph0SwBSjkCTug2RLqZwdtJNYCYcC63WljwqTIw6D6BbMz0E3ZsbnuPi7Vi+WSILuuno
 mICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719139745; x=1719744545;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5tOKBNF1K6kM4/l3Ir2w3oOEOvrznnr6BloYrKa9764=;
 b=uc+msgDbFfzA65sxKXrjEjbz3vfZRaWxyy5vAyF4vAvpqSkHm6WceZb4WYZhxeWEJG
 y0vUUFjUdO+hO5XOS2z1avL9g1EcJ1wR8Z/XBAeM69GaU/6V0TqRnVj4YtYEB+59JNRG
 wwv+1iiRqZKf75uv+u2PyXCSYUqsDucUjHeA2oaf6PpDP401sTAmh7RnGhOk3zbWRnc1
 b7/I2jCucpTCUIQ36M9AKEVTOBQBtpR4JrwhOZ2dI4XFTxQtLiUeQDBL2A+lADBIbwe4
 ynkj4tQxsNBUBWbwvwpBAu1s2hI8k/yc86hnRFPc1KuceZgZ0E8DBUq6eWKE1FWqqcrL
 gPcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfpuDVhIQHR1RjMuk6NwJGebL9v6P9z3MQlGX5kQGHKebnOiv2VEodlwoIja6JufWo4Zs5yI0N0qh2fWsV+qGvY72BgNrbHEAeOONbbAeyJcyhpUOp3yT/BJt623pUQS6FmPI1JjMF76PNkWGoztt3
X-Gm-Message-State: AOJu0YwR2SNT1RkU1cw41DlQdh3IMovYbi+cufaDYIUmq3+MszY9eQj2
 oz+PMDSMJaSPihjO2EaX797Kws5UhjaCiFG5tNP5OaVV3mzfzxiUIoqYR28xsPhpgQq+lWQad15
 0XSecssSkoyX+IeZ+50l2+bcpW4w=
X-Google-Smtp-Source: AGHT+IEYhaua3z+8fvVxYKOlzI0SeXlh1Mqqe1m7wg491bift0wbb0Sz1XkAToMjWcbemVJ9AJKorDfG72cQicJRWyw=
X-Received: by 2002:a05:6a21:7882:b0:1b5:1feb:b3f9 with SMTP id
 adf61e73a8af0-1bcf7e32018mr2620120637.9.1719139745149; Sun, 23 Jun 2024
 03:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240623-dsi-v1-0-4ab560eb5bd9@gmail.com>
 <20240623-dsi-v1-2-4ab560eb5bd9@gmail.com>
 <hzslz54iq5sjmfhcbuj3my7cbjsu73acxeelih3jekr6rznz44@qie4c4w5lt2d>
In-Reply-To: <hzslz54iq5sjmfhcbuj3my7cbjsu73acxeelih3jekr6rznz44@qie4c4w5lt2d>
From: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Date: Sun, 23 Jun 2024 12:48:53 +0200
Message-ID: <CAGsSOWUDbvUMW95Xnjrg4z7TJ9=tj7_KHyek3xTuzbDP2_VhHw@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/msm/mdp5: Add MDP5 configuration for MSM8937
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Daniil Titov <daniilt971@gmail.com>
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

On Sun, Jun 23, 2024 at 7:59=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sun, Jun 23, 2024 at 01:25:52AM GMT, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> > From: Daniil Titov <daniilt971@gmail.com>
> >
> > Add the mdp5_cfg_hw entry for MDP5 version v1.14 found on msm8937.
> >
> > Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> > Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 89 ++++++++++++++++++++++++=
++++++++
> >  1 file changed, 89 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm=
/msm/disp/mdp5/mdp5_cfg.c
> > index c5179e4c393c..6413c0d3e237 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> > @@ -1011,6 +1011,94 @@ static const struct mdp5_cfg_hw msm8917_config =
=3D {
> >       .max_clk =3D 320000000,
> >  };
> >
> > +static const struct mdp5_cfg_hw msm8937_config =3D {
> > +     .name =3D "msm8937",
> > +     .mdp =3D {
> > +             .count =3D 1,
> > +             .caps =3D MDP_CAP_CDM |
> > +                     MDP_CAP_SRC_SPLIT,
>
> Could you please point out the SRC_SPLIT reference?
Is this would be qcom,mdss-has-source-split in downstream, because if
it is i think it is a mistake and it is wrong at msm8953 also.
>
> Other than that LGTM
>
> --
> With best wishes
> Dmitry
