Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C79269E3F6E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 17:15:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F69810E4E8;
	Wed,  4 Dec 2024 16:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="xDkmFoYo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF3C10E4E8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 16:15:48 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5d0aab1aafcso9708a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 08:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733328947; x=1733933747;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1rHO2R+e0I6TJZIXYLQBQq322w6i2QrZ0HFp2Dkg6e0=;
 b=xDkmFoYoohpXSK138zalBkGDJp3NoupobJYX9HhOILI7biewx+toroAl+Cjco8fomk
 HorlSbO6iHlTn9NDWiMPMEG4RaafVM8ReRMebKs85IYTcN3yLv2tIqC+VA5qlT4hgOlY
 5CPPUEQS8IWaGmk/EjVAAa+i9ywB85HvLplX0z1tS83Inu7RNe/lLrHAY20YTf3AF9JH
 nNtL1ZGte/sf3XCX702bC0mWdktxDoL39LX5Zg7/irbaBbEcxOnsLNXrnZAl/LPNjVVB
 58RUijluh+Q0jAnY9W3ixjiOBo0Aa+WRaoo81naT5Ey2DoiYdpLbxB5iPmZ5T6evIEyW
 3pqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733328947; x=1733933747;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1rHO2R+e0I6TJZIXYLQBQq322w6i2QrZ0HFp2Dkg6e0=;
 b=rFJH2/xs5y8b61vXa+RpuqdJol4k0k/Kszibg6xtAMVV/8ycXK1A3e9XLeszkyBKTc
 fp4LRGjn9H8c6htGaZ0QgJMXCbn0Vz07l6ZOjSUv38T0OW37WbYrRy9VP9m6ntFYTCwQ
 qUj+7lGqNSnmMaHrk0oJXUSXVadsLl6G1GpC1323k9ABDYumYMcy0kZu/jg8DXasDvPq
 YPF6tpGmJC/x5Xg0QPRLzKqvVnfmla5IAvSbivdi16dgUe8o55RCLo6EWBG2roPRJ/tH
 RNtAnG2r09aZeHIFP9fnaCua0JKbEGxRyYxFyNW24GbuAh+xrlikR6WKSIsr52ygDFqm
 OJsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCJBx6h0anE9gWzakTUqaGCJ7WPFB+F5EOqelbjiVfqZkCbj8hCPXohI7X5mHLEG48+VxSVRx1zSU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx87GF5WF6bObuVCUspE6Cvh07x2cJCjrd73FSKAyo3eTXBWeCw
 OtIHcinOi41hIGJmS7+vE//b/CtOI235SJ9wblIU8SJCVMNiUzzAlj4BSvb+MOtyfH5aTrHBeek
 RHQCaay62swAehQDDr1HWIeRtufsm8nQZpK4F
X-Gm-Gg: ASbGncu6s38+HMJ1lAksqr6EnNA5GDuliWSMm/z70nkx7u2aLwziEqhawVweHvFsyff
 WSGZ14KU2VqAwxMSZCUfRxxZ72ocEMyr2urZBmBnBbQ1351vA5pBefdlZC5A=
X-Google-Smtp-Source: AGHT+IH+tsX9V69opZ/sve8O/AoKYFLP1rqwva7AFm68u1eQU6ovRCfm8nXse/vPk2lxbhPEkYsTf77IKlmuGhob8wk=
X-Received: by 2002:a05:6402:1bdc:b0:5d0:b501:fc77 with SMTP id
 4fb4d7f45d1cf-5d118ee38b2mr89054a12.5.1733328946220; Wed, 04 Dec 2024
 08:15:46 -0800 (PST)
MIME-Version: 1.0
References: <20241203-udmabuf-fixes-v1-0-f99281c345aa@google.com>
 <20241203-udmabuf-fixes-v1-3-f99281c345aa@google.com>
 <IA0PR11MB7185D54AD6BB8067EAA6AE8EF8372@IA0PR11MB7185.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7185D54AD6BB8067EAA6AE8EF8372@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 4 Dec 2024 17:15:10 +0100
Message-ID: <CAG48ez3pVzBFTb6uX47fps8mZp3TaRWPcLaKvQwREUKVApd02A@mail.gmail.com>
Subject: Re: [PATCH 3/3] udmabuf: fix memory leak on last export_udmabuf()
 error path
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>, 
 "Joel Fernandes (Google)" <joel@joelfernandes.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Wed, Dec 4, 2024 at 10:14=E2=80=AFAM Kasireddy, Vivek
<vivek.kasireddy@intel.com> wrote:
> > Subject: [PATCH 3/3] udmabuf: fix memory leak on last export_udmabuf()
> > error path
> >
> > In export_udmabuf(), if dma_buf_fd() fails because the FD table is full=
, a
> > dma_buf owning the udmabuf has already been created; but the error
> > handling
> > in udmabuf_create() will tear down the udmabuf without doing anything
> > about
> > the containing dma_buf.
> >
> > This leaves a dma_buf in memory that contains a dangling pointer; thoug=
h
> > that doesn't seem to lead to anything bad except a memory leak.
> >
> > Fix it by moving the dma_buf_fd() call out of export_udmabuf() so that =
we
> > can give it different error handling.
> >
> > Note that the shape of this code changed a lot in commit 5e72b2b41a21
> > ("udmabuf: convert udmabuf driver to use folios"); but the memory leak
> > seems to have existed since the introduction of udmabuf.
> >
> > Fixes: fbb0de795078 ("Add udmabuf misc device")
> > Signed-off-by: Jann Horn <jannh@google.com>
[...]
> > @@ -330,11 +329,7 @@ static int export_udmabuf(struct udmabuf *ubuf,
> >       exp_info.priv =3D ubuf;
> >       exp_info.flags =3D O_RDWR;
> >
> > -     buf =3D dma_buf_export(&exp_info);
> > -     if (IS_ERR(buf))
> > -             return PTR_ERR(buf);
> > -
> > -     return dma_buf_fd(buf, flags);
> flags is now unused in this function.

Ack, will remove in v2.

> > +     return dma_buf_export(&exp_info);
> >  }
> >
> >  static long udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memf=
d,
> > @@ -391,6 +386,7 @@ static long udmabuf_create(struct miscdevice
> > *device,
> >       struct folio **folios =3D NULL;
> >       pgoff_t pgcnt =3D 0, pglimit;
> >       struct udmabuf *ubuf;
> > +     struct dma_buf *dmabuf;
> >       long ret =3D -EINVAL;
> >       u32 i, flags;
> >
> > @@ -451,9 +447,16 @@ static long udmabuf_create(struct miscdevice
> > *device,
> >       }
> >
> >       flags =3D head->flags & UDMABUF_FLAGS_CLOEXEC ? O_CLOEXEC : 0;
> > -     ret =3D export_udmabuf(ubuf, device, flags);
> > -     if (ret < 0)
> > +     dmabuf =3D export_udmabuf(ubuf, device, flags);
> > +     if (IS_ERR(dmabuf)) {
> > +             ret =3D PTR_ERR(dmabuf);
> >               goto err;
> > +     }
> > +     /* ownership of ubuf is held by the dmabuf from here */
> Please also add a comment here that says that if dma_buf_fd() fails,
> then calling dma_buf_put() will enable cleanup to be done via release().

Ack, added in v2.

> With that,
>
> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

Thanks!
