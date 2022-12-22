Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E272B653D57
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 10:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C3B10E532;
	Thu, 22 Dec 2022 09:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D2C10E533
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 09:12:47 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 66E9ACE748
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 09:04:11 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 098A8240006;
 Thu, 22 Dec 2022 09:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1671699829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gktEAWN3JB8j4tgK6e174eAxgB6KpzGMlNNM9C0jpTQ=;
 b=hkeMahLxr95J8jRRBnHvUsJYopZH+NMQb36c/kMWeoRhxAs9R0Nsx8Kqm4U4LWysvOU4rF
 NOIWJ4Zdl2Q5dDwUN/9g+0FVXa2wXZXOsk7HTAxAy0vDhJzSm3+xBN79nR+exWUshQho0n
 TtXXf4UQwrpswjA0RHE4dVmNNSZqJrhzz3Npot2ARR9J9w3hzGj1YuIKyMSJsiJPG42RrC
 hed3gv6cFfcUIZtqDTYk0dIwQUY5zfKceYc9cFExuKYtMcklW7NUXc94FiHaP5kEglHpvS
 jA0pmJ5r/t1D76kP/f+IqMwWqd69m16O/ZRCLR4rCWJLZ5XFm1xIAyAQsSY4LQ==
Date: Thu, 22 Dec 2022 10:03:41 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 21/21] staging: media: tegra-video: add tegra20 variant
Message-ID: <20221222100341.5882c19c@booty>
In-Reply-To: <30e6b040-aa82-f6a3-1ff6-baa2c0dcb0e2@gmail.com>
References: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
 <20221128152336.133953-22-luca.ceresoli@bootlin.com>
 <30e6b040-aa82-f6a3-1ff6-baa2c0dcb0e2@gmail.com>
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

Hello Dmitry,

On Wed, 21 Dec 2022 00:40:20 +0300
Dmitry Osipenko <digetx@gmail.com> wrote:

> 28.11.2022 18:23, Luca Ceresoli =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > +static int tegra20_channel_capture_frame(struct tegra_vi_channel *chan,
> > +					 struct tegra_channel_buffer *buf)
> > +{
> > +	u32 value;
> > +	int err;
> > +
> > +	chan->next_out_sp_idx++;
> > +
> > +	tegra20_channel_vi_buffer_setup(chan, buf);
> > +
> > +	tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_VIP=
_ENABLE);
> > +
> > +	/* Wait for syncpt counter to reach frame start event threshold */
> > +	err =3D host1x_syncpt_wait(chan->out_sp, chan->next_out_sp_idx,
> > +				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value); =20
>=20
> You're not using the "value" variable, it should be NULL.

Ah, sure, good catch.

> The "chan->out_sp" looks redundant, it duplicates the chan->mw_ack_sp.

I agree it is redundant and can be improved.

> AFAICS from the doc, T20 has two VI channels, and thus, two mw_ack_sp,
> like T210.

I'm confused by this. In the current driver, each VI channel has an
array of 2 mw_ack_sp, the second of which is only used the ganged
CSI ports. I have no docs mentioning ganged ports so I don't know
exactly how they work and whether T20 might need more than 1 syncpt per
channel or not for CSI. Definitely when using VIP only one such syncpt
per each VI (or per each VIP, as per your reply to patch 1) is needed.

Bottom line: I think I can simply remove the out_sp and in the VIP code
always use chan->mw_ack_sp[0], and document that it's what is called OUT
in VIP terms.

Does this plan seem good?

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
