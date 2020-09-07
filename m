Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3FE26052F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 21:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6B36E544;
	Mon,  7 Sep 2020 19:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 582 seconds by postgrey-1.36 at gabe;
 Mon, 07 Sep 2020 19:35:34 UTC
Received: from abrecht.li (75-128-16-94.static.cable.fcom.ch [94.16.128.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8459F6E544
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 19:35:34 +0000 (UTC)
Received: from mail.abrecht.li (unknown [10.60.1.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by abrecht.li (Postfix) with ESMTPSA id 1EF6B2D972E6
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 19:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 abrecht.li 1EF6B2D972E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=danielabrecht.ch;
 s=mail; t=1599506750;
 bh=ihbRRJ+fy8MjMT6ZBXsNCndxLBIJRdbV9FnAl7YJqNY=; h=From:To:From;
 b=LfEe//fFV/byu3mJkAUlHYVTVX8mqEqd7DMQXFNBuLwoGd9u/s6YYzjdoQ49k9VHU
 X4ryVxr9glo//GNrT3sK1P+Rv7GTKYxa0sPwWTI0vM60clk06KgLXdIRGtZTKINySm
 MHBNyEOnK4a89TLy0y6DdsscSHyhxGVqyY5jtEQ8=
MIME-Version: 1.0
Date: Mon, 07 Sep 2020 19:25:50 +0000
From: Daniel Abrecht <freedesktop-linux-dri-devel@danielabrecht.ch>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: mxsfb: check framebuffer pitch
In-Reply-To: <20200907160343.124405-1-stefan@agner.ch>
References: <20200907160343.124405-1-stefan@agner.ch>
Message-ID: <1053506ddfbb352ba0fe96c6576f78fd@abrecht.li>
X-Sender: freedesktop-linux-dri-devel@danielabrecht.ch
User-Agent: Roundcube Webmail/1.3.15
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2020-09-07 16:03, schrieb Stefan Agner:
> The lcdif IP does not support a framebuffer pitch (stride) other than
> the CRTC width.

This may be true for some SOCs, but not for all of them. I used to have
this working flawlessly on the imx8mq like so:
http://projects.dpa.li/git/?p=linux.git;a=commitdiff;h=5a7baa8ba7f1f30139cfcd0f9e13b3773f3605ff

That in turn was based on some patches which weren't fully upstreamed
yet at the time, and was inspired by another patch I had seen here:
https://lore.kernel.org/linux-arm-kernel/20190722174853.GA31795@bogus/t/#m7ac218480eb1d827ff65f82f2e03a5a84c94a5e0

I had almost forgotten about this already, since I currently don't
need it anymore, and I was waiting for the patches it was based on
to get taken up. But if anyone else needs this, feel free to do
whatever you want with it.
I could also take another look at this and submit some patches if this
is preferred, but I'm quiet busy right now, so that could take a while.

In the meantime and for other SOCs, I think checking for an unsupported
pitch is still needed regardless. I'm not against this patch, this is
just a note to make sure it's known that and how this can be done on
the imx8mq.

Regards,
Daniel Abrecht
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
