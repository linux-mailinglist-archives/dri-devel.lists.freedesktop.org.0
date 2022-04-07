Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B744F8A7A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 01:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A006B10E7CF;
	Thu,  7 Apr 2022 23:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B3810E7B4
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 23:36:01 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id g11so2467610qke.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 16:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pz4KD/PvVy3aJckPQcstiGf/5cgrKhrIQB+LQ40VK1U=;
 b=sgePQ8APzlEcl6PlCk+UG7uIxcsN3bWYyVD+F76a6KY6next7JnstlIa8To6cHlw4I
 ToMpcYUMhFb3y9dHSUXyg63k/k21n1/AYmeV82yduMrUoG9U2Dm7f9ZGWyP9Irrrs6kN
 OgOFOC3gdOmAfG0MTeVIrd//szrfX8UbwA2o5mMCZULJY8/OAKSXyJKJOrBmUN+k85Zh
 J8P6RNAFZb81mag9unPFiDkjwFoBDGPkziWKLfh6h97O5+5sKlZgZg38NgEHgv5dxo71
 IQICoC03Qy6fIHXyJs8lKPWRfptnC4goay/mIMv9snhUtwpFEoSVItVvy05WCPByzVQG
 0Qrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pz4KD/PvVy3aJckPQcstiGf/5cgrKhrIQB+LQ40VK1U=;
 b=n5y9HNGFrCkjUGY8P8P4Bkt6pNv4B4xL3ZiXVYZwykNVXB30UuTMVgLeEWFtspwzl5
 Ykc5Ib/gb2nQbJXuYEUrFuZ37iPV1CZeq7uD8w6qt9vjQ8KcTYVfQQjqYCdncPST9XPl
 S+wZ4z/xjQxpdOO765QBfhCmYmp1yyJFsb8l0FzKRkQ7zJTQrq9Tr7uXjamHdtP+t4cj
 lYaXAU73TjxRhtUWAZx5qiZZ7sIEahdV4znmFiNMBinqCx5QD0FZS57jZQEMsySLvJHF
 XKqoFH3NdocpcInEZFGIMJEhgPpZ1T6t1skv0LcvswR0UFIDqNu8tkak6LbZ9K+CA2M6
 RolQ==
X-Gm-Message-State: AOAM532PV30qgFtzOzxIwM1IU+B4oNLh/2fiafO6eodKPNHYLRQ0wDWq
 ps0a6hBNiuUhlcZEHWJI/zBem30yvukECdNhKdiGPQ==
X-Google-Smtp-Source: ABdhPJy1MIEzz+id1KPgG+Zq+PpDAIDu7bwNovX/mQihYOPTwSAk3P9UVdVYoda5Kx/PuodDgxQAgby8bdz0la5jxz0=
X-Received: by 2002:a05:620a:170a:b0:67d:be5c:204a with SMTP id
 az10-20020a05620a170a00b0067dbe5c204amr11278835qkb.593.1649374560237; Thu, 07
 Apr 2022 16:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=X+QvjwoT2zGP82KW4kD0oMUY6ZgCizSikNX_Uj8dNDqA@mail.gmail.com>
 <392b933f-760c-3c81-1040-c514045df3da@linaro.org>
 <CAD=FV=W4PYK-t607yjRbfjDjjEZX0KdgHDRukw_vSH8E8EDH6w@mail.gmail.com>
 <CAA8EJppt9XONbgtKfmHmN+==QNqiVJeb8GKJFdZm=yyY-tgmHQ@mail.gmail.com>
 <CAD=FV=U5-sTDLYdkeJWLAOG-0wgxR49VxtwUyUO7z2PuibLGsg@mail.gmail.com>
 <CAA8EJppgfYgQjG8A4LsR-1wmBj3Ku3eO8cKfAYhxjWXL7e3eHg@mail.gmail.com>
 <CAD=FV=V=a1CnT8fqTJR40WoS3BaDQ3xZ=HnHVHqZh=MEmVUZBA@mail.gmail.com>
 <3e5fa57f-d636-879a-b98f-77323d07c156@linaro.org>
 <CAD=FV=Uibu-kZyix7K4_WVc-+C8xpzTqU4WFy7O=6sukMZrX5g@mail.gmail.com>
 <MW4PR02MB7186245772DAC3E04FA8D1C0E1E69@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAD=FV=Wk3U7_bVdiCPp8iQ4bcCA_Botemu4pwHeRtgBa3Xk6KQ@mail.gmail.com>
 <c4f086ce-c56f-f7c9-4092-7f2432330d50@quicinc.com>
In-Reply-To: <c4f086ce-c56f-f7c9-4092-7f2432330d50@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Apr 2022 02:35:48 +0300
Message-ID: <CAA8EJprdV64jOexEF-XqbkwsNDWBNRRndOAas-QqMHaL=zp9rw@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] drm/msm/dp: Add eDP support via aux_bus
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
 <devicetree@vger.kernel.org>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 7 Apr 2022 at 23:11, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Hi Doug and Dmitry
>
> Sorry, but I caught up on this email just now.
>
> Some comments below.
>
> Thanks
>
> Abhinav
> On 4/7/2022 10:07 AM, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Apr 7, 2022 at 7:19 AM Sankeerth Billakanti (QUIC)
> > <quic_sbillaka@quicinc.com> wrote:
> >>
> >> Hi Dmitry and Doug,
> >>
> >>> Hi,
> >>>
> >>> On Tue, Apr 5, 2022 at 10:36 AM Dmitry Baryshkov
> >>> <dmitry.baryshkov@linaro.org> wrote:
> >>>>
> >>>> On 05/04/2022 20:02, Doug Anderson wrote:
> >>>>> Hi,
> >>>>>
> >>>>> On Tue, Apr 5, 2022 at 5:54 AM Dmitry Baryshkov
> >>>>> <dmitry.baryshkov@linaro.org> wrote:
> >>>>>>> 3. For DP and eDP HPD means something a little different.
> >>>>>>> Essentially there are two concepts: a) is a display physically
> >>>>>>> connected and b) is the display powered up and ready. For DP, the
> >>>>>>> two are really tied together. From the kernel's point of view you
> >>>>>>> never "power down" a DP display and you can't detect that it's
> >>>>>>> physically connected until it's ready. Said another way, on you
> >>>>>>> tie "is a display there" to the HPD line and the moment a display
> >>>>>>> is there it's ready for you to do AUX transfers. For eDP, in the
> >>>>>>> lowest power state of a display it _won't_ assert its "HPD"
> >>>>>>> signal. However, it's still physically present. For eDP you simply
> >>>>>>> have to _assume_ it's present without any actual proof since you
> >>>>>>> can't get proof until you power it up. Thus for eDP, you report
> >>>>>>> that the display is there as soon as we're asked. We can't _talk_
> >>>>>>> to the display yet, though. So in get_modes() we need to be able
> >>>>>>> to power the display on enough to talk over the AUX channel to it.
> >>>>>>> As part of this, we wait for the signal named "HPD" which really means
> >>> "panel finished powering on" in this context.
> >>>>>>>
> >>>>>>> NOTE: for aux transfer, we don't have the _display_ pipe and
> >>>>>>> clocks running. We only have enough stuff running to do the AUX
> >>> transfer.
> >>>>>>> We're not clocking out pixels. We haven't fully powered on the
> >>>>>>> display. The AUX transfer is designed to be something that can be
> >>>>>>> done early _before_ you turn on the display.
> >>>>>>>
> >>>>>>>
> >>>>>>> OK, so basically that was a longwinded way of saying: yes, we
> >>>>>>> could avoid the AUX transfer in probe, but we can't wait all the
> >>>>>>> way to enable. We have to be able to transfer in get_modes(). If
> >>>>>>> you think that's helpful I think it'd be a pretty easy patch to
> >>>>>>> write even if it would look a tad bit awkward IMO. Let me know if
> >>>>>>> you want me to post it up.
> >>>>>>
> >>>>>> I think it would be a good idea. At least it will allow us to
> >>>>>> judge, which is the more correct way.
> >>>>>
> >>>>> I'm still happy to prototype this, but the more I think about it the
> >>>>> more it feels like a workaround for the Qualcomm driver. The eDP
> >>>>> panel driver is actually given a pointer to the AUX bus at probe
> >>>>> time. It's really weird to say that we can't do a transfer on it
> >>>>> yet... As you said, this is a little sideband bus. It should be able
> >>>>> to be used without all the full blown infra of the rest of the driver.
> >>>>
> >>>> Yes, I have that feeling too. However I also have a feeling that just
> >>>> powering up the PHY before the bus probe is ... a hack. There are no
> >>>> obvious stopgaps for the driver not to power it down later.
> >>>
>
> Lets go back to why we need to power up the PHY before the bus probe.
>
> We need to power up PHY before bus probe because panel-eDP tries to read
> the EDID in probe() for the panel_id. Not get_modes().
>
> So doug, I didnt follow your comment that panel-eDP only does EDID read
> in get_modes()
>
>         panel_id = drm_edid_get_panel_id(panel->ddc);
>         if (!panel_id) {
>                 dev_err(dev, "Couldn't identify panel via EDID\n");
>                 ret = -EIO;
>                 goto exit;
>         }
>
> If we do not need this part, we really dont need to power up the PHY
> before the probe(). The hack which dmitry was referring to.
>
> So this is boiling down to why or how panel-eDP was originally designed.

Well, it's not just panel-edp. It boils down to the DP-AUX bus design
vs DRM design. However in Doug's defense I should admit that I can not
come up with a significantly cleaner solution.

Just to emphasise (or to repeat): for all other display
panels/bridges, we either do not use a sidechannel bus or the
sidechannel bus (i2c, spi, platform) is managed outside of the DRM
framework. Thus it's possible to create the source in the drm's driver
probe path and then in the component's bind() path check (and return
an error) if the sink device wasn't yet probed successfully. The
source can then either communicate with the sink using the sidechannel
bus provided elsewhere or (e.g. in case of purely DSI panel), defer
communication till the moment the display path is fully available
(after encoder enablement).

For the DP/eDP the sidechannel (DP AUX) bus is closer to the display
path. It can not be used separately. For DP we can defer all
communication till the moment we know (through the DP/USB-C/etc
hotplug mechanism) that the sink is really available and running.

The eDP is being caught in between these two approaches:

For example sn65dsi86 and tegra have separate dpaux and separate
bridge/output devices. Thus dpaux'es probe() methos populates DP AUX
bus, then a separate device checks whether the panel/bridge has become
available in its own probe() method.

The ps8640 driver looks 'working by coincidence'. It calls
dp_aux_populate, then immediately after the function returns it checks
for the panel. If panel-edp is built as a module, the probe might fail
easily.
The anx7625 driver has the same kind of issue. The DP AUX bus is
populated from the probe() and after some additional work the panel is
being checked.
This design is fragile and from my quick glance it can break (or be
broken) too easy. It reminds me of our drm msm 'probe' loops
preventing the device to boot completely if the dsi bridge/panel could
not be probed in time.

If we talk about DP AUX bus EP drivers, both panel-edp and
panel-samsung-atna33xc20 (the only EP drivers present in Linux master)
expect that they can access DPCD from the probe method.

Now back to Qualcomm DP driver. We do not have a separate dpaux
entity. If leave aside the idea of adding a separate 'bus available'
callback, I see two possible solutions:

- Implement separate lightweight eDP driver sharing source with the DP
driver. Make it skip all the DP HPD craziness, init PHY and call
devm_of_dp_aux_ep_populate_ep_devices() from the probe method, check
in the bind method that the next bridge is available. However this can
potentially break ports which can be used either in the DP or in eDP
mode.

or

- Modify existing Qualcomm DP driver to return -EPROBE_DEFER from
dp_aux_transfer() if the AUX bus is not available. Make the driver
init PHY from probe() if it is running in the eDP mode. Populate DP
AUX bus from probe(). Check for the next bridge in dp_bind().

There might be potentially other possibilities, but I think you have
my main idea. Create the bus in probe(), check for the bridge in
bind().

or

- Create a bus at some point in bind. Forbid (and document that) AUX
access from EP probe(). Access it only from get_modes().


>
> >>> This is why I think we need to move to Runtime PM to manage this. Basically:
> >>>
> >>> 1. When an AUX transfer happens, you grab a PM runtime reference that
> >>> _that_ powers up the PHY.
>
> This will not be trivial and needs to be scoped out as sankeerth said
> but if the above is the only concern, why do we need to do this? There
> seems to be an explanation why we are doing this and its not a hack.
>
> How would Dmitry's rework address this? We need some RFC to conclude on
> that first.

Just to put things clear: I do not have plans to work on either of my
suggestions at least in the next few months. I do not have eDP hardware at hand.




>
> >>>
> >>> 2. At the end of the AUX transfer function, you do a "put_autosuspend".
> >>>
> >>> Then it becomes not a hack, right?
> >>>
> >>>
> >>
> >> pm runtime ops needs to be implemented for both eDP and DP. This change
> >> take good amount of planning and code changes as it affects DP also.
> >>
> >> Because this patch series consist of basic eDP changes for SC7280 bootup,
> >> shall we take this pm_runtime implementation in subsequent patch series?
> >
> > Dmitry is the real decision maker here, but in my opinion it would be
> > OK to get something landed first that worked OK and wasn't taking us
> > too far in the wrong direction and then we could get a follow up patch
> > to move to pm_runtime.
>
> I would say the discussion changed into a direction of implementing
> pm-runtime because the current patch series does what it takes to adhere
> to panel-eDP's design along with aux bus requirements of PHY needing to
> be on.
>
> So doug, to answer your questions here:
>
> "So I guess the net result is maybe we should just keep it where it is.
> Long term I'd be interested in knowing if there's a reason why we
> can't structure the driver so that AUX transfers can happen with less
> intertwining with the rest of the code, but that can happen later. I
> would expect that you'd basically just need clocks and regulators on
> and maybe your PHY on."
>
> Yes PHY needs to be absolutely on and configured before aux transfers.
>
> If we want to change that up to stop reading the panel_id in the panel
> probe() and do it later, perhaps some of the changes done here are not
> needed.
>
> It only seems reasonable that we first prototype that in a separate
> patch even a RFC perhaps and take this further as these set of changes
> are needed for basic display functionality on sc7280 chromebooks.
>
> Let us know what are the concerns with doing it in a follow up change.
>
> Thanks
>
> Abhinav



--
With best wishes
Dmitry
