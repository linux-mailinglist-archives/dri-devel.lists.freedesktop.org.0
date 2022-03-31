Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7971D4EDC23
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D58010F1EE;
	Thu, 31 Mar 2022 14:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A48F10F1EE
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 14:53:09 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id k21so41979606lfe.4
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 07:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=vmDoeYM65y2kqs1U0FjAeUg/McAYeZD0ngDAl5aKrAo=;
 b=RyouiGpySHcPSY1tsZUMswdSX4nK4ERJpUB2Jf6J4w+z5hEQxrSjwCW+IAK/hlZwBb
 anzNUweszLBngBNRSBC8Hug/rfUXNkVWFw80eICjp+0uWUUuJFHBHFFwLmUfNujpdt0J
 kze90T27WMBs/JcG/5/NvBjUrNQQoNCQ6A92E9KfGxZzenaOjyEAhP3IqYF3ZAM4t2Zo
 dfTtXsLrVkbaHcUn344NwSum040Exb3Mx5Z+0oCAmdeRWdIcAJza/Y52YivP/MqNxqjf
 mlJH8zbT1EoTdFrFUOyoz6flgmDNhuq4KDeXE42VvSIg4wt1MheoUKg+AqFY2Xlthymr
 FTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=vmDoeYM65y2kqs1U0FjAeUg/McAYeZD0ngDAl5aKrAo=;
 b=wUYNSoegpcHFN/e+f4aAEgNHCBHzuZshnzDl5wHayZteGPib0RUotg0nuUTnUNui0X
 kIRSvfFKmCBFdXdFIRmHYDM3tTp+ZyU0+EQJkdMj4CZwQIKuy4Gg/D5qb7+s6MQ9pCN2
 zRhZPrcF0QgYUHzyASmcRgTwGgIVrf+VYDLrRdfe7TsLZFt7RAX7P9PciN2Uy5lGgwQw
 1ZTO7Hhu/yR4QeUMKhNEwrQ5qIBA+nco+8OKB9+a/tsjlN3AUA2o54zMY6hF5w29TmB5
 BOo8lhCy4P0XqbPfH6reHSmqD3GOmzBu7+1REL5jtwI5wr2Lih/OpCHjutbRQRGznlYF
 6i/w==
X-Gm-Message-State: AOAM532yR51mtQBTRJpaZUQbENgh0L2rBt/UlXCNvBVMAw4E6vy0B8jr
 PmSHMXGFPkznoH4NC8sQHzQ=
X-Google-Smtp-Source: ABdhPJyDO0bLXzl2vQOY9DGHFBCDhJm9sy6FjUb5x2hdqVvfwTTSfCqYy0LZtN6iLHXj8GSY+7rYDQ==
X-Received: by 2002:a05:6512:1148:b0:448:39c8:89d with SMTP id
 m8-20020a056512114800b0044839c8089dmr10802007lfg.644.1648738387780; 
 Thu, 31 Mar 2022 07:53:07 -0700 (PDT)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245]) by smtp.gmail.com with ESMTPSA id
 bu1-20020a056512168100b004437db5e773sm2692814lfb.94.2022.03.31.07.53.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 31 Mar 2022 07:53:07 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <af8445e0-f4af-721b-709e-2eb7c488a8a4@rock-chips.com>
Date: Thu, 31 Mar 2022 16:53:05 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <B7CD9D55-9F2D-42F4-9D04-17C6A5FEBB08@gmail.com>
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
 <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
 <20220330072822.GX12181@pengutronix.de>
 <0D8F5951-5375-46B5-BFF0-7ED410371EB7@gmail.com>
 <20220330094556.GZ12181@pengutronix.de>
 <D3DA14F9-C9C6-4927-B015-5B7D25689DAA@gmail.com>
 <20220330102046.GA12181@pengutronix.de>
 <60601619-EF07-457B-91F2-64FEB598FEBE@gmail.com>
 <20220330192054.GA4012@pengutronix.de>
 <af8445e0-f4af-721b-709e-2eb7c488a8a4@rock-chips.com>
To: Andy Yan <andy.yan@rock-chips.com>
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
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, kernel@pengutronix.de,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Wiadomo=C5=9B=C4=87 napisana przez Andy Yan <andy.yan@rock-chips.com> =
w dniu 31.03.2022, o godz. 14:13:
>=20
>=20
> Piotr:
>=20
> What soc is on you board? rk3566 or rk3568?

it is rk3566 in x96-x6 tvbox


>=20
> I have a scripts[0]  use io[1] command to dump the VOP2 register you =
can use it dump the register configuration when you meet a display =
failure,
>=20
> then send the dump to me, maybe I can figure out something.
>=20
> =
[0]https://github.com/andyshrk/buildroot/blob/2022/board/andyshrk/rootfs_o=
verlay/usr/bin/vop2_dump.sh
>=20
> [1] https://github.com/andyshrk/io

Andy

Pls see https://pastebin.com/CHmu9s22

I put dumps for following scenarios:

1.
-boot
-modetest -s 69@67:1920x1080 -> ok
-modetest -P 43@67:1920x1080@NV12 -> green screen


2.
-boot
-modetest -s 69@67:1920x1080 -> ok
-modetest -P 49@67:1920x1080@NV12 -> ok (but shifted horizontally by =
about 5% of screen width)
(setting palne#49 fixes plane #43. Here i set plane #49 but not yet =
setting #43)


3.
-boot
-modetest -s 69@67:1920x1080 -> ok
-modetest -P 49@67:1920x1080@NV12 -> ok (but shifted horizontally by =
about 5% of screen width)
-modetest -P 43@67:1920x1080@NV12 -> now ok (but shifted horizontally by =
about 5% of screen width)

