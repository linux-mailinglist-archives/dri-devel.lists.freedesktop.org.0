Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 621854513D5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 21:04:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CCD6E05F;
	Mon, 15 Nov 2021 20:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A856E05F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 20:04:25 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id x15so77099719edv.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 12:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=avw/UKfu2PzAZJI1w2c24kauPrcOE4xj7UX8G3nGvcI=;
 b=AF1rbCnFuXBX374jx1K0fMCODOq21RWz16PGozqnhr6ea+zaalwmS9x07TXihmsWJ+
 8t1NeGdVm3oUIjs/jux3UIifR38+0Z0iN/sKpmE8mlyncjKkO/+9iDC40ThDx5cox4lB
 jyLPm/+v0hlFffRnkAWhGeRiof6pSrGozR0K0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=avw/UKfu2PzAZJI1w2c24kauPrcOE4xj7UX8G3nGvcI=;
 b=zEqtn031eoNPXzJlGHBxq0QhIqQ0Mg4N9mhJrPMI8P/rGQwNMm2pGnx1y8deoUzN+Z
 F0D/xddFQd73IV2nsf2QwaYGloj9RiF9qgJsVNl4wEFuXYNESi7eJPk1GC1sKJ58MrEu
 wqGAYGNcxEqtMHoGJ6bczUO7/cCTBQTL2rlq+04tqP3Q0N7KPpivookZUe/ccMUor9fl
 QKQ1YQLYo4lHW+6cT98452OVQwpUMpFJUo08KfwchQDn6IcdHQmrsGBFhD5GjfaW61t5
 qUVRr0jQb25xUTybUCsouSfDPTBgcO7gf3g5tKncHpHlDSl23l0wlFNYFlhNRrYEiXQT
 M+tg==
X-Gm-Message-State: AOAM5336IiTlXO6SbtGqpXi8sCqsDMUHUBvvG6aNBdt/fuvMHZNkv2uF
 5s/3iaGL06kZ2o/A8gk6jpEoNYGLCbeBJA==
X-Google-Smtp-Source: ABdhPJxYiI0awb6Ro7YXBA4NPyEAszutvKfl37/nWKzh/vpzEWCjY8qRY3VFSychMqscpVqpS6o7eA==
X-Received: by 2002:a17:907:9484:: with SMTP id
 dm4mr1961894ejc.307.1637006663634; 
 Mon, 15 Nov 2021 12:04:23 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48])
 by smtp.gmail.com with ESMTPSA id hp3sm7202937ejc.61.2021.11.15.12.04.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 12:04:23 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id
 az33-20020a05600c602100b00333472fef04so147548wmb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 12:04:22 -0800 (PST)
X-Received: by 2002:a1c:98ca:: with SMTP id a193mr1265779wme.162.1637006662072; 
 Mon, 15 Nov 2021 12:04:22 -0800 (PST)
MIME-Version: 1.0
References: <20211115175800.773-1-gurchetansingh@google.com>
In-Reply-To: <20211115175800.773-1-gurchetansingh@google.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Mon, 15 Nov 2021 12:04:09 -0800
X-Gmail-Original-Message-ID: <CAAfnVBnP3EheTKA08L-YFfBR9B9MtUaEZJcrQUhBOn_rGmHxVw@mail.gmail.com>
Message-ID: <CAAfnVBnP3EheTKA08L-YFfBR9B9MtUaEZJcrQUhBOn_rGmHxVw@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: add null check in virtio_gpu_poll
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000972d6d05d0d950d2"
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
Cc: kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000972d6d05d0d950d2
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 15, 2021 at 9:58 AM Gurchetan Singh <gurchetansingh@chromium.org>
wrote:

> From: Gurchetan Singh <gurchetansingh@chromium.org>
>
> If vfpriv is null, we shouldn't check vfpriv->ring_idx_mask.
>
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c
> b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index 749db18dcfa2..7975ea06b316 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -166,7 +166,7 @@ static __poll_t virtio_gpu_poll(struct file *filp,
>         struct drm_pending_event *e = NULL;
>         __poll_t mask = 0;
>
> -       if (!vfpriv->ring_idx_mask)
> +       if (!vfpriv || !vfpriv->ring_idx_mask)
>                 return drm_poll(filp, wait);
>
>         poll_wait(filp, &drm_file->event_wait, wait);
>

Nevermind, looks like fix was merged in the main tree and will make it back
to to drm-misc-next:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d89c0c8322ecdc9a2ec84b959b6f766be082da76

-- 
> 2.34.0.rc1.387.gb447b232ab-goog
>
>

--000000000000972d6d05d0d950d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 15, 2021 at 9:58 AM Gurch=
etan Singh &lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=3D"_bl=
ank">gurchetansingh@chromium.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: Gurchetan Singh &lt;<a href=3D"mailt=
o:gurchetansingh@chromium.org" target=3D"_blank">gurchetansingh@chromium.or=
g</a>&gt;<br>
<br>
If vfpriv is null, we shouldn&#39;t check vfpriv-&gt;ring_idx_mask.<br>
<br>
Signed-off-by: Gurchetan Singh &lt;<a href=3D"mailto:gurchetansingh@chromiu=
m.org" target=3D"_blank">gurchetansingh@chromium.org</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_drv.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/=
virtgpu_drv.c<br>
index 749db18dcfa2..7975ea06b316 100644<br>
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c<br>
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c<br>
@@ -166,7 +166,7 @@ static __poll_t virtio_gpu_poll(struct file *filp,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_pending_event *e =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __poll_t mask =3D 0;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vfpriv-&gt;ring_idx_mask)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vfpriv || !vfpriv-&gt;ring_idx_mask)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return drm_poll(fil=
p, wait);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 poll_wait(filp, &amp;drm_file-&gt;event_wait, w=
ait);<br></blockquote><div><br></div><div>Nevermind, looks like fix was mer=
ged in the main tree and will make it back to to drm-misc-next:</div><div><=
br></div><div><a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/to=
rvalds/linux.git/commit/?id=3Dd89c0c8322ecdc9a2ec84b959b6f766be082da76" rel=
=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/linux/kern=
el/git/torvalds/linux.git/commit/?id=3Dd89c0c8322ecdc9a2ec84b959b6f766be082=
da76</a><br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
-- <br>
2.34.0.rc1.387.gb447b232ab-goog<br>
<br>
</blockquote></div></div>

--000000000000972d6d05d0d950d2--
