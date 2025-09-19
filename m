Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9C2B87D35
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 05:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D63310E033;
	Fri, 19 Sep 2025 03:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BG3nSpVQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8C410E033
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 03:43:31 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-330631e534eso1419550a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 20:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758253411; x=1758858211; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SKMYfdVwb74kV6i8GOAfD4K3WUGY3beOoq2S/aiwLCo=;
 b=BG3nSpVQoji08iHIM3832lDlRdXqe0ZgnR7Mt30p+w9Z5gP26jwGxVMOOPzgzk9R74
 /qL9RXuNhjrdHjA3x1CQYEFrKRKwlFf6zEIf+jF/Jc+SN94iIfdj3iiSv1tA5r9rB6aV
 FfHsRp4gbm2caOEzZbkRvK6fqYvc9+I/s9Bj9OrbIyTq1p8rHjt4x4PB/Mupx/z3DuM2
 m0KxyQ0wfOPTIpZDxuzONx+os3I23gZcWYnW+lTwTJGsE6aznctHm5gMcMq9ofeFYPl/
 G/gZq35FIrYYzRFs3uuOjEd1HZdTuL/Zq9txdTVajsWEOjwNOVZWIFiVNeMd+4gTd5eA
 n/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758253411; x=1758858211;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SKMYfdVwb74kV6i8GOAfD4K3WUGY3beOoq2S/aiwLCo=;
 b=qqn/mNWvuv+eucVpCUJfhr2ddwOMFEBoUMNOQXFigZf/xbkZjrq9MEJRtG1KcIrcPF
 ICpLh+/1oyH72cEg/bWHl/33pSGAt2UE7MppyijrLJ08eM44+JVrxJgSF8zInrFX7wdH
 nFo5/0EDBz9BQOPzLVTcEhDl56wp2rSbiKqbBEui3eranyVA97QXzi2+2b2R1QeJ5BfD
 GP+gAihXXAvASLQko5bLpQUL3orUddx/DWmYA20nLK6ZrmoEBycf4R91sMQ1yjOhhtZ6
 41vy79FNDtWiEVW48daOXPXvavUojPJwDSGtvuuOvu8e3QhA1xImiK2Z9GaZFn6KxAvl
 DyEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBodvSUeQHvO56LSFmLkN76KU3dlZvHgEhFGtcpYn94EPFOf2kHtKF7QGeiISQTX/l/JOnzmO1VHI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxb13NnRCcATZKv6CaEF9yVSUUyW7P3PSa/jl3bIbzhyQXksrtM
 OAkG47qTh+PzUD3adaZqBc5k5eh+cir7Sk8D6QqoadsOVjD+UjhBfGgUT/M+39FakSu181jgapX
 DCWuUzfj1s8b39hOGcZTknPsojoISSwg=
X-Gm-Gg: ASbGncuGq+HLlxEFumyNpxrqyDsqkEvc6Y0sfuxff3kMV7Mg+SQgFH1eGuPWlCeAFeG
 t9aWV3N+Bfg0/mNtIVtniBduI/rvHIezp6xT7zTO2s7h8lquko5WxYR+CF0xSjb0QZT4ZSkJyXy
 0r31qQlr2iEOFT4RCjbBBL4u7TB2FCYsIAgMJvXY+lyb8FKqjM8rTOAFO+XZLaAAqWOPERGE36R
 bdxICM=
X-Google-Smtp-Source: AGHT+IF3ku8gvZB1hxFYXtLnd7iwTR3jkeyD4oKxxo5kWDQcOyxdH6t3IjIvgH7PYtQujNBSFI44t24lqUYUtwzzka8=
X-Received: by 2002:a17:90b:52d0:b0:32e:d011:ea1c with SMTP id
 98e67ed59e1d1-33097ffd1b2mr2599824a91.15.1758253411070; Thu, 18 Sep 2025
 20:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
 <20250821073131.2550798-5-shengjiu.wang@nxp.com>
 <20250901185208.394cd162@booty>
 <CAA+D8AOCTqb5jLeRapYk4wRGZrsrPiuAR=ow3OA1B0+M9X4k7w@mail.gmail.com>
 <20250909-omniscient-honeybee-of-development-adca8a@houat>
 <CAA+D8AM=aRU-0QcgtxZ+=YBZ2+kMrP2uzSE3e+NJs3Z3zkrSVg@mail.gmail.com>
In-Reply-To: <CAA+D8AM=aRU-0QcgtxZ+=YBZ2+kMrP2uzSE3e+NJs3Z3zkrSVg@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 19 Sep 2025 11:43:05 +0800
X-Gm-Features: AS18NWDra1nGW4hE_RulzgXqUXLGFVIDrxwneg_8Sfyhy5B_85F5WDGUq5FPeS8
Message-ID: <CAA+D8AP8eJ8_pueq1ZSb-ORzTJbNT7HOwKFOO5ZCXqgqoQ1qGQ@mail.gmail.com>
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

Hi Luca

On Wed, Sep 10, 2025 at 6:29=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.=
com> wrote:
>
> Hi
>
> On Tue, Sep 9, 2025 at 2:39=E2=80=AFPM Maxime Ripard <mripard@kernel.org>=
 wrote:
> >
> > Hi,
> >
> > On Wed, Sep 03, 2025 at 06:41:05PM +0800, Shengjiu Wang wrote:
> > > On Tue, Sep 2, 2025 at 12:52=E2=80=AFAM Luca Ceresoli <luca.ceresoli@=
bootlin.com> wrote:
> > > >
> > > > Hello Shengjiu,
> > > >
> > > > On Thu, 21 Aug 2025 15:31:28 +0800
> > > > Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> > > >
> > > > > Add API dw_hdmi_set_sample_iec958() for IEC958 format because aud=
io device
> > > > > driver needs IEC958 information to configure this specific settin=
g.
> > > > >
> > > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > Acked-by: Liu Ying <victor.liu@nxp.com>
> > > >
> > > > [...]
> > > >
> > > > > +void dw_hdmi_set_sample_iec958(struct dw_hdmi *hdmi, unsigned in=
t iec958)
> > > > > +{
> > > > > +     mutex_lock(&hdmi->audio_mutex);
> > > > > +     hdmi->sample_iec958 =3D iec958;
> > > > > +     mutex_unlock(&hdmi->audio_mutex);
> > > > > +}
> > > >
> > > > Apologies for jumping in the discussion as late as in v5, but I not=
iced
> > > > this patch and I was wondering whether this mutex_lock/unlock() is
> > > > really needed, as you're copying an int.
> > >
> > > Thanks for your comments.
> > >
> > > Seems it is not necessary to add mutex here. I just follow the code a=
s
> > > other similar functions.  I will send a new version to update it.
> >
> > Let's not be smart about it. Next thing you know, someone will add
> > another field in there that would absolutely require a mutex and now
> > you're not race free anymore.
> >
> > Unless there's a real concern, the mutex must stay.
> >
>
> Ok, thanks for comments.  Then Patch v6 need to be dropped.
>
> Is there any other comments for this Patch v5?
> If no, can this series be accepted?
>

Can we have a conclusion that keeps the mutex as Maxime's comments?

Best regards
Shengjiu Wang
