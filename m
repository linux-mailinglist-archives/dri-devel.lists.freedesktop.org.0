Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 841358234E5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 19:49:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1641410E32B;
	Wed,  3 Jan 2024 18:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC4910E32B;
 Wed,  3 Jan 2024 18:49:10 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ccbf8cbf3aso102867761fa.3; 
 Wed, 03 Jan 2024 10:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704307749; x=1704912549; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HSwdtsY61fYy46M5QE5KizBE3QaiBoSxLHAq5Tnp4Uw=;
 b=aSDgCoxPTV66XGpEXdVXsrvnpEZdDHfzmbPwouxkRiYgaKyKnGryHwaQ5T4epXpSBM
 4b4zulgHXzmNTJyPxIYSLey51Pf9bXnoKpzm+JVsiIvMtv40aJmdCYJ+d8gfYMwcaFWp
 F2UkOCiLVW4kVodg1RZdkNJAdAK0AAGuArfxxsbP87kQEueuTpjBOJ/emaO/Cn9/ALMd
 oMEUndshKOsIUuAiXiONMJI3cwIWMx2cpGce4F669gv/0vUZ+Uj+iLSLLUjHLjEonsNW
 DjNsNufglhhWklX3CO2c5ZWKI5DY7S9ZMMY/jqEIRMRj9Aadh+wd/zL3nXxpGCrZzzvz
 SRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704307749; x=1704912549;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HSwdtsY61fYy46M5QE5KizBE3QaiBoSxLHAq5Tnp4Uw=;
 b=wmnOWPXwblFqSERGHeXvPH9d6km1b8Mz3rov6ufKtDpOoqnYMqqEb1Q02CmvGuB9dT
 IE/tsPZrm1NtzDFnEHVltRTZEq3Dj2s5Kp6LVuPeDUCcCWhRxE6ulyL010bC8Y7Zkvpi
 6QzpdnIX+0KUyK+g8JHr1T0sVaKSALemj4GurNCy+HP6+dVY3V/4nzaNvTifB1JUkNsO
 ml7Euqs474t9c5tW4M3UgMyLecpeHd95BT6q7rcbk+e3xFvL3dyuUQyyYkkTHLC7PrZH
 eauubJLq9qJK0y3tjg7fce6VrhPGkT6gsUXk0egktw7sqqLUmgUWI2AlmMwIuw5HVSlP
 bCuA==
X-Gm-Message-State: AOJu0Yz0FdJ/we9dZYMX1OytJahvEQGsVgF5conh68ISnserHPBn9Qb7
 iahwyr7Rs/F7SA/sIlr+aiPJE4pO2HKWe3QGW5g=
X-Google-Smtp-Source: AGHT+IG+OC/fH5CHJHM4KYYgGuSRIAloVFSbQRrYKWlazIMzUbmSodkBi162LLgz+u6vZOa9YXsBO0vakCfp0mrOPbY=
X-Received: by 2002:a05:651c:4c6:b0:2cd:dfe:74bb with SMTP id
 e6-20020a05651c04c600b002cd0dfe74bbmr2277411lji.49.1704307748788; Wed, 03 Jan
 2024 10:49:08 -0800 (PST)
MIME-Version: 1.0
References: <20240102193348.250917-1-robdclark@gmail.com>
 <fd88a067-63f6-4467-9787-989890287083@linaro.org>
In-Reply-To: <fd88a067-63f6-4467-9787-989890287083@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 3 Jan 2024 10:48:56 -0800
Message-ID: <CAF6AEGtk7qS5hPYDGKVnrcEfcQEkr1J4=UTL7sikVJB3AvDBFQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a7xx: Fix LLC typo
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Danylo Piliaiev <dpiliaiev@igalia.com>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 2, 2024 at 12:12=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> On 2.01.2024 20:33, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > We'd miss actually activating LLC.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index a5660d63535b..54dc5eb37f70 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -1646,7 +1646,7 @@ static int a6xx_gmu_pm_resume(struct msm_gpu *gpu=
)
> >
> >       msm_devfreq_resume(gpu);
> >
> > -     adreno_is_a7xx(adreno_gpu) ? a7xx_llc_activate : a6xx_llc_activat=
e(a6xx_gpu);
> > +     adreno_is_a7xx(adreno_gpu) ? a7xx_llc_activate(a6xx_gpu) : a6xx_l=
lc_activate(a6xx_gpu);
>
> /me cleans glasses
>
> oh..
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

I suppose I should also add,

Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")

> Konrad
