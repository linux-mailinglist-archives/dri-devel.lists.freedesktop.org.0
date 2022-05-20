Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A110052F4CF
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 23:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C72210EC7D;
	Fri, 20 May 2022 21:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F134110ECF2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 21:12:23 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 z5-20020a9d62c5000000b00606041d11f1so6322655otk.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 14:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=4ZcyIGcvDMZ0Wk1DSYhTSmlkdvT7fKKWDNVZgAqDgGs=;
 b=eaQmMn+s8uRwoapg8tdT+VIW36IHFmIaLDAaqPy1SY9nmnNRwYcHAUMMdYnfIhxJS0
 WshDX+JkE8GIL74lyEXI3yqi26ADb9QFljgwiKOGJMmas/u9kUsntbKtGzi2K8NGFiPm
 igQfJRlBr7mVQ0l7n/QR8CVQVCSAzlyw+6T6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=4ZcyIGcvDMZ0Wk1DSYhTSmlkdvT7fKKWDNVZgAqDgGs=;
 b=CQRXBso9REQV/gcl7m+a5w0WOb8P/vheuWirebuEDnFF0m1fltO9fWjZlJ6teIM0wg
 3pVOdHFpGd2BOLnK8En+2maNopl2qPOS5eQjLWxDOvK5DXmched9N7JSZOSjuGu/STdp
 qJsdi8tIZ2kZB7F4w55XOyPcAf87/jTX8bBzB5R4Vz0iIJ/cPhUa6scTdLb2Rg/DIW8H
 LvoncnpPNZMCRr4VoKeq9iXZ6IYjzotZtz5JbH7yjytRdfliu4DMGMVl8IYWMOSTzNCO
 r3hRcisgIsMS2i/AnrBxKgIka9g14T2giA10pUggQEpVwJVCEXMyFOTcTmMwbClwUFJs
 9POg==
X-Gm-Message-State: AOAM5316onbPti4EWa9/PMHQIW9IQ2oSa1J4Do0Rg6Q64JkT1S9ulctI
 Sjiu8eU0C2iOhu4p+fxkSiBMMWyFA+jAidsK46qELg==
X-Google-Smtp-Source: ABdhPJxk+2xo1hoJV75bGy29jmo3pmmEPymugHRbVngVyWNYYyVDr1T3jSaGlzrMC2H6l+67cPlv6Ov3vyOsySFzwTI=
X-Received: by 2002:a9d:63cd:0:b0:606:9e7f:79f8 with SMTP id
 e13-20020a9d63cd000000b006069e7f79f8mr4797333otl.77.1653081143110; Fri, 20
 May 2022 14:12:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 May 2022 14:12:22 -0700
MIME-Version: 1.0
In-Reply-To: <1653079257-20894-2-git-send-email-quic_khsieh@quicinc.com>
References: <1653079257-20894-1-git-send-email-quic_khsieh@quicinc.com>
 <1653079257-20894-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 20 May 2022 14:12:22 -0700
Message-ID: <CAE-0n50EUVwckogNT1ey-HP7QoMCPZPF9AyP+xw7J9o8MOk6YQ@mail.gmail.com>
Subject: Re: [PATCH v10 1/3] phy: qcom-edp: add regulator_set_load to edp phy
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

Quoting Kuogee Hsieh (2022-05-20 13:40:55)
> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index cacd32f..955466d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -639,6 +639,18 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
>
> +       ret = regulator_set_load(edp->supplies[0].consumer, 21800); /* 1.2 V vdda-phy */
> +       if (ret) {
> +               dev_err(dev, "failed to set load\n");

Which supply failed to set load?

> +               return ret;
> +       }
> +
> +       ret = regulator_set_load(edp->supplies[1].consumer, 36000); /* 0.9 V vdda-pll */
> +       if (ret) {
> +               dev_err(dev, "failed to set load\n");

This printk is the same as above. I hope this print never happens or it
will not be useful enough to narrow down the issue.

> +               return ret;
> +       }
