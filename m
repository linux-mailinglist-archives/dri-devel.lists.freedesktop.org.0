Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB392A80C3B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 15:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA6410E237;
	Tue,  8 Apr 2025 13:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cO6hv0ZM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018A210E237
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 13:28:58 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-2b8e2606a58so2986650fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 06:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744118938; x=1744723738; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/8oL4Wx/LFCNYSj8OeE9r8nBxp3KNb2RWFN4L2fcM5k=;
 b=cO6hv0ZMnk9uIYG9SpKJxDUAGO8L9dcfTAzwi6AaZPwGGHMGanvxe6QtlEuPXEndeK
 Ctcaw5mLKsqSPzr9SqAsYay7jIiP7m0uuExy/aHbAjSqUqLE63RFkZfPuY7c2eSD29pu
 ulyWZQq9bI9azlC2ai6fsD4h3XrjLbhIKJDAkPYaM33GsLsAffrPEugBTZvrYSmt7tQr
 bldRID8jK+N89W0y3RXo2zoDAnxiGDnO1yubc+so2BjzWFcNlTCTeX0tZYkQJqMW8+uk
 UHsP8w1QGTw3iXTOmRzAUFiZgt58HAI+KbfMCchanpsgZ1EtUxik2qWfJJlLdqJC+/Rc
 woPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744118938; x=1744723738;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/8oL4Wx/LFCNYSj8OeE9r8nBxp3KNb2RWFN4L2fcM5k=;
 b=WAR5RQz++gjSAYgyKYWPFsLFU/BFyvprlmIq2GzIfKerEkIRxbHxCZtsc+s+hI+YXB
 HvVaWyhWOuxcpd52OqjgihRxqgAwaXvlH3fw6nUxlKcV5N6KFGZNn5zNEdaz1Jus4x/i
 GzGVOuiBxWnZe6bC5u9YnVRIA+U4G434XpSQXssDVWG9Kt6c/L1PbdJjPCtdP+JBEmOr
 itPgzOi8yg3v+nmX7K7DUVUFSZOMEOdrnxtvuz8N8QfLZd2ipt6YCEEOR0LTp7c7lmDK
 3NWvKCKQhrQrFcSqKmnMIOl5uR0SBDD7yGqfa/KAhx2HWYPhBhTsBkIh6V6ivDlT5UDC
 ybQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUu1ISh6jFM9cMfpY9bpn5KagSNpoPVqnZ8fTp5gHNzzYPFUBHXmzlASHcUablYDFFiNMVf+z8SLQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlkthENvzQSKU387mKtBwyualFdV0PH2HOML4oKVfRfH8dugl2
 zixUyyQ+zc9MqvngmO0YWXUbswcdDIRanpE5XvUSnF+G6QoLZEaswrMa1kwK2gvCZJA50nTqdGe
 J98gC3HWNTvxsC+OyAxg/Pdzbqwj93GDuI2ajuw==
X-Gm-Gg: ASbGnctHOG5gi/9HU4rGaviPHhu0LCNPAc5nMP2w0WmRvnb/Jao9L26mO+G7WaxIsEO
 8L0ePYZQp8FqgWLlP/x8eKBM7r3GjY+hhxQTRyMQCbxPxeTllT7Wz2unQxn9yGFSNsYuRmcp1yw
 14CXpWyyZO0bRBl/N2f0EN2LnEhhw=
X-Google-Smtp-Source: AGHT+IHAG/ejTbg5vA3Vos54fD/tOWqlevkuF4IcqFNjsV/ID7Wtar2qRZ5cZm99uR1FeZB4/PY/aA5SmWOjkV3d+8Q=
X-Received: by 2002:a05:6870:8185:b0:2c2:4eb0:41f3 with SMTP id
 586e51a60fabf-2cc9e50b24emr9010028fac.3.1744118938200; Tue, 08 Apr 2025
 06:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-6-jens.wiklander@linaro.org>
 <Z-JOPgcWlpTlskgd@sumit-X1>
 <CAHUa44GjpHT5Nqo+Ar5jNYNPV-YJQYpLTCf=7oJ1o0VjP-t0nA@mail.gmail.com>
 <Z-ucuPzwz4IqVTgb@sumit-X1>
 <CAHUa44FpsCVrbwj1=nsJVJFVJSF1kzKdWAkAMXRu6EdLrLvh8g@mail.gmail.com>
 <Z_To9V-JOKZ7ChhE@sumit-X1>
In-Reply-To: <Z_To9V-JOKZ7ChhE@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 8 Apr 2025 15:28:45 +0200
X-Gm-Features: ATxdqUHzionenqJkD4YMHdkp7sUKPz9WrHUIS_ghqCFpfmFZzX0EbynUuoPZUrs
Message-ID: <CAHUa44EGWuVPjoxpG-S66he=6dkvkwzxNewaGKVKXUxrO41ztg@mail.gmail.com>
Subject: Re: [PATCH v6 05/10] tee: implement restricted DMA-heap
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
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

On Tue, Apr 8, 2025 at 11:14=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Tue, Apr 01, 2025 at 10:33:04AM +0200, Jens Wiklander wrote:
> > On Tue, Apr 1, 2025 at 9:58=E2=80=AFAM Sumit Garg <sumit.garg@kernel.or=
g> wrote:
> > >
> > > On Tue, Mar 25, 2025 at 11:55:46AM +0100, Jens Wiklander wrote:
> > > > Hi Sumit,
> > > >
> > >
> > > <snip>
> > >
> > > >
> > > > >
> > > > > > +
> > > > > > +#include "tee_private.h"
> > > > > > +
> > > > > > +struct tee_dma_heap {
> > > > > > +     struct dma_heap *heap;
> > > > > > +     enum tee_dma_heap_id id;
> > > > > > +     struct tee_rstmem_pool *pool;
> > > > > > +     struct tee_device *teedev;
> > > > > > +     /* Protects pool and teedev above */
> > > > > > +     struct mutex mu;
> > > > > > +};
> > > > > > +
> > > > > > +struct tee_heap_buffer {
> > > > > > +     struct tee_rstmem_pool *pool;
> > > > > > +     struct tee_device *teedev;
> > > > > > +     size_t size;
> > > > > > +     size_t offs;
> > > > > > +     struct sg_table table;
> > > > > > +};
> > > > > > +
> > > > > > +struct tee_heap_attachment {
> > > > > > +     struct sg_table table;
> > > > > > +     struct device *dev;
> > > > > > +};
> > > > > > +
> > > > > > +struct tee_rstmem_static_pool {
> > > > > > +     struct tee_rstmem_pool pool;
> > > > > > +     struct gen_pool *gen_pool;
> > > > > > +     phys_addr_t pa_base;
> > > > > > +};
> > > > > > +
> > > > > > +#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_DMABUF_HEAPS)
> > > > >
> > > > > Can this dependency rather be better managed via Kconfig?
> > > >
> > > > This was the easiest yet somewhat flexible solution I could find. I=
f
> > > > you have something better, let's use that instead.
> > > >
> > >
> > > --- a/drivers/tee/optee/Kconfig
> > > +++ b/drivers/tee/optee/Kconfig
> > > @@ -5,6 +5,7 @@ config OPTEE
> > >         depends on HAVE_ARM_SMCCC
> > >         depends on MMU
> > >         depends on RPMB || !RPMB
> > > +       select DMABUF_HEAPS
> > >         help
> > >           This implements the OP-TEE Trusted Execution Environment (T=
EE)
> > >           driver.
> >
> > I wanted to avoid that since there are plenty of use cases where
> > DMABUF_HEAPS aren't needed.
>
> Yeah, but how the users will figure out the dependency to enable DMA
> heaps with TEE subsystem.

I hope, without too much difficulty. They are after all looking for a
way to allocate memory from a DMA heap.

> So it's better we provide a generic kernel
> Kconfig which enables all the default features.

I disagree, it should be possible to configure without DMABUF_HEAPS if desi=
red.

>
> > This seems to do the job:
> > +config TEE_DMABUF_HEAP
> > + bool
> > + depends on TEE =3D y && DMABUF_HEAPS
> >
> > We can only use DMABUF_HEAPS if the TEE subsystem is compiled into the =
kernel.
>
> Ah, I see. So we aren't exporting the DMA heaps APIs for TEE subsystem
> to use. We should do that such that there isn't a hard dependency to
> compile them into the kernel.

I was saving that for a later patch set as a later problem. We may
save some time by not doing it now.

Cheers,
Jens

>
> -Sumit
>
> >
> > Cheers,
> > Jens
