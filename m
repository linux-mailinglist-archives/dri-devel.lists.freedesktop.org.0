Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 434507FC965
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 23:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35B810E048;
	Tue, 28 Nov 2023 22:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A2D10E34E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 22:22:03 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-5cc86fcea4fso50715157b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 14:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701210122; x=1701814922; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Mk6ahWEiYW0EiuwZrrmCv2lSUHnUEn9tTh+rrhzL628=;
 b=bOnaraxHMQW8v5M6fukR060totPYli80UTIuiHrxxb8XBa/anKmvMrBuz1WQs+m82C
 jFNeYMJ8E0pZs43gHDeTZOz5co4LmrWfRn4UyGOsO5g6EUu3sefWU+lOw502+1fkg793
 Vz2lxGhZungeYEA7voM72f7BCzeBzB7ZLA2yhqWqzvKg2aqrKM+PVRP/I/1IWtrNlXSS
 697vBlpbR5m/JIjmUw3/Dn4uuNG7ADPaSQsA+dFpAiW1h1fiy7jGWwdU32NvulnCuNF6
 Uq9RsowgLM2oPFRBLxAtcVjqhVf5q0b5fFcV6XGm/KWKhvTqwMxEOGS9AkXhZGRrKGIg
 JIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701210122; x=1701814922;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mk6ahWEiYW0EiuwZrrmCv2lSUHnUEn9tTh+rrhzL628=;
 b=jKnhctHfuW37j2/IWxSMYAKTdCc5htZ/H4Nc71ECzCbAk6notpG6wZ8nRNRs9zftRR
 Avrema+06MnotEiCD1SZ1LkIShhrvIvYzCDZNOCPPhAhnpl+/EVb5JbT89eT1MmL+8iH
 kIyVW3+Z/2zE5mFU8daTgDCmEexWFxAsHtQ8LY1Z12puOViGCrJiETaQ/oE9AZI4DqHk
 gD4FZPu7/a4gmSFvOsCnPv/C4i2ORFDHeWdW7aqPVPuR/LljC4l1ICSCn9IuZ21U71uX
 HwVbf/JdZsUJmATTvfMemIWrBB1vVWc4ihbpvyhGqSfZgWX1kblBojA+tZ+WhfsPbgOr
 Yo6w==
X-Gm-Message-State: AOJu0YxubaZWKBKS3EwwUhl/vpPslgqtCXfspohjdnQKpXx2PVV9j+xH
 HjESqZknTtCAFNGDTHDuqBYUK1Pkt/qLNomLPB1PCg==
X-Google-Smtp-Source: AGHT+IFCE/RveG3NkcbMdWxIPAVZnZxK5nKvEpcaJfQWMsQelk2Pdd6J6nJYlOQyr0GgqorInuHMTDy3FVh7KiKzg6A=
X-Received: by 2002:a0d:d40f:0:b0:5cb:accf:ff1d with SMTP id
 w15-20020a0dd40f000000b005cbaccfff1dmr15164526ywd.25.1701210122379; Tue, 28
 Nov 2023 14:22:02 -0800 (PST)
MIME-Version: 1.0
References: <CAA8EJpozZkEswnioKjRCqBg4fcjVHFwGivoFNTNHVwyocKprQw@mail.gmail.com>
 <20231127160658.2164612-1-mwalle@kernel.org>
 <CAA8EJpphwXoKnzDkY3cBqzsDZwdw+nze-Ev2toPBJm-2VJvY_g@mail.gmail.com>
 <dce76a6e1321a6374ad39125bead56b3@kernel.org>
 <CAA8EJpr9PDgSrTpP2-joQ09fxmJKZB1B+ESbDbMjkLNiqZ1m3A@mail.gmail.com>
 <14D9F495-425D-47FA-AD0D-F7299285936F@walle.cc>
 <CAA8EJpoYkH-0onMmNRk1iO5YeLN+5hpZMsfvtNo-7p6y2mjZwg@mail.gmail.com>
 <5eeade839ad3f71e8976965ce6cf3ed2@walle.cc>
In-Reply-To: <5eeade839ad3f71e8976965ce6cf3ed2@walle.cc>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 29 Nov 2023 00:21:51 +0200
Message-ID: <CAA8EJppAhfm4FK4z_B=h9+o7LScjCyUD0XvdzQCe6tjrRx5KbA@mail.gmail.com>
Subject: Re: [RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over
 the DSI link power state
To: Michael Walle <michael@walle.cc>
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
Cc: Michael Walle <mwalle@kernel.org>, tony@atomide.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 marijn.suijten@somainline.org, marex@denx.de, rfoss@kernel.org,
 dave.stevenson@raspberrypi.com, jernej.skrabec@gmail.com,
 alexander.stein@ew.tq-group.com, quic_jesszhan@quicinc.com, jonas@kwiboo.se,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org,
 sean@poorly.run, neil.armstrong@linaro.org, dianders@chromium.org,
 konrad.dybcio@linaro.org, tzimmermann@suse.de, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Nov 2023 at 00:20, Michael Walle <michael@walle.cc> wrote:
>
> [sorry I fat fingered my former reply and converted all CCs to BCCs..]
>
> >> >> >> > DSI device lifetime has three different stages:
> >> >> >> > 1. before the DSI link being powered up and clocking,
> >> >> >> > 2. when the DSI link is in LP state (for the purpose of this question,
> >> >> >> > this is the time between the DSI link being powered up and the video
> >> >> >> > stream start)
> >> >> >> > 3. when the DSI link is in HS state (while streaming the video).
> >> >> >>
> >> >> >> It's not clear to me what (2) is. What is the state of the clock and
> >> >> >> data lanes?
> >> >> >
> >> >> > Clk an Data0 should be in the LP mode, ready for LP Data Transfer.
> >> >>
> >> >> Then this is somehow missing
> >> >> https://docs.kernel.org/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation
> >> >>
> >> >>    A DSI host should keep the PHY powered down until the pre_enable
> >> >> operation
> >> >>    is called. All lanes are in an undefined idle state up to this point,
> >> >> and
> >> >>    it must not be assumed that it is LP-11. pre_enable should initialise
> >> >> the
> >> >>    PHY, set the data lanes to LP-11, and the clock lane to either LP-11
> >> >> or HS
> >> >>    depending on the mode_flag MIPI_DSI_CLOCK_NON_CONTINUOUS.
> >> >>
> >> >> So I don't think these three states are sufficient, see below, that
> >> >> there
> >> >> should be at least four.
> >> >
> >> >Which one is #4?
> >>
> >> enabled clock lane (HS mode), data lanes in LP-11
> >
> > What is the purpose of such a mode?
>
> To repeat my first mail:

Excuse me please, I either missed it, or forgot it.

>
> I'm facing similar issues with the tc358775 bridge. This bridge needs
> to release its reset while both clock and data lanes are in LP-11
> mode.
> But then it needs to be configured (via I2C) while the clock lane is
> in enabled (HS mode), but the data lanes are still in LP-11 mode.

This is quite an interesting requirement. For example, I'm not 100%
sure whether we can get that done on our (msm) hosts. I need to double
check that.
What frequency is expected on the CLK lane? Can it be an arbitrary
frequency or it should be the same freq as the one used later for the
video transfer?

>
> Therefore, for the correct init sequence is:
> (1) dsi host enables lanes, that is clock and data are in lp-11
> (2) dsi bridge driver releases reset of the bridge
> (3) dsi host enables clock lane, leaves data lanes in lp-11
> (4) dsi bridge driver configures the bridge
> (5) dsi host enables the video stream
> (6) dsi bridge enables the output port of the bridge
>
> -michael
>
> >> >> > I don't think we support ULPS currently.
> >> >> >
> >> >> >
> >> >> >>
> >> >> >> I'm facing similar issues with the tc358775 bridge. This bridge needs
> >> >> >> to release its reset while both clock and data lanes are in LP-11
> >> >> >> mode.
> >> >> >> But then it needs to be configured (via I2C) while the clock lane is
> >> >> >> in enabled (HS mode), but the data lanes are still in LP-11 mode.
> >> >> >>
> >> >> >> To me it looks like there is a fouth case then:
> >> >> >> 1. unpowered
> >> >> >> 2. DSI clock and data are in LP-11
> >> >> >> 3. DSI clock is in HS and data are in LP-11
> >> >> >> 4. DSI clock is in HS and data is in HS
> >> >> >>
> >> >> >> (And of course the bridge needs continuous clock mode).
> >> >> >>
> >> >> >> > Different DSI bridges have different requirements with respect to the
> >> >> >> > code being executed at stages 1 and 2. For example several DSI-to-eDP
> >> >> >> > bridges (ps8640, tc358767 require for the link to be quiet during
> >> >> >> > reset time.
> >> >> >> > The DSI-controlled bridges and DSI panels need to send some commands
> >> >> >> > in stage 2, before starting up video
> >> >> >> >
> >> >> >> > In the DRM subsystem stage 3 naturally maps to the
> >> >> >> > drm_bridge_funcs::enable, stage 1 also naturally maps to the
> >> >> >> > drm_bridge_funcs::pre_enable. Stage 2 doesn't have its own place in
> >> >> >> > the DRM call chain.
> >> >> >> > Earlier we attempted to solve that using the pre_enable_prev_first,
> >> >> >> > which remapped pre-enable callback execution order. However it has led
> >> >> >> > us to the two issues. First, at the DSI host driver we do not know
> >> >> >> > whether the panel / bridge were updated to use pre_enable_prev_first
> >> >> >> > or not. Second, if the bridge has to perform steps during both stages
> >> >> >> > 1 and 2, it can not do that.
> >> >> >> >
> >> >> >> > I'm trying to find a way to express the difference between stages 1
> >> >> >> > and 2 in the generic code, so that we do not to worry about particular
> >> >> >> > DSI host and DSI bridge / panel peculiarities when implementing the
> >> >> >> > DSI host and/or DSI panel driver.
> >> >> >>
> >> >> >> For now, I have a rather hacky ".dsi_lp11_notify" callback in
> >> >> >> drm_bridge_funcs which is supposed to be called by the DSI host while
> >> >> >> the
> >> >> >> clock and data lanes are in LP-11 mode. But that is rather an RFC and
> >> >> >> me
> >> >> >> needing something to get the driver for this bridge working. Because
> >> >> >> it's
> >> >> >> badly broken. FWIW, you can find my work-in-progress patches at
> >> >> >> https://github.com/mwalle/linux/tree/feature-tc358775-fixes
> >> >> >>
> >> >> >> -michael
> >> >> >>
> >> >> >
> >> >> >
> >> >> > --
> >> >> > With best wishes
> >> >> > Dmitry
> >> >
> >> >
> >> >
> >>



-- 
With best wishes
Dmitry
