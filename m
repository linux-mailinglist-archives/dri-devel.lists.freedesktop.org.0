Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4499E3F3E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 17:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE2210E4EC;
	Wed,  4 Dec 2024 16:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="4v9VDKLu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D21B10E4F9
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 16:08:44 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5d1228d66a0so2699a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 08:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733328523; x=1733933323;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mnMUx5ZxepC8/TuU6UxU43komWhGup4ZMyqTd2FagEE=;
 b=4v9VDKLu0odpUsRYTZwbpHvMx7nIdB5cOuSJPssHhDe1gyEn3Yl2XKi2/xUXNTKbiK
 2937OeGLyJl7TLsBdCwB70Gih376r7sd8tHsvEwPgJWAye3gWsBXTkBEeoitTD22Scif
 u625xjvqI2JnWflhkK6bih4TISqsZq54AOdGtRf5kD2RB8DKHWIcux/0J4Ji9eaweDH0
 CfPVwFKXlX/WbBGTv131VX3j7hkQa8mkTflkchnUyBfvFiNBz/ljjQ4YLkzahsYaPqG4
 a95yqqIJuqvA4awficTTJd38QJ7Gni0P8K2PmJ1Fpw1nMVmKrLgeyuJ4dODqf7qySziv
 Ye8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733328523; x=1733933323;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mnMUx5ZxepC8/TuU6UxU43komWhGup4ZMyqTd2FagEE=;
 b=kM6gClf46ATv9foI/9g2zb3lB+ptafihOBvaYzmyq+FWMhNut2+3NcQ8atU8sI0wkd
 n9rk6XMiDKC4wC0dh6s/K7dfYyKVaw69GL/fMstKQH+nSpt3Da7GOTrL2l1XjeWj2I+m
 BKLYhZvV8MLjpsjrZnx47Om1lQm3WQEU9SgfS4skQmxlYKmJohWWGXP2byfqm/yVUvQk
 xV4GtoTOIcNKPgliQ0Il3KRGPqiusoP7AMzKSaW2GWiKmiPvZaDd1nmu5RTQ/5qbqh6N
 zqv5PFp/0rYj+QR981gMGUi5FSB5imLIWggktyoNGxXj1ykDYi89eIO27oqOSAIRqzgT
 rzeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEEm0o+ZbLNRMdw+J5wNhISBAbT5sd+6z7pKd5adOvX4G7PJe3+OqcmCJugQNuSq6NEEEtzff+ktg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzK20KyYN+YLH4dv8cHHo2G3hHrpL5ezjqV8wwyMTaCgNmxLhJP
 Bipm4EMr1FnQ7ESB+j9iaMNrD0w1+ywx5hINr6jApfiCIUMZ0D6Zw59Oa8lci1MpfvvLtilMC/6
 FLI0EmDketJGAErGUwrGAmEsFwpc84w++RUTd
X-Gm-Gg: ASbGncs259sd6hM20LTbGmfAQNHDwBwtmvzdOSFlZyuNNAyvdC8BkKYLMpY6sZjtpFV
 rFvyyD3PcYayn5whaaXsusCYMDzvRMInXSGLz38GxCTf+0yZVdAEX+/Onftc=
X-Google-Smtp-Source: AGHT+IFosrGSGc6Y1n5WPmV+g9HhEBiIwlEUrd3FP6QrHjGIXnaUTQYm3ZtZGZUztGRrGfdimPyGzebvo7kNc013Nzo=
X-Received: by 2002:a50:cdde:0:b0:5d0:eb21:264d with SMTP id
 4fb4d7f45d1cf-5d118ec95a2mr76865a12.1.1733328522131; Wed, 04 Dec 2024
 08:08:42 -0800 (PST)
MIME-Version: 1.0
References: <20241203-udmabuf-fixes-v1-0-f99281c345aa@google.com>
 <20241203-udmabuf-fixes-v1-1-f99281c345aa@google.com>
 <IA0PR11MB7185EFC7E59546204A617DE9F8372@IA0PR11MB7185.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7185EFC7E59546204A617DE9F8372@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 4 Dec 2024 17:08:06 +0100
Message-ID: <CAG48ez0VJr=nuWciFZPLgUFOVca=Sac+4-_8Amqorv9WsBF6vQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] udmabuf: fix racy memfd sealing check
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, John Stultz <john.stultz@linaro.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Joel Fernandes (Google)" <joel@joelfernandes.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Julian Orth <ju.orth@gmail.com>, 
 "stable@vger.kernel.org" <stable@vger.kernel.org>
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

On Wed, Dec 4, 2024 at 10:09=E2=80=AFAM Kasireddy, Vivek
<vivek.kasireddy@intel.com> wrote:
> > Subject: [PATCH 1/3] udmabuf: fix racy memfd sealing check
> >
> > The current check_memfd_seals() is racy: Since we first do
> > check_memfd_seals() and then udmabuf_pin_folios() without holding any
> > relevant lock across both, F_SEAL_WRITE can be set in between.
> > This is problematic because we can end up holding pins to pages in a
> > write-sealed memfd.
> >
> > Fix it using the inode lock, that's probably the easiest way.
> > In the future, we might want to consider moving this logic into memfd,
> > especially if anyone else wants to use memfd_pin_folios().
> >
> > Reported-by: Julian Orth <ju.orth@gmail.com>
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D219106
> > Closes:
> > https://lore.kernel.org/r/CAG48ez0w8HrFEZtJkfmkVKFDhE5aP7nz=3DobrimeTg
> > pD+StkV9w@mail.gmail.com
> > Fixes: fbb0de795078 ("Add udmabuf misc device")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jann Horn <jannh@google.com>
> > ---
> >  drivers/dma-buf/udmabuf.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> > index
> > 8ce1f074c2d32a0a9f59ff7184359e37d56548c6..662b9a26e06668bf59ab36d0
> > 7c0648c7b02ee5ae 100644
> > --- a/drivers/dma-buf/udmabuf.c
> > +++ b/drivers/dma-buf/udmabuf.c
> > @@ -436,14 +436,15 @@ static long udmabuf_create(struct miscdevice
> > *device,
> >                       goto err;
> >               }
> >
> > +             inode_lock_shared(memfd->f_inode);
> I think having inode_lock_shared(file_inode(memfd)) looks a bit more clea=
ner.

Good idea, changed that.

> Also, wouldn't it be more appropriate here to take the writer's lock inst=
ead
> of the reader's lock given what we are doing (pinning) in udmabuf_create(=
)?

I don't see why that would require taking the inode lock in write
mode. I am taking the inode lock to provide exclusion against
memfd_add_seals(), which uses inode_lock(); in other words, the
inode_lock is to protect the sealing status of the file from changing
(which is a reader-like requirement). I'll add a comment in v2 to
clarify this.
