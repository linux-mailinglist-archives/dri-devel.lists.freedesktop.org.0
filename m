Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C46C1BBB58
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 12:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB756E25C;
	Tue, 28 Apr 2020 10:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC556E25C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 10:37:39 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id b13so31782073oti.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 03:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/lbZ/o7rViPH+y9TQc0SUKwOd3mSEgmUJullTUqZ1zw=;
 b=tV9Fikyh7laK//5LljoUi8361sRi9GDmRlXVfYSZ6r4s46shMh1d/KzEq65dHBa5u+
 AmJvWEWOBHp9NE75KHX/uuj6u1661O9qUR/nkyzTyZopxT2w9we+Fyja8tSQnpWVt+ax
 lmBPPhz0K+zNF26Qb3RBe5w9fSURekRbjz6DNevKZi/aVxUj3sItV2Mcvg5X04VDpC/g
 ZiR1hFp0dB2r6sA0BOQ8jnSs5wpy0hKTTonQJvFB9JjB8Zc/3jUXbqjAUTgM9jUv6tf6
 kq8gZkjR8xR9uZEtc97WS9vZ/diLVDf84zmnOl6YU0dOIrIQ2LfidnmXM2RRBwjW8N/6
 m9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/lbZ/o7rViPH+y9TQc0SUKwOd3mSEgmUJullTUqZ1zw=;
 b=qBETqEG6oaV2SVYZaFRxxD+5PNku1s0wsBdI1eBulRGUe1ZtjDflJNsTqixtDWd2BB
 BqrY5xkWIuPVzI1MIfHhBN4szhU+z5Iw87QxlI9JfLYAGyCeOzKiib/zOjpOcmnAfh8x
 XPkfM0vgkprcNoJxCXDYrHg7QR3NXhunmueJvo3tpyNepcJfdB0ZRT+taGcnbzJlUpSw
 oXsDKqGi4sI2TpiMI3bFU5pO2jeq3VtCozH2ugra/JP2uDS/d6CS3+UMx26KDwq+wjLu
 rrIrcoIgyGNdT1a9J9obYul/yHCNbRPQ1DNvt6mLwK1dXy3BVt44/+iA1S4cFL4ttQEz
 37yw==
X-Gm-Message-State: AGi0PuYVVSgQLS+wKINtpX6/D4uQGmEhmoaWBFbvjP0BNWs8u3GUWFoA
 zf8o3X9iALcUcjVidfPTHLpsFHGk3Vxb3onjC2pFxA==
X-Google-Smtp-Source: APiQypJBytTcB67KweAIRvJkCA/naVwdNTs/27EB0xHKNcKsZvMT52vq5eSodEdlOT00J33uHlOKEpmUvYzvjkOh7QY=
X-Received: by 2002:aca:d885:: with SMTP id p127mr2520841oig.76.1588070258849; 
 Tue, 28 Apr 2020 03:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200407133002.3486387-1-daniel.vetter@ffwll.ch>
 <CAO_48GF5jM-L7bqnfvXSvbugAjYsYnE7rGokO7_LWQxHua0=wQ@mail.gmail.com>
 <20200423145122.GA17542@google.com>
In-Reply-To: <20200423145122.GA17542@google.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 28 Apr 2020 16:07:27 +0530
Message-ID: <CAO_48GHcwZC2zisha9JVg5ifDdXrTLFOgrVL+yYyLuxw4j5JMQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Fix SET_NAME ioctl uapi
To: Martin Liu <liumartin@google.com>
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
Cc: Todd Kjos <tkjos@android.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Chenbo Feng <fengc@google.com>, Greg Hackmann <ghackmann@google.com>,
 Linaro MM SIG <linaro-mm-sig@lists.linaro.org>, minchan@kernel.org,
 Jenhao Chen <jenhaochen@google.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Daniel, Martin,

On Thu, 23 Apr 2020 at 20:21, Martin Liu <liumartin@google.com> wrote:
>
> On Thu, Apr 09, 2020 at 09:28:16AM +0530, Sumit Semwal wrote:
> > Thanks for the patch, Daniel!
> >
> >
> > On Tue, 7 Apr 2020 at 19:00, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >
> > > The uapi is the same on 32 and 64 bit, but the number isnt. Everyone
> > > who botched this please re-read:
> > >
> > > https://www.kernel.org/doc/html/v5.4-preprc-cpu/ioctl/botching-up-ioctls.html
> > >
> > > Also, the type argument for the ioctl macros is for the type the void
> > > __user *arg pointer points at, which in this case would be the
> > > variable-sized char[] of a 0 terminated string. So this was botched in
> > > more than just the usual ways.
> >
> > Yes, it shouldn't have passed through the cracks; my apologies!
> >
> > >
> > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > Cc: Chenbo Feng <fengc@google.com>
> > > Cc: Greg Hackmann <ghackmann@google.com>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: linux-media@vger.kernel.org
> > > Cc: linaro-mm-sig@lists.linaro.org
> > > Cc: minchan@kernel.org
> > > Cc: surenb@google.com
> > > Cc: jenhaochen@google.com
> > > Cc: Martin Liu <liumartin@google.com>
> >
> > Martin,
> > Could I request you to test this one with the 4 combinations of 32-bit
> > / 64-bit userspace and kernel, and let us know that all 4 are working
> > alright? If yes, please consider giving your tested-by here.
> >
> Hi Sumit, Daniel,
> Sorry for being late to the tests. I finished the tests on 32/64 apps
> with 64 bit kernel and they were fine. Unfortunately, I couldn't have a 32
> bit kernel to run the tests somehow. However, this should work from the
> code logic. Hope this is okay to you and thanks for Todd's help.
>
> Tested-by: Martin Liu <liumartin@google.com>
> Reviewed-by: Martin Liu <liumartin@google.com>

Applied to drm-misc-fixes.
>
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > ---
> > >  drivers/dma-buf/dma-buf.c    | 3 ++-
> > >  include/uapi/linux/dma-buf.h | 4 ++++
> > >  2 files changed, 6 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > index 570c923023e6..1d923b8e4c59 100644
> > > --- a/drivers/dma-buf/dma-buf.c
> > > +++ b/drivers/dma-buf/dma-buf.c
> > > @@ -388,7 +388,8 @@ static long dma_buf_ioctl(struct file *file,
> > >
> > >                 return ret;
> > >
> > > -       case DMA_BUF_SET_NAME:
> > > +       case DMA_BUF_SET_NAME_A:
> > > +       case DMA_BUF_SET_NAME_B:
> > >                 return dma_buf_set_name(dmabuf, (const char __user *)arg);
> > >
> > >         default:
> > > diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> > > index dbc7092e04b5..21dfac815dc0 100644
> > > --- a/include/uapi/linux/dma-buf.h
> > > +++ b/include/uapi/linux/dma-buf.h
> > > @@ -39,6 +39,10 @@ struct dma_buf_sync {
> > >
> > >  #define DMA_BUF_BASE           'b'
> > >  #define DMA_BUF_IOCTL_SYNC     _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
> > > +/* 32/64bitness of this uapi was botched in android, there's no difference
> > > + * between them in actual uapi, they're just different numbers. */
> > >  #define DMA_BUF_SET_NAME       _IOW(DMA_BUF_BASE, 1, const char *)
> > > +#define DMA_BUF_SET_NAME_A     _IOW(DMA_BUF_BASE, 1, u32)
> > > +#define DMA_BUF_SET_NAME_B     _IOW(DMA_BUF_BASE, 1, u64)
> > >
> > >  #endif
> > > --
> > > 2.25.1
> > >
> > Best,
> > Sumit.
Best,
Sumit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
