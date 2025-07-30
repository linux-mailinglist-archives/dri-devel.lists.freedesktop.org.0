Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB485B167B0
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 22:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5480610E6DB;
	Wed, 30 Jul 2025 20:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QN3fNrx1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526E910E6DB
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 20:38:42 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4560add6cd2so1227215e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 13:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753907921; x=1754512721; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l8Afm5kY+OgAWjgm6x2CIfrrEQg5mJMOKBZYCANj5hg=;
 b=QN3fNrx1JbJAoSgctq4H8ogRVy938GNgzJ8CYB6nkbuCg3eBnSH6xWNLy94lh2ARJS
 U8mhWDwTKaQ0+GwFOgg9XTWYixcchXgpBGKpjmKu7uPlbhbfHs2MHHb9sGkgIGNKIrC/
 p6E2tVYLDLtxdgIZaQ959zHmf7osORwRfgK7S4QxxTNMWPwqsk0zCHqKR78GkNOrL/wQ
 /fQTW9Pnh2INU04m61UsjSBCoA0nuMkVzJKxObYt33JZnvi7sfNVD+WaBB25rdXkDUtH
 ia8a4q7WPdvHg4q4QT+NC6SZfjricHSQeFpSuROcF0WTuWxm88NaOtbqDP+7qCQni2c1
 totg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753907921; x=1754512721;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l8Afm5kY+OgAWjgm6x2CIfrrEQg5mJMOKBZYCANj5hg=;
 b=cq3g54zL0+GUX+KWKfpz5FHe2sLgo5JEH8xPnMc/Hs3Cw3wz6msVv3exoMvQ4Z85dx
 EMKzMfdcScsKQwJKAtZ8AKqVYic0pr0Kdt5J3j6ng0Rk64XsiSb4oA8T7bZnn4qoIJf4
 voP8nndKDDhGaU3JbgPqCqqT/Bupl5k1uAH1fnL2417iOee9Gw7jjbIUVRCT4gBDeZar
 REXFOw0sHzpToA1E9n8dXdsO3nRXdkk/ORw+Da9d8JJKlGL++2GTW250UavjQQfmNanz
 0o8aI5cQ593KosJXbkX7/pEiNjGAY+N7b3GTlfT/hD4caxyRRNuF2YGKH1ny3ZcuKptC
 79oQ==
X-Gm-Message-State: AOJu0YwJmy7HuFzfhNSfn+L4LPDz71RzB51efKn7dTKC7MQstNUopdS+
 VZ1SmKcCKli3iJ9wqaiXnp+kgCiPVm2liLjx56ntgjJZ5TPD6tkhX8oj7W2jFKh8oOOgIWmDFN+
 FENSMR4eyCeM6vh0qPwK17+azzocCgw==
X-Gm-Gg: ASbGncuZSA0gBRlr7D3iXXEK0FeizH5rr6Zs45WAEIiTE1x5lFwpzjXI8OmIAu/uHYE
 SwBDaX37PwQ7B8/xzn3y0XOAI6vB5vnX3PXVmnSaJZL37OqJwjYU7bT+c9A8HrS7BzPleJ2IUFq
 yaqLHGzwmvOpIJrtkUeWrdwXp8V9RC9dcKkg83kGUGBF5BK0hs2krMFTKIGjmzjHH/RpMG866ZC
 bvT6Fw=
X-Google-Smtp-Source: AGHT+IF71tNBC+tWZFByXJpnEJB/lxS/QinOOCOXcHd7IWr/NovKj6aZybOP+4ABU2G9GfQ69trGOH4ZFy9NYgrGbXo=
X-Received: by 2002:a05:600c:a103:b0:456:15be:d113 with SMTP id
 5b1f17b1804b1-45891b17431mr34509625e9.1.1753907920608; Wed, 30 Jul 2025
 13:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250727165846.38186-1-alex.vinarskis@gmail.com>
 <20250727165846.38186-4-alex.vinarskis@gmail.com>
 <CAD=FV=Xd_xL=PYvVNqQWFZGmqN+Q=SvvaBTfbv9k+fDb8QwUtQ@mail.gmail.com>
In-Reply-To: <CAD=FV=Xd_xL=PYvVNqQWFZGmqN+Q=SvvaBTfbv9k+fDb8QwUtQ@mail.gmail.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Wed, 30 Jul 2025 22:38:28 +0200
X-Gm-Features: Ac12FXwM4HeHJZZlcXMgpjN9-RQpaNQ_Bsz2F6A2gi95crriPvDr8wjeZ9Wk22E
Message-ID: <CAMcHhXp47zmpoNYLCVRWWBk4HcYepgWX=3kWWzW8c8+a=2kE6A@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] drm/panel-edp: Add BOE NV140WUM-N64
To: Doug Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
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

On Tue, 29 Jul 2025 at 17:50, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Sun, Jul 27, 2025 at 9:58=E2=80=AFAM Aleksandrs Vinarskis
> <alex.vinarskis@gmail.com> wrote:
> >
> > Timings taken from NV140WUM-N41. It is found in some arm64 laptops,
> > eg. Asus Zenbook A14 UX3407QA.
> >
> > The raw edid of the panel is:
> > 00 ff ff ff ff ff ff 00 09 e5 f6 0c 00 00 00 00
> > 10 22 01 04 a5 1e 13 78 07 8e 95 a6 52 4c 9d 26
> > 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> > 01 01 01 01 01 01 5d 30 80 a0 70 b0 28 40 30 20
> > 36 00 2e bc 10 00 00 1a 00 00 00 fd 00 28 3c 4a
> > 4a 0f 01 0a 20 20 20 20 20 20 00 00 00 fe 00 3d
> > 4c 33 30 20 20 20 20 20 20 20 20 ff 00 00 00 fc
> > 00 4e 56 31 34 30 57 55 4d 2d 4e 36 34 0a 01 f8
> >
> > 70 20 79 02 00 21 00 1d c8 0b 5d 07 80 07 b0 04
> > 88 66 ea 51 cc 74 9d 66 52 0f 02 35 54 40 5e 40
> > 5e 00 44 12 78 22 00 14 7f 5c 02 85 7f 07 9f 00
> > 2f 00 1f 00 af 04 27 00 02 00 05 00 2b 00 0c 27
> > 00 28 3b 00 00 27 00 28 2f 00 00 2e 00 06 00 44
> > 40 5e 40 5e 81 00 1e 72 1a 00 00 03 71 28 3c 00
> > 00 60 ff 60 ff 3c 00 00 00 00 e3 05 04 00 e6 06
> > 01 01 60 60 ff 00 00 00 00 00 00 00 00 00 de 90
> >
> > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/=
panel-edp.c
> > index 9a56e208cbdd..b334926e96ed 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -1947,6 +1947,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT1=
40FHM-N47"),
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c93, &delay_200_500_e200, "Un=
known"),
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT=
116WHM-N44"),
> > +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cf6, &delay_200_500_e50_p2e80=
, "NV140WUM-N64"),
>
> Since this is a "guess" timing without any datasheet, I'd be more
> comfortable picking the most conservative of the "cousin" timings. Can
> you re-send with "delay_200_500_e200" instead?

Sure.

Do I understand correctly that more conservative delay_200_500_e200
will for sure not make it worse, since its more conservative? In that
case can re-spin right away. Otherwise I would prefer to re-test it
first, may take a few days as I do not own the hardware so need to
propagate the change and get some feedback.

Thanks,
Alex

>
> -Doug
