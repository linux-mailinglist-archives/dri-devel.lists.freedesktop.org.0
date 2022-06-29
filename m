Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD6E560B32
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 22:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35CBE10E931;
	Wed, 29 Jun 2022 20:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE6812BA59
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 10:30:52 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id o19so20591554ybg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 03:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=INE3jM6i4CeBqiu3iP4gMcpfjuGPLjLxHaF42Uyh3HU=;
 b=gme5wrsat75qWp+Pcx6ZLUMXoFWSPo8SFk5+xY2sKMY14XML7lv7BZvDJ1XsF+R4pF
 H3XtfFAN7qI5e9jmkPQabM9C1cZvrazFcxkGWUN8u49ugGN5ZgE4uLnkUYNhQuPi4lCZ
 +uzhBRF2JTFseNh2HTIIBQ8WHh/1cppxJ6VLgcPGolWvn3oakRGqpYgHlWaZQI7qYur6
 WKhVL3asnCkiK66XXK9hKxBW+Kr8EDh4QueImd3KWxHYLj7f6FJC0FyCJ9Aoq3/krPPC
 PboTmDlG9/DJbi0qt+VVk0f7YCRqyYql31Z/lg1k67WVKQeRTUrOmIk8udCKjik37KcD
 Ojvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=INE3jM6i4CeBqiu3iP4gMcpfjuGPLjLxHaF42Uyh3HU=;
 b=xiZ1WP1LznixylDGXlODFg6eU7pQjAa0NW/ZooGbLrvnzaNw59xWDPrMngicCUvmpJ
 CDfXDDoM8TX9bs8yUgr1EM0uTwvpT3adVWtd5in0WaHRDvCmGxNXBacD+s6Is7e0D2BC
 a4d72pwCbgqGGBq0OUWnOFlRwMLRSjc3RdUesRWLSdj6dLZnlJ53l6r0FEJaiHTNWZpX
 a4xh86jqWZ9FDZHgeP1VfPoSxf+GiKb0B13vXZ3dI7fN6pEE3qK6/Sp21pLmlcOM6hu0
 VhBcQN9XcBJMJpUvY07eeg+a53Gfys64DX0XMYEY4SsEbSQc+FYbOgGUhorJVNp6JuTL
 0//A==
X-Gm-Message-State: AJIora9KTXdUeK4X1/4yw/A5GmHLOx5O/D5KbzeQeoIDTeI4cE0aI5ay
 RbrT3ro9ffTBVdss/7eSQQhfHgwgcjXrCcXc+o6w8w==
X-Google-Smtp-Source: AGRyM1u0k0MWRsbjlhZ+2t5dOIIfgGJepBD4oMisQfYbCc9kMnwW7juStqFdeNdnecD+2jq2Tx/943q3+X6LctTtJdA=
X-Received: by 2002:a25:b9c7:0:b0:66c:e02d:9749 with SMTP id
 y7-20020a25b9c7000000b0066ce02d9749mr2693651ybj.494.1656498651378; Wed, 29
 Jun 2022 03:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220625110115.39956-1-Jason@zx2c4.com>
 <20220625110115.39956-8-Jason@zx2c4.com>
 <YrlzkAlheCR0ZMuO@phenom.ffwll.local>
In-Reply-To: <YrlzkAlheCR0ZMuO@phenom.ffwll.local>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 29 Jun 2022 16:00:39 +0530
Message-ID: <CAO_48GE_-pLAq+HfjoJNGPO=dsj5g84oVQuF1vaxsXcfOcZ6KA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] dma-buf: remove useless FMODE_LSEEK flag
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org,
 viro@zeniv.linux.org.uk, 
 Jens Axboe <axboe@kernel.dk>, linux-fsdevel@vger.kernel.org, 
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 29 Jun 2022 20:39:17 +0000
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

On Mon, 27 Jun 2022 at 14:38, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sat, Jun 25, 2022 at 01:01:14PM +0200, Jason A. Donenfeld wrote:
> > This is already set by anon_inode_getfile(), since dma_buf_fops has
> > non-NULL ->llseek, so we don't need to set it here too.
> >
> > Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>
> I'm assuming this is part of a vfs cleanup and lands through that tree?
> For that:
>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
FWIW, please feel free to add
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

>
> > ---
> >  drivers/dma-buf/dma-buf.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 32f55640890c..3f08e0b960ec 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -549,7 +549,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf=
_export_info *exp_info)
> >               goto err_dmabuf;
> >       }
> >
> > -     file->f_mode |=3D FMODE_LSEEK;
> >       dmabuf->file =3D file;
> >
> >       mutex_init(&dmabuf->lock);
> > --
> > 2.35.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch


Best,
Sumit.
