Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFD91E7F6E
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 15:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4216E900;
	Fri, 29 May 2020 13:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102DE6E900
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 13:58:34 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s8so3672808wrt.9
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 06:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N8W5zct5Gx8BLNzMDfYGyBH+eB4JXo/MXqhIvPCT8QI=;
 b=mlLU0F8j8I9c7uoJQ2h8qvbsBYjp2cDxmG2h1Cot2Dhf6Hs6RUj4O7ZP6KbSB1EFvj
 n1+wD9nvy5Ytsb++IFdb3ZOWVhvd6MfJ6O2J0qiLjF8AeN8MYfioVET3IskBp6jHDeQM
 AXc6KZ9/wI2FAM1NAlEh1YwgdRdPgNwevQXcmVM29gVEMFJ02t8Lj99Q5HCop03tW5XY
 qCs5gGtKtr6n+VggE/UU1RauTiwmSYGIFACyYUEYWh/nFU0kkMk95cnvMJC78E2ki2nS
 wTxSRXs5e/LE2qYuaQ6bdrquh4Rc5+VNF44z1D9u/CbLjFz90J/PLcHcbRyFNEVWM4m4
 VkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N8W5zct5Gx8BLNzMDfYGyBH+eB4JXo/MXqhIvPCT8QI=;
 b=i+AjkJMEGN1ozqkr8h6B22vNfp+CqeQiiGvqxTHqGJLXQEZUqEmfn1TNSvPgyPpoEL
 1wSiDgnm60/4iIy62suY1mzzjH6YYwQYKSiYEC3P5xvxEY13Em8eyn4PoQWkffVvKecR
 ua5AGNuf4KABMW6QvPGmBQAyYJnqS6YPVdpD4TlY1SqsYDwRjGKK7tZyeXrB5qO2heUJ
 y3SC/lldA2xHSbhtI/Ho/2fs7VF/0cq/b2K2zoCWekQVmIJHtNTgqhFnSo+UWPaKpn+A
 QBjJ1D0VJGHClM42ho7OHgt/czVtZpgW2FpR9rixTiM4Gu1co7RKLVRJNdCCIcLToZr6
 6dDA==
X-Gm-Message-State: AOAM531WX/2y84y4ToPDEEdN5+yQZ6UA48N1NbOGXlP49hXvwBZhjYwX
 1vYZRNLxHahdXN4Ob9j7SBHdfPPgq23L/QjnEvE6f0GpDLE=
X-Google-Smtp-Source: ABdhPJxbf9r3VOPMqH/rnkjBKJE99kzb2ORUGYz7wOouKRWQsYi2iae4Atr5/oIm84STOmEM7VpseOIR5PHTspufNk4=
X-Received: by 2002:adf:db09:: with SMTP id s9mr8706033wri.256.1590760712577; 
 Fri, 29 May 2020 06:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <WOsdNGp0dhyp8Modsrt7DYpd0fVk7Yk264FISQ1Yls30bhlSXbxzgKTpmOCJ9H2WV1XHyUjCXu7nwBOWQ6n1NCbIcVl1-1IZ4rMMGN1dN-U=@emersion.fr>
 <CAAxE2A4NCo_KMkemUOHKbZ7P=GR4p-zwhpmP7Get18x4Ydb-Gg@mail.gmail.com>
 <bbZABMxDckHUj5JW5DW0pSewqQ-rAIW0gvNnTlI4np7o1A2bDrpPGIeyk5tXGMDr_cAI1l_R9qw6ykJ8OEhQlbKruJ8IG579jqADaPAnUbA=@emersion.fr>
 <CADnq5_MEFM_2k_uboU6E9d3_j18K+tz=Axtie-80PSSwJ2vkYw@mail.gmail.com>
In-Reply-To: <CADnq5_MEFM_2k_uboU6E9d3_j18K+tz=Axtie-80PSSwJ2vkYw@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 29 May 2020 14:56:41 +0100
Message-ID: <CAPj87rMrJLNNbFJVvf081=eRqPqAe1H7=+PM21N22Jdsg7FzVQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/fourcc: document modifier uniqueness requirements
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

On Fri, 29 May 2020 at 14:29, Alex Deucher <alexdeucher@gmail.com> wrote:
> On Fri, May 29, 2020 at 4:59 AM Simon Ser <contact@emersion.fr> wrote:
> > OK. In this case I think it's fine to make the DMA-BUF import fail, as
> > we've suggested on IRC. The more-or-less planned fix for these buffer
> > sharing issues is to revive the buffer constraints proposal from the
> > allocator project. It's a lot of work though.
>
> I get that, but why explicitly limit modifiers then?  Shouldn't we try
> and do the best we can with what we have now?  If not the situation is
> not much better than what we have now.  Why go through the effort or
> adding modifer support in the first place if they are mostly useless?

Well sure, we could add pitch alignment in there. And height
alignment. And starting byte offset. And acceptable byte distance
between planes. And physical contiguity / number of backing pages. And
placement (system vs. GTT vs. local), which also implies adding a
device-unique identifier whilst we're at it. And acceptable
width/height bounds. All of those are perfectly valid constraints
which could cause imports to fail, and not even an exhaustive list.

How does Navi ensure that every single linear dmabuf source it can
ever receive is aligned to 256 bytes today? How does adding support
for modifiers - something which does solve other problems, like 'every
three months I wearily review a patch forcing all winsys buffers to be
allocated for scanout usage for a new random reason, regressing
performance for a lot of other vendors' - make Navi's situation worse?

> I don't quite get what we are trying to do with them.  What does this
> mean "Modifiers must uniquely encode buffer layout"?  We have a number
> of buffer layouts that are the same from a functional standpoint, but
> they have different alignment requirements depending on the chip and
> the number of memory channels, etc.  Would those be considered the
> same modifer?  If not, then we are sort of implicitly encoding
> alignment requirements into the modifier.

Yes, of course some requirements are implicit. Given that tiles are
indivisible, it makes no sense to have a 64x64 tiled buffer with a
32-pixel stride. But that isn't the same thing as encoding an
arbitrary constraint, it's just a requirement of the encoding.

The reason why modifiers have been successful and adopted by every
other vendor apart from IMG, is exactly because they _don't_ attempt
to boil the ocean, but are the most practical realisation of improving
performance within a complex ecosystem. The allocator is the complete
and exhaustive solution to all our problems, but it's not exactly
going to be done tomorrow.

Playing a single video today could easily involve a V4L2 codec source
into a V4L2 postprocessor into Chromium's Wayland host compositor
through Chromium itself into the host Wayland compositor and finally
into EGL and/or Vulkan and/or KMS. If you want to figure out what the
V4L2/DRM/KMS, GStreamer/VA-API/Kodi, EGL/Vulkan, and Wayland/X11 APIs
look for negotiating a totally optimal layout across at least three
different hardware classes from at least three different vendors, then
I'm all for it. I'll be cheering you on from the sidelines and doing
what I can to help. But the only reason we've got to this point today
is because Allwinner, AmLogic, Arm, Broadcom, Intel, NVIDIA, NXP,
Qualcomm, Rockchip, Samsung, and VeriSilicon, have all spent the last
few years trying to avoid perfection being the enemy of good. (And
those are just the hardware vendors - obviously Collabora and others
like us have also put not-inconsiderable effort into getting at least
this far.)

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
