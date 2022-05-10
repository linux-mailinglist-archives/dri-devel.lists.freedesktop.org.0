Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E81CE521A0F
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 15:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A91D10E1B9;
	Tue, 10 May 2022 13:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3A910E191
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 13:49:32 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id t25so20922355ljd.6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 06:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=fhyetRl0+XtSQ8inEVdE1Z7bqWcZkmFId3JNUI9ZZ/s=;
 b=iBSBnjuojXncJbWUNQh+FcoAri2q5utp07Svkg2cJP8lgkIjQ+0jK07gf+snxFBkc0
 RpBs+YBp+Kr5/Z84US0jK7AZSEha7j5CUa3TTaeQfmgyso41u7XKdYMjPorn3miALgUW
 cfWpi6bnvoD4/sJsynTuzmJHXtvReInDLexFLcDohvjmNR40Co1UxFVN59JWnrKI3W++
 i0zG1zsny/omb1sOl8q35ddnOlDvjUGo+OGxAvU3lwp8G4kf45F6r+XrWfX9h9sYwDz2
 UjuL8F+JcXwyNyRRZewVbZeFD9qV3aGsx1KtCFvYc8bEVj+dndjf33kTs83nJwCyt7qc
 NwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=fhyetRl0+XtSQ8inEVdE1Z7bqWcZkmFId3JNUI9ZZ/s=;
 b=sfg1S6lFQmCBZUPZGZBvwELW2ii+d1b4jY6BUwio3gb1jBO+B+/h/ArhX2AcsZnp/h
 kxqKhNzM5/Yz+Crdr0xDKon617CvqCw3Yus0koSTxRQHG8sGWWr+I7FlkNwwSzqimc0y
 Wy1hCumVcWrmIIu5dFO9+D3lPkCiRJ/OufND6AnAmvlrv4k4QxZWo5zZ4rScIlOX6K25
 WMznmaZwa/UilDNNokEtOr1QPBm0n0K6WlWs3RvW+rje6am0Oe3ITuQU294s+qO1b9AT
 bIfLMlh+eQMgNEHgtzMv9znRrbsjPXNhZWUadsLj4WcMiyhwVMNg/RkZJbx1wdGJ02Vw
 Si1w==
X-Gm-Message-State: AOAM531DChh5Dtx8hVxk79Nm6NpPKSTdbqn+INI+8OC+vNq6e7Mn1F67
 nntoSptkEDtNhgwsxYXsAK8=
X-Google-Smtp-Source: ABdhPJzsmCunC7oz57z6DIfJLz/imDwVtRjrJHN0HTIbDvffAXk7ZlZVYXRq8otV6UTBM/eeajzghA==
X-Received: by 2002:a2e:bc10:0:b0:250:59ed:405a with SMTP id
 b16-20020a2ebc10000000b0025059ed405amr13392125ljf.301.1652190571163; 
 Tue, 10 May 2022 06:49:31 -0700 (PDT)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245]) by smtp.gmail.com with ESMTPSA id
 q19-20020a0565123a9300b0047255d211b6sm2292920lfu.229.2022.05.10.06.49.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 May 2022 06:49:30 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v11 20/24] arm64: dts: rockchip: enable vop2 and hdmi tx
 on rock-3a
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <CAMdYzYrsaNED+oMj+z2b4fK7pt32Qg=nXDk3SA0KFDDCJ2XY0g@mail.gmail.com>
Date: Tue, 10 May 2022 15:49:28 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <F1728C93-CFF8-4C51-B95C-A5049E0DC46A@gmail.com>
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
To: Peter Geis <pgwipeout@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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



> Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w =
dniu 10.05.2022, o godz. 14:08:
>=20
>=20
> You are on the clk_rtc32k_frac which is a fractional divider that is
> fed from the 24m clock. Your clock likely isn't the issue here. I'd
> recommend setting up the cec-gpio node to validate your hardware
> works.

Peter,

Here is what i done to verify my rock3-a HW:

1.download & burn on SD Radxa Ubuntu
2.boot and install v4l-utils
3.run cec-compliance -v -T. It fails with error -22
4.decompile Ubunntu DT.
5.Check what HDMITX_CEC_M hdmi uses. It was M0
6.Chenge to HDMITX_CEC_M1; compile dtb; install on sd
7.reboot.
8.cec-compliance -v -T gives all tests OK
9.cec-ctl --image-view-on -t0 turns-on my TV

hope this proves my HW is ok?
=20=
