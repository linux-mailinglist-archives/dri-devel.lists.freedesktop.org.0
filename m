Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 303DA77A093
	for <lists+dri-devel@lfdr.de>; Sat, 12 Aug 2023 16:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84FA710E066;
	Sat, 12 Aug 2023 14:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8890E10E069
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Aug 2023 14:54:12 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-991c786369cso393211366b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Aug 2023 07:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20221208.gappssmtp.com; s=20221208; t=1691852051; x=1692456851;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uBMSfz23O1Rvr42aW/JSGymLkrRHHgkghxffl9JWGcA=;
 b=LMoO632y0/4u9D7qUMoT5bo8/AZLcWdF/MSSd8MuF7BlQSmdElAyLNTTTAVKH1sIgY
 hbM5AAIWhmxXIbklgzw2QiWVtshqyINylN3tHl2mpzXy0aATHsCDTscFMm/hVTP/FETF
 8DHZ8kIv5V1WhTBBDS7RVVfqVz2rxyAmnThGasjccSFZpe9X78uxkqjQvpHhZ9oEnUY7
 uLyenYyz8lhG9n+zQkyD6UIZ7h/u7bKqVNQXo+KZ10MKwdIDOfcNe6AtxH8bT5e96SoZ
 xwftUWRpc74DqZtiY5wrK1Yq8NLUrG6bg4TtB3Di7bFU728T3TCMy31KDXGg1h2xdWXA
 7KAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691852051; x=1692456851;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uBMSfz23O1Rvr42aW/JSGymLkrRHHgkghxffl9JWGcA=;
 b=ba4a/GKGAg4V80Q7hTMelZUi20ddZ1Qsr1wQtDUszPbWlWnDpsdycWrkQABdzA4Fmi
 KTx3R3GG0O19aPmcd2MoA+yOszf2MiAac3Gc3BJkPNqmiVzJIOGIdoBwpgfULUZZs77r
 3xeH/KdhL7XRrPqPJAfISYMI+ogU5BgOFIOq58dyD6VUB9Os4wwm/EnJUBQ6h0JyK42n
 TT+mNCWJvi6dJNTJAtf06Ee+hZWnltWcliH+ogKuGyXWn0zFwuEE00tcqIFWxGThOYh2
 CRcLdL3XB9HcuDWjVcnF4n5tF1QriAc2GzUw2G0U8j5NURC4mWqBzGlIGmHZaiezT8FQ
 JlWA==
X-Gm-Message-State: AOJu0Yygo0c0pNicNOczvCJyuLZqXpGXNZQWjP+hFij9SR4iHjcqRVmA
 W834NECB6dmVqWi8nraTPBYWA7GfEiKz51z9PJihTA==
X-Google-Smtp-Source: AGHT+IEPT6VcajySNHKBIYcvE7F+n3Q+h66yqBsgyxxIVBZJzQE5aAUpxcA6iKrMF1x05/hl2QyO+J73SygA4pctEK0=
X-Received: by 2002:a17:906:196:b0:99c:4c94:1a9a with SMTP id
 22-20020a170906019600b0099c4c941a9amr4322523ejb.42.1691852050480; Sat, 12 Aug
 2023 07:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230811031520.248341-1-airlied@gmail.com>
In-Reply-To: <20230811031520.248341-1-airlied@gmail.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Sat, 12 Aug 2023 09:53:58 -0500
Message-ID: <CAOFGe94gb9Yu8zpnuVY6ZyqtahLDKMQp0JZmB9xxer0CirhawA@mail.gmail.com>
Subject: Re: [PATCH] nouveau: find the smallest page allocation to cover a
 buffer alloc.
To: Dave Airlie <airlied@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000007b53ea0602bb00f2"
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000007b53ea0602bb00f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2023 at 10:15=E2=80=AFPM Dave Airlie <airlied@gmail.com> wr=
ote:

> From: Dave Airlie <airlied@redhat.com>
>
> With the new uapi we don't have the comp flags on the allocation,
> so we shouldn't be using the first size that works, we should be
> iterating until we get the correct one.
>
> This reduces allocations from 2MB to 64k in lots of places.
>
> Fixes dEQP-VK.memory.allocation.basic.size_8KiB.forward.count_4000
> on my ampere/gsp system.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
>

Reviewed-by: Faith Ekstrand <faith.ekstrand@collabora.com>


> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
> b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 949195d5d782..a6993c7807b6 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -318,8 +318,9 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size,
> int *align, u32 domain,
>                             (!vmm->page[i].host || vmm->page[i].shift >
> PAGE_SHIFT))
>                                 continue;
>
> -                       if (pi < 0)
> -                               pi =3D i;
> +                       /* pick the last one as it will be smallest. */
> +                       pi =3D i;
> +
>                         /* Stop once the buffer is larger than the curren=
t
> page size. */
>                         if (*size >=3D 1ULL << vmm->page[i].shift)
>                                 break;
> --
> 2.41.0
>
>

--0000000000007b53ea0602bb00f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Aug 10, 2023 at 10:15=E2=80=AFPM Dave Airlie &lt;<a href=3D"=
mailto:airlied@gmail.com">airlied@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">From: Dave Airlie &lt;<a href=3D=
"mailto:airlied@redhat.com" target=3D"_blank">airlied@redhat.com</a>&gt;<br=
>
<br>
With the new uapi we don&#39;t have the comp flags on the allocation,<br>
so we shouldn&#39;t be using the first size that works, we should be<br>
iterating until we get the correct one.<br>
<br>
This reduces allocations from 2MB to 64k in lots of places.<br>
<br>
Fixes dEQP-VK.memory.allocation.basic.size_8KiB.forward.count_4000<br>
on my ampere/gsp system.<br>
<br>
Signed-off-by: Dave Airlie &lt;<a href=3D"mailto:airlied@redhat.com" target=
=3D"_blank">airlied@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
Reviewed-by: Faith Ekstrand &lt;<a href=3D"mailto:faith.ekstrand@collabora.=
com">faith.ekstrand@collabora.com</a>&gt;<br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0drivers/gpu/drm/nouveau/nouveau_bo.c | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau=
/nouveau_bo.c<br>
index 949195d5d782..a6993c7807b6 100644<br>
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c<br>
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c<br>
@@ -318,8 +318,9 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, in=
t *align, u32 domain,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (!vmm-&gt;page[i].host || vmm-&gt;page[i].shift &g=
t; PAGE_SHIFT))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (pi &lt; 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pi =3D i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* pick the last one as it will be smallest. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pi =3D i;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* Stop once the buffer is larger than the current page size. */=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (*size &gt;=3D 1ULL &lt;&lt; vmm-&gt;page[i].shift)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-- <br>
2.41.0<br>
<br>
</blockquote></div></div>

--0000000000007b53ea0602bb00f2--
