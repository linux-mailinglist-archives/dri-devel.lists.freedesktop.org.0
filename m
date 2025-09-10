Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB42B513FE
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 12:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9069710E2CF;
	Wed, 10 Sep 2025 10:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="noPGNHn2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B6410E2CF
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 10:29:25 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-61d7b2ec241so8193679a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 03:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757500163; x=1758104963; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VFR8ZPpFEPCVYzLk5x4GOe0UcgUOQwtlh+HxpxWLLgo=;
 b=noPGNHn2OOgPhMbR/GmXPNaMCMQnMsWF+tdpwdOan0oiDgEzFjRYYF1O220rjb4UVT
 UCa/4kljAxDH99tYJYLPXuqttq2alKkrt2xQt8wFGi+vNOECqBBIopcByc8g12JvNsJb
 Uiqd2TPKch4NPeSbcnil+xI87JbzpGvDpY/xR3vUQaGGaoa5wi0BEUeqG+SG1myGDmke
 eMN1XkJiaSMjMXUW6Xfas/KHVNY5cpovbYlhkw6y3MmDkwQ35WdHUJXaO/3z4/iU//pj
 sRvxLKHcs4DXiSAPmH2yVVWY0lB75A91RmvdygclzPAe/7xIq8DB1qBuOYQVmMLD0RjI
 cTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757500163; x=1758104963;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VFR8ZPpFEPCVYzLk5x4GOe0UcgUOQwtlh+HxpxWLLgo=;
 b=aY+ttspTrOdpOWnYbwHwMymLt1IzvlYXrFE/VLoa8sFXpvNSgWgfaItZro8KxsAXwP
 6PIV19mfUS6t1eKoUW76TPuKZUhjuEnErFaZ3at6N2LXjC/1ZBm/R0aZy9wVc2slM2bj
 V8ea+2XLgDpH8tTSCNIEJYyU8709CqdseuLJn1TyeSz+UFlA3uYMy63zWqDOeiKImu9j
 dNplAnQBadJl16D5IJDEWbFJwc0uGSwyDhv7avE9zf56hEX0Ryey7maz/bUIKN9TehPi
 HSYHmeBoynFyQw0hdN9i+C0iA4chjUcrFDhyE7punP2jA62HnZassT3oU0ECtYpK8Mwq
 zPvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVozRzhpX4qDDztq0GVz4bokuscbYliRTe6+DkUEM4sJlTrqcoqTii5EaEl5DbR4YvVhXRhFSNVjj8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytRHJDAqQfLd1HiKVV8DowGUXVxNQqy2i6STeyd/0ms8sqOosY
 Zf+5ovsTPJnsDgS4yjOIPikFhOG9nHrCUt+Kw88BzCFtNkG1p3MMOjKZhpeFxQmBbTrBRWkAtYc
 +YaAtVaAFiZtjjMJOtOjHj4s9vVJnJr4=
X-Gm-Gg: ASbGnct5zyi48gS2usLbFK/K/2BxHOvK+kzG82FIT0AKH1uTFH1R4dPowvPEkKOHyoI
 1Oxb5krp1/xaLGwniPBHOXS1b1291kRJn3mgtR6GSWCJGs1Bj38iSd3eQx3kmYPmeIUGC4hUaZd
 qCmp1Wy702GulX/WDVyt6P9j3WNtlTktOx966Xurb29v9/5vf5Jf5o7Is1owYvgrWxqBFlw3r4L
 B7geZ4=
X-Google-Smtp-Source: AGHT+IECula9dQIHz1fdQAkXI9rWQDEmBppATKx+V8i0x7QFJ364KiBjVFFTrRLIeHCkEnfADY+kNhoLNela/4vT6zI=
X-Received: by 2002:a05:6402:35c6:b0:62b:63f8:cdbb with SMTP id
 4fb4d7f45d1cf-62b63f8d53fmr6060144a12.25.1757500163205; Wed, 10 Sep 2025
 03:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
 <20250821073131.2550798-5-shengjiu.wang@nxp.com>
 <20250901185208.394cd162@booty>
 <CAA+D8AOCTqb5jLeRapYk4wRGZrsrPiuAR=ow3OA1B0+M9X4k7w@mail.gmail.com>
 <20250909-omniscient-honeybee-of-development-adca8a@houat>
In-Reply-To: <20250909-omniscient-honeybee-of-development-adca8a@houat>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 10 Sep 2025 18:29:06 +0800
X-Gm-Features: AS18NWDxCBzuENqe0ZeZa-sBoiFIIvg2ByB3rkyz5E1gppn1Dt3RitckbH6afXg
Message-ID: <CAA+D8AM=aRU-0QcgtxZ+=YBZ2+kMrP2uzSE3e+NJs3Z3zkrSVg@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] drm/bridge: dw-hdmi: Add API
 dw_hdmi_set_sample_iec958() for iec958 format
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
 cristian.ciocaltea@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, victor.liu@nxp.com, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
 devicetree@vger.kernel.org, l.stach@pengutronix.de, perex@perex.cz, 
 tiwai@suse.com, linux-sound@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Tue, Sep 9, 2025 at 2:39=E2=80=AFPM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> Hi,
>
> On Wed, Sep 03, 2025 at 06:41:05PM +0800, Shengjiu Wang wrote:
> > On Tue, Sep 2, 2025 at 12:52=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bo=
otlin.com> wrote:
> > >
> > > Hello Shengjiu,
> > >
> > > On Thu, 21 Aug 2025 15:31:28 +0800
> > > Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> > >
> > > > Add API dw_hdmi_set_sample_iec958() for IEC958 format because audio=
 device
> > > > driver needs IEC958 information to configure this specific setting.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > Acked-by: Liu Ying <victor.liu@nxp.com>
> > >
> > > [...]
> > >
> > > > +void dw_hdmi_set_sample_iec958(struct dw_hdmi *hdmi, unsigned int =
iec958)
> > > > +{
> > > > +     mutex_lock(&hdmi->audio_mutex);
> > > > +     hdmi->sample_iec958 =3D iec958;
> > > > +     mutex_unlock(&hdmi->audio_mutex);
> > > > +}
> > >
> > > Apologies for jumping in the discussion as late as in v5, but I notic=
ed
> > > this patch and I was wondering whether this mutex_lock/unlock() is
> > > really needed, as you're copying an int.
> >
> > Thanks for your comments.
> >
> > Seems it is not necessary to add mutex here. I just follow the code as
> > other similar functions.  I will send a new version to update it.
>
> Let's not be smart about it. Next thing you know, someone will add
> another field in there that would absolutely require a mutex and now
> you're not race free anymore.
>
> Unless there's a real concern, the mutex must stay.
>

Ok, thanks for comments.  Then Patch v6 need to be dropped.

Is there any other comments for this Patch v5?
If no, can this series be accepted?

Best regards
Shengjiu Wang
