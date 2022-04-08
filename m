Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A864F957E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 14:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E579510EFE4;
	Fri,  8 Apr 2022 12:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FCF10EFE4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 12:20:10 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id f3so7291370qvz.10
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 05:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qnV1xPHXIhELyu3l/Rzc6DpeLBQsaK18p8BjdbQ3rfM=;
 b=m7ai8kdqUTEqZEtxij01ueqIDRNer/to8wJyLd/8iO4+BLLqvAAGiuEGtFzKZVWOI0
 FV/J3KeywgRxq3mhQ0PIgEpaWUYcXq8q5pdUDyuLa1l/zUEF/XmUB07U8oM9Ik0ysJZU
 vtqly3RaJH1bNvzi6uSmk8HQKzgpWr+pZGK+PFytl/a+91zOoys1eTL/TjpBJuuhgLIX
 uSy86jjMuQvtjhuFQhLBllDLqzUq4JtcLaGAZeHjJ2Hv5djMNzin/jFgQ9ZYB435eHS5
 LVdMoExsv9u3WQBoOa1+52e5CSHkH4OyAXpoV7og/Kx2CCxV65JCpbOMII1Aqgj/ppvr
 pw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qnV1xPHXIhELyu3l/Rzc6DpeLBQsaK18p8BjdbQ3rfM=;
 b=fp4uaEYE3QhFVphM/kHwbXUHParwf3E3S+B+e6z0bAWfMbCm86isPaCwA0PBopScEB
 v56r34f3vR3zt+CCoNS+G/AAsOvM3f6NuCKrNUwzJUCLElYoKAEmCRvNbRpSPYnbhrdQ
 vlMD8i7d5FPyU1uR7NPet2iDi1OIsfapONssO6rojLHE/lzPMCDQcf9QEgs3Qo0TprTC
 6sYJYGJM8RsUCv0ImbjvEtwjGMolXQkkREpWborLbgoN4H+fSVpL+wO2N9xTbBUjhZ8W
 6dF6ppXOGsvjpWgMeGDA/eGH34M8fcM4yGypxZo96gNeCJBeAVeNadpnvIfO3HyTfU95
 +Fig==
X-Gm-Message-State: AOAM532DMvpEmkwiDx+HUOCUA/m5txkRfpK9Oo/um3/cdpWuvE9Hd0I1
 yZq59GEdm5jqETBuhuPTaLR+MgRgLBxZO/W74I/WUA==
X-Google-Smtp-Source: ABdhPJyppvxucb4/91IO7XFUMqE5JTo2LAUqFHjQRBj+2zXkmKhMX/jftAjRdF5M39x/wbJKWCwF15Aho5GRj5Cqkkc=
X-Received: by 2002:a05:6214:20e4:b0:441:7bed:5ccd with SMTP id
 4-20020a05621420e400b004417bed5ccdmr16143495qvk.119.1649420409412; Fri, 08
 Apr 2022 05:20:09 -0700 (PDT)
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
 <CAA8EJpqLZ9up4euGEbhf5QyBqm4tJuLcHi7D+0Si7ak9Jej52w@mail.gmail.com>
 <CAD=FV=XwOzsRf7RnvyBjr5TtedMhC0LJFKoK9tp-kw1eEyuJmQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XwOzsRf7RnvyBjr5TtedMhC0LJFKoK9tp-kw1eEyuJmQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Apr 2022 15:19:59 +0300
Message-ID: <CAA8EJprb5UF24WRNvGaY_hSqW--NPd=9=8AaPYWSMbUumNn+dQ@mail.gmail.com>
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

On Fri, 8 Apr 2022 at 03:26, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Apr 7, 2022 at 4:46 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > > The way I'm arguing it should work is that:
> > >
> > > 1. A whole bunch of the DP init code should move to the DP driver's
> > > probe function. This includes parsing the DT, acquiring clocks,
> > > getting a handle to our PHY, and IO mapping registers. As far as I
> > > know, there's no reason to wait on all the components being probed in
> > > order to do this stuff.
> >
> > Yes. And that's one of the reasons I tried to stay away from the DP
> > driver. Each time I open the source code, my hands itch to start
> > refactoring the code.
> >
> > >
> > > 2. Once we have done the above things, it should be possible to do AUX
> > > transfers, correct? ...and then we can populate the AUX bus from the
> > > probe function too.
> >
> > No. In the DP case the AUX bus is inaccessible until the dongle is
> > plugged (see all the HPD handling, phy_init()/phy_power_on() is hidden
> > somewhere in that path)
>
> I guess my thought was that in DP you could still create the AUX bus
> at probe time. Then for DP you just return an instant "transfer
> failed" from the AUX bus if HPD isn't asserted. For eDP (as discussed
> elsewhere) when we try to do an AUX transfer then we delay until HPD
> is there.

I think panel-edp would already handle the delay, so we do not need to
have this logic in the DP driver.

> So we can still acquire resources (clocks, PHY, io maps, etc) at probe
> time for DP and create the AUX bus, right? It will just return
> "-ENODEV" if HPD isn't asserted and you're DP?

Yes, please. I still suppose that we'd need a separate case to
power_on eDP's PHY during the probe time. Maybe I'm mistaken here.

-- 
With best wishes
Dmitry
