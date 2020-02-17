Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EE3160E75
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 10:27:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DC66E8DE;
	Mon, 17 Feb 2020 09:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0CB6E8DE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 09:27:56 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id t14so17574010wmi.5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 01:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=W3cuPNWL6G9Mkzazr5aYw69mCYySh4JxTzpizFSnP50=;
 b=E9P//0DIVwrempoYlQvPpQ3JLBfVeQX+Igm9H93gtrvhaRYwHmsK2QZLopBDq5HpE+
 /s8riZMDYh/UK5hZKHwcrYWmawp1zyUPGR7QkVeB7Lfj18xoNoLqFRUNObijflqvu8dK
 4DmxlwRS+PTg5okQaXwvwaXC50DXpUnlx6syc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=W3cuPNWL6G9Mkzazr5aYw69mCYySh4JxTzpizFSnP50=;
 b=fDVSefuz/+G12M6jo2PHmEgcN299IRbtVqDjpki9sfdZUV6R+NdBIXWCpILuEyQ+SY
 qgrVJSHMyJF34+rqJR4ZjAZmFzbmyiUoHHygID5ZUIo3Uxh6aikuxU/f5N+USmdrBgn3
 ustEWYkOAmIRztZq8OYxgGOVjFIgYnzHrDgFhzxDHC79k7qXbbEKZTzilZt2nJfmwxLn
 vRsUiMdjFVopvw+m4OheAixhCJUyY7ojslZcmKHOAdqUOsJCDSUN1zNCbHRUH05AgmcG
 oDT/Lm2fs2fh58fzx69xpHv7Nxy0U+u07EaP0AvIEcygIyqqXxSWv1T+lt2oM+BQV9K4
 lnFA==
X-Gm-Message-State: APjAAAVlpxAHcX3BkoFKupi6nEJOJdBD2/zHAtr0xrL9Kin5WpBieY3r
 3tjrgEEUS0zFpIM6Nu5bVyFutA==
X-Google-Smtp-Source: APXvYqwubPOPLq30URt7q/mmbsEDobFNeewy4T855nPo/3eKy/wiWdgXW1I99+bIl4JyIDmgOWUVgA==
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr19977570wmi.146.1581931674639; 
 Mon, 17 Feb 2020 01:27:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v15sm114015wrf.7.2020.02.17.01.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 01:27:53 -0800 (PST)
Date: Mon, 17 Feb 2020 10:27:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] dma-buf: Fix a typo in Kconfig
Message-ID: <20200217092752.GF2363188@phenom.ffwll.local>
Mail-Followup-To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 sumit.semwal@linaro.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
References: <20200216114708.20583-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200216114708.20583-1-christophe.jaillet@wanadoo.fr>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 16, 2020 at 12:47:08PM +0100, Christophe JAILLET wrote:
> A 'h' ismissing in' syncronization'
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks for your patch.
-Daniel

> ---
>  drivers/dma-buf/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index 0613bb7770f5..e7d820ce0724 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -6,7 +6,7 @@ config SYNC_FILE
>  	default n
>  	select DMA_SHARED_BUFFER
>  	---help---
> -	  The Sync File Framework adds explicit syncronization via
> +	  The Sync File Framework adds explicit synchronization via
>  	  userspace. It enables send/receive 'struct dma_fence' objects to/from
>  	  userspace via Sync File fds for synchronization between drivers via
>  	  userspace components. It has been ported from Android.
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
