Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FA62779A5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 21:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405936EB56;
	Thu, 24 Sep 2020 19:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D5F6EB56
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 19:46:09 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 687FB20073;
 Thu, 24 Sep 2020 21:46:07 +0200 (CEST)
Date: Thu, 24 Sep 2020 21:46:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Qinglang Miao <miaoqinglang@huawei.com>
Subject: Re: [PATCH -next] drm/panel: simplify the return expression of
 td028ttec1_prepare
Message-ID: <20200924194606.GB1223313@ravnborg.org>
References: <20200921131018.91513-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200921131018.91513-1-miaoqinglang@huawei.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=CaYmGojl c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=i0EeH86SAAAA:8 a=t2hpYR1j4ttwukXXcmsA:9
 a=CjuIK1q_8ugA:10
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
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Qinglang

On Mon, Sep 21, 2020 at 09:10:18PM +0800, Qinglang Miao wrote:
> Simplify the return expression.
> 
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>


Thanks, applied to drm-misc-next.

	Sam

> ---
>  drivers/gpu/drm/panel/panel-tpo-td028ttec1.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
> index 037c14fd6..ba0c00d1a 100644
> --- a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
> +++ b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
> @@ -242,13 +242,8 @@ static int td028ttec1_prepare(struct drm_panel *panel)
>  static int td028ttec1_enable(struct drm_panel *panel)
>  {
>  	struct td028ttec1_panel *lcd = to_td028ttec1_device(panel);
> -	int ret;
>  
> -	ret = jbt_ret_write_0(lcd, JBT_REG_DISPLAY_ON, NULL);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	return jbt_ret_write_0(lcd, JBT_REG_DISPLAY_ON, NULL);
>  }
>  
>  static int td028ttec1_disable(struct drm_panel *panel)
> -- 
> 2.23.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
