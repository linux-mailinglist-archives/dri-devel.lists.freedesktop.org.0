Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED25652F44A
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 22:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE12E10E227;
	Fri, 20 May 2022 20:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBA010E11E
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 20:14:24 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id w130so11251517oig.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 13:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=HWJji6gVytG9NaepPJsUpOE+oqctRwW53y/Rg2/3daI=;
 b=L5wdilZPPhLeZ6H9txo7C+yQMMnJoaeLu6EewH66Q73sZn7CgIshPVfGQt58p2T1rF
 z7QeS2uLJnC624MbM5zt8fBPnBh+VHRq7OO8RY0kOqZapAwf1WxaNEnVe9wSh6nhfAU1
 u6lKg8SoY9PqpD/V98ioNwwwLlmY/2daDSeTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=HWJji6gVytG9NaepPJsUpOE+oqctRwW53y/Rg2/3daI=;
 b=OSxTFnGdtvsDIa10JE0EGQAVMxmnOWlrEvSguTZYRUD7HMCRBQTib/953sg9iGqM6B
 Uar/vPhJRI867Q0eYOwmcWZgv2P1V8maoREMR4okReGIOr1jtyVeJrWPg4jiFU4DyDb5
 w8T3yML1OB+Z605LOubnyLUi0RLL4/63jU0pRUfvu3zIHGhioag09MyIna3MGeLM7gLE
 6EXub6ko2qDm+2HXlUVwDYhM1W2cQgHE3Aptnd79rA+u2BBjsBg9XjMTOpgRBM2a4ZBI
 T5oZ16L0Z+xwEdJ7rO/pyz//pbOWs1RG60mcsouBlFo5QZUoMKFrnRLtK+sECO29zQ+F
 I0Zw==
X-Gm-Message-State: AOAM532VpKSls/KDZDDI3mbY2QWB3I/9GC9FqOoBh/Wx0AqJcSYXTafp
 WMjArkeI/05DREy3aBD3ll8YMQjHjDMFIvN8rqy85Q==
X-Google-Smtp-Source: ABdhPJwP7L0SMXKFI6625vEQZTfFfECarUErW2tlmkzH+D2As2PkcfrO1Fh8376ZDCpcT7+qRqUbX8ACus/aB+6rZHQ=
X-Received: by 2002:a05:6808:23c3:b0:326:bd8d:7993 with SMTP id
 bq3-20020a05680823c300b00326bd8d7993mr6601653oib.63.1653077663519; Fri, 20
 May 2022 13:14:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 May 2022 13:14:23 -0700
MIME-Version: 1.0
In-Reply-To: <1653077167-16684-2-git-send-email-quic_khsieh@quicinc.com>
References: <1653077167-16684-1-git-send-email-quic_khsieh@quicinc.com>
 <1653077167-16684-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 20 May 2022 13:14:23 -0700
Message-ID: <CAE-0n51B3Crb0ZFUppu2MXAGfCEfRcO9FX-6KMTTcPia3w8TkQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] phy: qcom-edp: add regulator_set_load to edp phy
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

Quoting Kuogee Hsieh (2022-05-20 13:06:05)
> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index cacd32f..0b7f318 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -639,6 +639,9 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
>
> +       regulator_set_load(edp->supplies[0].consumer, 21800); /* 1.2 V vdda-phy */
> +       regulator_set_load(edp->supplies[1].consumer, 36000); /* 0.9 V vdda-pll */

Why aren't there checks for errors on these API calls?
