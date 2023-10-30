Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6617DBB16
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 14:48:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C62B10E036;
	Mon, 30 Oct 2023 13:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCA810E036
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 13:48:21 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-5a7c011e113so43593637b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 06:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698673700; x=1699278500; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/QK37myBu/cKzp0VAj8p8jgZVEezxxNjm8UB17CaHe8=;
 b=CJaihnMMsF6TDMggeuzAMc/fG0W08lEm6im6LLqruxKTz5RcQ6CpY2OjkoFxOnfSH6
 /L9LiQNT8mxrDOE6CS5qkxOYQ4hZZ3W5PweTXJ371b56xNkY4Ft8KWHARLPU6IaGbbd5
 1BbcB9y4iy/o9+ntjPdX4mTUVT8C+ITJUhgTeDWXtdN6yARBRtYig/m/ATJcXWCo9s+f
 3eGa4NrnhhjXo+CbSfIk71n9Hwzrctt433Fc3D7LlE3NUheAd1/rQKzoPuiOSYLtK+5+
 F2IO8sZWihuIOvkQCtZ/DbnEfIH4mthLr9z5FEIdjN2neC4XD21sAT7YvjeOdHBq2yBx
 cVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698673700; x=1699278500;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/QK37myBu/cKzp0VAj8p8jgZVEezxxNjm8UB17CaHe8=;
 b=UiBmZ0unFs0qHLVTk2gr7Kd60VjeIrNPfdg6Us4d1ErBtR98tvtE2BuxvkYZ0xQZCN
 emMCBD92JfsGWqJKeQyJ0SEBtGO5M2awcWTjKdxcOILZBgUl/FRFli2rRaoKCQJaAZSY
 V7t/h18Ik4VvL2Q2iGIhBiEhcrF2hkhh6RcXJmeiyTJX+edrFSiFMxDXIVcZtBxRK5Qu
 wUGnfk4U1X210xy9IFtbK+fS3Um2GcgBmcVwfk2vCGpbaCUCDXAkx1lXnpWHUStbP2Nj
 2mzegIP2Q5hMifRtlK6FFhFonR2CvVhN8/C9JL10z/TgBEqMF3Xim4krKcjZbrCM1KNc
 gHmA==
X-Gm-Message-State: AOJu0Yx+Kx67qjum3BS8383xyrE4VYVsnyFd9sEKt30lzuKdbcaqC9s1
 myY4u4QXlIKeNgJbkyWfU3MzBEZmkESX2cfR60HUjFvwJHXdBCep1G2DcQ==
X-Google-Smtp-Source: AGHT+IFCDO/6sTmBHcCgCAiaYVnuciTSkH2fTAfRf43Y1WdnIB5kEr/CcJDEnvfUQzWq/tcYdQ8R7ibswPrvB+81ka4=
X-Received: by 2002:a81:a8c3:0:b0:595:89b0:6b41 with SMTP id
 f186-20020a81a8c3000000b0059589b06b41mr9181168ywh.38.1698673700541; Mon, 30
 Oct 2023 06:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231029194607.379459-1-suijingfeng@loongson.cn>
 <20231029194607.379459-3-suijingfeng@loongson.cn>
 <CAA8EJprjQXcTgxnC1POaBjVBzyVBvKpmKyJcCR5ExRUhVxtYoQ@mail.gmail.com>
 <3ccb9600-6990-4ec7-81de-0d7b4e1294eb@loongson.cn>
 <CAA8EJpqCe2j3GyeutnwTB0bkGXGk0az9-w3sPHLFwMVgAS=e7g@mail.gmail.com>
 <df176548-0001-4df4-b556-6227b776cd18@loongson.cn>
In-Reply-To: <df176548-0001-4df4-b556-6227b776cd18@loongson.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 30 Oct 2023 15:48:09 +0200
Message-ID: <CAA8EJprS72FUDvMrgXatLWHYNiAOhfugiWFCWuXnmzS2zmUDTA@mail.gmail.com>
Subject: Re: [PATCH 2/8] drm/loongson: Introduce a drm bridge driver for
 it66121 HDMI transmitter
To: Sui Jingfeng <suijingfeng@loongson.cn>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 Oct 2023 at 15:26, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>
> Hi,
>
>
> On 2023/10/30 18:01, Dmitry Baryshkov wrote:
> > On Mon, 30 Oct 2023 at 11:42, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
> >> Hi,
> >>
> >>
> >> On 2023/10/30 06:53, Dmitry Baryshkov wrote:
> >>> On Sun, 29 Oct 2023 at 21:46, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
> >>>> The IT66121 is a DVO to HDMI converter, LS3A5000+LS7A1000 ML5A_MB use this
> >>>> chip to support HDMI output. Thus add a drm bridge based driver for it.
> >>>> This patch is developed with drivers/gpu/drm/bridge/ite-it66121.c as base.
> >>> Please use the original bridge driver instead of adding a new one.
> >> I'm agree with the spirit of code sharing, but this is nearly impossible for non-DT system.
> >>
> >> Because the original bridge driver(say it66121.ko) is fully dependent on the DT.
> > I can not agree here. It doesn't depend on DT. It has fully populated
> > i2c_device_id structures, so it will work with bare I2C buses.
> > Most likely you will have to change of calls into fwnode calls, that's it.
> >
> >> UEFI+ACPI based system can not use with it.
> >>
> >> Our I2C adapter is created by the drm/loongson.ko on the runtime.
> >> The potential problem is that *cyclic dependency* !
> >>
> >> I2C adapter driver is depend on drm/loongson
> >> drm/loongson depend on drm bridge driver (say it66121.ko)
> >> drm bridge driver (say it66121.ko) depend on I2C adapter to setup.
> >>
> >> This plus the defer probe mechanism is totally a trap,
> >> incurring troubles and don't work.
> > Welcome. We had this kind of issue for DP AUX buses.
> >
> > I can suggest the following approach:
> > - In the root probe function you can create an i2c bus and populate it
> > with the i2c devices.
> > - I have not checked whether you use components or not. If not, please
> > use an auxiliary or a platform device for the main DRM functionality.
> > - In the subdevice probe / bind function you check for the next
> > bridge. Then you get one of the following:drm_bridge pointer,
> > -EPROBE_DEFER, or any other error case. Your driver can react
> > accordingly.
>
> I have similar way to solve this problem, and I have solved it one and a half years ago.
> See [1] for a reference.
>
> [1] https://patchwork.freedesktop.org/patch/478998/?series=99512&rev=11
>
> When the PCI device get probed, we create the I2C bus first.
> This ensure that when drm/lsdc.ko get loaded, the I2C bus is presence
> and ready to be get by the drm_bridge driver.
> This is basically a PCI-to-GPIO-emulated-I2C adapter,
> then wait the display bridges driver get loaded and set up.
>
> I also need to create a virtual platform device for the display controller.
> which allow the drm drivers instance for this virtual platform device
> be able to probed due to defer probe mechanism.
>
> This solution made the framework of my driver distortion severely,

I don't think I could catch this phrase. Did you see distortions on the screen?

> and in the end we still solve a easy problem by workaround.

No workarounds for the kernel subsystems are allowed.

>
> I know how to use the component framework also, but the component framework just
> a wrapper. Similar with above approach, it brings no gains in the end.
> It does not make this driver better. I got trapped one years ago,
> and I don't want to got trapped another time.
> And I know how solve such a problem by workaround, but that's not worthy for the effort.
>
> I think my approach provide a solution, while still keep the bridges drivers
> to a modular at the same time. Despite simple, it indeed solve the problem.
> It simple because of explicit control of the loading order by myself, not by
> rely on the framework or something else (say component)

PCI media drivers have had this issue for ages. And all of them found
a way to work.

> It is not totally duplicating, I have rewrite part of them.

This is even worse. Now one can not apply fixes to the second one.

> You can compare
> to see what I'm changed. It is just that it66162 was upstream-ed earlier than
> our solution. But I also have write display drivers for lt8618 and lt8619
> completely by myself.
>
>
> Even though our local drm bridges driver will not be able to enjoy the updates.
> We will accept such a results(or pain). I can maintain our local drm bridges
> drivers by myself.

What happens if anybody wants to reuse your bridge driver for their
own platform?
Linux kernel uses driver model and frameworks to improve code sharing,
not to reduce it.

> Sorry, on this technique point, we will not follow your idea.
> I'm sure that my approach is toward to right direction for our device at now.
> If someone invent a better solution to handle this problem, which make the
> various drm bridges drivers usable out of box, then I will follow and cooperate
> to test.
>
>
> > Basically duplicating the existing driver code is not really a way to
> > go. Consider somebody adding a new feature or fixing a bug in your
> > driver copy. Then they have to check if the fix applies to the driver
> > at drivers/gpu/drm/bridge/ite-it66121.c. And vice versa. After fixing
> > an issue in the standard driver one has to keep in mind to check your
> > private copy.
> >
> > So, please, use the OF code as an inspiration and register all your
> > devices in the device tree. Yes, this requires some effort from your
> > side. Yes, this pays off in the longer distance.
> >
> >>>    If
> >>> it needs to be changed in any way, please help everyone else by
> >>> improving it instead of introducing new driver.
> >>>
> >>>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> >>>> ---
> >>>>    drivers/gpu/drm/loongson/Kconfig            |   1 +
> >>>>    drivers/gpu/drm/loongson/Makefile           |   2 +
> >>>>    drivers/gpu/drm/loongson/ite_it66121.c      | 749 ++++++++++++++++++++
> >>>>    drivers/gpu/drm/loongson/ite_it66121.h      |  19 +
> >>>>    drivers/gpu/drm/loongson/ite_it66121_regs.h | 268 +++++++
> >>>>    5 files changed, 1039 insertions(+)
> >>>>    create mode 100644 drivers/gpu/drm/loongson/ite_it66121.c
> >>>>    create mode 100644 drivers/gpu/drm/loongson/ite_it66121.h
> >>>>    create mode 100644 drivers/gpu/drm/loongson/ite_it66121_regs.h
> >
>


-- 
With best wishes
Dmitry
