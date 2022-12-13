Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3449A64B853
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 16:24:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DD010E333;
	Tue, 13 Dec 2022 15:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5E010E333
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 15:23:56 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id fc4so37268427ejc.12
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 07:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YNJl4dW3INoFLSur18KGvAEZEys7Zg7HXl7mE/l9WMc=;
 b=cAdyHfnfTDl6Q1NGQlVuUwFnzVmOszYJerLagpzhCTJsBpIZzvJpbcry6wj/DZ8C9b
 T9PXTL/orC/c9TALqWuJtqWUmDhBkUsA8tOl3F3l7VFJ0DdeeepXJiUhgllK03T8m01h
 Vkjo0Sj5XyI7TYIDUEcxxq+unpUGpbk9fqbwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YNJl4dW3INoFLSur18KGvAEZEys7Zg7HXl7mE/l9WMc=;
 b=X/M6Vb3crXecWFg14C4GmwRKjUEXN6F45gcOoCfdCT2E+XK8rySK7+AA6m2ClvlVei
 N8fCSWB6XLCwG6kv9eY219t8gxYyzoJRH0ZH8MJnedaGjl7yHXbwHQwoY5+KQOy+kZ/u
 6mZtBzzBlOTjZRJkP8eSylrSwEJnluWoHC0ww8dHgtETqBmXbo7gRdwKOQaXZ/IneBJT
 V4L5quvdZ6KwmbW9wlt+Ed3YM7JZ2VTUTG03YrDXRxmQakQ3eaHC+ALiaQktOtaAJfec
 P1Ed5Bq+VGsFW4SHa93zHzyUOE2n5aaCR+1xRyABFHeTNvm+Ur1D2gj+Fa/oA8pKtVLa
 Ikxw==
X-Gm-Message-State: ANoB5plLLDLW4sxz/0rqNzy4keg+trGmlCPi+dDp2xKNdp7ZHkz2BTSn
 9xmGEv7tmWrJY42y57cKo9xOvumKaD/wrlgbCSo=
X-Google-Smtp-Source: AA0mqf4JHRxsdbhbon37gyupdc47JfbfczkzhnmiMkrACv7hjqGBVoSXAcMI/bkOBX4uhQgGPEsSyQ==
X-Received: by 2002:a17:906:dc4c:b0:7c1:28a7:f7a0 with SMTP id
 yz12-20020a170906dc4c00b007c128a7f7a0mr22809285ejb.31.1670945034085; 
 Tue, 13 Dec 2022 07:23:54 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 h4-20020a170906590400b00782fbb7f5f7sm4626685ejq.113.2022.12.13.07.23.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 07:23:53 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id bg10so8654824wmb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 07:23:53 -0800 (PST)
X-Received: by 2002:a7b:ce10:0:b0:3cf:5731:53db with SMTP id
 m16-20020a7bce10000000b003cf573153dbmr220771wmc.85.1670945032985; Tue, 13 Dec
 2022 07:23:52 -0800 (PST)
MIME-Version: 1.0
References: <20221213002423.259039-1-konrad.dybcio@linaro.org>
 <20221213002423.259039-5-konrad.dybcio@linaro.org>
In-Reply-To: <20221213002423.259039-5-konrad.dybcio@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Dec 2022 07:23:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U+prbiaQfWRcqp17oRgxFV=JvmweNFoK0+xYcnfoJr=A@mail.gmail.com>
Message-ID: <CAD=FV=U+prbiaQfWRcqp17oRgxFV=JvmweNFoK0+xYcnfoJr=A@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/msm/a6xx: Add support for A650 speed binning
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, agross@kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Dec 12, 2022 at 4:24 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Add support for matching QFPROM fuse values to get the correct speed bin
> on A650 (SM8250) GPUs.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 2c1630f0c04c..f139ec57c32d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1887,6 +1887,20 @@ static u32 a640_get_speed_bin(u32 fuse)
>         return UINT_MAX;
>  }
>
> +static u32 a650_get_speed_bin(u32 fuse)
> +{
> +       if (fuse == 0)
> +               return 0;
> +       else if (fuse == 1)
> +               return 1;
> +       else if (fuse == 2)
> +               return 2;
> +       else if (fuse == 3)
> +               return 3;
> +
> +       return UINT_MAX;

Unlike some of the other functions, you don't need any complexity. Just do:

if (fuse <= 3)
  return fuse;

return UINT_MAX;


I'd also suggest that perhaps "UINT_MAX" isn't exactly the right
return value for when we have an unrecognized fuse. The return type
for the function is "u32" which is a fixed size type. UINT_MAX,
however, is a type that is automatically sized by the compiler. Though
it's unlikely, theoretically a compiler could be configured such that
"unsigned int" was something other than 32 bits. Ideally either the
return type would be changed to "unsigned int" or you'd return
0xffffffff as the sentinel value.

-Doug
