Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FEE520AC4
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 03:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2E510F53C;
	Tue, 10 May 2022 01:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FED10F53B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 01:35:31 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id v59so28070196ybi.12
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 18:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tgQGf37/yajS40wdeiIzg35sz5K80n59MEBz2sxPMrI=;
 b=KXErh4hMFThoubgEBIieo6bT1B/NZyBuaRv+8dR1aW1o8EoPwumm5ZDo3rLNuEAgkk
 NfLLeT7M6ziEtGCYHTG19vQW+J/izL5Ob+23RPuTHXQ1HuEYeOEt016Ivrj0Y4pQKV2i
 IeRa1zG/DivB14+nebwQHE30qm7KgwcZ/qh0LltX9WWlFCNWzFcN0WoGdCy21X8ChP8B
 RcE1WgJP2A7NvgC6wzq89SQx1JHElSbsPtQlFGspOcpXH5KN9mMTdUcwr9jKVdGWQ7UZ
 A60gkMONzpGpTKOw20atbM5HbV7d3Rq+BRhYVeVimfDktR9Q3X6YcX3qTXeeN3A/lBkW
 vHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tgQGf37/yajS40wdeiIzg35sz5K80n59MEBz2sxPMrI=;
 b=U+Lot5TjKrajoYpc4I4JTcrlBIsxNX/2N83tyWdagxP4CkpbL+K5PrqTHNBWVlSpXu
 07Fa+CFF7xMF2IdkToVzY0cWZf5P6PchZqDWDVIJp6IDCNCVzFElExu1zsyFMqW0Pp0Y
 wMLG6BhA9Nuf0jccGpuhixinS3PNcqnhmbQdanvegBeAU4cZCGJ4cuZXWC9b2kD1cqko
 rlyuNADwFScZ4OszjuZGGEpqEO0yrNys7NlfATZe7eQ6yL026NWuPv4DhEMYx/60TTbl
 xxWEw4ShYlLJ4gbh948V3pEFtjXlhgIMh91YmRR6mHx+g/YLMY05JNzXwgqUDroUqKaF
 elAQ==
X-Gm-Message-State: AOAM530iq+y3DGdY1mx9DkIl5CwhWwDbxRVnA8lmGomFLvU+5HaS3dzA
 TgnywliIyROCqSGv4KTvocSgnCxbwyKt5C7ihGM=
X-Google-Smtp-Source: ABdhPJxEkQImRUZ82vhUd6TIQzqrS/SPPmEOgD6MF0+jFiIjmm67r7EZh9CkFVFp1FXTF/grJ21E2WgTBnmK74Q9TnM=
X-Received: by 2002:a05:6902:cf:b0:641:32bb:53fc with SMTP id
 i15-20020a05690200cf00b0064132bb53fcmr16634535ybs.232.1652146530468; Mon, 09
 May 2022 18:35:30 -0700 (PDT)
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
In-Reply-To: <812AC0DB-A6D0-4DA3-BCDC-7743E8F61821@gmail.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Mon, 9 May 2022 21:35:19 -0400
Message-ID: <CAMdYzYozewYUbM=Q+iJ2wdM5TrB6dGrjS6zh0qmVgWD4XPVR+Q@mail.gmail.com>
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

On Mon, May 9, 2022 at 3:49 PM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
> >
> > If you want to confirm the hardware is configured correctly you can
> > remove the cec pin from the hdmi node and set up a cec-gpio node.
> > https://elixir.bootlin.com/linux/v5.18-rc5/source/Documentation/devicet=
ree/bindings/media/cec-gpio.txt
> >
> > For some reason the board developers decided to make this selectable,
> > check the location of R90652 and R90653.
> >
>
> Peter,
>
> my board is v1.31 and is using HDMITX_CEC_M1 i think.
> I verified this by temp. changing to HDMITX_CEC_M0
>
> For M1:
> 2022-05-09 21:12:37.130188 I  CECAdapter: Using physical address 1.0.0.0 =
from EDID
> 2022-05-09 21:12:37.173267 I  CECAdapter: Found 1 CEC devices(s).
> 2022-05-09 21:12:37.173299 I  CECAdapter: Device 1: path '/dev/cec0' com =
port 'Linux' SELECTED
> 2022-05-09 21:12:37.173307 I  CECAdapter: Trying to open device /dev/cec0=
 (Linux).
> 2022-05-09 21:12:37.180095 I  CECAdapter: connection opened
> 2022-05-09 21:12:37.545229 I  CECAdapter: setting HDMI port to 1 on devic=
e TV (0)
> 2022-05-09 21:12:37.904145 I  CECAdapter: >> source deactivated: Playback=
 1 (4)
> 2022-05-09 21:12:37.904311 I  CECAdapter: Source 4 Deactivated
> 2022-05-09 21:12:38.284452 I  CECAdapter: >> source activated: Playback 1=
 (4)
> 2022-05-09 21:12:38.284492 I  CECAdapter: Source 4 Activated
> 2022-05-09 21:12:38.284694 I  CECAdapter: CEC client registered: libCEC v=
ersion =3D 6.0.2, client version =3D 6.0.2, firmware version =3D 0, logical=
 address(es) =3D Playback 1 (4) , physical address: 1.0.0.0, git revision: =
v12.0.0-v32.0-16-g611cac15cc+59-07dc900~dirty, compiled on 2022-04-23 05:50=
:57 by piotro@/bin/sh: hostname: command not found on Linux 5.16.14-arch1-4=
 (x86_64), features: P8_USB, DRM, P8_detect, randr, Linux
> 2022-05-09 21:12:38.519394 I  CECAdapter: Opened CEC device.
> 2022-05-09 21:12:38.636950 I  CECAdapter: << powering on 'TV' (0)
> 2022-05-09 21:12:38.754023 E  CECAdapter: Failed to turn TV on.
> 2022-05-09 21:12:38.754313 I  CECAdapter: >> source activated: Playback 1=
 (4)
> 2022-05-09 21:12:38.754343 I  CECAdapter: Source 4 Activated
> 2022-05-09 21:12:38.872079 I  CECAdapter: << Playback 1 (4) -> broadcast =
(F): active source (1000)
> 2022-05-09 21:12:38.974698 I  CECAdapter: Asked TV to switch to this inpu=
t.
> 2022-05-09 21:13:07.292069 W  CECAdapter: CEC device can't poll TV: TV do=
es not respond to CEC polls
> 2022-05-09 21:13:37.296372 W  CECAdapter: CEC device can't poll TV: TV do=
es not respond to CEC polls
>
> for M0:
> 2022-05-09 21:37:47.632175 I  CECAdapter: Using physical address 1.0.0.0 =
from EDID
> 2022-05-09 21:37:47.680618 I  CECAdapter: Found 1 CEC devices(s).
> 2022-05-09 21:37:47.680644 I  CECAdapter: Device 1: path '/dev/cec0' com =
port 'Linux' SELECTED
> 2022-05-09 21:37:47.680654 I  CECAdapter: Trying to open device /dev/cec0=
 (Linux).
> 2022-05-09 21:37:47.694974 I  CECAdapter: connection opened
> 2022-05-09 21:37:56.341846 I  CECAdapter: setting HDMI port to 1 on devic=
e TV (0)
> 2022-05-09 21:38:17.675457 I  CECAdapter: >> source activated: Playback 1=
 (4)
> 2022-05-09 21:38:17.675561 I  CECAdapter: Source 4 Activated
> 2022-05-09 21:38:17.675657 I  CECAdapter: CEC client registered: libCEC v=
ersion =3D 6.0.2, client version =3D 6.0.2, firmware version =3D 0, logical=
 address(es) =3D Playback 1 (4) , physical address: 1.0.0.0, git revision: =
v12.0.0-v32.0-16-g611cac15cc+59-07dc900~dirty, compiled on 2022-04-23 05:50=
:57 by piotro@/bin/sh: hostname: command not found on Linux 5.16.14-arch1-4=
 (x86_64), features: P8_USB, DRM, P8_detect, randr, Linux
> 2022-05-09 21:38:30.475336 I  CECAdapter: Opened CEC device.
> 2022-05-09 21:38:34.741846 I  CECAdapter: << Playback 1 (4) -> broadcast =
(F): active source (1000)
> 2022-05-09 21:38:39.008432 I  CECAdapter: << powering on 'TV' (0)
> 2022-05-09 21:38:39.008506 E  CECAdapter: CLinuxCECAdapterCommunication::=
Write - ioctl CEC_TRANSMIT failed - tx_status=3D00 errno=3D22
> 2022-05-09 21:38:39.008526 E  CECAdapter: CLinuxCECAdapterCommunication::=
Write - ioctl CEC_TRANSMIT failed - tx_status=3D00 errno=3D22
> 2022-05-09 21:38:43.275094 E  CECAdapter: Failed to turn TV on.
> 2022-05-09 21:38:43.275201 I  CECAdapter: >> source activated: Playback 1=
 (4)
> 2022-05-09 21:38:43.275224 I  CECAdapter: Source 4 Activated
> 2022-05-09 21:38:43.275375 W  CECAdapter: CEC device can't poll TV: TV do=
es not respond to CEC polls
> 2022-05-09 21:38:47.541811 I  CECAdapter: << Playback 1 (4) -> broadcast =
(F): active source (1000)
> 2022-05-09 21:38:47.541898 E  CECAdapter: CLinuxCECAdapterCommunication::=
Write - ioctl CEC_TRANSMIT failed - tx_status=3D00 errno=3D22
> 2022-05-09 21:38:47.541909 E  CECAdapter: CLinuxCECAdapterCommunication::=
Write - ioctl CEC_TRANSMIT failed - tx_status=3D00 errno=3D22
> 2022-05-09 21:38:47.541924 E  CECAdapter: Failed to switch to this input.
> 2022-05-09 21:38:51.808626 I  CECAdapter: << Playback 1 (4) -> broadcast =
(F): active source (1000)
> 2022-05-09 21:38:51.808722 E  CECAdapter: CLinuxCECAdapterCommunication::=
Write - ioctl CEC_TRANSMIT failed - tx_status=3D00 errno=3D22
> 2022-05-09 21:38:51.808735 E  CECAdapter: CLinuxCECAdapterCommunication::=
Write - ioctl CEC_TRANSMIT failed - tx_status=3D00 errno=3D22
> 2022-05-09 21:38:57.142091 I  CECAdapter: << Playback 1 (4) -> broadcast =
(F): active source (1000)
> 2022-05-09 21:38:57.142109 E  CECAdapter: CLinuxCECAdapterCommunication::=
Write - ioctl CEC_TRANSMIT failed - tx_status=3D00 errno=3D22
> 2022-05-09 21:38:57.142117 E  CECAdapter: CLinuxCECAdapterCommunication::=
Write - ioctl CEC_TRANSMIT failed - tx_status=3D00 errno=3D22
> 2022-05-09 21:39:02.475097 I  CECAdapter: << Playback 1 (4) -> broadcast =
(F): active source (1000)
> 2022-05-09 21:39:02.475115 E  CECAdapter: CLinuxCECAdapterCommunication::=
Write - ioctl CEC_TRANSMIT failed - tx_status=3D00 errno=3D22
> 2022-05-09 21:39:02.475123 E  CECAdapter: CLinuxCECAdapterCommunication::=
Write - ioctl CEC_TRANSMIT failed - tx_status=3D00 errno=3D22
>
> > I have some concerns about the DTS you've built here. For instance how
> > come you are modifying the power domains?
>
> This was experiment as I was advised:
>
> "32k clock needed for cec and this clock is generated by the rtc which is=
 embedded in the rk8xx regulator.
> So you should make sure it is enabled when hdmi is powerd on, eg adding i=
t to the RK3568_PD_VO powerdomain should help"

Could you grab the clock tree from /sys/kernel/debug/clk/clk_summary
for the clk_hdmi_cec tree?

>
> power domains entries in dts was attempt to play with above cec clock sug=
estion.
>
> M0/M1 logs in this email are from cleaned dts: https://pastebin.com/0pgwp=
dsS
>
> > USB3 is broken because the rock3-a is a rk3568 device and you're
> > missing combophy0.
>
> Perfect. all 4 usb ports are now working.
> Also no errors in dmesg.
> Thx!

Good news!

>
