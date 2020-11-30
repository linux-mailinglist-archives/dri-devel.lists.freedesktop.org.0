Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0DC2C86B5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 15:31:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DF46E4E3;
	Mon, 30 Nov 2020 14:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196BF6E4E3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 14:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606746683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QQujhvvur/pM8ZJh3DSJTp6K0D4ASRltH6KQoBKkjWo=;
 b=USmipMWlePqoAM95ACcUECM2Ws8eJspzm06aPNZCc//P5QvfZZf/LeL53pme5PR4pId4p9
 X8WE/qp3ATVCJScKw5mpQ4lltoI80+quFd4nyGTH1AWMyHbUFIuzu2xILpB/Pg0xAJ19G9
 0uR4ovz22NpC52Ep4mh8fqWpwFVWUwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-X7i9HG4-PO-SbxCKkvoMCA-1; Mon, 30 Nov 2020 09:31:21 -0500
X-MC-Unique: X7i9HG4-PO-SbxCKkvoMCA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEE768030A0;
 Mon, 30 Nov 2020 14:31:18 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1004060873;
 Mon, 30 Nov 2020 14:31:18 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 0AUEVHHG001898; Mon, 30 Nov 2020 09:31:17 -0500
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 0AUEVFpX001894; Mon, 30 Nov 2020 09:31:15 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Mon, 30 Nov 2020 09:31:15 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] fbdev: Remove udlfb driver
In-Reply-To: <20201130125200.10416-1-tzimmermann@suse.de>
Message-ID: <alpine.LRH.2.02.2011300843270.29199@file01.intranet.prod.int.rdu2.redhat.com>
References: <20201130125200.10416-1-tzimmermann@suse.de>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: linux-fbdev@vger.kernel.org, geert+renesas@glider.be, corbet@lwn.net,
 daniel.vetter@ffwll.ch, linux-doc@vger.kernel.org, bernie@plugable.com,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Mon, 30 Nov 2020, Thomas Zimmermann wrote:

> Udlfb has been superseded by DRM's udl. The DRM driver is better by
> any means and actively maintained. Remove udlfb.

Hi

I am using udlfb and it's definitely better than the DRM driver. The DRM 
driver will crash the kernel if you unplug the device while Xorg is 
running. The framebuffer driver doesn't crash in this case. (I have a cat 
and the cat sometimes unplugs cables and I don't want to reboot the system 
because of it :-)

The framebuffer driver is faster, it keeps back buffer and updates only 
data that differ between the front and back buffer. The DRM driver doesn't 
have such optimization, it will update everything in a given rectangle - 
this increases USB traffic and makes video playback more jerky.

The framebuffer driver supports programs running full-screen directly on 
the framebuffer console, such as web browser "links -g", image viewer 
"fbi", postscript+pdf viewer "fbgs", ZX Spectrum emulator "fuse-sdl", 
movie player "mplayer -vo fbdev". The DRM driver doesn't run them.

If you seach for someone to maintain the framebuffer driver, I can do it.

Mikulas


> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  CREDITS                      |    5 +
>  Documentation/fb/index.rst   |    1 -
>  Documentation/fb/udlfb.rst   |  162 ---
>  MAINTAINERS                  |    9 -
>  drivers/video/fbdev/Kconfig  |   17 +-
>  drivers/video/fbdev/Makefile |    1 -
>  drivers/video/fbdev/udlfb.c  | 1994 ----------------------------------
>  7 files changed, 6 insertions(+), 2183 deletions(-)
>  delete mode 100644 Documentation/fb/udlfb.rst
>  delete mode 100644 drivers/video/fbdev/udlfb.c

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
