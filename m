Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEEFAE23CC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 22:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454AC10EBC3;
	Fri, 20 Jun 2025 20:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JNrRP+g0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5383A10EBC3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 20:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750452932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jTyVQbHEOOt1KeHhbPigu0zVkxuLBoNfqUEzQdlCMVA=;
 b=JNrRP+g0IMX6ze8JsgfpSD9GNUHJBc7ya95wOJOdhpYcSScIQ99fMX6RW79xKIdp13fn/4
 nWC4vz93JbC4Txj9hVdiazU71tDA9AX6cKCaJ+gBSLa2dUR7v38CVYH/XSOR+uaRPdY7H1
 Ppt7fPCzSbnNK9Z4cDEq1rl6AYxVKCQ=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-mc0YfBU0OXOChfnWyQJnWQ-1; Fri, 20 Jun 2025 16:55:31 -0400
X-MC-Unique: mc0YfBU0OXOChfnWyQJnWQ-1
X-Mimecast-MFC-AGG-ID: mc0YfBU0OXOChfnWyQJnWQ_1750452930
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-707cf1b0ecbso30127707b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 13:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750452930; x=1751057730;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jTyVQbHEOOt1KeHhbPigu0zVkxuLBoNfqUEzQdlCMVA=;
 b=tBHvMOjLmq7g3237ZU/cuKCjzd5E3AtquQ0QhE7hY4rjmCwrt91FsTpskDqP5/IQZn
 pUrMS23Foq1KMK50O4rOo714WBO4tYJWlCQjvWBvD+Y/u7NsyzpSrjTSAQJXTdVT0WMa
 6J5d14a1NaNOaegVLcdXHVeJWv/08rM1d18YQinpxlz8i8NdGKzvjdoRWT4bY7CyQ9xs
 G8Egk/U7vhCjJRW48KSbh5M95VpHacEPCaBACs3EqPPQ09dLNIiyq8mtlA8LZPhr/K58
 Lftv13UME1ISLh6V5MM0qLCELxfQoW7u9qiA/X5tV34jJEIREuLBOfJYUsubS4cz/X3u
 yOug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoT80tTZWnFePvWyiD/v1xbwYu/3Tmta/J/28LV4o9MCe3jt8qHHSOf8JsI0n7ajNyLtYPYmmGqqk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZti1HD5335dFc6lFLsCrYEBADwoiXnYVuMQsKUYZ3hpMbIFJk
 t7S34ccGDif8cKK8/+U/0iAcSmiJ/4Qvdu5hT6pug6J6QBwzq7U85qRVvpXItv9TpFzP0qP+QK4
 fTd3Hg4ldgmjmWjoLoh0iNJRyN29h9lSNCsK6w9JUWGxoXONOYniagbHm1vqne67YAE09ycnZc+
 cY7AgMYB90d2KJFEJSgyia/pfaukOQwHylPq8nB+o8Q0Nw
X-Gm-Gg: ASbGncsLJhu0jLNT8MZpyq5k3eOMS2aS4Nm498pwopdjjqZa0KtZ9ul+rHOlByt8xeh
 qVHRpfH8b3NYUGBZPfaXDPwRjLuiK/pP1c1sHwknTGrS5gq1pHxu7VZ/s0+PIM8DY9R1dMWJMZf
 A9uQ==
X-Received: by 2002:a05:690c:f8b:b0:70e:73ae:766d with SMTP id
 00721157ae682-712c639d4d1mr65698797b3.3.1750452930316; 
 Fri, 20 Jun 2025 13:55:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmhGqECKJtjspAZOdgaLkvNNKBPKyyBdCwT/J2kCaiZ9B5bNriFk8KkJhcXFo9Gkb9WIb5dyVgUs63byJQnLc=
X-Received: by 2002:a05:690c:f8b:b0:70e:73ae:766d with SMTP id
 00721157ae682-712c639d4d1mr65698227b3.3.1750452929867; Fri, 20 Jun 2025
 13:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
 <20250619-b4-of_drm_find_panel_part1-v2-4-0df94aecc43d@redhat.com>
 <20250620-groovy-imposing-reindeer-e52ed0@houat>
In-Reply-To: <20250620-groovy-imposing-reindeer-e52ed0@houat>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 20 Jun 2025 15:54:10 -0500
X-Gm-Features: AX0GCFv6QgoPzJc1hqX7FbrOnH3FMrqAOfqiIL7Pv4QzwdsT54VWGWKD8lmDMRg
Message-ID: <CAN9Xe3SsdbwXvDav_TUkryN3nXjujkwMTtcUcigavy5FZ29UcA@mail.gmail.com>
Subject: Re: [PATCH v2 04/16] drm/panel/sun4i: Keep up with refcounting
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fOOPeOzKkpNpogkQX0Yf1-nH8wCr0Hbtoys6DxA-nwY_1750452930
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000014c8350638071568"
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

--00000000000014c8350638071568
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 8:27=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:

> Hi,
>
> On Thu, Jun 19, 2025 at 02:15:56PM -0500, Anusha Srivatsa wrote:
> > Put the panel reference back when driver is no
> > longer using it.
> >
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
>
> When I asked you to provide a rationale for why you think the
> drm_panel_put() call belonged where it does, it was pretty obvious it
> needed to be done for all patches with the same issue, not just a few
> random ones.
>
> Well, not totally random. THe intention was to specifically explain the
cases
where the drm_panel_put() is part of a probe(), enable() or attach() like
function
since that caused confusion in the last version. There must have been
misunderstanding
on my end when I thought only those cases needed additional explanation. I
will
make the commit message more verbose.

Thanks,
Anusha

Maxime
>

--00000000000014c8350638071568
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 20,=
 2025 at 8:27=E2=80=AFAM Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel=
.org">mripard@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Hi,<br>
<br>
On Thu, Jun 19, 2025 at 02:15:56PM -0500, Anusha Srivatsa wrote:<br>
&gt; Put the panel reference back when driver is no<br>
&gt; longer using it.<br>
&gt; <br>
&gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.c=
om" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
<br>
When I asked you to provide a rationale for why you think the<br>
drm_panel_put() call belonged where it does, it was pretty obvious it<br>
needed to be done for all patches with the same issue, not just a few<br>
random ones.<br>
<br></blockquote><div>Well, not totally random. THe intention was to specif=
ically explain the cases</div><div>where the drm_panel_put() is part of a p=
robe(), enable() or attach() like function</div><div>since that caused conf=
usion in the last version. There must have been misunderstanding</div><div>=
on my end when I thought only those cases needed additional explanation. I =
will</div><div>make the commit message more verbose.</div><div><br></div><d=
iv>Thanks,</div><div>Anusha</div><div><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
Maxime<br>
</blockquote></div></div>

--00000000000014c8350638071568--

