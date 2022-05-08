Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3DC51EF0B
	for <lists+dri-devel@lfdr.de>; Sun,  8 May 2022 20:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C83310EC31;
	Sun,  8 May 2022 18:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A8010EC31
 for <dri-devel@lists.freedesktop.org>; Sun,  8 May 2022 18:00:15 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2f83983782fso124007927b3.6
 for <dri-devel@lists.freedesktop.org>; Sun, 08 May 2022 11:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+njCfc3VDaggbjwDxdQjFEEmHvGRLPJb/PQlC1knYZ4=;
 b=JbmHMLbkqurs+zTb73d03fNNXr6ZITEAjgQkchJHaLLeV1DVKVzhzD7UEhKg3VPbKA
 ceuyEntVPt77r9m6WzOJF3pFpxN/Eo//hadGctVx1WKWC5WgAuaGaVN46Y5CEtHqjB/0
 KzNsW2kFmyMscNDk5aJSNTXnPNbR1G50K+LddsfxFSg/HLdp+VVOVfFpWKqcNkZyP8x0
 edntJZDQbSywzUBXiYyP84hCD5s3Ne7G8xqE6qEEsfx/C+AfM00vNkLw3DajxzRNlqJI
 wpnv9XfG3sJsW2Ziy+b1SoeDugyiubck9t1q1y0karRrgZHa0caNpEOzbIx/GA8Z0tdd
 WVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+njCfc3VDaggbjwDxdQjFEEmHvGRLPJb/PQlC1knYZ4=;
 b=2PC+8ycExllvMqYME3PSBHqAgqnbaBIed976+n+LuL5YotKhnjox1tWCxCxt/WvVok
 IC/Xyu1pwyGD41ug9MI178m5cwK5mpO7vdQg3ITfNKT7d0J9FMX4DGZXZGLvgHDatj1F
 V0tSxBvIJHmRr6DxUJwd1o1U9CE6vd90gb/cgXjkvwwUmZrJLLixvXkmdXGJtAH2aQ+E
 8bcrnlr5CgBnTZxVMUkZC9m9xyRCMJ2tVhAwtWe+nrHGErebfmVbQMEmZ7JIg19BUuNm
 w67bvfTJUBG3IUu2ON2AKBFaHsrIOKrOzst630UnEr5PbnMoVIf2StmYOPAiTzu2+/ZP
 MOWw==
X-Gm-Message-State: AOAM533gwAU4pMivySlX11wxXnqkKPCezlgxhq7Gx+4+KHD3a5jhLN9p
 lzZ2sulsKT+gV/zafOozEAu+lxlYK1k3u3zvbZw=
X-Google-Smtp-Source: ABdhPJw6cIDfypX3SJ4uKoT1hkXtYscVELpETof/gkGzQRhiepnFiY8aYzYSXcHxPEDoaxJB1B18+S8SDTmmtaYjBHg=
X-Received: by 2002:a81:488b:0:b0:2f7:cc43:ae4c with SMTP id
 v133-20020a81488b000000b002f7cc43ae4cmr11119913ywa.414.1652032814263; Sun, 08
 May 2022 11:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
 <20220422072841.2206452-21-s.hauer@pengutronix.de>
 <A86359EC-5291-41BD-966E-EB7890644731@gmail.com>
 <CAMdYzYoFG3wCQaWXQNJd7mE20OMCj=ZeuewwZfaCJyoCBT-kQQ@mail.gmail.com>
 <0E6FE020-C95E-47CF-A9D6-AC3F2B2D334F@gmail.com>
In-Reply-To: <0E6FE020-C95E-47CF-A9D6-AC3F2B2D334F@gmail.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Sun, 8 May 2022 14:00:02 -0400
Message-ID: <CAMdYzYobfJ7WGN+UQ7t5e1Zy9knjfHLse8KzrGrHPfeMkkG0gw@mail.gmail.com>
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

On Sun, May 8, 2022 at 1:36 PM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w d=
niu 08.05.2022, o godz. 18:53:
> >
> >>
> >> I was trying to do this in dts https://pastebin.com/67wu9QrH but cec i=
s still non-functional
> >>
> >> Maybe You have some hints/pointers here?
> >
> > Add the following to the HDMI node:
> > assigned-clocks =3D <&cru CLK_HDMI_CEC>;
> > assigned-clock-rates =3D <32768>;
>
> I think i have this already (pls see L231/L232 in https://pastebin.com/67=
wu9QrH )

I see you have hdmitxm1_cec as the enabled pin. Are you certain it's
the m1 pin and not the m0 pin?

>
> >
> >>
> >> br
> >>
> >> btw: my dts gives me working usb2 port0/port1 and usb3 port0. but usb3=
 port1 is non-working
> >> maybe you know what is missing?
> >
> > You're missing &usb2phy0_otg.
>
> Maybe i miss something but adding:
>
> &usb2phy0_otg {
>         phy-supply =3D <&vcc5v0_usb_host>;
>         status =3D "okay";
> };
>
> breaks working usb3 port0
> (so none of usb3 ports are working)

Please pass along a full dmesg in this configuration.

>
>
