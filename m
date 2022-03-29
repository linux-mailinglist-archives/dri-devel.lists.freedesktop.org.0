Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 173F04EA89B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 09:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B630A10F071;
	Tue, 29 Mar 2022 07:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F2E10E56C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 07:11:13 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id b189so13367468qkf.11
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 00:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=2Jpv9X1mRqJBbBsT23UY5br7jZqVXCd74N7s1FPvLr4=;
 b=aalhu3Sn2nCA2dfMtZ5bg8U92vZKzbYYf8SrKTbvgcuwConxVqtEYxu+UbeK/CJKxp
 J2XW8EhweBztEFHH7svb39CtM57BYUnEa7U+pYtiJYBB5XUHBvrnsp+cPrefNgiMcLrZ
 62Llq4Z4FsR8ZRjtmDyiamTrk9hpftq7UQzCsIhIrvZfUdHmBtdZGK89rhJOfeP85PpH
 eVGG2mAClPGGFETMVpQWYnprmSsUIpJW+u6MwF45N/uNc6ZpXKMiZ3fb5Ov5AVu7FhxV
 Gv1tT+uDa8zgT/Sr4alxIm2XyNmsemas9yiRD5o83DGQuSVhR5K1LYSgo7DCLFccDPw9
 0LAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=2Jpv9X1mRqJBbBsT23UY5br7jZqVXCd74N7s1FPvLr4=;
 b=vFEm/Z/TaIFuNnWx8OvyU8i0wl2XkEybTGSFutKWWeYhiMglsa4jrrIk0AsssZJpXg
 HCmZTxO9bWkX953qHkcPtDuci6WW/gbxrt4UhAqj/G3WV04JeN0cEApT22LiytUJNtwF
 Qr13JccSKDq1J17a5m4dKasgzUjpJm3AD2KxvpjPJRleoW4++g4e4gpWqETXsjZwPanC
 2hbkaJ5EtqlKSqbPZf7yLqKRj8xBAQmlvRUz4XVyc9ONuDw/5UWTa0JcBvJabrtpe7vR
 tc3vbvc3QfiLMNzvT5NyhUdDrmONKadTor2zKHbK6uaJwNDh/pS9YWDHjxmw0HxQrna/
 Jppg==
X-Gm-Message-State: AOAM5337Dp8wz9LbAmco8/a+hsgJIIlvIw4eG/M3D+SaITbapKLZbrrC
 QbRW8LupNLQ8mxXy9xH41aSqib7BOC/xYleo
X-Google-Smtp-Source: ABdhPJy+jP697xainM6j70Eo1PTqkiP/ca6UtAdVU/oGW4GfmOgL8tApjwuNxpCwyJzVAWUtTBOa6g==
X-Received: by 2002:a37:9a47:0:b0:680:aeaa:d89c with SMTP id
 c68-20020a379a47000000b00680aeaad89cmr15826074qke.591.1648537872342; 
 Tue, 29 Mar 2022 00:11:12 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef00:8400:3d36:58a:667a:1da9?
 (p200300f6ef0084003d36058a667a1da9.dip0.t-ipconnect.de.
 [2003:f6:ef00:8400:3d36:58a:667a:1da9])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a05620a288100b0067b1be3201bsm8843300qkp.112.2022.03.29.00.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 00:11:11 -0700 (PDT)
Message-ID: <deb2cd86196addbc47908455880000c618b984be.camel@gmail.com>
Subject: Re: [PATCH v2 02/12] iio: buffer-dma: Enable buffer write support
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, Jonathan Cameron <jic23@kernel.org>
Date: Tue, 29 Mar 2022 09:11:48 +0200
In-Reply-To: <96XG9R.3NOIIEN7IS001@crapouillou.net>
References: <20220207125933.81634-1-paul@crapouillou.net>
 <20220207125933.81634-3-paul@crapouillou.net>
 <20220328182409.1e959386@jic23-huawei>
 <96XG9R.3NOIIEN7IS001@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 29 Mar 2022 07:38:02 +0000
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
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-03-28 at 19:39 +0100, Paul Cercueil wrote:
> Hi Jonathan,
> 
> Le lun., mars 28 2022 at 18:24:09 +0100, Jonathan Cameron 
> <jic23@kernel.org> a écrit :
> > On Mon,  7 Feb 2022 12:59:23 +0000
> > Paul Cercueil <paul@crapouillou.net> wrote:
> > 
> > >  Adding write support to the buffer-dma code is easy - the
> > > write()
> > >  function basically needs to do the exact same thing as the
> > > read()
> > >  function: dequeue a block, read or write the data, enqueue the
> > > block
> > >  when entirely processed.
> > > 
> > >  Therefore, the iio_buffer_dma_read() and the new 
> > > iio_buffer_dma_write()
> > >  now both call a function iio_buffer_dma_io(), which will perform
> > > this
> > >  task.
> > > 
> > >  The .space_available() callback can return the exact same value
> > > as 
> > > the
> > >  .data_available() callback for input buffers, since in both
> > > cases we
> > >  count the exact same thing (the number of bytes in each
> > > available
> > >  block).
> > > 
> > >  Note that we preemptively reset block->bytes_used to the
> > > buffer's 
> > > size
> > >  in iio_dma_buffer_request_update(), as in the future the
> > >  iio_dma_buffer_enqueue() function won't reset it.
> > > 
> > >  v2: - Fix block->state not being reset in
> > >        iio_dma_buffer_request_update() for output buffers.
> > >      - Only update block->bytes_used once and add a comment about
> > > why we
> > >        update it.
> > >      - Add a comment about why we're setting a different state
> > > for 
> > > output
> > >        buffers in iio_dma_buffer_request_update()
> > >      - Remove useless cast to bool (!!) in iio_dma_buffer_io()
> > > 
> > >  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > >  Reviewed-by: Alexandru Ardelean <ardeleanalex@gmail.com>
> > One comment inline.
> > 
> > I'd be tempted to queue this up with that fixed, but do we have
> > any users?  Even though it's trivial I'm not that keen on code
> > upstream well in advance of it being used.
> 
> There's a userspace user in libiio. On the kernel side we do have 
> drivers that use it in ADI's downstream kernel, that we plan to 
> upstream in the long term (but it can take some time, as we need to 
> upstream other things first, like JESD204B support).
> 
> 

You mean, users for DMA output buffers? If so, I have on my queue to
add the dac counterpart of this one:

https://elixir.bootlin.com/linux/latest/source/drivers/iio/adc/adi-axi-adc.c

Which is a user of DMA buffers. Though this one does not depend on
JESD204, I suspect it will also be a tricky process mainly because I
think there are major issues on how things are done right now (on the
ADC driver).

But yeah, not a topic here and I do plan to first start the discussion
on the mailing list before starting developing (hopefully in the coming
weeks)...

- Nuno Sá


