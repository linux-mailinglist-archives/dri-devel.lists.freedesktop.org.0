Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA785018EC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 18:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C7D10FF13;
	Thu, 14 Apr 2022 16:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622B510FF13
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 16:40:23 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id r13so11141870ejd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 09:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uNCknelIIQ0A0jhcGpNkNt/itvQulq3csLsSq+jMi4k=;
 b=OFD1FNp9YuGu2v7rR5vIDLHqSlz5x0ooKxLOUUFLXVcVscIABJa9XczVMvEG6Hdpic
 QEwuykdd5CFYaIM4fwYl2u3dNKd7uLY+YmmM3txQhfvMJ2+kl0ds92uwsXIkXH97bUKc
 WjRgnLpsfAzXQuHotizBIDeTEdVOmrYFEECKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uNCknelIIQ0A0jhcGpNkNt/itvQulq3csLsSq+jMi4k=;
 b=gM/UpuQHeExEpjlYivdwHqADgd03uBAxp6qABjc9S1VKljYIevFglQ6B0Cc7+4NGb3
 oKyOmRS8U8+2a21ADLaLUirvs2AeaK1vs3RNpN0O5I0Uqen4Iu46mezlX7Aw8fjgQdvh
 Nq07L+rP8NP0isp2pC93bxwifH1swWBl6nTDOpHpGMzpLY1CK9elH0uUVUHYh2oyUyg5
 aTJMi/qgDTZSbMKgbyOGL+e79DL5XHDDrV+pn58kePTPMAZCHRDGQ8isuY4a9SEy+f9B
 khPog/eQ+/PCwmDUOSMhYryFBMlruu4bv5kyYBmFJpX8W7Y7IaMZPeRAtz8ajw0SPHJi
 MPiQ==
X-Gm-Message-State: AOAM531NeYpHnTme0dGskSbQJXxMIrEWOug3jE5g+l5blKLaDx/TRRAt
 DqotJbdApjpo1QeqjIjSRtRk81DuUOwneKxi
X-Google-Smtp-Source: ABdhPJzUjcoK6LF6RvQDW9W0olBT4uP0/ZVdq1o013di2uWy6Vt9+vvdZAxDsPeHe3WoDd1AAE7TeQ==
X-Received: by 2002:a17:906:43c2:b0:6e8:47dd:47ed with SMTP id
 j2-20020a17090643c200b006e847dd47edmr2971237ejn.600.1649954421572; 
 Thu, 14 Apr 2022 09:40:21 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 bw3-20020a170906c1c300b006e88cdfbc32sm796331ejb.45.2022.04.14.09.40.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 09:40:19 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id q3so7064722wrj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 09:40:19 -0700 (PDT)
X-Received: by 2002:adf:c14d:0:b0:207:a28f:f5dd with SMTP id
 w13-20020adfc14d000000b00207a28ff5ddmr2647776wre.679.1649954418519; Thu, 14
 Apr 2022 09:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
 <1649938766-6768-5-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1649938766-6768-5-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Apr 2022 09:40:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xrsnk0PYENn5Een1xdUc9B1DKy8jvd1itKbFkvHAivMg@mail.gmail.com>
Message-ID: <CAD=FV=Xrsnk0PYENn5Een1xdUc9B1DKy8jvd1itKbFkvHAivMg@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] Support the eDP modes given by panel
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

On Thu, Apr 14, 2022 at 5:20 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> The eDP controller does not have a reliable way keep panel
> powered on to read the sink capabilities. So, the controller
> driver cannot validate if a mode can be supported by the
> source. We will rely on the panel driver to populate only
> the supported modes for now.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c7277f0..0f18a16 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -998,6 +998,14 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
>                 return -EINVAL;
>         }
>
> +       /*
> +        * The eDP controller currently does not have a reliable way of
> +        * enabling panel power to read sink capabilities. So, we rely
> +        * on the panel driver to populate only supported modes for now.
> +        */
> +       if (dp->is_edp)
> +               return MODE_OK;

As discussed out-of-band, I agree that this is the right thing for now
and making this assumption won't break anything. In general the set of
eDP panels is known ahead of time it's fairly unlikely someone would
set things up so that a panel couldn't use the mode it was reporting.

Longer term we should figure out a way to solve this but it doesn't
have to be today. To properly implement mode_valid() we've got to
combine knowledge from the panel (mostly rates supported and number of
lanes supported) with the controller (rates supported, number of lanes
supported/hooked up on this board).

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
