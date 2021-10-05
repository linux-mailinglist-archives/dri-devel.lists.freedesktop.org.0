Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B0B422356
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 12:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE996E3CE;
	Tue,  5 Oct 2021 10:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EBD6E3AE
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 10:25:34 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id e12so16163516wra.4
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 03:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UidU0tRecWKIyWZB25SphcL391P9qPyFUm9Ge8l4mYA=;
 b=VJJEvAdqnirP0BimBdBM4MhlIT0OFG+t941bzFTJnoXHHeOE6gE2MOwJ6tO011hWg1
 IJVxT2iiPVUzTRojLD6xGEhBWGVizlWkPzGY0HEbVvRw6PkHyWTdW77lBL3dQbpY1efy
 RmjFaQY/WAGhtd6r2N9BtcTH8jk40Sgf0OH4LG9SQNw1WSl54RLYy9y5wZLTRK2gvdTh
 2fEopg9IiC71RkztEaUOa/uGWqfrRc3T5hDqXcbKYQ5wwDoDWUtDieY4S3iCgMaeKwKx
 Qf63T6Qn7HPwR9ujBziCOR4DiZPkfJfBVHeL79AhWoX4/NCcLyBYm2gejuetC3o4j7ki
 CKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UidU0tRecWKIyWZB25SphcL391P9qPyFUm9Ge8l4mYA=;
 b=zuCAaxA8rYtxpsqbS4lwWcNXe+plv2yT9VutpwIoxYPdhBRscUExEkMSx00oorTVjh
 xPKYODTtKmaY9B1N/UR1nMPIACUXWQuTNQIVFdq0NgAZMHPl8TuLKci7QSt4cVuJcUFR
 BhFgEdE8+mFph70u+vRRRa93EASJVqwluxp4LdvQaa8n26TP5mOiq+Jy4R7z4ASrCYgS
 Z+r9SRP4erJHJ6Wn/Tog/tYyb5bfZbf6fBGBXVEn/Q469o6h8ANE8Csu/eF3HTUfGlbK
 yt1K8Yyp7PoH4D3hKh82/h56FSv8TBK6Smrmm/8XyKsMzS/JAJ4f47QzgHuk6Kl9lZug
 XOFA==
X-Gm-Message-State: AOAM530XBjmk7/VxkoX176ayCoUs4lNMdWrIvetpUoeHRRtfwyADGi8I
 lOcuY8U2XBrhC9JkvBj/OggbtTYAFAwC8j1Ue9QhD4cjOqY=
X-Google-Smtp-Source: ABdhPJwdX4CWG/kQ5UoZSIEeof6zDUf6rLyUrJvkiqxpYzeZa6jnfmWbOgXxP4uZNEsoSSLoXbl8raJLAUORK07GLSs=
X-Received: by 2002:adf:aa88:: with SMTP id h8mr6885302wrc.112.1633429532787; 
 Tue, 05 Oct 2021 03:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210907023948.871281-1-marex@denx.de>
 <CGME20210907073151eucas1p196543fbd114f34f6de700013fd0e4168@eucas1p1.samsung.com>
 <2f530ec2-3781-67eb-6f34-c7b6a29641ea@samsung.com>
 <6544aaba-a3e3-f3f6-32d9-5c396df52601@denx.de>
 <9b3d6595-0330-f716-b443-95f3f4783ac4@samsung.com>
 <2bf8e1fe-3f55-85ab-715a-c53ad98bb6d2@denx.de>
 <CAPY8ntBVdvHSofXcd7nU5Z4uCMUzmiMF3GmJn=VpLDVoe6xL2g@mail.gmail.com>
 <6700c90f-d0e0-5cbf-1616-0c1d158441b1@samsung.com>
In-Reply-To: <6700c90f-d0e0-5cbf-1616-0c1d158441b1@samsung.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 5 Oct 2021 11:25:16 +0100
Message-ID: <CAPY8ntDAATwgK24msPbXo7RKP0JKB9x-CKccLV-NQWxpzHPC_g@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Check link status register
 after enabling the bridge
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Marek Vasut <marex@denx.de>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Robert Foss <robert.foss@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
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

Hi Andrzej

Sorry, I'm just coming back to this. I'd started this reply a while
back, but got sidetracked onto other priorities and not sent it.

On Wed, 8 Sept 2021 at 22:14, Andrzej Hajda <a.hajda@samsung.com> wrote:
>
>
> W dniu 08.09.2021 o 13:11, Dave Stevenson pisze:
> > Hi Marek and Andrzej
> >
> > On Tue, 7 Sept 2021 at 22:24, Marek Vasut <marex@denx.de> wrote:
> >> On 9/7/21 7:29 PM, Andrzej Hajda wrote:
> >>> W dniu 07.09.2021 o 16:25, Marek Vasut pisze:
> >>>> On 9/7/21 9:31 AM, Andrzej Hajda wrote:
> >>>>> On 07.09.2021 04:39, Marek Vasut wrote:
> >>>>>> In rare cases, the bridge may not start up correctly, which usually
> >>>>>> leads to no display output. In case this happens, warn about it in
> >>>>>> the kernel log.
> >>>>>>
> >>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
> >>>>>> Cc: Jagan Teki <jagan@amarulasolutions.com>
> >>>>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>>>> Cc: Linus Walleij <linus.walleij@linaro.org>
> >>>>>> Cc: Robert Foss <robert.foss@linaro.org>
> >>>>>> Cc: Sam Ravnborg <sam@ravnborg.org>
> >>>>>> Cc: dri-devel@lists.freedesktop.org
> >>>>>> ---
> >>>>>> NOTE: See the following:
> >>>>>> https://e2e.ti.com/support/interface-group/interface/f/interface-forum/942005/sn65dsi83-dsi83-lvds-bridge---sporadic-behavior---no-video
> >>>>>>
> >>>>>> https://community.nxp.com/t5/i-MX-Processors/i-MX8M-MIPI-DSI-Interface-LVDS-Bridge-Initialization/td-p/1156533
> >>>>>>
> >>>>>> ---
> >>>>>>      drivers/gpu/drm/bridge/ti-sn65dsi83.c | 5 +++++
> >>>>>>      1 file changed, 5 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> >>>>>> b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> >>>>>> index a32f70bc68ea4..4ea71d7f0bfbc 100644
> >>>>>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> >>>>>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> >>>>>> @@ -520,6 +520,11 @@ static void sn65dsi83_atomic_enable(struct
> >>>>>> drm_bridge *bridge,
> >>>>>>          /* Clear all errors that got asserted during initialization. */
> >>>>>>          regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
> >>>>>>          regmap_write(ctx->regmap, REG_IRQ_STAT, pval);
> >>>>>
> >>>>> It does not look as correct error handling, maybe it would be good to
> >>>>> analyze and optionally report 'unexpected' errors here as well.
> >>>> The above is correct -- it clears the status register because the
> >>>> setup might've set random bits in that register. Then we wait a bit,
> >>>> let the link run, and read them again to get the real link status in
> >>>> this new piece of code below, hence the usleep_range there. And then
> >>>> if the link indicates a problem, we know it is a problem.
> >>>
> >>> Usually such registers are cleared on very beginning of the
> >>> initialization, and tested (via irq handler, or via reading), during
> >>> initalization, if initialization phase goes well. If it is not the case
> >>> forgive me.
> >> The init just flips the bit at random in the IRQ_STAT register, so no,
> >> that's not really viable here. That's why we clear them at the end, and
> >> then wait a bit, and then check whether something new appeared in them.
> >>
> >> If not, all is great.
> >>
> >> Sure, we could generate an IRQ, but then IRQ line is not always
> >> connected to this chip on all hardware I have available. So this gives
> >> the user at least some indication that something is wrong with their HW.
> >>
> >>>>>> +
> >>>>>> +    usleep_range(10000, 12000);
> >>>>>> +    regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
> >>>>>> +    if (pval)
> >>>>>> +        dev_err(ctx->dev, "Unexpected link status 0x%02x\n", pval);
> >>>>>
> >>>>> I am not sure what is the case here but it looks like 'we do not know
> >>>>> what is going on, so let's add some diagnostic messages to gather info
> >>>>> and figure it out later'.
> >>>> That's pretty much the case, see the two links above in the NOTE
> >>>> section. If something goes wrong, we print the value for the user
> >>>> (usually developer) so they can fix their problems. We cannot do much
> >>>> better in the attach callback.
> >>>>
> >>>> The issue I ran into (and where this would be helpful information to
> >>>> me during debugging, since the issue happened real seldom, see also
> >>>> the NOTE links above) is that the DSI controller driver started
> >>>> streaming video on the data lanes before the DSI83 had a chance to
> >>>> initialize. This worked most of the time, except for a few exceptions
> >>>> here and there, where the video didn't start. This does set link
> >>>> status bits consistently. In the meantime, I fixed the controller
> >>>> driver (so far downstream, due to ongoing discussion).
> >>>
> >>> Maybe drm_connector_set_link_status_property(conn,
> >>> DRM_MODE_LINK_STATUS_BAD) would be usefule here.
> >> Hmm, this works on connector, the dsi83 is a bridge and it can be stuck
> >> between two other bridges. That doesn't seem like the right tool, no ?
> >>
> >>>>> Whole driver lacks IRQ handler which IMO could perform better diagnosis,
> >>>>> and I guess it could also help in recovery, but this is just my guess.
> >>>>> So if this patch is enough for now you can add:
> >>>> No, IRQ won't help you here, because by the time you get the IRQ, the
> >>>> DSI host already started streaming video on data lanes and you won't
> >>>> be able to correctly reinit the DSI83 unless you communicate to the
> >>>> DSI host that it should switch the data lanes back to LP11.
> >>>>
> >>>> And for that, there is a bigger chunk missing really. What needs to be
> >>>> added is a way for the DSI bridge / panel to communicate its needs to
> >>>> the DSI host -- things like "I need DSI clock lane frequency f MHz, I
> >>>> need clock lane in HS mode and data lanes in LP11 mode". If you look
> >>>> at the way DSI hosts and bridges/panels work out the DSI link
> >>>> parameters, you will notice they basically do it each on their own,
> >>>> there is no such API or communication channel.
> >>>
> >>> There is one-time communication channel via mipi_dsi_attach, it allows
> >>> to set max frequency i HS and LP, choose mode of operation (HS/LPM) and
> >>> few more things. If it is necessary to extend it please propse sth.
> >> Well, take for example the drivers/gpu/drm/exynos/exynos_drm_dsi.c ,
> >> there is this:
> >>
> >> static void exynos_dsi_enable(struct drm_encoder *encoder)
> >> ...
> >>                   list_for_each_entry_reverse(iter, &dsi->bridge_chain,
> >>                                               chain_node) {
> >>                           if (iter->funcs->pre_enable)
> >>                                   iter->funcs->pre_enable(iter);
> >> ...
> >>           exynos_dsi_set_display_mode(dsi);
> >>           exynos_dsi_set_display_enable(dsi, true);
> >> ...
> >>                   list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
> >>                           if (iter->funcs->enable)
> >>                                   iter->funcs->enable(iter);
> >>                   }
> >> ...
> >>
> >> So the bridge enable callback is called with clock lane already in HS
> >> mode, and data lanes streaming video. This doesn't work with the DSI83,
> >> which would need clock lane in HS and providing clock , but data lanes
> >> in LP11 with no video.
> >>
> >> Sure, I could probably move exynos_dsi_set_display_enable(dsi, true);
> >> after the enable call, but is that really the right solution ? What
> >> about bridges which need some other specific configuration of the data
> >> lanes during init ?
> > I hadn't noticed that Exynos was doing that.
> > vc4 DSI is doing the same thing in deliberately breaking the
> > panel/bridge chain so that it gets a chance to do some initialisation
> > before panel/bridge pre_enable.
>
> Initially ExynosDSI was written with panel support only, in such case
> developer can explicitly control time of calling panel ops - and that
> was good.
>
> Later, adding bridge support showed that bridge chain has fixed call
> order which is incompatible with Exynos, so the driver needs to calls
> bridge ops explicitly - flexibility was scarified for simplicity.
>
> For me, fixed order of calls in the whole chain
> (crtc->encoder->bridges...->panel) seems incorrect. Crtc starts
> transmission but the encoder is not yet ready, the same with encoder and
> bridges, later is slightly better - bridges have two ops (pre_enable,
> enable) but since they are not well defined developers are confused what
> should be performed where, as a result we have incompatible approaches.

I can't comment on how other platforms work, but on the Broadcom chips
the clock to read pixel data out of the pipeline comes from the
encoder, whether that is HDMI, DSI, DPI, or other. Therefore until the
encoder is enabled no data actually flows.

I'm not in a position to discuss whether the ordering is correct or
not - there are many others who know the subsystem far better than me
in that regard.

> Only panels have well defined opses: .prepare is for getting panel ready
> for video transmission, .enable is called after starting transmission to
> start showing the image (backlight-on or MIPI_DCS_SET_DISPLAY_ON).
>
> Apparently this model somehow works, probably due to nice hardware and
> custom hacks, but as we see more complicated protocols like DSI or more
> delicate devices cannot be handled with such callbacks.
>
> In case of Exynos DSI and s6e8aa0 panel we need to implement complicated
> sequence, which I have implemented this way:
>
> 1. Power on DSI host, start clocks, enable DSI PHY:
> pm_runtime_resume_and_get->exynos_dsi_resume.
>
> 2. Power on DSI device:
> drm_panel_prepare->s6e8aa0_prepare->s6e8aa0_power_on.
>
> 3. Initialize DSI host:
> drm_panel_prepare->s6e8aa0_prepare->s6e8aa0_set_sequence->...mipi_dsi_device_transfer->...->exynos_dsi_init.
>
> 4. Initialize DSI device:
> drm_panel_prepare->s6e8aa0_prepare->s6e8aa0_set_sequence (bulk of MIPI
> DCS/MCS commands).
>
> 5. Configure and start video stream on host:
> exynos_dsi_set_display_mode, exynos_dsi_set_display_enable.
>
> 6. Show the image: drm_panel_enable
>
>
> I guess LP-11 state is after DSI host init (3).

Possibly, but seeing as you have phy_power_on called from
exynos_dsi_resume in step 1 that's also possibly setting LP-11, but
may be ULPS (LP-00).

Then again exynos_dsi_init_link called from exynos_dsi_init configures
which lanes are required, and it would seem a bit odd to power up
lanes that weren't wanted.
Oddly that only seems to be called from exynos_dsi_host_transfer (your
step 3), so that'll never be called for something like the SN65DSI83
where it's configured via I2C rather than MIPI commands.

> >
> > Another issue I've noted in doing this is that it breaks calls to the
> > bridge's mode_set, mode_valid, and mode_fixup hooks. The framework
> > doesn't know about the bridges/panels beyond the encoder, and the
> > encoder doesn't get all the information required in order to replicate
> > those calls.
> If you put such calls into dsi host it will work, this is minus of the
> flexibility - you must do on your own.

You can't for mode_valid - the drm_bridge_funcs version has a "const
struct drm_display_info *info" parameter which the
drm_encoder_helper_funcs version doesn't have.

> > I'm about to look into whether switching the DSI host to being a
> > bridge instead of an encoder allows me to overcome that one.
> > Doing so doesn't solve the issue of the DSI host bridge pre_enable
> > being called after the panel/bridge pre_enable though.

I've just been working through converting our driver to being a bridge
as the current intended way of modelling DSI, and so that we can get
access to the relevant parameters to be able to implement mode_valid
and call down the chain.

It largely works, except for drm_atomic_add_encoder_bridges adds state
for all the bridges that the framework believes are attached to the
encoder. That stops at our DSI encoder/bridge as we've split the
chain, and there doesn't seem to be a simple way to replicate the
effect down the split section. AFAICT we can't replicate that from our
atomic_duplicate_state as we don't get given the full state to add our
state to.

Keeping this split chain approach seems flawed, so I'll look at either
a pre_pre_enable, or a phy state DSI call.

> The latter is rather blocking issue, maybe you can overcome it by adding
> mipi_host callbacks: power_on, init - this way you can call them from
> device's pre_enable
>
> This would solve the issues described later.
>
> It seems little bit hacky, but quite easy to implement, what do you think.

I started a discussion back in July as to whether a new function was
sensible[1]. Laurent's just resurrected it, and you've posted to it
too, so I'll shift the discussion there.

  Dave

[1] https://lists.freedesktop.org/archives/dri-devel/2021-July/313576.html
