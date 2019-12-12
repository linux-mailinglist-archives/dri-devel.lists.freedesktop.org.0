Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFB711D5AE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 19:33:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733EA6E0D3;
	Thu, 12 Dec 2019 18:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22DFB6E0D3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 18:33:48 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id d17so3021937otc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 10:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2JEzjDTXigw8nTAlF070YiTxXmoqt0fiFaSaJYbD0m0=;
 b=ufuXmQiynKIhlryP/nAuUMz1QU6Dn2EbSsneTbWxFV91i8ZR8GVxkgzVfIhq68Om8y
 hZaMhuc6jD81PgDVsrdWfixKWiTEuKjXPE/5CHJaZUWxSV7jkCMMGPXZf4hIFze5QZkO
 Fe3pjnG9MZcRSiXX4h03BqXwfQg5esIhN7SCPPU15/RLVn6EdXc6q2IYbirqdEBqqtoV
 1X9u1y1J9sUpVlXTASC3w8oWerK5SQ+bzRCcq3/3Y5XHac6VuhEuHceHyOxTc4prEj7a
 WAjtXFAQLlSYUigoSI+ks/o15KvvRt2eFWxG1vFmFAoGlg7coj4s4E6cU8GcoMDRCYBm
 fl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2JEzjDTXigw8nTAlF070YiTxXmoqt0fiFaSaJYbD0m0=;
 b=Y8KhhyfdPL0y3umxQX2UYRL3O5nWHKKUV630q/bcu8Kd0p4jCPj0YzOyeYJxxEpS5n
 ZBQ/DFM8Iu7JWFcbKyg8ZydawdvlDe4ddQcMAJCvyYWETNKGtH0V4QfJTzfHi9ArZZS9
 Opwc1wfFBPZ/K5vQByQIcmCAWo5EjO1QsYDgrlCnADHskv176zMBH7rlWF8lD5Md68fp
 RYIb3R7i+ieROp3gdAlmke3/DCrZAwjpGOOV5Fn8dhM6orStxu5F1ZtH4Ven+LeSFsH+
 8ohobJPjh3UJkxqR+Y+gKHWDI9QVopevEcfrukLObkpqrCohPw9rr/RlyClNXI9i53pD
 p6SA==
X-Gm-Message-State: APjAAAUZILF5G2CK8DIFlB24tQ6M/nW+5gXoW6zF7IISNJaHWwadCdP0
 DeEvwwI5PX2Nouv/U1lfiCXKEtEQ4S6BX3Pw9buYLA==
X-Google-Smtp-Source: APXvYqweGtmWP/9RDwqqztjyBmVQhQCTFC0RrVREpzH+hWNkdDn380L8OObmNOa7PFyEM3JGNhguvUUT5fLg37ssxCk=
X-Received: by 2002:a05:6830:1097:: with SMTP id
 y23mr9499165oto.332.1576175627329; 
 Thu, 12 Dec 2019 10:33:47 -0800 (PST)
MIME-Version: 1.0
References: <20191203172641.66642-1-john.stultz@linaro.org>
 <20191203172641.66642-2-john.stultz@linaro.org>
 <b3e979ab-0c95-4e16-6399-9bed09e08a7b@ti.com>
In-Reply-To: <b3e979ab-0c95-4e16-6399-9bed09e08a7b@ti.com>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 12 Dec 2019 10:33:36 -0800
Message-ID: <CALAqxLV5XwrJU2psx_ALFK1q9ZTaLTGRD9dgQhGQ5v=ojfyE+w@mail.gmail.com>
Subject: Re: [RESEND][PATCH v16 1/5] dma-buf: Add dma-buf heaps framework
To: "Andrew F. Davis" <afd@ti.com>
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Sandeep Patil <sspatil@google.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Christoph Hellwig <hch@infradead.org>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 12, 2019 at 8:52 AM Andrew F. Davis <afd@ti.com> wrote:
> On 12/3/19 12:26 PM, John Stultz wrote:
> > +#define DMA_HEAP_IOC_MAGIC           'H'
> > +
> > +/**
> > + * DOC: DMA_HEAP_IOC_ALLOC - allocate memory from pool
> > + *
> > + * Takes a dma_heap_allocation_data struct and returns it with the fd field
> > + * populated with the dmabuf handle of the allocation.
> > + */
> > +#define DMA_HEAP_IOC_ALLOC   _IOWR(DMA_HEAP_IOC_MAGIC, 0x0,\
> > +                                   struct dma_heap_allocation_data)
> > +
>
> <subsytem>_IOC_
>
> Seems more common for the internal numberings and such, what the user
> calls is more often (espesially in DRM and DMA_BUF):
>
> <subsytem>_IOCTL_<function>
>
> This is really just another naming nit but becouse this one really *is*
> ABI then getting our prefrence right is a must, up to you here.

So yea, Sumit has already pulled these into drm-misc-next, so this
feedback is just a few days too late.

But it's not a bad suggestion, so if you want to submit a tack-on
patch to drm-misc-next I suspect we can, try to pull it in.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
