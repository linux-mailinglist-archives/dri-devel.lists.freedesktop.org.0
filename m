Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B42A54243DD
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 19:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7263C6EDD1;
	Wed,  6 Oct 2021 17:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7650B6EDCE
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 17:19:10 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id x187so2628404oix.9
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 10:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=KCyDxwCSIkYTEL945Ad8UN+jbcwXEwy+nElDO3WCm5U=;
 b=AcCQ3DwE27wRfzYEcoJxXVjW1mku4CvXcu9MdCy62Hr7YmeiYBzTQAy+8yMD6lGym5
 eAZ/c7o7r1QTE07j3X3gt7PBw7sa8SnF/8tetrqdJeIFscstW6KKcyY/pIXoyxmw0Klp
 laxBS6OFSIKVB/U6uSqU1mY6tQ7ijM0dubGHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=KCyDxwCSIkYTEL945Ad8UN+jbcwXEwy+nElDO3WCm5U=;
 b=am0cVabEaXwXuCqc62jn1yvh6eENF7RcHGD59ZG+bLJAI3hAwMKgvSjmtfn3DnuNLD
 VlM1bb1Pa3P2dX4SDeNATJk6A1cbNBRuhBL6/hfsNZSn/bo1pzRlkaxGUT+B5MRm8b2s
 STt+yg5HPWpw8MO27GrPUEQ90CuWCunIETI58+vXnA11ZJoc+LReDMRlqmPBR6onk7yH
 SAeQl9dqUNM+q2ET3EpzzJ4IChokQiDfuVd3+0Td3oqstxqpIiSQXpFDlDDhDnhOHTy1
 Jlt+ix2TebEZmb9Qln7xzhFamwwUwjvISLid/lQrwY35mOqDN7IsJFrc14r2kkJ3lsk0
 PfZw==
X-Gm-Message-State: AOAM531Jh1yU9H0Wl+OIcr/UbYm1JrgPpkBEebMgg9drxMn2+HIdgLsl
 AdJsx+2YiLD1bg8HpIFJq5QrW8m6nWXIEywmPL7YAw==
X-Google-Smtp-Source: ABdhPJxNO6XyURZRt8S9b/YCR45+rINmMoTOs7+TbO6eaAIXMDIrqSS/NDJZCbj4dbHEgxJbT9Y60pR/hVQnlL87xzc=
X-Received: by 2002:a05:6808:f8f:: with SMTP id
 o15mr8142802oiw.164.1633540749920; 
 Wed, 06 Oct 2021 10:19:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Oct 2021 10:19:09 -0700
MIME-Version: 1.0
In-Reply-To: <YV3XxadYE/KU2w89@ripper>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
 <20211005231323.2663520-6-bjorn.andersson@linaro.org>
 <CAE-0n52gOCC8bUfMFnNHRKFoq2=q4Ho8a-UYH5JKgumguhUD2A@mail.gmail.com>
 <YVz/NOL3AFn2zBA0@ripper>
 <CAE-0n513cs282Dh_YFMHK2uKCVFSWxtNyfRaFwWGyUvpfShixw@mail.gmail.com>
 <YV0MAF/Y5BR1e6My@ripper>
 <CAE-0n53TwEyycpAaWVpRUKPpos4z-gqwrvyUdgobh1V88VUsXg@mail.gmail.com>
 <YV3XxadYE/KU2w89@ripper>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 6 Oct 2021 10:19:09 -0700
Message-ID: <CAE-0n52q=iEhRO1V-ked6SEesJGozLWv-H1mK81oyP7zAeO6QQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] drm/msm/dp: Support up to 3 DP controllers
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Kalyan Thota <kalyan_t@codeaurora.org>, Kuogee Hsieh <khsieh@codeaurora.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-10-06 10:07:17)
> On Tue 05 Oct 21:26 PDT 2021, Stephen Boyd wrote:
>
> > Quoting Bjorn Andersson (2021-10-05 19:37:52)
> > > On Tue 05 Oct 19:06 PDT 2021, Stephen Boyd wrote:
> > >
> > > > Quoting Bjorn Andersson (2021-10-05 18:43:16)
> > > > > On Tue 05 Oct 17:43 PDT 2021, Stephen Boyd wrote:
> > > > >
> > > > > > Quoting Bjorn Andersson (2021-10-05 16:13:21)
> > > > > > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > > > index bdaf227f05dc..674cddfee5b0 100644
> > > > > > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > > > @@ -1233,7 +1239,7 @@ static int dp_display_probe(struct platform_device *pdev)
> > > > > > >         if (!dp)
> > > > > > >                 return -ENOMEM;
> > > > > > >
> > > > > > > -       desc = dp_display_get_desc(pdev);
> > > > > > > +       desc = dp_display_get_desc(pdev, &dp->id);
> > > > > >
> > > > > > I'm sad that dp->id has to match the number in the SoC specific
> > > > > > dpu_intf_cfg array in drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > > > > > still. Is there any way we can avoid that? Also, notice how those arrays
> > > > > > already have INTF_DP macros, which makes me think that it may be better
> > > > > > to connect this to those arrays instead of making an msm_dp_desc
> > > > > > structure and then make sure the 'type' member matches a connector
> > > > > > type number. Otherwise this code is super fragile.
> > > > > >
> > > > >
> > > > > I'm afraid I don't understand what you're proposing. Or which part you
> > > > > consider fragile, the indices of the INTF_DP instances aren't going to
> > > > > move around...
> > > > >
> > > > > I have N instances of the DP driver that I need to match to N entries
> > > > > from the platform specific intf array, I need some stable reference
> > > > > between them. When I started this journey I figured I could rely on the
> > > > > of_graph between the DPU and the interface controllers, but the values
> > > > > used there today are just bogus, so that was a no go.
> > > > >
> > > > > We can use whatever, as long as _dpu_kms_initialize_displayport() can
> > > > > come up with an identifier to put in h_tile_instance[0] so that
> > > > > dpu_encoder_setup_display() can find the relevant INTF.
> > > > >
> > > >
> > > > To make it more concrete we can look at sc7180
> > > >
> > > > static const struct dpu_intf_cfg sc7180_intf[] = {
> > > >         INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24,
> > > > INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > > >                                                      ^
> > > >                                                      |
> > > >
> > > > intf0 is irrelevant. Also the address is irrelevant. But here we have a
> > > > zero, the number after INTF_DP, and that is very relevant. That number
> > > > needs to match the dp->id. Somewhere we have a match between
> > > > controller_id and dp->id in the code.
> > >
> > > That number (the 0, not INTF_0) is what the code matches against dp->id
> > > in _dpu_kms_initialize_displayport(), in order to figure out that this
> > > is INTF_0 in dpu_encoder_setup_display().
> > >
> > > I.e. look at the sc8180x patch:
> > >
> > > INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > > INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > > INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> > > /* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
> > > INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 999, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> > > INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, 1, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> > > INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, 2, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> > >
> > > Where the DP driver defines the 3 controllers with dp->id of 0, 1 and 2,
> > > which the DPU code will match against to INTF_0, INTF_4 and INTF_5.
> > >
> >
> > Yep. I'm saying that having to make that number in this intf array match
> > the order of the register mapping descriptor array is fragile. Why can't
> > we indicate the interface is DP or eDP with INTF_DP or INTF_EDP and then
> > map from the descriptor array to this intf array somehow so that the
> > order of the descriptor array doesn't matter? Then we don't have to put
> > the connector type in the descriptor array, and we don't have to keep
> > the order of the array a certain way to match this intf descriptor.
> >
> > Maybe
> >
> >       struct msm_dp_desc {
> >               phys_addr_t io_start;
> >               unsigned int id;
>
> The INTF_<N> constants are a property of the DPU driver and not
> available in the DP driver and the msm_dp struct is a property of the DP
> driver and can't be dereferenced in the DPU driver.
>
> The proposed way around this is that the descs array defines the order
> in priv->dp[N] and this N is used as controller_id.

I'm pretty sure I'm following along.

>
> So the only thing that I don't find straight forward here is that the
> eDP controller is considered just a DP controller, so you have to use
> INTF_DP, <N> for that, and not just INTF_EDP, 0.
>
> >       };
> >
> > and then have msm_dp_desc::id equal INTF_<N> and then look through the
> > intf from DPU here in the DP driver to find the id and type of connector
> > that should be used by default? Still sort of fragile because the only
> > connection is an unsigned int which isn't great, but at least it's
> > explicit instead of implicit based on the array order.
>
> No matter how I look at this, you need to put some number somewhere here
> that will be used to match up the INTF with the right DSI/DP encoder.

Correct.

>
> Using the proposed number scheme follows the numbering of all the DP
> controllers from the documentation.
>

Maybe I can make a better example. I have this for sc7280 in dpu_hw_catalog.c:

	static const struct dpu_intf_cfg sc7280_intf[] = {
		INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, CONTROLLER_ID_A, 24,
INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
		INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24,
INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
		INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, CONTROLLER_ID_B, 24,
INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
	};

And then this array for sc7280 in dp_display.c:

	static const struct msm_dp_desc sc7280_dp_cfg = {
		.desc = {
			[CONTROLLER_ID_A] = { 0xaea0000, DRM_MODE_CONNECTOR_eDP },
			[CONTROLLER_ID_B] = { 0xae90000, DRM_MODE_CONNECTOR_DisplayPort },
		},
		.num_dp = 2,
	};

So these two arrays must match based on CONTROLLER_ID_{A,B}. I don't
like having to make these two numbers match so if it was explicit, even
possibly by having a bunch of macros put in both places then I would be
happy. I spent a few hours when I messed up the order of the
sc7280_dp_cfg.desc array trying to figure out why things weren't
working.
