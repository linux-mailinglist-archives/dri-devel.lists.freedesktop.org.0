Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E41C21470A0
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 19:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C726FE19;
	Thu, 23 Jan 2020 18:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B956FE19
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 18:19:09 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id CFE8220051;
 Thu, 23 Jan 2020 19:19:05 +0100 (CET)
Date: Thu, 23 Jan 2020 19:19:04 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] dt-bindings: restrict properties for sitronix,st7735r
Message-ID: <20200123181904.GC17233@ravnborg.org>
References: <20200115124548.3951-1-geert+renesas@glider.be>
 <20200115124548.3951-2-geert+renesas@glider.be>
 <ba21d2c8-ccc6-2704-fa1f-d28239700547@lechnology.com>
 <20200120190249.GA9619@ravnborg.org>
 <CAMuHMdV4QtKTBvM+8U=BgDV7zzQfO50Z_pnwpNWLhh6Gioe+=A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdV4QtKTBvM+8U=BgDV7zzQfO50Z_pnwpNWLhh6Gioe+=A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=WZHNqt2aAAAA:8 a=J6VubnrAGtYNr-PBG9AA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=PrHl9onO2p7xFKlKy1af:22
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Lechner <david@lechnology.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Chris Brandt <chris.brandt@renesas.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert & Rob.

On Thu, Jan 23, 2020 at 08:43:39AM +0100, Geert Uytterhoeven wrote:
> Hi Sam,
> 
> On Mon, Jan 20, 2020 at 8:02 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > From 6b54fb0a071c0732cd4bd5b88f456b5a85bcf4f2 Mon Sep 17 00:00:00 2001
> > From: Sam Ravnborg <sam@ravnborg.org>
> > Date: Mon, 20 Jan 2020 19:55:04 +0100
> > Subject: [PATCH] dt-bindings: restrict properties for sitronix,st7735r
> >
> > David Lechner noticed (paraphrased):
> > - not all properties from panel-common are applicable.
> > - missing optional rotation and backlight properties
> >
> > Fix this by listing all allowed properties, and do not allow other properties.
> >
> > Fixes: abdd9e3705c8 ("dt-bindings: display: sitronix,st7735r: Convert to DT schema")
> > Reported-by: David Lechner <david@lechnology.com>
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> 
> I'm far from a DT yaml expert, but LGTM, so:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, now pushed to drm-misc-next.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
