Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC74B50B96E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 16:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9CB10E9B4;
	Fri, 22 Apr 2022 14:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351A510E676
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 14:03:53 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id 21so10569432edv.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 07:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R+w/lFm+gTC9eW9lBYMMnUgARDTN948ashX6/88jSSk=;
 b=ghMiyWVM5DKXsssoViKphQIWceZP/fjd3ty8ZXt7WVjJwP3cN3O9IT7qFAE/Jj/Qdw
 cR9jYLzNJMz5r3gE7L5BLvMguTvA0g7jVmzMc9rN0pTwKYDEQo4/M8O2xgTv2G8CrHaT
 U2LEsQ4bPR/y/gfgsnT9qyWh/kRicE14xKEec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R+w/lFm+gTC9eW9lBYMMnUgARDTN948ashX6/88jSSk=;
 b=JEmjjpMDodA/2YxOEMedPm2Ut/ZEeBhDscRZ/ndluXSrLmUrcXEvq2JBMpSjHw1b8A
 cPLFfEnd/n3GxAl6iU6HVhyqZ2WoESQuhTJRDNbrRHcmBoXfPkyXVdoz8zRSmY26Ahbw
 ip50w5eOD2Eo+8xGIxO+xVeQjEuWXH1Fg/BdDTYraX/EFxEktiUHZKnlYtEgfbCT385y
 Zlw3gKOcIJmwaEf4UAOBIW5rNcDBifVxPMrMfXyPHSAJSyH57W0M0gIVYOYvJL57/vDH
 bIypcJF/3GCMVk7I5wg3JO87SDlpeHd1JNHXdgE10C0+abhT4uIq9u3ziFqVF1F4Wxw4
 HAoA==
X-Gm-Message-State: AOAM530vP3NvljV7YsKGeiiPzOl21RthVNnQR9G5lWphMyP9HZ5rSO5M
 wcp6agy3hTlEqqM2CW/ZO441OW08QaxwE08xzY8=
X-Google-Smtp-Source: ABdhPJz3DItULgMbJx5/plwxkA9LoSLbq3dgmt9AkU7BxCwK9U+OW/FfbR2tHFtJsOP/eWC0KeRYDA==
X-Received: by 2002:a05:6402:51cb:b0:424:1ecc:81da with SMTP id
 r11-20020a05640251cb00b004241ecc81damr5017542edd.55.1650636231422; 
 Fri, 22 Apr 2022 07:03:51 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 i22-20020a1709063c5600b006e8a8a48baesm773594ejg.99.2022.04.22.07.03.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 07:03:49 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so5434451wmn.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 07:03:49 -0700 (PDT)
X-Received: by 2002:a05:600c:502b:b0:38f:f7c6:3609 with SMTP id
 n43-20020a05600c502b00b0038ff7c63609mr4367415wmr.15.1650636228521; Fri, 22
 Apr 2022 07:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650618666-15342-3-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1650618666-15342-3-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 22 Apr 2022 07:03:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XhznD3Nuiku9mS5YKFVX0GB8qxQZe8m8AgGCQz=a2chQ@mail.gmail.com>
Message-ID: <CAD=FV=XhznD3Nuiku9mS5YKFVX0GB8qxQZe8m8AgGCQz=a2chQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/4] drm/msm/dp: Support only IRQ_HPD and REPLUG
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
 Sean Paul <seanpaul@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Apr 22, 2022 at 2:11 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> The panel-edp enables the eDP panel power during probe, get_modes
> and pre-enable. The eDP connect and disconnect interrupts for the eDP/DP
> controller are directly dependent on panel power. As eDP display can be
> assumed as always connected, the controller driver can skip the eDP
> connect and disconnect interrupts. Any disruption in the link status
> will be indicated via the IRQ_HPD interrupts.
>
> So, the eDP controller driver can just enable the IRQ_HPD and replug
> interrupts. The DP controller driver still needs to enable all the
> interrupts.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
> Changes in v9:
>   - add comment explaining the interrupt status register
>
> Changes in v8:
>   - add comment explaining the interrupt status return
>
> Changes in v7:
>   - reordered the patch in the series
>   - modified the return statement for isr
>   - connector check modified to just check for eDP
>
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 16 ++++++++++------
>  drivers/gpu/drm/msm/dp/dp_display.c | 22 +++++++++++++++++++++-
>  2 files changed, 31 insertions(+), 7 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
