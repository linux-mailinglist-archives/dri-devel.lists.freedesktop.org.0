Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 205D07FBF8D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 17:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5623E10E155;
	Tue, 28 Nov 2023 16:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D6D10E155
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 16:49:48 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-db46725a531so4065579276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 08:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701190188; x=1701794988; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GD78XLjf7azY9M1YBLSr3MhFJROFOKxRGQJfpbe9EqI=;
 b=gDgWPKcuzAymdIBSIVbMQ6r29xVW5uddMDDcb2MfWuooYeQNN3MWR9VPBnYUwWaVrg
 NTpvoOmbEwenLgqnBSr/1xpYm7NmjySol2Fbn1qo0AmJO9G9Zo/0unqL9rEIgXeu9qkj
 3V46DMlUwww1cBtbGa9Z5IaJP8UsR0HhVz5aN6xUKpVgsyKntm4a0iwoZufBIpDbOha0
 Le36qpLhb0pQ4NOLquymF56JS+z8q7D+KBtq8ti2cBUAe392QPQbU0B/Udcc5PP91RNP
 YpzKd6xQXfzKyfP5rHXZK65pIFkA6UZNQleEcBjJtOytYKlDn1PrJd9OSB1pqAC7UIHf
 nOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701190188; x=1701794988;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GD78XLjf7azY9M1YBLSr3MhFJROFOKxRGQJfpbe9EqI=;
 b=WaTPK7UjWKg4phjFWHwxpWdqnZkyWey/8ky0uzRkAx92/KFCdsltNAO+a4W9o1W2vf
 oyFb5NeJxQW5Pu3HAQzIfQXjvsFSBkiF4eMWngZ8N6Su5R+L5vBa/ykW6rNAsJj7/Vyn
 TvdZjZWeMTZ0POFRUQOdqOQZFhQeCq2tnqInMeJ5CGqshIRLqJPvk88bAGEEpNEuZ/3g
 jg2/k96HU2UcQKQiobKPSpRsfdQechlRhx3yJ1fgQLCaHIfRev4fJ9ZldmlDMkLVnHHf
 RGZvxFbWX9ok9RD/fi6FreYcBNx2oqlyh4JPwikJh+OpZWIQt/YWX0lu3LID1rbz5X33
 VKcw==
X-Gm-Message-State: AOJu0Yx/V4PvF8c1toIq1KEY95dPPHzTDYrqv5FF2+9kOSpUj6nc6M7q
 UV7Eoigt5oMEIv2+nB77yx4aeP/DEMpEBh2V2AP/4Q==
X-Google-Smtp-Source: AGHT+IHvWlPlRTUJ/I2oNwEaIU1VT4yRPgec2UooToA0iRvEqgCTansBlFO5MCgGr8obm68fHQ3hfvqtxUtgQALcFMs=
X-Received: by 2002:a05:690c:3383:b0:5d0:57a6:5f21 with SMTP id
 fl3-20020a05690c338300b005d057a65f21mr7997955ywb.2.1701190188094; Tue, 28 Nov
 2023 08:49:48 -0800 (PST)
MIME-Version: 1.0
References: <CAA8EJpozZkEswnioKjRCqBg4fcjVHFwGivoFNTNHVwyocKprQw@mail.gmail.com>
 <20231127160658.2164612-1-mwalle@kernel.org>
In-Reply-To: <20231127160658.2164612-1-mwalle@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 Nov 2023 18:49:36 +0200
Message-ID: <CAA8EJpphwXoKnzDkY3cBqzsDZwdw+nze-Ev2toPBJm-2VJvY_g@mail.gmail.com>
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

On Mon, 27 Nov 2023 at 18:07, Michael Walle <mwalle@kernel.org> wrote:
>
> Hi,
>
> > DSI device lifetime has three different stages:
> > 1. before the DSI link being powered up and clocking,
> > 2. when the DSI link is in LP state (for the purpose of this question,
> > this is the time between the DSI link being powered up and the video
> > stream start)
> > 3. when the DSI link is in HS state (while streaming the video).
>
> It's not clear to me what (2) is. What is the state of the clock and
> data lanes?

Clk an Data0 should be in the LP mode, ready for LP Data Transfer.

I don't think we support ULPS currently.


>
> I'm facing similar issues with the tc358775 bridge. This bridge needs
> to release its reset while both clock and data lanes are in LP-11 mode.
> But then it needs to be configured (via I2C) while the clock lane is
> in enabled (HS mode), but the data lanes are still in LP-11 mode.
>
> To me it looks like there is a fouth case then:
> 1. unpowered
> 2. DSI clock and data are in LP-11
> 3. DSI clock is in HS and data are in LP-11
> 4. DSI clock is in HS and data is in HS
>
> (And of course the bridge needs continuous clock mode).
>
> > Different DSI bridges have different requirements with respect to the
> > code being executed at stages 1 and 2. For example several DSI-to-eDP
> > bridges (ps8640, tc358767 require for the link to be quiet during
> > reset time.
> > The DSI-controlled bridges and DSI panels need to send some commands
> > in stage 2, before starting up video
> >
> > In the DRM subsystem stage 3 naturally maps to the
> > drm_bridge_funcs::enable, stage 1 also naturally maps to the
> > drm_bridge_funcs::pre_enable. Stage 2 doesn't have its own place in
> > the DRM call chain.
> > Earlier we attempted to solve that using the pre_enable_prev_first,
> > which remapped pre-enable callback execution order. However it has led
> > us to the two issues. First, at the DSI host driver we do not know
> > whether the panel / bridge were updated to use pre_enable_prev_first
> > or not. Second, if the bridge has to perform steps during both stages
> > 1 and 2, it can not do that.
> >
> > I'm trying to find a way to express the difference between stages 1
> > and 2 in the generic code, so that we do not to worry about particular
> > DSI host and DSI bridge / panel peculiarities when implementing the
> > DSI host and/or DSI panel driver.
>
> For now, I have a rather hacky ".dsi_lp11_notify" callback in
> drm_bridge_funcs which is supposed to be called by the DSI host while the
> clock and data lanes are in LP-11 mode. But that is rather an RFC and me
> needing something to get the driver for this bridge working. Because it's
> badly broken. FWIW, you can find my work-in-progress patches at
> https://github.com/mwalle/linux/tree/feature-tc358775-fixes
>
> -michael
>


--
With best wishes
Dmitry
