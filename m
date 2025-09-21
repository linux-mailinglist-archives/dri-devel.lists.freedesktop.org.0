Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8087B8D49E
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 06:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A69310E065;
	Sun, 21 Sep 2025 04:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="NVs/xMzu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7CB10E065
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 04:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=uZy4lE0W2i6JOY3YpgM9YvBZoVT5j3/cDuVy9Tqt69U=; b=NVs/xMzuhLqWzvjk9aJtv3osGj
 yW/2U3K29Rwfhb8aqEo0KvQKZIDKljYztHK8shHPy2PFu941/9qT/0/DdKm0rDXrU1iXb3K/D0Inf
 64pzlNcjmbByypkXhSpDfLgqQlzJxCrZd7LAe6/YUQpl+1jdwF8G2yqGQPjdcPOCHZ2Llwd0NPl9f
 P/xeqCsDFUauxx/DEbdKitk3QWv2JGg0be0zHjSH7mgbCXUkF2rMzIUnYDoWgxOTg0QEHTcLwcL8j
 TrPlqqo8KrdGMjgNSuQXHk229el5e8j6kZRmzHUpTAfrguinbU3ShxjioZVgao4h6bioVl4X0O0mG
 0nYvdAeA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1v0BNe-00000006VSD-0Cck; Sun, 21 Sep 2025 04:08:54 +0000
Message-ID: <51ccc0fb-d17f-45c9-984b-65b9e2d0c4ac@infradead.org>
Date: Sat, 20 Sep 2025 21:08:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] Documentation: fb: Split toctree
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Framebuffer <linux-fbdev@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Helge Deller <deller@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Teddy Wang <teddy.wang@siliconmotion.com>,
 Bernie Thompson <bernie@plugable.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Arvind Sankar <nivedita@alum.mit.edu>
References: <20250919003640.14867-1-bagasdotme@gmail.com>
 <20250919003640.14867-4-bagasdotme@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250919003640.14867-4-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 9/18/25 5:36 PM, Bagas Sanjaya wrote:
> Framebuffer docs toctree consists of driver-independent docs
> (e.g. API docs) and driver-specific docs. The latter has much
> more entries.
> 
> Group the docs into separate toctrees.
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

LGTM. Thanks.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/fb/index.rst | 80 +++++++++++++++++++++-----------------
>  1 file changed, 45 insertions(+), 35 deletions(-)
> 
> diff --git a/Documentation/fb/index.rst b/Documentation/fb/index.rst
> index 33e3c49f885695..e2f7488b6e2e42 100644
> --- a/Documentation/fb/index.rst
> +++ b/Documentation/fb/index.rst
> @@ -4,42 +4,52 @@
>  Frame Buffer
>  ============
>  
> -.. toctree::
> -    :maxdepth: 1
> +General information
> +===================
>  
> -    api
> -    arkfb
> -    aty128fb
> -    cirrusfb
> -    cmap_xfbdev
> -    deferred_io
> -    efifb
> -    ep93xx-fb
> -    fbcon
> -    framebuffer
> -    gxfb
> -    intel810
> -    internals
> -    lxfb
> -    matroxfb
> -    metronomefb
> -    modedb
> -    pvr2fb
> -    pxafb
> -    s3fb
> -    sa1100fb
> -    sh7760fb
> -    sisfb
> -    sm501
> -    sm712fb
> -    sstfb
> -    tgafb
> -    tridentfb
> -    udlfb
> -    uvesafb
> -    vesafb
> -    viafb
> -    vt8623fb
> +.. toctree::
> +   :maxdepth: 1
> +
> +   api
> +   cmap_xfbdev
> +   deferred_io
> +   fbcon
> +   framebuffer
> +   internals
> +   modedb
> +
> +Driver documentation
> +====================
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   arkfb
> +   aty128fb
> +   cirrusfb
> +   efifb
> +   ep93xx-fb
> +   gxfb
> +   intel810
> +   lxfb
> +   matroxfb
> +   metronomefb
> +   pvr2fb
> +   pxafb
> +   s3fb
> +   sa1100fb
> +   sh7760fb
> +   sisfb
> +   sm501
> +   sm712fb
> +   sstfb
> +   tgafb
> +   tridentfb
> +   udlfb
> +   uvesafb
> +   vesafb
> +   viafb
> +   vt8623fb
>  
>  .. only::  subproject and html
>  

-- 
~Randy
