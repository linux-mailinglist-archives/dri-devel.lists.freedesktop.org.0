Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D361B27301
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 01:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BF310E02C;
	Thu, 14 Aug 2025 23:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="0RFFs+as";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2AA10E02C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 23:30:44 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-459fc675d11so15805e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 16:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755214242; x=1755819042;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a0JmiFdlp9ZkN1fxeZfgjKK4+EMYxMKsgyQh0URM5ec=;
 b=0RFFs+asBQaphx9m1mgV9nUQ/OMiUbrK1GQWVk6rmSMTrzImuMcvTVgU9TZA5BRyWq
 +Xy5ADyveWNcXaSn5Dq180F9cT1PR+XPwYES8lzwLREjAbmcFyp6gfTgzBsMXx/86Hri
 m9oFpD2QTbLBJI4Lmr7t6OpdNQueyJe+BCSqQwF9M77oUpO4d0X4UrmiFIm9VFflIbXk
 eDsT4kN0kzge/WUFuJFKq+I/9ao0l07460DcxyNaiDc2Y0eUvEwuYzppdBbIVeWqqy4y
 W3cwtUMyEfPO6pI/7fjOJJ5/LTtF7rRu6jgkoPzIIh+AnZFYFBZhdt4aCpj8vhypcdCo
 hhDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755214242; x=1755819042;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a0JmiFdlp9ZkN1fxeZfgjKK4+EMYxMKsgyQh0URM5ec=;
 b=X9POC1UxmMPnlHMT5drCM07O5ozq3ykYxZM//jyLUR/YwWVMM68QJDQaCE1cpSypNS
 +iCZ+pVKCGliQeG8VmlpoC3+ZOA+9vD5XkyMTtqIAP7Tq9V/VheWvFFn5pIWjmDsuaVk
 zqbv12xdEuB34vzKPUPPCW412/EuEY7qf/KeRmoMq4RovRWsoQ2vqCRFZaIvfQJokWxc
 5kICRgmO8f0o6HxkSvl2Yk6ly+GXJGLnkNH6KpfvHKzkvGrhJKl466jvbe1aueuAY/1h
 nDKUJld7oWD6ibUKAGHC1F2kRSRx7Mwxkm8bC3PjG59oHsofxvf69bct8IflTDgtb72a
 2Vjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnHBngeU5lUcQ+dcDL+/wxeOE6l5MQ8teCwM5Il9ZJxDnhyn+RiAPepVD9l/0NZ/VpIZ4wRf/nWDQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywse8vQHR6dPykXyD2P5XJYRRDrbkYeR9nO4mDRlT0F7WlyQPDG
 UBo40sfjegsHHWU5f5QnEaKgtLOi8VdsqS0EuwS/mRJnV+UC2lIOd65gYTIR6+QkoWTZuvFyWqW
 r/2oo3HWsdGX4sJjBJU7OHwNXMwbZDxusymXxGM5v
X-Gm-Gg: ASbGncsDz4f1LOopuRecxwNSTAK4JTWwnYMMcezyJr36GjhT6yueKc847GEH/ZPI2Mx
 LpJFYr48RIpfMRMsotj9PK4yDrtIuAKkJgJ2HHlJXfePvZar6LhOcfaXa83faFShuexvvGOz56Y
 OdRCqcmLb3WBqHd2M8eGZKT/GdSj8Qae2fSdWe+niiOT+eIn2Xxn6smGiAB5oUYUX8h68welFK+
 qxYgiRTpmDPDkQW2HLx6hG8Sd0oCsE7o1bFYBjWjWk=
X-Google-Smtp-Source: AGHT+IEEw+uzXS2i8WjnVSg7+M8YgE/PH0qtNvR3RZRshlFOrW4DkRzKM58Y1imbSzgGPptKIKq3mUjkWcuT38ZrZFk=
X-Received: by 2002:a05:600c:8909:b0:453:5ffb:e007 with SMTP id
 5b1f17b1804b1-45a20af818amr346105e9.4.1755214242237; Thu, 14 Aug 2025
 16:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
 <20250813060339.2977604-3-jens.wiklander@linaro.org>
 <aJ1-YpgvGt4_6CFU@sumit-X1>
In-Reply-To: <aJ1-YpgvGt4_6CFU@sumit-X1>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 14 Aug 2025 16:30:30 -0700
X-Gm-Features: Ac12FXzYk8vQFwHlmYOx6GVXgELj4N91iOPnVrtkJq0EeS5aTQuf7I4LnzwBN-c
Message-ID: <CABdmKX2FPg+hO55qWndMajuWP0kZH=OWEh9v-d8aO6HQWyxJtQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/9] dma-buf: dma-heap: export declared functions
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
 linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
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

On Wed, Aug 13, 2025 at 11:13=E2=80=AFPM Sumit Garg <sumit.garg@kernel.org>=
 wrote:
>
> On Wed, Aug 13, 2025 at 08:02:51AM +0200, Jens Wiklander wrote:
> > Export the dma-buf heap functions to allow them to be used by the OP-TE=
E
> > driver. The OP-TEE driver wants to register and manage specific secure
> > DMA heaps with it.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> >  drivers/dma-buf/dma-heap.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
>
> Can we get an ack from DMAbuf maintainers here? With that we should be
> able to queue this patch-set for linux-next targetting the 6.18 merge
> window.
>
> -Sumit

Reviewed-by: T.J. Mercier <tjmercier@google.com>

Sorry I haven't been able to participate much upstream lately.
>
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 3cbe87d4a464..cdddf0e24dce 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
> >  {
> >       return heap->priv;
> >  }
> > +EXPORT_SYMBOL(dma_heap_get_drvdata);
> >
> >  /**
> >   * dma_heap_get_name - get heap name
> > @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *heap=
)
> >  {
> >       return heap->name;
> >  }
> > +EXPORT_SYMBOL(dma_heap_get_name);
> >
> >  /**
> >   * dma_heap_add - adds a heap to dmabuf heaps
> > @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap=
_export_info *exp_info)
> >       kfree(heap);
> >       return err_ret;
> >  }
> > +EXPORT_SYMBOL(dma_heap_add);
> >
> >  static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
> >  {
> > --
> > 2.43.0
> >
