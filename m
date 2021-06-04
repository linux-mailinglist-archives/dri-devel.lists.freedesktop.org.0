Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7885E39B06B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 04:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1B26F566;
	Fri,  4 Jun 2021 02:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45186F565;
 Fri,  4 Jun 2021 02:32:51 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 v206-20020a1cded70000b02901a586d3fa23so473729wmg.4; 
 Thu, 03 Jun 2021 19:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XfVLX4YtEZs428uaQPfb/mY1tDAn6l5ncSwMdycpblI=;
 b=p5drJ8OPu0/hfTaQXi2OyrCV3UE0/bcH3ckTmA6EC2x2//1neicrguJZw+egplGj7e
 cbrQ9OpDwX1uZqU9IGP7ncGktMXUx4UviQhIeb20d06j/E5NfmU1+gfXjEag7tXpmj+I
 i2uG7BIAYtnWU4xdCU0QenmkqC2pTBAEcWq0SuNYcncS1waJTJcR4CZZZqIqul4845tD
 wlf1Kv9hg49UzNfmMHyN5Geif4mqiUUMBRTbyMWtjpNgrIrS5Npb17wxil5Gpc4cXEhd
 ye7CeseV4uBnq37kFnGOz1WtIqvJPs60R9aq1HK4S3jxjF2K6Udk3uDqLlPin73no4HA
 VOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XfVLX4YtEZs428uaQPfb/mY1tDAn6l5ncSwMdycpblI=;
 b=M5fqAk0cLQxvghFMoBHmiEApZkTeY9L+xFEnvvasdmMN0Jtzp2mFC5pPTJW81slH/D
 8H3pdpDcaHqZgCEvSCYGP9vGhD7Xo3xRy8OQ+VfH1hzWkggymWUAtav5tBHUw+q0/dkX
 u/KQJz5DJlm4ZfMf1wik+WxZ2qPI7s6R4KG+UtNMWc/3rDUAzNmPmgSkxsk03VcSkI6y
 eqHTGliOS+xyYZUgdxMS7sEZ4XUdadsvvAQc1FK0j1sMz+4EeTJbS/3589gshKA62xZE
 ysmgqbdP8q8+lxlNQbS14fKIIwP7/w4O4+Hbw5o+Qe/PlbzJB4eR1I7QiZ0Mr9MCpGMe
 oY+A==
X-Gm-Message-State: AOAM531o+oSwzpf7UZSYrb1FKIqByRY53e7KVy5fHIdpIFE2yTQqWluH
 LnodIYhiRIe7X7EIIGRHigtgs0GSZqYGiFxcNak=
X-Google-Smtp-Source: ABdhPJxmpIfDqZXuShm76OqWvHKkOU4l5zonimZqTYUKsjU+Sqv/oJyOxy/U8P1238Okoxuj2H3MGCtE1stmFsOfTU4=
X-Received: by 2002:a05:600c:2054:: with SMTP id
 p20mr843886wmg.175.1622773970471; 
 Thu, 03 Jun 2021 19:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <CAOCk7Nqep_Db+z3fr5asHZ1u0j8+6fKkPFs2Ai8CbA_zGqV6ZA@mail.gmail.com>
 <YK3gxqXBRupN/N+Q@vkoul-mobl.Dlink>
 <CAOCk7NqvhGvYw8xCBctqj7H+o-Qwp2UuUJK1gatW9EWfXv56xA@mail.gmail.com>
 <CAF6AEGuoyPr8PgfwFX0JCYZ7S_pryn_OXacHBqoMAAPvSq6aRw@mail.gmail.com>
 <YLdlEB3Ea6OWaLw4@vkoul-mobl>
In-Reply-To: <YLdlEB3Ea6OWaLw4@vkoul-mobl>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 3 Jun 2021 19:36:42 -0700
Message-ID: <CAF6AEGvS2uL1eEeCKQ5wDX4+yRZuOTHzFOv9Kiu09HO2r9xzHQ@mail.gmail.com>
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
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 2, 2021 at 4:01 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 27-05-21, 16:30, Rob Clark wrote:
> > On Wed, May 26, 2021 at 8:00 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
> > > On Tue, May 25, 2021 at 11:46 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> > > Frankly, I don't like the MSM ACPI solution that I've seen on the laptops.
> > > The ACPI assumes the entire MDSS (including DSI parts) and GPU is one
> > > device, and ultimately handled by one driver.  That driver needs to
> > > get a value from UEFI (set by the bootloader) that is the "panel id".
> > > Then the driver calls into ACPI (I think its _ROM, but I might be
> > > mistaken, doing this from memory) with that id.  It gets back a binary
> > > blob which is mostly an xml file (format is publicly documented) that
> > > contains the panel timings and such.
> >
> > tbh, I kinda suspect that having a single "gpu" device (which also
> > includes venus, in addition to display, IIRC) in the ACPI tables is a
> > windowsism, trying to make things look to userspace like a single "GPU
> > card" in the x86 world.. but either way, I think the ACPI tables on
> > the windows arm laptops which use dsi->bridge->edp is too much of a
> > lost cause to even consider here.  Possibly ACPI boot on these devices
> > would be more feasible on newer devices which have direct eDP out of
> > the SoC without requiring external bridge/panel glue.
>
> yeah that is always a very different world. although it might make sense
> to use information in tables and try to deduce information about the
> system can be helpful...
>
> > I'd worry more about what makes sense in a DT world, when it comes to
> > DT bindings.
>
> And do you have thoughts on that..?

Only that I wouldn't get too hung up on existing snapdragon ACPI
tables.. not sure if there is prior art as far as ACPI tables for this
on x86 systems, if so that *might* be a thing to consider, but
otherwise it does sound a bit like we want less qcom specific bindings
here.  But other than that I'll leave it to folks who spend more time
thinking about bindings.. left to my own devices I'd come up with a
point solution and go back to working on mesa, so that probably isn't
the opinion you want to follow ;-)

BR,
-R
