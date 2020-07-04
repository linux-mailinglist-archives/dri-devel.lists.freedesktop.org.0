Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CD72148DC
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jul 2020 23:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114B86EBE2;
	Sat,  4 Jul 2020 21:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C066EBE2
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 21:26:19 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C6C0520023;
 Sat,  4 Jul 2020 23:26:16 +0200 (CEST)
Date: Sat, 4 Jul 2020 23:26:15 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1 1/1] dt-bindings: fix simple-framebuffer example
Message-ID: <20200704212615.GA1693435@ravnborg.org>
References: <20200704143544.789345-1-sam@ravnborg.org>
 <20200704143544.789345-2-sam@ravnborg.org>
 <CAMuHMdXWXk=QUbpFeX6bjwp+JWKgHqiQALTdQJgSgwBRkyvkRA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXWXk=QUbpFeX6bjwp+JWKgHqiQALTdQJgSgwBRkyvkRA@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=YG64nluAAAAA:20 a=tBb2bbeoAAAA:8
 a=eaCYuVEjiU5D5XKsubUA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Oj-tNtZlA1e06AYgeCfH:22
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
 <devicetree@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 04, 2020 at 11:03:21PM +0200, Geert Uytterhoeven wrote:
> Hi Sam,
> 
> Thanks for your patch!
> 
> On Sat, Jul 4, 2020 at 4:37 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > Now that dt-extract-example gained support for using root nodes
> > in examples, update the example for the simple-frambuffer binding to use it.
> 
> simple-framebuffer
Thanks, will fix.

> 
> > This gives us a better example and kill a long standing warning:
> >
> > simple-framebuffer.example.dts:23.16-39.11:
> > Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
> >
> > Note: To get the update dt-extract-example execute:
> > pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> 
> > --- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> > +++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> > @@ -152,28 +152,29 @@ additionalProperties: false
> >
> >  examples:
> >    - |
> > -    aliases {
> > -      display0 = &lcdc0;
> 
> Why drop the aliases example?
I did not see it had any value for the binding that the example shall
demonstrate. But it was not somthing I have given much thought of.

	Sam

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
