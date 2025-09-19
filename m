Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48204B8A30A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 17:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B593010E241;
	Fri, 19 Sep 2025 15:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="U826dbrf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE36B10E241
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 15:08:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9B34B4E40D1E;
 Fri, 19 Sep 2025 15:08:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 55895606A8;
 Fri, 19 Sep 2025 15:08:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C38A0102F1D79; 
 Fri, 19 Sep 2025 17:08:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1758294530; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=kVkUIo4dQVT4SOntZ8cZ5+tgvO9vk9zBQavLp3x8Y90=;
 b=U826dbrfoYbVfNFx4Z8CHR+MxQoqEzgV6pb0s//raOyvHWb+CQ0/CKQ/dvTw3eNBDb9BPb
 YXZdxuRY6vu3bawS6Tje2jgmpPLMKsT2HtUB/94Pm6vym/Dk6voLAxKbxJ99iDghwh67TQ
 8NBtm1FzWB9pywWDF1xjX5IQFCA13ZXh+ost/xZ51KAXR2V3X44lQNmgFJJexbXTwG7ACf
 McDDbYEbyeudr/9TpAMH8iXWVGDFn2dSle/rGdtMiRcZdDI9+xSyG45ewNpQlB/MxyB4d1
 zTQFL5Q1gGkaGrJ27v+uP1jKiK8KBld0WRlbQ6IAyT9U3oRWGv6aT32Z5MxPag==
Date: Fri, 19 Sep 2025 17:08:24 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org,
 dianders@chromium.org, cristian.ciocaltea@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v5 4/7] drm/bridge: dw-hdmi: Add API
 dw_hdmi_set_sample_iec958() for iec958 format
Message-ID: <20250919170824.63df1d6e@booty>
In-Reply-To: <CAA+D8AP8eJ8_pueq1ZSb-ORzTJbNT7HOwKFOO5ZCXqgqoQ1qGQ@mail.gmail.com>
References: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
 <20250821073131.2550798-5-shengjiu.wang@nxp.com>
 <20250901185208.394cd162@booty>
 <CAA+D8AOCTqb5jLeRapYk4wRGZrsrPiuAR=ow3OA1B0+M9X4k7w@mail.gmail.com>
 <20250909-omniscient-honeybee-of-development-adca8a@houat>
 <CAA+D8AM=aRU-0QcgtxZ+=YBZ2+kMrP2uzSE3e+NJs3Z3zkrSVg@mail.gmail.com>
 <CAA+D8AP8eJ8_pueq1ZSb-ORzTJbNT7HOwKFOO5ZCXqgqoQ1qGQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Shengjiu,

On Fri, 19 Sep 2025 11:43:05 +0800
Shengjiu Wang <shengjiu.wang@gmail.com> wrote:

> Hi Luca
>=20
> On Wed, Sep 10, 2025 at 6:29=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmai=
l.com> wrote:
> >
> > Hi
> >
> > On Tue, Sep 9, 2025 at 2:39=E2=80=AFPM Maxime Ripard <mripard@kernel.or=
g> wrote: =20
> > >
> > > Hi,
> > >
> > > On Wed, Sep 03, 2025 at 06:41:05PM +0800, Shengjiu Wang wrote: =20
> > > > On Tue, Sep 2, 2025 at 12:52=E2=80=AFAM Luca Ceresoli <luca.ceresol=
i@bootlin.com> wrote: =20
> > > > >
> > > > > Hello Shengjiu,
> > > > >
> > > > > On Thu, 21 Aug 2025 15:31:28 +0800
> > > > > Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> > > > > =20
> > > > > > Add API dw_hdmi_set_sample_iec958() for IEC958 format because a=
udio device
> > > > > > driver needs IEC958 information to configure this specific sett=
ing.
> > > > > >
> > > > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > > Acked-by: Liu Ying <victor.liu@nxp.com> =20
> > > > >
> > > > > [...]
> > > > > =20
> > > > > > +void dw_hdmi_set_sample_iec958(struct dw_hdmi *hdmi, unsigned =
int iec958)
> > > > > > +{
> > > > > > +     mutex_lock(&hdmi->audio_mutex);
> > > > > > +     hdmi->sample_iec958 =3D iec958;
> > > > > > +     mutex_unlock(&hdmi->audio_mutex);
> > > > > > +} =20
> > > > >
> > > > > Apologies for jumping in the discussion as late as in v5, but I n=
oticed
> > > > > this patch and I was wondering whether this mutex_lock/unlock() is
> > > > > really needed, as you're copying an int. =20
> > > >
> > > > Thanks for your comments.
> > > >
> > > > Seems it is not necessary to add mutex here. I just follow the code=
 as
> > > > other similar functions.  I will send a new version to update it. =
=20
> > >
> > > Let's not be smart about it. Next thing you know, someone will add
> > > another field in there that would absolutely require a mutex and now
> > > you're not race free anymore.
> > >
> > > Unless there's a real concern, the mutex must stay.
> > > =20
> >
> > Ok, thanks for comments.  Then Patch v6 need to be dropped.
> >
> > Is there any other comments for this Patch v5?
> > If no, can this series be accepted?
> > =20
>=20
> Can we have a conclusion that keeps the mutex as Maxime's comments?

If Maxime wants the mutex to be kept, it's fine.

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
