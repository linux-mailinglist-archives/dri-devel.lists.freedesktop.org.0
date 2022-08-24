Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B5459FDB3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 17:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC532B1C9;
	Wed, 24 Aug 2022 15:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD0D10E521
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 15:00:19 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-33dac4c9cbcso18499597b3.12
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 08:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=NlA30wCNQDnOjjjKF7HU6lWAxCCPYoprJOItAj/oJ/w=;
 b=Jb8DHE+n06unNMHNok/Aat24//lOALYO/4AsJPJo+LKIEBcdmi5xVxlqAj3t6wLxAq
 d3Z6hWs9Jz1M70AO4PepHToJjkfseIGqCmVye/UZK8uEV9WBA8G2KFgk5R+WRqfn4TjQ
 qSu3Z0aRLXIoTP1qKBCmVaTZhV5N9KHLLCH8u1xw5MHf4ktjhLnJFnqqvUrUi6QOO4/a
 oa2cXPFb0bGX/mUfmPHSR5BpPJQa7d1XENWkVUIVZrsoOmipSFVaUnRhTLtNlVWdaBhZ
 Ukw4MEY4+2OT6jjlE1J8LCjH+DDngmlEptIFrueA7HE0b4OA1CwAkXnlYlUFSdjofl9g
 cRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=NlA30wCNQDnOjjjKF7HU6lWAxCCPYoprJOItAj/oJ/w=;
 b=3IEVP5+qz8L126GIxvf+BObsgdqckH2ltyCaqgTbHTFYhhZvkb7ZMGQ+HVU+M/TBBt
 X9t1aaSbMX/fX4AttLRFoUUHVPwqxS2ui/CTk7vKWSZ/gbYv3gngVNrn70VcUCZRwRe/
 BnERGnbn71W2O0VeXAr0eo0RQswhjepBsXsq0yOAA9X0+A1nymF2p+G69eAf8b+WXsoQ
 fBLGvN0DvNq/FkuXv+qTO8FGvYb09J1xkUlercGQDy2rbxleM+w4zUKR5c9Eb8RptCqN
 WEREggBH4nDz4CkFA+wAvy0oGgav0AYDbCaHyxnhnyDw7cVGyeVErbHv3KDPbQhzwQbe
 9B2A==
X-Gm-Message-State: ACgBeo1G51Bpox4YWFZMUzmUQuoW3d/aGUZRfXqYPcRRfDfwYc83wl+I
 AUf4XbG5bqrHLV4++/K49Ubi8cN4RqiVZY1G4SKEUg==
X-Google-Smtp-Source: AA6agR7J2f3w3OqkCyyMjVDoizFijrN4AvbYQUMrI0y3YdUCsSxbZmJZm30Zz7wGypxkGDFe1qpfQxaPQKq4jdUMd4Y=
X-Received: by 2002:a81:7cb:0:b0:334:f185:5ff6 with SMTP id
 194-20020a8107cb000000b00334f1855ff6mr31225783ywh.483.1661353218756; Wed, 24
 Aug 2022 08:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220810172617.140047-1-christian.koenig@amd.com>
In-Reply-To: <20220810172617.140047-1-christian.koenig@amd.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 24 Aug 2022 10:00:08 -0500
Message-ID: <CAOFGe94mLtLgg+Pu_L8LC3u515feg_YYJecezWL+Cr3ApFypOw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf/dma-resv: check if the new fence is really later
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000073688605e6fdf099"
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000073688605e6fdf099
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2022 at 12:26 PM Christian K=C3=B6nig <
ckoenig.leichtzumerken@gmail.com> wrote:

> Previously when we added a fence to a dma_resv object we always
> assumed the the newer than all the existing fences.
>
> With Jason's work to add an UAPI to explicit export/import that's not
> necessary the case any more. So without this check we would allow
> userspace to force the kernel into an use after free error.
>
> Since the change is very small and defensive it's probably a good
> idea to backport this to stable kernels as well just in case others
> are using the dma_resv object in the same way.
>

Especially in the new world of dma_resv being a "bag of fences", I think
this makes a lot of sense.

Reviewed-by: Jason Ekstrand <jason.ekstrand@collabora.com>


>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 205acb2c744d..e3885c90a3ac 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -295,7 +295,8 @@ void dma_resv_add_fence(struct dma_resv *obj, struct
> dma_fence *fence,
>                 enum dma_resv_usage old_usage;
>
>                 dma_resv_list_entry(fobj, i, obj, &old, &old_usage);
> -               if ((old->context =3D=3D fence->context && old_usage >=3D=
 usage)
> ||
> +               if ((old->context =3D=3D fence->context && old_usage >=3D=
 usage
> &&
> +                    dma_fence_is_later(fence, old)) ||
>                     dma_fence_is_signaled(old)) {
>                         dma_resv_list_set(fobj, i, fence, usage);
>                         dma_fence_put(old);
> --
> 2.25.1
>
>

--00000000000073688605e6fdf099
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Aug 10, 2022 at 12:26 PM Christian K=C3=B6nig &lt;<a href=3D=
"mailto:ckoenig.leichtzumerken@gmail.com">ckoenig.leichtzumerken@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">P=
reviously when we added a fence to a dma_resv object we always<br>
assumed the the newer than all the existing fences.<br>
<br>
With Jason&#39;s work to add an UAPI to explicit export/import that&#39;s n=
ot<br>
necessary the case any more. So without this check we would allow<br>
userspace to force the kernel into an use after free error.<br>
<br>
Since the change is very small and defensive it&#39;s probably a good<br>
idea to backport this to stable kernels as well just in case others<br>
are using the dma_resv object in the same way.<br></blockquote><div><br></d=
iv><div>Especially in the new world of dma_resv being a &quot;bag of fences=
&quot;, I think this makes a lot of sense.</div><div><br></div><div>Reviewe=
d-by: Jason Ekstrand &lt;<a href=3D"mailto:jason.ekstrand@collabora.com">ja=
son.ekstrand@collabora.com</a>&gt;<br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@=
amd.com" target=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
---<br>
=C2=A0drivers/dma-buf/dma-resv.c | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c<br>
index 205acb2c744d..e3885c90a3ac 100644<br>
--- a/drivers/dma-buf/dma-resv.c<br>
+++ b/drivers/dma-buf/dma-resv.c<br>
@@ -295,7 +295,8 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dm=
a_fence *fence,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum dma_resv_usage=
 old_usage;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_resv_list_entry=
(fobj, i, obj, &amp;old, &amp;old_usage);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((old-&gt;contex=
t =3D=3D fence-&gt;context &amp;&amp; old_usage &gt;=3D usage) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((old-&gt;contex=
t =3D=3D fence-&gt;context &amp;&amp; old_usage &gt;=3D usage &amp;&amp;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_=
fence_is_later(fence, old)) ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_f=
ence_is_signaled(old)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dma_resv_list_set(fobj, i, fence, usage);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dma_fence_put(old);<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000073688605e6fdf099--
