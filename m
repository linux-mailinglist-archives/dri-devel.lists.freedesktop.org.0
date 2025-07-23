Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D22B0F7CE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 18:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE28C10E813;
	Wed, 23 Jul 2025 16:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mPxdatdv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BC010E813
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 16:09:26 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id
 ada2fe7eead31-4ecd5e83bf5so10397137.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 09:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753286966; x=1753891766; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jiqvICJjX31b+xDIjisgqgN7QHL9poDjF7NeTkSy/Yw=;
 b=mPxdatdvuzwtPUS28IoVbcI4X6wJ0JdBPFSnYgnu0/1nsqtCzb9tZ0hTJ9HmI0hkO+
 NJpTkMbgTElvY1BByAHM+mXvUyiQtBkdb7v8AOojOGovyS8Md2MYG0H4NxbERuVzDmIZ
 fJppnNfd2Z+uwNJv57D/Le9h01KvcVXz6T1y3RwueqzFkhj4ouSP2kO//KyvJJXckmb4
 E0uQl8MkCrU2bZ06UUFb7W+YJMFDsivSISkgNJsLrBeYtzSncW7I78mP73ZRFngHpa5w
 17iS8NWtYe6OkxAJ9bZcVsVtkvXpIrWYr7AdD5QPdRxj6dmPVlSZJlkOpjr5ItS1UgGg
 d2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753286966; x=1753891766;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jiqvICJjX31b+xDIjisgqgN7QHL9poDjF7NeTkSy/Yw=;
 b=SEENvwhwiORQuQZg5bs4vPwmth6VP9dgK/S5TYSUAluOJR9Mf+VEMHXGldckR5CqoK
 IgVysb57K5FXqlzf8vf9nvFhTPHH17xcOhfv797O/RULoxCwElU5PjCcb1dQAxolv9pd
 KNQbeMqU6v4APH/j3y1VIhPOirwK224129WeXTFY/KuVyl3sct46ZcRN0xaW59/C7s20
 m9Nh1Kj7K8s2QpJsijrPVM8yZbtUsQnEK7uHWfMF2MHV4ae9pay9e15Vf7UZKBg72ruP
 ubpibrkppODjl1eVgPi3f6C7d3X2P3GieOHDW+Lr2+JGWr97c3OrYrLEk2z+t1tDZ2zS
 9ozA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6oy1UZy0h8Mv9WlWwzwTN4fLQT3gAIxP2zk7uqnmEsWNlv4hv4JuteluUcOpB9ciI+C0h+1ch65A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9hEXY6IwXT3+DZ/X0/ZNPYgvGOl05UCM1tCOYAWCr7Wg3Sk7i
 owERLdz1HacdpfjWrxT8e4XxoFjmqsm3t2Cz50ZeYrFz6ICVHHsv+oLf+LVxqa3zE5ThKWIjQ0N
 sWKu7PJyX6YIElpS4YNhQjAo2j22zAw==
X-Gm-Gg: ASbGncuVLL2b2jbRfCk9KS8t1Mb3sF885MzO4aQLtVmznufivXpesCrPRSASCaVzBdV
 G3PMHk43kt3W44UJpOb+OQ/64NQwtZOxZiSQMyMr6TlApVC1KCHatZDPR4pWDJP32+0Qhlo/EgG
 UO0CvZGbxhbuUaBBbtzo4y+Nhv8OjXIVUxEBz33MqaBPphsmvzPRahYBSd+bCArjUx79UFMREP3
 9PFwg==
X-Google-Smtp-Source: AGHT+IHLoLIi9Sn5t7UcwQDFfNGKZYmYTYj7fcHTonbPWflJFuRM2pCYd005+IusGSZWW9aDNPoyaalzfB6mYcmmYqg=
X-Received: by 2002:a05:6122:d0e:b0:537:3398:e3dc with SMTP id
 71dfb90a1353d-537af65b97emr575987e0c.2.1753286965800; Wed, 23 Jul 2025
 09:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250722204114.3340516-1-chenyuan0y@gmail.com>
 <20250723-gigantic-wrasse-of-warranty-dc70d7@houat>
In-Reply-To: <20250723-gigantic-wrasse-of-warranty-dc70d7@houat>
From: Chenyuan Yang <chenyuan0y@gmail.com>
Date: Wed, 23 Jul 2025 09:09:14 -0700
X-Gm-Features: Ac12FXym4TiBdgoqhdHCo4mS7HgWJgQ8vXuIRZKZN-9W5bm3rxYkRm6h2V9wc34
Message-ID: <CALGdzurMksSELQMDxy11gHS=pfASP6x_d+Sw2uZfXguLqb=J9A@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: Add null pointer check for ITE IT6263
To: Maxime Ripard <mripard@kernel.org>
Cc: victor.liu@nxp.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 rfoss@kernel.org, laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, 
 biju.das.jz@bp.renesas.com, dri-devel@lists.freedesktop.org, 
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

Apologies for the second email.
I am resending this message as the formatting in the previous version
was incorrect

On Tue, Jul 22, 2025 at 11:57=E2=80=AFPM Maxime Ripard <mripard@kernel.org>=
 wrote:
>
> On Tue, Jul 22, 2025 at 03:41:14PM -0500, Chenyuan Yang wrote:
> > drm_atomic_get_new_connector_for_encoder and
> > drm_atomic_get_new_connector_state could return Null.
>
> They can, but not in that scenario. atomic_enable will never be called
> if either would return NULL.
>
> In which situation did you trigger this bug?

This is found by our static analysis tool based on the fact that
drm_atomic_get_new_connector_state() could return NULL.
We also noticed that under the same dir, the ITE IT6505 transmitter
has such checks.
Thus, we assume it would be good to have similar checks here.

> > Thus, add the null pointer check for them with a similar format with
> > it6505_bridge_atomic_enable in ITE IT6505.
> >
> > Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> > Fixes: 049723628716 ("drm/bridge: Add ITE IT6263 LVDS to HDMI converter=
")
> > ---
> >  drivers/gpu/drm/bridge/ite-it6263.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/brid=
ge/ite-it6263.c
> > index a3a63a977b0a..3a20b2088bf9 100644
> > --- a/drivers/gpu/drm/bridge/ite-it6263.c
> > +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> > @@ -590,15 +590,28 @@ static void it6263_bridge_atomic_enable(struct dr=
m_bridge *bridge,
> >       struct drm_connector *connector;
> >       bool is_stable =3D false;
> >       struct drm_crtc *crtc;
> > +     struct drm_connector_state *conn_state;
> >       unsigned int val;
> >       bool pclk_high;
> >       int i, ret;
> >
> >       connector =3D drm_atomic_get_new_connector_for_encoder(state,
> >                                                            bridge->enco=
der);
> > -     crtc =3D drm_atomic_get_new_connector_state(state, connector)->cr=
tc;
> > +     if (WARN_ON(!connector))
> > +             return;
> > +
> > +     conn_state =3D drm_atomic_get_new_connector_state(state, connecto=
r);
> > +     if (WARN_ON(!conn_state))
> > +             return;
> > +
> > +     crtc =3D conn_state->crtc;
> >       crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> > +     if (WARN_ON(!crtc_state))
> > +             return;
> > +
> >       mode =3D &crtc_state->adjusted_mode;
> > +     if (WARN_ON(!mode))
> > +             return;
>
> And that condition can never be true.
>
> Maxime
