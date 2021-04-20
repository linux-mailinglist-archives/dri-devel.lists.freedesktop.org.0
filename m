Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B223660F9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 22:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3DAF6E8CB;
	Tue, 20 Apr 2021 20:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1257 seconds by postgrey-1.36 at gabe;
 Tue, 20 Apr 2021 20:34:22 UTC
Received: from gateway31.websitewelcome.com (gateway31.websitewelcome.com
 [192.185.144.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782DB6E8CB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 20:34:22 +0000 (UTC)
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway31.websitewelcome.com (Postfix) with ESMTP id EB9ADF3140
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 15:13:23 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id YwkNlE4UHw11MYwkNli3Gu; Tue, 20 Apr 2021 15:13:23 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kwn27XPvL7L4MySMkc9jhbsfHOaD1hq6LTYrwrBKc5k=; b=XBR2TAs0kONA6akjKuCET67sS4
 VK1GhBxbFwf0hGWB0SDWujk3fuUfvucOreXyZZo5GJFSFPQPe4aSatHaL+7CtjxT2lQxI+zZTyJZJ
 cqu6zlJDA49x71dUZn2bzG9XJiUjx0kj+EMaTwg7bVmTxcXN8IfhngLGwBOIHo2OBxHYLf+kjZBVO
 hrVjI5lDk80/AgnT/DgWf1IjmddLgTdw3DRVHx+cEL8Ej1IZDEDvfAWISldYsbCyNxrGzLwF5+Tg5
 nnCEY4+flJTo47vZedRu4EkSK3WKwPScVlMXBzp6L0RvTa2RRAEyOVJzQ6ayjLkJdrVv3kT0ZxNqs
 XGWq28yg==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:48978
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <gustavo@embeddedor.com>)
 id 1lYwkK-002lDZ-GL; Tue, 20 Apr 2021 15:13:20 -0500
Subject: Re: [PATCH RESEND][next] drm/nouveau/clk: Fix fall-through warnings
 for Clang
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210305095609.GA141907@embeddedor>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <b42a6c20-e70d-c56a-795a-072ecc772bf2@embeddedor.com>
Date: Tue, 20 Apr 2021 15:13:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210305095609.GA141907@embeddedor>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1lYwkK-002lDZ-GL
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8])
 [187.162.31.110]:48978
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 96
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Friendly ping: who can take this, please?

Thanks
--
Gustavo

On 3/5/21 03:56, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> by explicitly adding a break statement instead of letting the code fall
> through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c
> index 83067763c0ec..e1d31c62f9ec 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c
> @@ -313,6 +313,7 @@ nv50_clk_read(struct nvkm_clk *base, enum nv_clk_src src)
>  		default:
>  			break;
>  		}
> +		break;
>  	default:
>  		break;
>  	}
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
