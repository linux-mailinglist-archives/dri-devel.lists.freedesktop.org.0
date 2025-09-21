Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F368EB8D4A7
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 06:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDFE10E196;
	Sun, 21 Sep 2025 04:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="NG68O/75";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D3310E196
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 04:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=9CBAu4CBqssJ5aeqARNzTf8RZdzR5TsWpD4SoDPRrv4=; b=NG68O/758Xbg8gZMvzvVvRur2F
 dh5pkOw/DgAroma81uEItqhLzl5vfI6VOW+pUKZcZa1GmH0/1tQ1DJBOA/I6CmEZ4IcbBgM3OvpWR
 yZI8vO6X+8OewlaSqGhYbDc1VaelyomBBd+vU6KREeZPTS+oY+14D/PUCsGQE+ji1oUV5/YW+7tRc
 3ILS3/RvQb4vN2zM2bGnc8wPovPgSbZgzFgG134DzXWaBX6bCqjP4rAgAyZ1Hhe37W7e/u8Kzp82l
 zlLX6dOH8YV6otHkL5JAnOc2wNAPPqWb6bPLJd00n15bwxT60cOa826kBLP9IewE9xmuqkbPNEGOT
 YzLMTwpQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1v0BNm-00000006VSD-3alo; Sun, 21 Sep 2025 04:09:02 +0000
Message-ID: <e0051102-adcf-400d-b57d-2c0d14755a7c@infradead.org>
Date: Sat, 20 Sep 2025 21:09:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Documentation: fb: ep93xx: Demote section headings
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
 <20250919003640.14867-2-bagasdotme@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250919003640.14867-2-bagasdotme@gmail.com>
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
> Section headings are formatted the same as title heading, thus
> increasing number of entries in framebuffer toctree. Demote them.
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Looks good. Thanks.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/fb/ep93xx-fb.rst | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/Documentation/fb/ep93xx-fb.rst b/Documentation/fb/ep93xx-fb.rst
> index 1dd67f4688c751..93b3494f530979 100644
> --- a/Documentation/fb/ep93xx-fb.rst
> +++ b/Documentation/fb/ep93xx-fb.rst
> @@ -41,7 +41,6 @@ your board initialisation function::
>  
>  	ep93xx_register_fb(&some_board_fb_info);
>  
> -=====================
>  Video Attribute Flags
>  =====================
>  
> @@ -79,7 +78,6 @@ EP93XXFB_USE_SDCSN2		Use SDCSn[2] for the framebuffer.
>  EP93XXFB_USE_SDCSN3		Use SDCSn[3] for the framebuffer.
>  =============================== ======================================
>  
> -==================
>  Platform callbacks
>  ==================
>  
> @@ -101,7 +99,6 @@ obtained as follows::
>  		/* Board specific framebuffer setup */
>  	}
>  
> -======================
>  Setting the video mode
>  ======================
>  
> @@ -119,7 +116,6 @@ set when the module is installed::
>  
>  	modprobe ep93xx-fb video=320x240
>  
> -==============
>  Screenpage bug
>  ==============
>  

-- 
~Randy
