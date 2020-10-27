Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DD029CEBF
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80396EC64;
	Wed, 28 Oct 2020 08:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0735C6EC07
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 18:00:58 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id s7so1529784iol.12
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 11:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ed3AIF7qFllVghkuMSpgY+e4IbkAvQfdceeKpQaUdxk=;
 b=UoiZn2ejgC7wXGBMzC5P1HZYY0nl6Wa3KE0/4S9Ciuieo7WYMXpDS0Iaqpc4XiAPdO
 qMSPbldaS4qotDJxt10RTbnG9MLtwWkVWivTQZrOtp1ibfKEiirPfM/hcYKscWcE5G9+
 hdA0OqGIyHCG+6wpH2Tcj5TcpWPTkljgGKnbGOzRrgHXz7X+jipA9gLH6g8zN/Jx0l4s
 /OKkLzKstGxFD2CYIuU1B33wI1K0Ml8+qKW5x8c0LoZzpt+1zSKoX87G79JYtOSZ/rG6
 gJ+d5QJ1DFf7m/UdqRG6MK7XEwKpEIVQ7cBBbC41y7jJlAMtCPK8jhzSkqrf6tO37h92
 JCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ed3AIF7qFllVghkuMSpgY+e4IbkAvQfdceeKpQaUdxk=;
 b=gfe5tPgEb7qWHwQiS8dQsuHaTk/Wk9T4ux+i5UtjoF+cXcKm+EIaTgnxyrTsfnIwqG
 qDF2TcLMIw4k5OMELCSw7lqMgf4KkncsEYXqqCeIABoOOvC+qNoUos0rR8yU+YQ+jFNd
 d76dQbF/mD2deQEQmim8SjIl8ahsj3++KaHhuP/t+UYgoaGYcHUE/LCkabji9a4CexTC
 /gRzxkQ40DDPAOpCmZvqBcia45PEJ7VjvNQ1uuRF7dsGkNX8HMTpPDCDzS5YwFsYDmZo
 RVqtvxiaQ6j7RR4EMycWp6V5byTPp/Z0eCVM0HiQsSBR+Dud1hbrUrR+9ymeEq6bNjqV
 WjMQ==
X-Gm-Message-State: AOAM530iXYW6yVpd2kijqQI5PQrbh7Y7i0RiabQZKYIA2BEH6u+5V6n9
 8RUtOZzby1Vy69LIxbZ0g8yfRSwG2mz6Ep7/CqKpxg==
X-Google-Smtp-Source: ABdhPJwN08N0ZyzhoITVdnvB4ryeaKood+3vq0iIUYgCE2JJfuXumCj2bIDB2qD60OdiaWwDhRbGH3iAIo+DCc+ziro=
X-Received: by 2002:a6b:f401:: with SMTP id i1mr3323522iog.130.1603821657825; 
 Tue, 27 Oct 2020 11:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201027121725.24660-1-brgl@bgdev.pl>
 <20201027121725.24660-4-brgl@bgdev.pl>
 <20201027112607-mutt-send-email-mst@kernel.org>
 <685d850347a1191bba8ba7766fc409b140d18f03.camel@perches.com>
 <CAMpxmJU0C84DjPmqmWvPgv0zwgGLhkpKLRDuKkZHAa=wi+LvBA@mail.gmail.com>
 <2767969b94fd66db1fb0fc13b5783ae65b7deb2f.camel@perches.com>
In-Reply-To: <2767969b94fd66db1fb0fc13b5783ae65b7deb2f.camel@perches.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 27 Oct 2020 19:00:46 +0100
Message-ID: <CAMRc=McvW_E0aE2Ep=3aZvb=kNDMz6=ZH-EQzARAD-tyJG5Rrg@mail.gmail.com>
Subject: Re: [PATCH 3/8] vhost: vringh: use krealloc_array()
To: Joe Perches <joe@perches.com>
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:31 +0000
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Gustavo Padovan <gustavo@padovan.org>,
 linux-drm <dri-devel@lists.freedesktop.org>, Jaroslav Kysela <perex@perex.cz>,
 linux-mm@kvack.org, Christoph Lameter <cl@linux.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 David Rientjes <rientjes@google.com>,
 virtualization@lists.linux-foundation.org, Jason Wang <jasowang@redhat.com>,
 linux-media <linux-media@vger.kernel.org>, Robert Richter <rric@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linaro-mm-sig@lists.linaro.org,
 linux-gpio <linux-gpio@vger.kernel.org>, Borislav Petkov <bp@alien8.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, netdev <netdev@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Pekka Enberg <penberg@kernel.org>,
 James Morse <james.morse@arm.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 6:08 PM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2020-10-27 at 17:58 +0100, Bartosz Golaszewski wrote:
> > On Tue, Oct 27, 2020 at 5:50 PM Joe Perches <joe@perches.com> wrote:
> > >
> > > On Tue, 2020-10-27 at 11:28 -0400, Michael S. Tsirkin wrote:
> > > > On Tue, Oct 27, 2020 at 01:17:20PM +0100, Bartosz Golaszewski wrote:
> > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > >
> > > > > Use the helper that checks for overflows internally instead of manually
> > > > > calculating the size of the new array.
> > > > >
> > > > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > No problem with the patch, it does introduce some symmetry in the code.
> > >
> > > Perhaps more symmetry by using kmemdup
> > > ---
> > >  drivers/vhost/vringh.c | 23 ++++++++++-------------
> > >  1 file changed, 10 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
> > > index 8bd8b403f087..99222a3651cd 100644
> > > --- a/drivers/vhost/vringh.c
> > > +++ b/drivers/vhost/vringh.c
> > > @@ -191,26 +191,23 @@ static int move_to_indirect(const struct vringh *vrh,
> > >  static int resize_iovec(struct vringh_kiov *iov, gfp_t gfp)
> > >  {
> > >         struct kvec *new;
> > > -       unsigned int flag, new_num = (iov->max_num & ~VRINGH_IOV_ALLOCATED) * 2;
> > > +       size_t new_num = (iov->max_num & ~VRINGH_IOV_ALLOCATED) * 2;
> > > +       size_t size;
> > >
> > >         if (new_num < 8)
> > >                 new_num = 8;
> > >
> > > -       flag = (iov->max_num & VRINGH_IOV_ALLOCATED);
> > > -       if (flag)
> > > -               new = krealloc(iov->iov, new_num * sizeof(struct iovec), gfp);
> > > -       else {
> > > -               new = kmalloc_array(new_num, sizeof(struct iovec), gfp);
> > > -               if (new) {
> > > -                       memcpy(new, iov->iov,
> > > -                              iov->max_num * sizeof(struct iovec));
> > > -                       flag = VRINGH_IOV_ALLOCATED;
> > > -               }
> > > -       }
> > > +       if (unlikely(check_mul_overflow(new_num, sizeof(struct iovec), &size)))
> > > +               return -ENOMEM;
> > > +
> >
> > The whole point of using helpers such as kmalloc_array() is not doing
> > these checks manually.
>
> Tradeoffs for in readability for overflow and not mistyping or doing
> the multiplication of iov->max_num * sizeof(struct iovec) twice.
>

It's out of scope for this series - I want to add users for
krealloc_array(), not refactor code I don't really know. If the
maintainer of this bit objects, it can be dropped.

> Just fyi:
>
> the realloc doesn't do a multiplication overflow test as written so the
> suggestion is slightly more resistant to defect.
>

I'm not sure what your point is. I used krealloc_array() exactly for
this reason - to add the overflow test.

BTW I suppose kmalloc_array() here can be replaced with
krealloc_array() if the original pointer is NULL the first time it's
called.

Bartosz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
