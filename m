Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54880343014
	for <lists+dri-devel@lfdr.de>; Sat, 20 Mar 2021 23:40:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE006E0E9;
	Sat, 20 Mar 2021 22:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE766E0E9
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Mar 2021 22:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Type:MIME-Version:
 References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Rm++ZBko8PgNveQjUBSGv2T36CmW0HBM9zUDPgiM88k=; b=OvtQDmFO075pBMaaJc1gH0d1nG
 bi3OGn+vOfJ2fqNpQ/0UjXL2O8pU/euvCWnF7KuPG1o+49ACsj93zIYFaY6pIMhRXg6ThwI1GoSUD
 KVzNWBGyp7L2X+P3AbxkmhmlaJfN30sNEqpZjc8+9XFUvxvWXsXBWFB0gmyQMaE0gJ6OP1tW8lWmk
 Icxp/IkF+kPagH6HnbJCMauQfZbhf7UZ2+LSQ7bbNG0v7o4apDBWHOEAM5Z5sidUma8+k6/skBtAb
 PMjx08zkV7JesAJZyVUI59b7aIjf+hWwmFrPapcnNSyIT0Kr9EFSZC2a01anMG3XRCTu9DeNz08CT
 d1sLH78A==;
Received: from rdunlap (helo=localhost)
 by bombadil.infradead.org with local-esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lNkGO-0024fS-Qa; Sat, 20 Mar 2021 22:40:09 +0000
Date: Sat, 20 Mar 2021 15:40:08 -0700 (PDT)
From: Randy Dunlap <rdunlap@bombadil.infradead.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Fix a typo
In-Reply-To: <20210320211617.30746-1-unixbhaskar@gmail.com>
Message-ID: <17a49e9b-6ba6-9cca-d835-9199d92e4870@bombadil.infradead.org>
References: <20210320211617.30746-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210320_154008_883671_BAC758F3 
X-CRM114-Status: GOOD (  14.90  )
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "bombadil.infradead.org", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, 21 Mar 2021,
 Bhaskar Chowdhury wrote: > > s/particuar/particular/
 > > Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com> Acked-by: Randy
 Dunlap <rdunlap@infradead.org> 
 Content analysis details:   (-0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 NO_RELAYS              Informational: message was not relayed via SMTP
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
Cc: airlied@linux.ie, sroland@vmware.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-graphics-maintainer@vmware.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Sun, 21 Mar 2021, Bhaskar Chowdhury wrote:

>
> s/particuar/particular/
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>


> ---
> drivers/gpu/drm/vmwgfx/vmwgfx_so.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_so.c b/drivers/gpu/drm/vmwgfx/vmwgfx_so.c
> index 7369dd86d3a9..6cd38e407145 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_so.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_so.c
> @@ -33,7 +33,7 @@
>  * The currently only reason we need to keep track of views is that if we
>  * destroy a hardware surface, all views pointing to it must also be destroyed,
>  * otherwise the device will error.
> - * So in particuar if a surface is evicted, we must destroy all views pointing
> + * So in particular if a surface is evicted, we must destroy all views pointing
>  * to it, and all context bindings of that view. Similarly we must restore
>  * the view bindings, views and surfaces pointed to by the views when a
>  * context is referenced in the command stream.
> --
> 2.26.2
>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
