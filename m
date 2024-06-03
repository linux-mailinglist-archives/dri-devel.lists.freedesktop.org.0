Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 194CD8D7CC6
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 09:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28BB10E2E8;
	Mon,  3 Jun 2024 07:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IqyWSe/u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D466C10E2E8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 07:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717401070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZM/qlijRGY09CL6SCWZrPLW5sIErx5xRvS0RDt3tq4s=;
 b=IqyWSe/uB3eVRwMTx1VilCvcj24unnaMgZwZHSXvptMeKJqxSHypTNSL2mU/YpMqDNPXrL
 fQd5PR9foRIpWv8U5xKz77mpKasJf2AauC4iEycvwNzUk+iSYEgneQ2WPcyarROMdAJbbi
 1/5mqsuhEFEXtdXEYvoa6jdVcLOmhvk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-Lge9xvIYNCehkwV2G4u3Lg-1; Mon, 03 Jun 2024 03:51:08 -0400
X-MC-Unique: Lge9xvIYNCehkwV2G4u3Lg-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a68c2de5f84so5867966b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2024 00:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717401067; x=1718005867;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZM/qlijRGY09CL6SCWZrPLW5sIErx5xRvS0RDt3tq4s=;
 b=sm0hh4i3DVV7iDxQK+rjyWT98brd3N4bqOfo2NdEhVDsOqhIyjujVyt1YQbSGYisUC
 bKtBXRyxmzUByFW+r+4FGCpfS15AHR4Oe9VMEJG+WFmlxaMD29diCoLP6Ec5Z9xAQPGA
 Xsh5f5/JFmT8BT4asHCjTXLFanpoT1nt6VgH+6+LtDOZ5SdcZJ2TaV5IkOg5mhLT07aA
 KCJpke+c0j/h6IBFb93oMmqYOW3/Yumlei+Rr+wh/Fv6v05/GmJgdIf5K6wI7prQm3o9
 rYz33uG4OG+nSq4dEoPmx2VixatYk2TFf1UYrX/1a3moz+xdgCNOPpYX9ka+UJkZUQU7
 +1rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMXSDYErtNJnNchqQQ53RrZzJgwLd/Df2t9l86g3oHS0Ehxe1MTvt8tmgZ6QQ5Gj0mbP9XoN1BPYu0ysEQCI88Ys/tBmCYlI07UnQUyedR
X-Gm-Message-State: AOJu0YyeA4KoudplyOR5R5TxoHhNIVqT7+60Vdahu5l3HX2bLkKvoByk
 kCXMaF9Ae9g4SEURuMbppbyT8tYhloENdm+Kcgiasv1Edz4qXyraBItnd06aHsFim2KFVl7yFuR
 V3wmNUfVidHwmo7Vsbd8iq6LsNJ0tAthWSg67zR6UyJWY+l15IxgktRLgaa19ChofpN/FVVUVSN
 QyyoPpIPlH8cgib8U3+bxJwmZwU/p2mtJ0buR7aLPBPBXnxn1x
X-Received: by 2002:a50:8e59:0:b0:57a:22aa:51b1 with SMTP id
 4fb4d7f45d1cf-57a3644a33dmr5150140a12.2.1717401067126; 
 Mon, 03 Jun 2024 00:51:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZwivxrSkC/S9Da55sUj850dmd7xFFbsWspH20JfHFqw8jW0FbWF7DUPXO/ifDroooMLXoN/Rm9331EW5vTKk=
X-Received: by 2002:a50:8e59:0:b0:57a:22aa:51b1 with SMTP id
 4fb4d7f45d1cf-57a3644a33dmr5150127a12.2.1717401066459; Mon, 03 Jun 2024
 00:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240601212247.54786-1-egyszeregy@freemail.hu>
 <CACO55tvW7zDRt=ka0w5D8drbJiZFqMFmx=n=PttAjubZJ5zX2Q@mail.gmail.com>
 <bec5f516-211d-4c6e-9204-311d1e31532a@freemail.hu>
In-Reply-To: <bec5f516-211d-4c6e-9204-311d1e31532a@freemail.hu>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 3 Jun 2024 09:50:29 +0200
Message-ID: <CACO55tuOQxQ=BuDj34SXGREE4numtRDFzJY4Qj_Fr0rrLj4ang@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/i2c: rename aux.c and aux.h to nvkm_i2c_aux.c
 and nvkm_i2c_aux.h
To: =?UTF-8?Q?Sz=C5=91ke_Benjamin?= <egyszeregy@freemail.hu>
Cc: bskeggs@redhat.com, lyude@redhat.com, airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

On Sun, Jun 2, 2024 at 1:01=E2=80=AFAM Sz=C5=91ke Benjamin <egyszeregy@free=
mail.hu> wrote:
>
>         s=3D20181004; d=3Dfreemail.hu;
>         h=3DMessage-ID:Date:MIME-Version:Subject:To:Cc:References:From:In=
-Reply-To:Content-Type:Content-Transfer-Encoding;
>         l=3D8472; bh=3Diw0a2TUtlt0KIetu+spJR9WLW1F3MPSfBbxxiBBkhDM=3D;
>         b=3D1oSo+wfGjIoAfhgzfBaxNDoTN0TmXW/jadL52HL5ZAyzWMk15XqSBLjBkAd//=
Bh9
>         u1d+ypo+idz4sTys/CYP5oS8lb8fepRTYBFboPsOAnbHQg6tR0QizBnjyYGq1iMYD=
02
>         GmZWamFVQ/I9kT0XMOMhoKNp1jmr3tFr0iaoS+PqyGv5aNFi6tmiFSJT5fnNaf8/B=
ct
>         XgidaouR1QSqrB6vgHDUjd13+165V+RoCh/CflqZroE132r01M9mxZU5bk4M4uMO3=
8l
>         HwZjS8YTSOmTA49PcLYbh+hr+e+GVFHP+X1wgmd/93wqlySRgqM7N1fh84jucg03I=
MS
>         D/tvbePTzg=3D=3D
> Content-Transfer-Encoding: quoted-printable
>
> 2024. 06. 02. 0:12 keltez=3DC3=3DA9ssel, Karol Herbst =3DC3=3DADrta:
> > On Sat, Jun 1, 2024 at 11:33=3DE2=3D80=3DAFPM <egyszeregy@freemail.hu> =
wrote:
> >>
> >>          s=3D3D20181004; d=3D3Dfreemail.hu;
> >>          h=3D3DFrom:To:Cc:Subject:Date:Message-ID:MIME-Version:Content=
-T=3D
> ype:Content-Transfer-Encoding;
> >>          l=3D3D6462; bh=3D3DCnHSqkRX34kqCWN2/oPtvm9wm8HJCe8QhPwQypdpi3=
w=3D3D=3D
> ;
> >>          b=3D3DJDlDB9yOQDBY7EDnRMrt8qYnWfH8J/LKYKb90434FH1tuOL04za+3TX=
XS=3D
> bU0uvs0
> >>          hWYDYjpbob4XGgUcd1s+lCkerOgDwkpWJWKFW8N5j6WENAKdR/hWJgcma2JED=
=3D
> DotXZ0
> >>          cisYRrLsQBfjyKkBWw0qv/5PDe7vliytix5oP2piBPJC+uR3pN8OKck/+zLBG=
=3D
> lJY4za
> >>          qywwOiMNzHAdyOJT5kCg0yd+k186Oa1jX93iCpiRk5mxJQqJJcAxfW8rYbKRX=
=3D
> i5QQTl
> >>          SymDGdZ72wK5PkHxGgpZ9qXZtFV3eH4+95xNzpoPowMkXFkBy1uMClZzxv1oB=
=3D
> mRo8o6
> >>          CXPcfsWUsQ=3D3D=3D3D
> >> Content-Transfer-Encoding: quoted-printable
> >>
> >> From: Benjamin Sz=3D3DC5=3D3D91ke <egyszeregy@freemail.hu>
> >>
> >> The goal is to clean-up Linux repository from AUX file names, because
> >> the use of such file names is prohibited on other operating systems
> >> such as Windows, so the Linux repository cannot be cloned and
> >> edited on them.
> >>
> >=3D20
> > something went horribly wrong with encoding so the patch is pretty much=
=3D
>  invalid.
> >=3D20
> >> Signed-off-by: Benjamin Sz=3D3DC5=3D3D91ke <egyszeregy@freemail.hu>
> >> ---
> >>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild                  | 2 =
=3D
> +-
> >>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c               | 2 =
=3D
> +-
> >>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c                | 2 =
=3D
> +-
> >>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c              | 2 =
=3D
> +-
> >>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c              | 2 =
=3D
> +-
> >>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c                  | 2 =
=3D
> +-
> >>   .../gpu/drm/nouveau/nvkm/subdev/i2c/{aux.c =3D3D3D> nvkm_i2c_aux.c} =
  =3D
> | 2 +-
> >>   .../gpu/drm/nouveau/nvkm/subdev/i2c/{aux.h =3D3D3D> nvkm_i2c_aux.h} =
  =3D
> | 0
> >>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c                | 2 =
=3D
> +-
> >>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c              | 2 =
=3D
> +-
> >>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c              | 2 =
=3D
> +-
> >>   11 files changed, 10 insertions(+), 10 deletions(-)
> >>   rename drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.c =3D3D3D> nvkm_=
i2=3D
> c_aux.=3D3D
> >> c} (99%)
> >>   rename drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.h =3D3D3D> nvkm_=
i2=3D
> c_aux.=3D3D
> >> h} (100%)
> >>
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild b/drivers/=
=3D
> gpu=3D3D
> >> /drm/nouveau/nvkm/subdev/i2c/Kbuild
> >> index 819703913a00..c488dfce4392 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild
> >> @@ -25,7 +25,7 @@ nvkm-y +=3D3D3D nvkm/subdev/i2c/busnv50.o
> >>   nvkm-y +=3D3D3D nvkm/subdev/i2c/busgf119.o
> >>   nvkm-y +=3D3D3D nvkm/subdev/i2c/bit.o
> >> =3D3D20
> >> -nvkm-y +=3D3D3D nvkm/subdev/i2c/aux.o
> >> +nvkm-y +=3D3D3D nvkm/subdev/i2c/nvkm_i2c_aux.o
> >>   nvkm-y +=3D3D3D nvkm/subdev/i2c/auxg94.o
> >>   nvkm-y +=3D3D3D nvkm/subdev/i2c/auxgf119.o
> >>   nvkm-y +=3D3D3D nvkm/subdev/i2c/auxgm200.o
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c b/drive=
=3D
> rs/=3D3D
> >> gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c
> >> index dd391809fef7..30bf84e77db9 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c
> >> @@ -24,7 +24,7 @@
> >>   #define anx9805_pad(p) container_of((p), struct anx9805_pad, base)
> >>   #define anx9805_bus(p) container_of((p), struct anx9805_bus, base)
> >>   #define anx9805_aux(p) container_of((p), struct anx9805_aux, base)
> >> -#include "aux.h"
> >> +#include "nvkm_i2c_aux.h"
> >>   #include "bus.h"
> >> =3D3D20
> >>   struct anx9805_pad {
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c b/driver=
=3D
> s/g=3D3D
> >> pu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
> >> index 47068f6f9c55..9e07ba444ca8 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
> >> @@ -22,7 +22,7 @@
> >>    * Authors: Ben Skeggs <bskeggs@redhat.com>
> >>    */
> >>   #define g94_i2c_aux(p) container_of((p), struct g94_i2c_aux, base)
> >> -#include "aux.h"
> >> +#include "nvkm_i2c_aux.h"
> >> =3D3D20
> >>   struct g94_i2c_aux {
> >>          struct nvkm_i2c_aux base;
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c b/driv=
=3D
> ers=3D3D
> >> /gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c
> >> index dab40cd8fe3a..8709b728c38b 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c
> >> @@ -19,7 +19,7 @@
> >>    * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE US=
=3D
> E OR
> >>    * OTHER DEALINGS IN THE SOFTWARE.
> >>    */
> >> -#include "aux.h"
> >> +#include "nvkm_i2c_aux.h"
> >> =3D3D20
> >>   static const struct nvkm_i2c_aux_func
> >>   gf119_i2c_aux =3D3D3D {
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c b/driv=
=3D
> ers=3D3D
> >> /gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
> >> index 8bd1d442e465..f40c5709d217 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
> >> @@ -22,7 +22,7 @@
> >>    * Authors: Ben Skeggs <bskeggs@redhat.com>
> >>    */
> >>   #define gm200_i2c_aux(p) container_of((p), struct gm200_i2c_aux, bas=
=3D
> e)
> >> -#include "aux.h"
> >> +#include "nvkm_i2c_aux.h"
> >> =3D3D20
> >>   struct gm200_i2c_aux {
> >>          struct nvkm_i2c_aux base;
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c b/drivers/=
=3D
> gpu=3D3D
> >> /drm/nouveau/nvkm/subdev/i2c/base.c
> >> index 976539de4220..736275f0c774 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> >> @@ -22,7 +22,7 @@
> >>    * Authors: Ben Skeggs
> >>    */
> >>   #include "priv.h"
> >> -#include "aux.h"
> >> +#include "nvkm_i2c_aux.h"
> >>   #include "bus.h"
> >>   #include "pad.h"
> >> =3D3D20
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c b/drivers/g=
=3D
> pu/=3D3D
> >> drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.c
> >> similarity index 99%
> >> rename from drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
> >> rename to drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.c
> >> index d063d0dc13c5..6b76df02c63a 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.c
> >> @@ -24,7 +24,7 @@
> >> =3D3D20
> >>   #include <linux/string_helpers.h>
> >> =3D3D20
> >> -#include "aux.h"
> >> +#include "nvkm_i2c_aux.h"
> >>   #include "pad.h"
> >> =3D3D20
> >>   static int
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.h b/drivers/g=
=3D
> pu/=3D3D
> >> drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.h
> >> similarity index 100%
> >> rename from drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.h
> >> rename to drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.h
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c b/driver=
=3D
> s/g=3D3D
> >> pu/drm/nouveau/nvkm/subdev/i2c/padg94.c
> >> index 5904bc5f2d2a..e9c55a57c878 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c
> >> @@ -22,7 +22,7 @@
> >>    * Authors: Ben Skeggs
> >>    */
> >>   #include "pad.h"
> >> -#include "aux.h"
> >> +#include "nvkm_i2c_aux.h"
> >>   #include "bus.h"
> >> =3D3D20
> >>   void
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c b/driv=
=3D
> ers=3D3D
> >> /gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c
> >> index 3bc4d0310076..1af64e25d838 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c
> >> @@ -22,7 +22,7 @@
> >>    * Authors: Ben Skeggs
> >>    */
> >>   #include "pad.h"
> >> -#include "aux.h"
> >> +#include "nvkm_i2c_aux.h"
> >>   #include "bus.h"
> >> =3D3D20
> >>   static const struct nvkm_i2c_pad_func
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c b/driv=
=3D
> ers=3D3D
> >> /gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c
> >> index 7d417f6a816e..997a5a2146c4 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c
> >> @@ -22,7 +22,7 @@
> >>    * Authors: Ben Skeggs
> >>    */
> >>   #include "pad.h"
> >> -#include "aux.h"
> >> +#include "nvkm_i2c_aux.h"
> >>   #include "bus.h"
> >> =3D3D20
> >>   static void
> >> --=3D3D20
> >> 2.43.0
> >>
> >=3D20
>
> Hi,
>
> This patched is totally fine and visible in "linux-kernel@vger.kernel.org=
=3D
> " list=3D20
> page, so it should not be invalid. Please check your e-mail client SW and=
=3D
>  fix=3D20
> your settings.
>
> https://lore.kernel.org/lkml/20240601212247.54786-1-egyszeregy@freemail.h=
=3D
> u/
> https://lore.kernel.org/lkml/20240601212247.54786-1-egyszeregy@freemail.h=
=3D
> u/raw
>
> kernel test robot used it for a build test successfully, so it has to be =
=3D
> a valid=3D20
> patch.
> https://github.com/intel-lab-lkp/linux/commits/egyszeregy-freemail-hu/drm=
=3D
> -nouveau-i2c-rename-aux-c-and-aux-h-to-nvkm_i2c_aux-c-and-nvkm_i2c_aux-h/=
=3D
> 20240602-053530
>

oh indeed. Looks like a client problem then. Sorry for the noise.

