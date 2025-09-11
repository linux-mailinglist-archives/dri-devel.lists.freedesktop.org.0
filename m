Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2485EB52BC1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 10:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D793C10EA41;
	Thu, 11 Sep 2025 08:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t4W7ND1S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C705E10EA41
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 08:35:07 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-7459fa1ef2aso486833a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 01:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757579707; x=1758184507; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X3kQgAiwPfvEAAOGUV7iUTri/K2HtvbKjHs1xtQRX0U=;
 b=t4W7ND1SrF21DexEGbXVv4kmfuWM73JYFpaDW/JqQ6tJcvblcn40AHL0FacZJOySyq
 nMwKVx7kpVLdJ2nVO+aEqC2NM3HrPU999aq4d5rspTRLgQbcjCsjjoYjwEK9TYLzDf39
 v5/tFQxcVlR8L5ybEJI6sbIAQ7bFBFVFn4bCRYjWfp0xWtor0RM77mXjjK8LNiO0rlrM
 Z1ydJuUW9zFxqYxEHqnlhONbCPomDqEUV4HWbJOUHP1/PCDCcK+g6Yxd3s3GRx6QeSj/
 jizgdzv4UssNU6B9SgWVy2VWJBA5DN/q2GSbWgbl5yEJ8EU5Gg5Vex6WXIAQ93gZ1v01
 Zjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757579707; x=1758184507;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X3kQgAiwPfvEAAOGUV7iUTri/K2HtvbKjHs1xtQRX0U=;
 b=CytyGMoSx8KI8FIcuXKasbt33svnr50tQiFmMs3eXdH2diKK3Xyh8Biek0ZKlPZ88+
 h79aj2AoDIU4BjD2C1k2JU8MTbDnK+YstRafRfzZbBPYDee9wa4NfFgYHkwuHGU6id8A
 0DGP+XAHYkbVAD9vOeQckreVod2w3tB78vIS2BA/+87s4BgU2DsR+BPR4awbrA0435WK
 GQwIdPS7B/Vf2KQNGoIoCaZlRX4HHm2t4V91AEJdqhF9BKDaFqLF086od+r2UCkm8ZYn
 QsRRyvsuz1VHNko792vg0KRK+gVjVJzwswX6fYlM2Qa2UdqHSSWFWlIIU3WTdw8NbROL
 cAUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU66zGRzcLtCj40bN70seer3MP8TVYyVwzWJv2J/7Ck4wlsE2reioIVLwgyguteZJe7XaBRgGc0j9I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvKOLcfCjWnIXiBB0LAegi7yBY4xBGs6TUN6YDTQDh7tv/aQ/N
 ERaso+Rq2Fu01uGUJkTAw7uayWc8DEibOtpjwgtJOJ1H7ooru9piQKMYSA9nY5u5dmbBRAbm6qz
 1u/RUKbJrFPtChtcVM4/nJvGTwfJK4Kjxz1ZNGCNmfA==
X-Gm-Gg: ASbGncscgyVjXOQqFw4LDYd0Kdd57Ns4Tcp9iyHllO6dWuTK5SeNe2/EmNmkFZsB5CC
 SYfaGx36vNy7R++/Cw7IdFMdbKXWvCLDvaJ2rINxVlWHKjba2i3roKOkzGHa/8tQ6wA+wxXOzj6
 GljNNcl9bFw3qt4bOoNXcIu2larnWKhzvAa4U5xysAsZb5r9pTUDyR0rNE+ch2UjHiY4b3f1hnx
 uAcZe2u6p3qgH/IQ04=
X-Google-Smtp-Source: AGHT+IFeh9GhwJV0/BRbDqXK1301VOv+yaAADE4wRS2wEzztzMHQXFq1Ue2WE8k5BTs1i0e0aU2GdBSeES8eqZ6R/tc=
X-Received: by 2002:a05:6830:348e:b0:74b:3422:f33d with SMTP id
 46e09a7af769-74c66acfea9mr10389569a34.0.1757579706886; Thu, 11 Sep 2025
 01:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
 <20250813060339.2977604-3-jens.wiklander@linaro.org>
 <aJ1-YpgvGt4_6CFU@sumit-X1>
 <CABdmKX2FPg+hO55qWndMajuWP0kZH=OWEh9v-d8aO6HQWyxJtQ@mail.gmail.com>
 <CAO_48GEqkf_Jm8kSTPEDZkZy-YmT56Zs1Jx9zCvzETPsCzrkEg@mail.gmail.com>
 <CAHUa44HHSKwiBYPMSY5hj6wyWc9-uvtQVx+JLx4M5yjD5AwyTg@mail.gmail.com>
 <CAO_48GE=FHaNzybUxjY=igyOO1oasKb9yu_yAjJEdjTQXicaJA@mail.gmail.com>
In-Reply-To: <CAO_48GE=FHaNzybUxjY=igyOO1oasKb9yu_yAjJEdjTQXicaJA@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 11 Sep 2025 10:34:53 +0200
X-Gm-Features: Ac12FXx5ebSInGSvpsrj2pSWY8lp7qtZdsTImt4o0DLikSjOCGD4PzhkPWZzq-g
Message-ID: <CAHUa44HkMNO1ONTGEKHCPXRQwg3zqYf5ZHmxEijW==vbmd1LFw@mail.gmail.com>
Subject: Re: [PATCH v11 2/9] dma-buf: dma-heap: export declared functions
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "T.J. Mercier" <tjmercier@google.com>, Sumit Garg <sumit.garg@kernel.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, 
 Sumit Garg <sumit.garg@oss.qualcomm.com>
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

Hi,

On Thu, Sep 11, 2025 at 10:00=E2=80=AFAM Sumit Semwal <sumit.semwal@linaro.=
org> wrote:
>
> Hi Jens,
>
> On Thu, 11 Sept 2025 at 13:20, Jens Wiklander <jens.wiklander@linaro.org>=
 wrote:
> >
> > Hi Sumit,
> >
> > On Thu, Sep 11, 2025 at 9:15=E2=80=AFAM Sumit Semwal <sumit.semwal@lina=
ro.org> wrote:
> > >
> > > Hello Jens,
> > >
> > > On Fri, 15 Aug 2025 at 05:00, T.J. Mercier <tjmercier@google.com> wro=
te:
> > > >
> > > > On Wed, Aug 13, 2025 at 11:13=E2=80=AFPM Sumit Garg <sumit.garg@ker=
nel.org> wrote:
> > > > >
> > > > > On Wed, Aug 13, 2025 at 08:02:51AM +0200, Jens Wiklander wrote:
> > > > > > Export the dma-buf heap functions to allow them to be used by t=
he OP-TEE
> > > > > > driver. The OP-TEE driver wants to register and manage specific=
 secure
> > > > > > DMA heaps with it.
> > > Thank you for the series.
> > >
> > > Could you please use EXPORT_SYMBOL_GPL_NS instead of EXPORT_SYMBOL fo=
r these?
> >
> > Sure, what namespace do you want in the argument for
> > EXPORT_SYMBOL_GPL_NS()? "DMA_BUF"?
>
> I think "DMA_BUF_HEAP" may be better?

I'll use that.

Thanks,
Jens

> >
> > >
> > > With that change, please feel free to use my
> > > Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> >
> > Thanks,
> > Jens
> >
> > > > > >
> > > > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > > > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > > > > ---
> > > > > >  drivers/dma-buf/dma-heap.c | 3 +++
> > > > > >  1 file changed, 3 insertions(+)
> > > > > >
> > > > >
> > > > > Can we get an ack from DMAbuf maintainers here? With that we shou=
ld be
> > > > > able to queue this patch-set for linux-next targetting the 6.18 m=
erge
> > > > > window.
> > > > >
> > > > > -Sumit
> > > >
> > > > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> > > >
> > > > Sorry I haven't been able to participate much upstream lately.
> > > > >
> > > > > > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-h=
eap.c
> > > > > > index 3cbe87d4a464..cdddf0e24dce 100644
> > > > > > --- a/drivers/dma-buf/dma-heap.c
> > > > > > +++ b/drivers/dma-buf/dma-heap.c
> > > > > > @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap =
*heap)
> > > > > >  {
> > > > > >       return heap->priv;
> > > > > >  }
> > > > > > +EXPORT_SYMBOL(dma_heap_get_drvdata);
> > > > > >
> > > > > >  /**
> > > > > >   * dma_heap_get_name - get heap name
> > > > > > @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_he=
ap *heap)
> > > > > >  {
> > > > > >       return heap->name;
> > > > > >  }
> > > > > > +EXPORT_SYMBOL(dma_heap_get_name);
> > > > > >
> > > > > >  /**
> > > > > >   * dma_heap_add - adds a heap to dmabuf heaps
> > > > > > @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct =
dma_heap_export_info *exp_info)
> > > > > >       kfree(heap);
> > > > > >       return err_ret;
> > > > > >  }
> > > > > > +EXPORT_SYMBOL(dma_heap_add);
> > > > > >
> > > > > >  static char *dma_heap_devnode(const struct device *dev, umode_=
t *mode)
> > > > > >  {
> > > > > > --
> > > > > > 2.43.0
> > > > > >
> > >
> > > Best,
> > > Sumit.
>
>
>
> --
> Thanks and regards,
>
> Sumit Semwal (he / him)
> Senior Tech Lead - Android, Platforms and Virtualisation
> Linaro.org =E2=94=82 Arm Solutions at Light Speed
