Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 658572E2032
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 18:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85236E086;
	Wed, 23 Dec 2020 17:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D9E6E086
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 17:54:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CAD242229C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 17:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608746080;
 bh=oPqcaaIT1m4gIwPH079KHo8KUmZzg7kgDIJDYuGMcvY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bGpft4Kpb7t5T4fX8lhByN60ObxwL55nWpJzhHIelAITSWX0bvXmtegxYSTJN4Zxl
 T4sw2s1rmwoiwLPiUIW7JGyIM7tfyWPnaZisRDvAs56K9bnVV2r258Zllrq3efIw60
 Xqk7ptA15HCr4vleatHRwHYA+XPQo+P9s0tUyVvqfM28vAKVchNYK9O9jkO7C/YG3J
 N3N0SD38qtziXLRLBOdDTI40f9Ewmzt3R/AhxsHnnvnilbxQYSPWroVyn6u2P8sFfD
 AHY6JNQEDjZCOeioDkjceA8EfiEeZB5mmjnxg6UiXX0BLHhkUQ1hp7GaO94jA5tBIo
 4fWkBpGhcIocg==
Received: by mail-ej1-f52.google.com with SMTP id n26so274754eju.6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 09:54:39 -0800 (PST)
X-Gm-Message-State: AOAM533sRl+3HEodLx0HuyX9CqOfWVIkrcK5Ln4UPeNzmtnnenK1mKnL
 M0rQPLVKTqJEIdOQ7+aZ4beU6s3MtuuhoYSdMw==
X-Google-Smtp-Source: ABdhPJz3x4J2zw5Y7TPch4DTKXpgAX9t6V701Sxc80NsHgTOESjuz9DoVFaywy8F4VyXHmox/Q09SCSZQsxP2YotFOM=
X-Received: by 2002:a17:906:4146:: with SMTP id
 l6mr25366789ejk.341.1608746078387; 
 Wed, 23 Dec 2020 09:54:38 -0800 (PST)
MIME-Version: 1.0
References: <20201222040645.1323611-1-robh@kernel.org>
 <20201222063908.GB3463004@ravnborg.org>
In-Reply-To: <20201222063908.GB3463004@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 23 Dec 2020 10:54:26 -0700
X-Gmail-Original-Message-ID: <CAL_JsqJLw_RtLehYDLu_HKCoxDHsx-AdGTWfN0JMJhgNqLeFng@mail.gmail.com>
Message-ID: <CAL_JsqJLw_RtLehYDLu_HKCoxDHsx-AdGTWfN0JMJhgNqLeFng@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop redundant maxItems/items
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jassi Brar <jaswinder.singh@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 21, 2020 at 11:39 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Rob,
>
> On Mon, Dec 21, 2020 at 09:06:45PM -0700, Rob Herring wrote:
> > 'maxItems' equal to the 'items' list length is redundant. 'maxItems' is
> > preferred for a single entry while greater than 1 should have an 'items'
> > list.
> >
> > A meta-schema check for this is pending once these existing cases are
> > fixed.
> >
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Jassi Brar <jaswinder.singh@linaro.org>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: dmaengine@vger.kernel.org
> > Cc: alsa-devel@alsa-project.org
> > Cc: linux-usb@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> With one comment below,
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>
> > ---
> > diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> > index 737c1f47b7de..54c361d4a7af 100644
> > --- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> > +++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> > @@ -74,11 +74,8 @@ properties:
> >
> >    phys:
> >      maxItems: 1
> > -    items:
> > -      - description: phandle + phy specifier pair.
>
> The description may help some people, so keeping the
> description and deleting maxItems would maybe be better.

Do we really want to describe 'phys' hundreds of times? No. The
question I ask on the descriptions is could it be generated instead.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
