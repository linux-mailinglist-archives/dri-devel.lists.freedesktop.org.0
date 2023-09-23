Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BC27AC50A
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 22:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE0810E092;
	Sat, 23 Sep 2023 20:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta038.useast.a.cloudfilter.net
 (omta038.useast.a.cloudfilter.net [44.202.169.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E84910E092
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 20:21:52 +0000 (UTC)
Received: from eig-obgw-6009a.ext.cloudfilter.net ([10.0.30.184])
 by cmsmtp with ESMTP
 id k7Qfq2tx8WU1ck98RqVFYk; Sat, 23 Sep 2023 20:21:51 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id k98Qq80lXTFO2k98Qqg1ZX; Sat, 23 Sep 2023 20:21:50 +0000
X-Authority-Analysis: v=2.4 cv=A8l/goaG c=1 sm=1 tr=0 ts=650f48de
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
 bh=dMtmtT6tX/J/Z9nN8F6wXmACJvxIhIjSA2EPSc7V54o=; b=nLSy7Yyg8X16vsP4+fNRB4Rotn
 66Cg4GycjlShrC9MRh6WTMvGPinJuZLxjOs9e7FizT69nAYp/OkhR/IhrDiNHjixOGY/4eQKAaoAX
 k5Mo8kidONlYLjZEvPv5x03+/cg8aCmfQvKmVYwJJLElNvPgHwbAr3yxCrtCiOdxlxn92geZB8iJJ
 XBNc4Flajgvmg6YhTs2c+QPVHTvFUWeE0RH4EULSQF2sBJ0kPOkstu9MQClUpd+K2JjCAdzdvLssr
 /wYuucKyHkJ8cnJPRYkXa3e+aPSVpAWxxoGE685mXoLtUsQXWVVXwa5l9DNTpIkhtmnfuc3VkZQ8v
 6sGqmEew==;
Received: from [94.239.20.48] (port=58218 helo=[192.168.1.98])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gustavo@embeddedor.com>) id 1qjy3s-003bcu-2i;
 Sat, 23 Sep 2023 03:32:25 -0500
Message-ID: <f1aa9b5a-6867-6000-8f3c-9a15eb216961@embeddedor.com>
Date: Sat, 23 Sep 2023 10:33:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] video: mmp: Annotate struct mmp_path with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Helge Deller <deller@gmx.de>
References: <20230922175141.work.450-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230922175141.work.450-kees@kernel.org>
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
X-Exim-ID: 1qjy3s-003bcu-2i
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.98]) [94.239.20.48]:58218
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNxXX1a+9zboEpOVxFntKJWDic4C772NDXrGHpgkuD1kKnzwmqqJjcFButOixFj5YxNsU4ZE+uqa6ouGZSfNLyEunAKX0FK5e/GVl8TBydqNgirxLZCj
 aUNQeaP1ZBxGubfaegyxDwrTIqJ/zYmUxkoksqNlhUPow254dX8+mauSq3U7pvSODhJ0vhW/449M4E2ulhu29cll7ok+JhQzX6tc5gHcrlG3Lz3PcMcCLhH9
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
> As found with Coccinelle[1], add __counted_by for struct mmp_path.
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
>   include/video/mmp_disp.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/video/mmp_disp.h b/include/video/mmp_disp.h
> index 77252cb46361..a722dcbf5073 100644
> --- a/include/video/mmp_disp.h
> +++ b/include/video/mmp_disp.h
> @@ -231,7 +231,7 @@ struct mmp_path {
>   
>   	/* layers */
>   	int overlay_num;
> -	struct mmp_overlay overlays[];
> +	struct mmp_overlay overlays[] __counted_by(overlay_num);
>   };
>   
>   extern struct mmp_path *mmp_get_path(const char *name);
