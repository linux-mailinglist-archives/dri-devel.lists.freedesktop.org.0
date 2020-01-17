Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C2614115E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 19:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E302A89117;
	Fri, 17 Jan 2020 18:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADBAF89117
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 18:59:36 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id EB1A120026;
 Fri, 17 Jan 2020 19:59:34 +0100 (CET)
Date: Fri, 17 Jan 2020 19:59:33 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/2] video: fbdev: wm8505fb: fix sparse warnings about
 using incorrect types
Message-ID: <20200117185933.GA24812@ravnborg.org>
References: <CGME20200116145444eucas1p1b62a023ad7ea3722193c932761eb8493@eucas1p1.samsung.com>
 <411db705-a098-27e6-8f52-acfea2735738@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <411db705-a098-27e6-8f52-acfea2735738@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=hD80L64hAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=2_M7bPhzGYiQM-AixEoA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 16, 2020 at 03:54:42PM +0100, Bartlomiej Zolnierkiewicz wrote:
> Use ->screen_buffer instead of ->screen_base to fix sparse warnings.
> 
> [ Please see commit 17a7b0b4d974 ("fb.h: Provide alternate screen_base
>   pointer") for details. ]
> 
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/video/fbdev/wm8505fb.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Index: b/drivers/video/fbdev/wm8505fb.c
> ===================================================================
> --- a/drivers/video/fbdev/wm8505fb.c
> +++ b/drivers/video/fbdev/wm8505fb.c
> @@ -339,7 +339,7 @@ static int wm8505fb_probe(struct platfor
>  
>  	fbi->fb.fix.smem_start		= fb_mem_phys;
>  	fbi->fb.fix.smem_len		= fb_mem_len;
> -	fbi->fb.screen_base		= fb_mem_virt;
> +	fbi->fb.screen_buffer		= fb_mem_virt;
>  	fbi->fb.screen_size		= fb_mem_len;
>  
>  	fbi->contrast = 0x10;
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
