Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E034A19BC7E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 09:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6C16E9F0;
	Thu,  2 Apr 2020 07:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABF56E9D3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 07:11:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.72,334,1580770800"; d="scan'208";a="443452906"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 09:11:30 +0200
Date: Thu, 2 Apr 2020 09:11:30 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: "John B. Wyatt IV" <jbwyatt4@gmail.com>
Subject: Re: [Outreachy kernel] [PATCH] staging: android: ion: Fix parenthesis
 alignment
In-Reply-To: <20200402012515.429329-1-jbwyatt4@gmail.com>
Message-ID: <alpine.DEB.2.21.2004020910570.3014@hadrien>
References: <20200402012515.429329-1-jbwyatt4@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 Apr 2020 07:17:56 +0000
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
Cc: devel@driverdev.osuosl.org, Todd Kjos <tkjos@android.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 outreachy-kernel@googlegroups.com,
 =?ISO-8859-15?Q?Arve_Hj=F8nnev=E5g?= <arve@android.com>,
 Joel Fernandes <joel@joelfernandes.org>, Laura Abbott <labbott@redhat.com>,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Wed, 1 Apr 2020, John B. Wyatt IV wrote:

> Fix 2 parenthesis alignment issues.

Please try to find a way to describe what you have done that doesn't
involve the word "Fix".  What have you done and why?

julia


>
> Reported by checkpatch.
>
> Signed-off-by: John B. Wyatt IV <jbwyatt4@gmail.com>
> ---
>  drivers/staging/android/ion/ion_page_pool.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/android/ion/ion_page_pool.c b/drivers/staging/android/ion/ion_page_pool.c
> index f85ec5b16b65..0198b886d906 100644
> --- a/drivers/staging/android/ion/ion_page_pool.c
> +++ b/drivers/staging/android/ion/ion_page_pool.c
> @@ -37,7 +37,7 @@ static void ion_page_pool_add(struct ion_page_pool *pool, struct page *page)
>  	}
>
>  	mod_node_page_state(page_pgdat(page), NR_KERNEL_MISC_RECLAIMABLE,
> -							1 << pool->order);
> +			    1 << pool->order);
>  	mutex_unlock(&pool->mutex);
>  }
>
> @@ -57,7 +57,7 @@ static struct page *ion_page_pool_remove(struct ion_page_pool *pool, bool high)
>
>  	list_del(&page->lru);
>  	mod_node_page_state(page_pgdat(page), NR_KERNEL_MISC_RECLAIMABLE,
> -							-(1 << pool->order));
> +			    -(1 << pool->order));
>  	return page;
>  }
>
> --
> 2.25.1
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/20200402012515.429329-1-jbwyatt4%40gmail.com.
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
