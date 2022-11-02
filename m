Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDF6616674
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 16:48:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD1110E4D0;
	Wed,  2 Nov 2022 15:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8C010E4D0
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 15:47:56 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id a67so27077392edf.12
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 08:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gi3t/H3sgRSp/TTxI5Y7D4jgleEW4uvtz2PN2Yb+aOk=;
 b=IHxzgN+f6qZOjbhKUVgVPJkU0JYkySkNahkcri3zG5ro4nu8jjWXIwytReAJkJiZsz
 mMAFOIvJmMNJdjS4ZW8mUt2TMBN92LkU+FjqgTOQivUNgTDlhdqWbRNgWQkafg+WjvXw
 RfLIXGFFvgtScptPeCqr3WrpOfhj7e4zKzR28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gi3t/H3sgRSp/TTxI5Y7D4jgleEW4uvtz2PN2Yb+aOk=;
 b=YXPUt6HSvSoP5j/sldTJQnwJeZC9RFxk96sA1S2I2AQNq2Q2kRg3M89NNJbwJGfA34
 d11bJohsUmN58G4gi3aAmtAT//Lj0hev3+Yx10gZdVwi8pJCUeCgpxC/pUnvnd3Hx1cj
 7u+P7vTRABUZNuFS7RewzRpTJZwpKayCziAi3Zaq3EEfeToh6LtFLfaX5h/yywHjbb7i
 X8aIUSTcd84dbGWA5NpqiKATzmC0tL0b3Now6ZYhScwT5KsLx9aWexcf8ahL73flsUkJ
 KXekZyg2PeKit4/hYAnkOG5UXcg295f5MX2s+mB4pgjoeylnV2XBlVKlB9gCcGdE7q8g
 i5gQ==
X-Gm-Message-State: ACrzQf2GQa7znCeCR8jAzfZZAI4gkqS0txhGJveCUPBodkcoJhyLqGtd
 7Ly7ZsJVAJAW/ptb2um2VaQbLuwtbWMRP70U
X-Google-Smtp-Source: AMsMyM7wToYqjtgrzTQNlPBlEvbCZZIQI3YBf27Z6YhiOJckYXj23NX2+/KKeq8nqZNnrngafHOJ/g==
X-Received: by 2002:a05:6402:5:b0:463:39ab:c1da with SMTP id
 d5-20020a056402000500b0046339abc1damr19341632edu.166.1667404074408; 
 Wed, 02 Nov 2022 08:47:54 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47]) by smtp.gmail.com with ESMTPSA id
 v27-20020aa7cd5b000000b00458898fe90asm5980168edw.5.2022.11.02.08.47.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 08:47:52 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id
 f16-20020a05600c491000b003cf66a2e7c0so1556098wmp.5
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 08:47:51 -0700 (PDT)
X-Received: by 2002:a1c:4c16:0:b0:3cf:6f1a:9038 with SMTP id
 z22-20020a1c4c16000000b003cf6f1a9038mr12647230wmf.151.1667404070751; Wed, 02
 Nov 2022 08:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <1667237245-24988-1-git-send-email-quic_khsieh@quicinc.com>
 <94b507e8-5b94-12ae-4c81-95f5d36279d5@linaro.org>
 <deb60200-5a37-ec77-9515-0c0c89022174@quicinc.com>
 <CAD=FV=X_fs_4JYcRvAwkU9mAafOten9WdyzPfSVWdAU=ZMo8zg@mail.gmail.com>
 <155e4171-187c-4ecf-5a9b-12f0c2207524@linaro.org>
 <CAD=FV=Wk5rBSq9Mx1GCO0QFYckKV9KUFKL36Ld7dQX1ypHVcYw@mail.gmail.com>
In-Reply-To: <CAD=FV=Wk5rBSq9Mx1GCO0QFYckKV9KUFKL36Ld7dQX1ypHVcYw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 2 Nov 2022 08:47:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XTOUjVAGFWZ6xTkcNOrCT1p73aU-=KJNYUOxsS-BQsyA@mail.gmail.com>
Message-ID: <CAD=FV=XTOUjVAGFWZ6xTkcNOrCT1p73aU-=KJNYUOxsS-BQsyA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: remove limitation of link rate at 5.4G to
 support HBR3
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Nov 1, 2022 at 7:37 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Oct 31, 2022 at 5:15 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On 01/11/2022 03:08, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Mon, Oct 31, 2022 at 2:11 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> > >>
> > >> Hi Dmitry,
> > >>
> > >>
> > >> Link rate is advertised by sink, but adjusted (reduced the link rate)
> > >> by host during link training.
> > >>
> > >> Therefore should be fine if host did not support HBR3 rate.
> > >>
> > >> It will reduce to lower link rate during link training procedures.
> > >>
> > >> kuogee
> > >>
> > >> On 10/31/2022 11:46 AM, Dmitry Baryshkov wrote:
> > >>> On 31/10/2022 20:27, Kuogee Hsieh wrote:
> > >>>> An HBR3-capable device shall also support TPS4. Since TPS4 feature
> > >>>> had been implemented already, it is not necessary to limit link
> > >>>> rate at HBR2 (5.4G). This patch remove this limitation to support
> > >>>> HBR3 (8.1G) link rate.
> > >>>
> > >>> The DP driver supports several platforms including sdm845 and can
> > >>> support, if I'm not mistaken, platforms up to msm8998/sdm630/660.
> > >>> Could you please confirm that all these SoCs have support for HBR3?
> > >>>
> > >>> With that fact being confirmed:
> > >>>
> > >>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >>>
> > >>>
> > >>>>
> > >>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > >>>> ---
> > >>>>    drivers/gpu/drm/msm/dp/dp_panel.c | 4 ----
> > >>>>    1 file changed, 4 deletions(-)
> > >>>>
> > >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c
> > >>>> b/drivers/gpu/drm/msm/dp/dp_panel.c
> > >>>> index 5149ceb..3344f5a 100644
> > >>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> > >>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> > >>>> @@ -78,10 +78,6 @@ static int dp_panel_read_dpcd(struct dp_panel
> > >>>> *dp_panel)
> > >>>>        if (link_info->num_lanes > dp_panel->max_dp_lanes)
> > >>>>            link_info->num_lanes = dp_panel->max_dp_lanes;
> > >>>>    -    /* Limit support upto HBR2 until HBR3 support is added */
> > >>>> -    if (link_info->rate >=
> > >>>> (drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4)))
> > >>>> -        link_info->rate = drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4);
> > >>>> -
> > >>>>        drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
> > >>>>        drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
> > >>>>        drm_dbg_dp(panel->drm_dev, "lane_count=%d\n",
> > >>>> link_info->num_lanes);
> > >
> > > Stephen might remember better, but I could have sworn that the problem
> > > was that there might be something in the middle that couldn't support
> > > the higher link rate. In other words, I think we have:
> > >
> > > SoC <--> TypeC Port Controller <--> Display
> > >
> > > The SoC might support HBR3 and the display might support HBR3, but the
> > > TCPC (Type C Port Controller) might not. I think that the TCPC is a
> > > silent/passive component so it can't really let anyone know about its
> > > limitations.
> > >
> > > In theory I guess you could rely on link training to just happen to
> > > fail if you drive the link too fast for the TCPC to handle. Does this
> > > actually work reliably?
> > >
> > > I think the other option that was discussed in the past was to add
> > > something in the device tree for this. Either you could somehow model
> > > the TCPC in DRM and thus know that a given model of TCPC limits the
> > > link rate or you could hack in a property in the DP controller to
> > > limit it.
> >
> > Latest pmic_glink proposal from Bjorn include adding the drm_bridge for
> > the TCPC. Such bridge can in theory limit supported modes and rates.
>
> Excellent! Even so, I think this isn't totally a solved problem,
> right? Even though a bridge seems like a good place for this, last I
> remember checking the bridge API wasn't expressive enough to solve
> this problem. A bridge could limit pixel clocks just fine, but here we
> need to take into account other considerations to know if a given
> pixel clock can work at 5.4 GHz or not. For instance, if we're at 4
> lanes we could maybe make a given pixel clock at 5.4 GHz but not if we
> only have 2 lanes. I don't think that the DP controller passes the
> number of lanes to other parts of the bridge chain, though maybe
> there's some trick for it?
>
> ...I guess the other problem is that all existing users aren't
> currently modeling their TCPC in this way. What happens to them?

FWIW, I did more research on the "let's rely on link training to
detect TCPC's that only support HBR2". I haven't tested it myself, but
from looking at a 1.5 year old internal bug where we discussed this
before, both others at Qualcomm and others at Google were skeptical
about this. Both parties had past experience where link training would
succeed but the display wouldn't be reliable at the higher link rate.

I guess that leaves us with 3 possible approaches:

1. Someone figures out how to model this with the bridge chain and
then we only allow HBR3 if we detect we've got a TCPC that supports
it. This seems like the cleanest / best but feels like a long pole.
Not only have we been trying to get the TCPC-modeled-as-a-bridge stuff
landed for a long time but even when we do it we still don't have a
solution for how to communicate the number of lanes and other stuff
between the TCPC and the DP controller so we have to enrich the bridge
interface.

2. We add in a DT property to the display controller node that says
the max link rate for use on this board. This feels like a hack, but
maybe it's not too bad. Certainly it would be incredibly simple to
implement. Actually... ...one could argue that even if we later model
the TCPC as a bridge that this property would still be valid / useful!
You could certainly imagine that the SoC supports HBR3 and the TCPC
supports HBR3 but that the board routing between the SoC and the TCPC
is bad and only supports HBR2. In this case the only way out is
essentially a "board constraint" AKA a DT property in the DP
controller.

3. We could do some hack based on the SoC. We could assume that newer
SoCs will have a TCPC that was tested with HBR3. This doesn't require
any DT changes and would work, but feels like it won't stand the test
of time.

I'd vote for #2 but I'm interested in what others say.

-Doug
