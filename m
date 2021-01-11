Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A502F0FB0
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 11:07:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5592B6E07D;
	Mon, 11 Jan 2021 10:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56266E07D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 10:07:51 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 190so13338825wmz.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 02:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=uWzaRMbmt2By8y7NAjed3CzVmUPuMLhbIN6Z2HhRiPk=;
 b=OAWDr412aSMYDUxWwDp6pKiepwKUJnkIBsf/3qFDM7Go3GGi3j9O+EUop4t7xMxLJL
 KFPI1PCaURTTX/1vBW6Mcq+PEkFAkG9JwoM6YCRHgxPviy6x8ZdUNAHNK/dYF35eJffN
 D2q/BhbwjMjMesCNIKWjqpeUdS/RY9rBvev+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=uWzaRMbmt2By8y7NAjed3CzVmUPuMLhbIN6Z2HhRiPk=;
 b=Q+7lLT16jnFBdCaOnygjnVNDjmhKl6My7bM1NJLMDkFair2rXtIJJet2OwjYXPlYXL
 k0j50deiOL2A+QosLnJFCB7xnD6lgAZPMz/06pKfMdE1zLFKT+VMW2QN9dmqjColArYk
 o350zncoGwFwMprnaZJHRn0Q1MwcsDpxIbsOWp06YNTGtQyPdDGURo1TXUF0dgsEiHe1
 YIZCn2VdhlAvVDNbJojYBbPFjTMT3gpiM+6zJkcS/v0RwBLR7JkiZ5g8ggYpaqN+/yAX
 Rg/WFRqBbM0yigttCVy8l2APYiXnq4dsJeahhczdXem62qo5xldC9iTVA1AxQH+o1dxo
 p8Pg==
X-Gm-Message-State: AOAM531FuDW30ZGJK17LOHFGJyDi8Ck9uxEO0ZGf5mrRBp8q08puj4XF
 181i+pPOy4leq36WeoyUuxaGbQ==
X-Google-Smtp-Source: ABdhPJzfBNXH+bjslOlOA/6EO2izRzsf8AeNYCi7LatDfnaocu5Yh8op6AQw8R/KvstC7WsYcIoQyg==
X-Received: by 2002:a1c:6144:: with SMTP id v65mr13815610wmb.125.1610359670546; 
 Mon, 11 Jan 2021 02:07:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i16sm23321093wrx.89.2021.01.11.02.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 02:07:49 -0800 (PST)
Date: Mon, 11 Jan 2021 11:07:47 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
Subject: Re: [PATCH V4 3/3] drm/vkms: Add information about module options
Message-ID: <X/wjc/Hhv9PlnvgM@phenom.ffwll.local>
Mail-Followup-To: Sumera Priyadarsini <sylphrenadin@gmail.com>,
 melissa.srw@gmail.com, rodrigosiqueiramelo@gmail.com,
 hamohammed.sa@gmail.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <cover.1610200411.git.sylphrenadin@gmail.com>
 <68b521bc789640a5f6437bcaa5d5960799be59c9.1610200411.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <68b521bc789640a5f6437bcaa5d5960799be59c9.1610200411.git.sylphrenadin@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 10, 2021 at 07:35:41PM +0530, Sumera Priyadarsini wrote:
> Update vkms documentation to contain usage of `modinfo`
> command and steps to load vkms with module options enabled.
> 
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> ---
>  Documentation/gpu/vkms.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 9e030c74a82e..45fe02f643a8 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -35,6 +35,16 @@ Now, to load the driver, use::
>  On running the lsmod command now, the VKMS driver will appear listed.
>  You can also observe the driver being loaded in the dmesg logs.
>  

Maybe start out with "vkms has optional features to simulate different
kinds of hardware, which are exposed as module options." Just to make it
clear why you'd want to look at module options and set them.

Otherwise lgtm, with that change on the entire series:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +You can use the `modinfo` command to see module options for vkms::
> +
> +  modinfo vkms
> +
> +Module options are helpful when testing, and enabling modules
> +can be done while loading vkms. For example, to load vkms with cursor enabled,
> +use::
> +
> +  sudo modprobe vkms enable_cursor=1
> +
>  To disable the driver, use ::
>  
>    sudo modprobe -r vkms
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
