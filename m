Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C8F44E6C7
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 13:50:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821816ED27;
	Fri, 12 Nov 2021 12:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91AF26ED27
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 12:50:50 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id y68so18108701ybe.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 04:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3cO+T0bQeybiDDylcMZkT5XwbI+vwvKzW0bev+afBvI=;
 b=RIZxbAV1oxKOWMSnsV0ORNeISTEVVC9NPwHD9tLk2WHr9q0uvCJ6/i9p2t4Q8vsFZn
 QitKr1U6WESwymXQHdWnwq0cdDJ0Jt8UeWEfznUy4O1vOfiK01iQCmwPeDXZglgInkA8
 R/7poBE+IGnDAcz3EITlwOFXmhUNHd8izYQ964GmPKpMaytBSoCAhXIW12eUF+zJLXux
 ZZytOQXshGLiI8YXcAykRMavyh7pAO7Dz9ngTi+uG3G9L/AugJWeVvbr6xCi3QKxU0JT
 yt/GzR5EI+elOk8lMHO3nODZe1PkR9GPqAcljStzhjJMMrxDYDzbc8Bywj/m/e/4dlhi
 cf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3cO+T0bQeybiDDylcMZkT5XwbI+vwvKzW0bev+afBvI=;
 b=FUR6ZZ9PuLMMxc/KjKaxs6pYOVsvaC/muxAX6qjMsk0CBphRAdSXOEO91awPqeG7RY
 GwDs18llS27De5igG9uKnB52tAZc9lFccfr4YuLyUB79SWLBMVK7dpbEYfrQqeCx6wKb
 jtR242nU56pDU9Wt9ThTzyamknxj+qfqdG42v/TvkSUevHMHdmndGloV4TxZ8cBsDz9z
 nifqMK7iqP5aN1S7U9uQ5iz88EUWEc16qQpUD5YUEEITEs1S1QXXoiLlozPvecGVQ/I4
 66rlvZ/4iPZPigjaC1zqZ9djzyWlhNeF3uXkrrPoNHIs054M5Zs6b7BwcKeKZ99Yd4le
 kRxg==
X-Gm-Message-State: AOAM5330QQl1c+lfH/eCnT9Jzj8oi1U27taDVjNwcW/UshL4yhtsehlE
 ZKtumwS1DE5bP3KQ8ztIllZSVfxQCN3CoKzkq3k=
X-Google-Smtp-Source: ABdhPJzmKM1QcHJfzQsj4jXxNB/RpU8H/LmsKwhn92Wu1rQVBhAqHX6DJ2YtNxUHVDYi4F4CNjY7IOHhRRdjX0LDL5U=
X-Received: by 2002:a25:ac23:: with SMTP id w35mr14838064ybi.341.1636721449662; 
 Fri, 12 Nov 2021 04:50:49 -0800 (PST)
MIME-Version: 1.0
References: <20211026113409.7242-1-igormtorrente@gmail.com>
 <20211026113409.7242-7-igormtorrente@gmail.com>
 <20211109134017.09e71c77@eldfell>
 <CAOA8r4FHpmu0ZPjTj+qM0rV5jyQ2vt467uX1vhnqUbmBUMm3dA@mail.gmail.com>
 <20211111113337.0fd68f75@eldfell>
 <CAOA8r4H-=NAxuMzJumDDHxgq2_opg6509sJN-W7EM3+LNsey2g@mail.gmail.com>
 <20211111163734.0a6aefa6@eldfell>
In-Reply-To: <20211111163734.0a6aefa6@eldfell>
From: Igor Torrente <igormtorrente@gmail.com>
Date: Fri, 12 Nov 2021 09:50:23 -0300
Message-ID: <CAOA8r4EaNvFUhKUEsuX7TuAX=D-0zbK86fxg5fD_+3M8zH2A=g@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] drm: vkms: Refactor the plane composer to accept
 new formats
To: Pekka Paalanen <ppaalanen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: hamohammed.sa@gmail.com, Thomas Zimmermann <tzimmermann@suse.de>,
 rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka,

On Thu, Nov 11, 2021 at 11:37 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Thu, 11 Nov 2021 11:07:21 -0300
> Igor Torrente <igormtorrente@gmail.com> wrote:
>
> > Hi Pekka,
> >
> > On Thu, Nov 11, 2021 at 6:33 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > >
> > > On Wed, 10 Nov 2021 13:56:54 -0300
> > > Igor Torrente <igormtorrente@gmail.com> wrote:
> > >
> > > > On Tue, Nov 9, 2021 at 8:40 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > > > >
> > > > > Hi Igor,
> > > > >
> > > > > again, that is a really nice speed-up. Unfortunately, I find the code
> > > > > rather messy and hard to follow. I hope my comments below help with
> > > > > re-designing it to be easier to understand.
> > > > >
> > > > >
> > > > > On Tue, 26 Oct 2021 08:34:06 -0300
> > > > > Igor Torrente <igormtorrente@gmail.com> wrote:
> > > > >
> > > > > > Currently the blend function only accepts XRGB_8888 and ARGB_8888
> > > > > > as a color input.
> > > > > >
> > > > > > This patch refactors all the functions related to the plane composition
> > > > > > to overcome this limitation.
> > > > > >
> > > > > > Now the blend function receives a struct `vkms_pixel_composition_functions`
> > > > > > containing two handlers.
> > > > > >
> > > > > > One will generate a buffer of each line of the frame with the pixels
> > > > > > converted to ARGB16161616. And the other will take this line buffer,
> > > > > > do some computation on it, and store the pixels in the destination.
> > > > > >
> > > > > > Both the handlers have the same signature. They receive a pointer to
> > > > > > the pixels that will be processed(`pixels_addr`), the number of pixels
> > > > > > that will be treated(`length`), and the intermediate buffer of the size
> > > > > > of a frame line (`line_buffer`).
> > > > > >
> > > > > > The first function has been totally described previously.
> > > > >
> > > > > What does this sentence mean?
> > > >
> > > > In the sentence "One will generate...", I give an overview of the two types of
> > > > handlers. And the overview of the first handler describes the full behavior of
> > > > it.
> > > >
> > > > But it doesn't look clear enough, I will improve it in the future.
> > > >
> > > > >
> > > > > >
> > > > > > The second is more interesting, as it has to perform two roles depending
> > > > > > on where it is called in the code.
> > > > > >
> > > > > > The first is to convert(if necessary) the data received in the
> > > > > > `line_buffer` and write in the memory pointed by `pixels_addr`.
> > > > > >
> > > > > > The second role is to perform the `alpha_blend`. So, it takes the pixels
> > > > > > in the `line_buffer` and `pixels_addr`, executes the blend, and stores
> > > > > > the result back to the `pixels_addr`.
> > > > > >
> > > > > > The per-line implementation was chosen for performance reasons.
> > > > > > The per-pixel functions were having performance issues due to indirect
> > > > > > function call overhead.
> > > > > >
> > > > > > The per-line code trades off memory for execution time. The `line_buffer`
> > > > > > allows us to diminish the number of function calls.
> > > > > >
> > > > > > Results in the IGT test `kms_cursor_crc`:
> > > > > >
> > > > > > |                     Frametime                       |
> > > > > > |:---------------:|:---------:|:----------:|:--------:|
> > > > > > |  implmentation  |  Current  |  Per-pixel | Per-line |
> > > > > > | frametime range |  8~22 ms  |  32~56 ms  |  6~19 ms |
> > > > > > |     Average     |  10.0 ms  |   35.8 ms  |  8.6 ms  |
> > > > > >
> > > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > > Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> > > > > > ---
> > > > > > V2: Improves the performance drastically, by perfoming the operations
> > > > > >     per-line and not per-pixel(Pekka Paalanen).
> > > > > >     Minor improvements(Pekka Paalanen).
> > > > > > ---
> > > > > >  drivers/gpu/drm/vkms/vkms_composer.c | 321 ++++++++++++++++-----------
> > > > > >  drivers/gpu/drm/vkms/vkms_formats.h  | 155 +++++++++++++
> > > > > >  2 files changed, 342 insertions(+), 134 deletions(-)
> > > > > >  create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> > > > > > index 383ca657ddf7..69fe3a89bdc9 100644
> > > > > > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > > > > > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>
> ...
>
> > > > > > +struct vkms_pixel_composition_functions {
> > > > > > +     void (*get_src_line)(void *pixels_addr, int length, u64 *line_buffer);
> > > > > > +     void (*set_output_line)(void *pixels_addr, int length, u64 *line_buffer);
> > > > >
> > > > > I would be a little more comfortable if instead of u64 *line_buffer you
> > > > > would have something like
> > > > >
> > > > > struct line_buffer {
> > > > >         u16 *row;
> > > > >         size_t nelem;
> > > > > }
> > > > >
> > > > > so that the functions to be plugged into these function pointers could
> > > > > assert that you do not accidentally overflow the array (which would
> > > > > imply a code bug in kernel).
> > > > >
> > > > > One could perhaps go even for:
> > > > >
> > > > > struct line_pixel {
> > > > >         u16 r, g, b, a;
> > > > > };
> > > > >
> > > > > struct line_buffer {
> > > > >         struct line_pixel *row;
> > > > >         size_t npixels;
> > > > > };
> > > >
> > > > If we decide to follow this representation, would it be possible
> > > > to calculate the crc in the similar way that is being done currently?
> > > >
> > > > Something like that:
> > > >
> > > > crc = crc32_le(crc, line_buffer.row, w * sizeof(line_pixel));
> > >
> > > Hi Igor,
> > >
> > > yes. I think the CRC calculated does not need to be reproducible in
> > > userspace, so you can very well compute it from the internal
> > > intermediate representation. It also does not need to be portable
> > > between architectures, AFAIU.
> >
> > Great! This will make things easier.
> >
> > >
> > > > I mean, If the compiler can decide to put a padding somewhere, it
> > > > would mess with the crc value. Right?
> > >
> > > Padding could mess it up, yes. However, I think in kernel it is a
> > > convention to define structs (especially UAPI structs but this is not
> > > one) such that there is no implicit padding. So there must be some
> > > recommended practises on how to achieve and ensure that.
> > >
> > > The size of struct line_pixel as defined above is 8 bytes which is a
> > > "very round" number, and every field has the same type, so there won't
> > > be gaps between fields either. So I think the struct should already be
> > > fine and have no padding, but how to make sure it is, I'm not sure what
> > > you would do in kernel land.
> > >
> > > In userspace I would put a static assert to ensure that
> > > sizeof(struct line_pixel) = 8. That would be enough, because sizeof
> > > counts not just internal implicit padding but also the needed size
> > > extension for alignment in an array of those. The accumulated size of
> > > the fields individually is 8 bytes, so if the struct size is 8, there
> > > cannot be padding.
> > >
> >
> > Apparently the kernel uses a compiler extension in a macro to do this
> > kind of struct packing.
> >
> > include/linux/compiler_attributes.h
> > 265:#define __packed                        __attribute__((__packed__))
>
> Hi Igor,
>
> we do not actually want to force packing, though.
>
> If there would be padding without packing, then packing may incur a
> noticeable speed penalty in accessing the fields. We don't want to risk
> that.

I understand...

>
> So I think it's better to just assert that no padding exists instead.
> There would be something quite strange going on if there was padding in
> this case, but better safe than sorry, because debugging that would be
> awful.
>

OK. I will do that and also test some alternatives.

>
> Thanks,
> pq

Thanks,
---
Igor M. A. Torrente
