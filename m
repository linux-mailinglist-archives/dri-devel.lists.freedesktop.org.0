Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B91B5225EB
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 22:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1225610ED45;
	Tue, 10 May 2022 20:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109B710ED45
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 20:54:37 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id s30so147565ybi.8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 13:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F4vxlgRcJXMV+aeCdSejL/H/Xyip+2XNsa7o7QrIj9c=;
 b=apYcKFXKyRkKXltVE6V+9HmyVLiAdJ07j4L052Dhh7z4NHT8SrOlBnyAnbOTceQ7PB
 23Z0U4YuI4KK91eKNObrYNfEHmkq7gox8ifAC9YouElHNV1qnH2R2dx+NYSyUCmXf9Du
 UEEoVJfaUwH9J9pu2XtGEzrDtpAeCuFQ59IOUdSR3aAdZ1QhuexZWBBiGPt5xoWSbGKj
 ebFWwVxhAIpUBSpdEXDw6sDv9Au5t1D92DDcY1c62DJ+eZRqwTntqSsdU11rHNZT9wEZ
 672/J6crkeFEdE2TS/XMy3JLC4z7rpmvYdQTHAnUEKBz54LaySOtSlsCIXMn0p4QFXM+
 akRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F4vxlgRcJXMV+aeCdSejL/H/Xyip+2XNsa7o7QrIj9c=;
 b=nEJ1OziiNBVQ136knKfnIw/ZC40gIcV4HpXXsePUX5XlzcaU80+STmZcmFCzPbVqKu
 WZrMT2ithQ2wwwR7+W7ms+1P7UmlJ2mzD7ETYmb7+FrvEnKuJxdgqKkMNMGtWBYNNEWW
 JlaQmYyy9sIqNGem/iVSC4YhcpOr21DekUkRXpASCJgfayoewbB3jdeeFGJVaP5ildBo
 ewrr0tOqApltj/K2bkjwuTySqCdClx+A0hYS6lH9itHSr1D7n9oHbwRTaw3xEU2+Bn9u
 v+8pfuF92hf1yRB4YJ2S52KVOc5ydqy4QvZbnBxx3MayEHnQiQARd58MSdGf6YPr3m+W
 nRTA==
X-Gm-Message-State: AOAM533YEdOATvF79ERTW+qyZVO2PJZ1m2x/i86fW7i08hALUdOtULSm
 BTvGMbTUD4CP4n6BK7KEDt8qAINSU+XaDvxuxp4=
X-Google-Smtp-Source: ABdhPJyaG6G68FpJZXYbpEI0CKixy2QsjV3l/Y8sR4dCm0x57IHgDblj9keWqf/J6N25b3y3godPjx2UMZujqyXpA7Q=
X-Received: by 2002:a05:6902:cf:b0:641:32bb:53fc with SMTP id
 i15-20020a05690200cf00b0064132bb53fcmr21078507ybs.232.1652216076188; Tue, 10
 May 2022 13:54:36 -0700 (PDT)
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
 <CAMdYzYrsaNED+oMj+z2b4fK7pt32Qg=nXDk3SA0KFDDCJ2XY0g@mail.gmail.com>
 <F1728C93-CFF8-4C51-B95C-A5049E0DC46A@gmail.com>
In-Reply-To: <F1728C93-CFF8-4C51-B95C-A5049E0DC46A@gmail.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Tue, 10 May 2022 16:54:24 -0400
Message-ID: <CAMdYzYpRVZ2hrGiYeQLqSduOZyKuZenw9bViS7oW7d3MWN7Z8g@mail.gmail.com>
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

On Tue, May 10, 2022 at 9:49 AM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w d=
niu 10.05.2022, o godz. 14:08:
> >
> >
> > You are on the clk_rtc32k_frac which is a fractional divider that is
> > fed from the 24m clock. Your clock likely isn't the issue here. I'd
> > recommend setting up the cec-gpio node to validate your hardware
> > works.
>
> Peter,
>
> Here is what i done to verify my rock3-a HW:
>
> 1.download & burn on SD Radxa Ubuntu
> 2.boot and install v4l-utils
> 3.run cec-compliance -v -T. It fails with error -22
> 4.decompile Ubunntu DT.
> 5.Check what HDMITX_CEC_M hdmi uses. It was M0
> 6.Chenge to HDMITX_CEC_M1; compile dtb; install on sd
> 7.reboot.
> 8.cec-compliance -v -T gives all tests OK
> 9.cec-ctl --image-view-on -t0 turns-on my TV
>
> hope this proves my HW is ok?
>

That does show that the hardware works with the oem image. It does not
unfortunately prove if it works with your current dts. cec-gpio will
show if it's an issue with the cec controller or an external problem.
