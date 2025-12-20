Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E08CD3610
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 20:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3565410E0B1;
	Sat, 20 Dec 2025 19:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5061410E0B1
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 19:22:40 +0000 (UTC)
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-657486eb435so3948100eaf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 11:22:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766258559; x=1766863359;
 h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wXBuMKsbM+KwTrBICDHBdfzXtgBQf2h5Z/6bZ4D2vbk=;
 b=Xiux35j5eKJ3mWBR9T+vRSDyYCjYw2FZb/TFgMyCRAv5EpRgxLZ2wE1HsSqTU0wSp4
 Nzv31y7hjGpkB8hnS88unj8CtPq6wEYuFYnai1wYx018abgJ6pTct7Kr9kd4bvsbYmy7
 3IGSFFKhrFoxo2TVNQHIdJoITVFadaGHGPB+6ep//8FxMuEtdyFZWyIvM8SUgSWfFRKb
 RneBid+eByTbXBS6JuKKELd5AYtMvrM+5MZbtfXSM7qpuqOzsgf1ZyDNM53Hs0zNPWWg
 MREsMzMGWbakVO02sagxY2eOL7I9aBiHSyyj3auAWEtXca00gI+7vIJZVDCgqrO+y6eG
 Z1Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV31A4X+TnYraZxJ6E4rVQZ7F5VKcZxH8TWggFUiaKw+Jln9rLbl9wHmehGzohgxsk4GcqdhZ4J2EU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSJ3tHAzvWHNIWOXqlFoS/CjWZpDJbQi45ThD3vikTYRnQGadc
 iLTdbzqNp2uy5dQS3U8PqfZKncFlkDlzjM0ls1sJIh91etOTgDBQh1k/3L0STjD4mldYUVyllJY
 S8CGQpn/SyCEIPpVL9xaECuvNTTeloNLBNkpQ9DcRmoMg7sbsNwIqiQIWUoU=
X-Google-Smtp-Source: AGHT+IEFvvW4sFfICXsBjWL7HLiwQzByWYxuBpxiryOzRSkiF+Rs7HQiqXIBG29DxZUQGipiZQleuih4ce9em2r6jbf6FZrMgkh0
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2291:b0:659:9a49:8f25 with SMTP id
 006d021491bc7-65d0ea9c905mr2793790eaf.54.1766258559494; Sat, 20 Dec 2025
 11:22:39 -0800 (PST)
Date: Sat, 20 Dec 2025 11:22:39 -0800
In-Reply-To: <20251220192210.399423-1-szymonwilczek@gmx.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6946f77f.050a0220.1b4e0c.0023.GAE@google.com>
Subject: Re: [PATCH] dma-buf: fix WARNING in dma_buf_vmap
From: syzbot <syzbot@syzkaller.appspotmail.com>
To: szymonwilczek@gmx.com
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
 syzkaller-bugs@googlegroups.com, szymonwilczek@gmx.com
Content-Type: text/plain; charset="UTF-8"
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

> When a driver's vmap callback returns an error (e.g. -ENOMEM), dma_buf_vmap()
> triggers a WARN_ON_ONCE(). This is incorrect as vmap operations can legitimately
> fail due to resource exhaustion or other transient conditions, as documented.
>
> Fix this by removing the WARN_ON_ONCE(). The error code is already correctly
> propagated to the caller.
>
> Reported-by: syzbot+cd944c467e4d4bc24cf6@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug\?extid\=4317d7108e14e5d56308
> Signed-off-by: Szymon Wilczek <szymonwilczek@gmx.com>
> ---
>  drivers/dma-buf/dma-buf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index edaa9e4ee4ae..14b55f67ee1c 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1525,7 +1525,7 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
>  	BUG_ON(iosys_map_is_set(&dmabuf->vmap_ptr));
>  
>  	ret = dmabuf->ops->vmap(dmabuf, &ptr);
> -	if (WARN_ON_ONCE(ret))
> +	if (ret)
>  		return ret;
>  
>  	dmabuf->vmap_ptr = ptr;
> -- 
> 2.52.0
>

I see the command but can't find the corresponding bug.
The email is sent to  syzbot+HASH@syzkaller.appspotmail.com address
but the HASH does not correspond to any known bug.
Please double check the address.

