Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FA651EF09
	for <lists+dri-devel@lfdr.de>; Sun,  8 May 2022 19:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0F310FD92;
	Sun,  8 May 2022 17:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63DA10FD8E
 for <dri-devel@lists.freedesktop.org>; Sun,  8 May 2022 17:36:13 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id s27so14625742ljd.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 May 2022 10:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=mc7TiSQQPMEbeG7ZiGyr90EpIeFsqchzoclKo6O9CMM=;
 b=gUkllS2et5oszpd7JkVRNeiQpsgPZCMyY06ClaMcq2HPeBS55Ms4O6ZxRUvvjJzV7c
 cxur5bB/6PRxSl+VVwtO0IQliO1EMeiy9/OOjVkRzObOf5FgJBG1HZF2mLaT38abXUVv
 mdVB8jDgsKPD2lesVSF32r/JfZZv8Kl5JbaghfvbV1f+pXk0RslhW5CyZ6F9u1dqBSA1
 COFHklgkncn4QH7RvPkwayNxdpXlcnWxV0YHw2kSB/eMqGK9IEb8nhlyPEpyBDDdTt6L
 KvWkz0Td0+G0pZ6dH6j+CaZUJ0mlx2auQf7w+MqHmSulkD7LyfiGtYJK5Pgw3fHi1Jqk
 3wsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=mc7TiSQQPMEbeG7ZiGyr90EpIeFsqchzoclKo6O9CMM=;
 b=faz3Qv1hWvgTCp/Twf9uUiHbs/fwwIHB6xmNJaX5h7bJqVxBWIx1eeRksFtuNGPoX3
 GNlXAADnX8TQC0m888hHjPOEILxuLj6FfcVFN/GW6dpd2bhPa4+g6i1CgYcxH5ecRUBL
 gNlDrDoA3+YlNuuTMkGRisChJ/J/GM/LU9oemwQypo2TdTf1835Hh5q1eOtARxmjnHkI
 /y0k5Z9Vc2/QGq+mx20inJdsVIORpHFpCmYQC002L0X0ds+Ojn+OUS0ZE+8QtvJEO9uj
 sNIL6HC7VLaNOmL7PDVqQaU+yplT5eKnwJOZdBee3/pXrtptihyTO0Ldsj5fi62vDCR5
 0hMQ==
X-Gm-Message-State: AOAM532DV26pgDxgfaDZR9FbQ8uogO1gMOh0ZPkwF96LiEhP81PunP07
 amK2kxu7fIWeZz8eAZaXdrI=
X-Google-Smtp-Source: ABdhPJwLMv2nyA/yngcxESrM+hZXLDw0uuoQfsv9WXtNUoRf8+z/DZ4YNbFrhZR6S+KuhO0sh0XJzQ==
X-Received: by 2002:a2e:b044:0:b0:250:b16e:45df with SMTP id
 d4-20020a2eb044000000b00250b16e45dfmr4916785ljl.180.1652031371805; 
 Sun, 08 May 2022 10:36:11 -0700 (PDT)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245]) by smtp.gmail.com with ESMTPSA id
 x12-20020a2e584c000000b0024f3d1daed3sm1486496ljd.91.2022.05.08.10.36.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 08 May 2022 10:36:11 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v11 20/24] arm64: dts: rockchip: enable vop2 and hdmi tx
 on rock-3a
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <CAMdYzYoFG3wCQaWXQNJd7mE20OMCj=ZeuewwZfaCJyoCBT-kQQ@mail.gmail.com>
Date: Sun, 8 May 2022 19:36:09 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <0E6FE020-C95E-47CF-A9D6-AC3F2B2D334F@gmail.com>
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
 <20220422072841.2206452-21-s.hauer@pengutronix.de>
 <A86359EC-5291-41BD-966E-EB7890644731@gmail.com>
 <CAMdYzYoFG3wCQaWXQNJd7mE20OMCj=ZeuewwZfaCJyoCBT-kQQ@mail.gmail.com>
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
dniu 08.05.2022, o godz. 18:53:
>=20
>>=20
>> I was trying to do this in dts https://pastebin.com/67wu9QrH but cec =
is still non-functional
>>=20
>> Maybe You have some hints/pointers here?
>=20
> Add the following to the HDMI node:
> assigned-clocks =3D <&cru CLK_HDMI_CEC>;
> assigned-clock-rates =3D <32768>;

I think i have this already (pls see L231/L232 in =
https://pastebin.com/67wu9QrH )

>=20
>>=20
>> br
>>=20
>> btw: my dts gives me working usb2 port0/port1 and usb3 port0. but =
usb3 port1 is non-working
>> maybe you know what is missing?
>=20
> You're missing &usb2phy0_otg.

Maybe i miss something but adding:=20

&usb2phy0_otg {
	phy-supply =3D <&vcc5v0_usb_host>;
	status =3D "okay";
};

breaks working usb3 port0
(so none of usb3 ports are working)


