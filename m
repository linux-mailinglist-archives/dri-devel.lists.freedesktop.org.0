Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6DD2402D5
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 09:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11116E384;
	Mon, 10 Aug 2020 07:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C1D6E2A5
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Aug 2020 21:29:59 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id a34so4125519ybj.9
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Aug 2020 14:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ORAT8UucilC3IwrKP3UItEtUbW3Qy+oRV7IOUt8IGrw=;
 b=skYyeSEoTdqbH1+pnfJFV9NFJ+4eS+a2Mks1/TnaCZu4YH64WLfkTPwkE+nCEc82xO
 FRJMQN5rQHvWHAAeqA2pVaXn+UbvK13FrkBNMXADx+yoaQjvIwZxCFjTjwx4LI1WyvFH
 nYMfGKGMUvSIFdSZn7ViEsu7X/GCxA/4iFe1GUenYqCbCaufBOW8yF6nTnuqJm1Rhbq7
 iLFs+MvzRQ8Qn8wvbiSZLlZvDQcWRxaFKFp3H2bXzrLKvf6iBSjQ0Jw5rWTnNz3BTGUj
 zFIlO+sgQyLYlulJF2/xofKQjyzTBF4vQrm53HqYrX5+i1ZGhrHW9Nh89+LejHNCKMAE
 +1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ORAT8UucilC3IwrKP3UItEtUbW3Qy+oRV7IOUt8IGrw=;
 b=WBFzxikwkdR+tWHneMaaGY1xCDgPOD1c7sXbxX1aaint8c8t8QwKo3qQ3n2C3dIhbn
 nE+R5BA5osPuyyxCUqHMX8UpAFDCSlVLDC4YDZN+ZhknPC2jIV5MS3L/5ultRa/i+QEp
 h//VhGxQU/vo+sSbJR7ReXOTikW4pZqd5Ir1ZESbzVR0+qSzJB+zR+FdigMG5RGevLTn
 RRfKR8mYrphUHeniE922P+ULTo5+Q/yk86+vxYoQQfTpwkYWt+BCZf7LFpep9A0JL5bS
 x9XIxYZ/+yii3l7xou9fz+WZiY0TMA5UfF2L1otXunJFP0YDspa94hPdPBS4FpDntemg
 SKXA==
X-Gm-Message-State: AOAM53115B3+6U0048vLU/5Y1JcpzqEdIuFxD1Y3YpUZbN3jtZs5iRz5
 Pxve82URi2pjTskEieaqoyvZG+Dml2TgrArklXI=
X-Google-Smtp-Source: ABdhPJykZDTT3kd4F6y0xhJQLQH0CY1/8xLgR6i6+pWRSXQv+cKO4hgtt71iv+8B4K1WLpq6EaUav0+9fAu/PlN+990=
X-Received: by 2002:a25:6ad6:: with SMTP id f205mr35763935ybc.76.1597008599048; 
 Sun, 09 Aug 2020 14:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200808211323.GR6186@pendragon.ideasonboard.com>
In-Reply-To: <20200808211323.GR6186@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 9 Aug 2020 22:29:32 +0100
Message-ID: <CA+V-a8v0nXwe0iN2ymqE5YgcgOymWYv-Xf6N+rw_nJnUgx4yMQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] ARM: dts: r8a7742: Add LVDS support
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

On Sat, Aug 8, 2020 at 10:13 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Fri, Aug 07, 2020 at 06:49:53PM +0100, Lad Prabhakar wrote:
> > Add LVDS encoder node to r8a7742 SoC DT.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > ---
> >  arch/arm/boot/dts/r8a7742.dtsi | 54 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/r8a7742.dtsi b/arch/arm/boot/dts/r8a7742.dtsi
> > index a979a4b3de61..a7e66220d63a 100644
> > --- a/arch/arm/boot/dts/r8a7742.dtsi
> > +++ b/arch/arm/boot/dts/r8a7742.dtsi
> > @@ -1534,11 +1534,65 @@
> >                               port@1 {
> >                                       reg = <1>;
> >                                       du_out_lvds0: endpoint {
> > +                                             remote-endpoint = <&lvds0_in>;
> >                                       };
> >                               };
> >                               port@2 {
> >                                       reg = <2>;
> >                                       du_out_lvds1: endpoint {
> > +                                             remote-endpoint = <&lvds1_in>;
> > +                                     };
> > +                             };
> > +                     };
> > +             };
> > +
> > +             lvds0: lvds@feb90000 {
> > +                     compatible = "renesas,r8a7742-lvds";
> > +                     reg = <0 0xfeb90000 0 0x1c>;
>
> Isn't 0x14 enough for the size ? 0x1c won't hurt though. Same comment
> below.
>
Agreed, 0x1c comes from Gen-3 manuals.

Cheers,
Prabhakar

> With or without this addressed,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > +                     clocks = <&cpg CPG_MOD 726>;
> > +                     power-domains = <&sysc R8A7742_PD_ALWAYS_ON>;
> > +                     resets = <&cpg 726>;
> > +                     status = "disabled";
> > +
> > +                     ports {
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +
> > +                             port@0 {
> > +                                     reg = <0>;
> > +                                     lvds0_in: endpoint {
> > +                                             remote-endpoint = <&du_out_lvds0>;
> > +                                     };
> > +                             };
> > +                             port@1 {
> > +                                     reg = <1>;
> > +                                     lvds0_out: endpoint {
> > +                                     };
> > +                             };
> > +                     };
> > +             };
> > +
> > +             lvds1: lvds@feb94000 {
> > +                     compatible = "renesas,r8a7742-lvds";
> > +                     reg = <0 0xfeb94000 0 0x1c>;
> > +                     clocks = <&cpg CPG_MOD 725>;
> > +                     power-domains = <&sysc R8A7742_PD_ALWAYS_ON>;
> > +                     resets = <&cpg 725>;
> > +                     status = "disabled";
> > +
> > +                     ports {
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +
> > +                             port@0 {
> > +                                     reg = <0>;
> > +                                     lvds1_in: endpoint {
> > +                                             remote-endpoint = <&du_out_lvds1>;
> > +                                     };
> > +                             };
> > +                             port@1 {
> > +                                     reg = <1>;
> > +                                     lvds1_out: endpoint {
> >                                       };
> >                               };
> >                       };
>
> --
> Regards,
>
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
