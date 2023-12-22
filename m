Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC8681C6FB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 09:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E4510E758;
	Fri, 22 Dec 2023 08:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF27810E758
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 08:58:30 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40c6736d10fso20033515e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 00:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703235509; x=1703840309; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cI35bX0Nhe6pNuZytaRMQzlreBpUdOzZVZdkSiKR318=;
 b=Oani0ZTP5+KYIU1G+f1AXtwyHGRbtkL77LItbyLoUh3BeWXqmcKW3DEwKC+PjsfmAn
 /6rmryaHrnruTVThSB+tnnd7r89bfMVQrz/S839Yi+2ePMAR0yqZWj6j1C6D3JsB9kln
 h/zf4t5lbY46BRZTu0/FriF1tRB/MMSGdK3mSO0umzdm8dUhtevSlMIhMbuE2SIAnZOi
 FSzmKo4Fnyzo9Mg8Ij40i50Omi0K07OsJmnxsH4hoEahe8M1Zzl7J2q0OVh7sEYTs6D1
 06TV/Fv7EouZhDI3x2vz2Tk8sSu3Rl3OHcM6lX9YpcDaYkTqYTcKLIUQbE7huP36wRW0
 nSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703235509; x=1703840309;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cI35bX0Nhe6pNuZytaRMQzlreBpUdOzZVZdkSiKR318=;
 b=paTRKrWkb7DUAvTZT5o+FqYH5DM1uojeOw3hb+yRX9afNps3bf0X8BOQk5TrRglYUE
 RXICfBFlBl9xlcRIS3NBBfHa/CZr0F+FK3DK2Sk/5gfz9Ma0DsT7eFhGTjRLNJJPbp5K
 H9MfVzZqRXry4DQo6Tj8vqvPmiUDR4IVcN0hzIMZ8t9sedoOqsIlcWtVSF8C8jkCSPKq
 CGuD8lhKLXk+SbEtwpKErDp661Zh/Qb6Pjo5CkFRhjznz4vkjfStt7dYUCij8JFA/hga
 KF8we5/6PGhtGkrM1F1dhO8heVhMMX9PZjhJflu4OH60GtDGH2HZSynoQDcQoJqhaMCT
 0m5A==
X-Gm-Message-State: AOJu0Ywnq7czjh2cYjSWEQr2yj9CjED5OXea5mMpn/zrfOI2/FDTbQsh
 Xej73MWjBeclS29gwPaZzXo=
X-Google-Smtp-Source: AGHT+IHxUXolvNOrzYP2sehmaGu4dpOV/paRm80lFYTwBFEv14pGkL6zMlGQe6zd/u5nBBYzi0u5pA==
X-Received: by 2002:a05:600c:3d0f:b0:40d:43cf:275d with SMTP id
 bh15-20020a05600c3d0f00b0040d43cf275dmr535638wmb.95.1703235508788; 
 Fri, 22 Dec 2023 00:58:28 -0800 (PST)
Received: from ?IPv6:2001:818:ea8e:7f00:5877:261e:1d6d:8696?
 ([2001:818:ea8e:7f00:5877:261e:1d6d:8696])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c350700b0040d2e37c06dsm6120316wmq.20.2023.12.22.00.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 00:58:28 -0800 (PST)
Message-ID: <277071605eb355912972a30b07ecead7d70efe25.camel@gmail.com>
Subject: Re: [PATCH v5 7/8] iio: buffer-dmaengine: Support new DMABUF based
 userspace API
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, Jonathan Cameron <jic23@kernel.org>
Date: Fri, 22 Dec 2023 09:58:29 +0100
In-Reply-To: <2da3fb55384a222868f90562be9e1e2ca55ec1c3.camel@crapouillou.net>
References: <20231219175009.65482-1-paul@crapouillou.net>
 <20231219175009.65482-8-paul@crapouillou.net>
 <20231221161258.056f5ce4@jic23-huawei>
 <2da3fb55384a222868f90562be9e1e2ca55ec1c3.camel@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2023-12-21 at 18:30 +0100, Paul Cercueil wrote:
> Hi Jonathan,
>=20
> Le jeudi 21 d=C3=A9cembre 2023 =C3=A0 16:12 +0000, Jonathan Cameron a =C3=
=A9crit=C2=A0:
> > On Tue, 19 Dec 2023 18:50:08 +0100
> > Paul Cercueil <paul@crapouillou.net> wrote:
> >=20
> > > Use the functions provided by the buffer-dma core to implement the
> > > DMABUF userspace API in the buffer-dmaengine IIO buffer
> > > implementation.
> > >=20
> > > Since we want to be able to transfer an arbitrary number of bytes
> > > and
> > > not necesarily the full DMABUF, the associated scatterlist is
> > > converted
> > > to an array of DMA addresses + lengths, which is then passed to
> > > dmaengine_prep_slave_dma_array().
> > >=20
> > > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > One question inline. Otherwise looks fine to me.
> >=20
> > J
> > >=20
> > > ---
> > > v3: Use the new dmaengine_prep_slave_dma_array(), and adapt the
> > > code to
> > > =C2=A0=C2=A0=C2=A0 work with the new functions introduced in industri=
alio-buffer-
> > > dma.c.
> > >=20
> > > v5: - Use the new dmaengine_prep_slave_dma_vec().
> > > =C2=A0=C2=A0=C2=A0 - Restrict to input buffers, since output buffers =
are not yet
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 supported by IIO buffers.
> > > ---
> > > =C2=A0.../buffer/industrialio-buffer-dmaengine.c=C2=A0=C2=A0=C2=A0 | =
52
> > > ++++++++++++++++---
> > > =C2=A01 file changed, 46 insertions(+), 6 deletions(-)
> > >=20
> > > diff --git a/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> > > b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> > > index 5f85ba38e6f6..825d76a24a67 100644
> > > --- a/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> > > +++ b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> > > @@ -64,15 +64,51 @@ static int
> > > iio_dmaengine_buffer_submit_block(struct iio_dma_buffer_queue
> > > *queue,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct dmaengine_buff=
er *dmaengine_buffer =3D
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0iio_buffer_to_dmaengine_buffer(&queue->buffer);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct dma_async_tx_d=
escriptor *desc;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int i, nents;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct scatterlist *sgl;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct dma_vec *vecs;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0size_t max_size;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_cookie_t cookie;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0size_t len_total;
> > > =C2=A0
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0block->bytes_used =3D min(=
block->size, dmaengine_buffer-
> > > > max_size);
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0block->bytes_used =3D roun=
d_down(block->bytes_used,
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma=
engine_buffer->align);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (queue->buffer.directio=
n !=3D IIO_BUFFER_DIRECTION_IN) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0/* We do not yet support output buffers. */
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > =C2=A0
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0desc =3D dmaengine_prep_sl=
ave_single(dmaengine_buffer->chan,
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0block->phys_addr, block->bytes_used,
> > > DMA_DEV_TO_MEM,
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0DMA_PREP_INTERRUPT);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (block->sg_table) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0sgl =3D block->sg_table->sgl;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0nents =3D sg_nents_for_len(sgl, block->bytes_used);
> >=20
> > Are we guaranteed the length in the sglist is enough?=C2=A0 If not this
> > can return an error code.
>=20
> The length of the sglist will always be enough, the
> iio_buffer_enqueue_dmabuf() function already checks that block-
> > bytes_used is equal or smaller than the size of the DMABUF.
>=20
> It is quite a few functions above in the call stack though, so I can
> handle the errors of sg_nents_for_len() here if you think makes sense.

Maybe putting something like the above in a comment?

- Nuno S=C3=A1


