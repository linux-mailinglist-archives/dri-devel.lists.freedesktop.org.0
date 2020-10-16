Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED945290D62
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 23:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B4A6EEA2;
	Fri, 16 Oct 2020 21:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62AD89EBB
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 21:44:23 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id B77118058D;
 Fri, 16 Oct 2020 23:44:21 +0200 (CEST)
Date: Fri, 16 Oct 2020 23:44:20 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Qinglang Miao <miaoqinglang@huawei.com>
Subject: Re: [PATCH -next] fbdev: nvidia: use for_each_child_of_node() macro
Message-ID: <20201016214420.GC1962741@ravnborg.org>
References: <20200916062123.190636-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916062123.190636-1-miaoqinglang@huawei.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=i0EeH86SAAAA:8 a=e5mUnYsNAAAA:8
 a=tj93dU6F_355QJNGr64A:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Qinglang Miao

On Wed, Sep 16, 2020 at 02:21:23PM +0800, Qinglang Miao wrote:
> Use for_each_child_of_node() macro instead of open coding it.
> 
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

Applied to drm-misc-next.

	Sam

> ---
>  drivers/video/fbdev/nvidia/nv_of.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/nvidia/nv_of.c b/drivers/video/fbdev/nvidia/nv_of.c
> index 5f3e5179c..d20b8779b 100644
> --- a/drivers/video/fbdev/nvidia/nv_of.c
> +++ b/drivers/video/fbdev/nvidia/nv_of.c
> @@ -42,8 +42,7 @@ int nvidia_probe_of_connector(struct fb_info *info, int conn, u8 **out_edid)
>  		const char *pname;
>  		int len;
>  
> -		for (dp = NULL;
> -		     (dp = of_get_next_child(parent, dp)) != NULL;) {
> +		for_each_child_of_node(parent, dp) {
>  			pname = of_get_property(dp, "name", NULL);
>  			if (!pname)
>  				continue;
> -- 
> 2.23.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
