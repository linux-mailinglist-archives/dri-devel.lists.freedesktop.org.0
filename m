Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B4E46C1BC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 18:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81242EBFAA;
	Tue,  7 Dec 2021 17:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932C9EBFAA
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 17:28:30 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 n104-20020a9d2071000000b005799790cf0bso19018009ota.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 09:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cAiQf0ONQNJNMdL3+jUJU+JidwXWLCQpiHOB2RtvqCE=;
 b=KvCQ6dF4flLsJTf0KvEcK4GIjyYXs2v/mFJobl/fJywV5MqL8F7fLCBbUfWg2ncDhf
 S1Ccq6b0r+ZOEKE1yuHcuS/5Qo2/gqzus+eCTa6mJxR+vrO1OW3nIPw28SMDC8AuRjgQ
 u/Jg8q6DyV9KSj+O72quvvZISTrOLDjAYjKvukolgNttyjAxFpeWY/I0j9PDeJZQf570
 p/rHUMcb3YQGCpy5FuwWyzL4IscZWFuQDiTFibOB6jybLLsn+t1wisDq/kz8c+4Ztjx8
 DQutOJMLfCusc7SzJ0f84zDVU2CowjDO1kppUEilla3cfdCELyuWPbVCvZEqlfZ9lVNv
 3TIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cAiQf0ONQNJNMdL3+jUJU+JidwXWLCQpiHOB2RtvqCE=;
 b=K2l8GF3g6tznhTWk1/+Hu7nIZaefmu9Z233u3v1Yu2MP12tjjI5gWszi0tAB//BZiF
 Qnwf2nCkX/WRGDd61dB/wansxvLAXVnzfx3ZE75iKdNuOVSVkeoS6TlkcyGOzMUfnU+t
 UffaSQwr0ekzj+LCGZ0nAdj8U3xYntOD94jn2bKOKX3NAvrn9k2PYqlts+Cw5PA2N/ed
 Tg9vvHGTYjEjChG/9SUAPFWxyTgxfwzzNenWDptffju2yozAcjPv6p+8MpVKKKtKxY3P
 YQPh1+MrHJSzMHSVvuTkAuQqK9Zgyn+Svj9uk/Bw4JvTpqokYJ9ImEL7vIanTT3OTuTD
 c3vw==
X-Gm-Message-State: AOAM532o/CgJfQf60OXD4KL9h6vc06MSF8+XkWbuI14h6Vexe3F30Ipk
 wvJQA3E78X2il2fSimbj1g1Vlg==
X-Google-Smtp-Source: ABdhPJxpv2sQTpaNTYyMr91f6tCuspeaXuCJcm8jiGxkp55PT3GbiwK0ScBsEtJNNeNKjyQ+l1mvBA==
X-Received: by 2002:a05:6830:453:: with SMTP id
 d19mr36870191otc.72.1638898109698; 
 Tue, 07 Dec 2021 09:28:29 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id q10sm60905oiw.17.2021.12.07.09.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 09:28:28 -0800 (PST)
Date: Tue, 7 Dec 2021 09:29:54 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
Message-ID: <Ya+aEr+XWTjdcTt9@ripper>
References: <CAD=FV=W9uKq00wXn4H1ax0u2D=R8Wn3J-Je43uxcPyDtk7AK7Q@mail.gmail.com>
 <YVyMwsvLl6XalJxB@ripper>
 <CAD=FV=WY+g38p7--QKZCaQnSqx7VvdwC36jH-VKnrEWoxK=XHQ@mail.gmail.com>
 <YV0KBWxVtKgOp2Cj@ripper>
 <CAD=FV=X5JFE3u9BtxxocaUrYNSpYXJN90UJ8HOvXZE6oYiVsDQ@mail.gmail.com>
 <CACeCKac4b_ej87cQD692TNwpsoFsmBwDcSeLy5fp+pvLX1si7g@mail.gmail.com>
 <YV7JNH9QvI4cBz5s@kuha.fi.intel.com> <Ya6PTGN4zaZ8RD9K@ripper>
 <Ya9S3cFo0rOUotqY@kuha.fi.intel.com>
 <1932c73c-e372-788b-fcbd-13cad52d96da@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1932c73c-e372-788b-fcbd-13cad52d96da@redhat.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 LKML <linux-kernel@vger.kernel.org>, Kuogee Hsieh <khsieh@codeaurora.org>,
 Prashant Malani <pmalani@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Vara Reddy <varar@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 07 Dec 08:56 PST 2021, Hans de Goede wrote:

> Hi all,
> 
> On 12/7/21 13:26, Heikki Krogerus wrote:
> > +Hans and Imre
> > 
> > On Mon, Dec 06, 2021 at 02:31:40PM -0800, Bjorn Andersson wrote:
> >> On Thu 07 Oct 03:17 PDT 2021, Heikki Krogerus wrote:
> >>> On Wed, Oct 06, 2021 at 01:26:35PM -0700, Prashant Malani wrote:
> >>>> (CC+ Heikki)
> >> [..]
> >>>> On Wed, Oct 6, 2021 at 8:19 AM Doug Anderson <dianders@chromium.org> wrote:
> >> [..]
> >>>         void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode);
> >>>
> >>> If your USB Type-C controller/port driver does not yet register the DP
> >>> alt mode, the it's responsible of handling HPD separately by calling
> >>> drm_connector_oob_hotplug_event() on its own.
> >>>
> >>
> >> Finally found my way back to this topic and it doesn't look like I can
> >> reuse the existing altmode code with the firmware interface provided by
> >> Qualcomm, so  I just hacked something up that invokes
> >> drm_connector_oob_hotplug_event().
> >>
> >> But I'm not able to make sense of what the expected usage is. Reading
> >> altmode/displayport.c, it seems that I should only invoke
> >> drm_connector_oob_hotplug_event() as HPD state toggles.
> >>
> >> I made a trial implementation of this, where my firmware interface
> >> driver calls drm_connector_oob_hotplug_event() every time HPD state
> >> changes and then in my oob_hotplug_event callback I flip the DP
> >> controller between on and off.
> >>
> >> Unfortunately when I then connect my HDMI dongle, I get HPD state HIGH,
> >> call the oob_hotplug_event, the DP driver powers up and concludes that
> >> there's nothing connected to the dongle and goes to idle. I then connect
> >> the HDMI cable to the dongle, the firmware sends me another message with
> >> HPD irq and state HIGH, which I ignore because it's not a change in
> >> state.
> >>
> >> In the end I hacked up drm_connector_oob_hotplug_event() to allow me to
> >> pass the HPD state and this solves my problem. I can now distinguish
> >> between connect, disconnect and attention.
> >>
> >> Can you please help shed some light on what I might be missing?
> 
> The plan always was to pass some extra information, like the number
> of available DP lanes (which can make training faster) along as
> parameter to the drm_connector_oob_hotplug_event().
> 
> The merged version ended up not doing this because there were no
> consumers, but passing additional info like HPD state definitely
> is ok.
> 

Thanks, that clarifies things.

I think it makes sense to pass #lanes, as that would rule out the
possibility of attempting to run 4 lanes per dpcd information over a
2-lane mux configuration as well.

I will write up some patches.

Regards,
Bjorn
