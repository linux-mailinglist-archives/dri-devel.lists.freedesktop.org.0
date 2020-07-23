Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C9B22B70D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 21:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200466E235;
	Thu, 23 Jul 2020 19:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0BC6E235
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 19:58:32 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 929862BA;
 Thu, 23 Jul 2020 19:58:30 +0000 (UTC)
Date: Thu, 23 Jul 2020 13:58:29 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Jiri Slaby <jslaby@suse.cz>
Subject: Re: [PATCH -resend] Documentation: fb, fix path to modedb.c
Message-ID: <20200723135829.35b44922@lwn.net>
In-Reply-To: <20200723103454.26167-1-jslaby@suse.cz>
References: <20200723103454.26167-1-jslaby@suse.cz>
Organization: LWN.net
MIME-Version: 1.0
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
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Jul 2020 12:34:54 +0200
Jiri Slaby <jslaby@suse.cz> wrote:

> modedb.c was moved twice since the modedb documentation was written.
> Update the path to the current one.
> 
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/fb/modedb.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/fb/modedb.rst b/Documentation/fb/modedb.rst
> index 624d08fd2856..4d2411e32ebb 100644
> --- a/Documentation/fb/modedb.rst
> +++ b/Documentation/fb/modedb.rst
> @@ -152,7 +152,7 @@ To specify a video mode at bootup, use the following boot options::
>      video=<driver>:<xres>x<yres>[-<bpp>][@refresh]
>  
>  where <driver> is a name from the table below.  Valid default modes can be
> -found in linux/drivers/video/modedb.c.  Check your driver's documentation.
> +found in drivers/video/fbdev/core/modedb.c.  Check your driver's documentation.
>  There may be more modes::

"resend" but I've never seen it before...in any case I've applied it now.

Thanks,

jon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
