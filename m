Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54E7BFA24E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 08:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE60110E148;
	Wed, 22 Oct 2025 06:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PmoBmHf9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9878710E148
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 06:01:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5768743451;
 Wed, 22 Oct 2025 06:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E15C4CEF7;
 Wed, 22 Oct 2025 06:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1761112886;
 bh=ljiLlxvsuemtkUTdxR99prnOHMvm/yaLMWqYL9E2vlY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PmoBmHf9Ql6qH+pe9CemgRLWBAJhjSi/hoSABnk9ndpV+2zUxCziVK4S5Lo0Sm9Nn
 Bp2qAEq953xvv8w4/luZLLy4s9ZTB4p0ZKutX2m0xj1MU1xszZbt6smCVpD1tSo4pD
 +Qmik6bLUKZlATOg+pikO/bhM3h21XPwypLZ1APc=
Date: Wed, 22 Oct 2025 08:01:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Peter Schneider <pschneider1968@googlemail.com>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>, Nick Bowler <nbowler@draconx.ca>,
 Douglas Anderson <dianders@chromium.org>, Dave Airlie <airlied@redhat.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 6.12 020/136] drm/ast: Blank with VGACR17 sync enable,
 always clear VGACRB6 sync off
Message-ID: <2025102259-open-shallow-089e@gregkh>
References: <20251021195035.953989698@linuxfoundation.org>
 <20251021195036.457336682@linuxfoundation.org>
 <7015844a-7eca-469c-9115-b84183a94154@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7015844a-7eca-469c-9115-b84183a94154@googlemail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 22, 2025 at 07:42:14AM +0200, Peter Schneider wrote:
> Hi Greg,
> 
> Am 21.10.2025 um 21:50 schrieb Greg Kroah-Hartman:
> > 6.12-stable review patch.  If anyone has any objections, please let me know.
> > 
> > ------------------
> > 
> > From: Thomas Zimmermann <tzimmermann@suse.de>
> > 
> > commit 6f719373b943a955fee6fc2012aed207b65e2854 upstream.
> > 
> > Blank the display by disabling sync pulses with VGACR17<7>. Unblank
> > by reenabling them. This VGA setting should be supported by all Aspeed
> > hardware.
> 
> This patch breaks VGA output on my machine. I have already reported this regression against mainline 6.18-rc2, see here:
> 
> https://lore.kernel.org/all/a40caf8e-58ad-4f9c-af7f-54f6f69c29bb@googlemail.com/
> 
> When I revert this patch from 6.12.55-rc1, the issue goes away, just as in
> mainline. I'm still going to test 6.17.5-rc1 too and report back, but I
> guess it will be just the same.

Now dropped from this queue as well.  I'll go push out a -rc2 to be
safe.

thanks,

greg k-h
