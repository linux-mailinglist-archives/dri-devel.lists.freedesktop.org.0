Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 908C84F8A8C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 02:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684C710EE72;
	Fri,  8 Apr 2022 00:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F1410EE70
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 00:21:24 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id c42so8282519edf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 17:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4AEJnP5mTsYddtMXtuB9PzpAwm62Zr/93tws7knCoTY=;
 b=FrYI2nBdk+yG/OOXXygzXyvL+ZpcWJWtKe8unV3SbCy1rXBwNnk84WeXyNP/2VlDJy
 Kg/uBh0NPlU2+DivSPdwyS8dsLdPzD8+y5xmEtYYC5jD30jJr5S+ozejI/3/UdKogkht
 sWSHEixJSYchJR9gauZlQDTuFx098SCzhXo+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4AEJnP5mTsYddtMXtuB9PzpAwm62Zr/93tws7knCoTY=;
 b=U6i/FdDQl4FiSCsXXgJcck8XombEDPYXknySQKUBbr9Ojq+JbSxzypGZQk6h9Ha8Qn
 3kxhpalYc/IE5Jj98JpkNdhqQo+uV1aTVk07vcnnI4BtO66Ni5V1ekXQMaBhvq7/taKv
 yln/1zTS+BifTuuuzd8kddRjsrwEfW1X53iFNpweWqsOZQOZ9m3HsVkfDb1Trg35PwIF
 sNT9EI2uGaTqKhRBwrUmNK9zKR5bctEhZ+wGGJfFncpb0wA4jtzAgwr1J7MJZ4+J2uee
 jFd+4l+L4qpIq0WE0IrS6QnPTGWvUqwHbnKKLQezZwP4L8e15UwYk8KaUtFPYWvtbs0F
 +K+g==
X-Gm-Message-State: AOAM532jrmY6XFH+523FkapN4a9Pb0LHLN1M0j7EdG0QmErGcv0TfKvm
 Rrb3reDFi47dc5hD+SW5Fj4AAJ0nM9ZbcL6vTbk=
X-Google-Smtp-Source: ABdhPJzosyjeUYBK2ctWLss/FkR2oocVQ8TftVj53c0g77U/a98afrn5hih8IgQA30oQtwNJss1nxg==
X-Received: by 2002:a05:6402:1d51:b0:418:bd81:78b3 with SMTP id
 dz17-20020a0564021d5100b00418bd8178b3mr16544219edb.46.1649377282524; 
 Thu, 07 Apr 2022 17:21:22 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51]) by smtp.gmail.com with ESMTPSA id
 m2-20020a50e1c2000000b0041d121b095fsm883261edl.67.2022.04.07.17.21.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 17:21:19 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id h4so10477884wrc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 17:21:19 -0700 (PDT)
X-Received: by 2002:a5d:568e:0:b0:207:8d1a:46c6 with SMTP id
 f14-20020a5d568e000000b002078d1a46c6mr3186227wrv.422.1649377278855; Thu, 07
 Apr 2022 17:21:18 -0700 (PDT)
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
In-Reply-To: <CAA8EJpqLZ9up4euGEbhf5QyBqm4tJuLcHi7D+0Si7ak9Jej52w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 7 Apr 2022 17:21:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XwOzsRf7RnvyBjr5TtedMhC0LJFKoK9tp-kw1eEyuJmQ@mail.gmail.com>
Message-ID: <CAD=FV=XwOzsRf7RnvyBjr5TtedMhC0LJFKoK9tp-kw1eEyuJmQ@mail.gmail.com>
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

Hi,

On Thu, Apr 7, 2022 at 4:46 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> > The way I'm arguing it should work is that:
> >
> > 1. A whole bunch of the DP init code should move to the DP driver's
> > probe function. This includes parsing the DT, acquiring clocks,
> > getting a handle to our PHY, and IO mapping registers. As far as I
> > know, there's no reason to wait on all the components being probed in
> > order to do this stuff.
>
> Yes. And that's one of the reasons I tried to stay away from the DP
> driver. Each time I open the source code, my hands itch to start
> refactoring the code.
>
> >
> > 2. Once we have done the above things, it should be possible to do AUX
> > transfers, correct? ...and then we can populate the AUX bus from the
> > probe function too.
>
> No. In the DP case the AUX bus is inaccessible until the dongle is
> plugged (see all the HPD handling, phy_init()/phy_power_on() is hidden
> somewhere in that path)

I guess my thought was that in DP you could still create the AUX bus
at probe time. Then for DP you just return an instant "transfer
failed" from the AUX bus if HPD isn't asserted. For eDP (as discussed
elsewhere) when we try to do an AUX transfer then we delay until HPD
is there.

So we can still acquire resources (clocks, PHY, io maps, etc) at probe
time for DP and create the AUX bus, right? It will just return
"-ENODEV" if HPD isn't asserted and you're DP?

-Doug
