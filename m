Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8782402B9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 09:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B381989F01;
	Mon, 10 Aug 2020 07:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C29C6E1B9
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Aug 2020 20:38:32 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id i10so3702806ybt.11
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Aug 2020 13:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2kAXaCbVRwpQJ/QcWFbP9jMZCECl1RbYXm9sxJ41L1E=;
 b=saVBVhYh18DoSp1a1uNYqKqMnvq5nycV1cbYPmydXPtibPN2hPwlpJuu0qO+epIXxj
 ZICiYPxBKlUmrg8MTG+aAEv5NvlQhlLRkVS0K5FB0IsAyBZUINOPYtMbwuD78yx5fS8b
 Xr7Q/njziaFDfh+Cr1xTeIQUOVMlRu4W27IzVpRZ43N0nQ2Sv6G7/IFtDGOGJ/H5h9nz
 5kSFRazOBiYJx4IdWZlzcBk0dHIAjP1FncvqouY6GfsRi9HZ8IbS1GsJX4wLAWHr13Fj
 paIVtSgAG7YvI7Y7CH6AkN/dQolHugFFwycnGBocjCd0+kcimoKs8fG7vX3pXuJQuaFU
 hjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2kAXaCbVRwpQJ/QcWFbP9jMZCECl1RbYXm9sxJ41L1E=;
 b=p8JhRvuCyiDiCv0xpcVg5Grrj8d2yjdk+Z8reNcATUtCWLGvh1uNuOtFJr67uGSKwr
 4da1tjiyqR7lkZ8ioGILRj5ii4IpCXn1SuV4ieaPjFrr6TO6NGPflNXv/CbZwdq/n0IB
 cwi3tPJT8X/A7aR6I/ec3eDUx4QeBdkJzhly5teUo78TCgyzK+iVN0XjSIyl67PI8mDH
 jKocyHwP4B2ZDYH9AW13EFjtIMFMUhA0S/HASEMRIHQKsqDM4C9CqJwQUiO84Yd1m5wc
 DCD/SEv0HedcQbOQWE0RSUPslIcRRpWetoKfcAONkyEj2nKpq83ILsv7EFD7DEMPxygk
 rMjg==
X-Gm-Message-State: AOAM533KC/Eq2B0zxXqD971/+nMqJ3Nut638w1+0CxhvP2I0MVVPtdtc
 sZmuAsZwEbbS/sszsoBt/7juVAxMaaA/Q/Qg1EU=
X-Google-Smtp-Source: ABdhPJy+P+qfq0PsJ1YSndL5GAELxPD7MwA2VPXNB/5Lf46Iz9hpDv+wjwGD/4M6hg3bs7NAoXi83sS/eBvFkjrvidY=
X-Received: by 2002:a25:6ad6:: with SMTP id f205mr35554300ybc.76.1597005511330; 
 Sun, 09 Aug 2020 13:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200808210219.GN6186@pendragon.ideasonboard.com>
In-Reply-To: <20200808210219.GN6186@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 9 Aug 2020 21:38:05 +0100
Message-ID: <CA+V-a8ts72UAUbtcN6TTDwcHqFEF3HipLx=dkQxFCXTLLzgfXA@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm: rcar-du: Add r8a7742 support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Approved-At: Mon, 10 Aug 2020 07:35:58 +0000
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

On Sat, Aug 8, 2020 at 10:02 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Fri, Aug 07, 2020 at 06:49:49PM +0100, Lad Prabhakar wrote:
> > Add direct support for the r8a7742 (RZ/G1H).
> >
> > The RZ/G1H shares a common, compatible configuration with the r8a7790
> > (R-Car H2) so that device info structure is reused, the only difference
> > being TCON is unsupported on RZ/G1H (Currently unsupported by the driver).
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > index 3e67cf70f040..7e286c7a7a6c 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > @@ -216,8 +216,8 @@ static const struct rcar_du_device_info rcar_du_r8a7790_info = {
> >       .channels_mask = BIT(2) | BIT(1) | BIT(0),
> >       .routes = {
> >               /*
> > -              * R8A7790 has one RGB output, two LVDS outputs and one
> > -              * (currently unsupported) TCON output.
> > +              * R8A7742 and R8A7790 each have one RGB output and two LVDS outputs. Additionally
> > +              * R8A7790 supports one TCON output (currently unsupported by the driver).
>
> Once we support TCON we'll have to split this, but for now I suppose
> it's fine. Would you however mind wrapping this to 80 columns ? I can do
> so when applying if it's fine with you.
>
Agreed once TCON is added this has to be split. But isn't  the column
size has been increased (checkpatch too doesn't complain about), but
feel free to wrapp it for 80 columns.

Cheers,
Prabhakar

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> >                */
> >               [RCAR_DU_OUTPUT_DPAD0] = {
> >                       .possible_crtcs = BIT(2) | BIT(1) | BIT(0),
> > @@ -443,6 +443,7 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
> >  };
> >
> >  static const struct of_device_id rcar_du_of_table[] = {
> > +     { .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
> >       { .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
> >       { .compatible = "renesas,du-r8a7744", .data = &rzg1_du_r8a7743_info },
> >       { .compatible = "renesas,du-r8a7745", .data = &rzg1_du_r8a7745_info },
>
> --
> Regards,
>
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
