Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6A71B8747
	for <lists+dri-devel@lfdr.de>; Sat, 25 Apr 2020 17:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D4F6E406;
	Sat, 25 Apr 2020 15:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3886E6E406
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Apr 2020 15:11:11 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id E7A392007A;
 Sat, 25 Apr 2020 17:11:08 +0200 (CEST)
Date: Sat, 25 Apr 2020 17:11:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH] video/fbdev/riva: Remove dead code
Message-ID: <20200425151107.GH32235@ravnborg.org>
References: <1587407244-32574-1-git-send-email-jrdr.linux@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587407244-32574-1-git-send-email-jrdr.linux@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8
 a=O4SDoXPlVXmpIDEQGbEA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 b.zolnierkie@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Souptick
On Mon, Apr 20, 2020 at 11:57:24PM +0530, Souptick Joarder wrote:
> These are dead code since 3.15. These can be removed forever if no
> plan to use it further.
> 
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>

Thanks. Patch applied to drm-misc-next.
It will appear in mianline kernel in next merge window.

	Sam


> ---
>  drivers/video/fbdev/riva/riva_hw.c | 18 ------------------
>  1 file changed, 18 deletions(-)
> 
> diff --git a/drivers/video/fbdev/riva/riva_hw.c b/drivers/video/fbdev/riva/riva_hw.c
> index 0601c13..08c9ee4 100644
> --- a/drivers/video/fbdev/riva/riva_hw.c
> +++ b/drivers/video/fbdev/riva/riva_hw.c
> @@ -1343,24 +1343,6 @@ static char nv3_get_param(nv3_fifo_info *res_info, nv3_sim_state * state, nv3_ar
>  /*
>   * Load fixed function state and pre-calculated/stored state.
>   */
> -#if 0
> -#define LOAD_FIXED_STATE(tbl,dev)                                       \
> -    for (i = 0; i < sizeof(tbl##Table##dev)/8; i++)                 \
> -        chip->dev[tbl##Table##dev[i][0]] = tbl##Table##dev[i][1]
> -#define LOAD_FIXED_STATE_8BPP(tbl,dev)                                  \
> -    for (i = 0; i < sizeof(tbl##Table##dev##_8BPP)/8; i++)            \
> -        chip->dev[tbl##Table##dev##_8BPP[i][0]] = tbl##Table##dev##_8BPP[i][1]
> -#define LOAD_FIXED_STATE_15BPP(tbl,dev)                                 \
> -    for (i = 0; i < sizeof(tbl##Table##dev##_15BPP)/8; i++)           \
> -        chip->dev[tbl##Table##dev##_15BPP[i][0]] = tbl##Table##dev##_15BPP[i][1]
> -#define LOAD_FIXED_STATE_16BPP(tbl,dev)                                 \
> -    for (i = 0; i < sizeof(tbl##Table##dev##_16BPP)/8; i++)           \
> -        chip->dev[tbl##Table##dev##_16BPP[i][0]] = tbl##Table##dev##_16BPP[i][1]
> -#define LOAD_FIXED_STATE_32BPP(tbl,dev)                                 \
> -    for (i = 0; i < sizeof(tbl##Table##dev##_32BPP)/8; i++)           \
> -        chip->dev[tbl##Table##dev##_32BPP[i][0]] = tbl##Table##dev##_32BPP[i][1]
> -#endif
> -
>  #define LOAD_FIXED_STATE(tbl,dev)                                       \
>      for (i = 0; i < sizeof(tbl##Table##dev)/8; i++)                 \
>          NV_WR32(&chip->dev[tbl##Table##dev[i][0]], 0, tbl##Table##dev[i][1])
> -- 
> 1.9.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
