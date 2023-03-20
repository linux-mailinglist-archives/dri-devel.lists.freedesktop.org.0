Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C526C22B9
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 21:32:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35BF10E668;
	Mon, 20 Mar 2023 20:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6C710E666;
 Mon, 20 Mar 2023 20:32:21 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-17e140619fdso5796663fac.11; 
 Mon, 20 Mar 2023 13:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679344341;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=12KAyNaeVtkJ5rG4NmiGkp4SVUBOlP5Uo6aQC2/m458=;
 b=GgFEX8IntA0v6Di1a+rTrNjjl6RrkDQaozC8lQ2nu1fNZaNmjR+yunhZ2d7e1zGBpj
 OemS7YHDVpLhsOrGr9k0bGA9riGTykK407sjl86mIHF1dfPohd4xDcFc/eREcLnkyjg5
 IcqVCAFAtiXPfmaPkaDUB60V9udx+KFLFc1jgRT5qGh8PRrRAJlfck7KOULrQ+zbX3E4
 XWzIlNC129US8nw0E/3xU/y2nVxe2KI9uWRn1Mkm3hMnYXMbFFHx0vRCj1u9ctdMWZvZ
 xY5Mi66p8B0wDRHYLaOAZ8uogg+6JvpjfbfE0PZyCRF3T8cnCCCYyNaL6m/nVxHZpt8f
 sgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679344341;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=12KAyNaeVtkJ5rG4NmiGkp4SVUBOlP5Uo6aQC2/m458=;
 b=6TCb1t4tRzjo4EcipLXMuzD+iqg/i8zF4HCwL4pZz4fr/ZY5oeBAokd6Jt0ZXrwpcz
 eF0UdGhETWVsl50Qi2KhF4ogeAbyOjG/8ivpucC/MMtdN/BQlkyNkMpFbuLZXGeWixwf
 zCvry98Tdf7YKMqJ5mDtuwpMhZH+2JcE7CJoo34I/mgzSNiTdwXLVwESs904TCp52155
 NbS0DEuWpaLhkeazLHmqAxYMAlsgPm8RYrVK0O1jTJwxgtEcVspXHn0/Uc49gSoulFyi
 /y9PgqRrfWgCfBs2yPOkrpnuM50i2WBgSn3gZN5yOz1SW7U6gSUdd1Dc+hh/EEvsz854
 6N7w==
X-Gm-Message-State: AO0yUKXep/BowyRbZB1uQE+Qac25awyzVdnqfTaNMhGcnHlq+zNCJAA/
 g4MjxYg0ptC3d/dv6NGvN1ZS5zxdQNJjqYrgrXg=
X-Google-Smtp-Source: AK7set+DLFjlPgniOaSyE+Bi3m/ZckWHV551x+C0CntkAwvgXWwf+U3UZOrrp6mZW/7ZzD37hw8KFC+8m3onejMpB6k=
X-Received: by 2002:a05:687c:90:b0:17a:d52e:77de with SMTP id
 yg16-20020a05687c009000b0017ad52e77demr3022932oab.5.1679344341050; Mon, 20
 Mar 2023 13:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230320185416.938842-1-robdclark@gmail.com>
 <434caf75-eed1-ac35-f43c-da8c66cb99bc@somainline.org>
 <5a9e6cdb-f640-f070-6722-18e61c9f1136@linaro.org>
In-Reply-To: <5a9e6cdb-f640-f070-6722-18e61c9f1136@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 20 Mar 2023 13:32:09 -0700
Message-ID: <CAF6AEGv1ALTcvHCPVo_sqt8UHYVcsV_XdP054D+qQr72yQ6-Dg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/a6xx: Some reg64 conversion
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 20, 2023 at 11:57=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linar=
o.org> wrote:
>
>
>
> On 20.03.2023 19:56, Konrad Dybcio wrote:
> >
> >
> > On 20.03.2023 19:54, Rob Clark wrote:
> >> From: Rob Clark <robdclark@chromium.org>
> >>
> >> The next generated header update will drop the _LO/_HI suffix, now tha=
t
> >> the userspace tooling properly understands 64b vs 32b regs (and the _L=
O/
> >> _HI workarounds are getting cleaned up).  So convert to using the 64b
> >> reg helpers in prep.
> >>
> >> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 9 +++------
> >>  1 file changed, 3 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/m=
sm/adreno/a6xx_gpu.c
> >> index 89049094a242..f26e258c6021 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -1053,12 +1053,9 @@ static int hw_init(struct msm_gpu *gpu)
> >>      gpu_write(gpu, REG_A6XX_RBBM_PERFCTR_GPU_BUSY_MASKED, 0xffffffff)=
;
> >>
> >>      /* Disable L2 bypass in the UCHE */
> >> -    gpu_write(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX_LO, 0xffffffc0);
> >> -    gpu_write(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX_HI, 0x0001ffff);
> >> -    gpu_write(gpu, REG_A6XX_UCHE_TRAP_BASE_LO, 0xfffff000);
> >> -    gpu_write(gpu, REG_A6XX_UCHE_TRAP_BASE_HI, 0x0001ffff);
> >> -    gpu_write(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE_LO, 0xfffff000);
> >> -    gpu_write(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE_HI, 0x0001ffff);
> >> +    gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX_LO, 0x0001ffffffff=
ffc0llu);
> >> +    gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE_LO, 0x0001fffffffff000ll=
u);
> >> +    gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE_LO, 0x1fffffffff00=
0llu);
> > Any reason the last write dropped the leading zeroes?
> >
> > Otherwise,
> >
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Bah, thunderfox sent it from the wrong email. It still stands.

No good reason.. I can fix that up when I apply

BR,
-R

> Konrad
> >
> > Konrad
> >>
> >>      if (!adreno_is_a650_family(adreno_gpu)) {
> >>              /* Set the GMEM VA range [0x100000:0x100000 + gpu->gmem -=
 1] */
