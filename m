Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5BC26480A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 16:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676C26E93B;
	Thu, 10 Sep 2020 14:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E396E93B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 14:33:39 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CCAAC20855;
 Thu, 10 Sep 2020 14:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599748419;
 bh=0G7G667jJ2wLzt+yDf+HSMCCNH8aghZdGO9b0EnNJWQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EVD0MtwMK40ue8Yva5Nf+q97hPxufi58lFUJDEhyVkbP6r4lc6NxL1zt763eBBiIa
 nJ5VFw7zVHrodSqZ78a1z0wj654tpJKFLtUVD8dFAzP9chKwA5xE+AhRKzUnGCpQFn
 JB0NOTCHtcWRP7KhWCeAK26YMA+ctnpR7XP/NJ0c=
Date: Thu, 10 Sep 2020 09:39:00 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: [PATCH] video: fbdev: fsl-diu-fb: remove unneeded variable 'res'
Message-ID: <20200910143900.GA4162@embeddedor>
References: <20200910140558.1191423-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910140558.1191423-1-yanaijie@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-fbdev@vger.kernel.org, timur@kernel.org, b.zolnierkie@samsung.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 10, 2020 at 10:05:58PM +0800, Jason Yan wrote:
> Eliminate the following coccicheck warning:
> 
> drivers/video/fbdev/fsl-diu-fb.c:1428:5-8: Unneeded variable: "res".
> Return "0" on line 1450
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Acked-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>  drivers/video/fbdev/fsl-diu-fb.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/fsl-diu-fb.c b/drivers/video/fbdev/fsl-diu-fb.c
> index a547c21c7e92..e332017c6af6 100644
> --- a/drivers/video/fbdev/fsl-diu-fb.c
> +++ b/drivers/video/fbdev/fsl-diu-fb.c
> @@ -1425,7 +1425,6 @@ static int fsl_diu_open(struct fb_info *info, int user)
>  static int fsl_diu_release(struct fb_info *info, int user)
>  {
>  	struct mfb_info *mfbi = info->par;
> -	int res = 0;
>  
>  	spin_lock(&diu_lock);
>  	mfbi->count--;
> @@ -1447,7 +1446,7 @@ static int fsl_diu_release(struct fb_info *info, int user)
>  	}
>  
>  	spin_unlock(&diu_lock);
> -	return res;
> +	return 0;
>  }
>  
>  static const struct fb_ops fsl_diu_ops = {
> -- 
> 2.25.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
