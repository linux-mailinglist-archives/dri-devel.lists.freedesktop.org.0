Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADAA2402C1
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 09:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE6D6E3A0;
	Mon, 10 Aug 2020 07:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095A86E32D
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Aug 2020 21:10:33 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id e187so4118954ybc.5
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Aug 2020 14:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FS8VaTKhvmE9nkcm+P7/rVO4xd8egtxbMts7IrjMZwI=;
 b=ZQRUBrsPLmUUs7t88nCb6LotejwEP/cgcI98kyJDCKbSVi2Kololr0uWmXdZ01Bg66
 wFLgXUSdinK/mEHiVQaUOwXdNcfU/8T7bzJvmhasepu3KGqp6GvvGGzjHj7a7jRZ4s3E
 RpkAkbyttWxwchd2mE7vxkKqF4KynL+rlghuwUqTDg0KsrXR6ZedXD54/l9dNhdapTBo
 fl+qvqSQT5wYii5j9Z/RpMZ4GbMG4uha9zP6a6FnfzjNH4+AEsM3tYj1zWEoRu1b+s9r
 vJrq9+l2M4NA/P8uXUpqolBNY3Ey2QbpIfjI/TFKvhI/1suRYlRAdP1LiiVf580gGp18
 YZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FS8VaTKhvmE9nkcm+P7/rVO4xd8egtxbMts7IrjMZwI=;
 b=L3GUh9gVn972uI4TF6vBV79pAjzgV/BOGGP8dYEaKbwEd3ezGbB5vZIPPJZkkcMh2Y
 46vVDjk9Pa2i1W4ppHCGD6W7l+y8DXy/RFWqPEIxs+xF5ul0AJVFez+HSNJXpKTj4cI+
 /x4+3rRwdsSe4grH5t+SMLtiBuxiRYc08K2L3EHJy6wzR2kPFPy/onRcVVtyGafLHNFL
 ODWKf3oWcfs60OpCNLtMBY3SvdYREbgLgKrAdtE/OUMpNZKBKSsHeArWBjczFoXeJ6Go
 ppp3BBQQa762xieVMs6UFZHFfTXc8n7vUoj1/HnxQ/kMYfQofsmyFuQ3r3PJzAvTJCqe
 A6MQ==
X-Gm-Message-State: AOAM5314f/4702H99NOMx9KVBpMi/YwzCiyd+/BzIOFjfPpAQucuAas/
 Xo+DpfJlQh2zRNtE3W0hTFAVuP0+KhagKN+fDEE=
X-Google-Smtp-Source: ABdhPJzkl+3oTLnEZzeGv+iWA/CW3+k2mTV9RRXQRR9+q7yU8D9yy1zyS867h86taMVevrq1/x0F54w50zETzAA9MFQ=
X-Received: by 2002:a5b:40f:: with SMTP id m15mr32122222ybp.25.1597007432213; 
 Sun, 09 Aug 2020 14:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200808210321.GO6186@pendragon.ideasonboard.com>
 <20200808210507.GP6186@pendragon.ideasonboard.com>
In-Reply-To: <20200808210507.GP6186@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 9 Aug 2020 22:10:06 +0100
Message-ID: <CA+V-a8vGYtVUjXXGAMeZjMYq4BCt2ZVkkWeuqn8EffcRx46P0g@mail.gmail.com>
Subject: Re: [PATCH 3/7] dt-bindings: display: renesas,
 lvds: Document r8a7742 bindings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Approved-At: Mon, 10 Aug 2020 07:35:59 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thank you for the review.

On Sat, Aug 8, 2020 at 10:05 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Sun, Aug 09, 2020 at 12:03:27AM +0300, Laurent Pinchart wrote:
> > Hi Prabhakar,
> >
> > Thank you for the patch.
> >
> > On Fri, Aug 07, 2020 at 06:49:50PM +0100, Lad Prabhakar wrote:
> > > Document the RZ/G1H (R8A7742) LVDS bindings.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> I actually spoke too soon, this binding has been concerted to YAML in
> drm-next. I can fix this when applying, no need to resubmit just for
> this.
>
Thank you for taking care of it.

Cheers,
Prabhakar

> > > ---
> > >  .../devicetree/bindings/display/bridge/renesas,lvds.txt          | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > > index c62ce2494ed9..40aa809f41cd 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > > @@ -7,6 +7,7 @@ Gen2, R-Car Gen3 and RZ/G SoCs.
> > >  Required properties:
> > >
> > >  - compatible : Shall contain one of
> > > +  - "renesas,r8a7742-lvds" for R8A7742 (RZ/G1H) compatible LVDS encoders
> > >    - "renesas,r8a7743-lvds" for R8A7743 (RZ/G1M) compatible LVDS encoders
> > >    - "renesas,r8a7744-lvds" for R8A7744 (RZ/G1N) compatible LVDS encoders
> > >    - "renesas,r8a774a1-lvds" for R8A774A1 (RZ/G2M) compatible LVDS encoders
>
> --
> Regards,
>
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
