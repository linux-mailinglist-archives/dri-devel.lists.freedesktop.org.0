Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A1E20D048
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 18:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2E889E33;
	Mon, 29 Jun 2020 16:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94B389E33
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 16:57:51 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 511EB255A2;
 Mon, 29 Jun 2020 16:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593449871;
 bh=LsvaxCx9ztrg49SroV6IiadXySbQEYzMCRhajcdKEqI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xksg3vHFpCTBknskXhcl6eZ/0EvNcf25+iuvEh/tt2MoZ7AoIgJc81WtrBfiwfGki
 W4g+KC2jRoUeOSf08arJfXHBDTpijtQHQdvafuKyXnsj048HKyTaQPoBvTLqbI+nWp
 fW5QGKyCfo/Z9RC4V4DPiKQi2KhBvNFlOniqy87I=
Date: Mon, 29 Jun 2020 18:57:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 9/9] drm/simplekms: Acquire memory aperture for framebuffer
Message-ID: <20200629165742.GA772590@kroah.com>
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-10-tzimmermann@suse.de>
 <20200629092230.GQ3278063@phenom.ffwll.local>
 <20200629160421.GA627453@kroah.com>
 <20200629162316.GF5499@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629162316.GF5499@sirena.org.uk>
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
Cc: geert+renesas@glider.be, airlied@linux.ie, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, lgirdwood@gmail.com, hdegoede@redhat.com,
 kraxel@redhat.com, Thomas Zimmermann <tzimmermann@suse.de>, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 29, 2020 at 05:23:16PM +0100, Mark Brown wrote:
> On Mon, Jun 29, 2020 at 06:04:21PM +0200, Greg KH wrote:
> 
> > Yes, please do that.  Or, use the "virtual bus/device" code that some
> > people at Intel are still trying to get into mergable shape.  See the
> > posts on the netdev list for those details.
> 
> Any pointers on that?  There's also some ongoing discussion with MFD and
> that's not been mentioned at all.

https://lore.kernel.org/r/20200520070227.3392100-2-jeffrey.t.kirsher@intel.com
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
