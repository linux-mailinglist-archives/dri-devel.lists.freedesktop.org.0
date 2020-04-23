Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE2B1B6715
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3ABB6EA46;
	Thu, 23 Apr 2020 22:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA0789D8D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 14:51:33 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id a7so2610180pju.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 07:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=n9579OtTCLif5IsmjfaMugY+P4SRRpDn94COWW+rKC8=;
 b=Dta1r0S+h83gJZETxTuyaZcdtvwtvSMGYQIGZAa5p9AhAeqWF9hi/95cNnPMUf9qdT
 YJ0iWpHfyS5L+KMY6SPuWSUjXrgjDGHfm+CQWuLWQRuXNz0jzQhq1fbj/Ud0WWev9Tmg
 FuRU7zZEZf1Uy7eoByc2VxOi+r3Ai9ZrKPxNqzsqt7faxTeriSXl8+L2s6vXsagGow5w
 wRisB3CT37V8JbkM8Rd+9wJptjaQapNWPG1mRJGeQ2aowpVEP/tiwlX8BCZHWv5KMNRf
 NpcryrWTjP0ofsKoTuqRMOON+ZrJC0w8xyXfGAf0hV/gQNaozihip7ENc9DMBkCscmaa
 hT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n9579OtTCLif5IsmjfaMugY+P4SRRpDn94COWW+rKC8=;
 b=h9VS+4ssC9DiHoilsfnRvZDxhqZ7jblfrDP/lhnlSbMHzG1nQFtv0OncpM8Bl2k70X
 JH/HABZfYl2uLC1FVfNOj4lH6tH76p1uirvyAOHGjh3CG81ynnlVXbWjJtwxfOr0/lZz
 yChQE2vBiuvbjuc+tOiXTICoVDdx6gDT9cIUnSFBJGwNrhE3z12SNMPB3G7omVn9PgBS
 9s8jhj3XoQbBT2bU9P9aK1+6sH8B06ztfAJy+AtmPLbFIkk5ZmloVKJPOkAvDGtd+F8j
 B3cN4YJYJ1bSRqwhI1en1mHJWnw4W/kjEzn9hNhfO9xeCW8SKauBTEGGwnvnbyqrex2a
 yGuw==
X-Gm-Message-State: AGi0Pua1YfVucL/WrNYHy8jjhvJBsllAs33ZfTjQkXDeGBEcjsXiwJT8
 7C7vrNevPUUrMKG0C9fxSYnBXA==
X-Google-Smtp-Source: APiQypIJPerMho/SwnFvX4bBmyPrOipYJLcCQKHKClc0G3/oxnjytm19nNfUINndfzodE7hR9nqT/w==
X-Received: by 2002:a17:90a:6fe4:: with SMTP id
 e91mr1116823pjk.28.1587653492470; 
 Thu, 23 Apr 2020 07:51:32 -0700 (PDT)
Received: from google.com ([2401:fa00:fc:1:28b:9f23:d296:c845])
 by smtp.gmail.com with ESMTPSA id p189sm2835561pfp.135.2020.04.23.07.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 07:51:31 -0700 (PDT)
Date: Thu, 23 Apr 2020 22:51:22 +0800
From: Martin Liu <liumartin@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH] dma-buf: Fix SET_NAME ioctl uapi
Message-ID: <20200423145122.GA17542@google.com>
References: <20200407133002.3486387-1-daniel.vetter@ffwll.ch>
 <CAO_48GF5jM-L7bqnfvXSvbugAjYsYnE7rGokO7_LWQxHua0=wQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAO_48GF5jM-L7bqnfvXSvbugAjYsYnE7rGokO7_LWQxHua0=wQ@mail.gmail.com>
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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

On Thu, Apr 09, 2020 at 09:28:16AM +0530, Sumit Semwal wrote:
> Thanks for the patch, Daniel!
> 
> 
> On Tue, 7 Apr 2020 at 19:00, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > The uapi is the same on 32 and 64 bit, but the number isnt. Everyone
> > who botched this please re-read:
> >
> > https://www.kernel.org/doc/html/v5.4-preprc-cpu/ioctl/botching-up-ioctls.html
> >
> > Also, the type argument for the ioctl macros is for the type the void
> > __user *arg pointer points at, which in this case would be the
> > variable-sized char[] of a 0 terminated string. So this was botched in
> > more than just the usual ways.
> 
> Yes, it shouldn't have passed through the cracks; my apologies!
> 
> >
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Chenbo Feng <fengc@google.com>
> > Cc: Greg Hackmann <ghackmann@google.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Cc: minchan@kernel.org
> > Cc: surenb@google.com
> > Cc: jenhaochen@google.com
> > Cc: Martin Liu <liumartin@google.com>
> 
> Martin,
> Could I request you to test this one with the 4 combinations of 32-bit
> / 64-bit userspace and kernel, and let us know that all 4 are working
> alright? If yes, please consider giving your tested-by here.
>
Hi Sumit, Daniel,
Sorry for being late to the tests. I finished the tests on 32/64 apps
with 64 bit kernel and they were fine. Unfortunately, I couldn't have a 32
bit kernel to run the tests somehow. However, this should work from the
code logic. Hope this is okay to you and thanks for Todd's help.

Tested-by: Martin Liu <liumartin@google.com>
Reviewed-by: Martin Liu <liumartin@google.com>

> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/dma-buf/dma-buf.c    | 3 ++-
> >  include/uapi/linux/dma-buf.h | 4 ++++
> >  2 files changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 570c923023e6..1d923b8e4c59 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -388,7 +388,8 @@ static long dma_buf_ioctl(struct file *file,
> >
> >                 return ret;
> >
> > -       case DMA_BUF_SET_NAME:
> > +       case DMA_BUF_SET_NAME_A:
> > +       case DMA_BUF_SET_NAME_B:
> >                 return dma_buf_set_name(dmabuf, (const char __user *)arg);
> >
> >         default:
> > diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> > index dbc7092e04b5..21dfac815dc0 100644
> > --- a/include/uapi/linux/dma-buf.h
> > +++ b/include/uapi/linux/dma-buf.h
> > @@ -39,6 +39,10 @@ struct dma_buf_sync {
> >
> >  #define DMA_BUF_BASE           'b'
> >  #define DMA_BUF_IOCTL_SYNC     _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
> > +/* 32/64bitness of this uapi was botched in android, there's no difference
> > + * between them in actual uapi, they're just different numbers. */
> >  #define DMA_BUF_SET_NAME       _IOW(DMA_BUF_BASE, 1, const char *)
> > +#define DMA_BUF_SET_NAME_A     _IOW(DMA_BUF_BASE, 1, u32)
> > +#define DMA_BUF_SET_NAME_B     _IOW(DMA_BUF_BASE, 1, u64)
> >
> >  #endif
> > --
> > 2.25.1
> >
> Best,
> Sumit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
