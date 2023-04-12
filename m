Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B726DEBA9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 08:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F21E10E6E0;
	Wed, 12 Apr 2023 06:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B85B10E6E0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 06:18:04 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PxCF401xjz4xFj;
 Wed, 12 Apr 2023 16:17:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1681280282;
 bh=mVus6VBYhH8GmWv60JhlJfNhVtxbImSRmEm6BDRrW3s=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=lTZEAUAJ2QZsc9UPHGoexeIDhivQg0OZP2tQ8N178oguDiIOjU/GS5yjDEkHA0ZQY
 UoSdL/mLxTXV/wa3HPEVjblwcxsdx2c+OnuyDK5Tv1Pbg7hiKGkpXXQYiHyY9ZXKUK
 6CSwY02DKtu+cGQJMahEUbmjJakfBQLvnLNWdj1LScutIwzO/9mPiHZFRCutiHgFFy
 LDNwBaVtxl/OmcZoIc9q0YGGvsTAR4vPp6o9KxvHWYHacDs55AZq5ZD42D7HmgmLSM
 12TeMwxecBFtXBTtmtuIhlm5OkckoQGJYZdQPchk2E7CbMKkKzVuJ/odBCPWTELN7l
 5ijFDMn/S4fVA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de,
 daniel.vetter@ffwll.ch, deller@gmx.de, javierm@redhat.com,
 gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 15/19] arch/powerpc: Implement <asm/fb.h> with
 generic helpers
In-Reply-To: <20230406143019.6709-16-tzimmermann@suse.de>
References: <20230406143019.6709-1-tzimmermann@suse.de>
 <20230406143019.6709-16-tzimmermann@suse.de>
Date: Wed, 12 Apr 2023 16:17:59 +1000
Message-ID: <87r0spipyg.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, x86@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Nicholas Piggin <npiggin@gmail.com>, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:
> Replace the architecture's fb_is_primary_device() with the generic
> one from <asm-generic/fb.h>. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/fb.h | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

Looks fine.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/arch/powerpc/include/asm/fb.h b/arch/powerpc/include/asm/fb.h
> index 6541ab77c5b9..5f1a2e5f7654 100644
> --- a/arch/powerpc/include/asm/fb.h
> +++ b/arch/powerpc/include/asm/fb.h
> @@ -2,8 +2,8 @@
>  #ifndef _ASM_FB_H_
>  #define _ASM_FB_H_
>  
> -#include <linux/fb.h>
>  #include <linux/fs.h>
> +
>  #include <asm/page.h>
>  
>  static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
> @@ -13,10 +13,8 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
>  						 vma->vm_end - vma->vm_start,
>  						 vma->vm_page_prot);
>  }
> +#define fb_pgprotect fb_pgprotect
>  
> -static inline int fb_is_primary_device(struct fb_info *info)
> -{
> -	return 0;
> -}
> +#include <asm-generic/fb.h>
>  
>  #endif /* _ASM_FB_H_ */
> -- 
> 2.40.0
