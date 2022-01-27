Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A403F49E546
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 15:57:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3156D10EECC;
	Thu, 27 Jan 2022 14:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA94F10EEF3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 09:17:19 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id q22so3333847ljh.7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 01:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=o4tzvhRV4q0XUKGJ8dgFWjAQjVrEQUydtT8zgZxL6O8=;
 b=hq//Oqh0t+LSYYD1W8tLiNbrtErl4z04ToDVMhWDciUtnz4MvYE3C/XQerx/hVMak7
 pwOW0rfdWEQhwYFf8M1aNZY0lyBUyWMXLUTOcJEYYcSA0wFi3qlvUlkRR0vN6j5pcOpd
 vXAtC6MaXS9aLuRAp2U7fUJvRGZiN5pfFD7LCHzcrZQmhU3vuqp+7x+jw3Aoyx+UcdYO
 zXamjSlU6Y/12mh3aXhyVhRvqVIXiN3qsqyDfakUk/305hnkXwCW9KtRAbCICc2boKAI
 mEolgGsO8uEF4PQoEZS3Zh6PJzSYvyoSfgahPlrTSbwyPq3UKjdeI8y2XBkcEXic8GSD
 gcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=o4tzvhRV4q0XUKGJ8dgFWjAQjVrEQUydtT8zgZxL6O8=;
 b=aJd8WBCBlgIjfBKXfDoSnZi7wMFfVrCAwEjCX2DiigzAQx9WJD2IoPa6+O/dsof4NL
 tfawPaIUa3HCEjNNHFUc4UKOiOGZ8GpATAeG1PJJYExEMWnorh4nQ+70HA3C9ZUJVd+0
 +npF4S06SIxdAHPrZIayaJ/iSJxvTSnaErzzOUiizNgTzMLJhx+PI9SGE39NG7OZg1+k
 PZ4BkMx8T7lT+AtXOKu8xqOm1sVkW3C9EjxGbazDI/XwOfRh4ynG3NqOKBNGGb2XULmX
 rD0aT0kwWf6E0E8H1GSFC4IAe8m6HwYX17qq4xQwCrh1Z6VlOYjpDUeeRtr04s7Oc+0G
 lE9A==
X-Gm-Message-State: AOAM533JUK+BLce5I2MPdKnLSSubb1dEdQtp8zHG/HvvyruOAaBOpVZM
 FzsFxja+yxKpeKBnTIQvl1MJnYCw4Cg=
X-Google-Smtp-Source: ABdhPJyrAxTqYqNo/buunWM+RzljgXBFTNIVZZSw0F9X8RJg2othqm6DAnqjvIzcGTTV7CqWTXsneA==
X-Received: by 2002:a05:651c:d2:: with SMTP id
 18mr2131144ljr.399.1643275037959; 
 Thu, 27 Jan 2022 01:17:17 -0800 (PST)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245])
 by smtp.gmail.com with ESMTPSA id h28sm1597872lfe.196.2022.01.27.01.17.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jan 2022 01:17:17 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 27/27] drm: rockchip: Add VOP2 driver
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20220126145549.617165-28-s.hauer@pengutronix.de>
Date: Thu, 27 Jan 2022 10:17:13 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <6588D77C-D3CB-4FB0-8B00-5EDD6ABD6923@gmail.com>
References: <20220126145549.617165-1-s.hauer@pengutronix.de>
 <20220126145549.617165-28-s.hauer@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Mailman-Approved-At: Thu, 27 Jan 2022 14:57:22 +0000
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
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sascha,

FYI=20
small report regarding 4k modes support in v4:

-on rk3399 it gives me 4k screen where right vertical 1/3 part of screen =
is garbage
-on rk3566 my samsung 4k monitor has black screen and cycle of OSD msgs: =
HDMI2 connected; HDMI2 disconnected; ....

I would suggest split v4 into 2 separated series:

-VOP2 support
-HDMI 4k modes support

BTW: getting well working 4k HDMI modes on rk3399 was real story for me.
There is many different series of patches to address this - but all have =
some subtle issues for me (i.e. 4k HDMI modes works but i.e. Qt is =
failing with DRM atomic commits in EGLFS)
I developed well working [1] giving me reliable 4k on rk3399 (including =
working Qt DRM drawing in EGLFS mode)=20
Maybe it will be somehow helpful to get 4k modes solution for rk3566 =
_and_ rk3399 (on single kernel binary)?

[1] =
https://github.com/warpme/minimyth2/blob/master/script/kernel/linux-5.16/f=
iles/0730-drm-rockchip-add-4k-videomodes-support.patch

br


> Wiadomo=C5=9B=C4=87 napisana przez Sascha Hauer =
<s.hauer@pengutronix.de> w dniu 26.01.2022, o godz. 15:55:
>=20
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> The VOP2 unit is found on Rockchip SoCs beginning with rk3566/rk3568.
> It replaces the VOP unit found in the older Rockchip SoCs.
>=20
> This driver has been derived from the downstream Rockchip Kernel and
> heavily modified:
>=20
> - All nonstandard DRM properties have been removed
> - dropped struct vop2_plane_state and pass around less data between
>  functions
> - Dropped all DRM_FORMAT_* not known on upstream
> - rework register access to get rid of excessively used macros
> - Drop all waiting for framesyncs
>=20
> The driver is tested with HDMI and MIPI-DSI display on a RK3568-EVB
> board. Overlay support is tested with the modetest utility. AFBC =
support
> on the cluster windows is tested with weston-simple-dmabuf-egl on
> weston using the (yet to be upstreamed) panfrost driver support.
>=20
> Changes since v3:
> - Sort includes
> - fix typos
> - Drop spinlock
> - Use regmap_set_bits()/regmap_clear_bits()
> - simplify vop2_scale_factor()
> - simplify vop2_afbc_transform_offset()
>=20

