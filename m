Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0F65214D4
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 14:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618A010F027;
	Tue, 10 May 2022 12:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A62E10F027
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 12:08:58 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2f7c424c66cso177283077b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 05:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=j0oL9+kBsnLy6C0ogmrfSuIg/MzgC7W4K7D/KPBvz1A=;
 b=cWQC53+eDRuJuIWv4FF8BHQ+cdDHd6IiQAsbBqM657B9Zx9tNFCkWMYo4mMD/X9iVb
 POhpufVfVv5IpatIIDMTN5bnB1p2R9u5BvWkxlgaXKePLxFlJuehqC7k1N+JaE2d8957
 dJivn2IZxYXCm3Y4v9Ew/SmUt76aj7vFnpL8hCY04rb0XAFS4hYrmXk7k6H7poRkH61l
 +hTRAZLjpXC/0WTmDFC9swbSR2dOC9BTJdFJ6Eff5LQXfuaHzoK2XVu6izCwVlbCwday
 wM6kX1jFpGfAHwjNDMjKXXWWN77JsJ4cXhC/F8JePYd9FM5J8wzLiYpGirfcPjkb7Fx0
 h3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j0oL9+kBsnLy6C0ogmrfSuIg/MzgC7W4K7D/KPBvz1A=;
 b=L6LcGv3YXuvKWQdDYAtvKQ9TLYJEv5f3qH0snilcUKMPFxdin/hUWs1cttqjqtVU1x
 Soz+1yJcHBQO2XjpLMyMiVeA5Fv/GO+JzadTnr4kJ49rUQXJEYKw4y06Bek0OCG6+3Ww
 bzE5hZyuRxCzch0k5pXuBLamA/Dh29lqcp+/pFQ4gymxYSJCiPufkDaKRNGXobugv9m8
 xgasZmblB2+kd2v8gGgwznVGl8C2wpjB1pxzqsRqp3uxSVZbpKhPLDgt8zk+0TPMOKU0
 wpybwfGJtBccY8IE6dN85IjPHxrCGtwx3LExJYGuCgHyOHvGWQJtsy4IXEqMo47Nsdhu
 qS7w==
X-Gm-Message-State: AOAM530Qq4Z5XFze5NIe7lcbPlnuv6ql9DSmA6qbWcEfaGXJZoEvqLeS
 Pf1l7aQgDipcjIUCkhgPEjpQ4hUBeCmsDaYejbs=
X-Google-Smtp-Source: ABdhPJwRTg7zxeefA+5CviigWYq414sTputJite8EjfxYGbeZqI3BUj/2/O0TjezCb73L1ed25VP23S+1nthZLWKqDI=
X-Received: by 2002:a81:32c1:0:b0:2f7:cda8:50e1 with SMTP id
 y184-20020a8132c1000000b002f7cda850e1mr19252602ywy.519.1652184537294; Tue, 10
 May 2022 05:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
 <20220422072841.2206452-21-s.hauer@pengutronix.de>
 <A86359EC-5291-41BD-966E-EB7890644731@gmail.com>
 <CAMdYzYoFG3wCQaWXQNJd7mE20OMCj=ZeuewwZfaCJyoCBT-kQQ@mail.gmail.com>
 <0E6FE020-C95E-47CF-A9D6-AC3F2B2D334F@gmail.com>
 <CAMdYzYobfJ7WGN+UQ7t5e1Zy9knjfHLse8KzrGrHPfeMkkG0gw@mail.gmail.com>
 <9F2D8CFF-1EAE-4586-9EE9-82A9D67840BB@gmail.com>
 <CAMdYzYrz7DRj7F9hGaAPaTSiZkQ4eMNujAp8uPuE9geL6kAz4g@mail.gmail.com>
 <812AC0DB-A6D0-4DA3-BCDC-7743E8F61821@gmail.com>
 <CAMdYzYozewYUbM=Q+iJ2wdM5TrB6dGrjS6zh0qmVgWD4XPVR+Q@mail.gmail.com>
 <ABC61229-B851-4BB7-8B55-688F8A8D841A@gmail.com>
In-Reply-To: <ABC61229-B851-4BB7-8B55-688F8A8D841A@gmail.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Tue, 10 May 2022 08:08:45 -0400
Message-ID: <CAMdYzYrsaNED+oMj+z2b4fK7pt32Qg=nXDk3SA0KFDDCJ2XY0g@mail.gmail.com>
Subject: Re: [PATCH v11 20/24] arm64: dts: rockchip: enable vop2 and hdmi tx
 on rock-3a
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, May 10, 2022 at 3:29 AM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w d=
niu 10.05.2022, o godz. 03:35:
> >
> > Could you grab the clock tree from /sys/kernel/debug/clk/clk_summary
> > for the clk_hdmi_cec tree?
>
> Here it is:
>                                 enable  prepare  protect                 =
               duty  hardware
>    clock                          count    count    count        rate   a=
ccuracy phase  cycle    enable
> -------------------------------------------------------------------------=
------------------------------
>    clk_rtc32k_frac                   1        1        0       32768     =
     0     0  50000         Y
>        clk_rtc_32k                    1        1        0       32768    =
      0     0  50000         Y
>           clk_hdmi_cec                1        2        0       32768    =
      0     0  50000         Y

You are on the clk_rtc32k_frac which is a fractional divider that is
fed from the 24m clock. Your clock likely isn't the issue here. I'd
recommend setting up the cec-gpio node to validate your hardware
works.
