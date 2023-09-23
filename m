Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD72D7AC421
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 19:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB9C10E077;
	Sat, 23 Sep 2023 17:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta38.uswest2.a.cloudfilter.net
 (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D030510E077
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 17:42:09 +0000 (UTC)
Received: from eig-obgw-5009a.ext.cloudfilter.net ([10.0.29.176])
 by cmsmtp with ESMTP
 id k0HCqKYF4QFHRk6dtqwXIC; Sat, 23 Sep 2023 17:42:09 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id k6dsqdexUHkIqk6dsqMwTK; Sat, 23 Sep 2023 17:42:09 +0000
X-Authority-Analysis: v=2.4 cv=WPFs41gR c=1 sm=1 tr=0 ts=650f2371
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=P7XfKmiOJ4/qXqHZrN7ymg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=cm27Pg_UAAAA:8 a=HvF037n1xESchLcPDVoA:9
 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0rkBlmV7dOjQhBHsZ5GTBisbKAaQB5v8qd8FFYm1jjE=; b=gDzaf9mgGEPzjYwWt9k1zjunVm
 kiCe+R15b5ygw6mW8y8DI/nchsHnlOi0xRigLWG9oGd0KFCP8ir2WiRrQn5NboMn0nAM34Nd42LZ6
 x+sLRke2d85WZDZirtFoJwv1l7juJIkSTJ3YDR0sW80cSL6MuhK/mop5lNe/t9qmnq3m+4X3DYT+E
 mtTHzKIq6RwlQKypARoflwQ8shVmU2nFsMiJx9Xnfd/vHjrqhrvJQz6ZK9/hYHei0v1L7xiptgwry
 Zb7r76eQN4oDMZxD1kZo/QcTheXAi9fLif9ydnGNpHnq37lJdVJ7QPbAlYP72cehx1CpJUxRlh9bJ
 o+S6M/6g==;
Received: from [94.239.20.48] (port=52760 helo=[192.168.1.98])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gustavo@embeddedor.com>) id 1qjy3g-003bRP-1r;
 Sat, 23 Sep 2023 03:32:12 -0500
Message-ID: <6dae12b4-125c-a7be-4129-75065f7a5128@embeddedor.com>
Date: Sat, 23 Sep 2023 10:33:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] video: fbdev: mmp: Annotate struct mmphw_ctrl with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Helge Deller <deller@gmx.de>
References: <20230922175137.work.062-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230922175137.work.062-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 94.239.20.48
X-Source-L: No
X-Exim-ID: 1qjy3g-003bRP-1r
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.98]) [94.239.20.48]:52760
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfD4HZBNjtB6rpBkfRWjnOVapAPFJGHZ1tZ+01qBIJ0Xz0anZGPDs+eX1HTr1fOKsTcLxihb40oO4AP6asgLNvgzsYjjdK2nchuzMZFeKYFgZi5DezAqS
 WNjn6S2RnCP50C/YnJ9YUucJNM+5kYhOKQNv+JbtLYwfp5CelHrdnyV2eoqiNo4KkcpClhhPRdCwmFY9eI4V48m7wmDgm3AkVFw8o+FDF3NpW+bkGxOW9CtL
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
Cc: linux-fbdev@vger.kernel.org, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/22/23 11:51, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct mmphw_ctrl.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/video/fbdev/mmp/hw/mmp_ctrl.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/mmp/hw/mmp_ctrl.h b/drivers/video/fbdev/mmp/hw/mmp_ctrl.h
> index 167585a889d3..719b99a9bc77 100644
> --- a/drivers/video/fbdev/mmp/hw/mmp_ctrl.h
> +++ b/drivers/video/fbdev/mmp/hw/mmp_ctrl.h
> @@ -1406,7 +1406,7 @@ struct mmphw_ctrl {
>   
>   	/*pathes*/
>   	int path_num;
> -	struct mmphw_path_plat path_plats[];
> +	struct mmphw_path_plat path_plats[] __counted_by(path_num);
>   };
>   
>   static inline int overlay_is_vid(struct mmp_overlay *overlay)
