Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAFC789312
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 03:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2B110E082;
	Sat, 26 Aug 2023 01:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B8F10E082;
 Sat, 26 Aug 2023 01:30:01 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-51d95aed33aso1990293a12.3; 
 Fri, 25 Aug 2023 18:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693013400; x=1693618200;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S2D36dOoa06BWR5AgzTMO8lYHiZ+scFy120F5WcTjb4=;
 b=FDM7incZcG0SAgE8+njJbysK0lJLfbZ5w5pqVsOhU0RVVKAbbu9S2DM/Ck1prs72Pq
 I1r85m4ckvcMwSk1x9V/A6/mHix2474u+E+NzTZ4GWI3bHSDYt9JoYxCISI9J3MBWfQ7
 g1CoUg3IzIojkWoDzheYx/OTFNTt1V/6tkwFQ2peXQWpAEhQxGcVNC70/9TV7NC3NfW8
 1qLkYtq3W7SQg4Mgvc4a12z8gMdWJX+3B0OJlVtmliGYW/Qpm5PV/EYkpVeVqO+FiNyh
 OPmriR2FLEwDSulrTmguaW/O2uxJ3T/ZR5TdkJL5lv9TmqjEHrUTVKdnmaV385nDHbxF
 Xiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693013400; x=1693618200;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S2D36dOoa06BWR5AgzTMO8lYHiZ+scFy120F5WcTjb4=;
 b=HYZmTAZEyUTEJhYeu4JlsgvoNY73tmOP0kJ/zbTHazI2vipoFyLWS1fjn9/mD0uKCA
 Kt2duuIHDheSBgk5WRKHdVX3OWEfYtXBhzxD38KIzmqsgl/otQuc3wCnJ1yana2uu0Rw
 A/ve45Q+kjln1Y2+QpRsPB9oVwFesLumvweVL/1Or1F9P0lCUm6jbWC27ZmSM0fUYZEH
 P/BMBnd6kqJ4aRCfqhWivsj2I5bVbUYUHKSULtwG/vXUYq2ui7TclVtmkHle9TpGKt5d
 8vVv2cfwlODTN+KTQaZERqTM/NsNeAW/Su9maY6CwAJfdLbWelg5h4JPgWPBQGn37Ew3
 mUGQ==
X-Gm-Message-State: AOJu0YyNgCKQ3QZpIoslo1JY7s9nhs6Z5BanDqUkrvzZtJmKrX4ke+QS
 Vx2nBRIrEIyGvnuGZSgobfwdLPOcLFT9SWR+WHQ=
X-Google-Smtp-Source: AGHT+IEXsOl+EHSkkBQhRH9RjwYOfhOsIxG3m6cpaf528qm11nkEYjjL1pWzb1LveXcoEDTjgx812Dp7EL91FKYuxKo=
X-Received: by 2002:a05:6402:34b:b0:525:69ec:e1c8 with SMTP id
 r11-20020a056402034b00b0052569ece1c8mr12651629edw.40.1693013399773; Fri, 25
 Aug 2023 18:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230825-topic-6375_gpu_id-v1-1-e24f46d7f139@linaro.org>
In-Reply-To: <20230825-topic-6375_gpu_id-v1-1-e24f46d7f139@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 25 Aug 2023 18:29:48 -0700
Message-ID: <CAF6AEGsNr+5zaXqKRhyeY6NV+iRD+Yz8ftqiX6Z08esoyh=DzQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Fix SM6375 GPU ID
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 25, 2023 at 2:11=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> SM6375 comes with a patchlevel=3D1. Fix the chipid up to reflect that.
>
> Fixes: 90b593ce1c9e ("drm/msm/adreno: Switch to chip-id for identifying G=
PU")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm=
/msm/adreno/adreno_device.c
> index 575e7c56219f..f2d9d34ed50f 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -331,7 +331,7 @@ static const struct adreno_info gpulist[] =3D {
>                 ),
>         }, {
>                 .machine =3D "qcom,sm6375",
> -               .chip_ids =3D ADRENO_CHIP_IDS(0x06010900),
> +               .chip_ids =3D ADRENO_CHIP_IDS(0x06010901),

r-b, but maybe we should list both to be safe?  But unsure if any
patchlevel=3D0 things are out there in the wild... I guess we could add
it back in later if needed

BR,
-

>                 .family =3D ADRENO_6XX_GEN1,
>                 .revn =3D 619,
>                 .fw =3D {
>
> ---
> base-commit: 6269320850097903b30be8f07a5c61d9f7592393
> change-id: 20230825-topic-6375_gpu_id-cf1596e2b147
>
> Best regards,
> --
> Konrad Dybcio <konrad.dybcio@linaro.org>
>
