Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC11F52E01D
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 00:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA2B10E248;
	Thu, 19 May 2022 22:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E59410E378
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 22:50:23 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id n24so8106299oie.12
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 15:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=deoE4Qm8qsxnbdmXPjW300PaU2ET31mJnZqz2L/cn4M=;
 b=aRgwz/HUss1HuOFpQCIKu/P8t9sN5XH9pnTf2BwXDw+HqKFu/SgOVgmkCmCmdiqkFS
 FtrWmnzUbmqrVIrtquJ2Zw3E1bLnuQp7U4PSC9gUwsyB2958DE/oDCoVursXsRP/I8aJ
 v+gK1ozci++VDzcs1hsANHv4Tcx6yjPjfZVJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=deoE4Qm8qsxnbdmXPjW300PaU2ET31mJnZqz2L/cn4M=;
 b=meLEpfySGLyNpWTcUoXB3SpDdaty67ad3YOW0rKttWUutdWpT8TCFY0IK8BkR1sqdv
 V/2Q9K7FT1JCiOyLVX/BFHf4ocl34p9zcTqxFtC1BftwiEsr7iL1jJ0qQc4B6rOfLgg4
 31qee1uEJ/YADS6NXDh9zeX35ZuUXFQjNQ3KyEz92FCXdNsSO74AO7UnZsURGPAuXXjW
 O08TdpIWtdRein3Histym9lIJXC33ZmgmjuOFozVPSC5delUJpyaQ5y3F6/tkk95H21w
 oNQv64Y/ZY8wLPXzkY6BC1y05icDO/5Ggr4cFYrM65uxIHESU2QmWmpLhIXV24BfTbwW
 sdqQ==
X-Gm-Message-State: AOAM533gGjKpjg3W4k4rMksKvkP+hHGnIXQIfy60mvhhPVA5ZZY1hA0X
 x0/B/AO2CPYYDCQmQEzoDS5g9/hdEcb0tFycV/ILyQ==
X-Google-Smtp-Source: ABdhPJxveqssC09W6euurj9Q0qnAOSawljamJowys0OFddGMQRpM4VOMvK2OjEDDVKeek9Bs6FrxRRgNoQ6rQQ622pg=
X-Received: by 2002:a05:6808:14c2:b0:326:c129:d308 with SMTP id
 f2-20020a05680814c200b00326c129d308mr3615754oiw.193.1653000622517; Thu, 19
 May 2022 15:50:22 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 May 2022 15:50:22 -0700
MIME-Version: 1.0
In-Reply-To: <1652982339-18190-2-git-send-email-quic_khsieh@quicinc.com>
References: <1652982339-18190-1-git-send-email-quic_khsieh@quicinc.com>
 <1652982339-18190-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 19 May 2022 15:50:22 -0700
Message-ID: <CAE-0n53EbwhC9G5tbLutGb3+8EfmYj45n7DHwjpP0C=b_DuFUg@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] phy: qcom-edp: add regulator_set_load to edp phy
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

Quoting Kuogee Hsieh (2022-05-19 10:45:37)
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index cacd32f..90093cd 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -87,14 +87,19 @@ struct qcom_edp {
>
>         struct clk_bulk_data clks[2];
>         struct regulator_bulk_data supplies[2];
> +       int enable_load[2];
>  };
>
>  static int qcom_edp_phy_init(struct phy *phy)
>  {
>         struct qcom_edp *edp = phy_get_drvdata(phy);
>         int ret;
> +       int i;
>
> -       ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> +       for (i = 0; i < 2; i++)
> +               regulator_set_load(edp->supplies[i].consumer, edp->enable_load[i]);
> +
> +       ret = regulator_bulk_enable(num_consumers, edp->supplies);

Where is num_consumers coming from?

>         if (ret)
>                 return ret;
>
