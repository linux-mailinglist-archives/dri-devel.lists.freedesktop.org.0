Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3A489E93E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 06:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D384C11312B;
	Wed, 10 Apr 2024 04:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="eDUMyuaU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CE411312B
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 04:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=8C+0CGPOaTrvPlLGeH5cZbzRihud44TyrcpJRxDnZNY=; b=eDUMyuaUPQlEYoqqBbVcd0mNq3
 WD7AN98JJQlkqSSqKRNgVSlPVTgSbUU88ZuqzVKVnWuSluqAbwNbRWd7/rT1OXXTta1mpPYZh208c
 syqZZZTpXdNyz3Ff1l1ZtA9Y9tXHfsq08Dbo49JxDS9DGhb0bc0USjmd0WzUOiCkMLhKxqz2kSvLr
 j0LDikEvbOOUNe0Du4ciGkLjM6iOro5uIsfqi7E6DowK9fFehrMgq/gX2Dq1GlM5O09LJ5MWGTFpS
 w+OwdeaQTb67WQjbjoa7tsK/rX0b29Cx556UdfDbBAubFQhER57NFYkiUIZ4M7hvnY2rlqpfYF+Th
 dGMem+Lg==;
Received: from [50.53.2.121] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1ruPyh-000000055W4-1nEZ; Wed, 10 Apr 2024 04:54:31 +0000
Message-ID: <c5436115-0b26-4369-8d71-154cc3c95659@infradead.org>
Date: Tue, 9 Apr 2024 21:54:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/sh7760fb: allow modular build
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20240210053938.30558-1-rdunlap@infradead.org>
 <4d01127a9130ce46b7c1d447811c89c1d1503199.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <4d01127a9130ce46b7c1d447811c89c1d1503199.camel@physik.fu-berlin.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Will someone be merging this patch?

thanks.

On 2/10/24 1:31 AM, John Paul Adrian Glaubitz wrote:
> On Fri, 2024-02-09 at 21:39 -0800, Randy Dunlap wrote:
>> There is no reason to prohibit sh7760fb from being built as a
>> loadable module as suggested by Geert, so change the config symbol
>> from bool to tristate to allow that and change the FB dependency as
>> needed.
>>
>> Fixes: f75f71b2c418 ("fbdev/sh7760fb: Depend on FB=y")
>> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Javier Martinez Canillas <javierm@redhat.com>
>> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Helge Deller <deller@gmx.de>
>> Cc: linux-fbdev@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> ---
>>  drivers/video/fbdev/Kconfig |    4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff -- a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
>> --- a/drivers/video/fbdev/Kconfig
>> +++ b/drivers/video/fbdev/Kconfig
>> @@ -1645,8 +1645,8 @@ config FB_COBALT
>>  	select FB_IOMEM_HELPERS
>>  
>>  config FB_SH7760
>> -	bool "SH7760/SH7763/SH7720/SH7721 LCDC support"
>> -	depends on FB=y && (CPU_SUBTYPE_SH7760 || CPU_SUBTYPE_SH7763 \
>> +	tristate "SH7760/SH7763/SH7720/SH7721 LCDC support"
>> +	depends on FB && (CPU_SUBTYPE_SH7760 || CPU_SUBTYPE_SH7763 \
>>  		|| CPU_SUBTYPE_SH7720 || CPU_SUBTYPE_SH7721)
>>  	select FB_IOMEM_HELPERS
>>  	help
> 
> Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> 
> Adrian
> 

-- 
#Randy
