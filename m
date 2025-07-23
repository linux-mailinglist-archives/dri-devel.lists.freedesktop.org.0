Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B302B0F78F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 17:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADF310E7F9;
	Wed, 23 Jul 2025 15:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bbbXgvZU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A1510E7FB
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 15:58:20 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id
 a1e0cc1a2514c-888d575cb64so64012241.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 08:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753286299; x=1753891099; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9p/UBhTFN1ybZMAaIUf09nitE5JwcpwgmN2jWget8ss=;
 b=bbbXgvZUSpTY9smL5WdWn5RliB5HYGA3r5hM0GyiIiDea1IEqGg6FnzIx3vKAPmkVV
 UUqlswx/sMAyHaLtNijCFpn+OKHn6H2a/z1fILGF8pNFJ8IPUiLLsIkMHoIAfSQzLYB9
 +k/6bt9U/7zf6HcBWtE+CeFZGNGKJfJEdfvxtQ3VWNqOMxNt6U2WBOddAt14D4f7O3++
 dcuex/Acen4/RUYDNkAIgW3ZEKvzLdmwe1XdlVbiVok5cWB/tmTMLrPx4HwLHfwq97Mn
 0Hfug7/8e9AMBckZjoQSBulOV7phRzJbB5JfwPOQMvLITumDeC2mZb5H8HWypv67z0t1
 JjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753286299; x=1753891099;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9p/UBhTFN1ybZMAaIUf09nitE5JwcpwgmN2jWget8ss=;
 b=SUxDMxNE6t1ZVP+mdGhN2jvFUcUCqtcvMD5k97xLNBlAeZGSRvR3iee2uQh6dPH6op
 yaYgHPSEC+CIsimdlXx3/uqV2EvzyudsRcMZwVqwtJ6Gi2DuZK2JAIga8gJORKUf0Mri
 IXEGDnsqZUlreOBoNMFwRr+alGW00zwMS7jhjE80IUboTlzC7K64SEka6NgHTZ2YJmu1
 G0CS3ev1akCd6HFuRE//137FNZtnDQMA/z/gcDY9Mfbvu6QskG517bFG02wGEvc1D7VN
 NFS6a7/xoeUu5DRkOxbiihbbATB9w3upoS2spsyNHXi7PLHVPhDOALb2KVru6aKW80R+
 tWaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHmik/lIBTPJz3FgN+E4oPjBw9PFMQuku8faFBX1t5klpoERfmEovAnnxTO2r4L32TYkPdhHYg6Go=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEEXg2z1K65v6KqgGUVxLvAnEYQ/vd1WUohb+l+E79VyAN0qCj
 uoZu3/WynPf2msuMQWnUK/wF3XY/mNhyENU2hINsio8r1S+0KDtx1VXzWqQ02dOxnQTQro8bBji
 ivXD5ldE5b4sdDXvzTtuKyeps/kAFyw==
X-Gm-Gg: ASbGncsfYu1425K9BA8P8N9EVs81S74D9MV3DhAhsow+bK7zcO2bbO6uyE0sAV5YoWC
 sm6lU6m97HTQbG1nPmbRHPplUKJY/Iz7mx4mkoq/EHTJlLqW/Fu1tMujKHSA7zFycJKa+GQ5dmk
 OAK8BGCS8SCK1zQiUUY3ovR1yIgUf0fAeZQAnIowES91nopvIRNWYsCKVp4742SNJbOCDhgsaC7
 wc5sljlo2mYU4TvGIha9sW0QyUhpUVfGvIsF3h0
X-Google-Smtp-Source: AGHT+IEkjxd0m/zhlC4ZnfLYdT0ducGCRfhwTDZXM+3uaEwz1+kgtPDk/fk5srjuJPOGaCt6mYTu9FV35LzKIor/6xo=
X-Received: by 2002:a05:6102:2b95:b0:4cd:43d2:1b05 with SMTP id
 ada2fe7eead31-4fa152c4873mr609753137.8.1753286299374; Wed, 23 Jul 2025
 08:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250722204114.3340516-1-chenyuan0y@gmail.com>
 <20250723-gigantic-wrasse-of-warranty-dc70d7@houat>
In-Reply-To: <20250723-gigantic-wrasse-of-warranty-dc70d7@houat>
From: Chenyuan Yang <chenyuan0y@gmail.com>
Date: Wed, 23 Jul 2025 08:58:07 -0700
X-Gm-Features: Ac12FXyFBnyJS7i6qAUtDTkRAZ2UuJbgRYhO6627x_xdrklKBCINjWCHGEn28js
Message-ID: <CALGdzuoprX2Q=vwOENrmAbPbJb+XeBjQqG90YEOApSbW9uKeZg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: Add null pointer check for ITE IT6263
To: Maxime Ripard <mripard@kernel.org>
Cc: airlied@gmail.com, andrzej.hajda@intel.com, biju.das.jz@bp.renesas.com, 
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
 laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
 lumag@kernel.org, maarten.lankhorst@linux.intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch, 
 tzimmermann@suse.de, victor.liu@nxp.com
Content-Type: multipart/alternative; boundary="000000000000105aaf063a9ac789"
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

--000000000000105aaf063a9ac789
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 22, 2025 at 23:57 Maxime Ripard <mripard@kernel.org> wrote:

> On Tue, Jul 22, 2025 at 03:41:14PM -0500, Chenyuan Yang wrote:
> > drm_atomic_get_new_connector_for_encoder and
> > drm_atomic_get_new_connector_state could return Null.
>
> They can, but not in that scenario. atomic_enable will never be called
> if either would return NULL.
>
> In which situation did you trigger this bug?


This is found by our static analysis tool based on the fact that
drm_atomic_get_new_connector_state() could return NULL. We also noticed
that under the same dir, ITE IT6505 transmitter has such checks. Thus, we
assume it would be good to have similar checks here.


> > Thus, add the null pointer check for them with a similar format with
> > it6505_bridge_atomic_enable in ITE IT6505.
> >
> > Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> > Fixes: 049723628716 ("drm/bridge: Add ITE IT6263 LVDS to HDMI converter")
> > ---
> >  drivers/gpu/drm/bridge/ite-it6263.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ite-it6263.c
> b/drivers/gpu/drm/bridge/ite-it6263.c
> > index a3a63a977b0a..3a20b2088bf9 100644
> > --- a/drivers/gpu/drm/bridge/ite-it6263.c
> > +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> > @@ -590,15 +590,28 @@ static void it6263_bridge_atomic_enable(struct
> drm_bridge *bridge,
> >       struct drm_connector *connector;
> >       bool is_stable = false;
> >       struct drm_crtc *crtc;
> > +     struct drm_connector_state *conn_state;
> >       unsigned int val;
> >       bool pclk_high;
> >       int i, ret;
> >
> >       connector = drm_atomic_get_new_connector_for_encoder(state,
> >
> bridge->encoder);
> > -     crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
> > +     if (WARN_ON(!connector))
> > +             return;
> > +
> > +     conn_state = drm_atomic_get_new_connector_state(state, connector);
> > +     if (WARN_ON(!conn_state))
> > +             return;
> > +
> > +     crtc = conn_state->crtc;
> >       crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> > +     if (WARN_ON(!crtc_state))
> > +             return;
> > +
> >       mode = &crtc_state->adjusted_mode;
> > +     if (WARN_ON(!mode))
> > +             return;
>
> And that condition can never be true.
>
> Maxime
>

--000000000000105aaf063a9ac789
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, Jul 22, 2025 at 23:57 Maxime Ripard &lt;<a href=
=3D"mailto:mripard@kernel.org" target=3D"_blank">mripard@kernel.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bo=
rder-left-color:rgb(204,204,204)">On Tue, Jul 22, 2025 at 03:41:14PM -0500,=
 Chenyuan Yang wrote:<br>
&gt; drm_atomic_get_new_connector_for_encoder and<br>
&gt; drm_atomic_get_new_connector_state could return Null.<br>
<br>
They can, but not in that scenario. atomic_enable will never be called<br>
if either would return NULL.<br>
<br>
In which situation did you trigger this bug?</blockquote><div dir=3D"auto">=
<br></div><div dir=3D"auto">This is found by our static analysis tool based=
 on the fact that=C2=A0<div dir=3D"auto"><span style=3D"font-size:17px;font=
-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;text-decoration:none;float:none;display:inline!important;co=
lor:rgb(0,0,0)">drm_atomic_get_new_connector_</span><span style=3D"font-siz=
e:17px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;text-decoration:none;float:none;display:inline!i=
mportant;color:rgb(0,0,0)">state() could return NULL. We also noticed that =
under the same dir,=C2=A0</span><span style=3D"color:rgb(0,0,0)">ITE IT6505=
 transmitter has such checks. Thus, we assume it would be good to have simi=
lar checks here.</span></div></div><div dir=3D"auto"><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1=
px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,2=
04)" dir=3D"auto"><br>
&gt; Thus, add the null pointer check for them with a similar format with<b=
r>
&gt; it6505_bridge_atomic_enable in ITE IT6505.<br>
&gt; <br>
&gt; Signed-off-by: Chenyuan Yang &lt;<a href=3D"mailto:chenyuan0y@gmail.co=
m" target=3D"_blank">chenyuan0y@gmail.com</a>&gt;<br>
&gt; Fixes: 049723628716 (&quot;drm/bridge: Add ITE IT6263 LVDS to HDMI con=
verter&quot;)<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/bridge/ite-it6263.c | 15 ++++++++++++++-<br>
&gt;=C2=A0 1 file changed, 14 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bri=
dge/ite-it6263.c<br>
&gt; index a3a63a977b0a..3a20b2088bf9 100644<br>
&gt; --- a/drivers/gpu/drm/bridge/ite-it6263.c<br>
&gt; +++ b/drivers/gpu/drm/bridge/ite-it6263.c<br>
&gt; @@ -590,15 +590,28 @@ static void it6263_bridge_atomic_enable(struct d=
rm_bridge *bridge,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_connector *connector;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_stable =3D false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc *crtc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_connector_state *conn_state;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int val;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool pclk_high;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, ret;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0connector =3D drm_atomic_get_new_connector_f=
or_encoder(state,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bridge-&=
gt;encoder);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0crtc =3D drm_atomic_get_new_connector_state(state=
, connector)-&gt;crtc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (WARN_ON(!connector))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0conn_state =3D drm_atomic_get_new_connector_state=
(state, connector);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (WARN_ON(!conn_state))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0crtc =3D conn_state-&gt;crtc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0crtc_state =3D drm_atomic_get_new_crtc_state=
(state, crtc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (WARN_ON(!crtc_state))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mode =3D &amp;crtc_state-&gt;adjusted_mode;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (WARN_ON(!mode))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
<br>
And that condition can never be true.<br>
<br>
Maxime<br>
</blockquote></div></div>
</div>

--000000000000105aaf063a9ac789--
