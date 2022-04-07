Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6434F8A7D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 01:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0946C10E050;
	Thu,  7 Apr 2022 23:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1749D10E7B4
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 23:46:26 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id v2so9469958qtc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 16:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MpHTh04rYBwjjTZFAAAByBk97DSNs2GInrUq+lnOv2U=;
 b=t6TgPFV7nl2Ld7CZKPvMj3/YieaF5IpyvSK7/zJbJsjONfqw8SpTOg0+vhHhuHUGIY
 A5nIC/iTCgXnf1nuBziDjuSPd+k8tuHxgFb3f5R+Ub9qU5xzJwSnHsMXjNu752fH0GnX
 4aVNP6dy7fiAwt/VlzoHLRSWvPvk38NkMdGaEO2fWnfnYnyQLiI+KqSvSSVgrY1srJpv
 Z0xczrsBRD2mU7P6fU8yd6ZvutfdCYOp8qMt9V9wn+TwlAerWVd2958PFpHHkeiO0eIi
 TzcJZ7ssXbjOUdgFTDFpnmkJNl5yL0xEUbU/SIl7aRT1nz3Ueyi/vQTwL1iq2MgCGE1w
 ogJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MpHTh04rYBwjjTZFAAAByBk97DSNs2GInrUq+lnOv2U=;
 b=uZZQT2NmuPv4Qty9hlTwABM0+bIHL/rrc7Iwc5Qd4S93oxNwUtG9yQpkzXNPzA1Mep
 +duBC2i+3ayMOJm2oVYBxHNo2zcWCext5iurWEu+mWPJNgL+WOvml2ytQBTDYBuUf1Jk
 OXJo+MneCJsVqgOh7Y7InFNUyMoEqs7i44/zawE5yNI90wZd7GdIZImWcCr/uC5lc20d
 M4RDQ8VDOwJqCT1b40nlhtXYXKsVI+rzxtVQ3jIkKi5fbFJbX2xAy9qcUyH4BEpyTIaQ
 GyTvcl+tX281ehM+xEsa6TWdLTxSVJL4ytVeLBG47YDlxXEcpteT5CovOQwK6FyfszlA
 KDKg==
X-Gm-Message-State: AOAM531FaRlDRKAG5tmLOiqGtejcuJhKjWb55PYR0+KWyRXS6oSGnrfz
 YvSgLCp3e2N+qTsJYrB2PWoD6Yr7UkZyLbGNeaWSMg==
X-Google-Smtp-Source: ABdhPJzrpa0HTbjgN12dKTJWpgn/QhqrktGsVOt/kJaOnP5/chw8A0IQErROmcv1a6QYCmDVybLZjs+HfF+DkncJGUM=
X-Received: by 2002:ac8:4e52:0:b0:2e1:dad8:5141 with SMTP id
 e18-20020ac84e52000000b002e1dad85141mr13800277qtw.62.1649375185033; Thu, 07
 Apr 2022 16:46:25 -0700 (PDT)
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
 <CAD=FV=UmU_BVUaL_X75yOEvQPtGUBTR5-jiVWBHq7uSRt6HM4Q@mail.gmail.com>
 <225d2c0a-42ec-28ad-688c-e7e9e2035ee1@quicinc.com>
 <CAD=FV=W=WjSACHvRDFBnkLUp-LU2c4XMu3=FTzTx=zexNF5PAw@mail.gmail.com>
In-Reply-To: <CAD=FV=W=WjSACHvRDFBnkLUp-LU2c4XMu3=FTzTx=zexNF5PAw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Apr 2022 02:46:13 +0300
Message-ID: <CAA8EJpqLZ9up4euGEbhf5QyBqm4tJuLcHi7D+0Si7ak9Jej52w@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] drm/msm/dp: Add eDP support via aux_bus
To: Doug Anderson <dianders@chromium.org>
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
 Stephen Boyd <swboyd@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Apr 2022 at 02:35, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Apr 7, 2022 at 3:03 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >
> > Hi Doug
> >
> > Thanks for the response, some comments below.
> >
> > Abhinav
> > On 4/7/2022 1:47 PM, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Thu, Apr 7, 2022 at 1:11 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > >>
> > >> Hi Doug and Dmitry
> > >>
> > >> Sorry, but I caught up on this email just now.
> > >>
> > >> Some comments below.
> > >>
> > >> Thanks
> > >>
> > >> Abhinav
> > >> On 4/7/2022 10:07 AM, Doug Anderson wrote:
> > >>> Hi,
> > >>>
> > >>> On Thu, Apr 7, 2022 at 7:19 AM Sankeerth Billakanti (QUIC)
> > >>> <quic_sbillaka@quicinc.com> wrote:
> > >>>>
> > >>>> Hi Dmitry and Doug,
> > >>>>
> > >>>>> Hi,
> > >>>>>
> > >>>>> On Tue, Apr 5, 2022 at 10:36 AM Dmitry Baryshkov
> > >>>>> <dmitry.baryshkov@linaro.org> wrote:
> > >>>>>>
> > >>>>>> On 05/04/2022 20:02, Doug Anderson wrote:
> > >>>>>>> Hi,
> > >>>>>>>
> > >>>>>>> On Tue, Apr 5, 2022 at 5:54 AM Dmitry Baryshkov
> > >>>>>>> <dmitry.baryshkov@linaro.org> wrote:
> > >>>>>>>>> 3. For DP and eDP HPD means something a little different.
> > >>>>>>>>> Essentially there are two concepts: a) is a display physically
> > >>>>>>>>> connected and b) is the display powered up and ready. For DP, the
> > >>>>>>>>> two are really tied together. From the kernel's point of view you
> > >>>>>>>>> never "power down" a DP display and you can't detect that it's
> > >>>>>>>>> physically connected until it's ready. Said another way, on you
> > >>>>>>>>> tie "is a display there" to the HPD line and the moment a display
> > >>>>>>>>> is there it's ready for you to do AUX transfers. For eDP, in the
> > >>>>>>>>> lowest power state of a display it _won't_ assert its "HPD"
> > >>>>>>>>> signal. However, it's still physically present. For eDP you simply
> > >>>>>>>>> have to _assume_ it's present without any actual proof since you
> > >>>>>>>>> can't get proof until you power it up. Thus for eDP, you report
> > >>>>>>>>> that the display is there as soon as we're asked. We can't _talk_
> > >>>>>>>>> to the display yet, though. So in get_modes() we need to be able
> > >>>>>>>>> to power the display on enough to talk over the AUX channel to it.
> > >>>>>>>>> As part of this, we wait for the signal named "HPD" which really means
> > >>>>> "panel finished powering on" in this context.
> > >>>>>>>>>
> > >>>>>>>>> NOTE: for aux transfer, we don't have the _display_ pipe and
> > >>>>>>>>> clocks running. We only have enough stuff running to do the AUX
> > >>>>> transfer.
> > >>>>>>>>> We're not clocking out pixels. We haven't fully powered on the
> > >>>>>>>>> display. The AUX transfer is designed to be something that can be
> > >>>>>>>>> done early _before_ you turn on the display.
> > >>>>>>>>>
> > >>>>>>>>>
> > >>>>>>>>> OK, so basically that was a longwinded way of saying: yes, we
> > >>>>>>>>> could avoid the AUX transfer in probe, but we can't wait all the
> > >>>>>>>>> way to enable. We have to be able to transfer in get_modes(). If
> > >>>>>>>>> you think that's helpful I think it'd be a pretty easy patch to
> > >>>>>>>>> write even if it would look a tad bit awkward IMO. Let me know if
> > >>>>>>>>> you want me to post it up.
> > >>>>>>>>
> > >>>>>>>> I think it would be a good idea. At least it will allow us to
> > >>>>>>>> judge, which is the more correct way.
> > >>>>>>>
> > >>>>>>> I'm still happy to prototype this, but the more I think about it the
> > >>>>>>> more it feels like a workaround for the Qualcomm driver. The eDP
> > >>>>>>> panel driver is actually given a pointer to the AUX bus at probe
> > >>>>>>> time. It's really weird to say that we can't do a transfer on it
> > >>>>>>> yet... As you said, this is a little sideband bus. It should be able
> > >>>>>>> to be used without all the full blown infra of the rest of the driver.
> > >>>>>>
> > >>>>>> Yes, I have that feeling too. However I also have a feeling that just
> > >>>>>> powering up the PHY before the bus probe is ... a hack. There are no
> > >>>>>> obvious stopgaps for the driver not to power it down later.
> > >>>>>
> > >>
> > >> Lets go back to why we need to power up the PHY before the bus probe.
> > >>
> > >> We need to power up PHY before bus probe because panel-eDP tries to read
> > >> the EDID in probe() for the panel_id. Not get_modes().
> > >>
> > >> So doug, I didnt follow your comment that panel-eDP only does EDID read
> > >> in get_modes()
> > >>
> > >>          panel_id = drm_edid_get_panel_id(panel->ddc);
> > >>          if (!panel_id) {
> > >>                  dev_err(dev, "Couldn't identify panel via EDID\n");
> > >>                  ret = -EIO;
> > >>                  goto exit;
> > >>          }
> > >>
> > >> If we do not need this part, we really dont need to power up the PHY
> > >> before the probe(). The hack which dmitry was referring to.
> > >
> > > Right. ...so we _could_ remove the above from the panel-edp probe and
> > > defer it to get_modes() and it wouldn't be that hard. ...but:
> > >
> > > 1. It feels like a hack to work around the Qualcomm driver. The way
> > > the AUX bus is designed is that a pointer to the AUX bus is passed to
> > > the panel-edp probe. It seems kinda strange to say that the panel
> > > isn't allowed to do transfers with the pointer that's passed in.
> > >
> >
> > And thats why to satisfy the requirements of passing an initialized AUX,
> > sankeerth is delaying devm_of_dp_aux_populate_ep_devices() till PHY is
> > initialized which seems reasonable to satisfy the probe() time requirements.
> >
> > Even if we move to pm_runtime(), yes I agree it will club all the
> > resources needed to control AUX in one place but you will still have to
> > initialize PHY before probe() under the hood of pm_runtime().
> >
> > So how will it help this cause?
> >
> > We just have to accept that initializing PHY is a requirement to use AUX
> > and before calling panel-eDP's probe(), we have to have an initialized AUX.
> >
> > So we are not working around the driver but just satisfying the hardware
> > requirements to be able to satisfy panel-edp's and
> > drm_panel_dp_aux_backlight()'s aux bus requirements.
>
> The way I'm arguing it should work is that:
>
> 1. A whole bunch of the DP init code should move to the DP driver's
> probe function. This includes parsing the DT, acquiring clocks,
> getting a handle to our PHY, and IO mapping registers. As far as I
> know, there's no reason to wait on all the components being probed in
> order to do this stuff.

Yes. And that's one of the reasons I tried to stay away from the DP
driver. Each time I open the source code, my hands itch to start
refactoring the code.

>
> 2. Once we have done the above things, it should be possible to do AUX
> transfers, correct? ...and then we can populate the AUX bus from the
> probe function too.

No. In the DP case the AUX bus is inaccessible until the dongle is
plugged (see all the HPD handling, phy_init()/phy_power_on() is hidden
somewhere in that path)

eDP needs to be a special case in the probe() function.

>
> 3. Any other init (setting up pixel clocks) can continue to happen
> where it is today.

Yes.

>
>
> > > 2. There's a second place where we might do an AUX transfer at probe
> > > time which is when we're using the DP AUX backlight. There we call
> > > drm_panel_dp_aux_backlight(). Conceivably this too could be deferred
> > > until the get_modes(), but now it feels even more like a hack. We're
> > > going to be registering the backlight in the first call to
> > > get_modes()? That's, ummm, unexpected. We could look at perhaps
> > > breaking the "DP AUX backlight" in two parts also, but that gets
> > > involved. I think we're supposed to know the number of backlight
> > > levels at device init time for backlight devices and we need an AUX
> > > transfer to that.
> > >
> >
> >
> > >
> > > So the answer is that we could probably make it work, but it seems
> > > like an uglier solution than just making the Qualcomm driver able to
> > > do AUX transfers when it should be able to.
> >
> > Correct and by delaying the panel-edp's probe(), we are doing exactly that?
>
> Right. Where you put the probe now makes it work OK from an AUX
> transfer point of view and it's probably OK for the short term, but
> I'm not 100% convinced it would handle the -EPROBE_DEFER case, though
> I haven't actually tested it.
>
> Imagine this case:
>
> 1. 100% of your code is built-in to the kernel except for your PWM
> driver, which is a module.
>
> 2. You start booting up. All the DRM components for MSM are finished
> and eventually modeset_init() gets called.
>
> 3. We try to probe the panel. When the panel tries to acquire the PWM
> backlight, it finds that the PWM driver hasn't been loaded yet. It
> gets back -EPROBE_DEFER which prevents the panel driver from probing.
>
> The question is: does modeset_init() handle that -EPROBE_DEFER
> elegantly? Normally that's something that would only be returned by
> probe functions. Maybe this is all handled, though? I definitely
> haven't followed enough of the code and haven't tested it myself.

It would be handled up to some point. The error would propagate to the
msm_drm_init() = msm_drm_bind(), failing the mdss probe() (and putting
it to the defer list).
However in the dp's error path the driver would destroy the EP device.
The kernel would notice this and retry devices from the defer list. We
have just sorted this out for the DSI (thank you Maxime, Rob and
Angelo for doing this).

>
> The above is probably not a giant deal, but I think long term it would
> be better to be acquiring resources earlier.


-- 
With best wishes
Dmitry
