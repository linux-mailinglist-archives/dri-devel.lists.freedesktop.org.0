Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4370351EEFA
	for <lists+dri-devel@lfdr.de>; Sun,  8 May 2022 18:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996AC10E77C;
	Sun,  8 May 2022 16:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE6C10E77C
 for <dri-devel@lists.freedesktop.org>; Sun,  8 May 2022 16:53:33 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id r11so21055754ybg.6
 for <dri-devel@lists.freedesktop.org>; Sun, 08 May 2022 09:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3F1Pq3gU9pnrxqbFtjzJI31YKJjKY/6sCWthpC+SyWI=;
 b=q2EaRXL/xo0X/zpAUJ6IwW1+vmpwhySxUV7v1BtjeUlLo3iVY5vWnLI4MskoSMxSsj
 Ijo22uXDT092q3OsT6chJ5bTvTwuwigVs9EL9zR0o37oloNz2mvTmVzoPVezk/urE/EA
 Tk/VyNd2NJ1o5ts2dA2oMv79C01GzafvKPMB6bRtHQjbkarTERkCF8NF4m8ErTmsWCYc
 ff5yTbpTwrEDaaATRj0SRlB2kuMCbwDHryLZiNnyleK2gGYxmZug2n0T09vvF2Cz+QyH
 RHKzXG15FP7sronSdF7OZqMDosStkaCvDt1mF/93HLAh/SpsZeriMXa6OJr4lyt61asn
 qkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3F1Pq3gU9pnrxqbFtjzJI31YKJjKY/6sCWthpC+SyWI=;
 b=hPgUx6cgQzsQeP51NJHX4FqfsLWoJCVjYPOdgFvPXHuhAGm0SgEjoBzCTshO5WoApw
 LjKB3WOoNogoT9XNEp0uDIB9sQwwELuCN2cKRzouIGHnsFR/kqG3av0oDHBqDHOTMB7u
 sC67NY6goGNMUc5AQTyviiwcyp/w/7ivYBakZIpy0L1/wzRRgkO/BarQHrdRoOGb9aCk
 adYaD6hMlA1RfQ3j/tOTwhLTj5tc6oJ7ecfmzvqr1oNgG/CO8xKzpxiEu3xyqDTTrd0h
 npqF3q9pFUrp/MXCfUQJDkdKsPyAZnj+y6GMG5LCvj213Wy0nLF9EVTl5pUu5O2nKYHj
 wg3g==
X-Gm-Message-State: AOAM531sbE1botNxUJ+3Ie99eLJwgvbojGazsXaG8nzRSkbBPC68duDL
 Qtzu0ohNbrBBBf7UtBLfo8moXNK8VHSQhnpiwPo=
X-Google-Smtp-Source: ABdhPJwI9hCRzsuCfUL5+MI7byJrBIXIu6HCctuZjDYDKgqhMNsR/VFPkVCJcslqOpQCZ2iRWjaE+azUpqF8YwMnSVE=
X-Received: by 2002:a5b:64c:0:b0:64a:684a:2369 with SMTP id
 o12-20020a5b064c000000b0064a684a2369mr10146433ybq.173.1652028812891; Sun, 08
 May 2022 09:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
 <20220422072841.2206452-21-s.hauer@pengutronix.de>
 <A86359EC-5291-41BD-966E-EB7890644731@gmail.com>
In-Reply-To: <A86359EC-5291-41BD-966E-EB7890644731@gmail.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Sun, 8 May 2022 12:53:21 -0400
Message-ID: <CAMdYzYoFG3wCQaWXQNJd7mE20OMCj=ZeuewwZfaCJyoCBT-kQQ@mail.gmail.com>
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

On Sun, May 8, 2022 at 9:40 AM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Sascha Hauer <s.hauer@pengutronix.de=
> w dniu 22.04.2022, o godz. 09:28:
> >
> > From: Michael Riesch <michael.riesch@wolfvision.net>
> >
> > Enable the RK356x Video Output Processor (VOP) 2 on the Radxa
> > ROCK3 Model A.
> >
> > Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Link: https://lore.kernel.org/r/20220310210352.451136-4-michael.riesch@=
wolfvision.net
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
>
> Sascha, Michael,

Good Afternoon,
>
> I'm using v11 series on 5.18-rc5 on rk3566 tvbox with great success.
> Recently i started to work on rock3-a (rk3568).
> v11 gives me video, audio - but cec is not working on rock3-a.
>
> I was told:
>
> 32k clock needed for cec and this clock is generated by the rtc which is =
embedded in the rk8xx regulator.
> So you should make sure it is enabled when hdmi is powerd on, eg adding i=
t to the RK3568_PD_VO powerdomain should help
>
> I was trying to do this in dts https://pastebin.com/67wu9QrH but cec is s=
till non-functional
>
> Maybe You have some hints/pointers here?

Add the following to the HDMI node:
assigned-clocks =3D <&cru CLK_HDMI_CEC>;
assigned-clock-rates =3D <32768>;

The issue is the clk_rtc32k_frac clock that feeds clk_rtc_32k which
feeds clk_hdmi_cec is 24mhz at boot, which is too high for CEC to
function.
I submitted a patch to have the hdmi driver handle this, but it broke
other SoCs because 32k is an optional clock.
Since this is the case, I'd like Robin to weigh in on going the
assigned-clock route again.

>
> br
>
> btw: my dts gives me working usb2 port0/port1 and usb3 port0. but usb3 po=
rt1 is non-working
> maybe you know what is missing?

You're missing &usb2phy0_otg.

Very Respectfully,
Peter Geis
