Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2990252C4A6
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 22:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB2D10E331;
	Wed, 18 May 2022 20:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD38610E2C1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 20:51:57 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-f18e6ff0f6so4266125fac.11
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 13:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=EkJ7c6TDFhhKRa+OTrT6l5LgL8a5FN7wmT5Y/mVgOBY=;
 b=Mz/2VNmF/Qm8XBKO6jjH1wqNziZBqj3x/FvlMJSGBhS8qVox7pMhMTd1dQTEc7+Ko4
 UC0w0+n72k87GmLubXCiTT29p5zwoYExdtWWSM1UBnvP/F7TG1YnWvF3Nejy5yHG7Yw2
 LA4Aqe/62+afm1veBCNg10hLbltcuXqnLE3Dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=EkJ7c6TDFhhKRa+OTrT6l5LgL8a5FN7wmT5Y/mVgOBY=;
 b=JnxeCia+mmtyWZ2p3M0okYTb7KorZvpsris1J5u2sQ0swE6hhxN3d/0ft6H19Hj4gB
 6acvrKNKMeCB/xk7+jmk0QjwIJpgcD/GYLhTCEZ//K0/5XJdQbYfzdWzENMowVlaGpeY
 /a5/sTQbQBjCBaapEmIIncHSEFitfMhS+jJDDAyAKRS1jkf7wtwfzkoMfcMbKPO0KUuN
 9iecBjSqzrC8yonJgjnqjH7Ly6g9tkRNk1I+o4i3MazoK6jWeydW6+cQLXJpBqDSfK/D
 NZE7omSWSNZbjEgSXUJ/Q+rcC3M2SbkDlpCeDlh8HdQPoVAhv2Gczk64KHdKpq1QdNRj
 a7mg==
X-Gm-Message-State: AOAM533XKJF20HopaARH+Zrm4GHtYOPxm85u8zSgkCvebNwHWPrm+Xa/
 r1pfdCKcbfrWsLhujNLPDymwgzbJ87Hfg3sqRGwSiQ==
X-Google-Smtp-Source: ABdhPJzgJw3GN2UAR/UMlvVpHQSaAwYbNIOCn2Obfjno00YjCblW9KW9QVE/gAlCwH22JwjiaD+tCtmZTlvXU0isFu0=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr739706oap.193.1652907116977; Wed, 18
 May 2022 13:51:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 May 2022 13:51:55 -0700
MIME-Version: 1.0
In-Reply-To: <1652905444-10130-2-git-send-email-quic_khsieh@quicinc.com>
References: <1652905444-10130-1-git-send-email-quic_khsieh@quicinc.com>
 <1652905444-10130-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 18 May 2022 13:51:55 -0700
Message-ID: <CAE-0n533Rf55ypeCY=A4dpxzdviUO3G9NFS41nceds6ZVFt-BQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] phy/qualcomm: add regulator_set_load to edp phy
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

Should subject be "phy: qcom:" prefix?

Quoting Kuogee Hsieh (2022-05-18 13:24:02)
> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
>
> Changes in v3:
> -- no regulator_set_load before disable regulator
> -- no supply name string change at probe
> -- split into two patches

These don't go here because this isn't a drm patch.

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index cacd32f..00b6726 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -635,6 +641,8 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>
>         edp->supplies[0].supply = "vdda-phy";
>         edp->supplies[1].supply = "vdda-pll";
> +       edp->enable_load[0] = 21800;    /* 1.2 V */
> +       edp->enable_load[1] = 36000;    /* 1.2 V */

What does the comment mean? This is the load for 1.2V supply? Can we
have that sort of comment instead of "1.2 V"?

>         ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(edp->supplies), edp->supplies);
>         if (ret)
