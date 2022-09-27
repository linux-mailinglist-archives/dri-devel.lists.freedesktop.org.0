Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 536105ED4EA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 08:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F373310E284;
	Wed, 28 Sep 2022 06:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9BF10E0DB
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 18:48:07 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id z2so14437403edi.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 11:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=skymem-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=6T3GFO/Tbalp1li0zWIGr/AqytclcOxXza6NCNEZvjg=;
 b=m6VtdU5WstE+ZB3vOhR6TVh6CAPGCxmPlrI9JjdewTGjti+QKur8N9GapXrRMEPzaP
 VQ2LayOk7FuZTu90USDux4nN79W6X08WK+f6YY0Uln8WLwkO0VHWGPmttEPejHsheWXk
 pmvQDWhi3bITsiBgTNTt5Lb70NKlHk6HSCLM1AjCPd29fpWoob3U3WhGxA7kN7dguWpz
 v4BjkvRhGKz3/g+t8x95saE6x27ZYAvvot+2Oo3MaOlXTyPlNIPiNHe4TO9nxXmSzcna
 2zjn3SSwnKCs713Gdg1XgtncezXk0ziK9fAJ6sFRFTBIb1hxruhDJn+W2Of+xRYchLhV
 syGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=6T3GFO/Tbalp1li0zWIGr/AqytclcOxXza6NCNEZvjg=;
 b=ikjQRJ+VM/PcPGFXOOsN5k+/6/Mfhrsjf8QYcd/wA4HyLzFsBZMJcc1Jf5Rhvwq3KD
 LKu89N3CpsU9IzkJ6GMIXbhJ5hA5We563l9xjXl8lRXy5ZXtYv/WvBcgZ8g0CEuV2ct1
 CEmnxO8gnZOpfJQQ0s3SLjXN7HnNACjYCDBsHkFEquF2XtnH17Wgkb1N+jkHsVXMFz6U
 Lv4WnqMvkj9efDtAL+s7wBFlQC2iXihW3Whtfb997UA1iLO+sicBw7o8tGCieVV1kgPO
 jkKiWLYg79Qa49Yv8NZBsJ9/WvA0i6tHnznE3kbO0eityeR8rkg+AEiAsxjWVTdLsNX2
 Ce7Q==
X-Gm-Message-State: ACrzQf3s8DfY9G0+JgHE7VWQ/duLCVHfflGJbsSrKeOm7gBL6IKCz+2f
 ug9nCfnrnY5/tvvl7f2MXohyzjDwGx45U0EMsanVhw==
X-Google-Smtp-Source: AMsMyM6E2MhxzWBeAljjWjKKRkA5Z+us/3JCO04DST+FaAFtwu5kqG+DR67VCnOwgkyzUmqExKu6X+wvBmRhydKEjX4=
X-Received: by 2002:a05:6402:2789:b0:451:a578:74dd with SMTP id
 b9-20020a056402278900b00451a57874ddmr28862517ede.72.1664304486045; Tue, 27
 Sep 2022 11:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220926102130.eeekt5skt4mav5f4@pengutronix.de>
 <63b460d1-4e2f-b0f1-836d-9178bb19f609@i2se.com>
 <20220926124048.i3lxy4lvtq756trp@pengutronix.de>
 <20220926124743.5s7x3dwhzienqs3x@houat>
 <7f334d11-9517-6423-572b-998f678e5718@i2se.com>
 <20220927072554.y4yrmgtlaim4b5mv@houat>
 <20220927094200.2cfw2ukick3oqr4a@houat>
 <40da8a17-5331-690b-3bd9-3317b0d0441c@i2se.com>
 <20220927114240.xilpcte2s3b5bmcf@houat>
 <20220927122512.h5tsnhbjivcnesph@houat>
 <20220927131517.3yyuswqlndcwr4pz@houat>
 <790e6127-3f75-3565-0d5a-89cc12540f5a@i2se.com>
In-Reply-To: <790e6127-3f75-3565-0d5a-89cc12540f5a@i2se.com>
From: Info Skymem <info@skymem.com>
Date: Tue, 27 Sep 2022 20:47:54 +0200
Message-ID: <CAKvd=_jhERw90LfMQ83M+edPvQRt4u1hho2r9dOj6vQvy6OyoQ@mail.gmail.com>
Subject: Re: Raspberry Pi 3 Model B+ hangs in vc4_hdmi_runtime_resume()
To: Stefan Wahren <stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 28 Sep 2022 06:30:59 +0000
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
Cc: linux-rpi-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
thank you for your information.

On our website you can find email addresses of companies and people.
https://www.skymem.info

In short, it=E2=80=99s like Google for emails.

Best regards,
Robert,
Skymem team

On Tue, Sep 27, 2022 at 8:46 PM Stefan Wahren <stefan.wahren@i2se.com> wrot=
e:
>
> Hi Maxime,
>
> Am 27.09.22 um 15:15 schrieb Maxime Ripard:
> > On Tue, Sep 27, 2022 at 02:25:12PM +0200, Maxime Ripard wrote:
> >> On Tue, Sep 27, 2022 at 01:42:40PM +0200, Maxime Ripard wrote:
> >>> On Tue, Sep 27, 2022 at 01:12:35PM +0200, Stefan Wahren wrote:
> >>>> Am 27.09.22 um 11:42 schrieb Maxime Ripard:
> >>>>> On Tue, Sep 27, 2022 at 09:25:54AM +0200, Maxime Ripard wrote:
> >>>>>> Hi Stefan,
> >>>>>>
> >>>>>> On Mon, Sep 26, 2022 at 08:50:12PM +0200, Stefan Wahren wrote:
> >>>>>>> Am 26.09.22 um 14:47 schrieb Maxime Ripard:
> >>>>>>>> On Mon, Sep 26, 2022 at 02:40:48PM +0200, Marc Kleine-Budde wrot=
e:
> >>>>>>>>> On 26.09.2022 14:08:04, Stefan Wahren wrote:
> >>>>>>>>>> Hi Marc,
> >>>>>>>>>>
> >>>>>>>>>> Am 26.09.22 um 12:21 schrieb Marc Kleine-Budde:
> >>>>>>>>>>> On 22.09.2022 17:06:00, Maxime Ripard wrote:
> >>>>>>>>>>>>> I'm on a Raspberry Pi 3 Model B+ running current Debian tes=
ting ARM64,
> >>>>>>>>>>>>> using Debian's v5.19 kernel (Debian's v5.18 was working fla=
wless).
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> | [    0.000000] Booting Linux on physical CPU 0x0000000000=
 [0x410fd034]
> >>>>>>>>>>>>> | [    0.000000] Linux version 5.19.0-1-arm64 (debian-kerne=
l@lists.debian.org) (gcc-11 (Debian 11.3.0-5) 11.3.0, GNU ld (GNU Binutils =
for Debian) 2.38.90.20220713) #1 SMP Debian 5.19.6-1 (2022-0
> >>>>>>>>>>>>> 9-01)
> >>>>>>>>>>>>> | [    0.000000] Machine model: Raspberry Pi 3 Model B+
> >>>>>>>>>>>>> | [    3.747500] raspberrypi-firmware soc:firmware: Attache=
d to firmware from 2022-03-24T13:21:11
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> As soon a the vc4 module is loaded the following warnings h=
its 4
> >>>>>>>>>>>>> times, then the machine stops.
> >>>>>>>>>>> [...]
> >>>>>>>>>>>
> >>>>>>>>>>>> The warning itself is fixed, both upstream and in stable (5.=
19.7).
> >>>>>>>>>>> Ok. Debian is using 5.19.6
> >>>>>>>>>>>
> >>>>>>>>>>>> It shouldn't have any relation to the hang though. Can you s=
hare your
> >>>>>>>>>>>> setup?
> >>>>>>>>>>> - config.txt:
> >>>>>>>>>>>
> >>>>>>>>>>> -------->8-------->8-------->8-------->8--------
> >>>>>>>>>>> gpu_mem=3D16
> >>>>>>>>>>> disable_splash=3D1
> >>>>>>>>>>>
> >>>>>>>>>>> arm_64bit=3D1
> >>>>>>>>>>> enable_uart=3D1
> >>>>>>>>>>> uart_2ndstage=3D1
> >>>>>>>>>>>
> >>>>>>>>>>> os_prefix=3D/u-boot/
> >>>>>>>>>>>
> >>>>>>>>>>> [pi3]
> >>>>>>>>>>> force_turbo=3D1
> >>>>>>>>>>> -------->8-------->8-------->8-------->8--------
> >>>>>>>>>>>
> >>>>>>>>>>> - Raspberry Pi 3 Model B+
> >>>>>>>>>>> - no HDMI connected
> >>>>>>>>>> Does it mean, the issue only occurs without HDMI connected?
> >>>>>>>>>> If you didn't test with HDMI yet, could you please do?
> >>>>>>>>> The error occurs with HDMI not connected, as vc4 is the gfx dri=
ver I
> >>>>>>>>> thought this might be of interest. :)
> >>>>>>>>>
> >>>>>>>>> I don't have a HDMI monitor here, but I'll come back to you as =
soon as I
> >>>>>>>>> get access to one (might take some time).
> >>>>>>>> It's not the first time an issue like this one would occur. I'm =
trying
> >>>>>>>> to make my Pi3 boot again, and will try to bisect the issue.
> >>>>>>> yes the issue is only triggered without HDMI connected. I was abl=
e to
> >>>>>>> reproduce with an older vc4 firmware from 2020 (don't want to upg=
rade yet).
> >>>>>>> Kernel was also an arm64 build with defconfig.
> >>>>>>>
> >>>>>>> Here some rough starting point for bisection:
> >>>>>>>
> >>>>>>> 5.18.0 good
> >>>>>>> 5.19.0 bad
> >>>>>>> 5.19.6 bad
> >>>>>> Sorry it took a bit of time, it looks like I found another bug whi=
le
> >>>>>> trying to test this yesterday.
> >>>>>>
> >>>>>> Your datapoints are interesting though. I have a custom configurat=
ion
> >>>>>> and it does boot 5.19 without an HDMI connected.
> >>>>>>
> >>>>>> So I guess it leaves us with either the firmware version being dif=
ferent
> >>>>>> (I'm using a newer version, from March 2022), or the configuration=
. I'll
> >>>>>> test with defconfig.
> >>>>> So it turns out compiling vc4 as a module is the culprit.
> >>>> Do you mean regardless of the kernel version in your case?
> >>> No, I mean that, with vc4 as a module, 5.18 works but 5.19 doesn't, l=
ike
> >>> Marc said. But if vc4 is built in, both work.
> >>>
> >>>> In my test cases i build vc4 always as module.
> >>>>
> >>>>> It's not clear to me why at this point, but the first register writ=
e in
> >>>>> vc4_hdmi_reset stalls.
> >>>> Sounds like timing issue or a missing dependency (clock or power dom=
ain)
> >>> It felt like a clock or power domain issue to me indeed, but adding
> >>> clk_ignore_unused and pd_ignore_unused isn't enough, so it's probably
> >>> something a bit more complicated than just the clock / PD being
> >>> disabled.
> >> I found the offending patch:
> >> https://lore.kernel.org/dri-devel/20220225143534.405820-13-maxime@cern=
o.tech/
> >>
> >> That code was removed because it was made irrelevant by that earlier p=
atch:
> >> https://lore.kernel.org/dri-devel/20220225143534.405820-10-maxime@cern=
o.tech/
> >>
> >> But it turns out that while it works when the driver is built-in, it
> >> doesn't when it's a module. If we add a clk_hw_get_rate() call right
> >> after that call to raspberrypi_fw_set_rate(), the rate returned is 0.
> >>
> >> I'm not entirely sure why, but I wonder if it's related to:
> >> https://github.com/raspberrypi/linux/issues/4962#issuecomment-12285934=
39
> > Turns out it's not, since the Pi3 is using the clk-bcm2835 driver.
>
> FWIW i can confirm, that i see the same behavior:
>
> fd5894fa2413cca3e6a3ea713b2bd57281af2e86 bad
>
> 5b6ef06ea6225570bc0b33325306c7b8c6bdf5eb good
>
> >
> > However, even reverting that patch fails. clk_set_min_rate fails becaus=
e
> > the rate is protected, but it doesn't look like it is anywhere for that
> > clock, so I'm a bit confused.
> >
> > Even if we do remove the clock protection check in
> > clk_core_set_rate_nolock(), clk_calc_new_rates() will then fail because
> > the bcm2835 driver will round the clock rate below the minimum, which i=
s
> > rejected.
> >
> > I'm not entirely sure what to do at this point. I guess the proper fix
> > would be to:
> >    - Figure out why it's considered protected when it's not (or shouldn=
't be)
> >    - Make the driver compute an acceptable rate for that clock
> >    - Reintroduce the clk_set_min_rate call to HDMI's runtime_resume, or
> >      some other equivalent code
> >
> > Maxime
>
> _______________________________________________
> linux-rpi-kernel mailing list
> linux-rpi-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel
