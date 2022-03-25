Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3624E7A81
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 20:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828EB10E588;
	Fri, 25 Mar 2022 19:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F96010E518
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 19:51:07 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id t21so4403122oie.11
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 12:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=eUek1jmX1h1x8PcNcflTTCV7rdiqXP/FImxouF9eXrk=;
 b=MuYU2U53+0XditHV3+xMmufekP83Q86clHPRUFiYJI5c83MMgqsqZU6OE0iD7uqI1D
 bq5BpO0h+DDnBW2dzr+T0KLiCp0GgYfvXmXPzjeUTmIwglTcDMjx2JTa8I15roXjfJQr
 QDYKF7wfPMDa6WIjm4l4EenX4il5h6oLp4L78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=eUek1jmX1h1x8PcNcflTTCV7rdiqXP/FImxouF9eXrk=;
 b=5EsfWP6fFW8WXQvadI165ITo3mDj2OWhGnGpFEUmA0z3TDZh6UoXN7O55IGXU/x9GR
 bTNtVMgDkKs7B+wpejdX8LLByQHo3DffO9Cq/WtbXv7bs45vv7gpME8gj7WK44tbM8QR
 cTKcNyZEOuHFV9uk5x51PQSr0UUfcEE7XQuKRLuW1ROqnSsLwED1gqydNiCS5+o4qc4I
 OdSP9YilNjgxCU/4BoinNEU88lb9/9Y1tbNd2CroV3KDRGj5ppTP/izj+BAIBfAd/5FJ
 lVdvPmH2A1iwF57OgOZAG3Vi972mR4k+m7gOParqn5ZM62RcwV5keP24teaMjux+9YLd
 WrrQ==
X-Gm-Message-State: AOAM532T6Uy6e12ndKcAQguqJsLpzhZj5a7LwgsqXdprTSMLtWopKZlv
 hlywUIaqJWUz9RgA3inSsDp45dbMvOfQBTLQieD/cg==
X-Google-Smtp-Source: ABdhPJxjJgDkwaOL+igFbYKoHRlPcGxtCqcdt2HqSpDefQv8NNUO1BG5eOIgAhxWNNRmCDuEqZtRbL5DhxFUglZ6hXs=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr5910648oie.193.1648237866373; Fri, 25
 Mar 2022 12:51:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Mar 2022 14:51:05 -0500
MIME-Version: 1.0
In-Reply-To: <MW4PR02MB718635E7712D44094E6E91F3E11A9@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-3-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n52Uzo47N5QzoKOwny3XTrArA4nM-KPqAVxAPewSAyNOWw@mail.gmail.com>
 <MW4PR02MB718635E7712D44094E6E91F3E11A9@MW4PR02MB7186.namprd02.prod.outlook.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 25 Mar 2022 14:51:05 -0500
Message-ID: <CAE-0n500xV_SA_-KQ4Sh-8PV=rfaXxrMBAh5tnVpjCMD+VEyqg@mail.gmail.com>
Subject: RE: [PATCH v5 2/9] arm64: dts: qcom: sc7280: Add support for eDP
 panel on CRD
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "sam@ravnborg.org" <sam@ravnborg.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 "agross@kernel.org" <agross@kernel.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "sean@poorly.run" <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (QUIC) (2022-03-25 06:30:58)
>
>
> > > +       vdda-1p2-supply = <&vreg_l6b_1p2>;
> > > +       vdda-0p9-supply = <&vreg_l10c_0p8>;
> > > +
> > > +       aux-bus {
> >
> > Can this move to sc7280.dtsi and get a phandle?
> >
>
> Okay, I will move this to sc7280.dtsi like below.
> Shall I define the required properties under &mdss_edp_panel node in the sc7280-crd3.dts?

The below patch looks good.

>
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3283,6 +3283,18 @@
>
>                                 status = "disabled";
