Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A109CCD3968
	for <lists+dri-devel@lfdr.de>; Sun, 21 Dec 2025 02:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4266010E198;
	Sun, 21 Dec 2025 01:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058B810E198
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 01:24:37 +0000 (UTC)
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-65b31ec93e7so5058356eaf.3
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 17:24:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766280276; x=1766885076;
 h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DlaivU6khbq+H4gGSGhiP4ZojYz6+EckF6yCmLt2N4M=;
 b=jd7E3cYMUCN4tDLrHJDr+qlKLbNrVbEPgF9u4TPfmLcg5KVyJedhYMY1Lgn136GcOu
 MxJO77ca9W1PFPa+4DabzIv/yxxipASo1FGAmh1+7ipbB6QyMCvg3FkiaJtiM367zIGh
 7PGX9kWdrnlL4l1gR51ssn7zPGkkwTXPg2V7FcEAo6WBEvybcP90bhouc8JblxxCJSp7
 jDxD0g5l3JEVarvKXBwA5dvsb0wGHwoEj7CCyycGavXQt1Y7ryjQYWbnHyCg6WoC8Oc9
 fit294+erdLnay++dIW7lh4KKfHVcsxi83+i1iYS0FSeQfETTyHCkFSh+QMu8xO63MEN
 9anQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtJ0GlQe+IHo8fK4ojT5YABzebT3dZv5YDI+YbHiKYNJZLJpT5p8G9ZF42PgMNhZpmqVUBQGW1CAM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykkwFyRLjgcS7yafLVWfZpD3cU8Lh0dYmHVOIBcxuHboLcsyE5
 GiiV8KcxtgymH8uZiL9ic/FLEb93wRnvjA1o2DqPpJR/whq+3WD5lObqdIWyZE/Pk+iYdwcLlqK
 i3jth2wMkVFhQ4nWkNpkFSsVYQBwq1a1pGweXK+lRsxCmCY49W6JhODokzD0=
X-Google-Smtp-Source: AGHT+IH+3U0qxpXqSt2znP5azbSRtxeGiVcScp7xuFDXGkI7KaBiwhRhA56N66pgM47IIb6IgFNwUuSwgjmLVQsyft8Gz5mZYCuO
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2223:b0:659:9a49:8f2d with SMTP id
 006d021491bc7-65d0eae1f9fmr3113949eaf.62.1766280276329; Sat, 20 Dec 2025
 17:24:36 -0800 (PST)
Date: Sat, 20 Dec 2025 17:24:36 -0800
In-Reply-To: <20251220192210.399423-1-szymonwilczek@gmx.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69474c54.a70a0220.25eec0.006a.GAE@google.com>
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
> -- 
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller-bugs/20251220192210.399423-1-szymonwilczek%40gmx.com.

I see the command but can't find the corresponding bug.
The email is sent to  syzbot+HASH@syzkaller.appspotmail.com address
but the HASH does not correspond to any known bug.
Please double check the address.

