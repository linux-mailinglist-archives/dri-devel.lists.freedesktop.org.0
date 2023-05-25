Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8244871127B
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D1410E6EB;
	Thu, 25 May 2023 17:39:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E385410E6E0;
 Thu, 25 May 2023 17:39:12 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-5576c2791e6so341221eaf.1; 
 Thu, 25 May 2023 10:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685036351; x=1687628351;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q4D8c9QPyqmoOXQDae1retuejjcC/UV6PHLGp3fhhjw=;
 b=cWK/TeSz7AD4BvpRQaMJ2AbrRrrf6WKrpQ31ln3A9MDdvoh1Sg6u4XectXi9T9z/Tw
 AYcM/jmSiuWiW/Y7cSut9dkxmvSSnwynvrd/RkP+sd0XxRZnxS+m/nhwBpUj9pyCG75Q
 +/Fx/Dda9E8NlcWKvp5PBiYBt5GOwUYvJdn7h4zEzj4f6dKV0Ug8MSbiukNwXryGzGpE
 JjdQSNxOE4Ed6PLcSO6QunQ4XoQx8q+2pOwv8yPRAdNm8sBNmLYrcuRZ4IAkGRBgdh41
 aTGtHXos9bezeG3UDyLvDbzDWLyl0jfA4i5JLxhgz5/07y5O7XOsgLfctZEMvW8kbgfa
 JGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685036351; x=1687628351;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q4D8c9QPyqmoOXQDae1retuejjcC/UV6PHLGp3fhhjw=;
 b=PZ62IJHr7IHqTIj1/SM0NTifHa9MGH192LilKw6qtRjenlG3MPbNLjQDLIF0OpzJfQ
 SYdkA/NuhdD4tLJ0FLxER1CqiUNIOhntajhXZYF0EzkPN7AJ66/VECK4yg05tk/dpK6c
 9tXrKtgpnwce104VdbRoixiHzjOb6sGub+V27JcbB2VIPeyxg/yBKClkouiurze6+Xsc
 cW1E3sDYYPGGx0hBkIQXA9XTBkFUxsYtrwYPtNmvd2KeIxTO0qeyBnhBYmT/GxDhpuQb
 6haWLchO7VK3QrfTlACmNQjjj25575A4+zQdnc4IQ6EPrhBJ8f0boiR98pzqkOQnjfdL
 ie1A==
X-Gm-Message-State: AC+VfDx6wWqq7Enk0LmOWwf2g3iL0R7GsEz5CFILUS9rZ1/5+ZBfDOS3
 heF22VcjWjqIuZDHfS9UuUrPI6PBg0RiqmKaRlc=
X-Google-Smtp-Source: ACHHUZ6vYd/72HrFnILIsPPxkV9WtXgdY0reZpTVE+28Qcv/gfC8YrS3WgW3xvAxoExi5idG0G+2nqlifIhKg3jLxd0=
X-Received: by 2002:a4a:5782:0:b0:557:cd4e:c116 with SMTP id
 u124-20020a4a5782000000b00557cd4ec116mr65019ooa.1.1685036351462; Thu, 25 May
 2023 10:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230517-topic-a7xx_prep-v2-0-5b9daa2b2cf0@linaro.org>
 <20230517-topic-a7xx_prep-v2-2-5b9daa2b2cf0@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v2-2-5b9daa2b2cf0@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 25 May 2023 10:38:59 -0700
Message-ID: <CAF6AEGsm=o-KgOtm01FSvMOB_uj6VOaONNu5FUr4phUixYNG3g@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] drm/msm/a6xx: Explain CP_PROTECT_CNTL writes in
 a6xx_set_cp_protect
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 19, 2023 at 6:29=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> We have the necessary information, so explain which bit does what.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 9fb214f150dd..deed42675fe2 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -771,9 +771,10 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>         }
>
>         /*
> -        * Enable access protection to privileged registers, fault on an =
access
> -        * protect violation and select the last span to protect from the=
 start
> -        * address all the way to the end of the register address space
> +        * BIT(0) - Enable access protection to privileged registers
> +        * BIT(1) - Enable fault on an access protect violation
> +        * BIT(3) - Select the last span to protect from the start
> +        *          address all the way to the end of the register addres=
s space

Even better would be to give these bitfields names in the xml, which
also gets you more meaningful decoding.  We've been better about not
open-coding a lot of stuff on the mesa side, but it is a bit easier
with header generation integrated into the build..  but less
open-coding on the kernel side is still a noble goal

BR,
-R

>          */
>         gpu_write(gpu, REG_A6XX_CP_PROTECT_CNTL, BIT(0) | BIT(1) | BIT(3)=
);
>
>
> --
> 2.40.1
>
