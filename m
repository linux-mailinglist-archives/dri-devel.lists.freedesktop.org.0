Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8F0651027
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 17:19:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D3E10E2B4;
	Mon, 19 Dec 2022 16:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A5710E2D9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 16:19:09 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id r130so8258152oih.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 08:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FzfwFyE+sSo7ANEauBVW9ZLP3F3r13UfuJs8RcyCrw8=;
 b=NhV5Tw8ZgsfyFjwkPlchKtqK1L2895WBh+U3hylBRokB378KBrak4q5ikdIN1YCHb8
 gE6xYOOI+AwuoBssFtnr1hYKA7N6nJ5+rKlsbOyi7yZndY4ts91E0gEMpiikil7MdjaO
 WvFRhuAaOVjZKma2c/ElhriNgPTK/j05nUguqrNpsacCSQK/wo6g08O+fKTgdrXo3YMc
 eAUpG41yfCHljt2CVqn7m1znKJU57Em/dMeRhApo+O8Q3SGOPwMtcVFH0pk4uy4CurEz
 qMyFTMRq8PHYUIalhIGoR9aYTmvrODCi5d1toApLLUH35MZJgW086Z8BO1WIzFzdAv9u
 z4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FzfwFyE+sSo7ANEauBVW9ZLP3F3r13UfuJs8RcyCrw8=;
 b=5inQxZsdvI5KseirSnf++FdPYHFG+Opr7Gkyw3BwVVnvJmk/KC61fA+Uko9qHgWZt8
 nQJ2CaZJS3eayQiC9Qzm3ajEQWMqbTkhouXJcGjqYOsfCUPUrWbcoD8nw42dSES3j1ac
 vf/wXYp5Y4qxGxoB9WiBGxcW8SgNU3G9+hUV6tDjB9e83X0xldbCIBzbRHbNdWIP3j16
 z1YifuVwclGgdlgFj3iy/0U+dC6hKcxSenvVTcxylJsnblHH4E1AM3AGmdoqV4BY1RBv
 sdhs4ySwAQjeSUcCcHDM9zuO2Yk6V1GcDfcNQiW0F758YBWlV9uvQ9RzniFtuL9BGnmQ
 4TjA==
X-Gm-Message-State: ANoB5pmDWsbrLaE02CBZ12j6Fudfpzmv6g0Im8g6wwJmE5cmePhfpcbH
 uVL01i3KMeI3w3MIljZaoBP04lqhLmVMK1gjHLovHw==
X-Google-Smtp-Source: AA0mqf7on98KXtfG6FXd1XYA9zHC5OaIHzJz81TJPiavIoA4qtg8I+HyZWzvci+P6yoDgTZYZpTHsplgpSVeBuN966o=
X-Received: by 2002:aca:1c07:0:b0:359:ef86:2f4f with SMTP id
 c7-20020aca1c07000000b00359ef862f4fmr1017340oic.14.1671466748381; Mon, 19 Dec
 2022 08:19:08 -0800 (PST)
MIME-Version: 1.0
References: <20221205163754.221139-1-robert.foss@linaro.org>
 <20221205163754.221139-6-robert.foss@linaro.org>
 <feda0561-1291-daa7-ea01-db5729a1a415@linaro.org>
In-Reply-To: <feda0561-1291-daa7-ea01-db5729a1a415@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 19 Dec 2022 17:18:57 +0100
Message-ID: <CAG3jFyuku05O_7oQhYCeOKmkZzEipASyJX0yBcJAHxP8HGOtaQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] drm/msm: Add support for SM8350
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: airlied@linux.ie, konrad.dybcio@somainline.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@somainline.org,
 vinod.koul@linaro.org, Jonathan Marek <jonathan@marek.ca>,
 quic_vpolimer@quicinc.com, agross@kernel.org, quic_jesszhan@quicinc.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, robh+dt@kernel.org,
 sean@poorly.run, quic_kalyant@quicinc.com, loic.poulain@linaro.org,
 andersson@kernel.org, dianders@chromium.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 8 Dec 2022 at 00:50, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 05/12/2022 18:37, Robert Foss wrote:
> > Add compatibles string, "qcom,sm8350-mdss", for the multimedia display
> > subsystem unit used on Qualcomm SM8350 platform.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/msm_mdss.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index a2264fb517a1..39746b972cdd 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -293,6 +293,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
> >               /* UBWC_2_0 */
> >               msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
> >               break;
> > +     case DPU_HW_VER_700:
> > +             msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 1, 1);
> > +             break;
>
> Judging from the vendor kernel, the highest_rank_bit is 3, with usual
> todo for 2 for LP_DDR4.

Thanks! Will fix.

>
> >       case DPU_HW_VER_720:
> >               msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
> >               break;
> > @@ -530,6 +533,7 @@ static const struct of_device_id mdss_dt_match[] = {
> >       { .compatible = "qcom,sc8180x-mdss" },
> >       { .compatible = "qcom,sm8150-mdss" },
> >       { .compatible = "qcom,sm8250-mdss" },
> > +     { .compatible = "qcom,sm8350-mdss" },
> >       { .compatible = "qcom,sm8450-mdss" },
> >       {}
> >   };
>
> --
> With best wishes
> Dmitry
>
