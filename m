Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AB5616A9E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 18:25:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E19410E51D;
	Wed,  2 Nov 2022 17:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA6B10E52E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 17:25:20 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id x2so27569748edd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 10:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=51rFW/enZ2vF1KbmVXVuw7m87Xy2muUBj8Dj5YrE91A=;
 b=Kfs+EzFBbXIyUhE4JHfyW8Mt899KRAOuHrB0jOv9EpEZZQ308Gub/8ubosI+Y6y+lo
 aRQ80VBACI7mZXpRkdJlK8KR7ThKSajTPJPtfC1FxfznjjF4cXJ+zfqs7b0crpdsGUTX
 F0r4Rf5VMEyVyOylqC9As8UOsNQhHCfIIKCro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=51rFW/enZ2vF1KbmVXVuw7m87Xy2muUBj8Dj5YrE91A=;
 b=BFDaX6wlbW22F5ydNldD97mvwW90E31CB/ClTq+gAkYMf7sj9WaJstYEFRZomYvLrF
 Pb12pNGPO99qQN59KnBG8JxkUWdWUzUdg30BL+D1hxTkdvyvsYFom4fafKW58y+sJEzt
 mr4SRWmew+tY5T6GAKz7I7td82e0/kxH+ocwa3aFvCW78dZgoKv1heQQIlZklhJzu4oE
 Ot/8AO5+Zj7KN1qvh+Ks70AFUwW/rjgO7SqzsiGyWiDrjnJ4J6eaS5jUBru/vEqApbFo
 48nbkxkSFCZfQIiDbfMeQRzuPEMiwGu47bH1+6LeR7VApBCHs/Xhe1XwmW8DXPmJO4Ty
 2Sdg==
X-Gm-Message-State: ACrzQf2CLAxZATqnd2dsTPucs8SIN+SrPuI5b2J/ozI5R7t0gNdtxGHD
 tj9wFhMh71vpkjiS2RcesYE5pBF+XEbp2mhA
X-Google-Smtp-Source: AMsMyM4xnd6k6MFY2czcT1eeH03WAyxxD2s1mEPrXtHqiGngz6poLI6OBShNl93YWWPu3g8K6KusoA==
X-Received: by 2002:a05:6402:42c7:b0:461:bea2:8a70 with SMTP id
 i7-20020a05640242c700b00461bea28a70mr26731406edc.261.1667409917812; 
 Wed, 02 Nov 2022 10:25:17 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46]) by smtp.gmail.com with ESMTPSA id
 gy8-20020a170906f24800b007317f017e64sm5635539ejb.134.2022.11.02.10.25.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 10:25:15 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id o4so25566995wrq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 10:25:15 -0700 (PDT)
X-Received: by 2002:a5d:6488:0:b0:22b:3b0b:5e72 with SMTP id
 o8-20020a5d6488000000b0022b3b0b5e72mr16149800wri.138.1667409914657; Wed, 02
 Nov 2022 10:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <1667237245-24988-1-git-send-email-quic_khsieh@quicinc.com>
 <94b507e8-5b94-12ae-4c81-95f5d36279d5@linaro.org>
 <deb60200-5a37-ec77-9515-0c0c89022174@quicinc.com>
 <CAD=FV=X_fs_4JYcRvAwkU9mAafOten9WdyzPfSVWdAU=ZMo8zg@mail.gmail.com>
 <155e4171-187c-4ecf-5a9b-12f0c2207524@linaro.org>
 <CAD=FV=Wk5rBSq9Mx1GCO0QFYckKV9KUFKL36Ld7dQX1ypHVcYw@mail.gmail.com>
 <da9720c2-ddc7-1a00-2608-0ef64c072cdd@linaro.org>
In-Reply-To: <da9720c2-ddc7-1a00-2608-0ef64c072cdd@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 2 Nov 2022 10:25:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V+ZgKaKbg5iX0i15ZfDO3MfBuHF8BGT3r8ZPmhTiNWDw@mail.gmail.com>
Message-ID: <CAD=FV=V+ZgKaKbg5iX0i15ZfDO3MfBuHF8BGT3r8ZPmhTiNWDw@mail.gmail.com>
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

On Wed, Nov 2, 2022 at 10:15 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 01/11/2022 17:37, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Oct 31, 2022 at 5:15 PM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >>
> >> On 01/11/2022 03:08, Doug Anderson wrote:
> >>> Hi,
> >>>
> >>> On Mon, Oct 31, 2022 at 2:11 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >>>>
> >>>> Hi Dmitry,
> >>>>
> >>>>
> >>>> Link rate is advertised by sink, but adjusted (reduced the link rate)
> >>>> by host during link training.
> >>>>
> >>>> Therefore should be fine if host did not support HBR3 rate.
> >>>>
> >>>> It will reduce to lower link rate during link training procedures.
> >>>>
> >>>> kuogee
> >>>>
> >>>> On 10/31/2022 11:46 AM, Dmitry Baryshkov wrote:
> >>>>> On 31/10/2022 20:27, Kuogee Hsieh wrote:
> >>>>>> An HBR3-capable device shall also support TPS4. Since TPS4 feature
> >>>>>> had been implemented already, it is not necessary to limit link
> >>>>>> rate at HBR2 (5.4G). This patch remove this limitation to support
> >>>>>> HBR3 (8.1G) link rate.
> >>>>>
> >>>>> The DP driver supports several platforms including sdm845 and can
> >>>>> support, if I'm not mistaken, platforms up to msm8998/sdm630/660.
> >>>>> Could you please confirm that all these SoCs have support for HBR3?
> >>>>>
> >>>>> With that fact being confirmed:
> >>>>>
> >>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>>
> >>>>>
> >>>>>>
> >>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>>>>> ---
> >>>>>>     drivers/gpu/drm/msm/dp/dp_panel.c | 4 ----
> >>>>>>     1 file changed, 4 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c
> >>>>>> b/drivers/gpu/drm/msm/dp/dp_panel.c
> >>>>>> index 5149ceb..3344f5a 100644
> >>>>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> >>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> >>>>>> @@ -78,10 +78,6 @@ static int dp_panel_read_dpcd(struct dp_panel
> >>>>>> *dp_panel)
> >>>>>>         if (link_info->num_lanes > dp_panel->max_dp_lanes)
> >>>>>>             link_info->num_lanes = dp_panel->max_dp_lanes;
> >>>>>>     -    /* Limit support upto HBR2 until HBR3 support is added */
> >>>>>> -    if (link_info->rate >=
> >>>>>> (drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4)))
> >>>>>> -        link_info->rate = drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4);
> >>>>>> -
> >>>>>>         drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
> >>>>>>         drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
> >>>>>>         drm_dbg_dp(panel->drm_dev, "lane_count=%d\n",
> >>>>>> link_info->num_lanes);
> >>>
> >>> Stephen might remember better, but I could have sworn that the problem
> >>> was that there might be something in the middle that couldn't support
> >>> the higher link rate. In other words, I think we have:
> >>>
> >>> SoC <--> TypeC Port Controller <--> Display
> >>>
> >>> The SoC might support HBR3 and the display might support HBR3, but the
> >>> TCPC (Type C Port Controller) might not. I think that the TCPC is a
> >>> silent/passive component so it can't really let anyone know about its
> >>> limitations.
> >>>
> >>> In theory I guess you could rely on link training to just happen to
> >>> fail if you drive the link too fast for the TCPC to handle. Does this
> >>> actually work reliably?
> >>>
> >>> I think the other option that was discussed in the past was to add
> >>> something in the device tree for this. Either you could somehow model
> >>> the TCPC in DRM and thus know that a given model of TCPC limits the
> >>> link rate or you could hack in a property in the DP controller to
> >>> limit it.
> >>
> >> Latest pmic_glink proposal from Bjorn include adding the drm_bridge for
> >> the TCPC. Such bridge can in theory limit supported modes and rates.
> >
> > Excellent! Even so, I think this isn't totally a solved problem,
> > right? Even though a bridge seems like a good place for this, last I
> > remember checking the bridge API wasn't expressive enough to solve
> > this problem. A bridge could limit pixel clocks just fine, but here we
> > need to take into account other considerations to know if a given
> > pixel clock can work at 5.4 GHz or not. For instance, if we're at 4
> > lanes we could maybe make a given pixel clock at 5.4 GHz but not if we
> > only have 2 lanes. I don't think that the DP controller passes the
> > number of lanes to other parts of the bridge chain, though maybe
> > there's some trick for it?
>
> I hope that somebody would fix MSM DP's data-lanes property usage to
> follow the usual way (a part of DT graph). Then it would be possible to
> query the amount of the lanes from the bridge.

Sorry, can you explain how exactly this works?

I suspect that _somehow_ we need to get info from the TCPC to the DP
controller driver about the maximum link rate. I think anything where
the TCPC uses mode_valid() to reject modes and tries to make decisions
based on "pixel clock" is going to be bad. If nothing else, I think
that during link training that DP controller can try many different
things to see what works. It may try varying the number of lanes, the
BPC, the link rate, etc. I don't think mode_valid() is called each
time through here.


> > ...I guess the other problem is that all existing users aren't
> > currently modeling their TCPC in this way. What happens to them?
>
> There are no existing users. Bryan implemented TCPM support at some
> point, but we never pushed this upstream.

I mean existing DP users, like sc7180-trogdor devices. If the TCPC
isn't modeled, then these need to continue defaulting to HBR2 since at
least some of the boards have HBR2-only TCPCs.
