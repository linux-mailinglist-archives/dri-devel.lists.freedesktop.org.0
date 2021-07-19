Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 874E63CCC75
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 04:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8469889E57;
	Mon, 19 Jul 2021 02:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2B189E57
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 02:59:18 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id x17so21770370edd.12
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jul 2021 19:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pw/ymT7jTI4vbe9EaHsLlpbaG3qADekUdaOoeZi9DCI=;
 b=N6dvNJGmplWlVHUfqKxCiO2YRlq9xOWASWYoxMFmKqo8XQSvSmc/KzvxC5n5K3/qcC
 mXivOogsUDIFmfvM1VFQcoltPPbrVhryDHWYIzFjFxCpL1KwD+m88meKroRfJ98DeAO4
 rYuKsPmdg4byYvJ7UNo3h9AWz8WOiGUbwRTuNuht/WjMsSDu2Tn1KS1+AzadNNr6kz2B
 Z0xBg3B8qB8mzBjxQS/subjiXw5ND9R8DH/+LN4g0hHJATcXWeqUjtCgAz0n3yAw7Mes
 AvMCR0txSFHoIfw+m9F3cbKHbZ8/zpprDfcBNywDMH+VQUf8VJcG137+oFoelGqFfHB6
 PUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pw/ymT7jTI4vbe9EaHsLlpbaG3qADekUdaOoeZi9DCI=;
 b=qBRkIpfgFgpzDIKChDp0cxq5561JnTLPNQxwulSFiE2SLw49EIffZClkMzuOocqoQK
 wCXcGtLOcQEhpG/s3R4cdOTV4gJD2zMMduOsjd+Beq1m6N1CMupCVpiNLCeYYYfvJ0bd
 P3bpiK83vVOlacGNaAbAqjFh8Gd9solMhPXpuDK7JF14ApDqGwgL18KthnvmNblSGT6F
 9vyNP0HwJal2aFH21rDj0lH38lG2W3XP7VXNF7z/4s4895p0+VZ0oNQqLVcT3Ds/7l5S
 sdB884hHmYFmfwFBWgQvXldpeYnORoHCJbG8pstQP887c84cU3QbKHaWArsv3jc0y8j7
 GDMA==
X-Gm-Message-State: AOAM531bd1hpZZai2pb+kRR0dghkPkzCaQFYgDDhu9v7TtqctiTFIZBa
 S643m9KIjx+Yjs5aXcEuEX3fTju2dZ0QILmzwaM=
X-Google-Smtp-Source: ABdhPJzDYG5f7P7jdkKSk8KghE2W4nVdpPNwQo3VTesZyc9brB+mQqwde7gjS7CS/C495OdoAgptMS7+b1KWthjJxgU=
X-Received: by 2002:a05:6402:291a:: with SMTP id
 ee26mr31661153edb.220.1626663557377; 
 Sun, 18 Jul 2021 19:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210625130947.1803678-1-javierm@redhat.com>
 <e61cf77c-6bff-dfcc-d3df-2fb6b48e5897@redhat.com>
 <8dd26141-a09c-39e2-5174-4cad8d21c49c@suse.de>
In-Reply-To: <8dd26141-a09c-39e2-5174-4cad8d21c49c@suse.de>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 19 Jul 2021 12:59:06 +1000
Message-ID: <CAPM=9tyfNPa2f5PDBLm4w_H_riEQ5P3rEhX73YGE1y_ygRox+w@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] allow simple{fb, drm} drivers to be used on
 non-x86 EFI platforms
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-efi@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, the arch/x86 maintainers <x86@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Robinson <pbrobinson@gmail.com>, Borislav Petkov <bp@suse.de>,
 Albert Ou <aou@eecs.berkeley.edu>, Hans de Goede <hdegoede@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 15 Jul 2021 at 18:11, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 13.07.21 um 18:59 schrieb Javier Martinez Canillas:
> > On 6/25/21 3:09 PM, Javier Martinez Canillas wrote:
> >> The simplefb and simpledrm drivers match against a "simple-framebuffer"
> >> device, but for aarch64 this is only registered when using Device Trees
> >> and there's a node with a "simple-framebuffer" compatible string.
> >>
> >> There is no code to register a "simple-framebuffer" platform device when
> >> using EFI instead. In fact, the only platform device that's registered in
> >> this case is an "efi-framebuffer", which means that the efifb driver is
> >> the only driver supported to have an early console with EFI on aarch64.
> >>
> >> The x86 architecture platform has a Generic System Framebuffers (sysfb)
> >> support, that register a system frambuffer platform device. It either
> >> registers a "simple-framebuffer" for the simple{fb,drm} drivers or legacy
> >> VGA/EFI FB devices for the vgafb/efifb drivers.
> >>
> >> The sysfb is generic enough to be reused by other architectures and can be
> >> moved out of the arch/x86 directory to drivers/firmware, allowing the EFI
> >> logic used by non-x86 architectures to be folded into sysfb as well.
> >>
> >
> > Any more comments on this series? It would be nice for this to land so the
> > simpledrm driver could be used on aarch64 EFI systems as well.
> >
> > The patches have already been acked by x86 and DRM folks.
>
> Time to get this merged, I'd say. People are asking for these patches
> already.

Can we just merge via drm-misc and make sure the acks are present and
I'll deal with the fallout if any.

Dave.
