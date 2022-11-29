Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F9D63BF3D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 12:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF0A10E3BD;
	Tue, 29 Nov 2022 11:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23AE310E3BD
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 11:41:00 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id e205so14818767oif.11
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 03:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wRBJVGXEEydPy15o9BfUymcFFCTYtN6bX+VkTxDz6DA=;
 b=ZtzSaQbySs/pAjxZTutitahbTVDtd/jS038Oi6XjEvEzQgHt48K6+yaAuf83eyBXxJ
 LiOy8xw9VP/8fDPR4qRstuKfwi+pYrwkH1SMocqhVNH6UFJgs54SyzyUGd4KkkF691XF
 zzljPnXM2pJqiTxr6mhupGPx6BLogN2E1c35N4YIb22PkPDg6/3xdwQnl1JCH9poAB8d
 ZwiXK60rX2aMNFQbQc4IyjTcGjqnSbeUuuB4etFh0EkDBI5C7DtHplo1n2lgMR0KbXmT
 1V20M8WfCSB2pVHt3JDvTgv6LavkNPIycIeIu/+8wqw/5lNHl3UpO4PhR2IdSiIyWkYR
 54ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wRBJVGXEEydPy15o9BfUymcFFCTYtN6bX+VkTxDz6DA=;
 b=OV4Qw9CtTnvX5GEwnmmFD4+ob3T/G66QDOyI9xba+hW7qmdJ3p8eiMSg7Nw8qDqa5a
 7EVk0qLBzi5pI9QTA8ucvkAozE3bmn62U4m4aKD0Xvb83O6s0aGVmwqK8RBRply5CZyY
 CxRETQFkT3DuoERKhTXGmxoTZZWjsyTI9VApFSM/dXqGF/MXeP7yyZue6MV4hyIgj1WI
 rzm2EdCxX8ofx3kKO2v3P7TmXf+ovKqa+H5OFZM6jjJP/zPd0cvwINxp7CUo1EjO9amV
 y4SNhHikh/JF5JUHE02eJixf5tGaKpySiZWvShgj3lMlvqZLwx8TFjbLJYQvzoE/NozE
 HkBw==
X-Gm-Message-State: ANoB5pnkpjtZLPoIC6fbSjgT4KAd8fBdooshKeN5E2baFGZqawfbJDi7
 N2wx2CmXFqCwAedx4GKMlJz3mIKMK5NmSAsGF0tLRQ==
X-Google-Smtp-Source: AA0mqf6cqugvAspHK6FlIB5f+xXbkfgkMm7ZkSjFBfy0VNWdRbl5zp+JxkqN8gTblWm5oqpPBTrQCLq3ApK/fVjF0kQ=
X-Received: by 2002:aca:5bc4:0:b0:35a:7056:4f9c with SMTP id
 p187-20020aca5bc4000000b0035a70564f9cmr30907203oib.72.1669722059192; Tue, 29
 Nov 2022 03:40:59 -0800 (PST)
MIME-Version: 1.0
References: <20221115133105.980877-1-robert.foss@linaro.org>
 <20221115133105.980877-7-robert.foss@linaro.org>
 <fed78af8-015b-e57d-76c7-68c8ba317952@linaro.org>
In-Reply-To: <fed78af8-015b-e57d-76c7-68c8ba317952@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 29 Nov 2022 12:40:48 +0100
Message-ID: <CAG3jFysNPr70duSwmagS-d2Fs=61iSVgcCMVKuLAKiUtsUZMfA@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] drm/msm: Add support for SM8350
To: Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 angelogioacchino.delregno@somainline.org, quic_vpolimer@quicinc.com,
 vinod.koul@linaro.org, Jonathan Marek <jonathan@marek.ca>,
 quic_khsieh@quicinc.com, agross@kernel.org, quic_jesszhan@quicinc.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, robh+dt@kernel.org,
 sean@poorly.run, quic_kalyant@quicinc.com, loic.poulain@linaro.org,
 andersson@kernel.org, dianders@chromium.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Nov 2022 at 14:42, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 15/11/2022 14:30, Robert Foss wrote:
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
> Shouldn't the second-last argument be 2 or 3 depending on DDR type?

Dmitry, can I get your input on this? I'm a little bit unsure of which
dts properties some of these
values are derived from.

>
> Konrad
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
