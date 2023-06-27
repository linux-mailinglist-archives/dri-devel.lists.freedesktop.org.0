Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B503A73FFC9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 17:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F0810E304;
	Tue, 27 Jun 2023 15:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6092210E304
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 15:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=OQge3nifXrNPOjpUkyjoaiLSJ4o64jeqktl/JSuxz0U=; b=BPNF9k7N6aO5rO/UVrPXpqzL5Q
 gWF+p3Y5CluA6eTNwIz2jHEsuV3FEksJTVmgCOJXuO+xWDKpZs4GkhH0gDefESDl1VFywYy6Cs+23
 6gehDy1cTa3np8BLG+MCB0uKtPTtpSq6OM2HL04+A9khAfacVpuGrGJ/YqIAvRxFDw7Xg/dR5NQ50
 YRkeK32Pj7XzYvcfBBJkXe/w2gioz8bOn4Wh7FpmuoHdisio/9vzdZGVjPOerKw2ADEJSzcRLO59p
 VLo9I3XsqlO4eo5KT3A9n5JBLBjxT4klDL3m8P5QfK/nii34IzNRHR4yG2I+octcAaMiPmgP+0oiK
 SvDiBuwA==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qEAhB-00DX6t-1L; Tue, 27 Jun 2023 15:33:33 +0000
Message-ID: <afd7bccc-6a3f-6c43-1966-2fb9ff68a5e7@infradead.org>
Date: Tue, 27 Jun 2023 08:33:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] arch/sparc: Add module license and description for fbdev
 helpers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, davem@davemloft.net,
 arnd@arndb.de, linux@roeck-us.net, sam@ravnborg.org, deller@gmx.de
References: <20230627145843.31794-1-tzimmermann@suse.de>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230627145843.31794-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: sparclinux@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/27/23 07:58, Thomas Zimmermann wrote:
> Add MODULE_LICENSE() and MODULE_DESCRIPTION() for fbdev helpers
> on sparc. Fixes the following error:
> 
> ERROR: modpost: missing MODULE_LICENSE() in arch/sparc/video/fbdev.o
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/dri-devel/c525adc9-6623-4660-8718-e0c9311563b8@roeck-us.net/
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 4eec0b3048fc ("arch/sparc: Implement fb_is_primary_device() in source file")
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: sparclinux@vger.kernel.org
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  arch/sparc/video/fbdev.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/sparc/video/fbdev.c b/arch/sparc/video/fbdev.c
> index 25837f128132d..bff66dd1909a4 100644
> --- a/arch/sparc/video/fbdev.c
> +++ b/arch/sparc/video/fbdev.c
> @@ -21,3 +21,6 @@ int fb_is_primary_device(struct fb_info *info)
>  	return 0;
>  }
>  EXPORT_SYMBOL(fb_is_primary_device);
> +
> +MODULE_DESCRIPTION("Sparc fbdev helpers");
> +MODULE_LICENSE("GPL");

-- 
~Randy
