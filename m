Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1FE1FA05E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 21:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511A06E4E6;
	Mon, 15 Jun 2020 19:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F146E4E6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 19:34:43 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id y123so10047984vsb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 12:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QZahg1NitwirKHFwxuUpR74ivr8O8ITnXOCYZbw/CBs=;
 b=siFmFiox4AgcH70zhaAq+geY/OrzNYLubkgo7gsX5t8Mq4wXjP73W7e026BKAWdIb+
 BE2wxqQB7oRtbJa7j7lJMxmjsGgaxnllEMxHTLtBJC3TR+w8JAGvL6Bt/6fOGaNUVcVz
 zyfrX8U1Ib0HDi+FE/rfs+la9hrMnk1LWhqyERlHurZayuo8emOukN8Cxd8MDRqXYApS
 vkEX3X/nyAqhuqv6N17wLH73jJtz3BFM05cReU9tNM+3GJlwQ2BPXPY53hVQDhwyxrAz
 1RXhF0pc2AJaq/SDizPb0+oQg+SPVYtemzeOAvCQtllw9Kq5adCsIQRXJjFkFUBMVISb
 rW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QZahg1NitwirKHFwxuUpR74ivr8O8ITnXOCYZbw/CBs=;
 b=VBz2pPHygafMyRiqN/jhKp2uov2hl8gM8wEW9fYczBpYxVa8FMJ2wzJoFinCaNNbfo
 NdrQ5A0+wykBCdaXyQ43Kx2yOlU5Cy0NnTQUuIxXoj2YOIyj+ftmJm4ko4LkzFSkRLTl
 BxSyr3qzlYPxajU1+dL+Ba8+nXVt06vYWDsv0gzxcPuZFtSrJt7aqUS3BVdmIMrJebY/
 ZHHfRhgQBFt3LHbSbaZIWPKK6fpUVPmVusbgcVkKXxZw4OVgZeaK2VXSpoQjUhtS/4Cg
 ZYfWE/mKsvg8phRYRHQh6zBe3LCyS0S5irdif+M7hqgJVg05PRCTas/bTKDy3lvys3VE
 EuyA==
X-Gm-Message-State: AOAM532qj2f1mrHJ5Tf9Ps8YX/96rPq3PDDjhjHAIxpJs5OQNWlg7+PN
 dnmQ+JNqZzSrHr+zMx/cVkut7xiTJHCpQNy3UuUvUg==
X-Google-Smtp-Source: ABdhPJz86q7LFR9YA0oj+l9EqbJzGRWqlL6MAf0WrTfD+nSVx8HqoME07Wyc524zwOOGZKnyhrk20ogSG7DWcgGsM0E=
X-Received: by 2002:a67:69d1:: with SMTP id
 e200mr21274784vsc.118.1592249682538; 
 Mon, 15 Jun 2020 12:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200530031015.15492-1-laurent.pinchart@ideasonboard.com>
 <20200530031015.15492-21-laurent.pinchart@ideasonboard.com>
 <CACvgo51QNp745AKkW6CqEUGQ=Jx9v4hqp3YguZpVmvZWwx9y2g@mail.gmail.com>
 <20200606230159.GM7339@pendragon.ideasonboard.com>
In-Reply-To: <20200606230159.GM7339@pendragon.ideasonboard.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 15 Jun 2020 20:31:02 +0100
Message-ID: <CACvgo50d3SZ7wroBj14d6w7WdbaH-txmMDkxBh7HDUAY9gmMwg@mail.gmail.com>
Subject: Re: [PATCH v2 20/22] drm: mxsfb: Merge mxsfb_set_pixel_fmt() and
 mxsfb_set_bus_fmt()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, ML dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>, leonard.crestez@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i Laurent,

On Sun, 7 Jun 2020 at 00:02, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Emil,
>
> On Fri, Jun 05, 2020 at 03:58:53PM +0100, Emil Velikov wrote:
> > Hi Laurent,
> >
> > With the previous disclaimer in mind, the series is:
> > Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>
> Sorry, which disclaimer is that ?
>
"I don't know much about the hardware" from earlier. Even then, the
refactor that is 1-21 is spot on.


> > There's a small suggestion inline, for future work.
> >
> > On Sat, 30 May 2020 at 04:11, Laurent Pinchart wrote:
> >
> > >         switch (bus_format) {
> > >         case MEDIA_BUS_FMT_RGB565_1X16:
> > > -               reg |= CTRL_BUS_WIDTH_16;
> > > +               ctrl |= CTRL_BUS_WIDTH_16;
> > >                 break;
> > >         case MEDIA_BUS_FMT_RGB666_1X18:
> > > -               reg |= CTRL_BUS_WIDTH_18;
> > > +               ctrl |= CTRL_BUS_WIDTH_18;
> > >                 break;
> > >         case MEDIA_BUS_FMT_RGB888_1X24:
> > > -               reg |= CTRL_BUS_WIDTH_24;
> > > +               ctrl |= CTRL_BUS_WIDTH_24;
> > >                 break;
> > >         default:
> > >                 dev_err(drm->dev, "Unknown media bus format %d\n", bus_format);
> > >                 break;
> >
> > Off the top of my head, the default case should be handled in the
> > atomic_check() hook.
> > That is, unless I'm missing something and one can change the bus
> > format in between atomic_check() and atomic_enable(). Which would
> > sound like a very odd thing to do.
>
> I agree, this should go to the atomic check. There are still quite a few
> things to improve in this driver, one step at a time :-)
>
Agreed - simply mentioning for completeness-sake. Doing that at misc
later point is perfectly fine.

HTH
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
