Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127D92D0C54
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9C16E819;
	Mon,  7 Dec 2020 08:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84BEF6E462
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 19:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=uaJjx5MBG5/1n7wKwNZRjc2vRPxVE5bY074S204GE54=; b=vhUZ83k2KpTRvt5r5yBKPDHD5N
 7ERZf9DIWzHsx3KNdK5sOYxnEgLqoPnmAkEZNidZhhMYkBgYIv+LssD9GNoD1JJAuhWMz6rvH/nIA
 J5z8kjJYPt9T2Ykaj8a8wy6ZZz0fvZKBVkuRyt3RtUmuynadwZDuakc9+ybJMyINayAftLrf0fzIw
 ehYyGfLwZP3Bs893E2SgrTFvU8GM+VGeh2jcPOl7NNnOjkEzUFz+SebdEVKwaGq2OzZcoaCU8QEsC
 hwFrcj90NkVEsRoFhnsCy4RVtQms8NRTYxWRHSvxHxAScVa0SVt/1jEPfoBB+c14FPKz3nAtqMRHd
 JKXs482g==;
Received: from [2601:1c0:6280:3f0::1494]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klzng-0000jY-CU; Sun, 06 Dec 2020 19:34:28 +0000
Subject: Re: [PATCH v3 01/13] video: fbdev: hgafb: Fix kernel-doc warnings
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201206190247.1861316-1-sam@ravnborg.org>
 <20201206190247.1861316-2-sam@ravnborg.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c0c465e0-035a-956a-f8d6-18976bfb813b@infradead.org>
Date: Sun, 6 Dec 2020 11:34:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201206190247.1861316-2-sam@ravnborg.org>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
Cc: Rich Felker <dalias@libc.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Gustavo A R Silva <gustavoars@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Peter Jones <pjones@redhat.com>, linux-nvidia@lists.surfsouth.com,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Alexander Klimov <grandmaster@al2klimov.de>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 linux-arm-kernel@lists.infradead.org, Qilong Zhang <zhangqilong3@huawei.com>,
 Douglas Anderson <dianders@chromium.org>,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>, Tony Prisk <linux@prisktech.co.nz>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/6/20 11:02 AM, Sam Ravnborg wrote:
> Fix kernel-doc comments.
> 
> v2:
>   - Updated subject (Lee)
> 
> v3:
>   - Add space after ':' (Randy)
>   - Fix name of function in comment
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Ferenc Bakonyi <fero@drama.obuda.kando.hu>
> Cc: linux-nvidia@lists.surfsouth.com
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/video/fbdev/hgafb.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/video/fbdev/hgafb.c b/drivers/video/fbdev/hgafb.c
> index a45fcff1461f..8bbac7182ad3 100644
> --- a/drivers/video/fbdev/hgafb.c
> +++ b/drivers/video/fbdev/hgafb.c
> @@ -357,8 +357,8 @@ static int hga_card_detect(void)
>  
>  /**
>   *	hgafb_open - open the framebuffer device
> - *	@info:pointer to fb_info object containing info for current hga board
> - *	@int:open by console system or userland.
> + *	@info: pointer to fb_info object containing info for current hga board
> + *	@init: open by console system or userland.
>   */
>  
>  static int hgafb_open(struct fb_info *info, int init)
> @@ -370,9 +370,9 @@ static int hgafb_open(struct fb_info *info, int init)
>  }
>  
>  /**
> - *	hgafb_open - open the framebuffer device
> - *	@info:pointer to fb_info object containing info for current hga board
> - *	@int:open by console system or userland.
> + *	hgafb_release - open the framebuffer device
> + *	@info: pointer to fb_info object containing info for current hga board
> + *	@init: open by console system or userland.
>   */
>  
>  static int hgafb_release(struct fb_info *info, int init)
> 

LGTM. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
