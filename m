Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 657642F9C0D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 10:54:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9791E6E11F;
	Mon, 18 Jan 2021 09:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6649F6E11F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 09:54:51 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id i63so12994074wma.4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 01:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=cFqP/8RJv1Qo9WGknss0Qphbrf47nZAWivkAs8FjOj0=;
 b=f7h0sur3QGmAxGDFgywlU7UvH91myHS7u2TDv/WcQX9e+5GdxTPxbM/nCeABQPBsQv
 DgUhKpfLf9xvXARxdipr0vZ8+NoVofM7hxrXFdNCt0VjzYBciRqunH8xxkF17H1WKqNA
 aVd0wxudIAG/j/vuiypXoMdGSxdUEvqEnWFzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=cFqP/8RJv1Qo9WGknss0Qphbrf47nZAWivkAs8FjOj0=;
 b=sX51pA8icYPvBG3rU1+Y1w8p1u0nkSt9sqG2OE2oXyNcaSMWuQLYuvYRhvL12LuztA
 djBZWyoxzLOjvvdL3Uv8bYfUEQe3BA6KLmhoGDlnUWdmnf5LZ86Un7/kdHGZbLkqEYug
 rmYgPoW8FmnB31DA0Su5SYVMECGCC8PzrjbluvT26N/RPDlAj/sUKsPa3PwP37XKFamk
 V3PctW+G6WzbnXFMA0T+af6ikwke5pVKugFQStICoNcNlUmHxSh8YiEm5mW6l7dawtqM
 rJoS1tAPq/k6AoiRVEE3j7T3XeoX9V/beDDZroNpLbik3LrCYp4ChHXJIfh955qMOWPV
 Sn1g==
X-Gm-Message-State: AOAM5325VelMD6PZuqCgvbWio4W74slGfK6fRl6n6JItf/ieVEwpxl4F
 QXK3lnbJqLyNKasLbnBnxLUQag==
X-Google-Smtp-Source: ABdhPJxHj4DMhuWe1Sq4Q8jMTzzNRKQBOelzaSYvh2hz8Lsj3032M4rxfMUJp49dKZulqO+yY3Pglw==
X-Received: by 2002:a1c:7c06:: with SMTP id x6mr2150339wmc.67.1610963690170;
 Mon, 18 Jan 2021 01:54:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 17sm23730019wmk.48.2021.01.18.01.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 01:54:49 -0800 (PST)
Date: Mon, 18 Jan 2021 10:54:47 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Yue Zou <zouyue3@huawei.com>
Subject: Re: [PATCH] vgaarb: Remove unneeded semicolons
Message-ID: <YAVa54YVVH37ZnXf@phenom.ffwll.local>
Mail-Followup-To: Yue Zou <zouyue3@huawei.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210118010356.214491-1-zouyue3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210118010356.214491-1-zouyue3@huawei.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 01:03:55AM +0000, Yue Zou wrote:
> Remove superfluous semicolons after function definitions.
> 
> Signed-off-by: Yue Zou <zouyue3@huawei.com>

Thanks for your patch, applied.
-Daniel

> ---
>  include/linux/vgaarb.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
> index 977caf96c8d2..fc6dfeba04a5 100644
> --- a/include/linux/vgaarb.h
> +++ b/include/linux/vgaarb.h
> @@ -121,9 +121,9 @@ extern struct pci_dev *vga_default_device(void);
>  extern void vga_set_default_device(struct pci_dev *pdev);
>  extern int vga_remove_vgacon(struct pci_dev *pdev);
>  #else
> -static inline struct pci_dev *vga_default_device(void) { return NULL; };
> -static inline void vga_set_default_device(struct pci_dev *pdev) { };
> -static inline int vga_remove_vgacon(struct pci_dev *pdev) { return 0; };
> +static inline struct pci_dev *vga_default_device(void) { return NULL; }
> +static inline void vga_set_default_device(struct pci_dev *pdev) { }
> +static inline int vga_remove_vgacon(struct pci_dev *pdev) { return 0; }
>  #endif
>  
>  /*
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
