Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD869F6307
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 11:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372DD10E0C6;
	Wed, 18 Dec 2024 10:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pPGYu3lH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF9010E0C6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 10:31:45 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e3978c00a5aso4820108276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 02:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734517904; x=1735122704; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qMfFHi9iUvI3fYZPV8ieCyPXG3+qbCbEPdfQaN2gaCQ=;
 b=pPGYu3lHx3pvYVarbWHDCmpSfgv+urmvzUOOM0OWfdAUYKfSLzGrbaMXrYv9UY2Zkl
 nyxy4Ul7PAxMePSNLi700SC5T48DWEWkmABdyhBiJ3k4mXWzPF7MWkDqMYTx+yVigikV
 pZ0hyOmXRbSSpVAkqq/0aQa0cgcN+4r4BTb9htb55ypMOFDbmWwmFUeSwHjXwWSxD8qn
 HLAqlWCP4Zx2ZMyNRZTCKlbgbceFvH7HDiQTPh2l1dyUDWKNCQdw/AkGEKkg2xsPKh4v
 59GlK5JLckMOg3Ht/+pgXN5/moDcXeSaKItwL7tEXw3rfZ/wUoOVjSE6dadomI3ZrHh6
 X/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734517904; x=1735122704;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qMfFHi9iUvI3fYZPV8ieCyPXG3+qbCbEPdfQaN2gaCQ=;
 b=kMtSaqpCLrFlwSxp1PLpM2OwbjXiEQykKC+OKu8vvw3MKvp4DqT/DWOXkS0twenqkf
 8WYKTKZ5NmdYlsXSqdGpTBAqkd5HqnBkHTdJwISFPBF/tgyzGfUK8DmcaLimaeSzhBIH
 WoDGhVXXlZzmrcM5lcK2rdG9zQRrM3lYEjgkirmeK7gT1Ms+eEbZK13KQo8+N0OUvcUb
 3iluBCdke5N1JAW2eZ+zyLzCZnn94+ihRXaygcbI18mptYblyesG6NplDx8vo/0DFC8u
 o+5DzssqFsSoFC/F4dUPxAg2CNxLO4mD3TxauAu2h990kjYyiK+ROXDRWd5/BArfWEob
 y41w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm7VyzS2joAtk0sxMlkDh8jP4hmJEHVTl6KJwLjg6Q3xy5yfRt9CsWc3Cu7PiumrRo5I8bEkyE/+Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsXf1W+vCUwouxXsZC9rr687SDOtM+MGtBhdiZwPUuPp54lNfY
 yCJrgAuOyKg+xG2vgf/hUYj3Lcpe1Gd7PXcBrJbcKT6PEet9TqeRKbfUL0+hyeqj3ycWv5WWrb3
 yY+g8croyZkS2FZgT67rf9/qLgd//yVk3HdfZZQ==
X-Gm-Gg: ASbGncsi8qgp9fNcBXdLoqkmYtvwF0JfCn333tXOxOuBIEpYpCi5uF7dlgp3GrDJU4V
 2KvNemZtyFUQD6/z4tWYLcsM9f8TOmxfhpga/wfpSCxM10tlmwhoCJJdP8u2UdCFyXpFT
X-Google-Smtp-Source: AGHT+IGfFl1RIasXpu12ivuU1mC0yeqYtSj2AtFWFAh5J+OARjZFLWHImn0nqxjc03d2f2n3Lf/YzwBWKaweCwVl9k0=
X-Received: by 2002:a05:6902:248a:b0:e4a:fc25:30ca with SMTP id
 3f1490d57ef6-e5362152d54mr2253127276.24.1734517904161; Wed, 18 Dec 2024
 02:31:44 -0800 (PST)
MIME-Version: 1.0
References: <20241212055110.1862487-1-xji@analogixsemi.com>
 <vkrl7om7hepboovp2uivcnernia3ygqwrj3y3kkjydeclwvrk5@7tkdc4etkcjs>
 <BY5PR04MB673977C1DB1E774CB261C119C7382@BY5PR04MB6739.namprd04.prod.outlook.com>
 <4q2jncpnmeu7ytuyuv5pjzurh3ai5663jmu2we6cebuad2r3r5@tfb6hf6unioc>
 <BY5PR04MB673902E047FF8ADAFD8B94B3C7382@BY5PR04MB6739.namprd04.prod.outlook.com>
 <CAA8EJprGjuGFjZnXUxiMZMV=FO9O9CYt06H_nSL82fEOvPytyA@mail.gmail.com>
 <BY5PR04MB6739C5804F0E9764EFD3A3EBC73B2@BY5PR04MB6739.namprd04.prod.outlook.com>
 <fyltwqxyrmy3rz75nosc4wn6z5zglwv7pelzdf5g6ztloq4ncj@yigwmszuhigb>
 <CAEXTbpf3Bipid7bgnYzGJ6C6d+pgPcA2mjwFijSBwz_6Ub4aaw@mail.gmail.com>
 <BY5PR04MB6739B4BEAEFD0292C1AC9E3FC7042@BY5PR04MB6739.namprd04.prod.outlook.com>
 <6xyyujq7pizt6a2ztjfuapz7pphz33lxgvsjextlrhnefkjaq2@lhpy4bo4wajd>
 <BY5PR04MB6739408D8BC132EFA09BC2EDC7052@BY5PR04MB6739.namprd04.prod.outlook.com>
In-Reply-To: <BY5PR04MB6739408D8BC132EFA09BC2EDC7052@BY5PR04MB6739.namprd04.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 18 Dec 2024 12:31:37 +0200
Message-ID: <CAA8EJpqPhZF7Urbc7LPFJehBLWdWQX5Bk=y0iTw7Nz-J4qQdRg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge:anx7625: Update HDCP status at
 atomic_enable()
To: Xin Ji <xji@analogixsemi.com>
Cc: Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Bernie Liang <bliang@analogixsemi.com>, Qilin Wen <qwen@analogixsemi.com>, 
 "treapking@google.com" <treapking@google.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Wed, 18 Dec 2024 at 10:46, Xin Ji <xji@analogixsemi.com> wrote:
>
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: Tuesday, December 17, 2024 8:30 PM
> > To: Xin Ji <xji@analogixsemi.com>
> > Cc: Pin-yen Lin <treapking@chromium.org>; Andrzej Hajda
> > <andrzej.hajda@intel.com>; Neil Armstrong <neil.armstrong@linaro.org>;
> > Robert Foss <rfoss@kernel.org>; Laurent Pinchart
> > <Laurent.pinchart@ideasonboard.com>; Jonas Karlman <jonas@kwiboo.se>;
> > Jernej Skrabec <jernej.skrabec@gmail.com>; Maarten Lankhorst
> > <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>=
;
> > Thomas Zimmermann <tzimmermann@suse.de>; David Airlie
> > <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Bernie Liang
> > <bliang@analogixsemi.com>; Qilin Wen <qwen@analogixsemi.com>;
> > treapking@google.com; dri-devel@lists.freedesktop.org; linux-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH v3] drm/bridge:anx7625: Update HDCP status at
> > atomic_enable()
> >
> >
> > On Tue, Dec 17, 2024 at 01:50:00AM +0000, Xin Ji wrote:
> > > > -----Original Message-----
> > > > From: Pin-yen Lin <treapking@chromium.org>
> > > > Sent: Monday, December 16, 2024 8:05 PM
> > > > To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > Cc: Xin Ji <xji@analogixsemi.com>; Andrzej Hajda
> > > > <andrzej.hajda@intel.com>; Neil Armstrong
> > > > <neil.armstrong@linaro.org>; Robert Foss <rfoss@kernel.org>; Lauren=
t
> > > > Pinchart <Laurent.pinchart@ideasonboard.com>; Jonas Karlman
> > > > <jonas@kwiboo.se>; Jernej Skrabec <jernej.skrabec@gmail.com>;
> > > > Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripar=
d
> > > > <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>;
> > David
> > > > Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Bernie
> > > > Liang <bliang@analogixsemi.com>; Qilin Wen <qwen@analogixsemi.com>;
> > > > treapking@google.com; dri-devel@lists.freedesktop.org; linux-
> > > > kernel@vger.kernel.org
> > > > Subject: Re: [PATCH v3] drm/bridge:anx7625: Update HDCP status at
> > > > atomic_enable()
> > > >
> > > >
> > > > Hi Dmitry,
> > > >
> > > > On Mon, Dec 16, 2024 at 7:59=E2=80=AFPM Dmitry Baryshkov
> > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > >
> > > > > On Mon, Dec 16, 2024 at 08:33:23AM +0000, Xin Ji wrote:
> > > > > > > -----Original Message-----
> > > > > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > > Sent: Friday, December 13, 2024 9:17 PM
> > > > > > > To: Xin Ji <xji@analogixsemi.com>
> > > > > > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>; Neil Armstrong
> > > > > > > <neil.armstrong@linaro.org>; Robert Foss <rfoss@kernel.org>;
> > > > > > > Laurent Pinchart <Laurent.pinchart@ideasonboard.com>; Jonas
> > > > > > > Karlman <jonas@kwiboo.se>; Jernej Skrabec
> > > > > > > <jernej.skrabec@gmail.com>; Maarten Lankhorst
> > > > > > > <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> > > > > > > <mripard@kernel.org>; Thomas Zimmermann
> > <tzimmermann@suse.de>;
> > > > > > > David Airlie <airlied@gmail.com>; Simona Vetter
> > > > > > > <simona@ffwll.ch>; Bernie Liang <bliang@analogixsemi.com>;
> > > > > > > Qilin Wen <qwen@analogixsemi.com>; treapking@google.com;
> > > > > > > dri-devel@lists.freedesktop.org; linux- kernel@vger.kernel.or=
g
> > > > > > > Subject: Re: [PATCH v3] drm/bridge:anx7625: Update HDCP statu=
s
> > > > > > > at
> > > > > > > atomic_enable()
> > > > > > >
> > > > > > > CAUTION: This email originated from outside of the organizati=
on.
> > > > > > > Please do not click links or open attachments unless you
> > > > > > > recognize the sender, and know the content is safe.
> > > > > > >
> > > > > > >
> > > > > > > On Fri, 13 Dec 2024 at 13:00, Xin Ji <xji@analogixsemi.com> w=
rote:
> > > > > > > >
> > > > > > > > Hi Dmitry, sorry, I didn't clear describe the reason.
> > > > > > >
> > > > > > > Please. Do not top-post. Please paste your answer under the
> > > > > > > question, not somewhere at the top of the email. This allows
> > > > > > > us to have a more constructive dialog. Additional bonus if yo=
u
> > > > > > > can fix your email client to insert sensible quoting
> > > > > > > information instead of dumping
> > > > the headers of the original email.
> > > > > > Hi Dmitry, OK, sorry about it. Currently, we have problem to
> > > > > > fetch email from Microsoft on Ubuntu. I'll try to fix it later.
> > > > > > >
> > > > > > > >
> > > > > > > > Anx7625 implement DSI to DP convert behind USB Type-C port,
> > > > > > > > when user plug into USB Type-C Dongle with DP monitor, the
> > > > > > > > user space will enable HDCP feature, then kernel do HDCP an=
d
> > > > > > > > output display and set HDCP content to ENABLE, but the issu=
e
> > > > > > > > happened if user manually change the
> > > > > > > monitor's resolution later.
> > > > > > > >
> > > > > > > > Each time user change the resolution, kernel will call
> > > > > > > > bridge interface .atomic_disable() and .atomic_enable(), th=
e
> > > > > > > > old driver will keep HDCP state to ENABLE, this is a BUG,
> > > > > > > > when user change the resolution, kernel must change HDCP
> > > > > > > > content too (mustn't keep to ENABLE),
> > > > > > >
> > > > > > > Why? Could you please point me to the corresponding
> > > > > > > documentation or a code path in the other driver? Preferably =
i915,
> > AMD or Nouveau.
> > > > > > As
> > > > https://elixir.bootlin.com/linux/v6.12.5/source/drivers/gpu/drm/drm=
_
> > > > connecto
> > > > r.c#L1423:
> > > > > >         - ENABLED -> DESIRED (termination of authentication) As
> > > > > > there is no other interface to tell anx7625 bridge driver, so
> > > > > > the I think best place to handle ENABLE -> DESIRED in .atomic_d=
isable().
> > > > >
> > > > > I was looking for something like
> > > > > cdns_mhdp_connector_atomic_check(),
> > > > > which switches to UNDESIRED if there is no new CRTC. Likewise i91=
5
> > > > > driver performs this in intel_hdcp_atomic_check() if there is a
> > > > > need for modeset.
> > > Hi Dmitry, the bridge driver is different with i915, anx7625 bridge
> > > driver only implement some passive callback interface. There is no
> > > HDCP status checking while do resolution switch.
> >
> > Does that mean that you _have_ to reestablish HDCP after mode switching=
 in
> > order for it to work?
> Hi Dmitry, anx7625 bridge IC will be power down after call .atomic_disabl=
e(),
> and all HDCP status will be lost on chip. So, we should reestablish HDCP =
again
> in .atomic_enable().

Finally! This phrase should be in the commit message.

> >
> > > >
> > > > I believe you mean "DESIRED" here.
> > > > >
> > > > > For the "termination of authentication" case see
> > > > > cdns_mhdp_hdcp_check_link(), which detects if the HDCP got
> > > > > disabled by HW and then updates the status accordingly.
> > > > >
> > > > > >
> > > > > > >
> > > > > > > > as DRM doc said, kernel cannot change from ENABLE to
> > > > > > > > UNDESIRE, so next patch, I'll change it to DESIRE in .atomi=
c_disable().
> > > > >
> > > > > This e.g. will result in HDCP being restarted for all modesets. I=
s
> > > > > this an expected behaviour?
> > > >
> > > > The bridge could be powered off between .atomic_disable() and
> > > > .atomic_enable(), though I'm not sure if this would be a concern fo=
r
> > > > anx7625. I'll let Xin to comment on this.
> > > The flow of resolution switch is:
> > >     -> .atomic_disable().
> > >         -> .atomic_enable().
> > >             -> HDCP status check and enable.
> > > As resolution switch is triggered by user space, at this moment, the
> > > HDCP works fine(cannot get disabled event from HW).
> > > So, I think, .atomic_disable() is
> > > the best place to do termination of authentication (turn HDCP status =
to
> > DESIRED).
> > > This is the only entrance which can do termination of authentication,
> > > I cannot find others.
> >
> > I'm probably still missing a reference to the standard (please excuse m=
e, I don't
> > know it by heart). Is it a standard requirement to reauthenticate on th=
e mode
> > switch?
> I'm not sure, but anx7625 have power cycle on the mode switch. All HDCP s=
tatus
> Will be lost.
> >
> > BTW, while reading the anx7625 code, I noticed that there is a possible=
 race
> > between .atomic_enable() / .atomic_disable() which set
> > ctx->connector and the hdcp_check_work_func() which reads ctx->connecto=
r
> > without any protection.
> OK, I'll upstream another patch.
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry
