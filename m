Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6BE52E111
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 02:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993EE10E300;
	Fri, 20 May 2022 00:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB37010E300
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 00:19:36 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 p12-20020a9d4e0c000000b00606b40860a3so4578235otf.11
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 17:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=irN92Flw/oZRU+x5GvQi4pA44xQS8ZN3dr1edb8S6XU=;
 b=HGmiyVOkhBJDmzZbHsBdDQPMTdh7tlbynY1O+Qm52VOxPAropp+cPDETfpDtPt48DU
 RODqSYH756xQHht++4zfJUAYHURG5zrONEB57fC7jMMRVH1lzKqL+ZLe78X8Q/kitsqq
 03/FqjDCO9oFUM9RdDZ5MiVcmYH08mkXqcoac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=irN92Flw/oZRU+x5GvQi4pA44xQS8ZN3dr1edb8S6XU=;
 b=ipeqP1X7nTeRF9Esgde184enJOQXeAfZELlIrROQjLkY/EmyJ9H/Vlhd7KNr0EEscz
 iIxIc46pXs1TgIuIfxv5gbcQPduD2O4VIKHjs5Z4x/GZz7NK+7Vd6DKgkIhcLH4T0Vl2
 xc/xFcnVV4qzHFdkMnUZRhKdJ95jqskUD7M6FHONIiZL4UON6bFIpTHpxnwrSw7XhaZ9
 viesSstZoUfCUoMAst9G0M7AnmkVO85rANVDPVjJgiRblYMLM0B12jL0vZfQfIgaQ8JR
 UkhrJ/oT5lIZjdXCZXA//agF52YpVMje40zQu6Dr6S3qe1A56PIPfseB98OBWl0M/Pli
 f+pQ==
X-Gm-Message-State: AOAM531ObXl8N2cCKXScZFoUQc8TYZ2Idrk4F1l2pGFXif6/IWiIzPV1
 yFsgEzu5NWEOYo6YhAsNh8/NMXgkjGCs2jAkGwgWGA==
X-Google-Smtp-Source: ABdhPJym/G8+304YgHxkp02EOBkIdEUGSXWtylPSqsACNEbDFVSAvLIxO87X9cqUpNTs6/nLv8CeLcHqq7+/vchVze4=
X-Received: by 2002:a9d:63cd:0:b0:606:9e7f:79f8 with SMTP id
 e13-20020a9d63cd000000b006069e7f79f8mr2963568otl.77.1653005975978; Thu, 19
 May 2022 17:19:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 May 2022 17:19:35 -0700
MIME-Version: 1.0
In-Reply-To: <1653001902-26910-2-git-send-email-quic_khsieh@quicinc.com>
References: <1653001902-26910-1-git-send-email-quic_khsieh@quicinc.com>
 <1653001902-26910-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 19 May 2022 17:19:35 -0700
Message-ID: <CAE-0n52yT6S4TLpc2e2-kkbMB2Fu2PcZskG-ZFLo7y1YVTyazQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] phy: qcom-edp: add regulator_set_load to edp phy
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

Quoting Kuogee Hsieh (2022-05-19 16:11:40)
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index cacd32f..78b7306 100644
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

Use ARRAY_SIZE(edp->supplies)?

> +               regulator_set_load(edp->supplies[i].consumer, edp->enable_load[i]);
> +
> +       ret = regulator_bulk_enable(2, edp->supplies);

Why is ARRAY_SIZE() usage removed?

>         if (ret)
>                 return ret;
>
