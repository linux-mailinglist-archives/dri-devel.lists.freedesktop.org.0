Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B8B6A0C2A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 15:48:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F98310EB9C;
	Thu, 23 Feb 2023 14:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B13710EB9C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 14:48:48 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-536af432ee5so198984517b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 06:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4pa8WhVoMTas4nD3mKBiwC/IIvOKuMqZMgApILYBrlg=;
 b=sq2yEKIzAfYxhUjTGZscUcBKjbRg/XDm6/OwDMuFPcEmkYSC5SZuAHJTff953rBxec
 LXLsNugN1pCBzThSfJuKLff6xwek+18mho5HTV7Faj9nXCmrf6il/5KmHnZsEES5UNBt
 eTmKrtOonZITSNMLxOnPamdZEaODB4Xww/33QpFmi0aWhtDuS7c1gn6NQd3laKkB6FGe
 rM8cIi09jTeip4eoTTIIOa/qTQO10Q2eNX6IY7E1S4Lff6byWPaH/8qwSu7FCUE6kj2a
 hy4hlom66L8I40nNa9KzkVoJDtSzNybkpPR3SQ+ncXT6v3HMCM4M0JA8RWfKX9cRHBHp
 BtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4pa8WhVoMTas4nD3mKBiwC/IIvOKuMqZMgApILYBrlg=;
 b=zJgcbDUsO34ITheVGYkoPulTPoMRrxY+cfX9evEVKCIAk/liBpurtadRXmXkwkl2z0
 WU7ZsrVx6vM/zzIQV9IZeoapn27CHxHvP4nsrnfVaLkBv+toA9jezQoY9cUlD0bNk9+2
 Gvrh/GZvxTGG2D4DSQEn26RnmHceRSg/kgqIUouxWLxM3QUEzPTQHzaR4wlbCM8AZV0E
 chalRinkSFZCevOtC50YIafa/FjxoRwfIQ1vrE1M95Nz+hW+U4+5QIlTa/C1AWajvcfJ
 soinU6WNuNy9hF6e3yphfbmyLcYIbUe6qK9QI2ywP25s5oJLCVmzRrIVCBlQmTUV1CEq
 qn/w==
X-Gm-Message-State: AO0yUKVlOgWBA+AMneofazMdeL5hSWel2uA+0kucrPq/+xBDtqRExGth
 x1k2MvusoIz8EL4Qp+He6dEFEBd0tXsSte2r4+2kFg==
X-Google-Smtp-Source: AK7set9VUZNRZCaLDXrLLy8mHGx5HocaLmAlWGX8los92wGIp1ZTneOSgYrN2Af2BE5NJykwArXcAFeSMswQ6RhmvHI=
X-Received: by 2002:a25:9bc2:0:b0:9fe:195a:ce0d with SMTP id
 w2-20020a259bc2000000b009fe195ace0dmr1724279ybo.10.1677163727331; Thu, 23 Feb
 2023 06:48:47 -0800 (PST)
MIME-Version: 1.0
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
 <20230223-topic-gmuwrapper-v3-10-5be55a336819@linaro.org>
 <CAA8EJppi45K0hQ=1fZvf+Mps+4uEkXmLFeqdmyk-yk31CNvUsw@mail.gmail.com>
 <761e0aba-9364-557a-e6e5-e21494597dbc@linaro.org>
In-Reply-To: <761e0aba-9364-557a-e6e5-e21494597dbc@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 Feb 2023 16:48:36 +0200
Message-ID: <CAA8EJppvmojWnvwB1aKJ1M7CcoFHk9BLFR0U7CQGR9GexQckdw@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] drm/msm/a6xx: Fix A680 highest bank bit value
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Feb 2023 at 15:49, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 23.02.2023 14:06, Dmitry Baryshkov wrote:
> > On Thu, 23 Feb 2023 at 14:07, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >>
> >> According to the vendor sources, it's equal to 16, which makes hbb_lo
> >> equal to 3.
> >
> > I think we might be stricken with the ddr kind difference here, but I
> > would not bet on it.
> It totally is, but it also seems to be SoC-dependent..
> I think all 8180x devices shipped with LPDDR4X FWIW

I think so too. However sdmshrike dts uses LPDDR5.

>
> Konrad
> >
> >>
> >> Fixes: 840d10b64dad ("drm: msm: Add 680 gpu to the adreno gpu list")
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 +++++++-
> >>  1 file changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> index b5017c56fa1b..2c4afecdd213 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -885,12 +885,18 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
> >>                 hbb_lo = 2;
> >>         }
> >>
> >> -       if (adreno_is_a640_family(adreno_gpu)) {
> >> +       if (adreno_is_a640(adreno_gpu)) {
> >>                 amsbc = 1;
> >>                 /* HBB = 15 */
> >>                 hbb_lo = 2;
> >>         }
> >>
> >> +       if (adreno_is_a680(adreno_gpu)) {
> >> +               amsbc = 1;
> >> +               /* HBB = 16 */
> >> +               hbb_lo = 3;
> >> +       }
> >> +
> >>         if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
> >>                 amsbc = 1;
> >>                 /* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
> >>
> >> --
> >> 2.39.2
> >>
> >
> >



-- 
With best wishes
Dmitry
