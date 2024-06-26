Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CF7919AAD
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 00:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D4D10E9D9;
	Wed, 26 Jun 2024 22:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MLBr3Wfh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AAB10E9D5;
 Wed, 26 Jun 2024 22:32:41 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-57cbc2a2496so972698a12.0; 
 Wed, 26 Jun 2024 15:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719441159; x=1720045959; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U36grdanXj9yAh+pNda5S+WRPO+QWYAY7LoWhNNT3IY=;
 b=MLBr3WfhXbl/RwN5+R8TRmLjPZ0W1luvLb10+3GQ4/fQhnEF+x/w9+GvW6iz/UWmk2
 lpcv+3jPzHSoSeF1lbf11+6M6q/L4F8bnhEMEvsehK25fDqh5l2IcegkqdnUv3Kjtqsw
 wBlYL65cs90Fc0pYaG6AoU50hQox3h1iM482mz4K7ZTzSJHN8mBNPbn57ib9UaZytHLG
 NfsVIh4rWCz+0xNmegFobrYR+l+BW/hqh1Qp0MgnBMrQk/9dcvTjjfbwcmpZT2shuJlP
 TwlcEYGgvlq7lxZZ6V3AlG0reCjxoOubWR9O2TYlR3nJLdBl88zpMk+3pRt5HbOYo3zx
 kY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719441159; x=1720045959;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U36grdanXj9yAh+pNda5S+WRPO+QWYAY7LoWhNNT3IY=;
 b=kvwMMx/K+VpWF/6wjiZGit/jeWWH3bnvuoJQuRvMpdecOvj+LWHXWd/RtenmZo83uI
 cu72ZtLB2dtLTGZqQL8DPdN3c0y5DkQZ66TtCHdTqzHDy8VWlXbyP+ayK3lscmh5o0wy
 FX963FXwZExnwVbs8cgNT0onxXMgc2TXMOFnmsC6iUDcOEIS4Ti02N9NWf2szLSN9pA0
 GVoqrffUCtZjxhhi3wQzpdNzLLTIhaBSyifSslDg4Blw1pG9I70+zoHBD6AHRDJNCWtm
 jqx/iyddZRurI7zHyBZqTXzLwLIdUTKcKCmb65C3choY0g36KJ6xyfLnikN9XHFICEMb
 BPdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkhOvvOtaCK0qSYzs8Bp4cyTCmkcanzLb4cElP0MMhJaAX3riXCPWHxhgfPpdVNnw0u5Sm2nV9NYw5UsBKjEu9XFU1A2NItYBRySboePWL2OIFAZDojb64XfTchm6SuQwy+rdrqZl8OUDE+ZFbC7O7
X-Gm-Message-State: AOJu0Yzjv8JAk1Tl6otBJdsZLb2lb2RH2tEK7TdeoxYHq54xmkZmb3FI
 1+/wxCRbGgUkmi30kUT9kZG8coWxPmCFcE6YXY747k/LCc99GrMNOaoIpQr1ym/OjqW38a8Kd3L
 mhKfEzFxevaPKoTdZpnWAhyocTVM=
X-Google-Smtp-Source: AGHT+IHb98roHx5g3sBxWkKskttk5XU+NH37JopqIA/4bV6IWCJPWXBdw3kCMp992cniMQGn3EC2cUYVZE3FHSqDqKw=
X-Received: by 2002:a50:871a:0:b0:57d:7ef:573b with SMTP id
 4fb4d7f45d1cf-57d4bdd02bcmr10384352a12.38.1719441158804; Wed, 26 Jun 2024
 15:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-3-quic_akhilpo@quicinc.com>
 <5947559d-30dd-4da1-93cc-a15dc65cb77d@linaro.org>
 <20240626082422.zcsari27yoskayuo@hu-akhilpo-hyd.qualcomm.com>
 <CAF6AEGvCaGq8ukxra_bzc=4pUf8y5NndKRagQspD0=uCZdBfoA@mail.gmail.com>
 <853849b4-69f2-488f-ab17-dc550c235e3d@linaro.org>
In-Reply-To: <853849b4-69f2-488f-ab17-dc550c235e3d@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 26 Jun 2024 15:32:26 -0700
Message-ID: <CAF6AEGsFExhokWqHka-cwFGqyYgo61OL=7F=o5ouRm-LoHh9Dw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/msm/adreno: Add support for X185 GPU
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>, 
 linux-kernel@vger.kernel.org
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

On Wed, Jun 26, 2024 at 2:38=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> On 26.06.2024 8:43 PM, Rob Clark wrote:
> > On Wed, Jun 26, 2024 at 1:24=E2=80=AFAM Akhil P Oommen <quic_akhilpo@qu=
icinc.com> wrote:
> >>
> >> On Mon, Jun 24, 2024 at 03:53:48PM +0200, Konrad Dybcio wrote:
> >>>
> >>>
> >>> On 6/23/24 13:06, Akhil P Oommen wrote:
> >>>> Add support in drm/msm driver for the Adreno X185 gpu found in
> >>>> Snapdragon X1 Elite chipset.
> >>>>
> >>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>>> ---
> >>>>
> >>>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 19 +++++++++++++++---=
-
> >>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  6 ++----
> >>>>   drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
> >>>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
> >>>>   4 files changed, 36 insertions(+), 8 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm=
/msm/adreno/a6xx_gmu.c
> >>>> index 0e3dfd4c2bc8..168a4bddfaf2 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>>> @@ -830,8 +830,10 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *g=
mu, unsigned int state)
> >>>>      */
> >>>>     gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
> >>>> +   if (adreno_is_x185(adreno_gpu)) {
> >>>> +           chipid =3D 0x7050001;
> >>>
> >>> What's wrong with using the logic below?
> >>
> >> patchid is BITS(7, 0), not (15, 8) in the case of x185. Due to the
> >> changes in the chipid scheme within the a7x family, this is a bit
> >> confusing. I will try to improve here in another series.
> >
> > I'm thinking we should just add gmu_chipid to struct a6xx_info, tbh
> >
> > Maybe to start with, we can fall back to the existing logic if
> > a6xx_info::gmu_chipid is zero so we don't have to add it for _every_
> > a6xx/a7xx
>
> If X185 is not the only occurence, I'd second this..

basically all a7xx are "special" compared to the original logic, so we
can start with using gmu_chipid for just a7xx

BR,
-R

> Konrad
