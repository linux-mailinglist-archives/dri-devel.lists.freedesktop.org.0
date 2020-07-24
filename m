Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB1322C26B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 11:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D0A6E4FF;
	Fri, 24 Jul 2020 09:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624556E4FF
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 09:38:36 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 859B8206D7;
 Fri, 24 Jul 2020 09:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595583516;
 bh=OmyIda6YMRI/Qz7q2im7YSEctLsidA3ydJX53kNZ3xw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aHGtQpF4hHHh+3BuTzEYVpxY4dQ21eAucUKGmWZN5xJCdSt1XIsOjlyNTmlJWGn8J
 JLyutTI+1q8SGXft710HZKSZoIVctCD4S6aTtLlaACIjGMx74EZdQS2xRzfqGb8d32
 0MOUJBcNngnkhLwhq50XaqUSp2n+3Nd91d3k6R9w=
Date: Fri, 24 Jul 2020 11:38:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Subject: Re: [PATCH] newport_con: vc_color is now in state
Message-ID: <20200724093838.GA4169737@kroah.com>
References: <202007241318.wXYkumEO%lkp@intel.com>
 <20200724062735.18229-1-jslaby@suse.cz>
 <b1b9d90a-5fe3-947a-dc4e-8576cd143869@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b1b9d90a-5fe3-947a-dc4e-8576cd143869@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 24, 2020 at 12:30:59PM +0300, Sergei Shtylyov wrote:
> On 24.07.2020 9:27, Jiri Slaby wrote:
> 
> > Since commit 28bc24fc46f9 (vc: separate state), vc->vc_color is known as
> 
>    Cgit says "Bad object id: 28bc24fc46f9" (in Linus' repo). Also, you should
> enclose the commit summary in (""), not just ()...

I've added the proper "Fixes:" tag when committing this, no worries.

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
