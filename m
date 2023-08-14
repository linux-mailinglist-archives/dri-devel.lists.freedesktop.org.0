Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6AE77C1E4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 22:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC49810E101;
	Mon, 14 Aug 2023 20:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC20010E101;
 Mon, 14 Aug 2023 20:59:21 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5234f2c6c1dso6500941a12.1; 
 Mon, 14 Aug 2023 13:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692046760; x=1692651560;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N1mAIR32hNZWrf1+R+AprBLrBz5L9RjZMLxPc7Z5zHs=;
 b=ORPQUcuDHZ9ButxoKtIk5eEB/aKakq6X2T2Z2x9vr+6O0veDl2O5AS9xcAfughT2lY
 WJ1SLrvOqZJuizFTMut7yMIw93MtRV/tTSIkPACTHytZInxKlzLhNjTkoUX7pdk8doeV
 k1rdaOzI4uq5WFMve14NN4jDwAGTXAOIomt4Y3ZptIr9WvfTZ8ojO9iFgZ4b6RFzlIPk
 quMqsV5+k6Bzo9EJJoP5iKINnQtBqbWYs+gp9m+NK86Ajj9w0bMCG11NajUGCaNsEADU
 WeflfM5HcC5KyNBo7pffdWVbnjuMw+wiyO9wT8VD0Bv/aKplyEFoIPLkTjUkzL3whJDy
 rkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692046760; x=1692651560;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N1mAIR32hNZWrf1+R+AprBLrBz5L9RjZMLxPc7Z5zHs=;
 b=Lkt2poCjcB6wFd7shEK3scQAlu78wt8zZDD+TZMO7NQTiUbAqFIicHdmbF/A2Zm0wQ
 hj3UasxvNG4fG0Sn+M824WYA56/ckqQ9xcoTEH4RhKLmwQsNJMB/vmfaeSL0DIcB9yWQ
 +yk5GlWWfQphRJ4Y4UUo96qNbbmg3AGcdRnKQPK2eSywOzcfS3DBrUSkzpHh6UemtQue
 Ga7B8fKRdJDDvyBxW1ssJ/YrZRR0qCm6lWhAa18ODtIgU5ExZYptJP8gnwZvLCaO8E28
 BMBXMQN2k6CL5FrUQWiYAVb6aR3ebFaXWS5UWACChRWyzZncLJc95DGntcYr1kSeUw/Q
 bBdQ==
X-Gm-Message-State: AOJu0Yy6mPr00zM6iYxX7keS0e8eVntaPWlo2Ez7CQwBwlTnxZXJAphg
 NexD3GDfWdpnLgGmhgad1Is9Z44Q123Dwb4wNqY=
X-Google-Smtp-Source: AGHT+IGnaMFQ8n9yvntKC+C+AAM0KQGIRcN7cA5qijB3IvqT7ZXVWCwk1VGgT2CWDi3iKfKEZWAhMNzr0926xZ1dSi8=
X-Received: by 2002:a05:6402:1245:b0:525:5ed2:abed with SMTP id
 l5-20020a056402124500b005255ed2abedmr3774395edw.30.1692046760052; Mon, 14 Aug
 2023 13:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
 <20230628-topic-a7xx_drmmsm-v2-8-1439e1b2343f@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v2-8-1439e1b2343f@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 14 Aug 2023 13:59:07 -0700
Message-ID: <CAF6AEGvFHDv47DMeLTVjp5wepuvCpQrNu7a_ijifhUUcsT30tg@mail.gmail.com>
Subject: Re: [PATCH v2 08/14] drm/msm/a6xx: Add skeleton A7xx support
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 8, 2023 at 2:03=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro.=
org> wrote:
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index 49f38edf9854..3e69ef9dde3f 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -46,6 +46,7 @@ enum adreno_family {
>         ADRENO_6XX_GEN2,  /* a640 family */
>         ADRENO_6XX_GEN3,  /* a650 family */
>         ADRENO_6XX_GEN4,  /* a660 family */
> +       ADRENO_7XX_GEN1,  /* a730 family */
>  };
>
>  #define ADRENO_QUIRK_TWO_PASS_USE_WFI          BIT(0)
> @@ -401,6 +402,17 @@ static inline int adreno_is_a640_family(const struct=
 adreno_gpu *gpu)
>         return gpu->info->family =3D=3D ADRENO_6XX_GEN2;
>  }
>
> +static inline int adreno_is_a730(struct adreno_gpu *gpu)
> +{
> +       return gpu->info->chip_ids[0] =3D=3D 0x07030001;
> +}
> +
> +static inline int adreno_is_a7xx(struct adreno_gpu *gpu)
> +{
> +       /* Update with non-fake (i.e. non-A702) Gen 7 GPUs */
> +       return adreno_is_a730(gpu);

just use the family enum here.. that lets you move the
adreno_is_a730() helper into the patch that actually adds a730

BR,
-R

> +}
> +
