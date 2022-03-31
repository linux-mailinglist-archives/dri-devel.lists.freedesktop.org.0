Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE514EE4C2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 01:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59EE10E31C;
	Thu, 31 Mar 2022 23:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760D510E31C
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 23:29:13 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id p10so1797710lfa.12
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 16:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VA4OmUlBn+h032QaRrbwfz0ENP/lgrthHNuo2cDc9zs=;
 b=nYjHIf8uflbZHObYpxif9B5oD9Wtb4t5AI1eCWohJX41q9UAn/abH6xMu9omxNFwsr
 7qUSDGsPXh0wIhNznI1YcZUJupDndJZzHhIHEE8hHppvHxSa6v170I7xv/CDtTfwhCpF
 kzEWwkEZCviEfCOEDQ+sa6YJGh6+XAWttUpDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VA4OmUlBn+h032QaRrbwfz0ENP/lgrthHNuo2cDc9zs=;
 b=ukZGd9ly64g7cmuev7to+FsZDEwNRFD4ZPcW3k9fhzEGXBlFio7aId3Sk4flP+IPWb
 cNxNGgJXzeLd5B8QDcwkkfQ5TA8gF9sk7iC5JODt+adW15J2Qz1Dj1YiWttK8sYakDDC
 vwZzH1zSmU9/p4+tajX8sotlH/Soiiq3St2TH9ZNoCgqUXICCMegNUj2xcZUUUDIczFK
 2eTjARsCzxAU8HOndXFsQfka/KvvzWJZWcmctuq6uM9ZRroMryavIGskpLy0wu3f58PN
 WisvKLQH65/WaAL065W6jy7afd1N8eRNbfxQOZaX1ac8KJFtxOm7opBwstUDdg6hKPYU
 WA9w==
X-Gm-Message-State: AOAM532fWARhwX4LJSppnAPvrsSlya/Hsq8KTb5I8BkAEvvPMcA3yzsL
 Hdbe2ZXL9jC5SlTWjjZhjxzTcpUNiw437nCC5GU=
X-Google-Smtp-Source: ABdhPJwm8mm5eygVT0rqlVebQRZ2FVvA9yzTbkmslzk+L29R7YdX1AmKSPhXqJc39DOGxje3Ym6Oww==
X-Received: by 2002:a05:6512:230a:b0:44a:7699:a2a with SMTP id
 o10-20020a056512230a00b0044a76990a2amr12063413lfu.277.1648769351274; 
 Thu, 31 Mar 2022 16:29:11 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181]) by smtp.gmail.com with ESMTPSA id
 x11-20020a19e00b000000b004488bf4137esm69011lfg.245.2022.03.31.16.29.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 16:29:10 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id bn33so1766978ljb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 16:29:10 -0700 (PDT)
X-Received: by 2002:adf:fc47:0:b0:203:dda1:4311 with SMTP id
 e7-20020adffc47000000b00203dda14311mr5685367wrs.301.1648768978217; Thu, 31
 Mar 2022 16:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-4-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1648656179-10347-4-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 31 Mar 2022 16:22:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X_ULva3J-Y7EF+0VPRRoFXSmtuKcXG9H=041Kmwa=W4A@mail.gmail.com>
Message-ID: <CAD=FV=X_ULva3J-Y7EF+0VPRRoFXSmtuKcXG9H=041Kmwa=W4A@mail.gmail.com>
Subject: Re: [PATCH v6 3/8] drm/msm/dp: Support only IRQ_HPD and REPLUG
 interrupts for eDP
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_aravindh@quicinc.com,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 30, 2022 at 9:03 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> @@ -1374,6 +1382,12 @@ static int dp_pm_resume(struct device *dev)
>         dp_catalog_ctrl_hpd_config(dp->catalog);
>
>
> +       if (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_DisplayPort)
> +               dp_catalog_hpd_config_intr(dp->catalog,
> +                               DP_DP_HPD_PLUG_INT_MASK |
> +                               DP_DP_HPD_UNPLUG_INT_MASK,
> +                               true);
> +

nit: why are there two blank lines above?


> @@ -1639,6 +1653,9 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
>                 return;
>         }
>
> +       if (dp->connector_type == DRM_MODE_CONNECTOR_eDP)
> +               dp_hpd_plug_handle(dp_display, 0);
> +

Should you add a "pre_enable" and do it there? That would make it more
symmetric with the fact that you have the countertpart in
"post_disable".


Overall: I'm probably not familiar enough with this code to give it a
full review. I'm hoping that Dmitry knows it well enough... ;-)


-Doug
