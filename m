Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 179BD90D91D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 18:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E8A10E184;
	Tue, 18 Jun 2024 16:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="xoduviuH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2E110E184
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 16:24:05 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-5ba70a0ed75so2879732eaf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 09:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1718727844; x=1719332644;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=y2L36ZkKRa2ldLn+cK6LBceBfGVZn+/Ml/80DU+Rz8Y=;
 b=xoduviuHc/Uule/bx/CG5Tw1379g2H+btl2JkTk/ljhCqr4AEiZR6wah40bP//C5iY
 +kl5/bM7VTJVz5SXUiWO25L1jNUGs3UWmRK39kHHgVN2ZJu5VhJJjm9nSqGpTwj3hZRd
 QwJ5OizEOjox/+AXfUJQTOE6B8c5n+ZAMlQx5atlZyng2gwyHjEmZzRkfr+3rTcBFPRD
 V/vCfFyprToOwCMdNeCvurhB5sN+oTwXMHmpYtpDAsnP/nI3zKAmsD4m9SiW/8g6Z9/h
 xIb8/OTgsr1hD2b5YghOemmFfu9oiMkg4fTN63njZJyr2AmxOjLU2OEBTX2dD6bpwcBY
 VZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718727844; x=1719332644;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y2L36ZkKRa2ldLn+cK6LBceBfGVZn+/Ml/80DU+Rz8Y=;
 b=BCaBnOu0KYRvGX07RMWsLjLARh9SDvcl2r43w5MfgDenprQm0b8B55UlXZkOLdvZHJ
 /8mJ4pNaW1oKdbkFSZF5Bqr4qHm5unRm/Cn0gsmk5Pr+rH43UqB2636OmpJQ4N3pvoRH
 YjxyvfJNQFuSO7qXfCrDASQxfVYvRNIF6mbkmqawznDmP/z2SK8aDqtRSVQ3OA4gamrb
 +cuPVoJx5g9OJ+a++YLXC1p/DOt9KvndojCJEM+PUHxCgQq5elpYwWI2NbdCVZh6v4bn
 4cAV7bW73UqnGAy1lFtQm9i1Q5h9S1ZNQB1biZUswc48tiU58m/N+k2HOWJY2QuHOK9Z
 /fHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKhAA1zjm+QqJjKfVcc30y3PvTfOujSZu/0iQgDoP4mOaSuPM74hZxgCWdiQM5xNHbMdObV9on37V7Q2z9kcLLqxa48QZeKPmH0O8qKUwi
X-Gm-Message-State: AOJu0YyhJkeVHLEbQfUghFpwwG0wGQFdKMS+NkWZVEx7f4dGWd0Zvl6w
 8yuiSBD54U2iYX5FZGe2JLgwk9K0mS+Huf4ypXL/reBZP0Tiysb1kwlLedU9x40=
X-Google-Smtp-Source: AGHT+IFJbrVxZSy5MW1kEWYhiDGt9QvD0Fml+npOhQgHsfa3dm06eYcugngrvjSxbWiA5O9MHgS/Zg==
X-Received: by 2002:a05:6359:5fa9:b0:1a0:d4b4:5eb5 with SMTP id
 e5c5f4694b2df-1a1fd59877dmr34733855d.28.1718727844503; 
 Tue, 18 Jun 2024 09:24:04 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:5fb9::7a9])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798abe279c0sm532234285a.110.2024.06.18.09.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 09:24:04 -0700 (PDT)
Message-ID: <036bf0d7f657cae444d20ea6d279b47e3bf0164e.camel@ndufresne.ca>
Subject: Re: [PATCH] media: videobuf2: sync caches for dmabuf memory
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Tomasz Figa <tfiga@chromium.org>, TaoJiang <tao.jiang_2@nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org, 
 robh+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com,
 eagle.zhou@nxp.com,  ming.qian@oss.nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org,  linux-kernel@vger.kernel.org,
 m.szyprowski@samsung.com, sumit.semwal@linaro.org, 
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Ming Qian <ming.qian@nxp.com>
Date: Tue, 18 Jun 2024 12:24:03 -0400
In-Reply-To: <CAAFQd5B_RTHsMwMdD59RAAyFne_0Ok_A4ExdkVOgi=G6-UGfRQ@mail.gmail.com>
References: <20240618073004.3420436-1-tao.jiang_2@nxp.com>
 <CAAFQd5B_RTHsMwMdD59RAAyFne_0Ok_A4ExdkVOgi=G6-UGfRQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
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

Le mardi 18 juin 2024 =C3=A0 16:47 +0900, Tomasz Figa a =C3=A9crit=C2=A0:
> Hi TaoJiang,
>=20
> On Tue, Jun 18, 2024 at 4:30=E2=80=AFPM TaoJiang <tao.jiang_2@nxp.com> wr=
ote:
> >=20
> > From: Ming Qian <ming.qian@nxp.com>
> >=20
> > When the memory type is VB2_MEMORY_DMABUF, the v4l2 device can't know
> > whether the dma buffer is coherent or synchronized.
> >=20
> > The videobuf2-core will skip cache syncs as it think the DMA exporter
> > should take care of cache syncs
> >=20
> > But in fact it's likely that the client doesn't
> > synchronize the dma buf before qbuf() or after dqbuf(). and it's
> > difficult to find this type of error directly.
> >=20
> > I think it's helpful that videobuf2-core can call
> > dma_buf_end_cpu_access() and dma_buf_begin_cpu_access() to handle the
> > cache syncs.
> >=20
> > Signed-off-by: Ming Qian <ming.qian@nxp.com>
> > Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
> > ---
> >  .../media/common/videobuf2/videobuf2-core.c   | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >=20
>=20
> Sorry, that patch is incorrect. I believe you're misunderstanding the
> way DMA-buf buffers should be managed in the userspace. It's the
> userspace responsibility to call the DMA_BUF_IOCTL_SYNC ioctl [1] to
> signal start and end of CPU access to the kernel and imply necessary
> cache synchronization.
>=20
> [1] https://docs.kernel.org/driver-api/dma-buf.html#dma-buffer-ioctls
>=20
> So, really sorry, but it's a NAK.



This patch *could* make sense if it was inside UVC Driver as an example, as=
 this
driver can import dmabuf, to CPU memcpy, and does omits the required sync c=
alls
(unless that got added recently, I can easily have missed it).

But generally speaking, bracketing all driver with CPU access synchronizati=
on
does not make sense indeed, so I second the rejection.

Nicolas

>=20
> Best regards,
> Tomasz
>=20
> > diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/=
media/common/videobuf2/videobuf2-core.c
> > index 358f1fe42975..4734ff9cf3ce 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-core.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> > @@ -340,6 +340,17 @@ static void __vb2_buf_mem_prepare(struct vb2_buffe=
r *vb)
> >         vb->synced =3D 1;
> >         for (plane =3D 0; plane < vb->num_planes; ++plane)
> >                 call_void_memop(vb, prepare, vb->planes[plane].mem_priv=
);
> > +
> > +       if (vb->memory !=3D VB2_MEMORY_DMABUF)
> > +               return;
> > +       for (plane =3D 0; plane < vb->num_planes; ++plane) {
> > +               struct dma_buf *dbuf =3D vb->planes[plane].dbuf;
> > +
> > +               if (!dbuf)
> > +                       continue;
> > +
> > +               dma_buf_end_cpu_access(dbuf, vb->vb2_queue->dma_dir);
> > +       }
> >  }
> >=20
> >  /*
> > @@ -356,6 +367,17 @@ static void __vb2_buf_mem_finish(struct vb2_buffer=
 *vb)
> >         vb->synced =3D 0;
> >         for (plane =3D 0; plane < vb->num_planes; ++plane)
> >                 call_void_memop(vb, finish, vb->planes[plane].mem_priv)=
;
> > +
> > +       if (vb->memory !=3D VB2_MEMORY_DMABUF)
> > +               return;
> > +       for (plane =3D 0; plane < vb->num_planes; ++plane) {
> > +               struct dma_buf *dbuf =3D vb->planes[plane].dbuf;
> > +
> > +               if (!dbuf)
> > +                       continue;
> > +
> > +               dma_buf_begin_cpu_access(dbuf, vb->vb2_queue->dma_dir);
> > +       }
> >  }
> >=20
> >  /*
> > --
> > 2.43.0-rc1
> >=20

