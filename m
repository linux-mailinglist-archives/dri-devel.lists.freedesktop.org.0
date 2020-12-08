Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0192D1F2F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 01:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C873D6E8B5;
	Tue,  8 Dec 2020 00:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1F26E8B5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 00:43:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C5ADDD;
 Tue,  8 Dec 2020 01:43:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607388180;
 bh=sXJJQ3Ales9snSM+M951qVfwVZH4bo1xYMrGw8Lpq9Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FQSetC4HXvcy/ljFLmrhL7T9XbUuMZSSBPTz78w2qxhWVLqXotEyYaZBLTVy3I7IP
 fLS+PoCfAbo9W1c63ChXr1sqWBzUZlDh6t7XlRvXXXY17KWXb1eks/VBu03Zy5a4D0
 Euw6t6DVm6SBO4Hg3qSmbNm6q1M8c8V1qqxZpbiU=
Date: Tue, 8 Dec 2020 02:42:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/9] drm: rcar-du: Fix crash when using LVDS1 clock for
 CRTC
Message-ID: <X87MEVMhOgcFxKwj@pendragon.ideasonboard.com>
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201204220139.15272-2-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXrEpnQNT=QZRrgQ-jzBvRumUHgqfBrgCHcELpxg7VnQA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXrEpnQNT=QZRrgQ-jzBvRumUHgqfBrgCHcELpxg7VnQA@mail.gmail.com>
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert,

On Mon, Dec 07, 2020 at 09:15:11AM +0100, Geert Uytterhoeven wrote:
> On Fri, Dec 4, 2020 at 11:02 PM Laurent Pinchart wrote:
> > On D3 and E3 platforms, the LVDS encoder includes a PLL that can
> > generate a clock for the corresponding CRTC, used even when the CRTC
> > output to a non-LVDS port. This mechanism is supported by the driver,
> > but the implementation is broken in dual-link LVDS mode. In that case,
> > the LVDS1 drm_encoder is skipped, which causes a crash when trying to
> > access its bridge later on.
> >
> > Fix this by storing bridge pointers internally instead of retrieving
> > them from the encoder.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
> I think this warrants a Fixes tag, to assist the stable team in backporting
> this fix.

I'll add one.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
