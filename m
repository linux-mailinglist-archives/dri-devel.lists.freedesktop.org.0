Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C51E44EA223
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 22:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261A610E0CA;
	Mon, 28 Mar 2022 20:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1833310E0CA
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 20:59:16 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id c62so18394907edf.5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 13:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XpihMQW3ITEGr80CFfEgsPwVbFmNePy8AVTnWzohyno=;
 b=fo6+o9w1krLj+t9+r6Huq6bmXGajiPbFdocT5kBjC0HNvq2kYhvbOf+nwkdlfWEihJ
 XFooInFSC2XxwxaaFa5j9dwDixiymZ80ntOov64y6VfCVLgnJO/ZKY2Y57ZVmLhKjQWJ
 /KiPBhfmc7+I7hQnJ5dkX1W+4t2UZg3u6kMkRFqCqCVPhQ6RAQKAFjgRGHqMLB2uj0J1
 bAKOtVu2J7GY58NXTNyhxAYfj6hhJe2dRqp72oCdamCZpoQ8mDte3MIkEJY+8gATJy1v
 gtJBcT/a+PdVy6KIgnUbTPGh402e++/1EUXLTSuiE81atZEQGIJeIuaDtouqgj4tt2Pu
 FUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XpihMQW3ITEGr80CFfEgsPwVbFmNePy8AVTnWzohyno=;
 b=TpTcLawmpdgDJLtu34XFjoSdl0VFkkYdlnxigA/ED5YVR+lNeLklZ5VBjFTtDI+QWU
 55/tRZjICpltzN4gq47TYjo/qLktle2kO8YkYviEnxBY0U8fIhTIFnOU2eNwSNMeDMHc
 MF9eWw1POTfdYUvXBsy9ruJIvtktoVpsyhnF5oqX0Sp2gooBqTtAYp078di0MQ8VpGr5
 coLyv5XrGlhcaSXz3ke4vy6oMBb0G2YVUEdcPrV6fTif5kAuHale9Cm16aqjwQhujDTi
 4Cw30ZuEUI5Cekb+AuGZBEaDGZxWZulHdj/zimGHy3Ecg7EGFszSoeQ4x8WAz33m23FG
 PnUA==
X-Gm-Message-State: AOAM5318HrymOaOOz3gzlyBLR9TXdjS7oFB5Txt1lbu8bJ9IQ0fhbcpl
 DCoFK0MOcaJYPrY6Zlsz+bKgF9U+Y/6fOCeoKXU=
X-Google-Smtp-Source: ABdhPJxpdmWGnFCQvTKGOD9NOQ2vNgNaejcUttwdkmLsXR8JqVRfOJExLnuVhfUYDvEwh561/7+o05VS6CAtac5wV6c=
X-Received: by 2002:a05:6402:d7:b0:413:673:ba2f with SMTP id
 i23-20020a05640200d700b004130673ba2fmr18962285edu.29.1648501154526; Mon, 28
 Mar 2022 13:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220207125933.81634-1-paul@crapouillou.net>
 <20220207125933.81634-8-paul@crapouillou.net>
 <20220328185425.56b51f4a@jic23-huawei> <1VYG9R.1JAKRTCN4I411@crapouillou.net>
In-Reply-To: <1VYG9R.1JAKRTCN4I411@crapouillou.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Mar 2022 23:58:38 +0300
Message-ID: <CAHp75VcWisAaHJUKedT7BWGNA8_5xye8-dyCv5Fq_kQWu7m7ew@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] iio: buffer-dma: Use DMABUFs instead of custom
 solution
To: Paul Cercueil <paul@crapouillou.net>
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio <linux-iio@vger.kernel.org>,
 Linux Documentation List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 28, 2022 at 11:30 PM Paul Cercueil <paul@crapouillou.net> wrote=
:
> Le lun., mars 28 2022 at 18:54:25 +0100, Jonathan Cameron
> <jic23@kernel.org> a =C3=A9crit :
> > On Mon,  7 Feb 2022 12:59:28 +0000
> > Paul Cercueil <paul@crapouillou.net> wrote:
> >
> >>  Enhance the current fileio code by using DMABUF objects instead of
> >>  custom buffers.
> >>
> >>  This adds more code than it removes, but:
> >>  - a lot of the complexity can be dropped, e.g. custom kref and
> >>    iio_buffer_block_put_atomic() are not needed anymore;
> >>  - it will be much easier to introduce an API to export these DMABUF
> >>    objects to userspace in a following patch.

> > I'm a bit rusty on dma mappings, but you seem to have
> > a mixture of streaming and coherent mappings going on in here.
>
> That's OK, so am I. What do you call "streaming mappings"?

dma_*_coherent() are for coherent mappings (usually you do it once and
cache coherency is guaranteed by accessing this memory by device or
CPU).
dma_map_*() are for streaming, which means that you often want to map
arbitrary pages during the transfer (usually used for the cases when
you want to keep previous data and do something with a new coming, or
when a new coming data is supplied by different virtual address, and
hence has to be mapped for DMA).

> > Is it the case that the current code is using the coherent mappings
> > and a potential 'other user' of the dma buffer might need
> > streaming mappings?
>
> Something like that. There are two different things; on both cases,
> userspace needs to create a DMABUF with IIO_BUFFER_DMABUF_ALLOC_IOCTL,
> and the backing memory is allocated with dma_alloc_coherent().
>
> - For the userspace interface, you then have a "cpu access" IOCTL
> (DMA_BUF_IOCTL_SYNC), that allows userspace to inform when it will
> start/finish to process the buffer in user-space (which will
> sync/invalidate the data cache if needed). A buffer can then be
> enqueued for DMA processing (TX or RX) with the new
> IIO_BUFFER_DMABUF_ENQUEUE_IOCTL.
>
> - When the DMABUF created via the IIO core is sent to another driver
> through the driver's custom DMABUF import function, this driver will
> call dma_buf_attach(), which will call iio_buffer_dma_buf_map(). Since
> it has to return a "struct sg_table *", this function then simply
> creates a sgtable with one entry that points to the backing memory.

...

> >>  +   ret =3D dma_map_sgtable(at->dev, &dba->sg_table, dma_dir, 0);
> >>  +   if (ret) {
> >>  +           kfree(dba);
> >>  +           return ERR_PTR(ret);
> >>  +   }

Missed DMA mapping error check.

> >>  +
> >>  +   return &dba->sg_table;
> >>  +}

...

> >>  -   /* Must not be accessed outside the core. */
> >>  -   struct kref kref;


> >>  +   struct dma_buf *dmabuf;

Is it okay to access outside the core? If no, why did you remove
(actually not modify) the comment?

--=20
With Best Regards,
Andy Shevchenko
