Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AB2939380
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 20:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549D510E25F;
	Mon, 22 Jul 2024 18:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="EWiLnzS+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732F710E25F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 18:06:26 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5a28b61b880so1749a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 11:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1721671585; x=1722276385;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HMK19Nn8t89hi1e3ly4VVQjOLnRO+D3abPmsW8/FOMM=;
 b=EWiLnzS+T6ls7KghqEyZi5ujcoEJpx+4O5B7Zj/X5aFAO/5N/R4X3ibCRYq/VCOp46
 N1np9dZoxJGGIot7zOGVtCxNo47+fEi2Z7clGYhk+04FYfK3hUkKgGKF3BoqHsbwovyZ
 PO8vsmXVsjlL7mvDa7eeOcEWhMWnz74F3aDeqDaBNd+UDc80DzsYv1BpQ/qon6YQZhf5
 MEeAMIS8Gj4s2g1YGPxBmqxexU3VaI5BaQ1SMREbj+DCZkXioez7XfYmlgBCCFQN0MYL
 gtE5Zmi91FpfpSwMVUwUjellz9ur/VIKTYGrjrVenNQE+1mJaDkwnBY4kKpsSdbm7CP8
 uYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721671585; x=1722276385;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HMK19Nn8t89hi1e3ly4VVQjOLnRO+D3abPmsW8/FOMM=;
 b=TOI6ucnNkzKJBfisnqEnR2QJlVfiIXeyQ7Ql1RDIAdWowS+iryeSVaA4fs1s49eZvT
 jpVm4gRIadExf8jMc7ho3rMO7NaWJUS4XuVtj8VZqEC9242ST8FuPQ+OAexvBrnqFSzt
 c8bzEr0j9KNHdg4m09IJIkMiztulw6TKbfZ43QMD5kr5TJgekg8uu2lx0lW+tjuN8ZBZ
 +7lBDkdNJp96XmQ6HkBU/DEq53bWy5eiv9jfRCzkths3VmTL3dYhZfkTIu8gVYTGkVBs
 ZwOFsOa/Y8bwFOWw+gixkRqjChnQgOqm8Tw9murQqn5l24EhqkK2/1tQn5gOtK9qF++s
 UxjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA5pSs1b/YRelOvjyVILTWrtZtHZXicWRVRUZePV4XeocJjXVDB4rMF5bkr3AYxfzCvH2kCpBDFeS7DByT/Md47keeSosxkSsJUE6zj2+d
X-Gm-Message-State: AOJu0YyN4j6l79xRnnSk3sMvF4wODdIeAMTrSZyjkACiU0BnXQBC677r
 z1/v6q41kd5UGhX8c+plTciI27v7ZdN4SyrwpMhcoFdybYSmiGz4SXDR7v1cpB+mz0qm/lq8Rrc
 qj3oOSuKwZfsTZgq6XI0oeDSCDdTiEMTwWGE=
X-Google-Smtp-Source: AGHT+IEl8zQov63qHRZlZmLKjP+SxF+AuxkB9AjZcfeGtwHxHIcLoa1XC0lM9boUyhzudCkZuPPMVUrlf0ByNKNURws=
X-Received: by 2002:a05:6402:2747:b0:59e:9fb1:a0dc with SMTP id
 4fb4d7f45d1cf-5a456a628aemr396556a12.6.1721671584394; Mon, 22 Jul 2024
 11:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240720071606.27930-6-yunfei.dong@mediatek.com>
 <2f5e5e81-21e1-421d-94ac-e4507b323680@web.de>
In-Reply-To: <2f5e5e81-21e1-421d-94ac-e4507b323680@web.de>
From: John Stultz <jstultz@google.com>
Date: Mon, 22 Jul 2024 11:06:12 -0700
Message-ID: <CANDhNCqzme0q7vey1jc84T0HJPiOSQF2fkyBfBLntdiyafEzYA@mail.gmail.com>
Subject: Re: [PATCH v7 05/28] dma-heap: Add proper kref handling on dma-buf
 heaps
To: Markus Elfring <Markus.Elfring@web.de>
Cc: "T. J. Mercier" <tjmercier@google.com>, Yong Wu <yong.wu@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nathan Hebert <nhebert@chromium.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Tomasz Figa <tfiga@chromium.org>, 
 LKML <linux-kernel@vger.kernel.org>, Brian Starkey <Brian.Starkey@arm.com>, 
 Chen-Yu Tsai <wenst@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?B?RnJpdHogS8O2bmln?= <frkoenig@chromium.org>, 
 Hsin-yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Steve Cho <stevecho@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>
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

On Sat, Jul 20, 2024 at 8:13=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > +++ b/drivers/dma-buf/dma-heap.c
> =E2=80=A6
> > +static void dma_heap_release(struct kref *ref)
> > +{
> =E2=80=A6
> > +     mutex_lock(&heap_list_lock);
> > +     list_del(&heap->list);
> > +     mutex_unlock(&heap_list_lock);
> =E2=80=A6
>
> Under which circumstances would you become interested to apply a statemen=
t
> like =E2=80=9Cguard(mutex)(&heap_list_lock);=E2=80=9D?
> https://elixir.bootlin.com/linux/v6.10/source/include/linux/mutex.h#L196

This strikes me as a strange place to apply it, as it seems like it
would grow the lock hold time to the entire scope of the function
unless one created a subscope for just the list_del, at which point
you're not saving much or really improving readability.  I definitely
think guard usage is very interesting in places where locks are
released in multiple exit paths, etc. but this is a very trivial and
straightforward lock/unlock usage, so I fret I don't quite understand
the suggestion.

thanks
-john
