Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0875201CD
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 18:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E79210E884;
	Mon,  9 May 2022 16:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102CE10E884
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 16:00:21 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id x17so5260713ybj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 09:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=knnW3YdGHU3dQmhoQ/TIt12Wud5O9OTp/LrpDaN4GjM=;
 b=gBo755tMf9Osy5tffBppRj7GfJn4ql1mKymzn97tMmsCY7Ovgg3Kvs3yRy3+4Aalcc
 7KUYzLx4mobr7QA0sQjmav3JM0lT4HGbe90OVpKyYL6B8SqhIMEsUOTQ8KsM8Juyeuoj
 TCRbl+PuQ1y0LWQOfM8m53FgLypONm6ia1cr2XMvW1Y6NxfAOmb49oqvIxGLafkafPj1
 oazllSGRNd9UaEK/q76XMrqpgxNvlTLZIoshpDQmPfdewjNWyw5XGAJdDPu2RrosDaW/
 P1pW1xWg026bNkocIWIl4BBR6IqIgvItap/A6KrxDBotH0mbvIo/KaIyCPpLt0drClE7
 FxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=knnW3YdGHU3dQmhoQ/TIt12Wud5O9OTp/LrpDaN4GjM=;
 b=hIYJQJYB/p0lr9VH/DEfKRrbEGz53R26vjfb0FA2DDQ+JG2Mtz8obfu0pZjUE27mTq
 v9sT4IyIMIAur5za3IU5sDFRRoEyTdgmbCzDrl8xs2BVgmcZh+4iZpEYGG+HeJJV6Oum
 scYOvL5oLR5EP48JgaHsRx2PHeY1gkGx+6CJCaBUOpoUvL8yujFzWDF0UhTsF+fO77N7
 xpOwdnVRQHZL2gdMoyiFsPL/qvgKurhMhCC6Nrb0kYDYtDBJPQIfLTBO2v/N4FDwEiVT
 +UfQPzlmnQ5Qlz8nhMlrlR1uQEtiJ3FTk9oji8qw4jfaRfdCgrXsXYxQa4QsdNjxDGjC
 r/Tg==
X-Gm-Message-State: AOAM5303BKPtbQe1wReEfl2liQNNB5P1QnhxOk0MYk/aW7o951AuV8so
 k5s2SzAdvFHUtGdV0hmLWPilYFyZOedHpMXuxfw=
X-Google-Smtp-Source: ABdhPJzE0yuDYQajfmjTVe+xPs9zcVxiG4bkyGXxUy+igdOw39M2htAP7fLlOx0fjjDMxhJ38jlzCt8sXC0uyVUM7Aw=
X-Received: by 2002:a05:6902:706:b0:649:daee:ada1 with SMTP id
 k6-20020a056902070600b00649daeeada1mr14322790ybt.366.1652112020072; Mon, 09
 May 2022 09:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
 <20220422072841.2206452-21-s.hauer@pengutronix.de>
 <A86359EC-5291-41BD-966E-EB7890644731@gmail.com>
 <CAMdYzYoFG3wCQaWXQNJd7mE20OMCj=ZeuewwZfaCJyoCBT-kQQ@mail.gmail.com>
 <0E6FE020-C95E-47CF-A9D6-AC3F2B2D334F@gmail.com>
 <CAMdYzYobfJ7WGN+UQ7t5e1Zy9knjfHLse8KzrGrHPfeMkkG0gw@mail.gmail.com>
 <9F2D8CFF-1EAE-4586-9EE9-82A9D67840BB@gmail.com>
In-Reply-To: <9F2D8CFF-1EAE-4586-9EE9-82A9D67840BB@gmail.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Mon, 9 May 2022 12:00:08 -0400
Message-ID: <CAMdYzYrz7DRj7F9hGaAPaTSiZkQ4eMNujAp8uPuE9geL6kAz4g@mail.gmail.com>
Subject: Re: [PATCH v11 20/24] arm64: dts: rockchip: enable vop2 and hdmi tx
 on rock-3a
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 8, 2022 at 2:21 PM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
> >>
> >> I think i have this already (pls see L231/L232 in https://pastebin.com/67wu9QrH )
> >
> > I see you have hdmitxm1_cec as the enabled pin. Are you certain it's
> > the m1 pin and not the m0 pin?
>
> It depends on board ver.
> pls look: https://github.com/radxa/kernel/commit/c1d727692e85c0a265913a72e517cf2bd71131ba

If you want to confirm the hardware is configured correctly you can
remove the cec pin from the hdmi node and set up a cec-gpio node.
https://elixir.bootlin.com/linux/v5.18-rc5/source/Documentation/devicetree/bindings/media/cec-gpio.txt

For some reason the board developers decided to make this selectable,
check the location of R90652 and R90653.

>
> >>
> >> Maybe i miss something but adding:
> >>
> >> &usb2phy0_otg {
> >>        phy-supply = <&vcc5v0_usb_host>;
> >>        status = "okay";
> >> };
> >>
> >> breaks working usb3 port0
> >> (so none of usb3 ports are working)
> >
> > Please pass along a full dmesg in this configuration.
>
> Here it is: https://pastebin.com/uArtBLaZ

I have some concerns about the DTS you've built here. For instance how
come you are modifying the power domains?
USB3 is broken because the rock3-a is a rk3568 device and you're
missing combophy0.

>
>
