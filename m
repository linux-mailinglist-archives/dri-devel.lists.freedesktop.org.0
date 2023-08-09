Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F07776C0F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 00:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C88D10E12D;
	Wed,  9 Aug 2023 22:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969DB10E009;
 Wed,  9 Aug 2023 22:15:30 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-31792ac0fefso303746f8f.2; 
 Wed, 09 Aug 2023 15:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691619329; x=1692224129;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m+iJ6yF+JifkMrPOYhZUvJyGxXgs7A1jvN2VjyrqrnI=;
 b=AEnMxHFAjFr+t+Fv4gp5f6SaAAZn/zjl2EQxRQx4dG/wsepAOjR4pLmy9jhCnY/Vib
 holfLQ4faoacjF3oUZ6yS4bgXfLU/W5gbvbChvkHkZ4O5MgiBd9ESj+bttV+W3S+BVCp
 JH1kG73KIwWSZUaB9r5zXDlQT25w9zVlcz5La+VsX1V1t2fZRmtQHUnQnVdEJj9NYPJf
 mXmMxylE3H29YihR2Ja7xSkhE0V9E26CmhkvLBb33e8nyh05uUDK8xzrJZOUnmZw2FIk
 LkchJ9QHDF/gvTurw2NzZzgqKw/g320k9D/mc4HyndAYcfRHnbLGQtiRDLMIpEPvf3hW
 074A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691619329; x=1692224129;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m+iJ6yF+JifkMrPOYhZUvJyGxXgs7A1jvN2VjyrqrnI=;
 b=TRfd5agLp/34Xy1q54j0zbkWMDrOB/yP9IfMEa/Lj74UAJtrGhx4At7gSRvgk6To5A
 0ZsduWTGG5fFxHvlOF/A1JePbmOO2tsykaFi8DlXwruTQX50myo2KcgT7H2zGqpOOcav
 PJ9cd0bn/sGYkRAJCIlyaPApV67m+890dRVRVpR7giaX5zOik2BWIkUXTMhRVMPQcFAi
 +XQUqBPvXmlFivx+WeGN8q9XxwjWHr4sov3FSYe2CpcRc8Tt9QxbEFxUkQMSIvkFjdXe
 523ve7gckqybOb+GgLRqdaTGPAh950ujgtyw2x0+nvi1Hu3YRaQJlsX1qGkcTBVlnr7D
 BVKA==
X-Gm-Message-State: AOJu0YzogDGqMznd4tn3c8oOQYQX6WDn6yT8paqmx3ZzyR26Gz0ON0a2
 4urCrChr8Vv3/QUGvsBZd+tlGxVIJNupo+GEDfY=
X-Google-Smtp-Source: AGHT+IHV1xs1dkP+pOGfhd0RGUDfPYeFzLZpaU1m6hjicg46DC1woF+aE7CJjryFD6qT/kAeqsR5O9L8D1t5J2nM8P0=
X-Received: by 2002:a5d:594a:0:b0:314:4915:689 with SMTP id
 e10-20020a5d594a000000b0031449150689mr450261wri.34.1691619328716; Wed, 09 Aug
 2023 15:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
 <20230628-topic-a7xx_drmmsm-v2-13-1439e1b2343f@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v2-13-1439e1b2343f@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 9 Aug 2023 15:15:17 -0700
Message-ID: <CAF6AEGsJ1WyLttZcvkgJjxsHHxX-uyz6+yb4=xizqakeZrSdTQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] drm/msm/a6xx: Vastly increase HFI timeout
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
> A7xx GMUs can be slow as molasses at times.
> Increase the timeout to 1 second to match the vendor driver.
>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/=
adreno/a6xx_hfi.c
> index cdb3f6e74d3e..e25ddb82a087 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -108,7 +108,7 @@ static int a6xx_hfi_wait_for_ack(struct a6xx_gmu *gmu=
, u32 id, u32 seqnum,
>
>         /* Wait for a response */
>         ret =3D gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, va=
l,
> -               val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 5000);
> +               val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 1000000);

yikes.. so our default autosuspend delay is 66ms.. and we hit this
path in the resume path (ie. if you click something after things have
been sitting idle for >66ms).. you really don't want something in that
critical path to take 1sec

BR,
-R

>
>         if (ret) {
>                 DRM_DEV_ERROR(gmu->dev,
>
> --
> 2.41.0
>
