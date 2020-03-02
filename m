Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E900E177102
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADFF6E9F1;
	Tue,  3 Mar 2020 08:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624AA6E127
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:21:40 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id o2so296815vka.10
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H/ZXePw08jIq7OBB1YUZ7Aye4n93ozY+7PwFaAkmQrs=;
 b=e0zMyqz+F+6zRjoWtD/mmEgf34GKDHSCQlnC/uFR2APNtgaNTLYdn/QIN8teuoIAIM
 rff9jQj/X45gNaRymYGKIMomIBf61QRu0cSWCxImAgLP2bGNh7kxVBOw9RxTu3c/ObV9
 w6VlRCQMySed3qvqkTtidujVwrsaEQIQO2ye2MqYmi/E97frP8ZV4KBO/a6zgm7b5gDy
 fi7YE9kwimD1YdzUI/ow0fLyrYA4zPh63n6XoJUb7TrsyOTHqtwjnkvWjMfi560AYAe1
 nhM+BOAVhrxNIhnQoGdJw164oDxtFr1/SVpWWMI74s4/mGAfgAiiY3xH+RUsO/p6kIBU
 d1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H/ZXePw08jIq7OBB1YUZ7Aye4n93ozY+7PwFaAkmQrs=;
 b=SwpzBhlhnxphTwl7p1CZ2C6E1REDB7CCq/U2m8jNArdkzI7A8p0CT2bDcY5l7YEOtO
 JGoQ0m4oTb9gEzln739mfO5MYCY1CWoxraX4jBZIiL9Ci/LsAI3FRZKM47PKdMJDeXjZ
 QSzeQeXS4pNhsLHGjlCFfxLsVfbqUSnymMe/kyUZx0WKC6Fpv5gBKVlw65pGXGYjqT+T
 /DJjsIXvHtd23yHc8l4k3TdJ93za/ao4z/XKqwlo3xMZKZV6eSG4q8R4u/7c+O+Z7DCz
 TPx796fqGpOwM7dK2XoZZLTePxdubypH3KK18mWa8XA1GVGbqhJ0c3ChrmGyLH6FUvTq
 M1tQ==
X-Gm-Message-State: ANhLgQ0Y6e6mStbvpjod2enNIHj9aO4cS0nsGhWqU3clN0z2kTxCjYnq
 /7pTLt4nD3Rxx/0DJ+o0p9ilaejCEVtGuoQAzqc=
X-Google-Smtp-Source: ADFU+vtgTWEvlHrNTmJtHyKDJof9QYg21GqyVkzf3O6lrAwFQuvxk7BBzUe3gFp1CedXXmdr/MQo9bYXpNXIavJAaGY=
X-Received: by 2002:a1f:284:: with SMTP id 126mr151121vkc.16.1583187699557;
 Mon, 02 Mar 2020 14:21:39 -0800 (PST)
MIME-Version: 1.0
References: <20200227210454.18217-1-alistair.francis@wdc.com>
 <20200228095748.uu4sqkz6y477eabc@sirius.home.kraxel.org>
In-Reply-To: <20200228095748.uu4sqkz6y477eabc@sirius.home.kraxel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 2 Mar 2020 14:14:02 -0800
Message-ID: <CAKmqyKOTjyRL9vxZrZW8Q+yBM0n-Nw-o-Cn3dUDDfAAa7Nswrg@mail.gmail.com>
Subject: Re: [PATCH] drm/bochs: Remove vga write
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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
Cc: airlied@linux.ie, Khem Raj <raj.khem@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 28, 2020 at 1:57 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Thu, Feb 27, 2020 at 01:04:54PM -0800, Alistair Francis wrote:
> > The QEMU model for the Bochs display has no VGA memory section at offset
> > 0x400 [1]. By writing to this register Linux can create a write to
> > unassigned memory which depending on machine and architecture can result
> > in a store fault.
> >
> > I don't see any reference to this address at OSDev [2] or in the Bochs
> > source code.
> >
> > Removing this write still allows graphics to work inside QEMU with
> > the bochs-display.
>
> It's not that simple.  The driver also handles the qemu stdvga (-device
> VGA, -device secondary-vga) which *does* need the vga port write.
> There is no way for the guest to figure whenever the device is
> secondary-vga or bochs-display.
>
> So how about fixing things on the host side?  Does qemu patch below
> help?

That patch looks like it will fix the problem, but it doesn't seem
like the correct fix. I would rather avoid adding a large chunk of
dummy I/O to handle the two devices.

>
> Maybe another possible approach is to enable/disable vga access per
> arch.  On x86 this doesn't cause any problems.  I guess you are on
> risc-v?

I would prefer this option. I do see this on RISC-V, but I suspect the
issue will appear on other architectures (although how they handle I/O
failures in QEMU is a different story).

Can I just do the VGA write if x86?

Alistair

>
> cheers,
>   Gerd
>
> diff --git a/hw/display/bochs-display.c b/hw/display/bochs-display.c
> index 62085f9fc063..e93e838243b8 100644
> --- a/hw/display/bochs-display.c
> +++ b/hw/display/bochs-display.c
> @@ -151,6 +151,26 @@ static const MemoryRegionOps bochs_display_qext_ops = {
>      .endianness = DEVICE_LITTLE_ENDIAN,
>  };
>
> +static uint64_t dummy_read(void *ptr, hwaddr addr, unsigned size)
> +{
> +    return -1;
> +}
> +
> +static void dummy_write(void *ptr, hwaddr addr,
> +                        uint64_t val, unsigned size)
> +{
> +}
> +
> +static const MemoryRegionOps dummy_ops = {
> +    .read = dummy_read,
> +    .write = dummy_write,
> +    .valid.min_access_size = 1,
> +    .valid.max_access_size = 4,
> +    .impl.min_access_size = 1,
> +    .impl.max_access_size = 1,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
>  static int bochs_display_get_mode(BochsDisplayState *s,
>                                     BochsDisplayMode *mode)
>  {
> @@ -284,8 +304,8 @@ static void bochs_display_realize(PCIDevice *dev, Error **errp)
>      memory_region_init_io(&s->qext, obj, &bochs_display_qext_ops, s,
>                            "qemu extended regs", PCI_VGA_QEXT_SIZE);
>
> -    memory_region_init(&s->mmio, obj, "bochs-display-mmio",
> -                       PCI_VGA_MMIO_SIZE);
> +    memory_region_init_io(&s->mmio, obj, &dummy_ops, NULL,
> +                          "bochs-display-mmio", PCI_VGA_MMIO_SIZE);
>      memory_region_add_subregion(&s->mmio, PCI_VGA_BOCHS_OFFSET, &s->vbe);
>      memory_region_add_subregion(&s->mmio, PCI_VGA_QEXT_OFFSET, &s->qext);
>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
