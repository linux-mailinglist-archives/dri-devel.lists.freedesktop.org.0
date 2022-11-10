Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCCD62479C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 17:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC1D10E6D8;
	Thu, 10 Nov 2022 16:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out-03.comm2000.it (smtp-out-03.comm2000.it [212.97.32.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBC310E7A7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 13:13:00 +0000 (UTC)
Received: from francesco-nb.int.toradex.com (31-10-206-125.static.upc.ch
 [31.10.206.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: francesco@dolcini.it)
 by smtp-out-03.comm2000.it (Postfix) with ESMTPSA id 9AEABB4459C;
 Thu, 10 Nov 2022 14:12:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
 s=mailsrv; t=1668085977;
 bh=wnyRjP05NOalbuodb9ezcZdhq1sgmGCz40yFIQIKdPA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Kac9sCqezf3Caoz7tLxpn7x5JeotDLlLwnJmA6+2YhMIU6sUjSbTvQRx+PbgATj6x
 IYcahf8fCalEMFiHwNxIE5VJGeyeBJyCkE3h3byIHPeYRhReHvg1K30krZlZOie7yQ
 hE/EtHcpa0kmRn4CW+iDk1u2FaThu5fqENVGj/XRad1zAq/mq1/IL2F5swVIhZCz+M
 8Rz3em7PTK0a8uNUNnkTpMkpEW1NPutwQxX6EA7mnimb7R7XZCjA9Bnq/C2JekmcoG
 lvNz/490YUXIC0q622/l0shymGmcZys08nkfGPJjYHkvKrSHhH4hhFQTveYNrKJAhg
 MCfvMmP0g/tDQ==
Date: Thu, 10 Nov 2022 14:12:46 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v1] drm/panel: simple: set bpc field for logic
 technologies displays
Message-ID: <Y2z4zoYU2rxrOKPC@francesco-nb.int.toradex.com>
References: <20220831141622.39605-1-francesco.dolcini@toradex.com>
 <Y01kJbZjkwo1A8l1@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y01kJbZjkwo1A8l1@francesco-nb.int.toradex.com>
X-Mailman-Approved-At: Thu, 10 Nov 2022 16:51:48 +0000
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
Cc: Francesco Dolcini <francesco@dolcini.it>, David Airlie <airlied@linux.ie>,
 Aishwarya Kothari <aishwarya.kothari@toradex.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 17, 2022 at 04:18:13PM +0200, Francesco Dolcini wrote:
> On Wed, Aug 31, 2022 at 04:16:22PM +0200, Francesco Dolcini wrote:
> > From: Aishwarya Kothari <aishwarya.kothari@toradex.com>
> > 
> > In case bpc is not set for a panel it then throws a WARN(). Add bpc to
> > the panels logictechno_lt170410_2whc and logictechno_lt161010_2nh.
> > 
> > Fixes: 5728fe7fa539 ("drm/panel: simple: add display timings for logic technologies displays")
> 
> Hello,
> just a gently ping on this. It applies cleanly on v6.1-rc1, anything I
> should do?

Hello Doug,
can you help on this patch? I am not sure who is supposed to pick this
small fix, but it looks like you recently took patches on
"drm/panel: simple:", so maybe you can help.

Francesco

