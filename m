Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 136641D7BD2
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 16:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9F589ECD;
	Mon, 18 May 2020 14:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C716289ECD
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 14:50:45 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id j28so2470747vkn.8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 07:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vj5hFUhDBM+WTe+cSvcyWy4V3k81csR6btS7gqnvFts=;
 b=Jrc15CIyMGrpxchQkoru3VPYc3/uY7cZk9vGSavx2jtBOkFEE38CcYFo1RXr6ZSaQz
 UvMh+07QfmLmc5fll3AkAs2J22pn7JoeaCJMsHAx6cZwrc1e8qKEhmZ01SMT4yKxWtYL
 dPM5iIU4kBbNX9E4OKphGUxKVEK2sB8ORdL2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vj5hFUhDBM+WTe+cSvcyWy4V3k81csR6btS7gqnvFts=;
 b=URfCGxBz8wV79QRNOGXsdI8424pHSNsPhdQw/24BpmSugUlAhjweRIRySWDUHjo/HJ
 cf5OQVrm7Hb/wekOJBRedV2VTPpgPrkEnyLY+mBEI31dZntbB9LDrY1LypEG8UDaw15D
 RXNKb3r7zZ4NLg5Obr5pscS4xMPdql9wpDEAJk96UAScNi/NkKN4ul8LPhE2PuuL734E
 4wkZxe8u6Veh4MEzFde5Q3VT6S4W+SNM7JvUKCcxaq519afUAguHbpPTKLH5snB10HnF
 Us2ZJ02oTvt7p76qlxHcVTfNhAymlXMz79xtQIHW5FpfoZf4ZR9mfL/Ps+znb5iac1u1
 rK2Q==
X-Gm-Message-State: AOAM533QCR+mGo5Q8FL3GB6X03MeepPHw7RH5d2/08kOF+l4o5lDJMvU
 oj4h8M2rHWoWm5iwydB5UWmwt1oaRAk=
X-Google-Smtp-Source: ABdhPJzfx0faMm7gFjSRlA/R1Y79kkWIR5HhtHKgIBWElyeABXlpM0fC+K/rT/HyHiB57fz//TTr4g==
X-Received: by 2002:ac5:c54a:: with SMTP id d10mr10368644vkl.21.1589813444576; 
 Mon, 18 May 2020 07:50:44 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com.
 [209.85.217.44])
 by smtp.gmail.com with ESMTPSA id v84sm317076vkv.4.2020.05.18.07.50.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 07:50:42 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id 1so5720575vsl.9
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 07:50:42 -0700 (PDT)
X-Received: by 2002:a67:e884:: with SMTP id x4mr7166181vsn.106.1589813441464; 
 Mon, 18 May 2020 07:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200507213500.241695-1-dianders@chromium.org>
 <20200509201511.GD30802@ravnborg.org>
 <CAD=FV=VBU7JmTdvgWjyj_ytrFmz6Gkx2OjVr1FxLh9DBG_jN6w@mail.gmail.com>
In-Reply-To: <CAD=FV=VBU7JmTdvgWjyj_ytrFmz6Gkx2OjVr1FxLh9DBG_jN6w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 May 2020 07:50:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UNuwb+YYJKw9+HNMKUNfuNFxj+Gr+yB9tXANbXAvDgCg@mail.gmail.com>
Message-ID: <CAD=FV=UNuwb+YYJKw9+HNMKUNfuNFxj+Gr+yB9tXANbXAvDgCg@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] drm: Prepare to use a GPIO on ti-sn65dsi86 for Hot
 Plug Detect
To: Sam Ravnborg <sam@ravnborg.org>, LinusW <linus.walleij@linaro.org>, 
 Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Sandeep Panda <spanda@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Rob Clark <robdclark@chromium.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Gross <agross@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Stephen Boyd <sboyd@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sam,

On Sat, May 9, 2020 at 3:48 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Sat, May 9, 2020 at 1:15 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Hi Douglas.
> >
> > On Thu, May 07, 2020 at 02:34:54PM -0700, Douglas Anderson wrote:
> > >
> > > As talked about in commit c2bfc223882d ("drm/bridge: ti-sn65dsi86:
> > > Remove the mystery delay"), the normal HPD pin on ti-sn65dsi86 is
> > > kinda useless, at least for embedded DisplayPort (eDP).  However,
> > > despite the fact that the actual HPD pin on the bridge is mostly
> > > useless for eDP, the concept of HPD for eDP still makes sense.  It
> > > allows us to optimize out a hardcoded delay that many panels need if
> > > HPD isn't hooked up.  Panel timing diagrams show HPD as one of the
> > > events to measure timing from and we have to assume the worst case if
> > > we can't actually read HPD.
> > >
> > > One way to use HPD for eDP without using the mostly useless HPD pin on
> > > ti-sn65dsi86 is to route the panel's HPD somewhere else in the system,
> > > like to a GPIO.  This works great because eDP panels aren't physically
> > > hotplugged.  That means the debouncing logic that caused us problems
> > > wasn't really needed and a raw GPIO works great.
> > >
> > > As per the above, a smart board designer would realize the value of
> > > HPD and choose to route it to a GPIO somewhere on the board to avoid
> > > the silly sn65dsi86 debouncing.  While said "smart designer" could
> > > theoretically route HPD anywhere on the board, a really smart designer
> > > would realize that there are several GPIOs on the bridge itself that
> > > are nearly useless for anything but this purpose and route HPD to one
> > > of those.
> > >
> > > This series of patches is intended to allow the scenario described
> > > above.
> > >
> > > This patch has been tested on a board that is not yet mainline.  On
> > > the hardware I have:
> > > - Panel spec says HPD could take up to 200 ms to come up, so without
> > >   HPD hooked up we need to delay 200 ms.
> > > - On my board the panel is powered by the same rail as the
> > >   touchscreen.  By chance of probe order the touchscreen comes up
> > >   first.  This means by the time we check HPD in ti_sn_bridge_enable()
> > >   it's already up.  Thus we can use the panel on 200 ms earlier.
> > > - If I measure HPD on this pane it comes up ~56 ms after the panel is
> > >   powered.  This means I can save 144 ms of delay.
> > >
> > > Side effects (though not main goals) of this series are:
> > > - ti-sn65dsi86 GPIOs are now exported in Linux.
> > > - ti-sn65dsi86 bindings are converted to yaml.
> > > - Common panel bindings now have "hpd-gpios" listed.
> > > - The simple-panel driver in Linux can delay in prepare based on
> > >   "hpd-gpios"
> > > - ti-sn65dsi86 bindings (and current user) now specifies "no-hpd"
> > >   if HPD isn't hooked up.
> > >
> > > Changes in v5:
> > > - Use of_xlate so that numbers in dts start at 1, not 0.
> > > - Squash https://lore.kernel.org/r/20200506140208.v2.2.I0a2bca02b09c1fcb6b09479b489736d600b3e57f@changeid/
> > >
> > > Changes in v4:
> > > - Don't include gpio.h
> > > - Use gpiochip_get_data() instead of container_of() to get data.
> > > - GPIOF_DIR_XXX => GPIO_LINE_DIRECTION_XXX
> > > - Use Linus W's favorite syntax to read a bit from a bitfield.
> > > - Define and use SN_GPIO_MUX_MASK.
> > > - Add a comment about why we use a bitmap for gchip_output.
> > > - Tacked on "or is otherwise unusable." to description.
> > >
> > > Changes in v3:
> > > - Becaue => Because
> > > - Add a kernel-doc to our pdata to clarify double-duty of gchip_output.
> > > - More comments about how powering off affects us (get_dir, dir_input).
> > > - Cleanup tail of ti_sn_setup_gpio_controller() to avoid one "return".
> > > - Use a bitmap rather than rolling my own.
> > > - Remind how gpio_get_optional() works in the commit message.
> > > - useful implement => useful to implement
> > >
> > > Changes in v2:
> > > - ("Export...GPIOs") is 1/2 of replacement for ("Allow...bridge GPIOs")
> > > - ("dt-bindings: display: Add hpd-gpios to panel-common...") new for v2
> > > - ("simple...hpd-gpios") is 1/2 of replacement for ("Allow...bridge GPIOs")
> > > - specification => specifier.
> > > - power up => power.
> > > - Added back missing suspend-gpios.
> > > - data-lanes and lane-polarities are are the right place now.
> > > - endpoints don't need to be patternProperties.
> > > - Specified more details for data-lanes and lane-polarities.
> > > - Added old example back in, fixing bugs in it.
> > > - Example i2c bus is just called "i2c", not "i2c1" now.
> > > - ("dt-bindings: drm/bridge: ti-sn65dsi86: Document no-hpd") new for v2.
> > > - ("arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza") new for v2.
> > >
> > > Douglas Anderson (6):
> > >   drm/bridge: ti-sn65dsi86: Export bridge GPIOs to Linux
> > >   dt-bindings: display: Add hpd-gpios to panel-common bindings
> > >   drm/panel-simple: Support hpd-gpios for delaying prepare()
> > >   dt-bindings: drm/bridge: ti-sn65dsi86: Convert to yaml
> > >   dt-bindings: drm/bridge: ti-sn65dsi86: Document no-hpd
> > >   arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza
> >
> > Applied:
> > >   dt-bindings: display: Add hpd-gpios to panel-common bindings
> > >   drm/panel-simple: Support hpd-gpios for delaying prepare()
> > to drm-misc-next.
> >
> > The others was missing reviews so we need to wait for feedback.
>
> Thanks!
>
> Given the previous feedback from Linus W, Stephen, and Laurent I
> expect things are good enough to land now, but it'd be good to get
> confirmation (I removed some of the previous tags just to get
> confirmation).  If we can get review tags early next week maybe it'll
> still be in time to land for 5.8?

I think all the others have reviews now.  Is there anything blocking
them from getting applied?

Thanks!

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
