Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CD9245D05
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E646E448;
	Mon, 17 Aug 2020 07:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2379F6E204
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 11:21:25 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id q3so3101191ybp.7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 04:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0SrbfwtjCL+Ch70ZV12lTDvT9PgGCIle5pOe2njGh38=;
 b=uqSSJl1QBhCjyTIGGHPmllHzdNyHwp5crRG08NLkDMIuGqMzYtAS9sZ9UmerNqbuC8
 RoVhDM8VWhxNtjfUpiP1IJs09F00r59FavT3pGpMyD0stSqPf5tuZ2Sqp55V7YMz7/k/
 fMrtqojnocJHva2BoZ/XPyQXoSI3DnuL383sQhJhO+ehsq0xQlS7ZTJIfID6quVv8KPo
 JBX+FSPxQwb1qeD0jnC1k96eXtgIGnXv4YnnYUcy48Qq64qLQedxvBaVZnBGEftXhQoj
 RmeEz+SnUkpI6Ful0FLbfd0ugGEirEBWRPIgTvV7f/0NmNLGaxjV+a/uupC9fWTwrvaJ
 0xnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0SrbfwtjCL+Ch70ZV12lTDvT9PgGCIle5pOe2njGh38=;
 b=plAjxwQ7CagXrCe9D1spxL+pxA9/ldKprl4OfA89xA09u5/3MS/D3iH80tyRpZQFkj
 OJ5v04J0Ur9thsZUaIrwdwduQCY5+kr3+/8V8yJUHQHOfOvj/SQERa4KsbilkfbHvk7N
 622bkpeLKnva7s8ycCxxHCwKmavYsMNX7nWWgzw9xFjI5pkU2k3FQNhefdYnbehuiBYR
 eZ8ztagZKq5Nl5v9L9qb2ZdrbqX3Tuj1GZ7SY0E6rPeBwibfbFC683/nIEKOzL+pKYBp
 jYpg1gC/iuvp9GdoJ1YfKdjzch3ve59XxHvrStKgDkdVOaUbouEIS9Qk6WHFZrQRv/9X
 +viA==
X-Gm-Message-State: AOAM532JnQdIuFet5oYgvtuscr8sAbULGZz+bdw6q5Ao41oUMKtkNNU4
 JJuHcXxoTNqHfSq/V2d6/gr7wLFU8Pch/MYHlC8=
X-Google-Smtp-Source: ABdhPJxx5+KUKPX1w0oAy96kpCKRHE3RSshStqR59IK1IKnc/G77Uin05ciyk051/7IYQ6oWt+QgwrIFPasAmhFEqe4=
X-Received: by 2002:a25:c743:: with SMTP id w64mr5638674ybe.127.1597317684356; 
 Thu, 13 Aug 2020 04:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812140217.24251-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdV4Tp=kz57pAJk0u5hVpbiEdVzTWDvK+F1AZ5TjGmLbMQ@mail.gmail.com>
 <CA+V-a8svAuDx51vuTCH4w5g0oF9qf8sWAEjMDMm+0+9u-UQhQw@mail.gmail.com>
 <20200813105910.GB6057@pendragon.ideasonboard.com>
 <CA+V-a8sRQ_R4UGkSjrZ7Rq5nUqTwPtbvuuT0t69mM8M8ZeTkRQ@mail.gmail.com>
 <20200813111123.GD6057@pendragon.ideasonboard.com>
In-Reply-To: <20200813111123.GD6057@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 13 Aug 2020 12:20:58 +0100
Message-ID: <CA+V-a8toVwB+_=RmQ4DjhRaTyHoMOPHW2a42NTEUqW+FSv1tmg@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: display: renesas,
 du: Document r8a774e1 bindings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
 <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Magnus Damm <magnus.damm@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Thu, Aug 13, 2020 at 12:11 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> On Thu, Aug 13, 2020 at 12:08:58PM +0100, Lad, Prabhakar wrote:
> > On Thu, Aug 13, 2020 at 11:59 AM Laurent Pinchart wrote:
> > > On Thu, Aug 13, 2020 at 11:38:03AM +0100, Lad, Prabhakar wrote:
> > >> On Thu, Aug 13, 2020 at 10:05 AM Geert Uytterhoeven wrote:
> > >>> On Wed, Aug 12, 2020 at 4:02 PM Lad Prabhakar wrote:
> > >>>> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > >>>>
> > >>>> Document the RZ/G2H (a.k.a. r8a774e1) SoC in the R-Car DU bindings.
> > >>>>
> > >>>> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > >>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >>>> ---
> > >>>>  Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
> > >>>>  1 file changed, 2 insertions(+)
> > >>>>
> > >>>> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> > >>>> index 51cd4d162770..67cded5ad827 100644
> > >>>> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> > >>>> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> > >>>> @@ -10,6 +10,7 @@ Required Properties:
> > >>>>      - "renesas,du-r8a774a1" for R8A774A1 (RZ/G2M) compatible DU
> > >>>>      - "renesas,du-r8a774b1" for R8A774B1 (RZ/G2N) compatible DU
> > >>>>      - "renesas,du-r8a774c0" for R8A774C0 (RZ/G2E) compatible DU
> > >>>> +    - "renesas,du-r8a774e1" for R8A774E1 (RZ/G2H) compatible DU
> > >>>>      - "renesas,du-r8a7779" for R8A7779 (R-Car H1) compatible DU
> > >>>>      - "renesas,du-r8a7790" for R8A7790 (R-Car H2) compatible DU
> > >>>>      - "renesas,du-r8a7791" for R8A7791 (R-Car M2-W) compatible DU
> > >>>> @@ -75,6 +76,7 @@ corresponding to each DU output.
> > >>>>   R8A774A1 (RZ/G2M)      DPAD 0         HDMI 0         LVDS 0         -
> > >>>>   R8A774B1 (RZ/G2N)      DPAD 0         HDMI 0         LVDS 0         -
> > >>>>   R8A774C0 (RZ/G2E)      DPAD 0         LVDS 0         LVDS 1         -
> > >>>> + R8A774E1 (RZ/G2H)      DPAD 0         HDMI 0         LVDS 0         -
> > >>>
> > >>> As LVDS 0 is the fourth channel (DU3), should it be listed under port 3
> > >>> instead of port 2?
> > >>>
> > >>> I know we did it the same for R-Car M3-N and RZ/G2N.
> > >>> But my main worry is adding support for R-Car H3-N later.
> > >
> > > Why should we do so ? The port number here isn't tied to the DU channel
> > > number. It only identifies the output port. Many DUs can route DU
> > > channel outputs to different output ports.
> > >
> > The binding document (renesas,du.txt) does state that "The following
> > table lists for each supported model the port number corresponding to
> > each DU output.", hence the confusion.
>
> It can be a bit confusing indeed. "DU output" here refers to the output
> of the whoel DU, made of individual DU channels. Each DU channel is
> listed as a DU device in the datasheet, and collectively they are the DU
> device that Linux handles.
>
Thanks for the clarification, that clears up the confusion.

Cheers,
Prabhakar
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
