Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45004524DAC
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 15:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6CE110FFF5;
	Thu, 12 May 2022 13:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7329610FFFB
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 13:01:58 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2f7d621d1caso55142657b3.11
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 06:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/lfDOlHUOek9C7jOeYtx9WxH1V373cmd8YRq+4P9J2c=;
 b=GYud4zcv0EeM2pj5bBFJ7Gx5ZbhNeLPcXkDE3z4HHDzIbpT5rKNFAPBjW0BjAykTcQ
 Ni3mPE5xhks+i1y+b3ogM1NXSaBN1oMzP65HmVHmZLwkBRxVsJWW+Aokhp8jBucY6egm
 S0w9Gg+EdjpKrPUBrJkt8SH+ngBX49iwlbVw8+L6+TcHd3k4xtuwiM1khtrl0SvmgBjw
 /hzs4tquEGLe8qgWvDbAJWGG2KRFEPnnC1msGvMp1aSQzc91YUhJKDk20zN2j+D3wSfV
 mlx5AxM3+PxE5j6PjG6F9UJwrqP5bx90EjBZjXnE9h9xMY+YNPuywbKk3DE6XmFYn6/8
 LbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/lfDOlHUOek9C7jOeYtx9WxH1V373cmd8YRq+4P9J2c=;
 b=r8HsQAjb/YURRHeT6HpeO8dSKJrKxv+WAcXNAk+hCzZbQQ+6pp7VSF29DCKverfoMv
 Csr5+V6OtLfG87ahikSbjjJ0DvURwZOgmOrenZcWOAoX7C7nYGORXrUNA1F1iQmRoWVM
 97a3cIz8r+wK46vQUS6/JwXR9XbHJOKCmp0t0NZJ3L8AfDS+gm7bt6ExZrmVWl9TcLJP
 csyyY2rwzraylD4POTSjRTx49ze/HqY4obE7HOdlOfMj9fQd/GMHga93BAhVXtnm1Lv4
 48umpaPxx3lSFzjUnuF55AWGeY2m+RFGASI78fX7eMa2kZvLqVJSHkKJ/M2L0jqOCVlc
 UleQ==
X-Gm-Message-State: AOAM531I/gRYbI6o5N1UY05mkUW+6MQmIUCF/eiPRONhO2nsSUbbK17p
 CifIAHqeXPrNTjkBu5YAFw6ldjg7riL6ZdXbYFQ=
X-Google-Smtp-Source: ABdhPJxr+4PqP1umY344MY21ihPe1wrIT5axr773zAz5A3xpzxixjKeYkcEbuOgHgN3JC19k7gEnl0PyYaLMDp2pT7o=
X-Received: by 2002:a05:690c:89:b0:2d7:fb7d:db7 with SMTP id
 be9-20020a05690c008900b002d7fb7d0db7mr33062207ywb.219.1652360517202; Thu, 12
 May 2022 06:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
 <20220422072841.2206452-21-s.hauer@pengutronix.de>
 <A86359EC-5291-41BD-966E-EB7890644731@gmail.com>
 <CAMdYzYoFG3wCQaWXQNJd7mE20OMCj=ZeuewwZfaCJyoCBT-kQQ@mail.gmail.com>
 <a85eca2e-61f0-8d4b-64db-dfcc2b97d6f7@arm.com>
In-Reply-To: <a85eca2e-61f0-8d4b-64db-dfcc2b97d6f7@arm.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Thu, 12 May 2022 09:01:45 -0400
Message-ID: <CAMdYzYqGpf9mw5+tzvU_Xf3ePGCH1xF83iFPTqvOTjSukzniYA@mail.gmail.com>
Subject: Re: [PATCH v11 20/24] arm64: dts: rockchip: enable vop2 and hdmi tx
 on rock-3a
To: Robin Murphy <robin.murphy@arm.com>
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
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 12, 2022 at 8:17 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2022-05-08 17:53, Peter Geis wrote:
> > On Sun, May 8, 2022 at 9:40 AM Piotr Oniszczuk
> > <piotr.oniszczuk@gmail.com> wrote:
> >>
> >>
> >>
> >>> Wiadomo=C5=9B=C4=87 napisana przez Sascha Hauer <s.hauer@pengutronix.=
de> w dniu 22.04.2022, o godz. 09:28:
> >>>
> >>> From: Michael Riesch <michael.riesch@wolfvision.net>
> >>>
> >>> Enable the RK356x Video Output Processor (VOP) 2 on the Radxa
> >>> ROCK3 Model A.
> >>>
> >>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> >>> Reported-by: kernel test robot <lkp@intel.com>
> >>> Link: https://lore.kernel.org/r/20220310210352.451136-4-michael.riesc=
h@wolfvision.net
> >>> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> >>> ---
> >>
> >> Sascha, Michael,
> >
> > Good Afternoon,
> >>
> >> I'm using v11 series on 5.18-rc5 on rk3566 tvbox with great success.
> >> Recently i started to work on rock3-a (rk3568).
> >> v11 gives me video, audio - but cec is not working on rock3-a.
> >>
> >> I was told:
> >>
> >> 32k clock needed for cec and this clock is generated by the rtc which =
is embedded in the rk8xx regulator.
> >> So you should make sure it is enabled when hdmi is powerd on, eg addin=
g it to the RK3568_PD_VO powerdomain should help
> >>
> >> I was trying to do this in dts https://pastebin.com/67wu9QrH but cec i=
s still non-functional
> >>
> >> Maybe You have some hints/pointers here?
> >
> > Add the following to the HDMI node:
> > assigned-clocks =3D <&cru CLK_HDMI_CEC>;
> > assigned-clock-rates =3D <32768>;
> >
> > The issue is the clk_rtc32k_frac clock that feeds clk_rtc_32k which
> > feeds clk_hdmi_cec is 24mhz at boot, which is too high for CEC to
> > function.
> > I submitted a patch to have the hdmi driver handle this, but it broke
> > other SoCs because 32k is an optional clock.
> > Since this is the case, I'd like Robin to weigh in on going the
> > assigned-clock route again.
>
> (did you mean to CC me or have I missed another thread elsewhere?)

Apologies, I made an unsafe assumption here.

>
> FWIW I still think it would be good to fix the clock driver(s) and/or
> DTs to correctly deal with the availability and configuration of xin_32k
> where appropriate. However, much like the HCLK_VO mess I guess that's a
> larger cleanup tangent in its own right, so using "assigned-clocks" for
> this one case in the meantime doesn't seem unreasonable. I was
> optimistic for the cleanest, most generic solution, but if reality gets
> in the way then oh well.

I was thinking about this problem and came to a realization. The root
dtsi files all have clk32k_in defined, even though it's listed as an
optional clock. I think this should move to the device boards (much
like the gmac input clock) that have it. The clock driver might need
some help coping with it being missing, I haven't tested this.

>
> Judging by the datasheet, RK3568 might actually have a similar situation
> with its clk32k_in pin, so you may want "assigned-clock-parents" as well
> to ensure the whole clk_rtc32k branch is really set up the way you
> currently expect - baking any more assumptions into DTBs now only seems
> to add potential for breakage if kernel behaviour changes in future.

rk3568 defaults to using a clock divider from the 24m clock, so it
works even in the absence of clk32_in. It seemed rk3399 did as well,
but unlike rk3568 it would switch to clk32k_in if the exact frequency
was chosen. Implementing the above would fix that issue, and we can
then implement the driver fix.

>
> Robin.

Very Respectfully,
Peter
