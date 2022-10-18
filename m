Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BCA602FC9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 17:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E1A10EF43;
	Tue, 18 Oct 2022 15:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8D210EF43
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 15:32:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3FDE361506
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 15:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1DF6C433B5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 15:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666107139;
 bh=QX/EKb7llb6QCtdExPCwBkvhptpa3K+vuo/INCClXNs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DYulS4PmxUsNXR2nvBTvFkxjf458bejDLyltERt4EgttiUEKphVaPkbTko10Rk/fu
 Qd3j8YOZLbAW05xchAKVVR6tSvx3lnUv9aeXHfS0SOOi0efDxz8xE//NaBmLDZFAf+
 2/3Wy345G9NhNUD/dLODhflnzZi5+5GiekG5jlAUV3Drref1igak4Q98IFEt1Srd6i
 9h3f5O5d43m60Nvbj1gSEdCV0KaDRpd6xGEbzy7LiRMxXXJYhieKJws+p/MkrjFGrQ
 8+9HFsF+foUDX2PHq5Eq+x8sftWmSIhr+gX4++cfQRDJIY32og6ZAMPEC4l08oPmj+
 SUl3i8pjE3BJQ==
Received: by mail-ua1-f46.google.com with SMTP id e22so5667509uar.5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 08:32:19 -0700 (PDT)
X-Gm-Message-State: ACrzQf0gn0O2Im1GFguQ74jztms1YBM4u8xLbEipB/eDv6R97gSTtxfs
 9wvPW+m7Og9j0mgi6iPwKlpAqfsrhkTb7Wl4LQ==
X-Google-Smtp-Source: AMsMyM77fSY/875/XYF2nRfIhuJTbqdgQF8AwoUuEq4yUADekjhaA9uPXi+KY0pQHENOQNzEt9XJNGVhuBror0Z7l4Q=
X-Received: by 2002:a9f:29a3:0:b0:3d6:4c6f:9d92 with SMTP id
 s32-20020a9f29a3000000b003d64c6f9d92mr1880398uas.43.1666107138562; Tue, 18
 Oct 2022 08:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221007124946.406808-1-thierry.reding@gmail.com>
 <20221007124946.406808-5-thierry.reding@gmail.com>
 <dd869713-6eb2-fadd-fdef-6ca155198a8c@suse.de>
 <Y01sunkDsQQQhXuC@orome>
 <CAL_JsqKzSife8_ob3P=KVVcQ_ny=ppMF5LsjLxvYz95roy-y2A@mail.gmail.com>
 <Y06EHB8D1ip3PVyb@orome>
In-Reply-To: <Y06EHB8D1ip3PVyb@orome>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 18 Oct 2022 10:32:09 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJGx6-wSDd=-g84dUY-=kPu5ikCyggMnTVEGMq8K7d0Jw@mail.gmail.com>
Message-ID: <CAL_JsqJGx6-wSDd=-g84dUY-=kPu5ikCyggMnTVEGMq8K7d0Jw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] drm/simpledrm: Add support for system memory
 framebuffers
To: Thierry Reding <thierry.reding@gmail.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 18, 2022 at 5:47 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Mon, Oct 17, 2022 at 01:15:59PM -0500, Rob Herring wrote:
> > On Mon, Oct 17, 2022 at 9:54 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> > >
> > > On Mon, Oct 10, 2022 at 10:12:34AM +0200, Thomas Zimmermann wrote:
> > > > Hi
> > > >
> > > > Am 07.10.22 um 14:49 schrieb Thierry Reding:
> > > > > From: Thierry Reding <treding@nvidia.com>
> > > > >
> > > > > Simple framebuffers can be set up in system memory, which cannot be
> > > > > requested and/or I/O remapped using the I/O resource helpers. Add a
> > > > > separate code path that obtains system memory framebuffers from the
> > > > > reserved memory region referenced in the memory-region property.
> > > > >
> > > > > v2: make screen base a struct iosys_map to avoid sparse warnings
> >
> > [...]
> >
> > > > > +static int simple_framebuffer_init(struct reserved_mem *rmem)
> > > > > +{
> > > > > +   pr_info("framebuffer memory at %pa, size %lu bytes\n", &rmem->base,
> > > > > +           (unsigned long)rmem->size);
> > > > > +
> > > > > +   rmem->ops = &simple_framebuffer_ops;
> > > > > +
> > > > > +   return 0;
> > > > > +}
> > > > > +RESERVEDMEM_OF_DECLARE(simple_framebuffer, "framebuffer", simple_framebuffer_init);
> > > >
> > > > What's the prupose of these code at all?  I looked through the kernel, but
> > > > there aren't many other examples of it.
> > >
> > > This is a fairly standard construct to deal with early memory
> > > reservations. What happens is roughly this: during early kernel boot,
> > > the reserved-memory core code will iterate over all children of the top-
> > > level reserved-memory node and see if they have a compatible string that
> > > matches one of the entries in the table created by these
> > > RESERVEDMEM_OF_DECLARE entries. It will then call the init function for
> > > a matched entry and register a struct reserved_mem for these. The init
> > > function in this case just dumps an informational message to the boot
> > > log to provide some information about the framebuffer region that was
> > > reserved (which can be used for example for troubleshooting purposes)
> > > and sets the device init/release operations (which will be called when a
> > > device is associated with the reserved memory region, i.e. when the
> > > of_reserved_mem_device_init_by_idx() function is called).
> > >
> > > The reason why there aren't many examples of this is because these are
> > > special memory regions that (at least upstream) kernels seldom support.
> > > Perhaps the most common use-cases are the shared DMA pools (such as
> > > CMA).
> >
> > Also, not all regions need to be handled 'early' before slab allocator
> > or drivers are probed. Do you need early handling here? I can't see
> > why other than if fbcon is up early.
>
> No, I don't think this needs early handling. Obviously we want this to
> be available as soon as possible, but since the framebuffer driver is
> built on top of DRM and that all becomes available fairly late, I don't
> think this could ever run *that* early.
>
> So are you saying that in general if we don't need early handling we
> should avoid RESERVEDMEM_OF_DECLARE and instead manually resolve the
> memory regions and inspect them? In other words, RESERVEDMEM_OF_DECLARE
> should only ever be used when this early handling is needed?

Right. Like all the other *_OF_DECLARE() macros, they are only for
when needed before driver probe time. Lots of shared memory mailbox
drivers use reserved-memory regions if you need examples.

Rob
