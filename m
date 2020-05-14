Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 495B01D464C
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8566EBE4;
	Fri, 15 May 2020 06:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6286E343
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 13:08:16 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id k18so239896ion.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 06:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TxjLQAmlgCmIbW66ttakmR+UHsu55ZGYYjiNgQ7pD60=;
 b=HQy57GttiwVxh24sQLfeiQngcOiErLC6lrc6A6arkVum1pGd0PXCrQaHvOCK4hPNEV
 b/059ZwlWVA1AS8FK1q2/gCJIeug5/mReyn6myQQGKj7Nqz7CVRv86DNFSRbqqL9jNJu
 tITMdAKorHxeF7YvlIBXB8sc7+tzC2Jw9Tf81bsZ6FJbcXdDfUt6nlqKXBjb5tQmn5MB
 gsR5CUzH/zKAUZsVkX976vv3QKAm1v8PnXFZ2eAaurKTEVbK4xwSxyYq0RD28bfWf5Cm
 c7yPr6SgCzeFtV1ZHtYdDrrDUR4DC+KkcElHzh4hDhUaeG4VHhyQV+JNQPmJwrKZiy5d
 Dj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TxjLQAmlgCmIbW66ttakmR+UHsu55ZGYYjiNgQ7pD60=;
 b=puFCSlKJT9iEzMQRbtvKlXtAkhxKWt10JYwJ9LU4f90GRjEV3IYtuZO07uimey0lK5
 x2ocmyGwY2jUfkH+s/tm9DwT1up3uc3zgWnC+crCvA06DuPHDN1BoYZZGvegj+A/ibpF
 5mmenMUOZu7viztmrrfKP+gtcjzDG7UpIT9HW8yT+Fb6Hssk53lCIFS/eBFQBGMoi3LX
 L6q4k34bLC9j3sT210JtBtVl+teUeKpuf8UwynjRlmEHSQaNHo2AYawk2dSBEKnHlzON
 ZEnMj9W1uLaHEQTsjsI4m9J0L4VdK3j9Gq48t37QKGA0JEi6GyTCeNMSQfHhV459+mEs
 v7yg==
X-Gm-Message-State: AOAM53119pSLWvnJJHtkwAu674yvjJOIMGvdFnFwxK9bJoRn5xDlQiib
 ETkWPIG3q1oHps5maCQiri5gdHzY3kwh2Ceftro=
X-Google-Smtp-Source: ABdhPJxFXm/snfV7f+PaeEk0/JpSTrHSkPZMuSqd6hBKK/zxQapVp8rf2U8UIu+qvc9Q33J56Hi8hFlnpuvp0XR2Wlk=
X-Received: by 2002:a5d:8b8e:: with SMTP id p14mr3979084iol.110.1589461696306; 
 Thu, 14 May 2020 06:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
 <1589267017-17294-4-git-send-email-dillon.minfei@gmail.com>
 <CACRpkda5VjjBdbruXTi33QBNb=VU6vK2zDE8yyQXoWw7=NQFeg@mail.gmail.com>
 <a4ebd7cd-5756-0683-135f-0f96be8a4a7b@st.com>
In-Reply-To: <a4ebd7cd-5756-0683-135f-0f96be8a4a7b@st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Thu, 14 May 2020 21:07:40 +0800
Message-ID: <CAL9mu0Jt_xwo5pJfcx6G3grBuOaxLXvakpEjiB4gV3=bkiq2fg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] ARM: dts: stm32: enable ltdc binding with ili9341
 on stm32429-disco board
To: Alexandre Torgue <alexandre.torgue@st.com>
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:56 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Dave Airlie <airlied@linux.ie>,
 linux-clk <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-stm32@st-md-mailman.stormreply.com, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexandre,

On Thu, May 14, 2020 at 8:53 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:
>
>
>
> On 5/14/20 10:24 AM, Linus Walleij wrote:
> > On Tue, May 12, 2020 at 9:04 AM <dillon.minfei@gmail.com> wrote:
> >
> >> From: dillon min <dillon.minfei@gmail.com>
> >>
> >> Enable the ltdc & ili9341 on stm32429-disco board.
> >>
> >> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> >
> > This mostly looks good but...
> >
> >> +&spi5 {
> >> +       status = "okay";
> >> +       pinctrl-0 = <&spi5_pins>;
> >> +       pinctrl-names = "default";
> >> +       #address-cells = <1>;
> >> +       #size-cells = <0>;
> >> +       cs-gpios = <&gpioc 2 GPIO_ACTIVE_LOW>;
> >> +       dmas = <&dma2 3 2 0x400 0x0>,
> >> +              <&dma2 4 2 0x400 0x0>;
> >> +       dma-names = "rx", "tx";
> >
> > These DMA assignments seem to be SoC things and should
> > rather be in the DTS(I) file where &spi5 is defined, right?
> > stm32f429.dtsi I suppose?
>
> I agree with Linus, DMA have to be defined in SoC dtsi. And if a board
> doesn't want to use it, we use the "delete-property".
Yes, will move to Soc dtsi in next submits.

i'm working on write a v4l2-m2m driver for dma2d of stm32 to support
pixel conversion
alpha blending between foreground and background graphics.

as you know, some soc's engineer trying to add this function to drm system.

do you know st's planning about soc's hardware accelerator driver on stm32mp?
such as chrom-art, will add to drm subsystem via ioctl to access, or to v4l2,

thanks.

>
> >
> > It is likely the same no matter which device is using spi5.
> >
> > Yours,
> > Linus Walleij
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
