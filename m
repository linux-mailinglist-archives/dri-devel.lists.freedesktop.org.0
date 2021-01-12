Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 541612F2C61
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 11:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101B389AB3;
	Tue, 12 Jan 2021 10:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3400789AB3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 10:15:01 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id m4so498330wrx.9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 02:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WY0WW5EHKFupkTXG0tAM8IVZfwJ+Uxuf/TRpje8+pTA=;
 b=uI2ebsQMDG30pspMoXDv8UlypbDCL4LjY5BPJlr2UNXHq0psmlBpsKKpama2nheNWC
 sbl199nWsvpUhIIe17kDORY49WL216kYBxT4OIxza8SHaPpBwHF/OgfaU+qqtoaWYj1B
 TkpuIGpCK4NZGBIzzLewXvHeFVI1jd03yYR2MbzOtxzqBRkahc7dRNXToRRRsv8MmJvU
 WgkC07qsXKhyFhZhXMWGOHp6TQncHI/zDnFX/RajIa277O6ZNPjyS1zMNv6IJnTKYPYx
 RXql/q4II0Xa17gyWbGTPG4IR9fhNQ+yGi6HlPNs6LOXTOeyucPhUQlP/y8MO/9p5Qsk
 hGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WY0WW5EHKFupkTXG0tAM8IVZfwJ+Uxuf/TRpje8+pTA=;
 b=Mtbbzs30ljNaOKuJPzPYDOYMixJkt9SHGO90RJo4YKV9nYIs5sxGSjUcAVzAbdX+oL
 agVtXabVF7BXXpxVkOwJJlJoocc24cIqwSvRBy94kMTz6nSlsPcl/iVaRh98RHCNF4ug
 FRLdejZRNJ3VDHZ3Rnv5CqEP/oRcBV0zYHJptBm5O3vl6TSG5cBp0EUqITsaGo0jZf9h
 JKH8A6xgmqUmoG9DFZId76lSYtl+7Wn0CQhimA8dJE7rqorynac/VUtIaSwQZEGMeDVE
 4IyEbnD/d/Rg9GMSfqNVzDF92rEJERUr9n7P+xkZrtV488g/KeTeBQofb5vmIi4cYhTq
 dMrw==
X-Gm-Message-State: AOAM532NjuMHttBnTsTN1XEX2l/RClXnqRFuRyskAqDXDlhGVbvEJPQL
 E5KuhGvOUVQhennaA0tt7ZGWdMVN5QmjaA==
X-Google-Smtp-Source: ABdhPJxzYxlwW6GSgjCMLE0QzwIIjeODZyGvsTynrBph+9hvBHHMu5CXjHkA2+Z+uMYQBoAaCe1dNw==
X-Received: by 2002:adf:dcc5:: with SMTP id x5mr3421302wrm.167.1610446499920; 
 Tue, 12 Jan 2021 02:14:59 -0800 (PST)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id g5sm4426125wro.60.2021.01.12.02.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 02:14:59 -0800 (PST)
Date: Tue, 12 Jan 2021 07:14:53 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
Subject: Re: [PATCH V5 3/3] drm/vkms: Add information about module options
Message-ID: <20210112101453.3ofinorxbe4ylvob@smtp.gmail.com>
References: <cover.1610391685.git.sylphrenadin@gmail.com>
 <4fbc6459377c1dcbe8e6648718453d5693f6451c.1610391685.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4fbc6459377c1dcbe8e6648718453d5693f6451c.1610391685.git.sylphrenadin@gmail.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/12, Sumera Priyadarsini wrote:
> Update vkms documentation to contain usage of `modinfo`
> command and steps to load vkms with module options enabled.
> 
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> ---
>  Documentation/gpu/vkms.rst | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 9e030c74a82e..2c9b376da5ca 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -35,6 +35,18 @@ Now, to load the driver, use::
>  On running the lsmod command now, the VKMS driver will appear listed.
>  You can also observe the driver being loaded in the dmesg logs.
>  
> +The VKMS driver has optional features to simulate different kinds of hardware,
> +which are exposed as module options. You can use the `modinfo` command
> +to see the module options for vkms::
> +
> +  modinfo vkms
> +
> +Module options are helpful when testing, and enabling modules
> +can be done while loading vkms. For example, to load vkms with cursor enabled,
> +use::
> +
> +  sudo modprobe vkms enable_cursor=1
> +

Hi Sumera,

Thanks for documenting.

You forgot to bring Daniel's ack; however, as I also reviewed and lgtm,

Reviewed-by: Melissa Wen <melissa.srw@gmail.com>

>  To disable the driver, use ::
>  
>    sudo modprobe -r vkms
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
