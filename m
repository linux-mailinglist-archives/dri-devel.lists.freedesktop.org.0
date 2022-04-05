Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B56E74F3D23
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 20:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A10D10EE33;
	Tue,  5 Apr 2022 18:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E34F10EE31
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 18:11:57 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id k23so24950988ejd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 11:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=660LH2+GxfU/Tt425A6dqO9O0qLu2gGwDombZrfKpU8=;
 b=gwNC/cNNASSPrm/edmwXPk0X7RaQdKKSivzCUoyBbji7ak6C8kchHEP5egX8PkIP4C
 sazrZ+UZmtaVXMpC4qrc5t0H+eIPolaDcFXOFq2kJoDEq0rKnwf93q0H04FDyVTlple4
 HndygiAgVBA2rSkB38vxENQIHCisJHKkZm1Uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=660LH2+GxfU/Tt425A6dqO9O0qLu2gGwDombZrfKpU8=;
 b=Y16mEYfZrnLXkevnTBYbMiVlnZYsOxN3r9LHatzFhdWOdffTxUi5EeiAbTrmkmSEBo
 W2GTwmnT7d3lKTNTkaXMDY0cl/KqqGNPFlItEUAB5bI5KQFZUMBRYcTjkGxCiDv0IaPq
 ue4xnMGRqm/+ZUBOGMAEzX1C4kCKuB+L175mxcnPuZXo2isaYgjPFwn2sl3L9lTPx858
 C8Tl8q/2/tJC7gwNuU194gJdVRyFP/Xt7687qIeL5wBaUawQTz+k5Ymxaa4aZIT06ydU
 JkQU/uiauoh/VTW9HuSdfx2hkydJ9lZ1ZXKmOQZQY0yaQfeuYaZaZ2NvsJHWRM2pAo44
 azyg==
X-Gm-Message-State: AOAM532i9bSy8C5rzY30cxjQOm7jvupwKUKz33O/NofX/Dr+kNYDnhHr
 nqAwnUcFo/KOWTIqyCTqFrXZR204QpPAVhCm
X-Google-Smtp-Source: ABdhPJyhWX6lJFTRmbfTSW097fH62g8GrypEdNvi071d7KKF629ZroJ/PTw3Lc7YTDe/YnSCML3UUw==
X-Received: by 2002:a17:906:1615:b0:6bb:150f:adf8 with SMTP id
 m21-20020a170906161500b006bb150fadf8mr4719160ejd.272.1649182315546; 
 Tue, 05 Apr 2022 11:11:55 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 et21-20020a170907295500b006e7f1abe2ccsm2612150ejc.75.2022.04.05.11.11.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 11:11:54 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id w4so20530584wrg.12
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 11:11:53 -0700 (PDT)
X-Received: by 2002:adf:9123:0:b0:205:f439:cbdf with SMTP id
 j32-20020adf9123000000b00205f439cbdfmr3560336wrj.513.1649182313067; Tue, 05
 Apr 2022 11:11:53 -0700 (PDT)
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
In-Reply-To: <3e5fa57f-d636-879a-b98f-77323d07c156@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Apr 2022 11:11:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uibu-kZyix7K4_WVc-+C8xpzTqU4WFy7O=6sukMZrX5g@mail.gmail.com>
Message-ID: <CAD=FV=Uibu-kZyix7K4_WVc-+C8xpzTqU4WFy7O=6sukMZrX5g@mail.gmail.com>
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

On Tue, Apr 5, 2022 at 10:36 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 05/04/2022 20:02, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Apr 5, 2022 at 5:54 AM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >>> 3. For DP and eDP HPD means something a little different. Essentially
> >>> there are two concepts: a) is a display physically connected and b) is
> >>> the display powered up and ready. For DP, the two are really tied
> >>> together. From the kernel's point of view you never "power down" a DP
> >>> display and you can't detect that it's physically connected until it's
> >>> ready. Said another way, on you tie "is a display there" to the HPD
> >>> line and the moment a display is there it's ready for you to do AUX
> >>> transfers. For eDP, in the lowest power state of a display it _won't_
> >>> assert its "HPD" signal. However, it's still physically present. For
> >>> eDP you simply have to _assume_ it's present without any actual proof
> >>> since you can't get proof until you power it up. Thus for eDP, you
> >>> report that the display is there as soon as we're asked. We can't
> >>> _talk_ to the display yet, though. So in get_modes() we need to be
> >>> able to power the display on enough to talk over the AUX channel to
> >>> it. As part of this, we wait for the signal named "HPD" which really
> >>> means "panel finished powering on" in this context.
> >>>
> >>> NOTE: for aux transfer, we don't have the _display_ pipe and clocks
> >>> running. We only have enough stuff running to do the AUX transfer.
> >>> We're not clocking out pixels. We haven't fully powered on the
> >>> display. The AUX transfer is designed to be something that can be done
> >>> early _before_ you turn on the display.
> >>>
> >>>
> >>> OK, so basically that was a longwinded way of saying: yes, we could
> >>> avoid the AUX transfer in probe, but we can't wait all the way to
> >>> enable. We have to be able to transfer in get_modes(). If you think
> >>> that's helpful I think it'd be a pretty easy patch to write even if it
> >>> would look a tad bit awkward IMO. Let me know if you want me to post
> >>> it up.
> >>
> >> I think it would be a good idea. At least it will allow us to judge,
> >> which is the more correct way.
> >
> > I'm still happy to prototype this, but the more I think about it the
> > more it feels like a workaround for the Qualcomm driver. The eDP panel
> > driver is actually given a pointer to the AUX bus at probe time. It's
> > really weird to say that we can't do a transfer on it yet... As you
> > said, this is a little sideband bus. It should be able to be used
> > without all the full blown infra of the rest of the driver.
>
> Yes, I have that feeling too. However I also have a feeling that just
> powering up the PHY before the bus probe is ... a hack. There are no
> obvious stopgaps for the driver not to power it down later.

This is why I think we need to move to Runtime PM to manage this. Basically:

1. When an AUX transfer happens, you grab a PM runtime reference that
_that_ powers up the PHY.

2. At the end of the AUX transfer function, you do a "put_autosuspend".

Then it becomes not a hack, right?


> A cleaner design might be to split all hotplug event handling from the
> dp_display, provide a lightweight state machine for the eDP and select
> which state machine to use depending on the hardware connector type. The
> dp_display_bind/unbind would probably also be duplicated and receive
> correct code flows for calling dp_parser_get_next_bridge, etc.
> Basically that means that depending on the device data we'd use either
> dp_display_comp_ops or (new) edp_comp_ops.
>
> WDYT?

I don't think I know the structure of the MSM DP code to make a
definitive answer here. I think I'd have to see a patch. However I'd
agree in general terms that we need some different flows for the two.
;-) We definitely want to limit the differences but some of them will
be unavoidable...


-Doug
