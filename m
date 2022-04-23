Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B83A50C5BB
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 02:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5619E10E0D2;
	Sat, 23 Apr 2022 00:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB6710E02F
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 00:29:34 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-e604f712ecso10285918fac.9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 17:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=TV1o9feYxCdyKt0JuJiBgbZSXqeh07AaBQWI/pgyL08=;
 b=LHERZD4VRU537UNeGu4kQJYZvCu0l/bUDJruPxQimieXQjAX7LiJpdEkKbNSh1uoEy
 8oSyOUxSJNDayHO96q+MfbC8WSVI1QsSik5zxPPllIpQoNBdYYZTteTzstLtP/2HzKQE
 R2yadhEr14mQtZ5JEFlVYKv+EG35Ui7zfG8cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=TV1o9feYxCdyKt0JuJiBgbZSXqeh07AaBQWI/pgyL08=;
 b=fq1tbg3RaD9E1fRtXJvgWQyhbQh1lg1iHrPUFKLPu6Y3MYc9+nGiT/VkLcVJ070oeJ
 9+7bh9hXZbulGnkglq2m9IxPyN2BAYQGLNIVknDV6+21sIh8Sxly0BjViU+99aXraMjd
 upSlDumnkBtg//AXV14II/Q8ZBe/PfFwemoC4AcfODdKxW1FZ0hmX94kTlnXSqnkwqKN
 6sRBlPt/1m2oXF4vwRWc5SlJ4umYrawjSL5rdNib0+vtEV9wnzWr2YJjxNTjqaMXA4TL
 IXIm4sHFp6iWVbDmPqZhIUuQbz9SGt6d2lVUAl4DgI+BCuEw/lI2c3VT8aFr9Kq/KdL8
 Zcvg==
X-Gm-Message-State: AOAM530Rz2OJlWCpiUYQvag/O+NKbpxYYwfTHzlWJy8A3r7owTF8a1pN
 +LRy/XAwuNt6q9IfDYSP1BoI0EUW5E9jlUL9DHTQIQ==
X-Google-Smtp-Source: ABdhPJwZSWtMrJXIW76T3DHRM8eiuaVPJzLzWN3WNj80zMzBEv1KTqiTUVdC20phzW29gNwZ7oWC/dChPOa9FfCP8GM=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr3197762oao.63.1650673773969; Fri, 22
 Apr 2022 17:29:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 Apr 2022 17:29:33 -0700
MIME-Version: 1.0
In-Reply-To: <1650618666-15342-3-git-send-email-quic_sbillaka@quicinc.com>
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650618666-15342-3-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 22 Apr 2022 17:29:33 -0700
Message-ID: <CAE-0n52tKt3yywZFEKobet4t9xXA_GbTDcUqPPEj5A-KkDET3Q@mail.gmail.com>
Subject: Re: [PATCH v9 2/4] drm/msm/dp: Support only IRQ_HPD and REPLUG
 interrupts for eDP
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_vproddut@quicinc.com,
 airlied@linux.ie, quic_abhinavk@quicinc.com, steev@kali.org,
 quic_khsieh@quicinc.com, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, bjorn.andersson@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2022-04-22 02:11:04)
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

The sprinkling of if conditions and manual driving of the DP plug/unplug
state machine is pretty convoluted. To make it better the driver needs
an overhaul. Anyway, it looks mostly fine to me except for this replug
interrupt question below. Otherwise

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>  int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 055681a..dea4de9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1096,6 +1097,13 @@ static void dp_display_config_hpd(struct dp_display_private *dp)
>         dp_display_host_init(dp);
>         dp_catalog_ctrl_hpd_config(dp->catalog);
>
> +       /* Enable plug and unplug interrupts only for external DisplayPort */
> +       if (!dp->dp_display.is_edp)
> +               dp_catalog_hpd_config_intr(dp->catalog,
> +                               DP_DP_HPD_PLUG_INT_MASK |
> +                               DP_DP_HPD_UNPLUG_INT_MASK,
> +                               true);
> +

It seems like only the plug and unplug is enabled for DP here. Is replug
enabled for eDP when it shouldn't be?

>         /* Enable interrupt first time
>          * we are leaving dp clocks on during disconnect
>          * and never disable interrupt
