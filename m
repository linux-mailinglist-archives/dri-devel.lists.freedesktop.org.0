Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 675C1391AFF
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 17:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F33A6EDB3;
	Wed, 26 May 2021 15:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A556EDB3;
 Wed, 26 May 2021 15:00:57 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id 124so1244891qkh.10;
 Wed, 26 May 2021 08:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IkLU3uWePaDxD/NdiontwagHrNF48wFOtRXP+VjWATI=;
 b=qlHrqcG1+0gAL6VnluGLOdCxuzyVJzETlRQEugVCmh31XWVJ9/XTgZ9qNSV3hpKhBH
 guwhqXfiiWZ07Z3nOeYbeQ+Tq8f//liZCyt4ldlF3AgkIiQral/X9NljXNIvOOzpbNei
 OafqjCgf7jKAdlt2PWyitI0IUv8FYi9yJqlydqSOSQDWh/hmciGZvmsDFlQb0XmmrUqc
 qZML+012px+9Xy6EFrx9vWbi0AERolwwS90tOnuSFb/LNjiK1iWQQTflNThdkTDY8S3k
 W+O8Tuug+Mt3EagLhm+8gnFzHztvo8w8B8aAOcmHgGhv4n5ULtrrsAcgNO6QniQfDoYM
 wc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IkLU3uWePaDxD/NdiontwagHrNF48wFOtRXP+VjWATI=;
 b=oRsImdXcRPgZrYEgBOyox/ltbBqhs1BzdF9pGHEftghVuaFotRv1y0WPF/mJHA7N/G
 rbPi7K5ImRWL2DErUJrhXBEuE452Ly5WlK7DykMhnBfzWkNyuwa0cBfV8q/sM/p0cQjS
 Y3Imx5/F+rwuLphxntExjlwQ0LFh3DVZFR/388LwGlvWap3Nm4Xwzyi2PoFvPOiIHRLV
 wqTarL2xhli2NSMOxEeAWg4yDWzEUjnf7J4tIescIwg2GznVTEoC8LsZvhLTcRjp/GPI
 Sc6TYWQMAQVB0bZUTrZDtHTJ2JnPkwJTAKlX2cB+xLj0URxZoFrRxZGNUFmoBl44LRX1
 HvfQ==
X-Gm-Message-State: AOAM531UXyQnIc7wAwQ9at5mSa+cHXcD84R3t7K5NwdH92kAPAfRuyct
 vKsnW17p7AwzDlreAHNotmFrzwlH9sNQBm6PTnA=
X-Google-Smtp-Source: ABdhPJyocjvgfukJJ/VBXy2nM30jzHuQf3cR9GiU0ZGt71xcVgV6jLZiF0So7OewzUV+9YvS5OOb5+Osry58Tkemg8Q=
X-Received: by 2002:a05:620a:12a6:: with SMTP id
 x6mr40061592qki.364.1622041256304; 
 Wed, 26 May 2021 08:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <CAOCk7Nqep_Db+z3fr5asHZ1u0j8+6fKkPFs2Ai8CbA_zGqV6ZA@mail.gmail.com>
 <YK3gxqXBRupN/N+Q@vkoul-mobl.Dlink>
In-Reply-To: <YK3gxqXBRupN/N+Q@vkoul-mobl.Dlink>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Wed, 26 May 2021 09:00:45 -0600
Message-ID: <CAOCk7NqvhGvYw8xCBctqj7H+o-Qwp2UuUJK1gatW9EWfXv56xA@mail.gmail.com>
Subject: Re: [Freedreno] [RFC PATCH 00/13] drm/msm: Add Display Stream
 Compression Support
To: Vinod Koul <vkoul@kernel.org>
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
Cc: DTML <devicetree@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 25, 2021 at 11:46 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> Hello Jeff,
>
> On 21-05-21, 08:09, Jeffrey Hugo wrote:
> > On Fri, May 21, 2021 at 6:50 AM Vinod Koul <vkoul@kernel.org> wrote:
> > >
> > > Display Stream Compression (DSC) compresses the display stream in host which
> > > is later decoded by panel. This series enables this for Qualcomm msm driver.
> > > This was tested on Google Pixel3 phone which use LGE SW43408 panel.
> > >
> > > The changes include adding DT properties for DSC then hardware blocks support
> > > required in DPU1 driver and support in encoder. We also add support in DSI
> > > and introduce required topology changes.
> > >
> > > In order for panel to set the DSC parameters we add dsc in drm_panel and set
> > > it from the msm driver.
> > >
> > > Complete changes which enable this for Pixel3 along with panel driver (not
> > > part of this series) and DT changes can be found at:
> > > git.linaro.org/people/vinod.koul/kernel.git pixel/dsc_rfc
> > >
> > > Comments welcome!
> >
> > This feels backwards to me.  I've only skimmed this series, and the DT
> > changes didn't come through for me, so perhaps I have an incomplete
> > view.
>
> Not sure why, I see it on lore:
> https://lore.kernel.org/dri-devel/20210521124946.3617862-3-vkoul@kernel.org/
>
> > DSC is not MSM specific.  There is a standard for it.  Yet it looks
> > like everything is implemented in a MSM specific way, and then pushed
> > to the panel.  So, every vendor needs to implement their vendor
> > specific way to get the DSC info, and then push it to the panel?
> > Seems wrong, given there is an actual standard for this feature.
>
> I have added slice and bpp info in the DT here under the host and then
> pass the generic struct drm_dsc_config to panel which allows panel to
> write the pps cmd
>
> Nothing above is MSM specific.. It can very well work with non MSM
> controllers too.

I disagree.

The DT bindings you defined (thanks for the direct link) are MSM
specific.  I'm not talking (yet) about the properties you defined, but
purely from the stand point that you defined the binding within the
scope of the MSM dsi binding.  No other vendor can use those bindings.
Of course, if we look at the properties themselves, they are prefixed
with "qcom", which is vendor specific.

So, purely on the face of it, this is MSM specific.

Assuming we want a DT solution for DSC, I think it should be something
like Documentation/devicetree/bindings/clock/clock-bindings.txt (the
first example that comes to mind), which is a non-vendor specific
generic set of properties that each vendor/device specific binding can
inherit.  Panel has similar things.

Specific to the properties, I don't much like that you duplicate BPP,
which is already associated with the panel (although perhaps not in
the scope of DT).  What if the panel and your DSC bindings disagree?
Also, I guess I need to ask, have you read the DSC spec?  Last I
looked, there were something like 3 dozen properties that could be
configured.  You have five in your proposed binding.  To me, this is
not a generic DSC solution, this is MSM specific (and frankly I don't
think this supports all the configuration the MSM hardware can do,
either).

I'm surprised Rob Herring didn't have more to say on this.

> I didn't envision DSC to be a specific thing, most of
> the patches here are hardware enabling ones for DSC bits for MSM
> hardware.
>
> > Additionally, we define panel properties (resolution, BPP, etc) at the
> > panel, and have the display drivers pull it from the panel.  However,
> > for DSC, you do the reverse (define it in the display driver, and push
> > it to the panel).  If the argument is that DSC properties can be
> > dynamic, well, so can resolution.  Every panel for MSM MTPs supports
> > multiple resolutions, yet we define that with the panel in Linux.
>
> I dont have an answer for that right now, to start with yes the
> properties are in host but I am okay to discuss this and put wherever we
> feel is most correct thing.  I somehow dont like that we should pull
> from panel DT and program host with that. Here using struct
> drm_dsc_config allows me to configure panel based on resolution passed

I somewhat agree that pulling from the panel and programing the host
based on that is an odd solution, but we have it currently.  Have a
look at Documentation/devicetree/bindings/display/panel in particular
panel-timing.  All of that ends up informing the mdss programing
anyways (particularly the dsi and its phy).  So my problem is that we
currently have a solution that seems to just need to be extended, and
instead you have proposed a completely different solution which is
arguably contradictory.

However, I'd like to see thoughts from Rob Clark, David, and any
others that typically handle this stuff (maybe Sam Ravenborg from the
panel side?).  I consider them to be the experts, and if they think
your solution is the way to go, I'll shut up.  I consider myself to be
a novice that has dabbled in this area, and while this currently
doesn't make sense to me, maybe I need some education here to see the
light.

> > Finally, I haven't seen the DT bits, but I'm concerned about using DT
> > for this.  It inherently excludes ACPI systems.  You appear to have
> > sdm845 support in this series, but what about ACPI boot on the Lenovo
> > C630 for example?  Or any of the 8cx laptops?  We don't read the panel
> > resolution, etc from DT, so why the DSC?
>
> But you must read from somewhere like ACPI tables. I think ACPI systems
> would have some ACPI table info out there which would help on this.
> Yes that is another task which we need to start with once we enable OF
> systems.

Frankly, I don't like the MSM ACPI solution that I've seen on the laptops.
The ACPI assumes the entire MDSS (including DSI parts) and GPU is one
device, and ultimately handled by one driver.  That driver needs to
get a value from UEFI (set by the bootloader) that is the "panel id".
Then the driver calls into ACPI (I think its _ROM, but I might be
mistaken, doing this from memory) with that id.  It gets back a binary
blob which is mostly an xml file (format is publicly documented) that
contains the panel timings and such.

Generally we've defined simple-panel entities for these, with the
timings in code (you can see what Bjorn and I have upstreamed), and
just match on the compatible.

In summary, I don't mean to be difficult, I just think this solution
needs more "baking".
