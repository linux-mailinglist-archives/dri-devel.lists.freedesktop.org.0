Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 589892E1B43
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015366E8E4;
	Wed, 23 Dec 2020 10:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B37C89D7C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 16:40:06 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id m5so1644033pjv.5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 08:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XA14ElTeUosr9Ce812CRm87QO2rKQtr679G385v8kMg=;
 b=XBZl/fP8JfaKjImHJU56Okh7Pmq6oSlqsbjWtruce/kIO+jNbne6lPveMeQNQxnp5g
 +pLF+j+xuYF+XItUHD9rfD7VgypsMkmaK4nZpJHJen72knZ1pLBtdHdXDQxE0BC9Abuo
 mDIHGzkXvFPSxBY8Van6Xt+9NYy1KH+7/f6nWtI7nfPVkJpq3+bCiVwi6NIsm96Hi7cL
 xoYGhxL+b298xlYDlZyhkmbOYST4O3GRlyHcQOjcGS/uADxtKhbdw+TofsHeS4LqtMAc
 aKrOjvIvuZtyW07CYTs1Goinb3iDKTwpMNyt6HXSEU2k/xhq895exHFUv2vhPgKJJLjF
 Qr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XA14ElTeUosr9Ce812CRm87QO2rKQtr679G385v8kMg=;
 b=hyrqQ73ckSWWwMMD6NA5BjNPKbWyhXtUI/Um4YQb08otMtnoCUuj5qnZHp1LxKTNdh
 EXsf6UE2CrBSoBdKPWyu+SB3dtV7r08k5f0eYYikgXLP8b5cG4Vyz16TM9jH0W5+scnA
 Dw7hK5vXXayJ08Khy7mILcO6gARjNR+TlYe4QBKAjQIia3d5wX2yzUwcOoVqEEiGyIeA
 OMacZ768lgMJzwdNjHIyZL7z+gutIZFcaIDpoyLC1ExZE4TNQ0ac8O5p3I1T6eLK0X4L
 oPB3ffKmUOFuFPmTEgSEg6NczTYyZfsP1F3dOZoSf0/XBS6tEbd/GhDrOES9wMEvsM3P
 LEqA==
X-Gm-Message-State: AOAM531geml4urqcMwZtC7besRy4r4bm9bDRtLzANBm1erE8GZBbR8m8
 FhstTky/Bd313m+lwLC5vb7nLY7Ke4E3UL1Plb0=
X-Google-Smtp-Source: ABdhPJzIwF2uyoRs5h3zHcpXR9B8X/+Kqf1ghnirkIrgLeEnyEAF8eGlnlscDztG0W09G5UHgi1pkkPM9Nt/7w4z4jE=
X-Received: by 2002:a17:902:82c7:b029:da:cb88:38f8 with SMTP id
 u7-20020a17090282c7b02900dacb8838f8mr22192274plz.49.1608655205691; Tue, 22
 Dec 2020 08:40:05 -0800 (PST)
MIME-Version: 1.0
References: <20201222040645.1323611-1-robh@kernel.org>
In-Reply-To: <20201222040645.1323611-1-robh@kernel.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Tue, 22 Dec 2020 10:39:55 -0600
Message-ID: <CABb+yY0Q+7vqoVsHJEdP4r9+RwhjEKoBHnKRtGqKc3BNAP_SCQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop redundant maxItems/items
To: Rob Herring <robh@kernel.org>
X-Mailman-Approved-At: Wed, 23 Dec 2020 10:51:31 +0000
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
Cc: Devicetree List <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Jassi Brar <jaswinder.singh@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dmaengine@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 21, 2020 at 10:10 PM Rob Herring <robh@kernel.org> wrote:
>
> 'maxItems' equal to the 'items' list length is redundant. 'maxItems' is
> preferred for a single entry while greater than 1 should have an 'items'
> list.
>
> A meta-schema check for this is pending once these existing cases are
> fixed.
>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jassi Brar <jaswinder.singh@linaro.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: dmaengine@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml    | 1 -
>  Documentation/devicetree/bindings/dma/renesas,rcar-dmac.yaml   | 1 -
>  Documentation/devicetree/bindings/mailbox/arm,mhu.yaml         | 1 -
>  .../devicetree/bindings/sound/nvidia,tegra30-hda.yaml          | 2 --
>  Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml    | 1 -
>  Documentation/devicetree/bindings/usb/renesas,usbhs.yaml       | 3 ---
>  6 files changed, 9 deletions(-)

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
