Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5704F1CBF91
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 11:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C536E2F8;
	Sat,  9 May 2020 09:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5426E2DD
 for <dri-devel@lists.freedesktop.org>; Sat,  9 May 2020 06:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
 Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=mcO8+1EDxZvAX8ZD4A53xevhvEfo/u+dOx6XCDnH4Do=; b=tQrFS6W8yF0rzk4LRpqpeK8Xt9
 VUn8R+0YHMMYINrzX9E//hI5rJV1rTmbkoyq+L+KZvguwZOatxNJ8Q4vzFyM8IIavIqBCnZEPj86f
 3uEujsbtM2S902GBpY7lfcd4rkBpA0CQ3J5iWwsnHsElWnEyr762pT4s5mJbhXuRy7S7bA3SBp8Nl
 PcQZhTxz/BhF1OL45Y+9clGzRy8/848PKGM8LoU2Sj5LuzcxWoOd14famKG9+ZiPuEx3b+EZ713z4
 jXLDEebJrQ1WDuzERid/GfpC1+J8nSX8Xb87h0OsEedjNiRIan4vVCVnXGkRpnR5aEPH8WlJ0Um87
 sJ6SeQkw==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXJ6Z-0005sH-CZ; Sat, 09 May 2020 06:36:59 +0000
Subject: Re: [PATCH] drm/panel: visionox-rm69299: Add module license
To: Jason Yan <yanaijie@huawei.com>, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
 harigovi@codeaurora.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200509063017.2000-1-yanaijie@huawei.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5d692435-1d55-ade9-fe22-00ffc1cdca64@infradead.org>
Date: Fri, 8 May 2020 23:36:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200509063017.2000-1-yanaijie@huawei.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 09 May 2020 09:04:57 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/8/20 11:30 PM, Jason Yan wrote:
> Fix the following build warning:
> 
> WARNING: modpost: missing MODULE_LICENSE() in drivers/gpu/drm/panel/panel-visionox-rm69299.o
> see include/linux/module.h for more information
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---
>  drivers/gpu/drm/panel/panel-visionox-rm69299.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> index 25fe8b0bb040..ec279ffdbd94 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -300,3 +300,4 @@ static struct mipi_dsi_driver visionox_rm69299_driver = {
>  module_mipi_dsi_driver(visionox_rm69299_driver);
>  
>  MODULE_DESCRIPTION("Visionox RM69299 DSI Panel Driver");
> +MODULE_LICENSE("GPL");
> 

I sent a patch for this yesterday.


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
