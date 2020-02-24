Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E7C16A1EC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:21:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4F76E22B;
	Mon, 24 Feb 2020 09:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A7C6E053
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 03:39:50 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id x185so4635594pfc.5
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2020 19:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pm6Cv3S5H0C25dDQ/meb190wtQtToeJ+qVX2sM7b/vQ=;
 b=m2Uke2AoNl6cfhq6pb/5axLLlXF0Zv3XmG9O+matyX/TgoygLaMgzzOgDGkgsgTxnQ
 Umxa1/QZAzGXaidVpC+fl9U2QJ0CJOAvBHDzFUn/Zqm5fHmCgTiqoIISRB/k0NV5QOST
 czBmkhGqpvkgGdVmlkJkrr7IbZhuGAC4rYNdj120HqNI+E/ta1yQmlvF6KZyR2JTvKSu
 VIRyGkttYX05Q5Yi0u3nAdFighsj5QctjtWt0qZBKx/fS78rU1cT0haLiQp88P7Xq0nu
 x1ttbbf2AhLEM7GjXdwOadakMeyxfxHTzLsrMVoFiG9nHz+5VZKUAlogeUOrsp4Fs8Q9
 XrJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pm6Cv3S5H0C25dDQ/meb190wtQtToeJ+qVX2sM7b/vQ=;
 b=pCOpJOjtdPYd36B7+dBtjRrdeKePPaFw/Aoyjsg0vcNWxXdEUo8zQvQwatEjGwRToc
 xFptMpMAenqM9yxw2iH/mdBC9nwLXvidLuz17p0ycY1JT8Tn676uCOqc5LgcTNOncQh8
 xWv/xbzHuv7Gd9H5fcV1UUBZgx7tJGYsoaLSYeXy96HNoYG+1tdWN9vIKIJRGmUky0oU
 d9zNi2ekI4TCHwgh2y3+SMRLlZqi9Wg9pGXNWJjzEzfebmIH/8r+7XHRWXsCXwUhmaep
 qcseC5Frt10qltIPhvf7zi/GZwiqIM7sKnXJPpvx1jvv262g3GXiqUJCluvige9dpp5b
 9Avw==
X-Gm-Message-State: APjAAAU+8aa0kyZ418wyKS7YgVZIQtbM1alPJg+0ZzJkSa0h7KqFqU8X
 NtWtvQV+JIeQr989nZBteUXbHg==
X-Google-Smtp-Source: APXvYqzc2p8QvebEpaDzCO6Mrop/L/saGJ7o6R7zbV2ytCI8l57+nTlirD3I1M2aFJGXaVNfW6Zl6A==
X-Received: by 2002:a62:25c6:: with SMTP id
 l189mr49936947pfl.136.1582515589543; 
 Sun, 23 Feb 2020 19:39:49 -0800 (PST)
Received: from google.com ([2401:fa00:fc:1:28b:9f23:d296:c845])
 by smtp.gmail.com with ESMTPSA id h3sm10345179pfo.102.2020.02.23.19.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2020 19:39:48 -0800 (PST)
Date: Mon, 24 Feb 2020 11:39:41 +0800
From: Martin Liu <liumartin@google.com>
To: sumit.semwal@linaro.org, minchan@kernel.org, surenb@google.com,
 wvw@google.com
Subject: Re: [PATCH] dma-buf: support 32bit DMA_BUF_SET_NAME ioctl
Message-ID: <20200224033941.GB211610@google.com>
References: <20200114134101.159194-1-liumartin@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200114134101.159194-1-liumartin@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:20:26 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, jenhaochen@google.com, liumartin@google.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 14, 2020 at 09:41:01PM +0800, Martin Liu wrote:

CC more MLs for winder review.

> This commit adds SET_NAME ioctl coversion to
> support 32 bit ioctl.
> 
> Signed-off-by: Martin Liu <liumartin@google.com>
> ---
>  drivers/dma-buf/dma-buf.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index ce41cd9b758a..a73048b34843 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -25,6 +25,7 @@
>  #include <linux/mm.h>
>  #include <linux/mount.h>
>  #include <linux/pseudo_fs.h>
> +#include <linux/compat.h>
>  
>  #include <uapi/linux/dma-buf.h>
>  #include <uapi/linux/magic.h>
> @@ -409,13 +410,32 @@ static void dma_buf_show_fdinfo(struct seq_file *m, struct file *file)
>  	dma_resv_unlock(dmabuf->resv);
>  }
>  
> +#ifdef CONFIG_COMPAT
> +static long dma_buf_ioctl_compat(struct file *file, unsigned int cmd,
> +				 unsigned long arg)
> +{
> +	switch (_IOC_NR(cmd)) {
> +	case _IOC_NR(DMA_BUF_SET_NAME):
> +		/* Fix up pointer size*/
> +		if (_IOC_SIZE(cmd) == sizeof(compat_uptr_t)) {
> +			cmd &= ~IOCSIZE_MASK;
> +			cmd |= sizeof(void *) << IOCSIZE_SHIFT;
> +		}
> +		break;
> +	}
> +	return dma_buf_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
> +}
> +#endif
> +
>  static const struct file_operations dma_buf_fops = {
>  	.release	= dma_buf_release,
>  	.mmap		= dma_buf_mmap_internal,
>  	.llseek		= dma_buf_llseek,
>  	.poll		= dma_buf_poll,
>  	.unlocked_ioctl	= dma_buf_ioctl,
> -	.compat_ioctl	= compat_ptr_ioctl,
> +#ifdef CONFIG_COMPAT
> +	.compat_ioctl	= dma_buf_ioctl_compat,
> +#endif
>  	.show_fdinfo	= dma_buf_show_fdinfo,
>  };
>  
> -- 
> 2.25.0.rc1.283.g88dfdc4193-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
