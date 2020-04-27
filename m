Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B481BA7B7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 17:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE246E314;
	Mon, 27 Apr 2020 15:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3D66E314
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 15:17:51 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 370AC206CD
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 15:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588000671;
 bh=GAViimdK4fDnDt6xwfFThdx7LtwYD225IliGLg41saw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=d9vkwjdTTR1LayfIUQrZuuh0K8KI99nJUoUy105Kssj/DAN830gEcpyL3PBNgNSqd
 LzDFnZXBB+KXfYurOZEnrJo9s3Li/U6qtBlzToQnjeH0pqXNOA+fdrFTHa2tD7TP4R
 BlYkUFvg+kwbDXojJlh2j4Ft7aQn2rxhe+asm4y0=
Received: by mail-qk1-f175.google.com with SMTP id m67so18267219qke.12
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:17:51 -0700 (PDT)
X-Gm-Message-State: AGi0Pubx0XzBoEsTMHuSk0jmxoV7tNPUm05j7p/p1MsHp/Db59GBRt0s
 aX3cc17BeXm/Ew7vTgkrC7IP4+u8HgafRl1RXw==
X-Google-Smtp-Source: APiQypJ8mFL+gjW5lKQgC6uwov2MJioYazUfFzUC1Buo0mAtWaA7rKgJG7DMRtEDKmm77diSPGR4BCMAcO05vMTTojk=
X-Received: by 2002:a37:61cd:: with SMTP id
 v196mr22311959qkb.393.1588000670247; 
 Mon, 27 Apr 2020 08:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200424222740.16259-1-afd@ti.com>
In-Reply-To: <20200424222740.16259-1-afd@ti.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 27 Apr 2020 10:17:37 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+4mf6QHX27knoHTXA4vnsC3swuvAH7zK1DpyaV-p_qbw@mail.gmail.com>
Message-ID: <CAL_Jsq+4mf6QHX27knoHTXA4vnsC3swuvAH7zK1DpyaV-p_qbw@mail.gmail.com>
Subject: Re: [PATCH] misc: sram: Add dma-heap-export reserved SRAM area type
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 24, 2020 at 5:27 PM Andrew F. Davis <afd@ti.com> wrote:
>
> This new export type exposes to userspace the SRAM area as a DMA-Heap,
> this allows for allocations as DMA-BUFs that can be consumed by various
> DMA-BUF supporting devices.
>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>  .../devicetree/bindings/sram/sram.yaml        |   8 +

Separate patch and needs to go to DT list...

>  drivers/misc/Kconfig                          |   7 +
>  drivers/misc/Makefile                         |   1 +
>  drivers/misc/sram-dma-heap.c                  | 243 ++++++++++++++++++
>  drivers/misc/sram.c                           |  20 +-
>  drivers/misc/sram.h                           |  17 ++
>  6 files changed, 292 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/misc/sram-dma-heap.c
>
> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
> index 7b83cc6c9bfa..b8e33c8d205d 100644
> --- a/Documentation/devicetree/bindings/sram/sram.yaml
> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> @@ -105,6 +105,14 @@ patternProperties:
>            manipulation of the page attributes.
>          type: boolean
>
> +      dma-heap-export:
> +        description:
> +          Similar to 'pool' and 'export' this region will be exported for use
> +          by drivers, devices, and userspace using the DMA-Heaps framework.
> +          NOTE: This region must be page aligned on start and end in order to
> +          properly allow manipulation of the page attributes.
> +        type: boolean

Though I'm not sure this should be in DT. You have to change your
firmware to enable a new kernel feature? We also already have 'export'
which sounds like the same function. Or 'pool' though reading the
description, I don't really understand it's use.

What combination of all 3 of these options would be valid?

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
