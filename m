Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88271611A6D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 20:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B19510E8B1;
	Fri, 28 Oct 2022 18:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C4210E8BE
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 18:47:32 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id a5so4023117qkl.6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 11:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+lIeCqF9MC1plkMaa8w3RYpUvhtv+mOsM3E0K5wP3Sw=;
 b=QB/yJvyFQct+2OJbnZIA/tDX8ajG1aNWWKiALtUocG5OcgRfSj5xC/jy/KZ58XFRBS
 BuoopZQTNYIml8YK2WaVS/dNg8od+ainUFxbQl6SXGED3Nc9ESxGIPeys4mFokbGBqoA
 X1k2vWg4GAnIGwJ2Gt7YFwUtKfcY3CDZkF209ennLJQCEkW96pisjBSBPF6GYq+Gdefv
 KKz8QAwRWbcDupJKAReMBeisQrYQpSJOO28tUcYJh1Cj0o3ra+lMi4nYhuGOIh1lk23I
 j0EWoC9xafzFiHR4YkSr35aAzSooNnEeyGZo5mMEie8ckTJuvwP1LFbcr9ublWnwKDa/
 pr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+lIeCqF9MC1plkMaa8w3RYpUvhtv+mOsM3E0K5wP3Sw=;
 b=JeKTpakeJxTQIbP91kLSoKHFfjRNL6hjssAu0Py8WVQXMamTfxFH+JbkMbRj/R+yUp
 1U3mPqB5nNl7WvzFeiQl0nplHHBs8vcfZouA/nmbEbJ7DmiFFJmpBX0jIETdVgwjfZWz
 CpwvxAkOuWHASfHexUz9gJsbcPVfwQ6P9CfdFDz23dBhV3WAE6Py7U1EGyvrkD4EkR1b
 Ko5xrspzmByXpGV5ztAq2dThWipEGC/UvfLNqQLqet7/j3cZgtK2H2YtHC/hqRU4zuiJ
 eKHabd3F3FGASUwUs82oHldrFggILnb74QSROLmqRbE5vD/6HzTCizmtb7spDaCMDc/s
 QqmA==
X-Gm-Message-State: ACrzQf33+edZOFR3nBvzbah6heC0ush1PYfPlgWYVGp92YgFY0Z6ZmTk
 tLm/Z7onTknQ7LfJ98e07ZstFMgAHcZrqyjQci4R5Q==
X-Google-Smtp-Source: AMsMyM56bLx8Jr1GOVzvxC6aqvYl/bq/OQWL5kJiTLnKCGyRYb9J4lp/fpUvOmNQDxGiQRuDo8iXQIlZVHQScew44u4=
X-Received: by 2002:a05:620a:2496:b0:6ee:76ce:4b3e with SMTP id
 i22-20020a05620a249600b006ee76ce4b3emr561552qkn.370.1666982851307; Fri, 28
 Oct 2022 11:47:31 -0700 (PDT)
MIME-Version: 1.0
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
 <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
 <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
 <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
In-Reply-To: <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 28 Oct 2022 19:47:19 +0100
Message-ID: <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
Subject: Re: Try to address the DMA-buf coherency problem
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: ppaalanen@gmail.com, dri-devel@lists.freedesktop.org,
 Nicolas Dufresne <nicolas@ndufresne.ca>, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Fri, 28 Oct 2022 at 18:50, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
> Am 28.10.22 um 17:46 schrieb Nicolas Dufresne:
> > Though, its not generically possible to reverse these roles. If you wan=
t to do
> > so, you endup having to do like Android (gralloc) and ChromeOS (minigbm=
),
> > because you will have to allocate DRM buffers that knows about importer=
 specific
> > requirements. See link [1] for what it looks like for RK3399, with Moti=
on Vector
> > size calculation copied from the kernel driver into a userspace lib (ar=
guably
> > that was available from V4L2 sizeimage, but this is technically difficu=
lt to
> > communicate within the software layers). If you could let the decoder e=
xport
> > (with proper cache management) the non-generic code would not be needed=
.
>
> Yeah, but I can also reverse the argument:
>
> Getting the parameters for V4L right so that we can share the image is
> tricky, but getting the parameters so that the stuff is actually
> directly displayable by GPUs is even trickier.
>
> Essentially you need to look at both sides and interference to get to a
> common ground, e.g. alignment, pitch, width/height, padding, etc.....
>
> Deciding from which side to allocate from is just one step in this
> process. For example most dGPUs can't display directly from system
> memory altogether, but it is possible to allocate the DMA-buf through
> the GPU driver and then write into device memory with P2P PCI transfers.
>
> So as far as I can see switching importer and exporter roles and even
> having performant extra fallbacks should be a standard feature of userspa=
ce.
>
> > Another case where reversing the role is difficult is for case where yo=
u need to
> > multiplex the streams (let's use a camera to illustrate) and share that=
 with
> > multiple processes. In these uses case, the DRM importers are volatile,=
 which
> > one do you abuse to do allocation from ? In multimedia server like Pipe=
Wire, you
> > are not really aware if the camera will be used by DRM or not, and if s=
omething
> > "special" is needed in term of role inversion. It is relatively easy to=
 deal
> > with matching modifiers, but using downstream (display/gpu) as an expor=
ter is
> > always difficult (and require some level of abuse and guessing).
>
> Oh, very good point! Yeah we do have use cases for this where an input
> buffer is both displayed as well as encoded.

This is the main issue, yeah.

For a standard media player, they would try to allocate through V4L2
and decode through that into locally-allocated buffers. All they know
is that there's a Wayland server at the other end of a socket
somewhere which will want to import the FD. The server does give you
some hints along the way: it will tell you that importing into a
particular GPU target device is necessary as the ultimate fallback,
and importing into a particular KMS device is preferable as the
optimal path to hit an overlay.

So let's say that the V4L2 client does what you're proposing: it
allocates a buffer chain, schedules a decode into that buffer, and
passes it along to the server to import. The server fails to import
the buffer into the GPU, and tells the client this. The client then
... well, it doesn't know that it needs to allocate within the GPU
instead, but it knows that doing so might be one thing which would
make the request succeed.

But the client is just a video player. It doesn't understand how to
allocate BOs for Panfrost or AMD or etnaviv. So without a universal
allocator (again ...), 'just allocate on the GPU' isn't a useful
response to the client.

I fully understand your point about APIs like Vulkan not sensibly
allowing bracketing, and that's fine. On the other hand, a lot of
extant usecases (camera/codec -> GPU/display, GPU -> codec, etc) on
Arm just cannot fulfill complete coherency. On a lot of these
platforms, despite what you might think about the CPU/GPU
capabilities, the bottleneck is _always_ memory bandwidth, so
mandating extra copies is an absolute non-starter, and would instantly
cripple billions of devices. Lucas has been pretty gentle, but to be
more clear, this is not an option and won't be for at least the next
decade.

So we obviously need a third way at this point, because 'all devices
must always be coherent' vs. 'cache must be an unknown' can't work.
How about this as a suggestion: we have some unused flags in the PRIME
ioctls. Can we add a flag for 'import must be coherent'?

That flag wouldn't be set for the existing ecosystem
Lucas/Nicolas/myself are talking about, where we have explicit
handover points and users are fully able to perform cache maintenance.
For newer APIs where it's not possible to properly express that
bracketing, they would always set that flag (unless we add an API
carve-out where the client promises to do whatever is required to
maintain that).

Would that be viable?

Cheers,
Daniel
