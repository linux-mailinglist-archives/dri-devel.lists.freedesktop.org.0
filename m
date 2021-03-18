Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEED33FD88
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 04:04:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D3C6E073;
	Thu, 18 Mar 2021 03:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1356 seconds by postgrey-1.36 at gabe;
 Thu, 18 Mar 2021 03:04:03 UTC
Received: from gateway20.websitewelcome.com (gateway20.websitewelcome.com
 [192.185.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175746E073
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 03:04:03 +0000 (UTC)
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
 by gateway20.websitewelcome.com (Postfix) with ESMTP id 2C9B6400D004B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 21:32:08 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id MibFl6EDomJLsMibFltZdz; Wed, 17 Mar 2021 21:41:26 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=077KSEAS2xb5VEhFS9pC9E/z/1ME0eQIQJD6xAHitCY=; b=o+/dtnZL6jjO+1rqjpinf20z/A
 22q7XfWAPSuEA1TpkG3W/NLwY9TOsQzX7xmKXKRlIOWCEi+Qck0nsHlJ8DsuKIVei+GApsp2dctYF
 Cp7ZvTzu7IOt8saAGTB9TgNM/4nYYujpZt30YU9TNCG+S8Z7J98M7mw2/ilFdI8Xg+xqU7bq9S58B
 N5MgVBPWwFPJwXsM113o2KviMw7t2V9Z3fsPUAzcdOkOHUDA8hB4taH0JBfoHipstsntrkS3ZCZ1P
 BXIIMj86XW79raARuPJzXOqhzk94w8vaanrKXPA5nPzBDfs5IECwrxVzziiJZ8mZzNSZBgrpJgO5V
 JTXtFDbg==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:40396
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <gustavo@embeddedor.com>)
 id 1lMibE-00475T-P0; Wed, 17 Mar 2021 21:41:24 -0500
Subject: Re: [PATCH] drivers/video/fbdev:modify 0 to NULL
To: ChunyouTang <tangchunyou@163.com>, gustavoars@kernel.org, sam@ravnborg.org
References: <20210318023329.488-1-tangchunyou@163.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <20f1664e-df4c-d085-cb25-1d05e8a793a3@embeddedor.com>
Date: Wed, 17 Mar 2021 20:41:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210318023329.488-1-tangchunyou@163.com>
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
X-Exim-ID: 1lMibE-00475T-P0
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8])
 [187.162.31.110]:40396
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
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
Cc: linux-fbdev@vger.kernel.org, tangchunyou@yulong.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/17/21 21:33, ChunyouTang wrote:
> From: tangchunyou <tangchunyou@yulong.com>
> 
> modify 0 to NULL,info is a pointer,it should be
> 
> compared with NULL,not 0
> 
> Signed-off-by: tangchunyou <tangchunyou@yulong.com>
> ---
>  drivers/video/fbdev/offb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
> index 4501e84..cd1042f 100644
> --- a/drivers/video/fbdev/offb.c
> +++ b/drivers/video/fbdev/offb.c
> @@ -412,7 +412,7 @@ static void __init offb_init_fb(const char *name,
>  
>  	info = framebuffer_alloc(sizeof(u32) * 16, NULL);
>  
> -	if (info == 0) {
> +	if (info == NULL) {

if (!info) is better.

--
Gustavo

>  		release_mem_region(res_start, res_size);
>  		return;
>  	}
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
