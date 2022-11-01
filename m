Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAF6614221
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 01:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7B210E250;
	Tue,  1 Nov 2022 00:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEBA10E250
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 00:08:47 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id i21so19693158edj.10
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 17:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NMxz0liguPdCL2/WpnddOh/DIdPoIOoiIe69SUq/QMU=;
 b=gB9U2D3gVAPbsEs2QsqvPxMyMf8x1k/5bQSKqSqALrJcu5gTx/grfkJRhMMNVvdAXz
 94G6YftLtWqzQmvlZgLUxjEdVSuQNgu6aHwYhULB757WL7ZgxoWzFY16FzRVCvWVm5t/
 S1HMcTK9WED5lfZ3UJpi2+zsCR0xlmfCljJ/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NMxz0liguPdCL2/WpnddOh/DIdPoIOoiIe69SUq/QMU=;
 b=tB3oB3CcedGGJn5r2u7FfvcPwzYaQTekijfT/3lLbHp3ohmLrC/PkwbNq9UdJ2v1Er
 sfGxc8KtNatLMGwGj/AxUF9g2BlMhW2q7AWAPEyhB6TBrZ5GgKd1bKslLFVKjXaTLZ3G
 nfXOytNuLmLsBs7lXHYn+JzwMBV9xTsJMneGndUIYfFoTI6I+fdNNMzQNsePOI1JO/69
 RklxJdHhiJ82nqkflRXVIB83ZKriaLdsA1vAT+skHGDt6zCKalHQvqHF6N0AeOet01bG
 SRlFiNuthnJen3uyU9BeZmaYDkuYc0zxLlkh9gOQkewzzANWL5XvGLECsAcm9ucgUXw2
 /IPA==
X-Gm-Message-State: ACrzQf36/G7e9j34SsFyMvBD9CQRnK3KRci7qUrM4hbwBjVWLhzfmCRF
 A0RbyH1eBNUxbBPURzVsImnC+kwYs8GGivbt
X-Google-Smtp-Source: AMsMyM7TF7GhkAtlO5yGn07hFAm1DM7Cp3YBFGoPR+jyp+RRA6CYDhGyYcHhZTrm9m69NtTJbhrkSA==
X-Received: by 2002:a05:6402:144a:b0:461:8e34:d07b with SMTP id
 d10-20020a056402144a00b004618e34d07bmr16576018edx.426.1667261325219; 
 Mon, 31 Oct 2022 17:08:45 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52]) by smtp.gmail.com with ESMTPSA id
 lb8-20020a170907784800b007ab2d744801sm3509658ejc.190.2022.10.31.17.08.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 17:08:42 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id g12so18124996wrs.10
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 17:08:42 -0700 (PDT)
X-Received: by 2002:a5d:498f:0:b0:236:55e9:6c16 with SMTP id
 r15-20020a5d498f000000b0023655e96c16mr9928075wrq.331.1667261321638; Mon, 31
 Oct 2022 17:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <1667237245-24988-1-git-send-email-quic_khsieh@quicinc.com>
 <94b507e8-5b94-12ae-4c81-95f5d36279d5@linaro.org>
 <deb60200-5a37-ec77-9515-0c0c89022174@quicinc.com>
In-Reply-To: <deb60200-5a37-ec77-9515-0c0c89022174@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 31 Oct 2022 17:08:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X_fs_4JYcRvAwkU9mAafOten9WdyzPfSVWdAU=ZMo8zg@mail.gmail.com>
Message-ID: <CAD=FV=X_fs_4JYcRvAwkU9mAafOten9WdyzPfSVWdAU=ZMo8zg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: remove limitation of link rate at 5.4G to
 support HBR3
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 bjorn.andersson@linaro.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Oct 31, 2022 at 2:11 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Hi Dmitry,
>
>
> Link rate is advertised by sink, but adjusted (reduced the link rate)
> by host during link training.
>
> Therefore should be fine if host did not support HBR3 rate.
>
> It will reduce to lower link rate during link training procedures.
>
> kuogee
>
> On 10/31/2022 11:46 AM, Dmitry Baryshkov wrote:
> > On 31/10/2022 20:27, Kuogee Hsieh wrote:
> >> An HBR3-capable device shall also support TPS4. Since TPS4 feature
> >> had been implemented already, it is not necessary to limit link
> >> rate at HBR2 (5.4G). This patch remove this limitation to support
> >> HBR3 (8.1G) link rate.
> >
> > The DP driver supports several platforms including sdm845 and can
> > support, if I'm not mistaken, platforms up to msm8998/sdm630/660.
> > Could you please confirm that all these SoCs have support for HBR3?
> >
> > With that fact being confirmed:
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> >
> >>
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_panel.c | 4 ----
> >>   1 file changed, 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c
> >> b/drivers/gpu/drm/msm/dp/dp_panel.c
> >> index 5149ceb..3344f5a 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> >> @@ -78,10 +78,6 @@ static int dp_panel_read_dpcd(struct dp_panel
> >> *dp_panel)
> >>       if (link_info->num_lanes > dp_panel->max_dp_lanes)
> >>           link_info->num_lanes = dp_panel->max_dp_lanes;
> >>   -    /* Limit support upto HBR2 until HBR3 support is added */
> >> -    if (link_info->rate >=
> >> (drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4)))
> >> -        link_info->rate = drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4);
> >> -
> >>       drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
> >>       drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
> >>       drm_dbg_dp(panel->drm_dev, "lane_count=%d\n",
> >> link_info->num_lanes);

Stephen might remember better, but I could have sworn that the problem
was that there might be something in the middle that couldn't support
the higher link rate. In other words, I think we have:

SoC <--> TypeC Port Controller <--> Display

The SoC might support HBR3 and the display might support HBR3, but the
TCPC (Type C Port Controller) might not. I think that the TCPC is a
silent/passive component so it can't really let anyone know about its
limitations.

In theory I guess you could rely on link training to just happen to
fail if you drive the link too fast for the TCPC to handle. Does this
actually work reliably?

I think the other option that was discussed in the past was to add
something in the device tree for this. Either you could somehow model
the TCPC in DRM and thus know that a given model of TCPC limits the
link rate or you could hack in a property in the DP controller to
limit it.

-Doug
