Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 721EB52E016
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 00:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E281710F289;
	Thu, 19 May 2022 22:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D357B11A4FA
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 22:48:56 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-e5e433d66dso8493331fac.5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 15:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=gPmJM59HilOSZAiNocBUyn1VGxu9PFrDrw8E4Yeqrfk=;
 b=Ivbz2PDWtVwyLf0aE9K3mPrsVLOK80ClXfeDGxNsqdlxmI6lf/HqV7VfS+K1pFR238
 KfAvg7i6sxEPBmB782C8Q6xIoiiz4VrGwKI6qxj4FpHIfeHM7VsU0oaEHwdpWxktouqK
 31WAtWkdHxSG3SjDgz+OusBnk+tjWjtiPafIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=gPmJM59HilOSZAiNocBUyn1VGxu9PFrDrw8E4Yeqrfk=;
 b=lFVkUJB1qTeYUvuMooCXm3FFEubCYgHn4xeYIm+2Y2i37l3G/iYT+X+3H+nOMDGdeX
 0yaCP8O1vysRo5XzBT2nQuv1se4Qqf1g87eloPdr4mvKZOILN64a/Is5/7Spba53Oe2l
 fXAZe16f8Al8qh/tPlZXnq25GtTjgJdJLKm73G6domq1jx+PUs6JG4NMvisMwH6VFV9O
 T4/NMk+CxxKmutWjTX0Jnj/kgCNIKzk2Wi6XmVZtGE7hzNsog+aPcdv7z0JthMR9tLm9
 4Okut16yZ9ST2Tkv5G1e03nbO3z+fAtVz/VRSqgbsvBJLI7pQMCpwvGUnuiOk3rdJ4js
 EVLQ==
X-Gm-Message-State: AOAM530X4IlrSlNMSnnooEl5nyvJnfX4HiHqzB4g4IRU+CWu42qMuYwd
 w4bxUx4wuUFpEGYxClnz2zw9XkI27Pe2aZZvsdl7LQ==
X-Google-Smtp-Source: ABdhPJw5ddHxY0cfryu3hgg4S9UcGUCH59iSaeUGGcNe4rzoKsPmMGWR455MyyYyru3KXBJ68SY9LKIemGUmA3oUAE4=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr3801393oap.193.1653000536016; Thu, 19
 May 2022 15:48:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 May 2022 15:48:55 -0700
MIME-Version: 1.0
In-Reply-To: <1652982339-18190-3-git-send-email-quic_khsieh@quicinc.com>
References: <1652982339-18190-1-git-send-email-quic_khsieh@quicinc.com>
 <1652982339-18190-3-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 19 May 2022 15:48:55 -0700
Message-ID: <CAE-0n52ugbZfhP7BTYoo9yt1CMsKTW5uW74GdBNx14cRzj39gA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] phy: qcom-qmp: add regulator_set_load to dp phy
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-05-19 10:45:38)
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index b144ae1..24f39ee 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -5008,6 +5019,11 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
>                 return 0;
>         }
>
> +       if (cfg->vreg_enable_load) {
> +               for (i = 0; i <= cfg->num_vregs; i++)

Just less than (<) cfg->num_vregs, not less than or equal to (<=)

> +                       regulator_set_load(qmp->vregs[i].consumer, cfg->vreg_enable_load[i]);
> +       }
>
