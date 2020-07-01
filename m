Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B1D211CCD
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C08D6EA7D;
	Thu,  2 Jul 2020 07:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438DE6E139
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 16:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1593621018; bh=S9sJvCFzXl3kRUEWnli4aokEH2QvfST8BIb1PIlWyhE=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=CqKMPGfG+ZJjZFaUD1dUbV5kVUWVCS7R5aZdNFpb5wdgXELQscUaejOgiiEwCNQ1d
 8LU+q3KpyDQGV6ex0l/Vyg7KIZOxF4t0oeexWKdOWtia6k35AJ0KnYOk2jj/aBAo6F
 LSNVSGFpCFfeGDtEg+xZ8fwR2kPMshbOjQ4UZjZA=
Date: Wed, 1 Jul 2020 18:30:18 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v6 00/13] Add support for PinePhone LCD panel
Message-ID: <20200701163018.cfweuzp76qx5nsew@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-sunxi@googlegroups.com,
 Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Icenowy Zheng <icenowy@aosc.io>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>,
 Martijn Braam <martijn@brixit.nl>, Luca Weiss <luca@z3ntu.xyz>,
 Bhushan Shah <bshah@kde.org>
References: <20200701103126.1512615-1-megous@megous.com>
 <20200701152532.GA670324@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701152532.GA670324@ravnborg.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Purism Kernel Team <kernel@puri.sm>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, Bhushan Shah <bshah@kde.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Martijn Braam <martijn@brixit.nl>,
 linux-sunxi@googlegroups.com, Thierry Reding <thierry.reding@gmail.com>,
 Luca Weiss <luca@z3ntu.xyz>, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sam,

On Wed, Jul 01, 2020 at 05:25:32PM +0200, Sam Ravnborg wrote:
> Hi Ondrej.
> 
> On Wed, Jul 01, 2020 at 12:31:13PM +0200, Ondrej Jirman wrote:
> > This patchset adds support for the LCD panel of PinePhone.
> > 
> > I've tested this on PinePhone 1.0 and 1.2.
> > 
> > Please take a look.
> > 
> > thank you and regards,
> >   Ondrej Jirman
> > 
> > Changes in v6:
> > - Fixed spacing in yaml
> > - Fixed wrong vccio->iovcc supply name in the bindings doc
> > - I noticed that the original driver uses a delay of 20ms in the init
> >   function to achieve a combined total of 120ms required from post-reset
> >   to display_on. I've added a similar delay to xbd599_init, so that
> >   xbd599 panel also has the right timing. (patch 9)
> > - v5->v6 diff: https://megous.com/dl/tmp/v5-v6.patch
> > - Added review/ack tags
> > - Learned to run dt_binding_check by myself ;)
> The patch-set does not apply clean on top of drm-misc-next - due to
> vrefresh removal.
> Please re-spin.

Sorry for that. Rebased and retested.

thank you,
	o.

> 	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
