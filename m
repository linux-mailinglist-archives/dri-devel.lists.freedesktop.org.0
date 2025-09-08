Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6188CB483F0
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 08:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A9310E461;
	Mon,  8 Sep 2025 06:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kjuVgadG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990D010E461
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 06:12:50 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b046f6fb2a9so596496166b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Sep 2025 23:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757311969; x=1757916769; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7YYYLTVIzvGfwhrOeBrLmeSowr47Dc7JVr4/2PkbuUE=;
 b=kjuVgadGOtDhywTIzjLWxGCCf9tg/Dgw8inBbpH4kFCpoGVKz+/WuBz95kZ7wGWmld
 klmPou28vmYCRN/xNlOOK18yqg1IFOX9Vwfa24uRFIkpxYT40/yOZUT5bhSDuKmLX7OM
 w//oYwEMBXi5v0eGh+HJoMzM8A1BONTQm7EYIiNXeky/rQQogtPmUQbyh52VdpeCiTxC
 3xVzqxhyLPnOdf7V2MbP+VBn4tiq8q5pUgzqmw4xR2xDEsl4J7KTPPtT4cEUmVbZLoqf
 sfyUGg1zdTK5GeZtL8H7dYcy31IDAeIcElQ88D/qnOiISFSBYQJCAk4PYni6hzXFzIqQ
 ynrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757311969; x=1757916769;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7YYYLTVIzvGfwhrOeBrLmeSowr47Dc7JVr4/2PkbuUE=;
 b=KIfdH6d3ggo3NnG67zFq1s3gACo1OchMUaYpmGO+O6dry3z9wn5iv047xgkKumRT3A
 OXokAnIviBss36Xxxd3JZpW9teJhoQMF0j3mBmStoZkJ7QqWvb4lXXEjXwgQL+AcxIhE
 9dC2iZStQbHBvePFdKDrCmmf4Mwlc7rTeJJmG6Wz0vm9uQfrkQS7GhOMeOt3IAI4vvKJ
 Pi5SXRxdjJq+UdvpfZV81huIQ30EBGd8EwyBtDmhho0VtRJZksEC1OuQKMDM9qZAH9YT
 zuqtYw7Ux5bygNUuGhgvYU2+YEcnpZ70A6BYOKgLvE03GJIEK4GgUH8QW1TpXn+ej/+T
 Axkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYEJRRj5+nmclmmaUQHRhT7g9PYVIzWhS5lm8Bd2MJG4B8B331ivFGW+3yM2y84k0gQePK9qHbKrs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymRGRzS152bl6nQH4nSOYoa5dzqT1yvvIp7Xy2G9tsq0sFC8DI
 JfVCgP5EexQbJZezCJVxwz8UVbDByy48mXpKI3SA9VjNdwuP4e9W9haFoeuF8VauuJf3AsAPjzc
 9GOuzb0EtvY2TsDtkh3qN5EvNV3smt00=
X-Gm-Gg: ASbGncsrRdcByoK3PUq4KNqHyjq9T7HcinMaCwV7jH5Qs1hs4JpyOVvHtQBg9sdyVtH
 ShZ5QyN7rq794KF8F0L/PTfUOeuVliEThtxqeMTjQ8M6GbwDAj55aGtkN2TkNX4tHV7O0TtWNX6
 PAd3iKQ9/N967hSBQaC7PWPO+0uSFba1aJrmEQzK9niM+8ayRN4I1sZMlZ3B51GnYFSJPvPQbWQ
 OXYiP/dHUwLZ7Gznmp/VpZLITIbYddd3AU=
X-Google-Smtp-Source: AGHT+IEYjfXvWR2B4eYuDGHWKyVtbIsLLicMgqkfvWAdqqd8njGL131W8F6wcLpvQQbd4U9brAmhdiMZCrJJNwqQbQE=
X-Received: by 2002:a17:907:3fa1:b0:afe:7027:56f9 with SMTP id
 a640c23a62f3a-b04b1452997mr635083366b.17.1757311968667; Sun, 07 Sep 2025
 23:12:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250906210412.39904-1-chelsyratnawat2001@gmail.com>
 <DM3PPF208195D8D439BD3D6D24A2E912932E30CA@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8D439BD3D6D24A2E912932E30CA@DM3PPF208195D8D.namprd11.prod.outlook.com>
From: chelsy ratnawat <chelsyratnawat2001@gmail.com>
Date: Mon, 8 Sep 2025 11:42:36 +0530
X-Gm-Features: Ac12FXyGt-xMFXiu3OAHC1IiFM-IkxA-1LRxpM75xVjFqAwfxme_jQksqcVqT0c
Message-ID: <CAOeBcHM27XOBow+eshY71VTTtma=H7dQfRoHvQFwESkT5dFfpA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix logically dead code
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="000000000000a6eca2063e441387"
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

--000000000000a6eca2063e441387
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback, I will update the patch to include the correct
changes.

On Mon, Sep 8, 2025 at 9:55=E2=80=AFAM Kandpal, Suraj <suraj.kandpal@intel.=
com>
wrote:

> > Subject: [PATCH] drm/amdgpu: fix logically dead code
>
> The prefix here is wrong it should be drm/drm_dp_helper since that's wher=
e
> you
> end up doing change and not in amdgpu
>
> >
> > The ternary operator inside the if block is redundant because the
> condition is
> > always true in that context.
> >
> > This patch removes the unnecessary check and returns `ret` directly.
> >
> > Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> > b/drivers/gpu/drm/display/drm_dp_helper.c
> > index 1ecc3df7e316..654d466183d5 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -4227,7 +4227,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux
> > *aux, struct drm_edp_backlight_i
> >       if (ret < 0) {
> >               drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight
> > mode: %d\n",
> >                           aux->name, ret);
> > -             return ret < 0 ? ret : -EIO;
> > +             return ret;
>
> Here functions either expect a success or failure with -EIO since read
> byte return EPROTO
> Or EBUSY we don't want that to propagate up.
> So this needs to be
> return -EIO;
>
> Regards,
> Suraj Kandpal
>
> >       }
> >
> >       *current_mode =3D (mode_reg &
> > DP_EDP_BACKLIGHT_CONTROL_MODE_MASK);
> > --
> > 2.47.3
>
>

--000000000000a6eca2063e441387
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the feedback, I will update the patch to includ=
e the correct changes.</div><br><div class=3D"gmail_quote gmail_quote_conta=
iner"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 8, 2025 at 9:55=E2=
=80=AFAM Kandpal, Suraj &lt;<a href=3D"mailto:suraj.kandpal@intel.com">sura=
j.kandpal@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">&gt; Subject: [PATCH] drm/amdgpu: fix logically dead cod=
e<br>
<br>
The prefix here is wrong it should be drm/drm_dp_helper since that&#39;s wh=
ere you <br>
end up doing change and not in amdgpu<br>
<br>
&gt; <br>
&gt; The ternary operator inside the if block is redundant because the cond=
ition is<br>
&gt; always true in that context.<br>
&gt; <br>
&gt; This patch removes the unnecessary check and returns `ret` directly.<b=
r>
&gt; <br>
&gt; Signed-off-by: Chelsy Ratnawat &lt;<a href=3D"mailto:chelsyratnawat200=
1@gmail.com" target=3D"_blank">chelsyratnawat2001@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/display/drm_dp_helper.c<br>
&gt; b/drivers/gpu/drm/display/drm_dp_helper.c<br>
&gt; index 1ecc3df7e316..654d466183d5 100644<br>
&gt; --- a/drivers/gpu/drm/display/drm_dp_helper.c<br>
&gt; +++ b/drivers/gpu/drm/display/drm_dp_helper.c<br>
&gt; @@ -4227,7 +4227,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux<=
br>
&gt; *aux, struct drm_edp_backlight_i<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_dbg_kms(aux-=
&gt;drm_dev, &quot;%s: Failed to read backlight<br>
&gt; mode: %d\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0aux-&gt;name, ret);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret &lt; 0 ? r=
et : -EIO;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
<br>
Here functions either expect a success or failure with -EIO since read byte=
 return EPROTO<br>
Or EBUSY we don&#39;t want that to propagate up.<br>
So this needs to be <br>
return -EIO;<br>
<br>
Regards,<br>
Suraj Kandpal<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*current_mode =3D (mode_reg &amp;<br>
&gt; DP_EDP_BACKLIGHT_CONTROL_MODE_MASK);<br>
&gt; --<br>
&gt; 2.47.3<br>
<br>
</blockquote></div>

--000000000000a6eca2063e441387--
