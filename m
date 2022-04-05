Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0A74F3CB9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 19:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D5710EC2B;
	Tue,  5 Apr 2022 17:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E6A10EC27
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 17:03:00 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id b24so15631295edu.10
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 10:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W9jjXhkkwggvTX4fvJBrk+j1Dfql0KOELV0oxfWMhuc=;
 b=Da196R/xzbnxuTIH3vscQpCMovYwydT/AzCJSlQj8Eqi4CvIwtAd/mUQm9MmrSBpfo
 C+EBgKeBCuBKVRkDsHPA8cOoIX8OcoIl86zyYotKiHUopfezjcGIoi0dE+KUYYdh8QMp
 KVzZw8avVxGZB0tQNm3+yFeorwp26KB33gYBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W9jjXhkkwggvTX4fvJBrk+j1Dfql0KOELV0oxfWMhuc=;
 b=dU/Vr9lKgp9UcnpBsL/4i7aGFF1caGpt95yOCit/x4a1NxrKw0Vxo6w9igBqWFnzhG
 6jXY7Q4dY9GROWiTmQp0HQGOWtYJ6+cvYHXLJq8iNvneybj5g1725sHM8ktPukcWJ5QX
 mL4NpknWkdgvvapWSRM0VVdT+VnatUSkL4zsqea3+kXuIEPNLUVG38HYC/E2iOoU4Rn+
 BZi7V7gRBJRSm6wiVIhbtOfx22NbRzdTTVbXy5Dc0JKX+7wEimpYy5A+vT0sigEuEDrs
 mKFIwaUSzznR/W85alFawpLDEnwAS2R5L3Ux25Fv4zesqwujyCH4K+Cp3UST652MT5P+
 KjAg==
X-Gm-Message-State: AOAM531Bq7AdTd/Rpex+Y8VFOSdhbsBulF0U8DP2sFhyJwDwyo1BND1i
 MDNVlraYJfY5RZNbsOh6M1+nj5w1Nyeevyaa
X-Google-Smtp-Source: ABdhPJx0JXmI55VcIyqXtr1nSklWRcfQ8iTED3rU87tLDaVYJ+ibbkNEpauB0P55h/tAWsTrZ/KjgA==
X-Received: by 2002:a05:6402:3719:b0:412:fc6b:f271 with SMTP id
 ek25-20020a056402371900b00412fc6bf271mr4711236edb.345.1649178178981; 
 Tue, 05 Apr 2022 10:02:58 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 b17-20020aa7dc11000000b00412ae7fda95sm6775614edu.44.2022.04.05.10.02.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 10:02:57 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id
 l7-20020a05600c1d0700b0038c99618859so2007209wms.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 10:02:56 -0700 (PDT)
X-Received: by 2002:a05:600c:4f10:b0:38c:ae36:d305 with SMTP id
 l16-20020a05600c4f1000b0038cae36d305mr3996092wmq.34.1649178175654; Tue, 05
 Apr 2022 10:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=X+QvjwoT2zGP82KW4kD0oMUY6ZgCizSikNX_Uj8dNDqA@mail.gmail.com>
 <392b933f-760c-3c81-1040-c514045df3da@linaro.org>
 <CAD=FV=W4PYK-t607yjRbfjDjjEZX0KdgHDRukw_vSH8E8EDH6w@mail.gmail.com>
 <CAA8EJppt9XONbgtKfmHmN+==QNqiVJeb8GKJFdZm=yyY-tgmHQ@mail.gmail.com>
 <CAD=FV=U5-sTDLYdkeJWLAOG-0wgxR49VxtwUyUO7z2PuibLGsg@mail.gmail.com>
 <CAA8EJppgfYgQjG8A4LsR-1wmBj3Ku3eO8cKfAYhxjWXL7e3eHg@mail.gmail.com>
In-Reply-To: <CAA8EJppgfYgQjG8A4LsR-1wmBj3Ku3eO8cKfAYhxjWXL7e3eHg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Apr 2022 10:02:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V=a1CnT8fqTJR40WoS3BaDQ3xZ=HnHVHqZh=MEmVUZBA@mail.gmail.com>
Message-ID: <CAD=FV=V=a1CnT8fqTJR40WoS3BaDQ3xZ=HnHVHqZh=MEmVUZBA@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] drm/msm/dp: Add eDP support via aux_bus
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Apr 5, 2022 at 5:54 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> > 3. For DP and eDP HPD means something a little different. Essentially
> > there are two concepts: a) is a display physically connected and b) is
> > the display powered up and ready. For DP, the two are really tied
> > together. From the kernel's point of view you never "power down" a DP
> > display and you can't detect that it's physically connected until it's
> > ready. Said another way, on you tie "is a display there" to the HPD
> > line and the moment a display is there it's ready for you to do AUX
> > transfers. For eDP, in the lowest power state of a display it _won't_
> > assert its "HPD" signal. However, it's still physically present. For
> > eDP you simply have to _assume_ it's present without any actual proof
> > since you can't get proof until you power it up. Thus for eDP, you
> > report that the display is there as soon as we're asked. We can't
> > _talk_ to the display yet, though. So in get_modes() we need to be
> > able to power the display on enough to talk over the AUX channel to
> > it. As part of this, we wait for the signal named "HPD" which really
> > means "panel finished powering on" in this context.
> >
> > NOTE: for aux transfer, we don't have the _display_ pipe and clocks
> > running. We only have enough stuff running to do the AUX transfer.
> > We're not clocking out pixels. We haven't fully powered on the
> > display. The AUX transfer is designed to be something that can be done
> > early _before_ you turn on the display.
> >
> >
> > OK, so basically that was a longwinded way of saying: yes, we could
> > avoid the AUX transfer in probe, but we can't wait all the way to
> > enable. We have to be able to transfer in get_modes(). If you think
> > that's helpful I think it'd be a pretty easy patch to write even if it
> > would look a tad bit awkward IMO. Let me know if you want me to post
> > it up.
>
> I think it would be a good idea. At least it will allow us to judge,
> which is the more correct way.

I'm still happy to prototype this, but the more I think about it the
more it feels like a workaround for the Qualcomm driver. The eDP panel
driver is actually given a pointer to the AUX bus at probe time. It's
really weird to say that we can't do a transfer on it yet... As you
said, this is a little sideband bus. It should be able to be used
without all the full blown infra of the rest of the driver.


> And I also think it might help the ti,sn65dsi86 driver, as it won't
> have to ensure that gpio is available during the AUX bus probe.

The ti,sn65dsi86 GPIO issue has been solved for a while, though so not
sure why we need to do something there? I'm also unclear how it would
have helped. In this discussion, we've agreed that the panel driver
would still acquire resources during its probe time and the only thing
that would be delayed would be the first AUX transfer. The GPIO is a
resource here and it's ideal to acquire it at probe time so we could
EPROBE_DEFER if needed.


> BTW, another random idea, before you start coding.
>
> We have the bridge's hpd_notify call. Currently it is called only by
> the means of drm_bridge_connector's HPD mechanism, tied to the bridge
> registering as DRM_BRIDGE_OP_HPD.
> It looks to me like it might be a perfect fit for the first aux-bus
> related reads.
>
> We'd need to trigger it manually once and tie it to the new
> drm_panel_funcs callback, which in turn would probe the aux bus,
> create backlight, etc.
>
> Regarding the Sankeerth's patch. I have been comparing it with the
> hpd_event_thread()'s calls.
> It looks to me like we should reuse dp_display_config_hpd()
> /EV_HPD_INIT_SETUP and maybe others.
>
> What I'm trying to say is that if we split AUX probing and first AUX
> transfers, it would be possible to reuse a significant part of MSM DP
> HPD machine rather than hacking around it and replicating it manually.

I'm not sure I completely understand, but I'm pretty wary here. It's
my assertion that all of the current "HPD" infrastructure in DRM all
relates to the physical presence of the panel. If you start
implementing these functions for eDP I think you're going to confuse
the heck out of everything. The kernel will think that this is a
display that's sometimes not there. Whenever the display is powered
off then HPD will be low and it will look like there's no display.
Nothing will ever try to power it on because it looks like there's no
display.

I think your idea is to "trigger once" at bootup and then it all
magically works, right? ...but what about after bootup? If you turn
the display off for whatever reason (modeset or you simply close the
lid of your laptop because you're using an external display) and then
you want to use the eDP display again, how do you kickstart the
process another time? You can't reboot, and when the display is off
the HPD line is low.

I can't say it enough times, HPD on eDP _does not mean hot plug
detect_. The panel is always there. HPD is really a "panel ready /
panel notify" signal for eDP. That's fully what its function is.

-Doug
