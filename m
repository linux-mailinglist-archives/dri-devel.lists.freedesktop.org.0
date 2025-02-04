Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2397A26D97
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 09:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE5410E5C2;
	Tue,  4 Feb 2025 08:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.b="RmJaw182";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060E310E036
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 02:25:33 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5d3d143376dso6356284a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 18:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1738635932; x=1739240732;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=OiPbOYDqhvBvvULBy2CCyB9152DAmDtOBY7+Ez+rRl8=;
 b=RmJaw182zttc2ugQ1Sgqx0Wq1PQVrPuCHxHS02e4Cmhgp/8i3ALjCxcMzMGX6ApHBC
 9NBlqMfhqspS9c2QLJyMQgKY6fyEJaLlDHOQUqt9eWQWq3TRcMiD6LHfTwO7s+GHmFUx
 PXcXxOCOpwVbzSnTGlgy7nI4eI3tl66X4l2efv0ow++t6WLHg7TpvzNp7w6g/dRAOKdI
 rfUoqWRueEhOh1RFpJ6q1LvSJJOCJzusr3czpU/2fKE/SLTPFQLBgvUituNgFOeq5IC5
 AS5LnpXCCC/EMfFoVtphkW40blSbuYBo7C0y9wce6yOnKbBfWLX7a1bA5vg0+91T+Up5
 ByRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738635932; x=1739240732;
 h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OiPbOYDqhvBvvULBy2CCyB9152DAmDtOBY7+Ez+rRl8=;
 b=Sl3GjfYsUPGseW2+cBwuHhShwWGD8An4oMRZZPa8e4PuVQbDVmHY5DBUq22UrLnrHZ
 NYhA9/iwk3WfyMzmRu3dLjovs8H/z4n43WFz19Sm8thtWV9aBcdn0aEJpNejxEA3tri3
 cH3vA/Sm/IaQEWwbDPxe07/zusx4kXDtIP2OgiR6+5ZdrPK1wXN+1T9iuq8g3zTJZEgZ
 evXj9Ec91jjAFQBadjFLiBv1uai1meXUgOofSRXSxxL+YskZtWPfFeEvEExJbb6zAIep
 bivmOEuhjz7PddLQWA1rTRpIIKRgodREhOm3jN4U4wUu93UXsesiscV3kS+YsF5bYK33
 Yrtg==
X-Gm-Message-State: AOJu0YyKQXFXrF1BzMi2atn4/8aLTrLFjVzKX7OsrA5O6yZC1q6FdBPT
 qXomaoYq8B815kp/DRGHKblpp/JsvIQcdlj2g5EvHNw3AamFqyXDUu79mmFd1/rI4ry/kKmnJdE
 pVKYIbVZEUke6kaAEbtUvn3vZ/b6adOeWqAiq6w==
X-Gm-Gg: ASbGncuVnMuSD8e0I8/W+ARxyO0MkWm5YuZs37sjozRTO4ljxKIw4EjXFxk6tup0qUZ
 t13wXWYFvBvX8TJmXhBAFBMIvVuB/JTmIevMHLjlV0ymNx0iUAjtY8X1UYCDrFCndAkPXmjrtNC
 k=
X-Google-Smtp-Source: AGHT+IEwgwNlCHxSHk2Dglzzw0yI4ElivAYqarA7L6KVPQGeMBpIAD4yQRZ06fh+g4Izp0cVnbx4iWWNgDNpcn7Zg4k=
X-Received: by 2002:a05:6402:1d4a:b0:5d9:fbb5:9ee with SMTP id
 4fb4d7f45d1cf-5dc5efc05f9mr26363187a12.13.1738635931464; Mon, 03 Feb 2025
 18:25:31 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST; 
 Mon, 3 Feb 2025 18:25:30 -0800
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST; 
 Mon, 3 Feb 2025 18:25:30 -0800
From: =?UTF-8?B?5YiY54Wn546J?= <liuzhaoyu.zackary@bytedance.com>
Mime-Version: 1.0
References: <20250126093256.GA688734@bytedance>
In-Reply-To: <20250126093256.GA688734@bytedance>
Date: Mon, 3 Feb 2025 18:25:30 -0800
X-Gm-Features: AWEUYZlmHg7rMQvD9zvxcbG7EyiymR43uzRF4n1o9EjRJ8I8UDh7Rv2Q0Bdl1Yk
Message-ID: <CACFO4hKx4wrd2AEAgV-AFi_CQW9VGw8jvkxC3HPorQYoRgzXrA@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: use ttm_resource_unevictable() to replace
 pin_count and swapped
To: "christian.koenig" <christian.koenig@amd.com>,
 "ray.huang" <ray.huang@amd.com>, 
 "maarten.lankhorst" <maarten.lankhorst@linux.intel.com>,
 mripard <mripard@kernel.org>, 
 tzimmermann <tzimmermann@suse.de>, airlied <airlied@gmail.com>,
 simona <simona@ffwll.ch>, 
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: multipart/alternative; boundary="00000000000016cc69062d47b963"
X-Mailman-Approved-At: Tue, 04 Feb 2025 08:48:22 +0000
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

--00000000000016cc69062d47b963
Content-Type: text/plain; charset="UTF-8"

> From: "Zhaoyu Liu"<liuzhaoyu.zackary@bytedance.com> > Date:  Sun, Jan 26,
2025, 17:33 > Subject:  [PATCH] drm/ttm: use ttm_resource_unevictable() to
replace pin_count and swapped > To: <christian.koenig@amd.com>, <
ray.huang@amd.com>, <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch> > Cc: <
dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org> > TTM
always uses pin_count and ttm_resource_is_swapped() together to > determine
whether a BO is unevictable. > Now use ttm_resource_unevictable() to
replace them. >  > Signed-off-by: Zhaoyu Liu <
liuzhaoyu.zackary@bytedance.com> > --- >
 drivers/gpu/drm/ttm/ttm_resource.c | 15 ++++++++++----- >  1 file changed,
10 insertions(+), 5 deletions(-) >  > diff --git
a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c >
index cc29bbf3eabb..a8f9f7ed6c6e 100644 > ---
a/drivers/gpu/drm/ttm/ttm_resource.c > +++
b/drivers/gpu/drm/ttm/ttm_resource.c > @@ -252,11 +252,16 @@ static bool
ttm_resource_is_swapped(struct ttm_resource *res, struct ttm_buffer_ >
     return ttm_tt_is_swapped(bo->ttm); >  } >   > +static bool
ttm_resource_unevictable(struct ttm_resource *res, struct ttm_buffer_object
*bo) > +{ > +        return bo->pin_count || ttm_resource_is_swapped(res,
bo); > +} > + >  /* Add the resource to a bulk move if the BO is configured
for it */ >  void ttm_resource_add_bulk_move(struct ttm_resource *res, >
                               struct ttm_buffer_object *bo) >  { > -
 if (bo->bulk_move && !bo->pin_count && !ttm_resource_is_swapped(res, bo))
> +        if (bo->bulk_move && !ttm_resource_unevictable(res, bo)) >
           ttm_lru_bulk_move_add(bo->bulk_move, res); >  } >   > @@ -264,7
+269,7 @@ void ttm_resource_add_bulk_move(struct ttm_resource *res, >  void
ttm_resource_del_bulk_move(struct ttm_resource *res, >
             struct ttm_buffer_object *bo) >  { > -        if
(bo->bulk_move && !bo->pin_count && !ttm_resource_is_swapped(res, bo)) > +
       if (bo->bulk_move && !ttm_resource_unevictable(res, bo)) >
       ttm_lru_bulk_move_del(bo->bulk_move, res); >  } >   > @@ -276,10
+281,10 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res) >
>          lockdep_assert_held(&bo->bdev->lru_lock); >   > -        if
(bo->pin_count || ttm_resource_is_swapped(res, bo)) { > +        if
(ttm_resource_unevictable(res, bo)) { >
 list_move_tail(&res->lru.link, &bdev->unevictable); >   > -        } else
       if (bo->bulk_move) { > +        } else if (bo->bulk_move) { >
           struct ttm_lru_bulk_move_pos *pos = >
 ttm_lru_bulk_move_pos(bo->bulk_move, res); >   > @@ -318,7 +323,7 @@ void
ttm_resource_init(struct ttm_buffer_object *bo, >   >          man =
ttm_manager_type(bo->bdev, place->mem_type); >
 spin_lock(&bo->bdev->lru_lock); > -        if (bo->pin_count ||
ttm_resource_is_swapped(res, bo)) > +        if
(ttm_resource_unevictable(res, bo)) >
 list_add_tail(&res->lru.link, &bo->bdev->unevictable); >          else >
               list_add_tail(&res->lru.link, &man->lru[bo->priority]); >
--  > 2.25.1 >  Hi,   Could you help me to review it, thx.

--00000000000016cc69062d47b963
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div style=3D"white-space:pre-wrap"><span>&gt; Fro=
m: &quot;Zhaoyu Liu&quot;&lt;<a href=3D"mailto:liuzhaoyu.zackary@bytedance.=
com" target=3D"_blank">liuzhaoyu.zackary@bytedance.com</a>&gt;
&gt; Date:=C2=A0 Sun, Jan 26, 2025, 17:33
&gt; Subject:=C2=A0 [PATCH] drm/ttm: use ttm_resource_unevictable() to repl=
ace pin_count and swapped
&gt; To: &lt;<a href=3D"mailto:christian.koenig@amd.com" target=3D"_blank">=
christian.koenig@amd.com</a>&gt;, &lt;<a href=3D"mailto:ray.huang@amd.com" =
target=3D"_blank">ray.huang@amd.com</a>&gt;, &lt;<a href=3D"mailto:maarten.=
lankhorst@linux.intel.com" target=3D"_blank">maarten.lankhorst@linux.intel.=
com</a>&gt;, &lt;<a href=3D"mailto:mripard@kernel.org" target=3D"_blank">mr=
ipard@kernel.org</a>&gt;, &lt;<a href=3D"mailto:tzimmermann@suse.de" target=
=3D"_blank">tzimmermann@suse.de</a>&gt;, &lt;<a href=3D"mailto:airlied@gmai=
l.com" target=3D"_blank">airlied@gmail.com</a>&gt;, &lt;<a href=3D"mailto:s=
imona@ffwll.ch" target=3D"_blank">simona@ffwll.ch</a>&gt;
&gt; Cc: &lt;<a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_=
blank">dri-devel@lists.freedesktop.org</a>&gt;, &lt;<a href=3D"mailto:linux=
-kernel@vger.kernel.org" target=3D"_blank">linux-kernel@vger.kernel.org</a>=
&gt;
&gt; TTM always uses pin_count and ttm_resource_is_swapped() together to
&gt; determine whether a BO is unevictable.
&gt; Now use ttm_resource_unevictable() to replace them.
&gt;=C2=A0
&gt; Signed-off-by: Zhaoyu Liu &lt;<a href=3D"mailto:liuzhaoyu.zackary@byte=
dance.com" target=3D"_blank">liuzhaoyu.zackary@bytedance.com</a>&gt;
&gt; ---
&gt; =C2=A0drivers/gpu/drm/ttm/ttm_resource.c | 15 ++++++++++-----
&gt; =C2=A01 file changed, 10 insertions(+), 5 deletions(-)
&gt;=C2=A0
&gt; diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/=
ttm_resource.c
&gt; index cc29bbf3eabb..a8f9f7ed6c6e 100644
&gt; --- a/drivers/gpu/drm/ttm/ttm_resource.c
&gt; +++ b/drivers/gpu/drm/ttm/ttm_resource.c
&gt; @@ -252,11 +252,16 @@ static bool ttm_resource_is_swapped(struct ttm_r=
esource *res, struct ttm_buffer_
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ttm_tt_is_swapped(bo-&gt;ttm)=
;
&gt; =C2=A0}
&gt; =C2=A0
&gt; +static bool ttm_resource_unevictable(struct ttm_resource *res, struct=
 ttm_buffer_object *bo)
&gt; +{
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0return bo-&gt;pin_count || ttm_resource_i=
s_swapped(res, bo);
&gt; +}
&gt; +
&gt; =C2=A0/* Add the resource to a bulk move if the BO is configured for i=
t */
&gt; =C2=A0void ttm_resource_add_bulk_move(struct ttm_resource *res,
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct ttm_buffer_object *b=
o)
&gt; =C2=A0{
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo-&gt;bulk_move &amp;&amp; !bo-&gt;p=
in_count &amp;&amp; !ttm_resource_is_swapped(res, bo))
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo-&gt;bulk_move &amp;&amp; !ttm_reso=
urce_unevictable(res, bo))
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ttm_lru_=
bulk_move_add(bo-&gt;bulk_move, res);
&gt; =C2=A0}
&gt; =C2=A0
&gt; @@ -264,7 +269,7 @@ void ttm_resource_add_bulk_move(struct ttm_resourc=
e *res,
&gt; =C2=A0void ttm_resource_del_bulk_move(struct ttm_resource *res,
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct ttm_buffer_object *b=
o)
&gt; =C2=A0{
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo-&gt;bulk_move &amp;&amp; !bo-&gt;p=
in_count &amp;&amp; !ttm_resource_is_swapped(res, bo))
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo-&gt;bulk_move &amp;&amp; !ttm_reso=
urce_unevictable(res, bo))
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ttm_lru_=
bulk_move_del(bo-&gt;bulk_move, res);
&gt; =C2=A0}
&gt; =C2=A0
&gt; @@ -276,10 +281,10 @@ void ttm_resource_move_to_lru_tail(struct ttm_re=
source *res)
&gt; =C2=A0
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lockdep_assert_held(&amp;bo-&gt;bdev=
-&gt;lru_lock);
&gt; =C2=A0
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo-&gt;pin_count || ttm_resource_is_s=
wapped(res, bo)) {
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ttm_resource_unevictable(res, bo)) {
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_mov=
e_tail(&amp;res-&gt;lru.link, &amp;bdev-&gt;unevictable);
&gt; =C2=A0
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0} else =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo-=
&gt;bulk_move) {
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (bo-&gt;bulk_move) {
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct t=
tm_lru_bulk_move_pos *pos =3D
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ttm_lru_bulk_move_pos(bo-&gt;bulk_move, res);
&gt; =C2=A0
&gt; @@ -318,7 +323,7 @@ void ttm_resource_init(struct ttm_buffer_object *b=
o,
&gt; =C2=A0
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0man =3D ttm_manager_type(bo-&gt;bdev=
, place-&gt;mem_type);
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock(&amp;bo-&gt;bdev-&gt;lru_l=
ock);
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo-&gt;pin_count || ttm_resource_is_s=
wapped(res, bo))
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ttm_resource_unevictable(res, bo))
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_add=
_tail(&amp;res-&gt;lru.link, &amp;bo-&gt;bdev-&gt;unevictable);
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_add=
_tail(&amp;res-&gt;lru.link, &amp;man-&gt;lru[bo-&gt;priority]);
&gt; --=C2=A0
&gt; 2.25.1
&gt;=C2=A0
Hi,
=C2=A0 Could you help me to review it, thx.</span></div></body></html>

--00000000000016cc69062d47b963--
