Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BB951924A
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 01:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC43510FFE1;
	Tue,  3 May 2022 23:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876B110FFE1
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 23:24:13 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id k23so36197119ejd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 16:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pb2U3zzfrat2Xd0DhY49bpvdy5b4ExUKudiUVsDW2+w=;
 b=j2Ims4VZpVmii4E0axF1CCzezk8fwHYMt/8idecqKu1txaHoaQXg6+B0OvU5mEDEVw
 UG1+OP9QqPtFm9+LbKBcl8eD52RmqUp6vujaPn7DKSBdvTDvilEqdaCTbgyl8xtbp4+T
 xTEZaTKDLWIFhkzwq/5AsD+3oFVfy3EXQilpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pb2U3zzfrat2Xd0DhY49bpvdy5b4ExUKudiUVsDW2+w=;
 b=bzG4108+NvSiJmLuzB3gb28gsdwJw1wERh2PF0V+8J4z9co132Cl+QBbbsh1o/XKyQ
 W7t6qX9P35qBh5BnZORdacvyCZgoQi0WsBJyz0r6omHI/ssPmevbkrH35mSfUp5ZxUZi
 VgjtUomldE2WaBofphyJ++3fX0eCWnJ9ByE/sxd0XLiE3ceHIe6kPm/ppvmFdSgN1WY8
 jTGeTtBOW7V9TNZx2kmjMI2Uw2hhfbg6cxXwKrSMnHweL4SzplX5eX/8jSt1zsxZF8iX
 NWxBEKXjn/yjy/nvW8+EVu32lsZ15dePsN8/kslxzsuoz6//tiH4+9xk/PkfAC0uOLqo
 B9lg==
X-Gm-Message-State: AOAM533arm1AADPBEw2vbzfgbtADhrRy7JVaikqO8ikHIMz7p/OOx0Ra
 o+hs/WBMhEKLAKA2rN2SomK7ULTOSA7sajmj
X-Google-Smtp-Source: ABdhPJwkQFfQPMhtcbSO4FO7htTboUEByPLh9Hh2y8uPIG1013X5Kn8I5JEa6n1hflERGhOyvorYxg==
X-Received: by 2002:a17:907:1c25:b0:6f4:342f:51e6 with SMTP id
 nc37-20020a1709071c2500b006f4342f51e6mr13261262ejc.740.1651620251860; 
 Tue, 03 May 2022 16:24:11 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51]) by smtp.gmail.com with ESMTPSA id
 ec43-20020a0564020d6b00b0042617ba6394sm8415768edb.30.2022.05.03.16.24.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 16:24:10 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id i5so25204534wrc.13
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 16:24:08 -0700 (PDT)
X-Received: by 2002:a5d:42c8:0:b0:20a:d91f:87b5 with SMTP id
 t8-20020a5d42c8000000b0020ad91f87b5mr14592104wrr.301.1651620248197; Tue, 03
 May 2022 16:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220409023628.2104952-1-dianders@chromium.org>
 <20220408193536.RFC.1.I4182ae27e00792842cb86f1433990a0ef9c0a073@changeid>
 <a9a5dfb7-819b-d3a2-2c47-d5b239d21ad3@linaro.org>
 <CAD=FV=WKwErpD7iCu+2jFvMutmmmgLUEhAnw8s=27wUxcpF-aQ@mail.gmail.com>
 <CAA8EJppOVqaAEVeQY7p0EfCObJxfL591kbaYLYfbgOHHtmfhXw@mail.gmail.com>
 <CAD=FV=UmXzPyVOa-Y0gpY0qcukqW3ge5DBPx6ak88ydEqTsBiQ@mail.gmail.com>
 <ddb8d8fa-89dc-268b-0505-9ee7df8c272e@linaro.org>
 <CAD=FV=Ur3afHhsXe7a3baWEnD=MFKFeKRbhFU+bt3P67G0MVzQ@mail.gmail.com>
In-Reply-To: <CAD=FV=Ur3afHhsXe7a3baWEnD=MFKFeKRbhFU+bt3P67G0MVzQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 3 May 2022 16:23:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WSXUB_yQWtCVQuHvnAWvPJDaiCTyc5o5cR3fH78nJ3hA@mail.gmail.com>
Message-ID: <CAD=FV=WSXUB_yQWtCVQuHvnAWvPJDaiCTyc5o5cR3fH78nJ3hA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] drm/dp: Helpers to make it easier for drivers to
 use DP AUX bus properly
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Apr 18, 2022 at 4:10 PM Doug Anderson <dianders@chromium.org> wrote:
>
> > > 5. In general I've been asserting that it should be up to the panel to
> > > power things on and drive all AUX transactions. ...but clearly my
> > > model isn't reality. We certainly do AUX transactions from the DP
> > > driver because the DP driver needs to know things about the connected
> > > device, like the number of lanes it has, the version of eDP it
> > > supports, and the available bit rates to name a few. Those things all
> > > work today by relying on the fact that pre-enable powers the panel on.
> > > It's pretty easy to say that reading the EDID (and I guess AUX
> > > backlight) is the odd one out. So right now I guess my model is:
> > >
> > > 5a) If the panel code wants to access the AUX bus it can do so by
> > > powering itself on and then just doing an AUX transaction and assuming
> > > that the provider of the AUX bus can power itself on as needed.
> > >
> > > 5b) If the DP code wants to access the AUX bus it should make sure
> > > that the next bridge's pre_enable() has been called. It can then
> > > assume that the device is powered on until the next bridge's
> > > post_disable() has been called.
> > >
> > > So I guess tl;dr: I'm not really a huge fan of the DP driver powering
> > > the panel on by doing a pm_runtime_get() on it. I'd prefer to keep
> > > with the interface that we have to pre_enable() the panel to turn it
> > > on.
> >
> > Again, thank for the explanation. Your concerns make more sense now.
> > As much as I hate writing docs, maybe we should put at least basic notes
> > (regarding panel requirements) somewhere to the DP/DP AUX documentation?
>
> Sure. I actually don't mind writing docs, but my problem is trying to
> figure out where the heck to put them where someone would actually
> notice them. I could throw a blurb in the kernel doc for `struct
> drm_dp_aux` I guess? How about a deal: if you can tell me where to put
> the above facts (essentially 5a and 5b) then I'm happy to post a patch
> adding them.
>
> Huh, actually, maybe the right place is in the "transfer" function of
> that structure which, as of commit bacbab58f09d ("drm: Mention the
> power state requirement on side-channel operations"), actually has a
> blurb. ...but I don't think the blurb there is totally complete. What
> if I changed it to this:
>
>  * Also note that this callback can be called no matter the
>  * state @dev is in and also no matter what state the panel is
>  * in. It's expected:
>  * - If the @dev providing the AUX bus is currently unpowered then
>  *   it will power itself up for the transfer.
>  * - If the panel is not in a state where it can respond (it's not
>  *   powered or it's in a low power state) then this function will
>  *   fail. Note that if a panel driver is initiating a DP AUX transfer
>  *   it may power itself up however it wants. All other code should
>  *   use the pre_enable() bridge chain (which eventually calls the
>  *   panel prepare function) to power the panel.

I didn't ignore this documentation request. Please take a look here
and see what you think:

https://lore.kernel.org/r/20220503162033.1.Ia8651894026707e4fa61267da944ff739610d180@changeid

-Doug
