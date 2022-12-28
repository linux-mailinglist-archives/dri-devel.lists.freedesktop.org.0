Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 926A7657584
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 11:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B4410E0FC;
	Wed, 28 Dec 2022 10:55:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4FD10E0FC
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 10:55:44 +0000 (UTC)
Received: from relay11.mail.gandi.net (unknown [217.70.178.231])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 6E7A3C5D2E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 10:46:43 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 256A0100008;
 Wed, 28 Dec 2022 10:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1672224381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tPhB9YD5mKOaUrJH3XDFS7rFqV5FxdGCchYtk5MvfdE=;
 b=gk9JkWgOOMenYieQG9suTpj/sWfHBXPuyGHmqeqY66hups8+Neu2LVN43A1VAhCQHUFofk
 uG9AqJCE4tB2g/X4CTP2BakPuvtGnG90jIICszUiepR1pcbSK2l582jTUYM61zasFqULXV
 zYOo9SX57Dc1RL5jh5uhU2CaimRU3J5nmXG0c14i58oQ3mNKoROPWc21ACoS/+Uz/0jbte
 xJUe/GIimcX6tRPn1V7yHIjb65w1zpMpOHfAjXVft0iQS17PaWZ2bfCbUUB7sGSGECoyG9
 ms+XQ4sf8ntTeSWqBkLByj+VMb31nU0U/CbaVhvrR6Mq5NHcKId4Vituw1OFeQ==
Date: Wed, 28 Dec 2022 11:46:17 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 21/21] staging: media: tegra-video: add tegra20 variant
Message-ID: <20221228114617.397cba35@booty>
In-Reply-To: <44d2d972-1cdf-fdb2-5dc0-cc493f79b3da@gmail.com>
References: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
 <20221128152336.133953-22-luca.ceresoli@bootlin.com>
 <44d2d972-1cdf-fdb2-5dc0-cc493f79b3da@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, Richard Leitner <richard.leitner@skidata.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 23 Dec 2022 15:35:58 +0300
Dmitry Osipenko <digetx@gmail.com> wrote:

> 28.11.2022 18:23, Luca Ceresoli =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

...

> > +static const struct tegra_vip_ops tegra20_vip_ops =3D {
> > +	.vip_start_streaming =3D tegra20_vip_start_streaming,
> > +};
> > +
> > +const struct tegra_vip_soc tegra20_vip_soc =3D {
> > +	.ops =3D &tegra20_vip_ops,
> > +}; =20
>=20
> Shouldn't this be placed in vip.c?

Indeed. Which means tegra210_csi_soc can be moved as well, so I'm adding
a small patch to the series to do that.

> Also looks like patch #20 won't link
> because tegra20_vip_soc is defined in patch #21.

You're right, we have a chicken-egg problem here. One solution would be
leaving tegra_vip_of_id_table empty in patch 20 and fill it only in
patch 21, but that would not be bisectable as patch 20 would introduce
code that nobody uses until patch 21. So I think it's better to squash
together patches 20+21.

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
