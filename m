Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E827424809
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 22:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782C76EE78;
	Wed,  6 Oct 2021 20:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD876EE76
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 20:38:02 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 o27-20020a9d411b000000b005453f95356cso3807596ote.11
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 13:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=z60aFSRGx0ByB0Z/S5Nod4Oslys3m/NDoJpIVRIWCNw=;
 b=bMSN0ps/rC57sD8yDecc/7bjDGG40s9KPEUkJMwtyb48DXyFVVKaw99DNX/t4bFLNQ
 7D2ltCrfBOCDmdCZXs7bOcPUrB931dmmOoyp1bTZ8WXVf7k59doBCbBrZWWaca6K+iT0
 LsPNpEfGxSSyJdFGPs5PzzFjQwSy78guF+VMQ7GTZFlWV6vNsYG7Jkq6+Zg4WoX0nCJC
 OWwrCSesetTa7Tw6oM7M6cfck029beQgY4QwGwPL3IGSUS+uJ3AiPP4wUbpd7LNvWOvV
 6pQsmaARw3ek4+gvA/Ugqijnvwo1DAJkeAgXAHRykv10u5fnPXA17CuX5FZyM6pisunt
 Woiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z60aFSRGx0ByB0Z/S5Nod4Oslys3m/NDoJpIVRIWCNw=;
 b=Xlls8Vr3ql0wwDsre9wdDRyfRcGsxbjeC/0Qvzofpeu1q1sVTrDW5OIw4yz+IJQBx4
 4Q/C6ImAwncrZLc16nKGMP+zYIh5mb6obeFCExlaTcSu6DemudBzlSmivUQz0iU5B2Hx
 kozHJMZrulH96Qy6hz81+E9m8dOQ0Oo6lB4l++JJqh7v6Z5SLR6gfe3ST026InBTUErv
 l+8VarLL61M506e+LPZJ3m6AVQKFlFe8MinKTBbDNIBamuZHIjm21DgBDG1m09IS0VI+
 x0KYjfTAc8As4qYO8Hj0s9eIMQnfcBh+5VSAHbi0gLZtJ3Y8QlTj8AGyYteykj++wg/z
 +n6A==
X-Gm-Message-State: AOAM533aUDOEh4qbd+tTMaiANEwy/Nery9hISEsU+BPRlSQZoWvIHdH5
 C6ACcohk7Bg4YxNhxHbLWoeXTQ==
X-Google-Smtp-Source: ABdhPJz+HEl4pR76e6CTjyNRya7MHTPoztvqelL40AQ/FLSuz3aYtw7gxlq5qMFYEhC7T1esU+omUQ==
X-Received: by 2002:a9d:1b7:: with SMTP id e52mr313487ote.210.1633552682117;
 Wed, 06 Oct 2021 13:38:02 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id y17sm183023oto.42.2021.10.06.13.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:38:01 -0700 (PDT)
Date: Wed, 6 Oct 2021 13:39:42 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/7] drm/msm/dp: Support up to 3 DP controllers
Message-ID: <YV4JjutldSujvoT8@ripper>
References: <20211005231323.2663520-6-bjorn.andersson@linaro.org>
 <CAE-0n52gOCC8bUfMFnNHRKFoq2=q4Ho8a-UYH5JKgumguhUD2A@mail.gmail.com>
 <YVz/NOL3AFn2zBA0@ripper>
 <CAE-0n513cs282Dh_YFMHK2uKCVFSWxtNyfRaFwWGyUvpfShixw@mail.gmail.com>
 <YV0MAF/Y5BR1e6My@ripper>
 <CAE-0n53TwEyycpAaWVpRUKPpos4z-gqwrvyUdgobh1V88VUsXg@mail.gmail.com>
 <YV3XxadYE/KU2w89@ripper>
 <CAE-0n52q=iEhRO1V-ked6SEesJGozLWv-H1mK81oyP7zAeO6QQ@mail.gmail.com>
 <YV3lVWjct5RQ5FEK@ripper>
 <CAE-0n537_YLDkWOX0kBHZHPHMi4-XTODeJ8TB=_xOrZwJc1HfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n537_YLDkWOX0kBHZHPHMi4-XTODeJ8TB=_xOrZwJc1HfQ@mail.gmail.com>
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

On Wed 06 Oct 11:59 PDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-10-06 11:05:09)
> > On Wed 06 Oct 10:19 PDT 2021, Stephen Boyd wrote:
> >
> > > Quoting Bjorn Andersson (2021-10-06 10:07:17)
> > > > On Tue 05 Oct 21:26 PDT 2021, Stephen Boyd wrote:
> > > >
> > > > > Quoting Bjorn Andersson (2021-10-05 19:37:52)
> > > > > > On Tue 05 Oct 19:06 PDT 2021, Stephen Boyd wrote:
> > > > > >
> > > > > > > Quoting Bjorn Andersson (2021-10-05 18:43:16)
> > > > > > > > On Tue 05 Oct 17:43 PDT 2021, Stephen Boyd wrote:
> > > > > > > >
> > > > > > > > > Quoting Bjorn Andersson (2021-10-05 16:13:21)
> > > > > > > > > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > > > > > > index bdaf227f05dc..674cddfee5b0 100644
> > > > > > > > > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > > > > > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > > > > > > @@ -1233,7 +1239,7 @@ static int dp_display_probe(struct platform_device *pdev)
> > > > > > > > > >         if (!dp)
> > > > > > > > > >                 return -ENOMEM;
> > > > > > > > > >
> > > > > > > > > > -       desc = dp_display_get_desc(pdev);
> > > > > > > > > > +       desc = dp_display_get_desc(pdev, &dp->id);
> > > > > > > > >
> > > > > > > > > I'm sad that dp->id has to match the number in the SoC specific
> > > > > > > > > dpu_intf_cfg array in drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > > > > > > > > still. Is there any way we can avoid that? Also, notice how those arrays
> > > > > > > > > already have INTF_DP macros, which makes me think that it may be better
> > > > > > > > > to connect this to those arrays instead of making an msm_dp_desc
> > > > > > > > > structure and then make sure the 'type' member matches a connector
> > > > > > > > > type number. Otherwise this code is super fragile.
> > > > > > > > >
> > > > > > > >
> > > > > > > > I'm afraid I don't understand what you're proposing. Or which part you
> > > > > > > > consider fragile, the indices of the INTF_DP instances aren't going to
> > > > > > > > move around...
> > > > > > > >
> > > > > > > > I have N instances of the DP driver that I need to match to N entries
> > > > > > > > from the platform specific intf array, I need some stable reference
> > > > > > > > between them. When I started this journey I figured I could rely on the
> > > > > > > > of_graph between the DPU and the interface controllers, but the values
> > > > > > > > used there today are just bogus, so that was a no go.
> > > > > > > >
> > > > > > > > We can use whatever, as long as _dpu_kms_initialize_displayport() can
> > > > > > > > come up with an identifier to put in h_tile_instance[0] so that
> > > > > > > > dpu_encoder_setup_display() can find the relevant INTF.
> > > > > > > >
> > > > > > >
> > > > > > > To make it more concrete we can look at sc7180
> > > > > > >
> > > > > > > static const struct dpu_intf_cfg sc7180_intf[] = {
> > > > > > >         INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24,
> > > > > > > INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > > > > > >                                                      ^
> > > > > > >                                                      |
> > > > > > >
> > > > > > > intf0 is irrelevant. Also the address is irrelevant. But here we have a
> > > > > > > zero, the number after INTF_DP, and that is very relevant. That number
> > > > > > > needs to match the dp->id. Somewhere we have a match between
> > > > > > > controller_id and dp->id in the code.
> > > > > >
> > > > > > That number (the 0, not INTF_0) is what the code matches against dp->id
> > > > > > in _dpu_kms_initialize_displayport(), in order to figure out that this
> > > > > > is INTF_0 in dpu_encoder_setup_display().
> > > > > >
> > > > > > I.e. look at the sc8180x patch:
> > > > > >
> > > > > > INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > > > > > INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > > > > > INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> > > > > > /* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
> > > > > > INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 999, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> > > > > > INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, 1, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> > > > > > INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, 2, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> > > > > >
> > > > > > Where the DP driver defines the 3 controllers with dp->id of 0, 1 and 2,
> > > > > > which the DPU code will match against to INTF_0, INTF_4 and INTF_5.
> > > > > >
> > > > >
> > > > > Yep. I'm saying that having to make that number in this intf array match
> > > > > the order of the register mapping descriptor array is fragile. Why can't
> > > > > we indicate the interface is DP or eDP with INTF_DP or INTF_EDP and then
> > > > > map from the descriptor array to this intf array somehow so that the
> > > > > order of the descriptor array doesn't matter? Then we don't have to put
> > > > > the connector type in the descriptor array, and we don't have to keep
> > > > > the order of the array a certain way to match this intf descriptor.
> > > > >
> > > > > Maybe
> > > > >
> > > > >       struct msm_dp_desc {
> > > > >               phys_addr_t io_start;
> > > > >               unsigned int id;
> > > >
> > > > The INTF_<N> constants are a property of the DPU driver and not
> > > > available in the DP driver and the msm_dp struct is a property of the DP
> > > > driver and can't be dereferenced in the DPU driver.
> > > >
> > > > The proposed way around this is that the descs array defines the order
> > > > in priv->dp[N] and this N is used as controller_id.
> > >
> > > I'm pretty sure I'm following along.
> > >
> > > >
> > > > So the only thing that I don't find straight forward here is that the
> > > > eDP controller is considered just a DP controller, so you have to use
> > > > INTF_DP, <N> for that, and not just INTF_EDP, 0.
> > > >
> > > > >       };
> > > > >
> > > > > and then have msm_dp_desc::id equal INTF_<N> and then look through the
> > > > > intf from DPU here in the DP driver to find the id and type of connector
> > > > > that should be used by default? Still sort of fragile because the only
> > > > > connection is an unsigned int which isn't great, but at least it's
> > > > > explicit instead of implicit based on the array order.
> > > >
> > > > No matter how I look at this, you need to put some number somewhere here
> > > > that will be used to match up the INTF with the right DSI/DP encoder.
> > >
> > > Correct.
> > >
> > > >
> > > > Using the proposed number scheme follows the numbering of all the DP
> > > > controllers from the documentation.
> > > >
> > >
> > > Maybe I can make a better example. I have this for sc7280 in dpu_hw_catalog.c:
> > >
> > >       static const struct dpu_intf_cfg sc7280_intf[] = {
> > >               INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, CONTROLLER_ID_A, 24,
> > > INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > >               INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24,
> > > INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > >               INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, CONTROLLER_ID_B, 24,
> > > INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> > >       };
> > >
> > > And then this array for sc7280 in dp_display.c:
> > >
> > >       static const struct msm_dp_desc sc7280_dp_cfg = {
> > >               .desc = {
> > >                       [CONTROLLER_ID_A] = { 0xaea0000, DRM_MODE_CONNECTOR_eDP },
> > >                       [CONTROLLER_ID_B] = { 0xae90000, DRM_MODE_CONNECTOR_DisplayPort },
> > >               },
> > >               .num_dp = 2,
> > >       };
> > >
> > > So these two arrays must match based on CONTROLLER_ID_{A,B}. I don't
> > > like having to make these two numbers match so if it was explicit, even
> > > possibly by having a bunch of macros put in both places then I would be
> > > happy. I spent a few hours when I messed up the order of the
> > > sc7280_dp_cfg.desc array trying to figure out why things weren't
> > > working.
> >
> > So essentially, you didn't know that the controller_id has to match the
> > index in priv->dsi[] and priv->dp[] and providing a define for them
> > would make this more obvious?
> 
> Now you got it!
> 
> >
> > I think per your argument the 0 following INTF_DSI should also be using
> > this scheme, so we'd have multiple CONTROLLER_ID_A, which probably is
> > confusing as well.
> 
> Agreed.
> 
> >
> > I tried it out with below patch; it documents the relationship, provides
> > constants for the magic 2 and 3 for number of DSI and DP controllers in
> > struct msm_drm_private.
> >
> > I like it.
> 
> Thanks. I prefer this approach as well.

Sweet, I'll update my patch set accordingly.

> I can see now why qcom always wants to change the output ports on the
> DPU node in DT to match the INTF number. If they would have described
> this problem it may have made sense to have the graph endpoints with
> reg properties matching the interface number in the intf array. Sigh.

Yes, I think the supposed design is that you should use the of_graph and
then call of_find_possible_crtcs() to figure out your links.

Unfortunately that doesn't work with the design of the DPU driver,
because the crtcs doesn't represent the INTFs - and as you say, the
existing of_graphs are full of incorrect data.

Which also means that I don't know why we keep filling out the of_graph,
because afaict it's not used and it contains invalid information.

Thanks,
Bjorn
