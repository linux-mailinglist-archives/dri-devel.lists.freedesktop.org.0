Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B662C7C40
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 02:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246396E40F;
	Mon, 30 Nov 2020 01:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860BB6E1E6
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Nov 2020 16:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:Subject:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=K/3XCS09PtgAMlsxXhCLZ8FMnd8vje/idDmjW6xJGbc=; b=ZsXSw1WnAYWmbL/jPtiLwenAb6
 FhGtAWQWB9FYC4J3Th+7447OeVOXPqCixc4rUHhBQaQA6rANkxiWxFJC7ddetQGXSIRFOMbPcAdRt
 1O+cZzW6WPSEjPMQRl4t5j5MdOB//fKNnp60G2XoAkJduc+W4lGEDD9Js95T6RyLRBA+RtzljL6YY
 /QIvZrAvkw4CP8tZ9CJrjhIiPvTVwcMzGwWUO61QHjbIC7vgA494GD8CbEXX5gTvsSI090zv+errG
 /FFrLKluwmRXEm/VS9hkPHObw9J2VpL9TSsO7ZNIOFhQxIqo6uIgInQoIDJL2iw/2gOOoai78ArjC
 FtMWB12g==;
Received: from [2601:1c0:6280:3f0::cc1f]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjPHY-0001br-7L; Sun, 29 Nov 2020 16:10:38 +0000
From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 16/28] video: fbdev: hgafb: Fix kernel-doc warnings
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-17-sam@ravnborg.org>
Message-ID: <9be40b75-698f-a46f-ba66-2ec3d0443ad2@infradead.org>
Date: Sun, 29 Nov 2020 08:10:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128224114.1033617-17-sam@ravnborg.org>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 30 Nov 2020 01:02:59 +0000
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
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-nvidia@lists.surfsouth.com, Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Thomas Zimemrmann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Gustavo Silva <gustavoars@kernel.org>,
 Peter Rosin <peda@axentia.se>, George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam-

On 11/28/20 2:41 PM, Sam Ravnborg wrote:
> Fix kernel-doc comments.
> 
> v2:
>   - Updated subject (Lee)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Ferenc Bakonyi <fero@drama.obuda.kando.hu>
> Cc: linux-nvidia@lists.surfsouth.com
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/video/fbdev/hgafb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/hgafb.c b/drivers/video/fbdev/hgafb.c
> index a45fcff1461f..69af72937844 100644
> --- a/drivers/video/fbdev/hgafb.c
> +++ b/drivers/video/fbdev/hgafb.c
> @@ -358,7 +358,7 @@ static int hga_card_detect(void)
>  /**
>   *	hgafb_open - open the framebuffer device
>   *	@info:pointer to fb_info object containing info for current hga board
> - *	@int:open by console system or userland.
> + *	@init:open by console system or userland.

Please add a space after the ':' in 2 lines above.

>   */
>  
>  static int hgafb_open(struct fb_info *info, int init)
> @@ -372,7 +372,7 @@ static int hgafb_open(struct fb_info *info, int init)
>  /**
>   *	hgafb_open - open the framebuffer device
>   *	@info:pointer to fb_info object containing info for current hga board
> - *	@int:open by console system or userland.
> + *	@init:open by console system or userland.

Same here (2 lines).

>   */
>  
>  static int hgafb_release(struct fb_info *info, int init)
> 

thanks.
-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
