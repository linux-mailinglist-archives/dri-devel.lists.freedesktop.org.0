Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B40A57FC012
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 18:12:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578B210E15F;
	Tue, 28 Nov 2023 17:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2499710E15F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 17:12:41 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-da7ea62e76cso5582475276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 09:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701191560; x=1701796360; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mgBZ8Y+rNOoLuSl7x3moNxTVYzOfvoDEGWK6S2+IbSQ=;
 b=ABuPd7sxaKKLoLbQFkLl+RJ26c6sOuWEzgvjV1hv1oahmBz8BWyhL6pxi2eEoOj9SD
 miTVbjGARB6jPLplOUlsZHgVgxvE2jShRgHLz+uBUqSLcEirFl9CLIzp8tL480jI2XTH
 bH962ojtQ747k9WnVrPWNkd3noeQkebS+edD3jcqzl7kVq4Na+bdcZHdqa60WRDjQp0Z
 BAxHWBr/KPDrvazh0K9DLHskWJ+Uf1owaT5t8e8egG6mtaWNo6JLatmlb1BrPy3yWOsO
 c4K5mBic1h+B3S7iKzGxGxvijQiZMb8DLZaqhdj+ObSIgf/Jw7Xp/3N/Q7rxpgbg8s2y
 FwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701191560; x=1701796360;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mgBZ8Y+rNOoLuSl7x3moNxTVYzOfvoDEGWK6S2+IbSQ=;
 b=lPjuO7oLpMhbdctmTzgT+rGw6dFfyda/YRiNuJQs1RmXX3O6LC/zUqoUO3PUvUwyOf
 J0x7V0d+/BmlCuUxcCEMpaBGVU+EwlDraXCJyhldDh6vcdqlKBXol5DVtdEg0hc+Q9Zt
 dh+vPYpytyWB9KJPc40AqQKfldYmvE4gxlwCyVgzCAugBcJEdy8ntEKOhE9CEVQxF4mQ
 h0c/DQjulh/oxekRegMgBGziUeHNEQ6IsYarBBMWQozryg9DDQbuozxRuZDQpsNiWZ9k
 NW20MH10NqGxruS7WYuZ3rOX9/RugagmN80YHh2NSfIdyfqyOzTBw9sPjOnCJsRDPs67
 MT8g==
X-Gm-Message-State: AOJu0YwnFYYiVsxP2qhKNe0en6uDljW60t+OBeu5cfAnb+/x0g8sHDr2
 DbEveZoHOX36TNbNpvRVQW9QIXWe4J8pCOEaGRKgMQ==
X-Google-Smtp-Source: AGHT+IGeEkp7jRoTTCguYASiA5X3yJvWFiHTpeQCCzm04ulwl10C5sz2jB4Pa75elxnx/YrTQRyoZ1k8B5sJyf3OsLA=
X-Received: by 2002:a25:fc04:0:b0:d9a:6855:14cd with SMTP id
 v4-20020a25fc04000000b00d9a685514cdmr16604075ybd.39.1701191560067; Tue, 28
 Nov 2023 09:12:40 -0800 (PST)
MIME-Version: 1.0
References: <CAA8EJpozZkEswnioKjRCqBg4fcjVHFwGivoFNTNHVwyocKprQw@mail.gmail.com>
 <20231127160658.2164612-1-mwalle@kernel.org>
 <CAA8EJpphwXoKnzDkY3cBqzsDZwdw+nze-Ev2toPBJm-2VJvY_g@mail.gmail.com>
 <dce76a6e1321a6374ad39125bead56b3@kernel.org>
In-Reply-To: <dce76a6e1321a6374ad39125bead56b3@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 Nov 2023 19:12:29 +0200
Message-ID: <CAA8EJpr9PDgSrTpP2-joQ09fxmJKZB1B+ESbDbMjkLNiqZ1m3A@mail.gmail.com>
Subject: Re: [RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over
 the DSI link power state
To: Michael Walle <mwalle@kernel.org>
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
Cc: tony@atomide.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, marijn.suijten@somainline.org, marex@denx.de,
 rfoss@kernel.org, dave.stevenson@raspberrypi.com, jernej.skrabec@gmail.com,
 alexander.stein@ew.tq-group.com, quic_jesszhan@quicinc.com, jonas@kwiboo.se,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org,
 sean@poorly.run, neil.armstrong@linaro.org, dianders@chromium.org,
 konrad.dybcio@linaro.org, tzimmermann@suse.de, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Nov 2023 at 18:56, Michael Walle <mwalle@kernel.org> wrote:
>
> >> > DSI device lifetime has three different stages:
> >> > 1. before the DSI link being powered up and clocking,
> >> > 2. when the DSI link is in LP state (for the purpose of this question,
> >> > this is the time between the DSI link being powered up and the video
> >> > stream start)
> >> > 3. when the DSI link is in HS state (while streaming the video).
> >>
> >> It's not clear to me what (2) is. What is the state of the clock and
> >> data lanes?
> >
> > Clk an Data0 should be in the LP mode, ready for LP Data Transfer.
>
> Then this is somehow missing
> https://docs.kernel.org/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation
>
>    A DSI host should keep the PHY powered down until the pre_enable
> operation
>    is called. All lanes are in an undefined idle state up to this point,
> and
>    it must not be assumed that it is LP-11. pre_enable should initialise
> the
>    PHY, set the data lanes to LP-11, and the clock lane to either LP-11
> or HS
>    depending on the mode_flag MIPI_DSI_CLOCK_NON_CONTINUOUS.
>
> So I don't think these three states are sufficient, see below, that
> there
> should be at least four.

Which one is #4?

>
> -michael
>
> >
> > I don't think we support ULPS currently.
> >
> >
> >>
> >> I'm facing similar issues with the tc358775 bridge. This bridge needs
> >> to release its reset while both clock and data lanes are in LP-11
> >> mode.
> >> But then it needs to be configured (via I2C) while the clock lane is
> >> in enabled (HS mode), but the data lanes are still in LP-11 mode.
> >>
> >> To me it looks like there is a fouth case then:
> >> 1. unpowered
> >> 2. DSI clock and data are in LP-11
> >> 3. DSI clock is in HS and data are in LP-11
> >> 4. DSI clock is in HS and data is in HS
> >>
> >> (And of course the bridge needs continuous clock mode).
> >>
> >> > Different DSI bridges have different requirements with respect to the
> >> > code being executed at stages 1 and 2. For example several DSI-to-eDP
> >> > bridges (ps8640, tc358767 require for the link to be quiet during
> >> > reset time.
> >> > The DSI-controlled bridges and DSI panels need to send some commands
> >> > in stage 2, before starting up video
> >> >
> >> > In the DRM subsystem stage 3 naturally maps to the
> >> > drm_bridge_funcs::enable, stage 1 also naturally maps to the
> >> > drm_bridge_funcs::pre_enable. Stage 2 doesn't have its own place in
> >> > the DRM call chain.
> >> > Earlier we attempted to solve that using the pre_enable_prev_first,
> >> > which remapped pre-enable callback execution order. However it has led
> >> > us to the two issues. First, at the DSI host driver we do not know
> >> > whether the panel / bridge were updated to use pre_enable_prev_first
> >> > or not. Second, if the bridge has to perform steps during both stages
> >> > 1 and 2, it can not do that.
> >> >
> >> > I'm trying to find a way to express the difference between stages 1
> >> > and 2 in the generic code, so that we do not to worry about particular
> >> > DSI host and DSI bridge / panel peculiarities when implementing the
> >> > DSI host and/or DSI panel driver.
> >>
> >> For now, I have a rather hacky ".dsi_lp11_notify" callback in
> >> drm_bridge_funcs which is supposed to be called by the DSI host while
> >> the
> >> clock and data lanes are in LP-11 mode. But that is rather an RFC and
> >> me
> >> needing something to get the driver for this bridge working. Because
> >> it's
> >> badly broken. FWIW, you can find my work-in-progress patches at
> >> https://github.com/mwalle/linux/tree/feature-tc358775-fixes
> >>
> >> -michael
> >>
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
