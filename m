Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6123A42183
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C1510E425;
	Mon, 24 Feb 2025 13:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="noNQ9MKC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3527310E07A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 07:24:10 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-38f325dd9e6so2076197f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 23:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740381848; x=1740986648; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WttiCaJQvwomhQd1EI/0udfL207Jhy9knOnlIAkEOdg=;
 b=noNQ9MKCX6+MYdsMieofKz95RK3T6itKpxnHmsX45bAYdwlctaqvJq+uFXp/i3flZ5
 7QRPV0SW8jCDP3PBUbPsKslJ+IDh8B0j3AmEHaOUE4a0cYUfq1KsbAY4CnUrxglJSjL9
 kY4mnGMZffgSBA3A31N11RvsBPp78tnF7u/ZFoXUjzoBGf/mjBZro6CuXE7eh5S+aXKm
 SH/15rpKLe7l+r410JYFctYU9CBOxTZejBwTSG5J8F1GETku2OmE05H+St5ifatA7KnB
 rgsyMq2PfDOPS/qHBU7QGyMGC+rOG/6xlB6Rr6+vClmjYT4Uex0JJnHZWu6omJsDpk92
 rHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740381848; x=1740986648;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WttiCaJQvwomhQd1EI/0udfL207Jhy9knOnlIAkEOdg=;
 b=ZDJuVucrcgav15Wd3Rfkqg3Q1b5mW2HQW+03+fv1B/9HfoblufV6svzCTUWCr555pq
 F7wspzE/WQN0xiPl0cpJxLEYxJJdGzpv2nIoiQhnC3VEdduI8yE2dLUdzHzoD2UPcXub
 DZOjHGbhbk8fR/RZe4fcSYLJgDPGL6Mj/EIRU1gYbpy4UTVZVXZKLHmW+yVf7OEyo+EF
 noFlgZhq2xIt5bKcT1PZPaoWzOvORKxuAGKnUgSwoY9ORWfChvMMr8nmOOU1nU7ztvoE
 +WzKsjHwK8Oq1/B8eM6kUVhY0ZcruyGPZQRHauiEY+qcLPYN+2Xu7DsFpDpwIb6qt+B3
 oaAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNNAbn7UyfY1vFUDArCnWMTe85Lwdh8/Gcman4uZutrl9wnywK5nw1tkv4KGoi4iC/6TwZWO1Jpec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxtbgd6nb0gPFICDCQmZW54SIkkXIbRKCmmYNfsiKXND/57CTp0
 U1NcZhc4SYLGS1PSHldAaBhyfp6VPo/oSCN2fD72V//LckMcJOB/+FizwP1ISRm5eQwn2di3/0m
 EubYt1WwYh1Bo+7e0lcJxAbYRvps=
X-Gm-Gg: ASbGncuCtVTDX7EmbG68QAGNmU1nxxE5E6t4kAwgCJLvPERgVZDk90BvZGp31DC1DU5
 /kGVG8Ka1yFUy4muxWgmMc0Dqo7LccQGUkiDGK3vE/ULOVcydFjdG8ml/49yT8i/qCcLRY/6P1y
 reOC42slFv
X-Google-Smtp-Source: AGHT+IHmuylp5CwLVA1IYwFWOeYvtiMnpzSvI/RJzNxXxIyoWRaTdnpaf8jYgz8j+JBsOyYGE4ztNWyFe7oWQUCwews=
X-Received: by 2002:a05:6000:4014:b0:38f:452f:9fa9 with SMTP id
 ffacd0b85a97d-38f7d1ff2b0mr4710935f8f.2.1740381848433; Sun, 23 Feb 2025
 23:24:08 -0800 (PST)
MIME-Version: 1.0
References: <20250223153244.149102-1-clamor95@gmail.com>
 <20250223153244.149102-3-clamor95@gmail.com>
 <hz6amgqdmvr6tow5k3gj6n2bnaayejrdv6yhj6sjzs7v3dbjbv@3dcm45ydkkd3>
In-Reply-To: <hz6amgqdmvr6tow5k3gj6n2bnaayejrdv6yhj6sjzs7v3dbjbv@3dcm45ydkkd3>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 24 Feb 2025 09:23:57 +0200
X-Gm-Features: AWEUYZktBbGH02zZg4r3HvOntXY1RXWZ2G2bHw8JfAZ9BZfYMA_8iSUtK4-0qsU
Message-ID: <CAPVz0n0w6fNCkWzAD5qGUeeF3nEY-irvSQPxoB+AOvvKtx4XEQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm: bridge: Add support for Solomon SSD2825
 RGB/DSI bridge
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

=D0=BF=D0=BD, 24 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 04:10 Dmit=
ry Baryshkov <dmitry.baryshkov@linaro.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Feb 23, 2025 at 05:32:44PM +0200, Svyatoslav Ryhel wrote:
> > SSD2825 is a cost-effective MIPI Bridge Chip solution targeting mainly
> > smartphones. It can convert 24bit RGB interface into 4-lane MIPI-DSI
> > interface to drive display modules of up to 800 x 1366, while supportin=
g
> > AMOLED, a-si LCD or LTPS panel technologies for smartphone applications=
.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/bridge/Kconfig   |  13 +
> >  drivers/gpu/drm/bridge/Makefile  |   1 +
> >  drivers/gpu/drm/bridge/ssd2825.c | 821 +++++++++++++++++++++++++++++++
> >  3 files changed, 835 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/ssd2825.c
> >
>
> > +
> > +     if (buf =3D=3D MIPI_DCS_SET_DISPLAY_ON) {
> > +             /*
> > +              * NOTE! This is here since it cannot be called in bridge=
 enable because
> > +              * bridge pre enable and bridge enable have no gap in bet=
ween.
> > +              *
> > +              * Existing framework bridge-panel seq is:
> > +              *      panel_prepare > bridge_pre_enable > bridge_enable=
 > panel_enable
> > +              *
> > +              * Using prepare_prev_first was tested, but it switches s=
eq like this:
> > +              *      bridge_pre_enable > panel_prepare > bridge_enable=
 > panel_enable
> > +              *
> > +              * This will not work since panel hw MUST be prepared bef=
ore bridge is
> > +              * configured. Correct seq should be:
> > +              *      panel_prepare > bridge_pre_enable > panel_enable =
> bridge_enable
> > +              *
> > +              * Last two functions are swapped related to existing fra=
mework. I am not
> > +              * aware about method which allows that.
> > +              *
> > +              * Once there will be such method/flag, code below should=
 be moved into
> > +              * bridge_enable since it is basically a bridge configura=
tion completing
> > +              * after initial panel DSI sequence is completed.
>
> Will bridge_pre_enable -> panel_prepare (including
> MIPI_DCS_SET_DISPLAY_ON) -> bridge_enable work?
>
> The rest looks good to me.
>

I wish. I have tested that configuration already and panel did not
work. Problem here is that panel must be enabled before bridge.
Correct sequence should be:

Panel is enabled (power seq, reset, etc.) > bridge is enabled (power
seq, reset, initial configuration) > panel sends init DSI seq > bridge
completes setup with code below.

Basically this part of transfer should be called after last DSI
command is sent, but ATM I see no valid solution to this issue apart
this quirk (keep in mind that panel must be enabled before bridge so
drm_panel.prepare_prev_first will not work).

The most appropriate solution would be addition of atomic_post_enable
call just after panel or next bridge enable, this would ensure that
cases with bridge like I have could be properly configured. Though, I
really do not want to touch framework, since it never ended up well.
Or, alternatively, a flag for a bridge which can swap bridge enable
and panel enable, like drm_panel.prepare_prev_first does for
pre_enable and prepare.


> > +              */
> > +             config =3D SSD2825_CONF_REG_HS | SSD2825_CONF_REG_DCS |
> > +                      SSD2825_CONF_REG_ECD | SSD2825_CONF_REG_EOT;
> > +
> > +             if (dsi_dev->mode_flags & MIPI_DSI_MODE_VIDEO)
> > +                     config |=3D SSD2825_CONF_REG_VEN;
> > +
> > +             if (dsi_dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
> > +                     config &=3D ~SSD2825_CONF_REG_EOT;
> > +
> > +             /* Complete configuration after DSI commands were sent */
> > +             ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, config=
);
> > +             ssd2825_write_reg(priv, SSD2825_PLL_CTRL_REG, 0x0001);
> > +             ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0x0000);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >
>
> --
> With best wishes
> Dmitry
